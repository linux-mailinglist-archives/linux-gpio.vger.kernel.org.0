Return-Path: <linux-gpio+bounces-7280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AB9011F9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 16:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB6B2813FB
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8469317A918;
	Sat,  8 Jun 2024 14:21:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD927457;
	Sat,  8 Jun 2024 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717856516; cv=none; b=b2+gPp9qAyMFk84pksLpg0SNiSAsnXb/uhIb0nOdOACBPTUfrst8OgObnTUfL9XOmd44dXHcHks5m73B8UbYS1haQ4qJxAzmVELBr45MlZFxoqg/M0niO3Gr91ZoAVgRKRTDmkLCStXKs1ZyNRz3IuqtnvDkWYJNoNV1+NCCum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717856516; c=relaxed/simple;
	bh=fZKzObTQo0GxnaEwl/4M+G9KFYepsIumuA+Sh7vMUGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xi+fl9L4+eit/0DGtZsj0tCXTUNS+eOzvd1S2BkqaUPZXD7JZGkLxNf0TPYgNaW18EL/TIKJ1FOQD6c6L0IMhbhKWqZkoHmQZVlsw/cMh6fxA9q69WAdFcok3YgBJrnY/5WoJf8kJcVGbRuuRb0DvQlDpmdDQ4oJRLcxYiNgZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFwwy-0008KS-CO; Sat, 08 Jun 2024 16:21:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, kever.yang@rock-chips.com,
 Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
Date: Sat, 08 Jun 2024 16:21:43 +0200
Message-ID: <5759165.44csPzL39Z@phil>
In-Reply-To: <3dab2269-a048-4750-bea8-cce245df075a@eh5.me>
References:
 <20240606125755.53778-1-i@eh5.me> <4786379.ElGaqSPkdT@phil>
 <3dab2269-a048-4750-bea8-cce245df075a@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 7. Juni 2024, 16:46:19 CEST schrieb Huang-Huang Bao:
> 
> On 6/7/24 20:32, Heiko Stuebner wrote:
> > Am Donnerstag, 6. Juni 2024, 14:57:53 CEST schrieb Huang-Huang Bao:
> >> The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
> >> specified in RK3328 TRM, however we can get hint from pad name and its
> >> correspinding IOMUX setting for pins in interface descriptions. The
> >> correspinding IOMIX settings for these pins can be found in the same
> >> row next to occurrences of following pad names in RK3328 TRM.
> >>
> >> GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
> >> GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
> >> GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
> >> GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
> >> GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
> >> GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6
> >>
> >> Add pinmux data to rk3328_mux_recalced_data as mux register offset for
> >> these pins does not follow rockchip convention.
> >>
> >> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> > 
> > This matches the information that I found in my TRM, thanks to your
> > detailed explanation.
> > 
> > Though I of course can't say if the TRM is just wrong or the hardware
> > changed after the pads-description was written.
> > 
> > Did you test the usage of these pins on your board?
> > 
> 
> My board(NanoPi R2S) is kinda integrated and does not have GPIO3 pins so
> I can't test these pins directly.
> 
>  From DTS for RK3328(arch/arm64/boot/dts/rockchip/rk3328*.dts*), there is
> pinctrl/cif-0/dvp_d2d9_m0 referencing part of GPIO3-B1+ pins(GPIO3-B1 to
> GPIO3-B4) that indeed matches "Table 15-1 TSP interface description"
> which contains hint pad names. And this DTS node exists from
> initial commit to add RK3328 dtsi
> (52e02d377a72 "arm64: dts: rockchip: add core dtsi file for RK3328 SoCs").

thanks for digging up this information, that makes sense and stuff looks
pretty much correct with everything combined.

Heiko



