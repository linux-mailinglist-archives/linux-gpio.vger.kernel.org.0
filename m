Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B054611CA4D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfLLKLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:11:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45139 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfLLKLk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 05:11:40 -0500
Received: by mail-lj1-f195.google.com with SMTP id d20so1584965ljc.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8ZAg99laX6cUXsWSB2mYDRuP0SQyvPulg/CcVWQbwA=;
        b=cerlNKtg4S7qWU47KEc6JYB4sugT0zpniq/PnxdNDmMZ7J3fe+eSsUh4x+Rrk+GHfh
         SCPR8iMr4T/0Wq+gnjxWabePHzC1twSbB2XNamNdDFNXundlGKKO/spq/kZh12dWW6lv
         JVSw4Wy5V3+9bNpn24OCyUUwJPunJ0AqsOreX6TW7HrGXNLBB9kYsXH5rVVtB9paBLb1
         BxfHGk82vr812XNL/EtD2O2b1h882yZiDhzmqdG9N+JWnsMiZRZbTmqRQ6QFbQ0siEhw
         GuIzd6cKa3bmILyhHAa/WXmnEq3dSIU+DyQVri/DykBOCCX/8yja/jrQZhiUJC6lD3Rq
         oiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8ZAg99laX6cUXsWSB2mYDRuP0SQyvPulg/CcVWQbwA=;
        b=DansdPeCGwIHfy5R2BGJ/VofTw422/Wg/wnRsjw/P1N5Dz7aICOfP4KVXDB2SiKIoA
         CYkGh6SZQcchd9kpYtCzdlH5VM5jZ3dSV2x9LHZrxewOkTdDSxFh0kcNff1+miYzEc9h
         UyDNBQKmX1FrrmQR23QijvoD8GwuI9JbnrpBg0eyR6483DDCdfuxKSD7dcmCIzyp7IyZ
         aL9BQrKnYTAUAp2VrnvXoBocO0XgVwjLX7a1NU2+7jAQrjenAae+QZji8/XAzloEYmlq
         U39KXDsSTnKCHp8UhG8JJaulCnjd1zyEcEhjH+9WW1XpKApX8EXH+CAVfsootv+kCwMM
         uEvg==
X-Gm-Message-State: APjAAAXBX3WxEUuDIHqi/7MGYCnHRr0IAqVJy29f10TzzTphXEbGCJ7h
        HX91UnSrTvLKrfq+yR5riwbGiHFlOus=
X-Google-Smtp-Source: APXvYqwcx3MXQX87qo1UspyHRGhis4ATexDa527ZnUsNP7UnGSv/GPCkRdCumDwIpLuCgG2UpWuLsw==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr5068239ljj.135.1576145497607;
        Thu, 12 Dec 2019 02:11:37 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d25sm2743401ljj.51.2019.12.12.02.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 02:11:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] pinctrl: Enforce device links
Date:   Thu, 12 Dec 2019 11:11:34 +0100
Message-Id: <20191212101134.42420-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of opt-in device links, enforce it across the board.
Everyone probably needs this anyway, lest runtime[_pm] suspend
order will be haphazard.

Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
As there is no progress on opting in drivers for this we can just
enforce it.

I am a bit concerned that with every pin control state change the
link reference count will just go up, but does it really matter?
---
 drivers/pinctrl/core.c                | 25 ++++++++++++++-----------
 drivers/pinctrl/pinctrl-stmfx.c       |  1 -
 drivers/pinctrl/stm32/pinctrl-stm32.c |  1 -
 include/linux/pinctrl/pinctrl.h       |  5 -----
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2bbd8ee93507..1d2cdeebb316 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1220,15 +1220,6 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
 }
 EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
 
-static void pinctrl_link_add(struct pinctrl_dev *pctldev,
-			     struct device *consumer)
-{
-	if (pctldev->desc->link_consumers)
-		device_link_add(consumer, pctldev->dev,
-				DL_FLAG_PM_RUNTIME |
-				DL_FLAG_AUTOREMOVE_CONSUMER);
-}
-
 /**
  * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
@@ -1276,8 +1267,20 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		}
 
 		/* Do not link hogs (circular dependency) */
-		if (p != setting->pctldev->p)
-			pinctrl_link_add(setting->pctldev, p->dev);
+		if (p != setting->pctldev->p) {
+			/*
+			 * Create a device link to the consumer such that
+			 * it will enforce that runtime PM suspend/resume
+			 * is done first on consumers before we get to
+			 * the pin controller itself. As some devices get
+			 * their pin control state even before probe() it is
+			 * important to use DL_FLAG_AUTOREMOVE_CONSUMER.
+			 */
+			device_link_add(p->dev,
+					setting->pctldev->dev,
+					DL_FLAG_PM_RUNTIME |
+					DL_FLAG_AUTOREMOVE_CONSUMER);
+		}
 	}
 
 	p->state = state;
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 16723797fa7c..4306b8444188 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -638,7 +638,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.pins = stmfx_pins;
 	pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
 	pctl->pctl_desc.owner = THIS_MODULE;
-	pctl->pctl_desc.link_consumers = true;
 
 	ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
 					     pctl, &pctl->pctl_dev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2d5e0435af0a..ec59a58600ce 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1439,7 +1439,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.owner = THIS_MODULE;
 	pctl->pctl_desc.pins = pins;
 	pctl->pctl_desc.npins = pctl->npins;
-	pctl->pctl_desc.link_consumers = true;
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 7ce23450a1cb..c6159f041f4e 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -122,10 +122,6 @@ struct pinctrl_ops {
  *	the hardware description
  * @custom_conf_items: Information how to print @params in debugfs, must be
  *	the same size as the @custom_params, i.e. @num_custom_params
- * @link_consumers: If true create a device link between pinctrl and its
- *	consumers (i.e. the devices requesting pin control states). This is
- *	sometimes necessary to ascertain the right suspend/resume order for
- *	example.
  */
 struct pinctrl_desc {
 	const char *name;
@@ -140,7 +136,6 @@ struct pinctrl_desc {
 	const struct pinconf_generic_params *custom_params;
 	const struct pin_config_item *custom_conf_items;
 #endif
-	bool link_consumers;
 };
 
 /* External interface to pin controller */
-- 
2.23.0

