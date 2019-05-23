Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E1227775
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 09:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfEWHvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 03:51:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37401 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbfEWHvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 03:51:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id h19so4524983ljj.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 00:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6x7UGpKJgQKDZHgVNjoxC5p2gPOS4T78zzyffMk/8h4=;
        b=aFgwXRW+4uUt0lfDSoB12+0Z7Ec2fOYPyFT6nesGKMeTj3IMO+2302jVVaHFb3BiKA
         eCMd4wHRiUMPKF2JorMchNo+Nl2DozudDA50BZU+cmUWnP5Dq2Rz5h8lcZO7g6Odob7T
         pWxK8WBKc3qY996glKW9R9S/kRfdMTsEydvuRozT+7Nl9P8mfuPuxsD0DGIrQuBrurNG
         YDOeNM3oz153pufgp/7IJyqXYmwc1fIsCfq7XqVcJOq78/kyBoDuSD5QOvtGGr8inyWe
         FHuTEG1rgib5OI6pInlHVMb6g41G0cIro6tOi1KpK14jdrtAEmdnM5ZInoiFY/IL1kwl
         xaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6x7UGpKJgQKDZHgVNjoxC5p2gPOS4T78zzyffMk/8h4=;
        b=Yl8BmvHUjsr/Uvvu3289K8Xb+VT4hTM4nc85UBGwu/m0IUk4wC5yyCPhYuE9s6giaU
         m7u0aXTzNCGXWUK1bc8u7Xe5nVVuZrq2GAToW8yN+YI/el8R7rSGjfE50RvYymWC8lwL
         3dC0CP7DEolQnXtl7ZA6MdiXoxBVYtzYS+IWdgk3FzaeDgmWPjXj97puFRip0aYG5K+b
         Fme0AiH+bJ1K5Tbk1R/ggjGX6BqVW1jetPZtGcX0nWwWxI93s9wR5x7IO8+nEY3H9QhV
         S3Q1P9G3iUyMA4mQfD2SCZ2vAwDErBdjwR1MQ8jL6rh3id68cNRXbao0/O4Rw6Qt4UUc
         mDPQ==
X-Gm-Message-State: APjAAAUpaUohDbN/MFtStGczcza5Jt/+rn0YxIzq9B4EsMxRMb4mSd0A
        Hkv0031TmIs9t2B4YoBoTWGHSfnEPT0=
X-Google-Smtp-Source: APXvYqzaoxSM0w5C+uYqTQd6jf2UWnY55YZ86m6N+UxKI3MzI+MDcT52cqTiAem9jcXnJfZVwGQfcQ==
X-Received: by 2002:a2e:5c08:: with SMTP id q8mr27595773ljb.113.1558597868547;
        Thu, 23 May 2019 00:51:08 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u19sm5631441lfu.63.2019.05.23.00.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 00:51:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] pinctrl: sx150x: Enable device links to consumers
Date:   Thu, 23 May 2019 09:51:02 +0200
Message-Id: <20190523075102.16094-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A recent core change makes it possible to create device links
between a pin controller and its consumers. This is necessary
to ascertain the right suspend/resume order for the devices:
if a device is using a certain pin control state and want
to switch that before/after going to suspend, then the pin
controller may not be suspended already, and conversely
on the resume path.

Make sure any SX150X consumers are suspended before the
SX150X is suspended.

The SX150X does not implement suspend/resume callbacks,
but the device links are hierarchical, and this also makes
sure that the I2C master where the SX150X is in turn
connected will not suspend before any clients of the pin
control settings are suspended (and conversely for resume).

Cc: Peter Rosin <peda@axentia.se>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 4d87d75b9c6e..8b954f74a63a 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1151,6 +1151,7 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->pinctrl_desc.pins = pctl->data->pins;
 	pctl->pinctrl_desc.npins = pctl->data->npins;
 	pctl->pinctrl_desc.owner = THIS_MODULE;
+	pctl->pinctrl_desc.link_consumers = true;
 
 	ret = devm_pinctrl_register_and_init(dev, &pctl->pinctrl_desc,
 					     pctl, &pctl->pctldev);
-- 
2.20.1

