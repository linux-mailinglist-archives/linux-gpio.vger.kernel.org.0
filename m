Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DF13322D8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 11:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCIKTw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 05:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhCIKTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 05:19:21 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAD3C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 02:19:20 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so2656178wmj.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqqC6SQUEQuZG42S5a7XSjHw70jA4gnyRLBohP9llLw=;
        b=x5YvnC5iXjPAJohXYBEbSIy0HZPmiFbayH6tch3XI7Q7smCjaVsjooGV4juSSQj6o+
         oTdbOtYduT7A0+ns9ly5xJK+NWzOlfPsLqM9yhnEE1blgGvuivq+9PAExi80XnU/W5Ic
         gQnbvs/a4VUkJqK+vjCUfI1yZYnZ3B9k1aXhCLWXZ19IxAkFFiqSdpc5F9XX+lpHnJSM
         ZEbPSn8Mxy5FWNdhhxfvTVltd5pTEAXPAXmNNGFeOh0acb+wvXRlaoODima/leRxSCGP
         6Ms4WmayIIW1KQgPpOS8NY00bBEXJ/htHQTsRwmh7QbH+RuvT/UNfLRayvoeBNG3u6lO
         OAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqqC6SQUEQuZG42S5a7XSjHw70jA4gnyRLBohP9llLw=;
        b=VmjVxVqfr+bQlKxs4xhZVIFqfyPpAds2Upb/kiGfIOSY+jMN6c968yus8UwYWCv5a0
         0HF1uVyMQovKVBqcgwq9rM+9B/u30Ax+DSj1c42IbY53laL8Se+sjyhB9plwxo4TsPm1
         bAZvD+phb1XtXo5dB9utDV2iad8CYVHJsM3mPHbrNfx3rJwAklux9jPcBBMD/UgOa+rZ
         UZeSQUiE0Fi4tVUUGNLsthMAI8t5488FdfdHnv+70H95g8ZdSnM0VHgT3lMY1HIkiPng
         5OqD0jOYTqxazP1VoVXPxJyPHalgxSW21N6oztc/s3XNjY7mjLKIT5GNa+6ZxAaAKvPG
         x89w==
X-Gm-Message-State: AOAM533RpKy84XtHj8wCRXvXqRJan083WIxhTn4Hw8ILt2Mg9bSgQyot
        NCEVpleluj/Lou/OLI/T7qUIdQ==
X-Google-Smtp-Source: ABdhPJwSH3cocfW376KwxeOMrBcrrTXnAKNZGAM8NtboawDvWfvpZNbnFh+KAfNXoBJzlgN44sHv6A==
X-Received: by 2002:a7b:c050:: with SMTP id u16mr3204641wmc.90.1615285159475;
        Tue, 09 Mar 2021 02:19:19 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id y16sm22981951wrh.3.2021.03.09.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 02:19:19 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, john.stultz@linaro.org,
        amit.pundir@linaro.org, bjorn.andersson@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] gpio: wcd934x: Fix shift-out-of-bounds error
Date:   Tue,  9 Mar 2021 10:19:08 +0000
Message-Id: <20210309101908.27688-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
which is not right, and this was caught by below usban check

UBSAN: shift-out-of-bounds in /workspace/dev/linux/drivers/gpio/gpio-wcd934x.c:34:14
qcom-q6v5-mss 4080000.remoteproc: failed to acquire pdc reset
remoteproc remoteproc2: releasing 4080000.remoteproc
shift exponent 4294967295 is too large for 64-bit type 'long unsigned int'
CPU: 6 PID: 155 Comm: kworker/6:2 Not tainted 5.12.0-rc1-00045-g508b7280ec3d-dirty #1396
Hardware name: Thundercomm Dragonboard 845c (DT)

Call trace:
 dump_backtrace+0x0/0x1c0
 show_stack+0x18/0x68
 dump_stack+0xd8/0x134
 ubsan_epilogue+0x10/0x58
 __ubsan_handle_shift_out_of_bounds+0xf8/0x168
 wcd_gpio_get_direction+0xc8/0xd8
 gpiochip_add_data_with_key+0x4ac/0xe78
 devm_gpiochip_add_data_with_key+0x30/0x90
 wcd_gpio_probe+0xc8/0x118
 platform_probe+0x6c/0x118
 really_probe+0x24c/0x418
 driver_probe_device+0x68/0xf0
 __device_attach_driver+0xb4/0x110

Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/gpio/gpio-wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 1cbce5990855..97e6caedf1f3 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -7,7 +7,7 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
 
-#define WCD_PIN_MASK(p) BIT(p - 1)
+#define WCD_PIN_MASK(p) BIT(p)
 #define WCD_REG_DIR_CTL_OFFSET 0x42
 #define WCD_REG_VAL_CTL_OFFSET 0x43
 #define WCD934X_NPINS		5
-- 
2.21.0

