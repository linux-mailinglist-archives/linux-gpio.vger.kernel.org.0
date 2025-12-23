Return-Path: <linux-gpio+bounces-29813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C155CD89E1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB0F03014138
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB97C3126CE;
	Tue, 23 Dec 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dEWZfT71"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF628980E;
	Tue, 23 Dec 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482991; cv=none; b=R0HkF+Qokn/Cxi8hVHXna+9kEx5reSs39WJts8QG9a5SOz54arQ+nuSZrGo4zvkxrS198tURUqRVvTFySqTYLx16UQ9jQcCikNDvh5CG+SKrvAc4DX5Ykx1L5hNVfMK/uhZ/5aITmiqBb/JHkd1bvWd/k2p8ZrPXiotXC+HRyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482991; c=relaxed/simple;
	bh=xPmgv9l9tzvHhbUtCs7Lzg9mTGY7Snv5sLpkYfFYves=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VACClF2ov/z1DoKAHFMr+/+6EdRXy5HY7uuO4IMoInqQNa4SHCtBrqokepOIX7T+QkZjxeHAq/3eGMwbBOrqNoKh3ywGguRkskcO2VIrZ9Ln4bpHjcWZFtSCxgLQdf9JdcJtyKOlTeETNQnB+CFLI0AcPWXBZUbyWuExmOtuYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dEWZfT71; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766482962;
	bh=DqqDZK3BOFl79wvOzXLQwpubF3qPPTt9v8EL8XFacZA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dEWZfT71mmrRWFesPgYGIEZkzwiMrACJ+ITBKYh7FfiKd88wOKkbG9a4MdXGb7iwi
	 uBeb8vE2GeAKtjQc+4f2+HB0GWL4D7qCaArf194CQTC/iU1gjL5mBZ5kQ0p0AAk4U/
	 tDclGEfHN+WZn8RySrEhda32LBcFI85YTbjLT2JA=
X-QQ-mid: zesmtpgz1t1766482956t78cb9070
X-QQ-Originating-IP: eCG2RGZVrV1DfjhD41RKfyJHVCITcq4ibzzDloWNSV0=
Received: from = ( [183.48.247.204])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:42:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16986777472253226495
EX-QQ-RecipientCnt: 15
Date: Tue, 23 Dec 2025 17:42:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <4D38DBB2D5EA96CC+aUpkCTp00KxEuU_Z@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251223093228-GYA1986709@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223093228-GYA1986709@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MJXRjF2gqSz5kbJX3NdAPN2/6CaTTJUmCupiFHjPyYDhgUtrCFwD2XN4
	6Yr+2Tl6CqHl/DzDChXtL7mWc71iYXJ6+hiIwmz3TRSMlNnlT2CDLpcHSVUhJckGdCxnLXQ
	z3RMTbF3or3TXwjrzuD407ZSZ3j3cdITlQP5/YHqudPPXGvr8Gtiazk9ZploUSn5+7nr1A3
	kRHqPd+JU56/9rdUkZ/k2/YpyawwYgDP315Fbbx4bBEeEJbteAHbBMHoJ8yN3Q+PJJPUGqc
	UNR0Y4LMKdWNYNOWH/LWJXr5jt637CbupC8HYely/L9+UB3Q9Yl1iwJ/wGBtUnNkJaInHCN
	DwrNDjGhupkG3jrmmncxChpLyNA0nI8Nbj/4qA+cBD+1aFeiwVxq7wR7+YTeNnCMsJbVh9q
	krZOmMeAUfu+d1NvulVhB3gdl0lIaBUbveJK9OwknaE5OmL4b5Sc/aezrPKC4Ump3SlANl3
	6evIPE12TiKf58uoqfpwqPRGCrfKfFXVtm8zzJYiCH5/s96qdWMZ+B+DGJXQ7a7TFQwOwsd
	TNRNAVKx/NvXcUl8aqiv0rcrqXZp430K2P4FwwclIm5LbJMfBzXFn3ffYM/nnQTm6cnEJwJ
	KgroVQwUIjRHueS4XvC61ltb1gj3MN7YicSZl+iZyVI2EJ+AasFvuraoheGv9TxQGM7BvMZ
	PzqPCW7PyFyrQpH9f5UUpP/uynPZY1JbFK5qdWrDRi98BwrV8kTXC0WapBM87eGx+/8zQjB
	VIhMmutNcUCQxDWc3DHPbEyYWMU9uq18iRb8BZuN0TahiCx4ZKNUWySPv3uyBmugxUSKwnv
	ue5UzDXusZktu6IsZ5eEeI6NGvmvSnkMlyayezONRxCAAfcFvpHT64ObWrgNg3bPQhixzYp
	hNJpZEisCt+cc6RXkdGccdxRnj+jXKQ0kMbHqZX2mnGarSkaILPs/6Rpgk5+nO1cbSKCVtf
	TNuv0bEiDIf7ZFKHs5GNUUG9CbW21cOTm+7fnWTyed/2HrgVBXA2ET7ZgDeta9kkA4C9+NU
	LieSP5QXoK0ciQMr8i6FRgFX19V9RZdrcoWt9HtgdykUCaGrk/yuDF5Jfnw30vomjnLVgrh
	65xSE6zd0ZN3SbGeiKTHvsfy+xfYp0BukzHCir8hzuHaGiV8HTM1iVDGu3Lo4BOrQ7iEsMt
	nkIPtgrQgPQExEiy7M5jPFTiPyHBZg0cgfac
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Tue, Dec 23, 2025 at 05:32:28PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 17:11 Tue 23 Dec     , Troy Mitchell wrote:
> > IO domain power control registers are used to configure the operating
> > voltage of dual-voltage GPIO banks. By default, these registers are
> > configured for 3.3V operation. As a result, even when a GPIO bank is
> > externally supplied with 1.8V, the internal logic continues to
> > operate in the 3.3V domain, which may lead to functional failures.
> > 
> > This patch adds support for programming the IO domain power control
> > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > for 1.8V operation when required.
> > 
> > Care must be taken when configuring these registers. If a GPIO bank is
> > externally supplied with 3.3V while the corresponding IO power domain
> > is configured for 1.8V, external current injection (back-powering)
> > may occur, potentially causing damage to the GPIO pin.
> > 
> > Due to these hardware constraints and safety considerations, the IO
> > domain power control registers are implemented as secure registers.
> > Access to these registers requires unlocking via the AIB Secure Access
> > Register (ASAR) in the APBC block before a single read or write
> > operation can be performed.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 131 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> dtsi should go as separated patch, then route to SoC tree
OH I forgot that. Thanks.
> 
> > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> >  
> >  		pinctrl: pinctrl@d401e000 {
> >  			compatible = "spacemit,k1-pinctrl";
> > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > +			      <0x0 0xd401e800 0x0 0x34>;
> >  			clocks = <&syscon_apbc CLK_AIB>,
> >  				 <&syscon_apbc CLK_AIB_BUS>;
> >  			clock-names = "func", "bus";
> > +			spacemit,apbc = <&syscon_apbc 0x50>;
> >  		};
> >  static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  {
> > +	struct device_node *np = pdev->dev.of_node;
> >  	struct device *dev = &pdev->dev;
> >  	struct spacemit_pinctrl *pctrl;
> >  	struct clk *func_clk, *bus_clk;
> > @@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pctrl->regs))
> >  		return PTR_ERR(pctrl->regs);
> >  
> > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(pctrl->io_pd_reg))
> > +		return PTR_ERR(pctrl->io_pd_reg);
> > +
> > +	pctrl->regmap_apbc =
> > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > +						     &pctrl->regmap_apbc_offset);
> Can you simply use syscon_regmap_lookup_by_phandle(), then define 
> #define APBC_ASFAR		0x50
> #define APBC_ASSAR		0x54
I think it just a minor issue. I will keep it.
But if anyone else thinks the same way as Yixun, please let me know.

                      - Troy

