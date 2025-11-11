Return-Path: <linux-gpio+bounces-28369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D8C4FEDB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 22:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB21C189B78D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 21:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F1E326955;
	Tue, 11 Nov 2025 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fW2ivY1o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lqUZjOML"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB62EBDF4
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762898114; cv=none; b=nzJWU7zEPKL2yr9SURGLYI9g4q/KZvVeGje47PScMvC2394KHXDh3wJM8jokIdKAMdqrcf/MVeCV+NRM4I4/hq5LJEdwCogAo/fwCooHHWL7a0HQl4Po29YGCnxvD+JC4PABI8NmgS/DQW03mLTNwivKNiXmLl0MIsWGCVSO6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762898114; c=relaxed/simple;
	bh=r3R6gOHgJpsH0Ckzs+8Ovo1IxuCFFu4tCtcoUxTJujA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd8MzgyKdAAapgMWTYNTWHnqGUd0vHCWpQbhVWVae3Rbuc657pR/CBl2JRHhYcHX6MsI6t8BoJrlo+Jf45LUzSL4qauzuEvreuun7VkDJu1J7aMzZ1e68lpbhIUtRKfex0RrJM59chXs3nF6Yh8CjnuFgHGuyMuFK9S3CmoEJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fW2ivY1o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lqUZjOML; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=;
	b=fW2ivY1o7ECWkZEaC38GMKhM1Hh408JaKcLfjiIrc0ifPnMvKXbPzzHFc8Xq09ODKa4cKT
	yuopOOzJKi7YYZwQcb1G2TmP4+NJtSaVw58zp8pBcB6OH0IAa/URgfHQuzIu3WCD5Er//T
	kwVP+nbEVRNVBvn5lvcYFEpanZhRd/E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-vvwvFV6QM5Snw_g1zb7pxA-1; Tue, 11 Nov 2025 16:55:11 -0500
X-MC-Unique: vvwvFV6QM5Snw_g1zb7pxA-1
X-Mimecast-MFC-AGG-ID: vvwvFV6QM5Snw_g1zb7pxA_1762898111
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so27697985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 13:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762898111; x=1763502911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=;
        b=lqUZjOMLTrBjuYuHvg3x/2myWGYPSWGTBESNCnYcYzmSmVZ/SJ0vdYOAI5hKUtiUKP
         2n3wnEpHhHtf4geprmrkRgt5aHrtyi2rwXb7xh4bxXspvP4iJDVSjKKJuobjkzkipmvY
         sekEaOEGpwD2duGOSN1XgzUZ+X7UVayAhius8YdmpAk/lI1AOBj8JnxgTTrP72KgSljd
         +inr0sHLeCXSREpYEU6s+7eKZazbjvVFJSQytJtMMPlNF/td5tu0p+vdB93hutj/wblM
         XLN/PAWGLKRFxX6kP+B+KMbxR2t4asCgwh9ebSO0A/QT3UDA3+FmPdijVsxV4HyCm84/
         YJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898111; x=1763502911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=;
        b=Fd9giw2cVT9CyIc0OlTtkvPvBNlX2UiLSaKYi8bESjjh0y1Cqbr7v8iJadUjDUtMAg
         ol8wib2i018X5JD5Ou1ugme0vz95KLywfQKLXgTnEj35Lmd9HdNxzcki/SkMWgkCGcRm
         cttapJ5EBw89vtHfM8etu5jLU+HLN8fOpcuC/QdbFp9bV3w3MsxGRSAmKW+zePG7vKa6
         33xpMmaG4wYtMOb+06KgccR3NtKehkJOdnwSCP0Eph2XqollQdxU96JIa3KPDBlXpyZ0
         A+iZ8E+W69N9lI2irtS7VoK0Tpl4EjPSnjzotnPdJj0KAqbbS3+NJGSNGtK5l81WLN7P
         vILg==
X-Gm-Message-State: AOJu0YwuT5FsPyH/Rr+vE4WWymbTr8jeOG4EJtJtdkL1VgVFIKkt1kB/
	LhqLoMeO/7KbKy3CZvdVsrbRcXvLin77GXIg3JAbHoqu24WIEUw+fRfYgm81B3VByVx2hGgp96q
	cEpw/og7Yk/KzJs6Zf7QWo4spe/RcIc8YgAjpTsJnN8oU4xM24+qzk/EHhL3r4+w=
X-Gm-Gg: ASbGncsMD7P+SqPg+/KYHPqOAEH1lrPQtyfUXQlgbCvEy3xfCutTfOOJq1E4XEVPX9j
	WKBl7nKE0gAuYNOJCzj1e4fM0rMdifGbu2gltxriHBBS5LpD98qDhXJKhLsJgZTq1sptJBFCRa0
	kCVlBMltQC/tTgPUXFfbVtioemXTtQXShFX2lUJM4bwsMKd/T/8GxrhUr5i8nqZVNGis0P/KhQb
	qR4eWPSRymL+8yP/HfLT6SxI4OX6cXb919d16GNmOWD8YVh2Kj8af2MX2OD7D/FnR9xaUcEGPP5
	IW33CP4RL7HO/OqNdUMQT6Zll92HUAmAwMjIVmbhxvxN8W8Vva2B3njwJzYGw5jJ/s7LQsZOw9x
	4WQJowDj3eemVHvIKxQ411LvGYzeszRc=
X-Received: by 2002:a05:620a:170c:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b29b815efbmr102326185a.72.1762898110772;
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVx5pK69Ag3154vIr3OiRkF4L8ppHUN7DwLvrxWK4PbbHtrMDcLkZR/pYDsWLScGfqh5YaAg==
X-Received: by 2002:a05:620a:170c:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b29b815efbmr102324085a.72.1762898110299;
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 11 Nov 2025 13:54:11 -0800
Subject: [PATCH 1/2] pinctrl: s32cc: fix uninitialized memory in
 s32_pinctrl_desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-1-071b3485b776@redhat.com>
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=3179;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=r3R6gOHgJpsH0Ckzs+8Ovo1IxuCFFu4tCtcoUxTJujA=;
 b=/a2DmQFQikGB8tMbS1LUwfOT0vMnQIkNOhWStWMNd+63yndO7bdcP3v8AKVc3H81zPQRXNv07
 e1klwEJpmB3DVdhiEREEVNIyvIhIsr774lihmh7uHYh8ICoCmIKxvsw
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

s32_pinctrl_desc is allocated with devm_kmalloc(), but not all of its
fields are initialized. Notably, num_custom_params is used in
pinconf_generic_parse_dt_config(), resulting in intermittent allocation
errors, such as the following splat when probing i2c-imx:

        WARNING: CPU: 0 PID: 176 at mm/page_alloc.c:4795 __alloc_pages_noprof+0x290/0x300
        [...]
        Hardware name: NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3) (DT)
        [...]
        Call trace:
         __alloc_pages_noprof+0x290/0x300 (P)
         ___kmalloc_large_node+0x84/0x168
         __kmalloc_large_node_noprof+0x34/0x120
         __kmalloc_noprof+0x2ac/0x378
         pinconf_generic_parse_dt_config+0x68/0x1a0
         s32_dt_node_to_map+0x104/0x248
         dt_to_map_one_config+0x154/0x1d8
         pinctrl_dt_to_map+0x12c/0x280
         create_pinctrl+0x6c/0x270
         pinctrl_get+0xc0/0x170
         devm_pinctrl_get+0x50/0xa0
         pinctrl_bind_pins+0x60/0x2a0
         really_probe+0x60/0x3a0
        [...]
         __platform_driver_register+0x2c/0x40
         i2c_adap_imx_init+0x28/0xff8 [i2c_imx]
        [...]

This results in later parse failures that can cause issues in dependent
drivers:

        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0-pins/i2c0-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0-pins/i2c0-grp0: could not parse node property
        [...]
        pca953x 0-0022: failed writing register: -6
        i2c i2c-0: IMX I2C adapter registered
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2-pins/i2c2-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2-pins/i2c2-grp0: could not parse node property
        i2c i2c-1: IMX I2C adapter registered
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4-pins/i2c4-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4-pins/i2c4-grp0: could not parse node property
        i2c i2c-2: IMX I2C adapter registered

Fix this by initializing s32_pinctrl_desc with devm_kzalloc() instead of
devm_kmalloc() in s32_pinctrl_probe(), which sets the previously
uninitialized fields to zero.

Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 501eb296c76050aa05386c51ef6ae0f97d4c76c3..51ecb8d0fb7e8a203e10cbe965dfec308eaa5f30 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -951,7 +951,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	spin_lock_init(&ipctl->gpio_configs_lock);
 
 	s32_pinctrl_desc =
-		devm_kmalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
+		devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
 	if (!s32_pinctrl_desc)
 		return -ENOMEM;
 

-- 
2.51.1


