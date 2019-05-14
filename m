Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D735A1C4E6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfENI1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:27:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44611 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfENI06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:26:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so18090463wrs.11
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
        b=v3xu7tjvWyfaSEtn4pHRnlXDCYWDQ73FPtqaZDcSMRAqeBkyLCwCElW4Etf/UHqdAS
         tmjpx/aldrU/FHEVSknXFUAO/q3MY5dWhKaSaQEWzbZHoCvb3CgRFFehThzxC/48XrKb
         L3CZO6ra+Lmv1EcITN8K2ww8dnm8/794sm8v0lm6v8TFWuEqfH11p7cZOzXe4+tEHc0U
         LOLY3Hsle0ZqEWNbdY3DMK354CZF4tqB6s/aEAqyEF5JPafQPStOY0z6xThkbVyVCMR4
         JKoMQY27au5l85fl4z9RoZJwD1YMLcpbFO6+jXpo+NQhZ4vS53L6svo33sUQiU1mjS/m
         T8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
        b=QhMvyUvTXxIGHwFGq6eTZ6O5terO3wZyAynhaqkvMP5LbmeGhR002TPz2WJXbIuIw+
         tVB58Tm/CDncz6lfwkcQyV2WoX0k5TwIdow/adQhoCaGofd/ZUM67RRZ8vEFq7p4tewb
         mgA1dnYh0bTzWDhtK5zQNNxynf3UJNgjJWekbrng4uPJeL+4QJl7CGwX40M7gAQW9zu7
         2SRuUkXcr58FEXwIPvzOdMYy7HmsyMtUr+Otyg+mi42Z196gzt8bRkn8eMQ1+MseRFUF
         70v2kNn35YKwYmjFGf09HK8HSkuGT1S9na93eBbzlwbeG7OTppJ1/N2HkL45PGruBYH9
         Fibw==
X-Gm-Message-State: APjAAAVTZtGUusTyODebbyHw9VdmaFb6nL7saSxlEOs5yRLlXtr5/3Ng
        P5ZeGEnLFFFahsQdFrAkzA2HtA==
X-Google-Smtp-Source: APXvYqwzs56xDJxA92pMFFuDkKZTbEVAiHK7h/pHSRnD43if/pfZrGEj7WlTCVebkgIwwFKkhSQ8YA==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr10730256wru.312.1557822417035;
        Tue, 14 May 2019 01:26:57 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:26:56 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] pinctrl: generic: add new 'drive-strength-microamp' property support
Date:   Tue, 14 May 2019 10:26:48 +0200
Message-Id: <20190514082652.20686-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add drive-strength-microamp property support to allow drive strength in uA

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index b4f7f8a458ea..d0cbdb1ad76a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -39,6 +39,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
+	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
@@ -167,6 +168,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
 	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
+	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 6c0680641108..72d06d6a3099 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -55,6 +55,8 @@
  *	push-pull mode, the argument is ignored.
  * @PIN_CONFIG_DRIVE_STRENGTH: the pin will sink or source at most the current
  *	passed as argument. The argument is in mA.
+ * @PIN_CONFIG_DRIVE_STRENGTH_UA: the pin will sink or source at most the current
+ *	passed as argument. The argument is in uA.
  * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
@@ -112,6 +114,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
 	PIN_CONFIG_DRIVE_PUSH_PULL,
 	PIN_CONFIG_DRIVE_STRENGTH,
+	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
-- 
2.17.1

