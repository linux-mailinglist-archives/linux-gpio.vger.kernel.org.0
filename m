Return-Path: <linux-gpio+bounces-29880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B3CDD66C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 08:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813523018194
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 07:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33BF2E2F0E;
	Thu, 25 Dec 2025 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="W41aODLG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61444227E83;
	Thu, 25 Dec 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766646522; cv=none; b=tsb6ENYTiDCDrn/KIlwlm8vJWJrocZn6/VQyejn/QRaSdpux46VuGn39Hxqgphy9s2wHSITls+AzeLQ5X4mjX8kX04zZyYGHB9chelZDTYBOWaHM2fp3GbUVIYimRhjNSRlzOe8qroyeC9zhFdM9S5RaMD2J0OjKhJdXnx+Xf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766646522; c=relaxed/simple;
	bh=rARb//J5MswjJxfIZ7FZMT+BzHZT91PlHJg2rGx6s9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0xe85AxRldLnz0r2qFSG7K8TZlSjxL4Cc0AKJcKOH2A6B7o0pQJhOpfpPcRJ6qT9vESR10k1BqbM36ghznnkQirf587J5cQQP5bQEu1sUtC3LjTxv8pyCwG41IGNg0sRV28MklYIOZlTJMBOxLvczhEW8Za4AoFc1C+AKql+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=W41aODLG; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766646462;
	bh=WQahqT1T14f9AEri4m6AgEL6eE2ksV0PYPoD24EWkJY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=W41aODLGr/RM1n97KVI7K6GKXS4XHjvFojO61kU/V0FKFcXDfZQUsZuak4G+mEpsg
	 Ks/vuv81bGt2LYhfxmiJqAfFr7lE0mxa4t2OO2Xpu233c8wqcCtOddCMtDKuQhMjKB
	 7IKVOLmVyJ7QqAEImCYMEqiGv5ermj/x8HR+ZBcw=
X-QQ-mid: esmtpsz20t1766646456tda004313
X-QQ-Originating-IP: 4hfJ50aJrTyB36UCUQrb27WLy3tNtjF32BK8e7hmUz8=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:07:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1149935882015170328
EX-QQ-RecipientCnt: 17
Date: Thu, 25 Dec 2025 15:07:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yao Zi <me@ziyao.cc>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
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
Message-ID: <47781E30EC71C60F+aUzitZG78aGBxHOG@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <aUpirQFWf3w-5PQ2@inochi.infowork>
 <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
 <aUqTH_fis1-g42SU@pie>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUqTH_fis1-g42SU@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPR7uEA6bBhoIN2duqPMQGd/RUtsedVkMTFHhnewZ6ZeZkV+AVO3mvA6
	us8SrD6simzAQvZb075yfrdTA8kwlMg891rOtJf6omJLT8RqAxU3NBvY2KIqH841McIFnsC
	3UZMThkQrfwHuMgBO1CdtdyxxhkfRAra75Oyy4JFH6rYW24bh13VvA8ktAsw2GPCpcr2PjO
	HBN+1eSvvTpD4MRgCNi/j2IBuWlOrv4D217qCZIhyeqa7+OSZSLgJwWj+8JweycsCeM1BY8
	wA/lmtCbJnNgF88Fje06Ji1kpCCDNNc4E+Z5jinZHFkv6Z98V9Q9+E5CNJpdje+UBPFhH/J
	eXwVGZoVoSjHYaZENkUcXH2WYtLMV8NPasBPUBlKvGviidrqNrqOE/XlrxV65qutpRvciUl
	QnBZkbop0QrSVZYLkeIiNFZlJKzN3fpj8z91z7CY/bsejvoYOabkbMhgXWna3ju1FVq5WSj
	TG2ofR2BEBpgpIGaY0Pm3Z2M+MWtX52zk4ZgoFnHdrk5U3fEkbzJEiamIbnx2ppWzLql6TJ
	gcEA4AYwPpiM5ryhjBmNUsbKLCi6xHS6KmuCJ6KXGW6rocNNr4P8XQv6fgnM/JYC2+F1bPk
	8KmSPlYUR1v9rUysoeTHqxEAq5PgNYRK2P1ShAa+qVhd6IzcGLECdMO/FFMcnwkngZx1wnw
	rHXQHrTJbcOMDnGiktLftAv/5QczG+AdqvEKdjC1lloPR3NC1fukvqT/r6E3DSsXqlBx6mD
	1GA7FjV1okKwAfGhXzIqBVCX7ukb2ulZCNkdROrT8DxMH6supwKdaIfXaWkANgD/+8X0OM0
	RAPOy2siyYAbOZ82zHYMKL/iYkPERuuvaRaFr4Q648yNo7eWZuLPTak5zLR3qAHjgsu0+oz
	BC2kFQDz0R1jUfoVL7hRzRzoEQ9hjvLHAv+vAWzkVhuIAqqfUcPiGEvYgBFmeMqcDH1OG/U
	SOnjsalKIh8r05DHtdd2PavF/rcBOCNbYhcJkR7mrCfWKBuX8UvcSCy1X3zLWEduaybcK7a
	jnKknNzUGf/W1uqwjZ4pXsG1SMUHsWlIFdtO2XNHyPsf+xGcCe
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On Tue, Dec 23, 2025 at 01:03:27PM +0000, Yao Zi wrote:
> On Tue, Dec 23, 2025 at 05:50:08PM +0800, Troy Mitchell wrote:
> > On Tue, Dec 23, 2025 at 05:42:26PM +0800, Inochi Amaoto wrote:
> > > On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > > > IO domain power control registers are used to configure the operating
> > > > voltage of dual-voltage GPIO banks. By default, these registers are
> > > > configured for 3.3V operation. As a result, even when a GPIO bank is
> > > > externally supplied with 1.8V, the internal logic continues to
> > > > operate in the 3.3V domain, which may lead to functional failures.
> > > > 
> > > > This patch adds support for programming the IO domain power control
> > > > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > > > for 1.8V operation when required.
> > > > 
> > > > Care must be taken when configuring these registers. If a GPIO bank is
> > > > externally supplied with 3.3V while the corresponding IO power domain
> > > > is configured for 1.8V, external current injection (back-powering)
> > > > may occur, potentially causing damage to the GPIO pin.
> > > > 
> > > > Due to these hardware constraints and safety considerations, the IO
> > > > domain power control registers are implemented as secure registers.
> > > > Access to these registers requires unlocking via the AIB Secure Access
> > > > Register (ASAR) in the APBC block before a single read or write
> > > > operation can be performed.
> > > > 
> > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> > > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 131 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> > > >  
> > > >  		pinctrl: pinctrl@d401e000 {
> > > >  			compatible = "spacemit,k1-pinctrl";
> > > > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > > > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > > > +			      <0x0 0xd401e800 0x0 0x34>;
> > > >  			clocks = <&syscon_apbc CLK_AIB>,
> > > >  				 <&syscon_apbc CLK_AIB_BUS>;
> > > >  			clock-names = "func", "bus";
> > > > +			spacemit,apbc = <&syscon_apbc 0x50>;
> > > >  		};
> > > 
> > > If you insist on a new reg field, you should change the binding as well.
> > Yes, I forgot to modify the binding.
> 
> This will also break ABI compatibility with older devicetrees, I
> strongly suggest against a new item in reg property.
> 
> Furthermore, it's unreasonable to describe d401_e000 - d401_e400 and
> d401_e800 - d401_e834 as separate memory regions. TRM claims the region
> starting from 0xd401_e000 with length 0xc00 is "Pad Configuration". So I
> think this separation neither simplifies anything nor matches the
> hardware.
> 
> > > This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
> 
> If the TRM is correct, we probably can and should.
I have double checked. Inochi is correct.
I'll fix it in the next version.
Thanks!

                              - Troy

