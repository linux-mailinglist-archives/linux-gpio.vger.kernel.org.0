Return-Path: <linux-gpio+bounces-22739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83198AF7C9B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 17:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C22E3AF1A0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 15:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BCF2EE5F3;
	Thu,  3 Jul 2025 15:37:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F515C0;
	Thu,  3 Jul 2025 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557061; cv=none; b=BfQWSXVmxZRctb9w+GJW6uO4a6yFABT/8F2PBh7yICLjkT1z2Aczvn5A78hM2+2MslirLzoe9JjHZbU0p+FCZwbq2b2lPrMexMnoUTX9SLIbjaiARmTmQYK8qe/OYJabcM4bqLgcI0BV8iLNZ4a5beXBjav2w6LeE0gA2y9YbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557061; c=relaxed/simple;
	bh=t279g48oYrtBxnh7gCVmKyRWtOgL2u29VtLjJ0nqi+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eB3fOz2AcqnW4I79c8STyUBbFmiOmhk/S1dhMwUmyxB7KjDDg67x7kbyG0p5NSoJeVsWWyy7LWeckUeJVuLZGU87WCZKxK5sETCfvWkITcbwlXIbmABtm/M+xoNhMSglW+22MhSnQrGMkONXpXWY1t4kHnTePhgd7XfDsoR86ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B848C4CEEE;
	Thu,  3 Jul 2025 15:37:40 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 418D15FA91;
	Thu,  3 Jul 2025 23:37:38 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl
 fixes
Message-Id: <175155705824.1106539.17200783567865554543.b4-ty@csie.org>
Date: Thu, 03 Jul 2025 23:37:38 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Jul 2025 22:11:19 +0200, Paul Kocialkowski wrote:
> This is a mixed-bag of minor fixes for V3s clocks and pinctrl.
> 
> The last patch is a weak attempt at accomodating using both the display
> engine and tcon along with the camera subsystem. The main issue is that
> the tcon and de need to have the same clock parent, which may not be
> the case depending on the pixel rate. Bringing the de block to the same
> clock rate as the csi block helps in some cases.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.16 in local tree, thanks!

[2/5] clk: sunxi-ng: v3s: Fix CSI SCLK clock name
      commit: f45b2949b1a235881255132a119b8cc8c3738bd5
[3/5] clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
      commit: 2b73328629396d32e41ca1f023653b07abf2b42f
[4/5] clk: sunxi-ng: v3s: Fix TCON clock parents
      commit: 01fdcbc7e5a56c9cba521e0f237cb5c3fd162432

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


