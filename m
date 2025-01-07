Return-Path: <linux-gpio+bounces-14586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE96A04D71
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 00:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BE177A2042
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 23:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650C71E47CD;
	Tue,  7 Jan 2025 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NqiaaL9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B61273F9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292293; cv=none; b=YSgsKsgRlJenGlF/SLBpR60AKtduonLrSL/z9vuu1bOaz0rQUXxBeydrLwP7MrpvzMOFs2ht9ahXQs6cHiQnZ/hJcF7J682pVAzGwOPqOJvU/LPpK2p8D1Bv1G+hExF9RW/1V9dxbeppecDtlzwrilZE9R1DAsot8LVU56sasa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292293; c=relaxed/simple;
	bh=/rXHGKUIoQHoGcJIrywVuVgzNts6B4F5PDPqIq7EeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5+95XMJZ3upg0ENP7TPNDXnJD3TH36ZsAOVVfdH2a4tLJocRyPVjIbEEBRxUzlGzzOsXyzAXtND+kHqQlfHQO39tcaMcSWNGMYVWVHKJxlRHOU8Jw5b6Gb10kcxm5P7/ENe/BNvPxGLNDYKVw6Hq1mlOtKEK7rqYdO/SIn+KnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NqiaaL9V; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 88194240029
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jan 2025 00:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736292289; bh=/rXHGKUIoQHoGcJIrywVuVgzNts6B4F5PDPqIq7EeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=NqiaaL9V+ZJ+TTlLyK+w/G5/8HWh5ycmXEyIS9Ei55dR3Q6IzMoU/8OZY83lO5JKe
	 ewkojb0uIWGNgHmLWnlutrBk5FqeaHwvJc4datO7sii/JHF9kbBgI8hk/x5H9LiOCt
	 F6tjt894Xqs8/wdUGHT/pTPHkWKFPrPTX8GcyjWsT7tP9cSwB6MCTlV+3kWOrQ4fUt
	 srZkQ4d97BhmZpyk8BVFdt8KIHCnv+uU5qYhj/XrAx2UXTipPohH+WBgHCr55ao5gH
	 8jKJ/+7dKO7St59p+yzmd6eROG/GgE9ZxyQ0h0p7AnkgF3xKNzt01701kM5BICfjZk
	 Umm5pO4wgiPCQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YSRwH60Yhz6tvZ;
	Wed,  8 Jan 2025 00:24:47 +0100 (CET)
Date: Tue,  7 Jan 2025 23:24:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
Message-ID: <Z323v2w74_lB2Ilo@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
 <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>

On Mon, Jan 06, 2025 at 02:55:22PM +0100, Christophe Leroy wrote:
> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> > [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > In order to produce useful FIT images, the kernel needs to know which
> > devicetrees to build. To that end, follow the same approach as other
> > architectures, and enable devicetrees per platform.
> 
> Why do you need that ?

The FIT infrastructure uses the dtbs-y variable and the dtbs-list file
built from it in order to obtain a list of DTBs to include.

Having roughly the right DTBs included by setting a simple config
option to =y is pretty convenient.

> Why not just use CONFIG_EXTRA_TARGETS for that ?

To be honest, I didn't know about CONFIG_EXTRA_TARGETS until now.
But I also don't quite understand it:

  ()  Additional default image types

I don't need an additional image type. I want additional device trees,
if anything.

One thing I specifically wanted to avoid by using FIT is having to add
more per-board bootwrapper logic to arch/powerpc/boot/Makefile.

> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > I've only enabled MPC831x devicetrees, because that's the hardware I have.
> > ---
> >   arch/powerpc/boot/dts/Makefile | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> > index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -3,3 +3,8 @@
> >   subdir-y += fsl
> > 
> >   dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> > +
> > +dtb-$(CONFIG_MPC831x) += \
> > +       kmeter1.dtb \
> > +       mpc8313erdb.dtb \
> > +       mpc8315erdb.dtb
> 
> How will it know which one of the three to put in the FIT image ?
> Or do you want all three in the FIT image ?

It includes all of them, which is an acceptable outcome.

> In that case how do you select which one to use at boot ?

The bootloader (most likely U-Boot) is expected to know the compatible
string of the board and select the right devicetree based on it.


Best regards,
J. Neuschäfer

