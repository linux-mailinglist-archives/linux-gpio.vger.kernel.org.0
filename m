Return-Path: <linux-gpio+bounces-31274-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NUzEnM0e2lJCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31274-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9600AE877
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83CF3065427
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890E433F8CE;
	Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJOJyoxs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33DF22A7E4
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681816; cv=none; b=oCZbDcASIOpuj3tiWORrLNypZkXgCCYclFXNWcNzC5BsqssIxWc3RFzeXu6QZiirNfWUsxF0tgxepmqxXXxpkciPWCe8tzaFB8T7gAH/VMfJTZm1wWVKftvVlO0LP4EqQV4Qp7IiiY5vyCqi0DXTgtw47QSMzUH76FwG3IURFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681816; c=relaxed/simple;
	bh=xzApL+tOXmpVuGXhCiWBafOpCmGl0cWaKQ4hIdAkSwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PR2Z3KSRLvmphFsJHJbozVdF4dpyp2Ix4gMlOHua9CBWf1UHjDyoKLBrFJmsbalZW8QceMPGL7ouMcmgYDxVhEYdM0GEbrNNyqmWGMU1Y41Q/p8w33Zftwm3YdmJ8WnBH9jfDoqxAIftULPWG82mwOl5IEpQjcjF6PraHymqnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJOJyoxs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso7376995e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681812; x=1770286612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=aJOJyoxsaumfNQoYOMDimO87mdcv49z5hJjABdfv+Uq++8aGawjJM7Z9INklypRG3E
         Os+66IadrlTDCMWRX9m332TLqlLjSmJqmkcXMru1fNwxVWgVTvVvwnOvRHXhyUGpZRDY
         daGsw6qxp6WgJ8oKzqNDEmfg4DplNg9wuEAqBtaw/ja7DczomxICzY3EkSDnJJ0gJoYB
         GwBwG/xswV4xFobd92ED2WtxFcNTgsxnfwLJb2WVtiYpWpoOf3TxPObbdn8AddnOxlJ3
         Z3Atpskm/BNALCPg+2bBnbfkKFvhCmF0cBk6b8DVs5jmLWob3jTkC0kfKq7nLroN1tag
         XawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681812; x=1770286612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLDqQlTrMND5cjb5pp+RmbUOuIdXjH56f5dfNu8LRdI=;
        b=S38xWhD1fMyG/H6cqZRRDDzoJ6l0Dfk+c/vil0jvO9ervtAaRV+4o00coeAvLeCJpF
         UVxrYLrVmtJALFKqFn990aPhHqtt2BfPZ0hIOhkvSYkpWfZi/K4M85lRllhKzskRH5XM
         5OvcSWkQ8ZyuPUOLPeZ61dQwXMvN3gfIVwFsZhukva1zSnC8RcopWXW6YvyqkALlp0Ws
         coPzn1d0kwr3seN4pi1q9Bl5wGqd2/8sMxgCarjjh5NqITyZfK6ND/l941s472dzgMCE
         S3SXMRhahOa98rfMpjpFjHNrj6QtHtkL3LliUDLYLxu+gJl9KI9hgVqsVb9aQAqmQWg0
         /oXw==
X-Forwarded-Encrypted: i=1; AJvYcCWIfSQqbU3M3kRUAlR11S9Mg6ff9sEq+yo7TfA8s6PPZszN0GvsJaIuytFwYyuXXt6T7+0hKbhV6qxf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3X8Mn2m1WmxvS1m8yEhnNLdDarxJVlqNxnHrN6D9M7Es9ZoI
	aUzFWbXfWfL/0D5gXv0hrdE6dFbq/FfK+igTsv0KWG2NcyMVfHVM/X+m
X-Gm-Gg: AZuq6aKAxNcO+a9ML+cxQQTxB3qCg2BR79Uo6w3lsMKtWnOTjly6ezFIAyKPtyEnMM+
	Ns5NSuc6BUvbiz0DWaaek+DPAkGrNKv0qLkPCUcQk5e+6mlGriasK3r5ZA4tPqajw8Zqhldz+5+
	pI7LdUMHcj3VEPtVa7vDj0el5ew0cNJsERgslUZLE07xYM+H+dt7LWh7RfzSwlJaR85TjWC107B
	rpaKhgtlnMSY/y5ZKMYOZjCrtPK0JhvADFrIqD1kDOnknZC0vYQsssgfTJPf5C7zo9bvSLt5mri
	WjO1R9AFPEoEW8XC/RFBxDDmooo9f9nr5lNSYMCWve6l/lWUWHuA6s3dnATrGxoqi5lDifR68Jo
	aUxKQ43uOwBq6yQAZYpO8etrzOCFcqVvnJ/sytYxBzXZT7tsg3JngxnzozkjZ+XZ2ReCOlNhQWL
	rVIkznInaW62myaW20+sA0Sl3mrSA=
X-Received: by 2002:a05:600c:458a:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-48069c0fdafmr92534445e9.4.1769681812375;
        Thu, 29 Jan 2026 02:16:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 3/9] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Thu, 29 Jan 2026 10:16:38 +0000
Message-ID: <e6794ded22213e2244f0d2be060df791860f7c5b.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31274-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: D9600AE877
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index e74bab2df29a..4d1b9c8c524f 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -221,6 +222,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -232,6 +235,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0


