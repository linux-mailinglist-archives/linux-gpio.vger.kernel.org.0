Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AF71E6A58
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 21:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406362AbgE1TVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 15:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406344AbgE1TVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 15:21:25 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3168C08C5C6;
        Thu, 28 May 2020 12:21:24 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v2so8976192pfv.7;
        Thu, 28 May 2020 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mn9ohrlxKhWlCLsT8/tQGjuXefbQkhXfEEa1XEFrFM8=;
        b=Ieu+GmkCMg7jmgthscjTaf2F4XyLjRN4/eSDhtKpTgfGoq6sIfW5LJ+7Qjx9HawsNl
         AZXc6PkYulXnWMzIeGGZfVpBGX9rIzvwM22KBXedqeisJA2MKAHaubh+KExlsKHTZbe3
         7AIUE2FJenGo0Q+bRv8n3CSVMS/Rg2OkvgtpzbOxEUlYZKkPtupuaEg7iK+caCUlRVNM
         aBcOCzIh569EY1uIeKrsRm9sUevXDxgzu2xP0qS+yr4PIvTDoiU/o0ewAaDEqkOpmq0t
         Z7w0EfApVjF0/9jVitcg7sgqk2gMh9+DDqcVtrEsR2CB2ATBmvBmCMD9EfUduCC19E/y
         UGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mn9ohrlxKhWlCLsT8/tQGjuXefbQkhXfEEa1XEFrFM8=;
        b=bviJgO5GtAU3sckWywY74dXwObcrUAf6FnZf/qsWPQLcIwZk1GB/RikDc/U0hT2bVi
         UA5Np6gD1u4oJahUj1fU2b8RIWkrrM7sw4Th070XrG8Q6xTPijqb8GAIi9+PmLuhC7p9
         zvF4f2/FwEkKHvruXY5VMbsAsSNfmOQaXWcXS+XqaA+YbmUMxAmZvqfNhnvbJ8ABSGHF
         pYNARH88vaGNJoTFBUmSEWs7oeZIjpQaFHRS+StwQCj9jSKsQLWbOnRmSUlRMLgyG31H
         kXLSchoZu+wqeQ61jdmr4tNeL3cUO71iTTIRG8R9W5gnfv/O9ekojoWbuDyKS0eoh8WV
         PT5w==
X-Gm-Message-State: AOAM533+O7K9JgxpGEfLcRZERQgn6qqG751fXTS34OpuIZz/Vtmt7W0S
        /kX2ED8OkryFmd8ols2lyu3oUK01
X-Google-Smtp-Source: ABdhPJwRb+nr4rhFloIJTFA7lJNjNqO/d11rldmRfSoxQeHoYbRkWhxEAG1rw3MH8Ot6loYluXa8fA==
X-Received: by 2002:a62:1a53:: with SMTP id a80mr4572305pfa.50.1590693684050;
        Thu, 28 May 2020 12:21:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h11sm5460561pjk.20.2020.05.28.12.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:21:23 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 3/4] pinctrl: bcm2835: Match BCM7211 compatible string
Date:   Thu, 28 May 2020 12:21:11 -0700
Message-Id: <20200528192112.26123-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528192112.26123-1-f.fainelli@gmail.com>
References: <20200528192112.26123-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM7211 SoC uses the same pinconf_ops as the ones defined for the
BCM2711 SoC, match the compatible string and use the correct set of
options.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 06bd2b70af3c..e8ad1824c6b3 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1137,6 +1137,10 @@ static const struct of_device_id bcm2835_pinctrl_match[] = {
 		.compatible = "brcm,bcm2711-gpio",
 		.data = &bcm2711_plat_data,
 	},
+	{
+		.compatible = "brcm,bcm7211-gpio",
+		.data = &bcm2711_pinconf_ops,
+	},
 	{}
 };
 
-- 
2.17.1

