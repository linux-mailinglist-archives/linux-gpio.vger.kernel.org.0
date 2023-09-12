Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D94679C558
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 06:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjILEym (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 00:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjILExl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 00:53:41 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E332A1995
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:46 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso6792072a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494365; x=1695099165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo/Dhp0OB8bboTWYwPIzrc1K3kv8uwjtpXTegipdPHc=;
        b=qF7HnNVAZL97mkDnRyMiMWN+iIYqL+deXUmIJpY98pSzxYCAX/4FHlf228aZnyqAN4
         i3R8Oq7lJC0mamK7Rlwg8+tzRjHZZjBYE72Jir8DamdrB0mP5XxV/Nyv05lt6A08Qju9
         52Kpr+A1qoG2wIlAHP+hllWkzGv+VuNKhFm/LfQeT+Ufjw1d8EORVHh0L7g6OfrZdjDG
         nZIzQqMMcrsp4EZx68nLaPhhztG9WH7QkH/TsioHCfmFmBXlOAgixjKw7HsTtp495q/d
         VcPoUN8V+Oap9kYpfKF+/hDQk06y4AZXwu0AwFtybPSrH/B+mJODz9WGp70dzDOUEXgf
         dVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494365; x=1695099165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jo/Dhp0OB8bboTWYwPIzrc1K3kv8uwjtpXTegipdPHc=;
        b=nvMiPwfnZNPpQfYcWk77JEKJF30Q70Yn+GRj0gLIeXaOy2lapo4m3R70Fzyp7ITX1F
         iMSUiTWp+EYC5CjBTU17xDAn0zEUoVWU35/EzYkp4WGWaPl5Vr2MUYHnPBxO6sus8+Pw
         NYINSM+4BRjSf4xhw5BGFEL26jrKOW/2uO36nFw6EHigGnCyrJvkwmh5p4LyMxYhlN1w
         48STY7TCRsQ7KEVIiTSQjjWUcTZPv96YMQhcMy27ZcyqfuKG24k+walQHE6TXDBrfDXJ
         WVFg6ZgdfXbQbJRLAxCxfa908tmJY2Za+DzBjeMvVkH2SmRvkdLL3QxEf2sKUnQHTBn0
         L7Kg==
X-Gm-Message-State: AOJu0YwhPIm6JxHwWXo4AxmvqA/h0VdArmiqVxoyI5y43TM7og8VjPTD
        KQeqeOA1Hi9f9nbYMPwhz8CmYw==
X-Google-Smtp-Source: AGHT+IHQ/lVkuQFDtf8qYMcsBRGgpvmpbqpXE6jLiYty7Ri7fdqkUCoAD7dGqyQevjHt4iQoJ0Z6EA==
X-Received: by 2002:a05:6402:333:b0:522:3d36:ff27 with SMTP id q19-20020a056402033300b005223d36ff27mr9729078edw.31.1694494365456;
        Mon, 11 Sep 2023 21:52:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:45 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/37] clk: renesas: rzg2l: use u32 for flag and mux_flags
Date:   Tue, 12 Sep 2023 07:51:34 +0300
Message-Id: <20230912045157.177966-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

flag and mux_flags are intended to keep bit masks. Use u32 type for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 6cee9e56acc7..0b28870a6f9d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -92,8 +92,8 @@ struct cpg_core_clk {
 	unsigned int conf;
 	const struct clk_div_table *dtable;
 	const char * const *parent_names;
-	int flag;
-	int mux_flags;
+	u32 flag;
+	u32 mux_flags;
 	int num_parents;
 };
 
-- 
2.39.2

