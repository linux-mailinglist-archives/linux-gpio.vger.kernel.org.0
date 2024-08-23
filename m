Return-Path: <linux-gpio+bounces-9103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E694295D832
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 22:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5281F23C19
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 20:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8BF1C8FBE;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvBQSMqU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A61C8255;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446540; cv=none; b=f7v3U+RgozUIKiSJvbkAB5Wo8ZVyJCS5wk6FL8LMHFQnrNO1eHY8q8DyZjDNHI61Oz9dI0bcz0vEqfOUCiX8Q0UpanyZlje0WyxpnO3e2qVL5/PRllRLgvOnWObpyeJ9b0OHotvaSMV22IiwbP6U28S+N1LrNB3fiAEo1/6Bv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446540; c=relaxed/simple;
	bh=Q3+HmYt/G3Au0niSNa/DgxrSc5e1rXQMjT5sZsxkC6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qi72sruBA1ryWecxbaRyRiqXHar54Vah0OJIomGCFGh7N+SQ6WKRQ5SP3Rj1vg/R5V0ME5OCivOnEpExzeN1o49WTAgMgIPTuZJuXt0K9a+NRXAkew7IzOogaS3KSj3vV+kz1uMYxK6nzytLjeo4zltPuO+N+xFYFemxuxTb+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvBQSMqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC580C4DE06;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724446539;
	bh=Q3+HmYt/G3Au0niSNa/DgxrSc5e1rXQMjT5sZsxkC6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XvBQSMqU1e7ef3C8uU+tS2nJk/ECWMx5tGp040hyDzvCwQBoLunK+w9N39JZNswI8
	 SSdDf0595/SF0it02f1TuVrXivw9KePWXfpt0WQjJugHLCIz2tf2ccKwLULN3soyMA
	 IonTfGVxUSvmqr1bEwnxC2k9gYYeUJHJsVbOeVXw8S+u0MfZcW/axJa9MRi2YfWc4Q
	 gGjZGB+y2/FhD9kkFSUpCl3AHEMTkCuCvaDsemjKLuSN2Yvn4YiWqFoJiRTSOoNSAf
	 KpwH7WuMA5g43VfJTyz1S637B6iQEE7WacemNb6MbtmS4ZQlwP+XwkYoP+cCUOSd6v
	 p6P4pS5bkLi7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4818C5472F;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 23 Aug 2024 22:54:47 +0200
Subject: [PATCH v12 12/12] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-pxa1908-lkml-v12-12-cc3ada51beb0@skole.hr>
References: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
In-Reply-To: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=GovpMCIQGsNWiqbFciJR2Sc0Ur3raxOrVfpbnASZsI0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGknvmtOrQsqVdn/eNOL6UtM38WnnF06LSylxs74TY+Zk
 /MLo0UVHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjAR5VWMDF+Fr/W0cn4+lPPI
 Uab+fHTsIt2zZgz9t86z6nFxOK0uusvwizlo+fYjB/3Zpdj5D8SaqDX/blqV+7tOwe4d256288v
 OswIA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..33752c63bd5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2481,6 +2481,15 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Marvell PXA1908 SOC support
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git https://gitlab.com/LegoLivesMatter/linux
+F:	arch/arm64/boot/dts/marvell/pxa1908*
+F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	include/dt-bindings/clock/marvell,pxa1908.h
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.46.0



