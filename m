Return-Path: <linux-gpio+bounces-10642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB298C078
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37F3CB2A26F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CD31C9B7F;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkCPnvWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020C1C8FCE;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793568; cv=none; b=k38VCG0ZL5VFroqlTxb4ENn1eivryUzb/S3SubIARMOlvwX1yUVtX6/0mv/RFzWSGJmDRyiuPaHzM5267B2WiIuE7bLvr0SM/6VgNqdbhuyDOYbEi7ryViJVqdBFLbzGM3xJZNpDlq7sQNLFdSsXtSFc6FS5qGQY+1hDxGqrGeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793568; c=relaxed/simple;
	bh=waEIGljs+kpXr7H6X7w1X9tSVRKCK5G7Rv5oX7oaIWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwEHj8DP5BTI/lV39/e7O9xBjGYw5IdWOjTJIQ03jutfegfUa87J7QSB1618rEuqW+Kcjm4NRO4Y8t9PIOyxyFvQMrtgxlqRetFqPaYgPjYL1/2WzQMHJhrcLIPdkek++o2dk5s4Bo2hwxx1dist6q8rQVdVdJPomCQqFkWAxnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkCPnvWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24441C4CED9;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727793568;
	bh=waEIGljs+kpXr7H6X7w1X9tSVRKCK5G7Rv5oX7oaIWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dkCPnvWNITR+Zlj+Dy0CKUybafYTdDm8UuFP3UHIrgCR+m8bpt4qvLV11UPabxOXN
	 hm29TnWSE+gEQm9wE7MLevH0WNfsgzO5n5HEF6e8ZfwbMx+cA9p95JmtyOP1pjZKZT
	 9o9SKAGsJ8D2siae06PLPqXAL320OF5BE+z5Hq7/fzstFOF9v751pP94Yv2F2y2/dU
	 gxmpTRZQn0Sod0d6inhTYfnvxz6uSvVovbvj6FeaV7HE+8k0rJwpKEGDtTn6N+L1yS
	 zRu5E7yyO2mTBPHUSgV4WbMetys6UqbYrM2BZD2ZQDjEplGNiyUHGUdtUCz1QRn8rB
	 6Z4Hzl1J2pn4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180F5CEACD2;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 01 Oct 2024 16:37:33 +0200
Subject: [PATCH v13 03/12] pinctrl: single: add marvell,pxa1908-padconf
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241001-pxa1908-lkml-v13-3-6b9a7f64f9ae@skole.hr>
References: <20241001-pxa1908-lkml-v13-0-6b9a7f64f9ae@skole.hr>
In-Reply-To: <20241001-pxa1908-lkml-v13-0-6b9a7f64f9ae@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=wmllmkXuy52PZE0mmFVA4U83iFJjDnJw2/MynI3ODOQ=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGl/OCfdMvizNOeYzcdZO07nZccd2P37ePn5bY/elAY3b
 PoixDr1f0cpC4MYF4OsmCJL7n/Ha7yfRbZuz15mADOHlQlkCAMXpwBM5GoyI8OC/67Hc+yU+Gb+
 mOx1s9bd9oDZZMeyZcFCZ9b3swQZdqgw/C+eMP9D4sFmqYj3HlflK172Heaf8XNZzILY9Yfqw4W
 4jNgA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2ec599e383e4b2d463725b8baf4bb8bbcdc4c9f1..09fe7e6233f00d83de385c3a0f449bc4a709681f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1966,6 +1966,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.46.2



