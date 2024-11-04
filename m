Return-Path: <linux-gpio+bounces-12533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE059BBABF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE3A1C21886
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F31C4A3C;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M04hrsRD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE561C32E4;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=qx0JqHnpzDnEzzsgR11ruIvr358JhT6Tjxbvw7Nob5+ppXanXoJd9TxPZBp6EWQPscA0Gyg/wFy5oWTBVEn6VUUfSt/nt2xBHEUw7hmCH11zRMX+pi+/lcz5wJAYoNbwfAyvTbBTLp7SIKZVwXKsNRkGLJ4gjPUpn7HY6A8IVPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=YICiW+H5ges0Zt1A6ZAOIXQVNom+kV/AcetM6wpgJxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piF6TZkxf5yFVTRjDFLRDP8xlgxzwidiDs5xqY0xIQrWGFfvt1mYVpTpDx+BNmtMiIOuYBp49VcKXa/2n6jQxtube8gxOud+KNNQxsMXj/7WvhUeYHaxdeutXxuR4/LEae+iqYe2LrHdDKpd9/Y5pAejsY8DFqfP745ZCs3lva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M04hrsRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C0AC4CED5;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=YICiW+H5ges0Zt1A6ZAOIXQVNom+kV/AcetM6wpgJxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M04hrsRD/r7fYwaEGkAyCrrKjkWM5HCKY8dgRAFlz5ZlcWQfWcPZLx5Q0PdqJj+FX
	 JrQQYQDjA7Cn3ygRoJJ6u9WbuqV2mIdJW3bkr2GvyEXIcyM5WsbGkzfaYo2utVY8zx
	 d3GGmdxhn4zR/bSV+Jm1WX5YoJqYCXB8+7aJFRKmRsQmxABd7T52T1u64uTkKoDIzt
	 CAEs42gqHjHz25kRvEE36IqEH4B22Lcs/ZyGkzXU4UlTqyne6emNolzOQP1AcSbNcZ
	 Xt+7u+PkdS6Lb8q1JGZuKZXkMO1w3zCoAhPGsfBfD57+M28s9Um8K60D5MLPG1dwzs
	 wdF5tiCTG4AJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC901D1BDC7;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:05 +0100
Subject: [PATCH RESEND v13 03/12] pinctrl: single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-3-e050609b8d6c@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=zNLT4eYVU4IQW3YAMv9pyNanuX3GGm7TmhL83Z8nYzw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0MUVy5hXunjErSWbYvbuvTvW6/sTTOtSFg6P81eX
 cfj3I2HHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCR7+IM/ytmxxilvtt3qvf4
 1B4lg7LwN/9mm2qnhZY6ndtdxqZfns3IsL5NZdKVbXJspv2JZp3K7otDSyoaw9RmGRbuWlq4QPY
 eOwA=
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
2.47.0



