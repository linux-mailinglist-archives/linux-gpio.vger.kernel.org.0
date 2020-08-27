Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F5C25468F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgH0ONm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgH0OLf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:11:35 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DC6C061232;
        Thu, 27 Aug 2020 07:01:20 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m34so3412704pgl.11;
        Thu, 27 Aug 2020 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=LwOPTj1pvyDECYEM6u9LoslIwXMkOHZ1sinF/z63Rf6JDi+QBGcEESSy6Wj2gqBMGH
         0DvIzZphlwReOYxnq/2QvJH0SdqJEZOL9y5Q/zV7NmzPHhueGz7+ye+HfVh/ZzqAz2ed
         Dkiysw8psY6+J+hgspfw2/syJu6YK0+QOdtgu7WiAQAIKl9LHA6dwCYHiyfJm5nrbpuv
         qFHcq1RfwzihK4mAP5ix5ffrRoOBDzT1DEKPyUoPpsW7Psqsj8ikCq4lXhcquvAH59IQ
         AuE6dB4cxP6DyEmYf0+dKLct/nIGM0HmYiiyU/I7QYcJtqqXYVMzFe2l307Ok6P+9Pt2
         TmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcaJJxPUWfTCsa1mpxbpca/AYe7cJ1n1R+MIiQxItQI=;
        b=IQDvAs0fkFitHJG23WUSg+bKwP2YxMz5wfGOyRsbp2CE0hteUvncYKwdK8E4rRYrFg
         PK3oLguDzSbkY1wH+BC8arz6nUPj9qJDB0/JwQT4n84cTSsan7Gnb1NfFWdzYna+wvQD
         fVx3D5eIHOiDqXqoCf9kR02C5B9OweP6j4RnFHY9lEAXZNAWKWLn2bxurGNlnrudXPEJ
         KUbHs29ncJMS+8H5pb0uKcXdmZI75n+iH8zh372nJyb3VB18PF68j9sX8eYsu66MbwvE
         VgqsMtdRoczI1PjzB5VDruGmJQaHglfudu3VnY2nIKUFZ2fwvZuevAjgnM2LPAvbylfA
         GE4g==
X-Gm-Message-State: AOAM531/J2btQBSj4DwuWHS92dAAg4Ar+zjtM3DOJeVAQOy9MhOrFZW8
        1RtzKD2jsl9AxU+yLLHTO1EIvsdoVxo=
X-Google-Smtp-Source: ABdhPJxuUw3jHiEDWX+rPzbU1AF7NsH09kaKdhlDQ+HfPvrUeu0mrKynAUYZHEIR3PwkAzngBB3Hhw==
X-Received: by 2002:a17:902:d697:: with SMTP id v23mr16530841ply.106.1598536879941;
        Thu, 27 Aug 2020 07:01:19 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:01:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v5 02/20] gpiolib: cdev: replace strncpy with strscpy
Date:   Thu, 27 Aug 2020 22:00:02 +0800
Message-Id: <20200827140020.159627-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace usage of strncpy with strscpy to remove -Wstringop-truncation
warnings.

The structs being populated are zeroed, to prevent stack leakage as
they are returned to userspace, so strscpy performs the equivalent
function without the warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The memset in gpio_desc_to_lineinfo(), in conjunction with the strscpy,
is necessary as strncpy zero pads the remainder of the destination.
It also guarantees that the info cannot leak kernel stack to userspace.
This is useful here, but is even more important for the v2 info, that
this function is changed to generate in a subsequent patch, as that
struct contains padding and attribute arrays that also need to be
initialised.

 drivers/gpio/gpiolib-cdev.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e95e3eab9867..8b012879fe3f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	memset(info, 0, sizeof(*info));
 	info->line_offset = gpio_chip_hwgpio(desc);
 	/*
 	 * This function takes a mutex so we must check this before taking
@@ -765,19 +766,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	if (desc->name) {
-		strncpy(info->name, desc->name, sizeof(info->name));
-		info->name[sizeof(info->name) - 1] = '\0';
-	} else {
-		info->name[0] = '\0';
-	}
+	if (desc->name)
+		strscpy(info->name, desc->name, sizeof(info->name));
 
-	if (desc->label) {
-		strncpy(info->consumer, desc->label, sizeof(info->consumer));
-		info->consumer[sizeof(info->consumer) - 1] = '\0';
-	} else {
-		info->consumer[0] = '\0';
-	}
+	if (desc->label)
+		strscpy(info->consumer, desc->label, sizeof(info->consumer));
 
 	/*
 	 * Userspace only need to know that the kernel is using this GPIO so
@@ -841,12 +834,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		memset(&chipinfo, 0, sizeof(chipinfo));
 
-		strncpy(chipinfo.name, dev_name(&gdev->dev),
+		strscpy(chipinfo.name, dev_name(&gdev->dev),
 			sizeof(chipinfo.name));
-		chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
-		strncpy(chipinfo.label, gdev->label,
+		strscpy(chipinfo.label, gdev->label,
 			sizeof(chipinfo.label));
-		chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
 		chipinfo.lines = gdev->ngpio;
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
-- 
2.28.0

