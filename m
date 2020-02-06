Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA019154ADA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 19:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgBFSOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 13:14:14 -0500
Received: from mga02.intel.com ([134.134.136.20]:13114 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727358AbgBFSON (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Feb 2020 13:14:13 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 10:14:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; 
   d="scan'208";a="236056737"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2020 10:14:04 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1izlfC-0003Li-1G; Thu, 06 Feb 2020 20:14:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
Date:   Thu,  6 Feb 2020 20:13:58 +0200
Message-Id: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

User may ask device helper tool, for example, udev, to create a specific
symbolic link to a device node. GPIO chip character device node is not
exceptional. However, libgpiod in the commit d9b1c1f14c6b
("core: harden gpiod_chip_open()") went way too far in the hardening device
node check.

Relax that hardening for symbolic link to fix the regression.

Reproducer:

  % gpioinfo /dev/gpiochip5
  gpiochip5 - 16 lines:
      line   0:  "MUX33_DIR" "uart1-rx-oe" output active-high [used]
      ...

  % ln -sf /dev/gpiochip5 /dev/MyGPIO_5

  % gpioinfo /dev/MyGPIO_5
  gpioinfo: looking up chip /dev/MyGPIO_5: Inappropriate ioctl for device

Link: https://stackoverflow.com/questions/60057494/gpio-issue-with-sym-link
Fixes: d9b1c1f14c6b ("core: harden gpiod_chip_open()")
Cc: Bartosz Golaszewski <bartekgola@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/core.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index 8352e18..32476ee 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -8,6 +8,7 @@
 /* Low-level, core library code. */
 
 #include <errno.h>
+#include <limits.h>
 #include <fcntl.h>
 #include <gpiod.h>
 #include <linux/gpio.h>
@@ -75,7 +76,7 @@ struct gpiod_chip {
 
 static bool is_gpiochip_cdev(const char *path)
 {
-	char *name, *pathcpy, *sysfsp, sysfsdev[16], devstr[16];
+	char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
 	struct stat statbuf;
 	bool ret = false;
 	int rv, fd;
@@ -85,6 +86,21 @@ static bool is_gpiochip_cdev(const char *path)
 	if (rv)
 		goto out;
 
+	/*
+	 * Is it a symbolic link?
+	 * We have to resolve symbolic link before checking the rest.
+	 */
+	if (S_ISLNK(statbuf.st_mode))
+		realname = realpath(path, NULL);
+	else
+		realname = strdup(path);
+	if (realname == NULL)
+		goto out;
+
+	rv = stat(realname, &statbuf);
+	if (rv)
+		goto out_free_realname;
+
 	/* Is it a character device? */
 	if (!S_ISCHR(statbuf.st_mode)) {
 		/*
@@ -94,20 +110,16 @@ static bool is_gpiochip_cdev(const char *path)
 		 * libgpiod from before the introduction of this routine.
 		 */
 		errno = ENOTTY;
-		goto out;
+		goto out_free_realname;
 	}
 
 	/* Get the basename. */
-	pathcpy = strdup(path);
-	if (!pathcpy)
-		goto out;
-
-	name = basename(pathcpy);
+	name = basename(realname);
 
 	/* Do we have a corresponding sysfs attribute? */
 	rv = asprintf(&sysfsp, "/sys/bus/gpio/devices/%s/dev", name);
 	if (rv < 0)
-		goto out_free_pathcpy;
+		goto out_free_realname;
 
 	if (access(sysfsp, R_OK) != 0) {
 		/*
@@ -149,8 +161,8 @@ static bool is_gpiochip_cdev(const char *path)
 
 out_free_sysfsp:
 	free(sysfsp);
-out_free_pathcpy:
-	free(pathcpy);
+out_free_realname:
+	free(realname);
 out:
 	return ret;
 }
-- 
2.25.0

