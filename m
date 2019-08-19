Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5918591E5F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 09:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfHSH6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 03:58:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39442 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHSH6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 03:58:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id z3so585970pln.6
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfIx7/Mrxrtso9U7DANP1TxOn7c67u1PpGgoei866Xg=;
        b=VRn+SvijVyJaFG20j3nEYqv6hb70s6eV7YTBOq0QYlgec2Kzz24LasQLQj3FqWN89O
         BXzdJM5HoisePEt+fog3VB3rvVVDHmJOntmQuXA3XrojsiUGPlGYaGqkY7L+kD8dzEbf
         hOLkJeORC/65rOSIJurCq4s+ZX8hwdCZT4Y5jl5GZwsOHUgpcPBheMKsZQ3yzNeNWHAy
         xhnNH5bumv1CpW7rdOxyWwEBfpIhwU8rgHFoHtxGoMZFEZ7Lxeq46I5DqrVayhKfqZJD
         65/sY4+ZOchYJNVgEDbI13An4T06xzcsW+cwazkaRNZQcYpXhbRzEViRvhUM/8PJu9wB
         Q85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfIx7/Mrxrtso9U7DANP1TxOn7c67u1PpGgoei866Xg=;
        b=XliDdLCM0ER15xCKqGFbXtmY+ASOzDuAOy9vvCt+VHjdIRzUN1P23hMrE+FXKq+IAn
         DeJJoM0oZ54+U3NXySaTdy63PsTWDmQgZDA/dOKOqmkPFKvdBYP3kSL+K973n7TZfOdv
         2Zpj3Q36iPYFS+wgxxtzg+3NuqqASkXhPeHI8HkJPjk++NXg/vJLv35z54ff+P349ZrQ
         Y5B/3brmk4bMc9Q03AnJvch1MQEMsQ7FwxJ/IjjHsvXBbIQmmEpXmARF2SScF80W+FEF
         aUaT/jCGQkyKzcXwO+HnTuJhYspi/4zuv9HyREXWiT4KEp6fEHFu+IJYYzK9kV4h8gWB
         Bn4g==
X-Gm-Message-State: APjAAAXTWh5VyM4/FjsLaktd59lgA2zKS27v3dV1xcDI7/dar7aAMtz0
        DLgro3S0mGgCOgKCU2AjmllPiOri
X-Google-Smtp-Source: APXvYqy9coEEfdlj0fZNSqBu3Cz6t2LlmJeE4IIZvsIZ7FIXI/YjXqZGmGShqaP9pvtzQ4EILhKATg==
X-Received: by 2002:a17:902:424:: with SMTP id 33mr21428188ple.34.1566201489569;
        Mon, 19 Aug 2019 00:58:09 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id j6sm27634061pje.11.2019.08.19.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:58:09 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: rk805: Make structures constant
Date:   Mon, 19 Aug 2019 13:27:57 +0530
Message-Id: <20190819075757.1753-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Static structures rk805_pinctrl_desc and rk805_gpio_chip, of types
gpio_chip and pinctrl_desc respectively, are not used except to be
copied into the fields of a different variable. Hence make
rk805_pinctrl_desc and rk805_gpio_chip both constant to protect them
from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/pinctrl-rk805.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index a8459cafd4ea..26adbe9d6d42 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -197,7 +197,7 @@ static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return !(val & pci->pin_cfg[offset].dir_msk);
 }
 
-static struct gpio_chip rk805_gpio_chip = {
+static const struct gpio_chip rk805_gpio_chip = {
 	.label			= "rk805-gpio",
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
@@ -404,7 +404,7 @@ static const struct pinconf_ops rk805_pinconf_ops = {
 	.pin_config_set = rk805_pinconf_set,
 };
 
-static struct pinctrl_desc rk805_pinctrl_desc = {
+static const struct pinctrl_desc rk805_pinctrl_desc = {
 	.name = "rk805-pinctrl",
 	.pctlops = &rk805_pinctrl_ops,
 	.pmxops = &rk805_pinmux_ops,
-- 
2.19.1

