Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB12314156F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 02:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgARBaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 20:30:35 -0500
Received: from omr2.mail.isx.net.nz ([111.65.230.131]:55792 "EHLO
        omr2.mail.isx.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgARBaf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 20:30:35 -0500
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Jan 2020 20:30:34 EST
Received: from [10.55.1.24] (unknown [203.109.234.80])
        (Authenticated sender: chris@nisbet.kiwi.nz)
        by omr2.mail.isx.net.nz (Postfix) with ESMTPA id 56F4C9372C1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 14:20:39 +1300 (NZDT)
To:     linux-gpio@vger.kernel.org
From:   "Nisbet, Chris" <chris@nisbet.kiwi.nz>
Subject: [libgpiod] [PATCH] iter: remove unnecessary indirection in free_dirs
Message-ID: <92120a07-6945-1be9-15de-9e9a461c45bc@nisbet.kiwi.nz>
Date:   Sat, 18 Jan 2020 14:20:38 +1300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is not necessary to pass the address of the 'dirs' variable to
dirs_free(), so this commit removes the unnecessary indirection.

Signed-off-by: Chris Nisbet <chris@nisbet.kiwi.nz>
---
  lib/iter.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/iter.c b/lib/iter.c
index a4d883a..bfd2852 100644
--- a/lib/iter.c
+++ b/lib/iter.c
@@ -28,13 +28,13 @@ static int dir_filter(const struct dirent *dir)
      return !strncmp(dir->d_name, "gpiochip", 8);
  }

-static void free_dirs(struct dirent ***dirs, unsigned int num_dirs)
+static void free_dirs(struct dirent **dirs, unsigned int num_dirs)
  {
      unsigned int i;

      for (i = 0; i < num_dirs; i++)
-        free((*dirs)[i]);
-    free(*dirs);
+        free(dirs[i]);
+    free(dirs);
  }

  struct gpiod_chip_iter *gpiod_chip_iter_new(void)
@@ -69,7 +69,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
              goto err_close_chips;
      }

-    free_dirs(&dirs, num_chips);
+    free_dirs(dirs, num_chips);

      return iter;

@@ -85,7 +85,7 @@ err_free_iter:
      free(iter);

  err_free_dirs:
-    free_dirs(&dirs, num_chips);
+    free_dirs(dirs, num_chips);

      return NULL;
  }
-- 
2.7.4

Please consider this small patch. There should be no functional change.

When I first noticed this I wondered if I was missing something obvious 
that required the extra indirection, but I'm pretty convinced there 
isn't any good reason. I initially wondered if the intention might have 
been to set the caller's variable to NULL once the memory it pointed to 
was freed, but I hadn't noticed this technique anywhere else in the library.

Regards

Chris Nisbet

