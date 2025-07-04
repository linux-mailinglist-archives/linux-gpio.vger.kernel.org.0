Return-Path: <linux-gpio+bounces-22808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDFAF96F4
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 17:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5A35A18E3
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E8628EA53;
	Fri,  4 Jul 2025 15:37:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0033E1;
	Fri,  4 Jul 2025 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643447; cv=none; b=B1tfJYinqsfyjOEjYBW7RZjx5IJsRBLrQ7+SsrN8EHP2N/C8nhK81fWlbc6zsn4/kEmC2F2K7PuXyZzRGdS5q7W5YbDplU0/FB/dsIUsy553f42wfuDwjWIWgVk5KAFFsAUz5zOhl/znxUIv04yNH2qXrRoTOT2udsol21y70J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643447; c=relaxed/simple;
	bh=PdlT5glW7R1wxHYZvaLSC9p98XKiNToqmVL6F87XuB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PYUxn3ZRTnUT498uExOl7VcVocyFirh18JFtQvFO/5PBPkJTWyhiku4E3zkjilsT6aG8AJ7lxQaZk2lUSw7+ouFLVA9Fg9y0pCCoqb+bYm/Ddgvmgmv7LQTlA+hibh9aqiUivUO1Fpo9Z8TMldvHLJnoZu4E6knSBvLFP2uNTeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C025C4CEE3;
	Fri,  4 Jul 2025 15:37:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 9A35F5FB31;
	Fri,  4 Jul 2025 23:37:23 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC)
 Support
Message-Id: <175164344357.1538531.5993641377179259216.b4-ty@csie.org>
Date: Fri, 04 Jul 2025 23:37:23 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 26 Jun 2025 10:09:18 +0200, Paul Kocialkowski wrote:
> This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
> and uses it in the Liontron H-A133L board.
> 
> Paul Kocialkowski (5):
>   pinctrl: sunxi: Fix a100 emac pin function name
>   arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
>   dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
>   arm64: dts: allwinner: a100: Add EMAC support
>   arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
      commit: e8ce8507ecac5c4125e8d8aca147cbd7d3eae573
[4/5] arm64: dts: allwinner: a100: Add EMAC support
      commit: ce51ff18daca21723f97d22477416418dcfca8dc
[5/5] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
      commit: 1c5f20ebc46d9cf5fd19c343537de15aeeda2d36

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


