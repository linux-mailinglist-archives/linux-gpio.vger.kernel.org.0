Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F8F1F4C05
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 06:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725270AbgFJENt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 00:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgFJENs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 00:13:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C4FC05BD1E;
        Tue,  9 Jun 2020 21:13:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y18so450808plr.4;
        Tue, 09 Jun 2020 21:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Aos11RqaPZ+e2YnSb8NYoxbzf85DJlijsegumQu5D/4=;
        b=FRJmMAcSqqHwvC+rKTP0lt2u8OtvhL7uroLmmCqAc/7ctmav8v1cWVkjWskgNFmz/X
         JA8lGiG6OGwHNc79nqRPaN2ciqerP3jopIdAbeXAdjm6b1BmYs/S8hLZNUeSDv+69R4t
         s2fQcVbU8jRh5ItTQMFOp0qVsvoJ8qbYrTYnWsNbIlSTqQCgaATVYDKRxguUOFnWdhLS
         H44w8FVqyMdKBAK5C2kv0vb7wsmyBbOxy/B8j+5jZiQSEOk4A1agFUM7bZa1u0CczU7M
         eaqLiXzrydUY6us2zy81s25jumAdN7pC5eb7yDs20zPGJHgRlN8EICX1QghnqL+7/lZ/
         AWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Aos11RqaPZ+e2YnSb8NYoxbzf85DJlijsegumQu5D/4=;
        b=gvfeeDsu16uMLvbsJxXinJvP6Dn1TwSknAIAG7BKvH+DQvsxd9+h/d+rBEhFxO3kvY
         pGmE3uChuus6EO7VklxTvIaEQ9k1N6iQTVUWxGr6Nh+jeWs81IjhHjuMg/IZve6Uvn/o
         epWmGEdTn7IUnxv5qp17PeT2l7tjtTcPHcR1n54asqeerQC7cnv0zjV3fPcfY8OSg6ag
         QReg4kSvd9ItCnNeBhkGwkYExZNXY5JhKTb4EM8fvQLsFLEChEQE/D79hML6ktVyFX94
         zmNDRK3U3VeMNJlYPhxFfKnSbrS0YcbGH40L5uzQ9Vot1Q0OLMuB2aI45c2mGDUNTkGh
         vvOA==
X-Gm-Message-State: AOAM530Se+t12o6FX0ku1HPR7RQFlynMA1Avrl2pl5bS349HpAku8lxY
        QxiW777BU3hivt7ck5oqS6g=
X-Google-Smtp-Source: ABdhPJx6zMAjL6TpjNgXSxp7AZ0zuAmfpF4vKmHcy5qsE/ExouW65YcElpKUv6vOARbGNm3FLTgNIQ==
X-Received: by 2002:a17:902:848d:: with SMTP id c13mr1361408plo.289.1591762418532;
        Tue, 09 Jun 2020 21:13:38 -0700 (PDT)
Received: from localhost.localdomain ([114.204.138.55])
        by smtp.gmail.com with ESMTPSA id o1sm11887461pfu.70.2020.06.09.21.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 21:13:37 -0700 (PDT)
From:   hhk7734@gmail.com
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hyeonki Hong <hhk7734@gmail.com>
Subject: [PATCH] pinctrl: meson: fix drive strength register and bit calculation
Date:   Wed, 10 Jun 2020 13:13:29 +0900
Message-Id: <20200610041329.12948-1-hhk7734@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hyeonki Hong <hhk7734@gmail.com>

If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
registers. However, when register and bit were calculated, the first
register defined in the bank was used, and the bit was calculated based
on the first pin. This causes problems in setting the driving strength.

Solved the problem by changing the bit using a mask and selecting the
next register when the bit exceeds 15.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..ef66239b7df5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,

 	*reg = desc->reg * 4;
 	*bit = desc->bit + pin - bank->first;
+
+	if (reg_type == REG_DS) {
+		if (*bit > 15) {
+			*bit &= 0xf;
+			*reg += 4;
+		}
+	}
 }

 static int meson_get_groups_count(struct pinctrl_dev *pcdev)
--
2.17.1
