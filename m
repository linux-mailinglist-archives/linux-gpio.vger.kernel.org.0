Return-Path: <linux-gpio+bounces-8450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAB5940F1D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 12:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A8A91F23BD4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 10:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289B19DFAB;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpjpVRlZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FF19B584;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335171; cv=none; b=p0CsiDM0o8fb3K4K0ymaeHFY5korl2JSyBlVOGJSo07VV1mkJpYMjFPsQg8Fj7nKTZqY7gIJ+TwHzmFc09YQjCSlAlswGr/M2aa6MopV5rgfu8eD7zD/Wpd/YAyjZKRkOJJNPUaHF3xlg2XtQQAZ3usKkG+InYzlNj7maetXwkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335171; c=relaxed/simple;
	bh=0d4cLa1Ic0Cl8c4k7lLoTR7z9RYXhTtJPGblfCY7fmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWl17cIY3VdMT5krHpbIX7eCLQjbGTz9iKzcEH85TQjplNjfS3YYTL3y6vsymLjbvy/WaW0Ps3uN0awXcL5dkpWcCNcuxhxpD1I4NdKA3g7VkntjZIzk/BdsLRMPiO43rpIdTa+K5qKpBpIMOe9uGqp6CnC42+pZgX5ZFHwg/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpjpVRlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05553C4AF1D;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335171;
	bh=0d4cLa1Ic0Cl8c4k7lLoTR7z9RYXhTtJPGblfCY7fmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mpjpVRlZXRop/445ykUNovxlhgtsY6jwRuom1qF3JKAz9HzG9KEU2h7lW0mODTZwY
	 tkoqBzVdNbBsXN8A30Zc0n2AWQ63iza7Kyyw5BOYge2uddHGc+21rcnt+cqMripxh/
	 k4Gzlcxdo3f5eEi2Ce7FolltndD+s+cnRb1o7HcuEk3a+r0H1D0dSXTrSqw/r0UpIK
	 X0WwWGdyicK8smf5284Mk5wQ1y3gMYh0KIzmdcm8t/piMLaPtAPO1NRk+BtgCQEMsH
	 mzi+Bn15axZ2dEZRPsLoeltERfEzvGn4W7jt+8i8Bln7gGFHMc9TFN2P1RACfabghC
	 RTUzXdnuieckw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0BBC49EA1;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 30 Jul 2024 12:25:11 +0200
Subject: [PATCH v11 03/12] pinctrl: single: add marvell,pxa1908-padconf
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-pxa1908-lkml-v11-3-21dbb3e28793@skole.hr>
References: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
In-Reply-To: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=nYweYn5B7a8N7bBvBLtJmhM3QSMoorGx+lcXKMQV7l4=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkr9m9eP3WLv5jdTY/XV//s5Fhl/Ccwfv83q3u1UeXHv
 z1327/hTUcpC4MYF4OsmCJL7n/Ha7yfRbZuz15mADOHlQlkCAMXpwBMpCqA4b+/tkfBubsKvQL1
 /Ru897LV2Gdz9jpe9Di27tIKFf+L3pcZ/un5dUzct3XLwthreTbRDEu55jAc+3v4aadVyrrKqGC
 hDRwA
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
index 4c6bfabb6bd7..45166d479c70 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1963,6 +1963,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.45.2



