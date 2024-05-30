Return-Path: <linux-gpio+bounces-6978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134B8D5163
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3D79B25359
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ED355E74;
	Thu, 30 May 2024 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhEfdUNm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B85645E;
	Thu, 30 May 2024 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090966; cv=none; b=qyrP6zNwI2YSxz1b9MIf/S0v4ux5DnXoLfba3UMJaBmWWiLmKAgYdsEtO5PmI6CTPsorzvnRT3AyD7WKRNR5UnuXpMAX6Ctpqq4kTy5U5tUCaVJ0i1RvMTwvYyBPAvWpP8d3QZobDEgf4NHexfrsRy/aD0aZy8e3/jE0z95ppyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090966; c=relaxed/simple;
	bh=3eAbKEfxVTcMI/6I9pTwIhtxQO8OZJf8Aa03p+FRuOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PtncJSBs1sHSYz6Qq0A32rwcoKuUdo+B7Zqo3L+eU8BKvn066a2TVN7AlXaoJ/0428IUMiodiaqt8fAj406HvA+JvUxcAOWYUOc7vijXdxznmiX7ol3YwlasMlf/2u+hrWVs9c0QJKIQatxmD3ihmawe3cU8N3KEaZit3kteUoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhEfdUNm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7024063f5b8so258544b3a.1;
        Thu, 30 May 2024 10:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090964; x=1717695764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8ykFvUb+nRh/+RpX+Jt37vnbk6kntRwrp6YI471X20=;
        b=LhEfdUNmTInWw9qB5maCsw1IFYIFubi966kIzxXnWKIpc8MwPGLYfStwdkeL5a/29k
         U11aCkvIp3jK4inMyL4At28Vol0PCvzf19lwPHn9qX4ptGYgt3EHRUs4UbbKy4xBMAXg
         OXDigKFPABjFq6ageNTuz976odxjWetfFs6X5gHmGaY8b1WpDoBLAS4prVZ8mDoDFyVo
         IBlIX7gmyxes2V9LKA18cb+e1dzx7CPhNDOAdFfEOj8fo2nV1uYT8isxQdArm7gh632a
         YMMcdjdhpZuBZkuSTJoDRbSjKbJEcansYywcSzhTJC9lNogLwuZuyqOeGiUPfW7TZAdG
         KPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090964; x=1717695764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8ykFvUb+nRh/+RpX+Jt37vnbk6kntRwrp6YI471X20=;
        b=NoF5dG/a0tcUQmnMCA4EnSHYmtxSy+frfprz85EvJSqkCu2oS/AXtylImK55XVFDvx
         u5pBbRBeQZ5MeVhCuAsmNdx3qY0KbsOHUxp6VXmu6eb+dLmN2NpqM3hAT3L90tXlkUp3
         4g8VrHYRvgxVC2rt+dOS6i3sx8jSO8SmQIm5ABzzOcsHy2SfdKNZznfNX5e+5QtVc1Pb
         gWzJTIQvM1sDD/s6hFEgdhx6sQQx99/UYWuvjto5GbuZZIG1QaD/nARVFJlLdY8y9KSs
         W1wRn+y9evYevatP6V5225LJcAoeDz76x8yCadSj16eKH0DNI/kHEZBOltMuEpldW9yk
         b2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT0KZndXTuWKXxecHqyvryRSwmUEJ5yIk3n8Ol5rPAlQU60uYH6ODg0vHBWraMQCZADnrW1gBLUJeiVdHkDSyQuYkfZtyMHJ2LmO0AXjYslC7cIrTR2F0hwVLiR7OPjybh4/ko1q08W35lecFoFasqQBdT7tyKGhV9cTl40kgHfg2FgHo=
X-Gm-Message-State: AOJu0YzuF6CFBKdmMXAYuRXwEfc6r1k2jjLssn2cw4UMwsKoy1hGWDV9
	BxC1DWGvgfsvdFMH1IuVjyYVz1kgzW0bHt9i0lSCrcn9JbL8xRZ4
X-Google-Smtp-Source: AGHT+IGZFcEWMKrHXeRL30DRITF9DE5Ld/uj5Ug1T/N7oLWpDaTINwWS5spN7gFqpDF/Om8izMBAfA==
X-Received: by 2002:a17:902:f391:b0:1f6:2a3b:51d with SMTP id d9443c01a7336-1f62a3b0636mr10024925ad.65.1717090964440;
        Thu, 30 May 2024 10:42:44 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 13/15] pinctrl: renesas: pinctrl-rzg2l: Add support for custom parameters
Date: Thu, 30 May 2024 18:38:55 +0100
Message-Id: <20240530173857.164073-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for passing custom params for RZ/V2H(P) SoC assign the
custom params that is being passed via struct rzg2l_pinctrl_data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Added gaurd for custom_conf_items in struct rzg2l_pinctrl_data

RFC->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ea1a08d272a1..1cbf97d416bf 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -257,6 +257,11 @@ struct rzg2l_pinctrl_data {
 	const struct rzg2l_hwcfg *hwcfg;
 	const u64 *variable_pin_cfg;
 	unsigned int n_variable_pin_cfg;
+	unsigned int num_custom_params;
+	const struct pinconf_generic_params *custom_params;
+#ifdef CONFIG_DEBUG_FS
+	const struct pin_config_item *custom_conf_items;
+#endif
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
 	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
@@ -2290,6 +2295,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 	pctrl->desc.pmxops = &rzg2l_pinctrl_pmxops;
 	pctrl->desc.confops = &rzg2l_pinctrl_confops;
 	pctrl->desc.owner = THIS_MODULE;
+	if (pctrl->data->num_custom_params) {
+		pctrl->desc.num_custom_params = pctrl->data->num_custom_params;
+		pctrl->desc.custom_params = pctrl->data->custom_params;
+#ifdef CONFIG_DEBUG_FS
+		pctrl->desc.custom_conf_items = pctrl->data->custom_conf_items;
+#endif
+	}
 
 	pins = devm_kcalloc(pctrl->dev, pctrl->desc.npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
-- 
2.34.1


