Return-Path: <linux-gpio+bounces-30139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0EDCF2DEE
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5691830CBA68
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922E30F52B;
	Mon,  5 Jan 2026 09:42:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1D1A9FAB;
	Mon,  5 Jan 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606120; cv=none; b=iSHt0Qlr3yzNQq1S2Vm0waibRmiFa1AZXe6p4cKv2WJhXprFxvdpS459OEzHmjXRtjkE22Cldphs5HyhVDIAzEJdJyANKiqS3Xa6Mu7gZ/Qg9HV5SlRb4DIpujtl8YHtDWey4/SItK/LZ4KtnZr6dlolVQgluFreAygkqEKC0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606120; c=relaxed/simple;
	bh=lPmJf0QXvX6SCkp0icCbKV+O2sDmQUtlcLLStESWJks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xbk/FayS+Cw5+Rs5o6KelBzqs4vC//uciUKcgqTEgB4+0CH7YNq8Npp9atceq1aNrokc4qIVBVTr2WlO9IX+BnCxhIhgZseOj3RmPeGG4LqNlWlPej0xU9WiP7oL/Sui5T/fswGtU1uEOdXifuBrzbmRENmKI8yowYEVPxYgnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C50C1341E55;
	Mon, 05 Jan 2026 09:41:50 +0000 (UTC)
Date: Mon, 5 Jan 2026 17:41:46 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260105094146-GYB2078702@gentoo.org>
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
 <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
 <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>

Hi Bartosz,

On 01:23 Mon 05 Jan     , Bartosz Golaszewski wrote:
> On Sat, 3 Jan 2026 22:33:39 +0100, Yixun Lan <dlan@gentoo.org> said:
> > SpacemiT K3 SoC has changed gpio register layout while comparing
> > with previous generation, the register offset and bank offset
> > need to be adjusted, introduce a compatible data to extend the
> > driver to support this.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
> >  1 file changed, 117 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> > index eb66a15c002f..bca5c3dc13ca 100644
> > --- a/drivers/gpio/gpio-spacemit-k1.c
> > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > @@ -15,29 +15,37 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/seq_file.h>
> >
> > -/* register offset */
> > -#define SPACEMIT_GPLR		0x00 /* port level - R */
> > -#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
> > -#define SPACEMIT_GPSR		0x18 /* port set - W */
> > -#define SPACEMIT_GPCR		0x24 /* port clear - W */
> > -#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
> > -#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
> > -#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
> > -#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
> > -#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
> > -#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
> > -#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
> > -#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
> > -#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
> > -#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> > -
> >  #define SPACEMIT_NR_BANKS		4
> >  #define SPACEMIT_NR_GPIOS_PER_BANK	32
> >
> >  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> > +#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
> > +
> > +enum spacemit_gpio_registers {
> > +	SPACEMIT_GPLR = 0,	/* port level - R */
> 
> No need for the = 0 here.
ok, I will drop it

> > +static const unsigned int spacemit_gpio_k1_offsets[] = {
> > +	0x00,
> > +	0x0c,
> > +	0x18,
> > +	0x24,
> > +	0x30,
> > +	0x3c,
> > +	0x48,
> > +	0x54,
> > +	0x60,
> > +	0x6c,
> > +	0x78,
> > +	0x84,
> > +	0x90,
> > +	0x9c,
> > +	0xA8,
> > +};
> > +
> > +static const unsigned int spacemit_gpio_k3_offsets[] = {
> > +	0x0,
> > +	0x4,
> > +	0x8,
> > +	0xc,
> > +	0x10,
> > +	0x14,
> > +	0x18,
> > +	0x1c,
> > +	0x20,
> > +	0x24,
> > +	0x28,
> > +	0x2c,
> > +	0x30,
> > +	0x34,
> > +	0x38,
> > +};
> 
> I would very much prefer for you to use the
> 
>     [ENUM] = 0xVALUE
> 
> style of initialization here for better readability.
> 
ok, will do

> Otherwise looks good so LGTM on the next iteration.
> 
thanks

-- 
Yixun Lan (dlan)

