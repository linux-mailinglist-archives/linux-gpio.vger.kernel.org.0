Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDF52D8EAD
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404566AbgLMQSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404401AbgLMQSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:49 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01177C06179C;
        Sun, 13 Dec 2020 08:17:31 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id w5so10250831wrm.11;
        Sun, 13 Dec 2020 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+qBYzhMTB1Wzp8xi32BRlc6s23LYHlnQSW4DIZrTQE=;
        b=ZEIbaQwK4Eg+4j8a01m4Enb6LHDVS2HC/cI7yynOS9U2GqeZfdNYe26GdbmYgDa8EN
         UYBnO937i/xRSXVo8WGE9qZMn7eKdwRLB/qPLQ4v6oI8K1mXrkcGE+hSnZ4dzd7u+8qN
         r7CdiNX2SF+gL/ztuE4+I7qYctMD7XYEUYa0yZksUDG9sZnaEIx0rcZnENezTCfgvXnJ
         RUIIMds0Hx1wbzkrtcNW0q2Nc2IKH+H4ab9t0uHKSVbPMXMGlEkEVPRQXFOrRDZvHGbw
         yGeEuBgw3wAZw3A/qLzSfrTbBONIDs+2tZiu5zy5rHH7t7Ouv6G3AjgCNr58XJd39PdB
         2ejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+qBYzhMTB1Wzp8xi32BRlc6s23LYHlnQSW4DIZrTQE=;
        b=kVgdry4pIVfpx4JzUU3/NsT4u8ohskDY82vMYOywal8YwUVqgac53XipI0f7EMhxo7
         z6XKQHjgGSuPpEYa1QtSjwgxHQ3EUxc2ORziY4lrFm5AZYYIJD90jNyYLFhpiPvWwulQ
         KZRUxR8DSBrXIRHnoDwnqwKei74yuEupuMB0qmfhLPROkJj77ygWtsjR8vMtWrVTI6Cm
         GU5eOVpU9IgaaviFsjivf1NzgHaNbyNPFUKOdoWFQ9/sheOm8nIlOylKXGHUv3ULGo0j
         zXabXooUuI0bPDM04E2s10ghuKwqu+JLlpUiOpBfvpjFq0+McDwosmHMkLh4eUtxfE/q
         POEQ==
X-Gm-Message-State: AOAM531T4riAYGsApVl/Fsf2Fv6XtTMklgGe/lYXd2aAHKVSD6Zu//Ad
        XsPhBm/+lqhfx+NdnyFq+bI=
X-Google-Smtp-Source: ABdhPJyvY3ww7ODL0QierPoakFmNPsYRid6N4+4QjmL2PI8Bb4wlecxAnlQjp8AZ11Ms1rSaPEKjRw==
X-Received: by 2002:adf:a3ca:: with SMTP id m10mr24759846wrb.228.1607876249739;
        Sun, 13 Dec 2020 08:17:29 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:29 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 5/8] pinctrl: ralink: rt2880: delete not needed error message
Date:   Sun, 13 Dec 2020 17:17:18 +0100
Message-Id: <20201213161721.6514-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When '-ENOMEM' is returned there is not need at all to
add custom error messages. Hence delete it.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 3c3336b724ca..4725aa34328a 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -279,10 +279,8 @@ static int rt2880_pinmux_pins(struct rt2880_priv *p)
 	/* the pads needed to tell pinctrl about our pins */
 	p->pads = devm_kcalloc(p->dev, p->max_pins,
 			       sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
-	if (!p->pads || !p->gpio) {
-		dev_err(p->dev, "Failed to allocate gpio data\n");
+	if (!p->pads || !p->gpio)
 		return -ENOMEM;
-	}
 
 	memset(p->gpio, 1, sizeof(u8) * p->max_pins);
 	for (i = 0; i < p->func_count; i++) {
-- 
2.25.1

