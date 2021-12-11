Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F50471576
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Dec 2021 19:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhLKSxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Dec 2021 13:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhLKSxt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Dec 2021 13:53:49 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7614CC061714
        for <linux-gpio@vger.kernel.org>; Sat, 11 Dec 2021 10:53:49 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c4so20265173wrd.9
        for <linux-gpio@vger.kernel.org>; Sat, 11 Dec 2021 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=message-id:subject:from:reply-to:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=TWUrlcTesqI3HuTnG0bLpcjjpTZsdRdkaEZo0eKnu84=;
        b=fCL9nwjqyRotkVGUmDRGaxph9Ky8MEnAbUbKRK5eMmoxQy7SE9OCh5OVQFcE66Kljk
         AvH2OxW7k6uW+AzQmDqqAmKJ8M+gevk8Nc6hmGbV4AM+xi6kfXf3/pphzxc+B9uFwz+P
         47pJ4uovEDr45okzlU37gM7i/cIUyrXNQ0SX8j2nc3DwgN0UzRPLlKPDlpRnQ4+UTy2n
         jTpwagJw4shutT/8DYzlGdSR5yFaS+WdDNXyeRgkZcfGNvrafQU3+KnVWFeRe9qyjoDD
         rKC1ZJ/Utty1edqCmXNOK3WpNp7loKq6vGq6ZQ4KAcJRS3q2Ne3MZh+eVyAtWeCBKWnf
         5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :user-agent:mime-version:content-transfer-encoding;
        bh=TWUrlcTesqI3HuTnG0bLpcjjpTZsdRdkaEZo0eKnu84=;
        b=PHE4q7/olmvL5LXNZ+wwTiC8W9+nvJoCSA/JFZ7qH44w41Hfz7Augf7DDIjF7AMYzm
         xbFcVxefYQ7NJjzBEABPvUYiRlIPYSmVgzJeU4qkTprpoAWCkjONJ9ofYIp9QGosPh37
         gFi4O4iPfae968MVcLaq8rTDDaQr0YYtMzTrb7LidTknGvA1aRi9jlvrp4gF5I1I5SOt
         Hu6kkNGndZixWK8f7xudc4TOHYUd7i4fJEbaSsAUGf3acUOpNHwywE1mZfqruKnZ/nPE
         e5btHap6MPefPI1PB88iEQUV/mIYoX6fRyPw13BT6xG8BST7RlK/tzFs6m9JW5nfv9DV
         nz8Q==
X-Gm-Message-State: AOAM533IJSY80EOvAr6IYlCJ+4Qrn4dwC6aSRG5Kb5gKcj1v0mY0DOwU
        Ew5WAqFBTl0AFchkezW4kDY=
X-Google-Smtp-Source: ABdhPJx2knX4bKY7hBXMatBBZT+FGKyzvmJWAx1y6UenAlTIGdo8x6ppcC11ynSU11xW1h6iL4GEUA==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr21980731wru.123.1639248827955;
        Sat, 11 Dec 2021 10:53:47 -0800 (PST)
Received: from mars.fritz.box ([2a02:8070:bb0:8700:b62e:e6aa:398b:fb9d])
        by smtp.gmail.com with ESMTPSA id m21sm5529538wrb.2.2021.12.11.10.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:53:47 -0800 (PST)
Message-ID: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
Subject: [PATCH] Revert "pinctrl: stm32: fix the reported number of GPIO
 lines per bank"
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Date:   Sat, 11 Dec 2021 19:53:39 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit 67e2996f72c71ebe4ac2fcbcf77e54479bb7aa11 because it
breaks pin usage for gpio-nodes with an offset in gpio-ranges (like
&gpiof from stm32mp15xxab-pinctrl.dtsi).

For example the following reset gpio of a wifi module on a stm32mp153c
board works again after applying this revert patch:

	wifi_pwrseq: wifi-pwrseq {
		compatible = "mmc-pwrseq-simple";
		reset-gpios = <&gpiof 9 GPIO_ACTIVE_LOW>;
	};

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 24764ebcc936..73f49c596cef 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1225,7 +1225,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	struct device *dev = pctl->dev;
 	struct resource res;
 	int npins = STM32_GPIO_PINS_PER_BANK;
-	int bank_nr, err, i = 0;
+	int bank_nr, err;
 
 	if (!IS_ERR(bank->rstc))
 		reset_control_deassert(bank->rstc);
@@ -1247,14 +1247,9 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 
 	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
 
-	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
+	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args)) {
 		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
 		bank->gpio_chip.base = args.args[1];
-
-		npins = args.args[2];
-		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
-							 ++i, &args))
-			npins += args.args[2];
 	} else {
 		bank_nr = pctl->nbanks;
 		bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
-- 
2.30.2


