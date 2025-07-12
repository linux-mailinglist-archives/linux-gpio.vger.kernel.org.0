Return-Path: <linux-gpio+bounces-23187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CECB029D5
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 09:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92BCE1C278BE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 07:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2088A221FD6;
	Sat, 12 Jul 2025 07:56:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14CF22157F;
	Sat, 12 Jul 2025 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752306999; cv=none; b=PatrxWpDURBvFIH74kl6/5E4tMo5dvOPf/8/Qq1vssn2anyZrBCaHh8nQe7r9Ewk0+tUrN111UBB5UTdmZTJenAjDd8RZvAlrVjkooi2XXmvJ47TecdPzYREmRjuLqgVYIfICJrOiXHnXStp+8C4IMVG0pGzm0iDPCPet8/9Cs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752306999; c=relaxed/simple;
	bh=7wHymPi2HgZwOBvMcicCjN/OXg2OsZeXNkNKj8/YgJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RMxDnzfqLjpEJWXILo3G5b1Nxr4Fu+/QlVkogPU1U19839tOVTqjg3+QlGCIr+4/ApUIxHI7R3jbrc+ES8AC1nEotHyqKeApe2FyHX5vrva/Ag31qeiLWfiG89dabsyJXYaBI7OZ1cryZWipY8R/JqSKm4EtbkRjLhzIraCL3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B0C4CEEF;
	Sat, 12 Jul 2025 07:56:38 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B0B945F939;
	Sat, 12 Jul 2025 15:56:35 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v2 0/4] Allwinner A100/A133 Ethernet MAC
 (EMAC0) Support
Message-Id: <175230699566.812115.14917196143990668369.b4-ty@csie.org>
Date: Sat, 12 Jul 2025 15:56:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 07 Jul 2025 18:51:51 +0200, Paul Kocialkowski wrote:
> This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC0)
> and uses it in the Liontron H-A133L board.
> 
> Changes since v1:
> - Reverted the emac0 to emac rename;
> - Added collected tags.
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[2/4] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
      commit: 28e4499a9ad68129d41db10b7481c61738fdb3d1
[3/4] arm64: dts: allwinner: a100: Add EMAC support
      commit: 4e3be5629f1f6de30d3fbcdc357e7da948ccf698
[4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
      commit: 8f128f357dfe5907a6f3432ffb1f444e93f1fbf2

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


