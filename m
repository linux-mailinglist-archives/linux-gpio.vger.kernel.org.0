Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776AF3AD876
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 09:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhFSHiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Jun 2021 03:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhFSHiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Jun 2021 03:38:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C19AC061574;
        Sat, 19 Jun 2021 00:35:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f2so13276628wri.11;
        Sat, 19 Jun 2021 00:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1UV+eCGR6xhxc4h+iLn1/NGTjBqvr9FXOOIW7R6KwA=;
        b=j1Zm2V0Eo34JM6rNERbEPhTuS6cwuFWq7eEQRgpUgOkQmmDqNAhOiqxXGGooSnucEF
         yY9me4h6y/2EAdNvhG3DS+L/DESdr3otyoHnozZIKn28XF4fuPmW27TzxOK00O4grNyb
         AoGJ1OopdRupSixXE0lKmlSl9YGOGsdrgpJVOErSP3bBJ1iWDzgTJT8x92x3a7p6f+0d
         zfhh3vGLyEruYpyRFiPziletDfEyuUsMZ0WxbnKEkoAW6RprQVjxz3moSXNAGpMWRvFJ
         PRHMoLWxUwRE0e7bvYy8Ef2dX9LVH4QC1Hyr/nt6SHHmPHFIgWexej9WKQAG8rtJ+XY2
         OJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1UV+eCGR6xhxc4h+iLn1/NGTjBqvr9FXOOIW7R6KwA=;
        b=R7eOsft5879SZ3lx5Ay/QwFbJCvIXI4sGteRK/mVNdtaOswM87kRsIZciJleuDWRTa
         yu5cVtOm30Gt1I9uNZajEacA6TQDm6GzuV6z4t1vbyolNAAvtyhz2VfiaAEBBfHAK+hG
         RivpOQM//Wj2kSCK3Q9eOKtVI2/A2MJd+KjGVWko5dtXYqZrtvf+peLc2c6al7cTGS2C
         kqKNw51ebEJ9LL4AeF2mMypsbYuPOQI/IczivWT4amAOc/GcHn5osw/hkzliaicaWuaS
         h4meRe5YJtWq+cjEzk4SQ0GE+yRSe6rixBgRsCDkfItfmXPMn2cipYFqWWa1P5PKdLYc
         xXBw==
X-Gm-Message-State: AOAM531DUM92w/kGtIlU+u1IFBu8vdsWh6FfUVBpABS70qZzBd/QHSXT
        FB8E6yJxC00L59kMwt74nA2TrC8qQ5w=
X-Google-Smtp-Source: ABdhPJwn/JAdv/hQSrl/altaR0JHVsAVa7QmQkkHTnMJn+/1itbz5FlVWU5YaIHDJlSkMD2i8Xpjtg==
X-Received: by 2002:a5d:4383:: with SMTP id i3mr3388056wrq.255.1624088153742;
        Sat, 19 Jun 2021 00:35:53 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k2sm10628278wrw.93.2021.06.19.00.35.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Jun 2021 00:35:53 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, matthias.bgg@gmail.com,
        linus.walleij@linaro.org, git@johnthomson.fastmail.com.au,
        linux-kernel@vger.kernel.org, neil@brown.name,
        opensource@vdorst.com, hofrat@osadl.org
Subject: [PATCH] gpio: mt7621: support gpio-line-names property
Date:   Sat, 19 Jun 2021 09:35:51 +0200
Message-Id: <20210619073551.13703-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default handling of the gpio-line-names property by the
gpiolib-of implementation does not work with the multiple
gpiochip banks per device structure used by the gpio-mt7621
driver.

This commit adds driver level support for the device tree
property so that GPIO lines can be assigned friendly names.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi,

This driver has three gpiochips with 32 gpios each. Core implmentation
got gpio's repeated along each gpio chip if chip.names is not assigned.
To avoid this behaviour driver will set this names as empty or
with desired friendly line names. Consider the following sample with
minimal entries for the first chip with this patch changes applied:

&gpio {
    gpio-line-names = "", "", "", "",
                      "", "", "SFP LOS", "extcon port5 PoE compat",
                      "SFP module def0", "LED blue SFP", "SFP tx disable", "",
                      "switch USB power", "mode", "", "buzzer",
                      "LED blue pwr", "switch port5 PoE out", "reset";
};

gpioinfo
gpiochip0 - 32 lines:
  line   0:      unnamed       unused  output  active-high
  line   1:      unnamed       unused   input  active-high
  line   2:      unnamed       unused   input  active-high
  line   3:      unnamed       unused   input  active-high
  line   4:      unnamed       unused   input  active-high
  line   5:      unnamed       unused   input  active-high
  line   6:    "SFP LOS"        "los"   input  active-high [used]
  line   7: "extcon port5 PoE compat" unused input active-high
  line   8: "SFP module def0" "mod-def0" input active-low [used]
  line   9: "LED blue SFP" "blue:sfp" output active-high [used]
  line  10: "SFP tx disable" "tx-disable" output active-high [used]
  line  11:      unnamed       unused  output  active-high
  line  12: "switch USB power" "usb_power" output active-high [used]
  line  13:       "mode"       "mode"   input  active-high [used]
  line  14:      unnamed       unused   input  active-high
  line  15:     "buzzer"     "buzzer"  output  active-high [used]
  line  16: "LED blue pwr" "blue:pwr" output active-high [used]
  line  17: "switch port5 PoE out" "sysfs" input active-high [used]
  line  18:      "reset"      "reset"   input  active-high [used]
  line  19:      unnamed       unused   input  active-high
  line  20:      unnamed       unused   input  active-high
  line  21:      unnamed       unused   input  active-high
  line  22:      unnamed       unused   input  active-high
  line  23:      unnamed       unused   input  active-high
  line  24:      unnamed       unused   input  active-high
  line  25:      unnamed       unused   input  active-high
  line  26:      unnamed       unused   input  active-high
  line  27:      unnamed       unused   input  active-high
  line  28:      unnamed       unused   input  active-high
  line  29:      unnamed       unused   input  active-high
  line  30:      unnamed       unused   input  active-high
  line  31:      unnamed       unused   input  active-high 
gpiochip1 - 32 lines:
  line   0:      unnamed       unused   input  active-high
  line   1:      unnamed       unused   input  active-high 
  ...
  line  31:      unnamed       unused   input  active-high 
gpiochip2 - 32 lines:
  line   0:      unnamed       unused   input  active-high
  line   1:      unnamed       unused   input  active-high 
  ...
  line  31:      unnamed       unused   input  active-high 

To avoid gpiochip1 and gpiochip2 entries repeated with this
minimal lines definition change, we assign empty reserved
'names' in driver code.

Note that we also don't want to to prevent the driver from
succeeding at probe due to an error in the gpio-line-names
property and the ENODATA error is considered a valid result
to terminate any further labeling so there is no need for
an error message in that case. Other error results are
unexpected so an error message indicating the consequence
of the error is appropriate here.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

 drivers/gpio/gpio-mt7621.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..b5f8fd8e928a 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -206,6 +206,45 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 	return gpio % MTK_BANK_WIDTH;
 }
 
+static void
+mediatek_gpio_set_names(struct device *dev, struct mtk_gc *rg)
+{
+	struct device_node *np = dev->of_node;
+	const char **names;
+	int nstrings, base;
+	unsigned int i;
+
+	names = devm_kcalloc(dev, MTK_BANK_WIDTH, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return;
+
+	base = rg->bank * MTK_BANK_WIDTH;
+	nstrings = of_property_count_strings(np, "gpio-line-names");
+	if (nstrings <= base)
+		goto assign_names;
+
+	for (i = 0; i < MTK_BANK_WIDTH; i++) {
+		const char *name;
+		int ret;
+
+		ret = of_property_read_string_index(np, "gpio-line-names",
+						    base + i, &name);
+		if (ret) {
+			if (ret != -ENODATA)
+				dev_err(dev, "unable to name line %d: %d\n",
+					base + i, ret);
+			break;
+		}
+
+		if (*name)
+			names[i] = name;
+	}
+
+assign_names:
+	rg->chip.names = names;
+}
+
 static int
 mediatek_gpio_bank_probe(struct device *dev,
 			 struct device_node *node, int bank)
@@ -241,6 +280,8 @@ mediatek_gpio_bank_probe(struct device *dev,
 	if (!rg->chip.label)
 		return -ENOMEM;
 
+	mediatek_gpio_set_names(dev, rg);
+
 	rg->irq_chip.name = dev_name(dev);
 	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-- 
2.25.1

