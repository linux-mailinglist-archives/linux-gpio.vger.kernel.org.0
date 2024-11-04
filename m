Return-Path: <linux-gpio+bounces-12539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA89BBAD3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9501F224D5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2228B1C9DDF;
	Mon,  4 Nov 2024 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k68XYjDb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A91C4A25;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=Z0OhG2bNp7GmkWoX091MPE73kDS4zPvdFWigBRQIxThkdZSM6qH6ry8SLgGG8asqKFY3/5GkjkxQd4axYOIh5vovk+EUhMn3NFVZd6egy2JQagagGPogMMSmCeCoPppoAqRpo7yzWcazWvdWA4dQ38ydyL3VRWIhZQX0JIHs6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=UMe44SSGbxhvzX4jeOcKKSNW9zaCmr6U1GFWa0G93eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLdL8YbgsLu8dCRf7en8Zvok7krTBbEWru/eUVnbf7aNJJFDsy/j5LvmBZFK754FeLFWeSIWInzr2/2lWp3KEiqlvZCZ1YaYXMGENBDyd8KsWv7+KPJ7LFvn3YRLl3gCAyXgy+wSwYBg0hJQ3Y4hQdAb1JlBYt3np+mEws30RIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k68XYjDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B143C4CED6;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=UMe44SSGbxhvzX4jeOcKKSNW9zaCmr6U1GFWa0G93eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k68XYjDbtYNqlmY4BSjRwIdg2n9zv+pFT+hxR0fYrYo9j8IMORa3QH4r46UI1hQH4
	 UwCa9hHfsPD3YayikgYrHcQXRlVcq70ifyx+TzVb8LoLRDNg4RbS078zPs5wzdW/Vh
	 N6j4CuyN9j0V9M7NkGZb1F5eEGmI3wLwJgm3vyGbICWghCZ3ts0/1Xcn3MO9buMWsG
	 FCBwEVpdWaWXRau2v1H36GwLPFhMT/86IFN1n3SvCAuf6QIH2ETsRWouKrxsDdeZyK
	 Ah9BjioOTv7T8tG/fjWujTzmXD0ot9fT4Q8fC+lROHqHKndYuyqz8k+baeWcljs91U
	 RLfqcOZvhGU7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63256D1BDC9;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:12 +0100
Subject: [PATCH RESEND v13 10/12] arm64: Kconfig.platforms: Add config for
 Marvell PXA1908 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-10-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=9BOboJTIiKhhMTUkI5ZynecKLlq2BOPQ3r3XpGUGkAE=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0M3mRsFMbdUP3oVp+Ks94cnLtqf4arNccmJC9W4r
 Cbf6GjvKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIm8lWFk6OR4VuZkd4KZd2J6
 gjyPlfFDtYz+anXZwPkaOQ8ETMU7GP5nLjzQpP3Rd/H5rP15z7/pTA87v3XH5Osv+9xMLp2YVf+
 WHQA=
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42ec6e878db8d355c17994c2500d7b..6cb21a27844718d8dfbdc49cc764a6ca39296484 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -175,6 +175,14 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+config ARCH_MMP
+	bool "Marvell MMP SoC Family"
+	select PINCTRL
+	select PINCTRL_SINGLE
+	help
+	  This enables support for Marvell MMP SoC family, currently
+	  supporting PXA1908 aka IAP140.
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON

-- 
2.47.0



