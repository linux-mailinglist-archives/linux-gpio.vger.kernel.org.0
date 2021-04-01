Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B763511B8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 11:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhDAJQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 05:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbhDAJPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 05:15:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1259C0613E6
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 02:15:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id g25so705682wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsUKo9zHoQeofis83+8n/EIrk7DfZGZJdI1e8FHUQgE=;
        b=2I94ZtUforN7bMqOPFESsr8Lesqv7oQS2JB3Nbp+Wy6VJ6FGvDHeQV+EIWZp17aLen
         EaXrEukDq/u2aTlR1O4Mw1ruRVkLo5eSStalf8bxq1UKzhbx2z5vtqZ84d3z4Ukz0BIg
         UPVLgtYPtXddSlS9Y14sPmButk2b5VkWB32z1CaOop1sDGSjHJVaXbsCnodd7TrkRYit
         ZopNvRlhD3upMzHttQrKf/SCIVO7HI0qYKVrGcH9EUxf7F5DbE9RfptkANDEXggu2EIO
         UsqzXqUnStqPoFyNMKIVDDaJYxfUSnxA4Ec4KK8iBInnJhW3nY1Xmi+kxxx3kZWKDQod
         WGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsUKo9zHoQeofis83+8n/EIrk7DfZGZJdI1e8FHUQgE=;
        b=QYw+9eV/gibuHyLJf/+mmn3pOD+KW/yawxuKDxBFiQAEJ+BoepsOIuc+E/rcQLsSTA
         n1YnvH7ruNPuzSGIW3FxO0kMlXgr7uJGWkjyoAy8tA2Yv7AOgoscWgq9bG/O7Ve5r8Ml
         5QkcvS08UElEbICpUNFZIijf2tDDqA80eG/cfDEtATrYqo5iwLDgFabxrS4HB3n+/ZTD
         sROJVvYUWRYPnp2qV85TZdgH0/H5WJB+4PYxuI4F9jes3Esc+w09+xKZzev32u3QbQZZ
         j9CT2xEuX0/4uW1r/7tRT13mzUJX8qSoNxXgheGLyyXYt65fQDNCvvtRkO9xX0+/9xCs
         xZgQ==
X-Gm-Message-State: AOAM533szfI049vtlj277b8c326DHYOiMky7+pikDVqIjCFk6bwa7TwB
        6AzLl+5/uvDj1sNuT/EdkoE+zA==
X-Google-Smtp-Source: ABdhPJyVNTZ1LPv02hI4f14T8jJx3GhcBzd2x6Gwu2rcFhIiZknrGLUt0xASYyvZld86oAliziszVQ==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr7161064wmh.144.1617268548463;
        Thu, 01 Apr 2021 02:15:48 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id j6sm7029074wmq.16.2021.04.01.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:15:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH] core: relax gpiod_is_gpiochip_device() even more
Date:   Thu,  1 Apr 2021 11:15:46 +0200
Message-Id: <20210401091546.5509-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently libgpiod requires that the GPIO chip character device be named
'gpiochip%u' in devfs. However it's a perfectly valid use-case to have
the device file renamed by udev (or equivalent) to anything else.

Modify gpiod_is_gpiochip_device() to check the major and minor device
numbers first and then ensure that the device in question is associated
with the GPIO subsystem. No longer check the name.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 lib/core.c | 41 ++++++++---------------------------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index c1fb8ec..32c4238 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -182,11 +182,10 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 
 GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 {
-	char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
+	char *realname, *sysfsp, devpath[64];
 	struct stat statbuf;
 	bool ret = false;
-	int rv, fd;
-	ssize_t rd;
+	int rv;
 
 	rv = lstat(path, &statbuf);
 	if (rv)
@@ -217,15 +216,15 @@ GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 		goto out_free_realname;
 	}
 
-	/* Get the basename. */
-	name = basename(realname);
+	/* Is the device associated with the GPIO subsystem? */
+	snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
+		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
 
-	/* Do we have a corresponding sysfs attribute? */
-	rv = asprintf(&sysfsp, "/sys/bus/gpio/devices/%s/dev", name);
-	if (rv < 0)
+	sysfsp = realpath(devpath, NULL);
+	if (!sysfsp)
 		goto out_free_realname;
 
-	if (access(sysfsp, R_OK) != 0) {
+	if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
 		/*
 		 * This is a character device but not the one we're after.
 		 * Before the introduction of this function, we'd fail with
@@ -237,30 +236,6 @@ GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 		goto out_free_sysfsp;
 	}
 
-	/*
-	 * Make sure the major and minor numbers of the character device
-	 * correspond to the ones in the dev attribute in sysfs.
-	 */
-	snprintf(devstr, sizeof(devstr), "%u:%u",
-		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
-
-	fd = open(sysfsp, O_RDONLY);
-	if (fd < 0)
-		goto out_free_sysfsp;
-
-	memset(sysfsdev, 0, sizeof(sysfsdev));
-	rd = read(fd, sysfsdev, sizeof(sysfsdev) - 1);
-	close(fd);
-	if (rd < 0)
-		goto out_free_sysfsp;
-
-	rd--; /* Ignore trailing newline. */
-	if ((size_t)rd != strlen(devstr) ||
-	    strncmp(sysfsdev, devstr, rd) != 0) {
-		errno = ENODEV;
-		goto out_free_sysfsp;
-	}
-
 	ret = true;
 
 out_free_sysfsp:
-- 
2.30.1

