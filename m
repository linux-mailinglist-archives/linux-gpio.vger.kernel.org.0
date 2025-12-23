Return-Path: <linux-gpio+bounces-29837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A2CD9676
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 14:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 178393018438
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEA733BBBF;
	Tue, 23 Dec 2025 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="QZrBurUv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail65.out.titan.email (mail65.out.titan.email [34.235.186.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120832D448
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.235.186.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495516; cv=none; b=IqRUOyNlpqIWGG2lmbM2OWpGSyg1CDings/85dPL18c3xUPWWfrmyTRmmj2KC7b36yk0qFmHYGtqWFoDOMRJcayUotzcBiVHx4czImdnwenOy7Pgx++nd/MeZmB1LWnoqtBTyi74fEptE8rvAYrng65qD0Hznbkkea4HAilH94s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495516; c=relaxed/simple;
	bh=pecVmsoK5qEfj6C5kVS/vQWHu3GxbJmDpCtt4wlz6sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCpcm13jWLhWNFnb2v26I1U+SBrpnaOT+512cHmjqjQ1IrtZi1L4jjQeQ/Bv5cNNqphG7hHPZaffadbBwLs20bJQ6FGv3NAHIYlyRuD5DsJRpfFSmgos4Od++OYOY4udcDccFRjQAxJ1O0jpt2e1EZ9/Z/eSWlGe89PeoucJ9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=QZrBurUv; arc=none smtp.client-ip=34.235.186.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dbFZB5nPbz7t8t;
	Tue, 23 Dec 2025 13:03:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=I76jbNhd2RnmoQzo2cA05wxM926Wl/tgrqz3TL3NnOw=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=from:to:subject:mime-version:date:cc:message-id:in-reply-to:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766495026; v=1;
	b=QZrBurUv3CXhzp3FFy9bI/Z7CVNdjHHS7lMRj4rol2r25ZAfM59ObLsQtz3lhLeahovWgQ12
	uZC9VD6ALu2KtOhgTkuyKF5u1ftWhweOnCSrfb3LRXpmK8JCTWoz7d4haLsjUQZgeAqKQiclXxx
	3Uw1XngdPpvWZqdjusB3LSTQ=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dbFZ26L07z7t88;
	Tue, 23 Dec 2025 13:03:38 +0000 (UTC)
Date: Tue, 23 Dec 2025 13:03:27 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <aUqTH_fis1-g42SU@pie>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <aUpirQFWf3w-5PQ2@inochi.infowork>
 <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766495026646385511.30087.5691599438730667089@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=694a9332
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=lv0vYI88AAAA:8
	a=q2HxCz5xri-O7L11LKAA:9 a=CjuIK1q_8ugA:10 a=E7e_GlrEz2WywKPBwZdi:22
	a=9qqun4PRrEabIEPCFt1_:22 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Tue, Dec 23, 2025 at 05:50:08PM +0800, Troy Mitchell wrote:
> On Tue, Dec 23, 2025 at 05:42:26PM +0800, Inochi Amaoto wrote:
> > On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > > IO domain power control registers are used to configure the operating
> > > voltage of dual-voltage GPIO banks. By default, these registers are
> > > configured for 3.3V operation. As a result, even when a GPIO bank is
> > > externally supplied with 1.8V, the internal logic continues to
> > > operate in the 3.3V domain, which may lead to functional failures.
> > > 
> > > This patch adds support for programming the IO domain power control
> > > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > > for 1.8V operation when required.
> > > 
> > > Care must be taken when configuring these registers. If a GPIO bank is
> > > externally supplied with 3.3V while the corresponding IO power domain
> > > is configured for 1.8V, external current injection (back-powering)
> > > may occur, potentially causing damage to the GPIO pin.
> > > 
> > > Due to these hardware constraints and safety considerations, the IO
> > > domain power control registers are implemented as secure registers.
> > > Access to these registers requires unlocking via the AIB Secure Access
> > > Register (ASAR) in the APBC block before a single read or write
> > > operation can be performed.
> > > 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> > >  2 files changed, 131 insertions(+), 4 deletions(-)
> > > 
> > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> > >  
> > >  		pinctrl: pinctrl@d401e000 {
> > >  			compatible = "spacemit,k1-pinctrl";
> > > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > > +			      <0x0 0xd401e800 0x0 0x34>;
> > >  			clocks = <&syscon_apbc CLK_AIB>,
> > >  				 <&syscon_apbc CLK_AIB_BUS>;
> > >  			clock-names = "func", "bus";
> > > +			spacemit,apbc = <&syscon_apbc 0x50>;
> > >  		};
> > 
> > If you insist on a new reg field, you should change the binding as well.
> Yes, I forgot to modify the binding.

This will also break ABI compatibility with older devicetrees, I
strongly suggest against a new item in reg property.

Furthermore, it's unreasonable to describe d401_e000 - d401_e400 and
d401_e800 - d401_e834 as separate memory regions. TRM claims the region
starting from 0xd401_e000 with length 0xc00 is "Pad Configuration". So I
think this separation neither simplifies anything nor matches the
hardware.

> > This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?

If the TRM is correct, we probably can and should.

> I'll double check this. Thanks!
> 
>                             - Troy
> > 
> > Regards,
> > Inochi

Regards,
Yao Zi

