Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613AF39CA92
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 21:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhFETCI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 15:02:08 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:34595 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhFETCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 15:02:07 -0400
Received: by mail-lf1-f44.google.com with SMTP id f30so19188706lfj.1;
        Sat, 05 Jun 2021 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VCncyxV+C3Ix+IT2/JKoU2sEed/DxJfO2AtoY3VEleM=;
        b=EWI9sLhpQAL13ojkJS2bYnsYL9/2eKi6sCsHB6jWWdN1axSj6Iha958abJaH2yPBuN
         lVxtCvH2DTgtXUsEq1KSQhCVWhpBd1LlnO2vglqUqBc5FoGDDAN+EVo5sj4fmZpvhsH8
         G6QtB3CXCVMQ3500Fv/j4QotA2DwcGetzHue1RpN19qiyZf8ZeniHos+uf2ae7pfBXWq
         y4Vg07sWxVT+S+SWk97rU/iBE4NWp9Rn52W7heaXMD/4e+pv0s5o8meeV2JBDIByHETg
         bBaQcsLfKWKf85NpLRItFs0lNn6grC37vBJ8M6aAWlIYoIGevNduF9WE34Wu3dqYveA3
         HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VCncyxV+C3Ix+IT2/JKoU2sEed/DxJfO2AtoY3VEleM=;
        b=o8OMVT0UAFyZaR+gTnAmQSjjLf7IhQ54YHt+cNFD/STEd18dSzXfpPgABG5AkSuh8H
         ZcKD/11fhRyWKgeO6Jt/GA8Mz1Z6hE6fuPTE/xtLg7wuGk0AS8xYu3oY4RWr4gZJzH0g
         5Onf9qE2+TJhE1DaA2+NCWeqoZAaKjqzukj3mD6sUNDb46VyoKJf20FZybnp9DJC52KD
         ANpqb76pzVC2cFDI0uBOt7Epmj/r50PsaffAYGDihwq/tyXwh1gEjscjWGAzKk+T6gNX
         u/hfxe0Lv9UM1O9nWuQD3X/n4iewMjqEfw74vel7jnqfBKVNWdcfpm+niIFHgf8szO9M
         sexQ==
X-Gm-Message-State: AOAM5330y4JKtJEqkOBlE7Og00FlJkDnw2utED1M84ReFx5AKHM8Rb3B
        ZV8twTyc0IDTKr3QenYmNayiwHg8DBf1Hw==
X-Google-Smtp-Source: ABdhPJx8ki+DLNcm01A8/VcLCb0KKyG/JxolaS60ft3q9iouk1UD3LL6qmxWMb0Gty1L5UhdZ8xgwQ==
X-Received: by 2002:ac2:5f59:: with SMTP id 25mr6470021lfz.484.1622919558664;
        Sat, 05 Jun 2021 11:59:18 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id d40sm116607lfv.102.2021.06.05.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 11:59:18 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/2] pinctrl: bcm: Constify static pinmux_ops
Date:   Sat,  5 Jun 2021 20:59:08 +0200
Message-Id: <20210605185908.39982-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
References: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These are only assigned, either directly or via the bcm63xx_pinctrl_soc
struct, to the pmxops field in the pinctrl_desc struct and never
modified, so make them const to allow the compiler to put them in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm6318.c  | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm63268.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm6328.c  | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm6358.c  | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm6362.c  | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm6368.c  | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6318.c b/drivers/pinctrl/bcm/pinctrl-bcm6318.c
index 4f96a285c307..9311220fb6cb 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6318.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6318.c
@@ -460,7 +460,7 @@ static const struct pinctrl_ops bcm6318_pctl_ops = {
 	.get_groups_count = bcm6318_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm6318_pmx_ops = {
+static const struct pinmux_ops bcm6318_pmx_ops = {
 	.get_function_groups = bcm6318_pinctrl_get_groups,
 	.get_function_name = bcm6318_pinctrl_get_func_name,
 	.get_functions_count = bcm6318_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63268.c b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
index f1dea4e1c63e..1c1060a39597 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63268.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
@@ -605,7 +605,7 @@ static const struct pinctrl_ops bcm63268_pctl_ops = {
 	.get_groups_count = bcm63268_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm63268_pmx_ops = {
+static const struct pinmux_ops bcm63268_pmx_ops = {
 	.get_function_groups = bcm63268_pinctrl_get_groups,
 	.get_function_name = bcm63268_pinctrl_get_func_name,
 	.get_functions_count = bcm63268_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
index fc090a1609d1..ffa8864abab6 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6328.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
@@ -366,7 +366,7 @@ static const struct pinctrl_ops bcm6328_pctl_ops = {
 	.get_groups_count = bcm6328_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm6328_pmx_ops = {
+static const struct pinmux_ops bcm6328_pmx_ops = {
 	.get_function_groups = bcm6328_pinctrl_get_groups,
 	.get_function_name = bcm6328_pinctrl_get_func_name,
 	.get_functions_count = bcm6328_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6358.c b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
index 7b316305eada..9f6cd7447887 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6358.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
@@ -311,7 +311,7 @@ static const struct pinctrl_ops bcm6358_pctl_ops = {
 	.get_groups_count = bcm6358_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm6358_pmx_ops = {
+static const struct pinmux_ops bcm6358_pmx_ops = {
 	.get_function_groups = bcm6358_pinctrl_get_groups,
 	.get_function_name = bcm6358_pinctrl_get_func_name,
 	.get_functions_count = bcm6358_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
index a9e8178268ed..13c7230949b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
@@ -579,7 +579,7 @@ static const struct pinctrl_ops bcm6362_pctl_ops = {
 	.get_groups_count = bcm6362_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm6362_pmx_ops = {
+static const struct pinmux_ops bcm6362_pmx_ops = {
 	.get_function_groups = bcm6362_pinctrl_get_groups,
 	.get_function_name = bcm6362_pinctrl_get_func_name,
 	.get_functions_count = bcm6362_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6368.c b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
index e3739e921f5c..b33a74aec82b 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6368.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
@@ -465,7 +465,7 @@ static const struct pinctrl_ops bcm6368_pctl_ops = {
 	.get_groups_count = bcm6368_pinctrl_get_group_count,
 };
 
-static struct pinmux_ops bcm6368_pmx_ops = {
+static const struct pinmux_ops bcm6368_pmx_ops = {
 	.get_function_groups = bcm6368_pinctrl_get_groups,
 	.get_function_name = bcm6368_pinctrl_get_func_name,
 	.get_functions_count = bcm6368_pinctrl_get_func_count,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
index c135477ec768..d58c8cd5b6b8 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
@@ -13,7 +13,7 @@
 
 struct bcm63xx_pinctrl_soc {
 	const struct pinctrl_ops *pctl_ops;
-	struct pinmux_ops *pmx_ops;
+	const struct pinmux_ops *pmx_ops;
 
 	const struct pinctrl_pin_desc *pins;
 	unsigned npins;
-- 
2.31.1

