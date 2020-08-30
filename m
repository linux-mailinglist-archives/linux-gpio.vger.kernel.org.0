Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60A12570E5
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 00:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgH3Wng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 18:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgH3Wnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 18:43:33 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436DAC061575;
        Sun, 30 Aug 2020 15:43:33 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so4597711ljc.3;
        Sun, 30 Aug 2020 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Mu+BJ0OOHttwJihK5seRX4AUP0fLWw03cqNBMco7Eg=;
        b=lXn8MDYEsp/tVhb/LO/RjfAyKnQkQKATnGWSThzWabmoifuIJsW4Is2npHnJwbHxIw
         bodfwCnWoEzccSbxtOxBJb7I2U++EPTgfmVRdc7+tSJJhDgfVkPVJFptdVl69Je93OXs
         DovN5XHZsUla0wmyx9u3ydC/kwDhhBxVQ7PcgLGeKtoXqEfZTgMB+izSLHseq1izMp0N
         X501VZ26wDk/J279fT6GwCtR39FDsTO+5NdZ5aJjU1K9T6qXjuaN9kK//AvEWQ2h7dPg
         2LhBUIRmH4dHRKmvsmvJndIZ0kx+cv5R3TLhsckZAdVZCeLYyWxkgzQfDx9khiKLZ47H
         0P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Mu+BJ0OOHttwJihK5seRX4AUP0fLWw03cqNBMco7Eg=;
        b=V5mJYOS2Zlbtk7eals+FcnW/BbVF0fLrSEDbsAPGJXxMqw2xrO3BCWgN7d8tSYxxcK
         yXGt6mr5lpzSLVT+doc+dZTvcaOCxEajAub3JScCkf2yQk8raPz0LU88ChfhJ7ECffP5
         ayrRuYOpV2VfvQWYdusfDjM0fA/EU1rz2quQ3U4dXrD2cFUPJwHPXExh9S1Fn0HFy40l
         x/ZP26rKzkDnI0XTURawaWQ8tXiUmkHk/40gezjLzqbNq/yN8jZTgJq4KNiu1rUVrQZr
         rzRYpFePLhNMT27GgjeLj4YaSyxkM6Ce2RbgFLxLT8Pkoi7eGuS043n6VhXro74hzie7
         EJrg==
X-Gm-Message-State: AOAM532iSneoHXiUL1qdDZeX6MUilkVzzuSPWnuXUHBa37AjumstPWHW
        IGHCGZGoaKn2PRuB2Wx67Nk=
X-Google-Smtp-Source: ABdhPJwYDOhr4udFUcJexDg1ALLiNN8esxieMoOGzVqOJRlO5M1WN5XA9fEuTPp0XZoza/bMUeR9Lw==
X-Received: by 2002:a2e:8904:: with SMTP id d4mr3732242lji.400.1598827411498;
        Sun, 30 Aug 2020 15:43:31 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id m25sm1190072ljg.79.2020.08.30.15.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 15:43:30 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 3/3] pinctrl: actions: pinctrl-s900: Constify s900_padinfo[]
Date:   Mon, 31 Aug 2020 00:43:11 +0200
Message-Id: <20200830224311.36994-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
References: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only usage of s900_padinfo[] is to assign it to the padinfo field in
the owl_pinctrl_soc_data struct, which is a const pointer. Make it const
to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-s900.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-s900.c b/drivers/pinctrl/actions/pinctrl-s900.c
index 9492b86852e7..811249a8011e 100644
--- a/drivers/pinctrl/actions/pinctrl-s900.c
+++ b/drivers/pinctrl/actions/pinctrl-s900.c
@@ -1556,7 +1556,7 @@ static PAD_ST_CONF(I2S_BCLK0, 1, 1, 1);
 static PAD_ST_CONF(I2S_MCLK0, 1, 0, 1);
 
 /* Pad info table */
-static struct owl_padinfo s900_padinfo[NUM_PADS] = {
+static const struct owl_padinfo s900_padinfo[NUM_PADS] = {
 	[ETH_TXD0] = PAD_INFO_ST(ETH_TXD0),
 	[ETH_TXD1] = PAD_INFO_ST(ETH_TXD1),
 	[ETH_TXEN] = PAD_INFO_ST(ETH_TXEN),
-- 
2.28.0

