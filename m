Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5A39CA94
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 21:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhFETCV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 15:02:21 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:37487 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhFETCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 15:02:21 -0400
Received: by mail-lf1-f50.google.com with SMTP id f11so19094055lfq.4;
        Sat, 05 Jun 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LkrqOsdOWKT6x0a3cu8q5pQGok4HiHLUiPaSRC2+704=;
        b=gx2hF0qNjjScNIlBEt8uZFmv/uIpvCVBmDzoOJT237C6ZPOXstL9OHVZsPFJ6fygDM
         SH3qOEGdyHfJzRn1dRN2Kidd8e+h2genFItKM7wgvImJYAlJyD6+Hf0XxY3Bugk+kYEi
         dyHWr86gLgn7MMYYv1TL4QrzQzxle1pqmok5VGiyZvWJl0t07fCRG01Ezf1mTSg1dFqX
         9NRp8Lmog7oie/uWNYm9xy+MwMXYItLwNY09SNIU9k0h1JkKjfFWDhLMjQJwuzuk+ILE
         w5D6Z5lG0gbo06n8+WT0qJvkAQ5U96qc2uP1lnEWtaRxntJtK0H1TZ3CJ/7F2DEoCyHH
         OclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkrqOsdOWKT6x0a3cu8q5pQGok4HiHLUiPaSRC2+704=;
        b=fu/OCD5xPSog6l0SFf2Yce65VNM6Fz+Nc88GKR6mf4KyHUQeSkgKiCB9UCkyBlDqrg
         JI0JyICX6IdKT9pzNG1mNplAWhRAnhA42YSBhlV154f5kkgsWVaWyox8URVJChRKvFzl
         Lvh8PPX3++2u4wYhSjKWs312Vmr3M08LCfjeIGtLaaknBz7xAt3IXR/Zvp6AAxOy9IXF
         hDmmvv53Z2m/N9XS6ZqHfNeHoDbSPSnAjL2MHqt+AZUjCrsu1YxkaoUG2VJfywlG44Qh
         htzT2MpEfi7KLjlGcIdktld0qRVbFL62uqW+ljn82polrnX+ilqZhUKY6EYrekfHfO79
         UYlw==
X-Gm-Message-State: AOAM531cOHQwcYKmqzP7fus5lqia/AIWLi/eRyoS9gn7figNAxmnPl3+
        RKZK4PwgpQhAE18oHhdxkYw=
X-Google-Smtp-Source: ABdhPJz4vD+nzIa3WWYon3qGcnRuOMPgVKVJG9Y22VNqx7qXE1wf34VGiFLqaGyf3tRHvl8z1nrjtQ==
X-Received: by 2002:ac2:5d66:: with SMTP id h6mr3758494lft.101.1622919557115;
        Sat, 05 Jun 2021 11:59:17 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id d40sm116607lfv.102.2021.06.05.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 11:59:16 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/2] pinctrl: bcm: Constify static pinctrl_ops
Date:   Sat,  5 Jun 2021 20:59:07 +0200
Message-Id: <20210605185908.39982-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
References: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These are only assigned, either directly or via the bcm63xx_pinctrl_soc
struct, to the pctlops field in the pinctrl_desc struct and never
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
index 77fd9b58067d..4f96a285c307 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6318.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6318.c
@@ -452,7 +452,7 @@ static int bcm6318_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops bcm6318_pctl_ops = {
+static const struct pinctrl_ops bcm6318_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm6318_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63268.c b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
index d4c5fad7fb7d..f1dea4e1c63e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63268.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
@@ -597,7 +597,7 @@ static int bcm63268_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops bcm63268_pctl_ops = {
+static const struct pinctrl_ops bcm63268_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm63268_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
index c9efce600550..fc090a1609d1 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6328.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
@@ -358,7 +358,7 @@ static int bcm6328_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops bcm6328_pctl_ops = {
+static const struct pinctrl_ops bcm6328_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm6328_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6358.c b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
index d638578727f3..7b316305eada 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6358.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
@@ -303,7 +303,7 @@ static int bcm6358_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return regmap_field_update_bits(priv->overlays, mask, 0);
 }
 
-static struct pinctrl_ops bcm6358_pctl_ops = {
+static const struct pinctrl_ops bcm6358_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm6358_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
index 40ef495b6301..a9e8178268ed 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
@@ -571,7 +571,7 @@ static int bcm6362_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops bcm6362_pctl_ops = {
+static const struct pinctrl_ops bcm6362_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm6362_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6368.c b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
index 838095f9e890..e3739e921f5c 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6368.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
@@ -457,7 +457,7 @@ static int bcm6368_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinctrl_ops bcm6368_pctl_ops = {
+static const struct pinctrl_ops bcm6368_pctl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
 	.get_group_name = bcm6368_pinctrl_get_group_name,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
index 3bdb50021f1b..c135477ec768 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
@@ -12,7 +12,7 @@
 #define BCM63XX_BANK_GPIOS 32
 
 struct bcm63xx_pinctrl_soc {
-	struct pinctrl_ops *pctl_ops;
+	const struct pinctrl_ops *pctl_ops;
 	struct pinmux_ops *pmx_ops;
 
 	const struct pinctrl_pin_desc *pins;
-- 
2.31.1

