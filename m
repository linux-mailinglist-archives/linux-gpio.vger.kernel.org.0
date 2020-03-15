Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F68185C4A
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 13:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbgCOMOS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 08:14:18 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40986 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgCOMOS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Mar 2020 08:14:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so6552636plr.8;
        Sun, 15 Mar 2020 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VqVh07tP3DmDtABJpvVftP40yD+FjkPxa4DAFr0PLU8=;
        b=eK2SVQt9xb65Rg+WL2D9n5w+r6vKT74GSbiupDCZXDWqZtGEZUkmhbvzTo5WlVliYJ
         H0CxyfmpRFmU+oH+RrQ8+Qlc3uJCdMFDcRKjObXt19aQxq/e+dWMYn8aPDT6GsPPQOfM
         ulzjzkwRTB95zFjkl8Vn+MB2nU/jmXBPTtEoeuIur4gIieUiXieuk2aYuyuS+Ky8yMA+
         2dDX50VrciPxS5wK8W7LbcaMewo3IIN4f7hCd5BxESoW2qwE6dxxLjB9I/mg5O0vdC+s
         5TaVWNfHqk1DK54s4dQ6wzWOlvfHtV2fEfIjcBQrdCT9WlHQxfmo5kePbKmVIC6KvUsM
         Gy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VqVh07tP3DmDtABJpvVftP40yD+FjkPxa4DAFr0PLU8=;
        b=agBJHRA2TMIuur23gnP7EyLo8sjDeVPBv9xdzSKkcYmmD4oXfHEtOv/MpntfD2PMuk
         Ef3+c8XLAb8mjQUt5iq/Tl2m/QrzFzNguutRHkiPLPUCUo90sLTAuy7Y/roSaO/2bpMJ
         oAsqwp+8wQ/o09Mbtz9rxjbyb596eES5nLj1r05fIxtv/2S9EPCbYk77fOckk8ET4E4T
         J9qG2Ts24a7A1Hj0No+52DU5WChfbReGJXpRH/HGrBhb+htBmW+efRfSRodbk4Cs4Uv9
         dhYIiuI5RgKOW5nsyuXSb+3hVawL2sz5sF8qgnnANBuC0nridvRy4HffzBGH0khqktPM
         H8mw==
X-Gm-Message-State: ANhLgQ1rk7eBbSLXLwjsIg8s/hFTXgyOV+snwKjgQcpM3k+/eDo9HAcy
        1D1J1/34jdxf4HDGGX90wdg6BAZsn3Y=
X-Google-Smtp-Source: ADFU+vslRj7Ob4BCqFTA5WPGEnkdc3n+Mmg1/5FCfJLERE0IziAEUvCmM0MWaFnF6hPkLfKX8WpoCA==
X-Received: by 2002:a17:902:aa97:: with SMTP id d23mr15248999plr.244.1584274456884;
        Sun, 15 Mar 2020 05:14:16 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:976:a075:bc02:9cda:8f71:1120])
        by smtp.gmail.com with ESMTPSA id 5sm19869025pfw.98.2020.03.15.05.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 05:14:16 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag
Date:   Sun, 15 Mar 2020 20:13:38 +0800
Message-Id: <20200315121338.251362-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200315121338.251362-1-gch981213@gmail.com>
References: <20200315121338.251362-1-gch981213@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DSET/DCLR registers only works on output pins. Add corresponding
BGPIOF_NO_SET_ON_INPUT flag to bgpio_init call to fix direction_out
behavior.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index b992321bb852..82fb20dca53a 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -227,8 +227,8 @@ mediatek_gpio_bank_probe(struct device *dev,
 	ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
 	diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
 
-	ret = bgpio_init(&rg->chip, dev, 4,
-			 dat, set, ctrl, diro, NULL, 0);
+	ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
+			 BGPIOF_NO_SET_ON_INPUT);
 	if (ret) {
 		dev_err(dev, "bgpio_init() failed\n");
 		return ret;
-- 
2.24.1

