Return-Path: <linux-gpio+bounces-16066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115DA36E6A
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 14:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B993B0A57
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDC01C6FE1;
	Sat, 15 Feb 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="imVYqRTM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC791C701F
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739625161; cv=none; b=ovaEfMXXkFghGRR1I7VwPKq8eAzrbZ2+er/Y366FbjoOH16GQJhPnytxdDNpcj2WAR6v25striE6GdMICFbZuG31UHIhNeGD/1WhHaX6J/FMqADegTj0o8qppsIGUlgyyuHAgCZWop5ZUfN9RAsL2JF6YAMtX9xKOnHcupV/GMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739625161; c=relaxed/simple;
	bh=kqJhfXI+i5MZlzlpH0kJljCFi2elURZJY0oYoLVGE3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4rlgMG++dwKUMvXP3dau1WJfGSyLUlDaxriVCXoDC+ge9b9FmGIlJOmy5C78XdiI6KHRZ+mINxjYKQ5jrUq6bGcxKV7oSjN7oOMCS6ku3fylgty4Jsakj5Za70vUNDMvhmHTpW3l5UP1mz08sWz1AdUBHM+jhR49PpYxH7I/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=imVYqRTM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so795112966b.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 05:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739625158; x=1740229958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+v/olVdsNjQIMDpCltiAzjI2f/hzh2HRF4DFpt5Fqo=;
        b=imVYqRTMA0rIzrydAiNEWiefpuq22JBt/svuZKlnJ057iC2L53yfhk13g+HtQ5GPm0
         lrqghby0kM+OZZ6MRD+NcOqwwoCstcGFAj6wYfPFau820PR0b7lKI4fEYHIwqjrooltc
         iP6P23szwbsNgKNU9h0uxv7r9KIMjfnk/rcxGPKiGmn5EWeaoTHxYYOWl9JSW53p02Y9
         +XmCNfPi766DajUd097vRbrvMmjyDBfi/TbZEGBwU1Ock26A/2Epax/GZB63R5YjI53L
         xX2dZgyUP4iD0VAwxMZXAvwldWzXfbSUfBLwQwPGyfcpz0bxU77Q/7ZIGey5HEmflnqe
         T/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739625158; x=1740229958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+v/olVdsNjQIMDpCltiAzjI2f/hzh2HRF4DFpt5Fqo=;
        b=CW2y+Mwx89bx5yvAHtxNnF45sSYAJ4SsZmFfHNEeT9TUgNNBrLSP3qm+Sfb302ejT0
         AFnampXUbBFneWjmf3KX2nYlbseaQ7Jq4iu9aRDggcMkW4I2Fty55iqCKqzHXZph9661
         Nm5NgFxPemi3hAYTH7aPzlb3nqBr4/7J7tu1SYqQ5PL9zgG42AA/XIWfSAi6/8PvN7YB
         3P1nrjIZllNdUzewpb88zPqjF/34hF0wp4GNdz6bk1tCfD8xe7ACqkqVjVrtoac9aofB
         HGHEjV4u34MLuwOKS4+iXPdeSZgd1ksTX41/vQuD3NcPq2Cb14N1m9V5MstxcnsGUo7/
         i0RA==
X-Forwarded-Encrypted: i=1; AJvYcCWOebhEZAmC6R5Rc2vN7SaPj7cpd7oB+2MIFlRAOJUdqqADoIGDlCkqz3Ss4mOkebbUnbnPHPm5FBD9@vger.kernel.org
X-Gm-Message-State: AOJu0YyslM+C0GWH0glN3NGy1Gw4cV3I+iPc2ZdYSaOxM+2hR9xVI6tX
	AhQh4fw/ZJapG0vIC+NezAJETUUOnOcYF54CeAq4RZXZHxzWgSW1RulrD7gSNIg=
X-Gm-Gg: ASbGncvURAeIvLNKfFx54MEPzsceDaInwzY/3hnY+ZtIbJilKnHJkrHerS8OxcN2xkc
	mBGVu5fk1KmwQMx6qIKerSw5YIm9h+4f1n8+yi2ds99s62+OC+4D0V9hAaoYdAsGjw6AXRaV1iT
	UT3Qcli3gwEWB5fm/kbEeOGFSH/7qfRqfbFwbArcCda+anQ8CRSghCzNJFg8PgGOKjG4tvlshUE
	hWxS6zIErh/fYyQxHTt01bav5lAMOio1QwuD/kDGLjzHSmIvM3rW237LLMVAVdvm4wkUepR7QbY
	Holp2uE/5WwNZNoMyaXE/3GPn1kVefESPQsy85EKa0cfMg==
X-Google-Smtp-Source: AGHT+IHGlrrgVz5JEinVT+JSgLk0BgO7y0QXdyl23G+Z1dOq1A3nA6LJrZK0R2Q+k2rxgykw6+EBqg==
X-Received: by 2002:a17:906:6a0c:b0:ab7:d34a:8f83 with SMTP id a640c23a62f3a-abb70ab8b5emr267680566b.17.1739625158403;
        Sat, 15 Feb 2025 05:12:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb837378e7sm39289266b.52.2025.02.15.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:12:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Suppress binding attributes
Date: Sat, 15 Feb 2025 15:12:35 +0200
Message-ID: <20250215131235.228274-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Suppress binding attributes for the rzg2l pinctrl driver, as it is an
essential block for Renesas SoCs. Unbinding the driver leads to warnings
from __device_links_no_driver() and can eventually render the system
inaccessible.

Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ce4a07a3df49..5f006a059d9c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3386,6 +3386,7 @@ static struct platform_driver rzg2l_pinctrl_driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rzg2l_pinctrl_of_table),
 		.pm = pm_sleep_ptr(&rzg2l_pinctrl_pm_ops),
+		.suppress_bind_attrs = true,
 	},
 	.probe = rzg2l_pinctrl_probe,
 };
-- 
2.43.0


