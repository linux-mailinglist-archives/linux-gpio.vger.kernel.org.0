Return-Path: <linux-gpio+bounces-29816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A5CD8A5C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E65353013EEB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56953330B07;
	Tue, 23 Dec 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="u24iAiyN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13924337B;
	Tue, 23 Dec 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483459; cv=none; b=Ngu7WpxquLoI2KWyiXx8PKJxlec9Bra1K0UMzbnSt9ekmSbNq2zqu3Ff/lwcE6Y5XawBFVTZBD7OBB+dnIU6u7ERKTxOVeC7Z6geOkIRtBLbmtMo/whG7V2QzpBQJR34X4l3VEP5wMjTyUGGicLldRCI4odo59FM943PGiVmkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483459; c=relaxed/simple;
	bh=awkVaKxcxpnoZNbVIV6brtv3aH1jdH80/Pm61a4HP9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StKIwSmr3waHpNe+MjkTMcVr8Hh3pZm4SYgCLlJ8ahJTx3GMFCY0sO3DhXl2ck0Cp/0GbNIEDjXPXnIQRPkXy0nsSc+VC+LknH87EQLa7LkKHmg+G6/04x4B6dQOW0NMXpZAUFC7gaJ4vOF8aazZKa40NRWAT8mMHD+zNFw1OyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=u24iAiyN; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766483417;
	bh=1KBspn3lmpuGr/bDugn3e48PSLrjb85y6rjRy4Voyt4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=u24iAiyNs6lGt0qgzU2EpPrW9NT9VbylknFN0ewSm6DQpPb+xUtQUwMlS2iFQDRU5
	 AcRVKgh1xCL4jQWtdTl/9BY/qGgB9VMnK0NYaPCQH7W/9BSG+pRuKG/+A/OrbG2+J9
	 txZ/NOuyhksgqwlDVVzHFZ8mZRxzfJMV/RrrLPEA=
X-QQ-mid: zesmtpgz7t1766483410t6e8ce7a7
X-QQ-Originating-IP: B1Taz1X5IZEtgU0JhcBaI4ePti2+yVkLQPsGXXa3Be8=
Received: from = ( [183.48.247.204])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:50:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4315336128673413360
EX-QQ-RecipientCnt: 16
Date: Tue, 23 Dec 2025 17:50:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <aUpirQFWf3w-5PQ2@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUpirQFWf3w-5PQ2@inochi.infowork>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIXpHopat2Iaqb1wLJTzqDwL25IVyIFnc+2GWQpFhcUseBA29rIfaqre
	6q8uXAJAI4bMYYDiCNXhm66sTuKeAP+/hEbrYtwfGw7K6YZw6UgjyN59zzk/IQhNyiaCjRj
	7tPaKCmvBIK6BI7J/EZa2ESM8m12JJwFZYfB1gxE9wXypKJYa0yw7RI52Z+ROdjnqEHZ9p2
	BqG6SMSfGxi4eMwbAcydo8meNlx1bCeIOy9BkKicEyJRRASHt2x5ALMISl8BwF/YtH+Qy/V
	7uVL6+zpoc0nhuyMM3d16ZKFcl6/TkdQhxXdgaUdGQINT/cMASyHiFB7VNO8Lwe/GjyRTSL
	w1x0qAvs4TAhC+HM99WAJjLPvbW0R5s7PtSmSn+EgiKna7BYKQJ+FxoPrc6xmRm/WZgddnA
	v0zePzvC78ZMh2K+VpArQ1ijUZWpqswvWK1lMbYtuq2fLQ8RS4rGKiWdAQmXlwdY52nQ4Yn
	9hieQPqjky714PjeaInwWjrAHKGVty0SaCe1KSuApYtor9UxejIuEwv4WC2nVcgjyvrC4sO
	eVt3W+LmFpD0UiFW2d4FTmdDdE76LI7+BGM43dWT7P6EmBvFUfKABFbaRmI/WbGHnM7pAXM
	FJz4uCWGbCrVD/nD8EWgF55zI8zOs1pb1LZoVl2N2TxAgsnbDxz8vTV8kwuD/rp+6T3mYCZ
	k99G7mjZy9rLLKa47aTKiWe7ffHiYZmAWG/JJ8rD8IvSLMP9kWJwOEu2S2n5EN6gTyvP2MD
	vYoT/MVXLoPOPpn+J6AiulTxZ2lSzGvMFvN8t1iz4rgLjXQqeIQ/iVmK8AD3QJ+sJCnaBHn
	oOO3AueXdo4WQAt002WH/GwFyTVBelChuvgvn/6NT0wU7n/lnjDnjr5Uwg2ZusDcCPT1sXW
	Sp11pcSCUlDLZSQGklg+DLFqQky+UciPi23H/h0PjOA8gXD07CDfhysIaU8TxEPkoDvubmR
	9BOlvDcKw44qOAmv2C6pa2l83Xr8WLkUWNFYNVtSNnp9Qh75GOviQNpdvUrYyquIrBf/uFD
	wB2X4DKJIqJm9RvfQJQYw9QmYNLynJsTHMig05EU4T4DqX+4hpJ6twa4dAmCmGhpNblXPw5
	WgyLxs0zGzTWRWIxkuKmbMTlTddgxZH51s/kAQeyAsV0rDE7+SnGjA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Tue, Dec 23, 2025 at 05:42:26PM +0800, Inochi Amaoto wrote:
> On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
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
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
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
> 
> If you insist on a new reg field, you should change the binding as well.
Yes, I forgot to modify the binding.

> This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
I'll double check this. Thanks!

                            - Troy
> 
> Regards,
> Inochi
> 

