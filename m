Return-Path: <linux-gpio+bounces-18391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580BCA7ED45
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2E2423619
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64E9257AFA;
	Mon,  7 Apr 2025 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikVLWNub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5452571DD;
	Mon,  7 Apr 2025 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053413; cv=none; b=S5BEzT4z8ob2OhCfJT1qIwsy71bVX/hWnxpMTzvENnOdLJOH6lZvi/cLRdy8lW353iFmRGNnWZDxcaKWjJjv94VBlCnW6zNm3/T1eAqpuJBpDmW5amxX9LUE0xLRT8uyWfkU4e29JwcnQikVQpxvDisuTVVfswjsXVkzHdQpMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053413; c=relaxed/simple;
	bh=1zRN3vCLMOO2/SGvCnWXCNpgVoAcWNxSCBnCYtmSewc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrLViPhpr/oLJ9B+ZcS3HGVaeN8Vtr43ev1QU6wN4zDBYOcdbEjQbKKLsNO8Vwcq0PL6MY++agEzHqcf6x1aPAIEWxsHVzXBLstc94/EdIMM/8w5lY05424UwmFGFfw6IXy61iIrdmq31OvUDekbe4m1eKY5y7IyPwuk/y3nXVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikVLWNub; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4228958f8f.1;
        Mon, 07 Apr 2025 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053410; x=1744658210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpYqoXk6IuDOg/zXbeFnph7xwDpqUI/a/1N8HtCPQ0U=;
        b=ikVLWNubdXCHOy0yS7TDUu+jTjpHhlKe6tNZuhK7oIGoQM2oIGrqT1wKsDo4bUD7Ei
         cssl3+f2WyCwOiaRs6pYfpz3Z3l0JmYErib1BIc0cRO/j09nEUy0H/B8e13fOuBlxKW0
         ox/KxmXr4bLfRoS32dpXjE8cENR/jW3OkjrgvwqoHBf3YG0lwRIYvvHqhax/IWiAfa8P
         EXeXoz4OVWnRI4q+E0gs/zKnCR0SSeNKZhVdlZy1UvIudZG2rAqONElQ2Bz+jbnRxcU5
         fWcsGreFKWI4Kaqz5F6wF34tUdUlj+ODOZ4FmoEFsEKZcaSqiqq/uqUOo9NhcPw1CvQ5
         vU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053410; x=1744658210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpYqoXk6IuDOg/zXbeFnph7xwDpqUI/a/1N8HtCPQ0U=;
        b=i6maQ+oLBYvqveIc8Y9tx7ji8GmbnCTMPy+Ne9uTWU8ylTIpZne5BgXbN1RCWT0hUB
         T1hJ0WStjhViArcq81nsJKmftR2QmmPqCxe1JSvFJX/m2tf4WnciEFgtRP8gX3uuLmHp
         ttLG7+t/8IGW0dlTet7m4vd1gby5CedZJkjfkGrtwRrfPFcj6vUI+HjFqpblb5mNFTaV
         AiWZC5yxspPl784ly2p8fCzmWvg47zX+vISjCbVpHwgyg8UPVIWIxPKE4K92WwbrR6fv
         S0abuH8+zfNu+cjd/2KFpv4ffrGBEmE0RZfuFUuHOCqzoB5CuYdRsSnOyjFU2kDgIy9/
         mXzg==
X-Forwarded-Encrypted: i=1; AJvYcCUG/5fHioWRmVxPZhRLb1KtCRCZxhgJm1HkNTEBbN7QXYoTMCOLN56CqB1hD7M2VHnqeln7yw+c1m+w4gex@vger.kernel.org, AJvYcCVi+3N6i/fVDq/+MJhTuJuTjc4SV5tVQwCFMl9fVnC8crDvVQgmwCaKMoWForycuN6xrBgkpNHZea+Hx7sx@vger.kernel.org, AJvYcCVt23QwarRkAAIsPUr8r32qNaie+y1vaI3H6mj/QrZqJQNFEgwocKbiQoVUO7s9Eeba/EjcxH68u3pmCw==@vger.kernel.org, AJvYcCWHE9IIdvNGAfuGx1yG/XULgNpn0gxQTptCTmQOaM+z2EudYVBlE1x0G9ngReOSglAdmqG4rhiVjDSQ@vger.kernel.org, AJvYcCXYpdCOmPeXuhuGt5X+fkYOy6qurEi5A8VbbTgZwPk8FItkKK7PIW7rhViOztDaBTY/buauPQ40ac6i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2fUF9I6OQ7XJuh6lV0Qxy4xjKxvavaplOuQA7ojrwaaOW28qw
	qnsH6nIAudvzqDKT/4g3f7JqnQPJ9K1hqEJHQYecM1W4WXsfVsz2
X-Gm-Gg: ASbGncsxsDjda/0zeq+WJp3Z+s284Rar83wN8kRzqbuYXPR0rVI1120IS+Cg+e0Q6U6
	4TU+hVJojdd06QRv4TNJWgYfkPrSviOJ901W+ouMx8p3IRl/IfVCY7NfAu1CBsi3wKmvZl3dMXA
	uGbqeBHS1H7YsJKDXB83vQMxxR+cbHVPo9YD8R67o2x1RFeCsGT0IMNYDu7NKUNQkCrQiw7p1XW
	RH/MxRklul3iC7PPslSmSBUPCcL/+7qi7OfLeIJloL50GQDnL4KjskbhfyzR67OHjeHxd+JzEcr
	OQ2mw6XkBtoJ4X0daakVmo7RIDqha4eP/yYKn5fihtoNu6Rbd3GO6WtOx2Pw5iWRKuYTPw==
X-Google-Smtp-Source: AGHT+IErY90dw/S3ClOSO4Gkb90/SruZZI17p03A7DwI2m7j9ZwbBxkGIa4FTvE7Q2FhuBGc2AW50A==
X-Received: by 2002:a05:6000:2285:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39d0de17c21mr10544641f8f.18.1744053409683;
        Mon, 07 Apr 2025 12:16:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 07/12] clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
Date: Mon,  7 Apr 2025 20:16:23 +0100
Message-ID: <20250407191628.323613-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the compatible entries in `rzv2h_cpg_match[]` to follow a
numerical sequence based on the SoC part numbers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes in the code.
---
 drivers/clk/renesas/rzv2h-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3b4f520df627..37fca3b6bde7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1363,17 +1363,17 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
-#ifdef CONFIG_CLK_R9A09G057
-	{
-		.compatible = "renesas,r9a09g057-cpg",
-		.data = &r9a09g057_cpg_info,
-	},
-#endif
 #ifdef CONFIG_CLK_R9A09G047
 	{
 		.compatible = "renesas,r9a09g047-cpg",
 		.data = &r9a09g047_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G057
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
-- 
2.49.0


