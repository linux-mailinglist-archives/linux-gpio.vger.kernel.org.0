Return-Path: <linux-gpio+bounces-10652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374F98C065
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E957D283CFC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920521CB31E;
	Tue,  1 Oct 2024 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwuzeeUy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A781C9EC1;
	Tue,  1 Oct 2024 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793569; cv=none; b=Ix3I2deAMF4DDiZClYb6UFqlsdHkjjuhsudNmkSJdXmXJuKJbVcxMIfZkewWAa9G6pfDyzpz1LsPPVQMdlzZ7PH+ssPX/Ya9bcXWkwJLYd7GNV9LXXklrYZgHTqMa9N+uiNnvytILmL45VkTmDy4Cdk6Aygtn32NtmU4NcXmk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793569; c=relaxed/simple;
	bh=3iaks47VA7YIYeI4K3z6IZmU482+e7YfqzFTtW8P05Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ml0PIbkKddt//kElLbeFf2Przx21PB/11YrHiI9oVoppHtXGpouUkxSsS9PlsIKOHLpyYkkxwOG8eOg2cIIuxt+XSMSxEr2upApcKv4wZfkzrmub+Ni712pbf68pJ2sZDWsD/AEw7f35Osm5nMYtxc0pLWnNxSkwDlzTdse/kxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwuzeeUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F02E8C4DDFA;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727793569;
	bh=3iaks47VA7YIYeI4K3z6IZmU482+e7YfqzFTtW8P05Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZwuzeeUytyGaUkIgB0SXSKN1SgKFHw8KpkmIvTcF7EizSVlzrTG/8OKrRX4U9lXO9
	 wHq+PHnaNyCVs33jcOOIfPMDm1e6fcuKh+MRervTiGOJN9eI2mVIGrrtCkXjNTpXsj
	 qiup1x/UUGjuoKWKpZxZYzydHFrM9jdaVcmE6/DViztOqiaL1kP5nXYqs9Kh5+GA0U
	 bIow7t/yes7WnshPKeQuHmEb1jk7uLi+FnPDT/seU6OLYE5BIrGyfGuzqEBP1ZDYrU
	 DWveY+59+e8GcB4VjLK6SvPKj3XVnOuK+6vA6mAc6mXvMXcE8FiNIccUH1LytRWONq
	 q2QYCPJpdStFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E35CEACD5;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 01 Oct 2024 16:37:42 +0200
Subject: [PATCH v13 12/12] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241001-pxa1908-lkml-v13-12-6b9a7f64f9ae@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=l+xZKLnv6u5DO/ZJ2tEjb9sysdQzHXNYhZXbgNuCkVo=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGl/OCdn5WVtsnfIcDh19SmvJ0fQIhO7lb5zHTLmLEmo/
 37PqGJuRykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAExk521Ghu545c6GVSyPEufV
 PWHQUlKWl95rdX+f8T7L0MnyVUcKuBkZPi1b0XJ+0507F29M48+eK/7QpXWp3nntN7pnn27c2zO
 xhBEA
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
index c27f3190737f8b85779bde5489639c8b899f4fd8..8d50cb7457924e3290810eaf7d3c4b145d988ede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2593,6 +2593,15 @@ F:	drivers/irqchip/irq-mvebu-*
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
2.46.2



