Return-Path: <linux-gpio+bounces-30071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D4CEE625
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCDD73009405
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E9B2EF662;
	Fri,  2 Jan 2026 11:36:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA5222584;
	Fri,  2 Jan 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353811; cv=none; b=Zvf7jPKZcUWailEK+EmFZmy1lgE5lk9uVWRGIeXm56eVG/2WIKFhN/YN8JG0VEIJwQ+CoJhG1ezbpNBnEswBi6Y2LMQxF5Ogx/42uSQRHL1caiFNxALFOkExkZ1r5L0IpOBfD96wz0TkIVNd8zEw3h4zl1oqVv9tviX+HeuZUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353811; c=relaxed/simple;
	bh=qYW2fr0EASe6j5jt/RMQovxpWx0lyPJUTq6TeaAySHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU8fLeFyf+Rac0ahUZQeNK1KGtbKUyWEJAi0iwZpeu3CS0xBbABAlUme3m9K/1hSrq1hw+sv+WqAkfoZkzmSIENB2RP3pMYCRUV5HEMXv7N2bCwp8l6Evj6rJWy9ztupnpPsy2hyWtkTxzvnCxV+f2mnF+aHFWpbtHSNwKBb0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 203E334134D;
	Fri, 02 Jan 2026 11:36:48 +0000 (UTC)
Date: Fri, 2 Jan 2026 19:36:43 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260102113643-GYA2060252@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
 <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>

Hi Bart,

On 12:10 Fri 02 Jan     , Bartosz Golaszewski wrote:
> On Mon, Dec 29, 2025 at 1:47 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > SpacemiT K3 SoC has changed gpio register layout while comparing
> > with previous generation, the register offset and bank offset
> > need to be adjusted, introduce a compatible data to extend the
> > driver to support this.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpio-spacemit-k1.c | 150 ++++++++++++++++++++++++++++------------
> >  1 file changed, 106 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> > index eb66a15c002f..02cc5c11b617 100644
> > --- a/drivers/gpio/gpio-spacemit-k1.c
> > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > @@ -15,28 +15,19 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/seq_file.h>
> >
> > -/* register offset */
> > -#define SPACEMIT_GPLR          0x00 /* port level - R */
> > -#define SPACEMIT_GPDR          0x0c /* port direction - R/W */
> > -#define SPACEMIT_GPSR          0x18 /* port set - W */
> > -#define SPACEMIT_GPCR          0x24 /* port clear - W */
> > -#define SPACEMIT_GRER          0x30 /* port rising edge R/W */
> > -#define SPACEMIT_GFER          0x3c /* port falling edge R/W */
> > -#define SPACEMIT_GEDR          0x48 /* edge detect status - R/W1C */
> > -#define SPACEMIT_GSDR          0x54 /* (set) direction - W */
> > -#define SPACEMIT_GCDR          0x60 /* (clear) direction - W */
> > -#define SPACEMIT_GSRER         0x6c /* (set) rising edge detect enable - W */
> > -#define SPACEMIT_GCRER         0x78 /* (clear) rising edge detect enable - W */
> > -#define SPACEMIT_GSFER         0x84 /* (set) falling edge detect enable - W */
> > -#define SPACEMIT_GCFER         0x90 /* (clear) falling edge detect enable - W */
> > -#define SPACEMIT_GAPMASK       0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> > -
> >  #define SPACEMIT_NR_BANKS              4
> >  #define SPACEMIT_NR_GPIOS_PER_BANK     32
> >
> >  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> > +#define to_spacemit_gpio_regs(sg) ((sg)->data->reg_offsets)
> >
> >  struct spacemit_gpio;
> > +struct spacemit_gpio_reg_offsets;
> 
> Why not move this structure here instead and avoid the forward declaration?
> 
sure, I will do

> > +
> > +struct spacemit_gpio_data {
> > +       struct spacemit_gpio_reg_offsets *reg_offsets;
> > +       u32 bank_offsets[4];
> > +};
> >
> >  struct spacemit_gpio_bank {
> >         struct gpio_generic_chip chip;
> > @@ -49,9 +40,28 @@ struct spacemit_gpio_bank {
> >
> >  struct spacemit_gpio {
> >         struct device *dev;
> > +       const struct spacemit_gpio_data *data;
> >         struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
> >  };
> >
> > +struct spacemit_gpio_reg_offsets {
> > +       u32 gplr;      /* port level - R */
> > +       u32 gpdr;      /* port direction - R/W */
> > +       u32 gpsr;      /* port set - W */
> > +       u32 gpcr;      /* port clear - W */
> > +       u32 grer;      /* port rising edge R/W */
> > +       u32 gfer;      /* port falling edge R/W */
> > +       u32 gedr;      /* edge detect status - R/W1C */
> > +       u32 gsdr;      /* (set) direction - W */
> > +       u32 gcdr;      /* (clear) direction - W */
> > +       u32 gsrer;     /* (set) rising edge detect enable - W */
> > +       u32 gcrer;     /* (clear) rising edge detect enable - W */
> > +       u32 gsfer;     /* (set) falling edge detect enable - W */
> > +       u32 gcfer;     /* (clear) falling edge detect enable - W */
> > +       u32 gapmask;   /* interrupt mask , 0 disable, 1 enable - R/W */
> > +       u32 gcpmask;   /* interrupt mask for K3 */
> > +};
> > +
> >  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> >  {
> >         return (u32)(gb - gb->sg->sgb);
> > @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> >  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> >  {
> >         struct spacemit_gpio_bank *gb = dev_id;
> > +       struct spacemit_gpio *sg = gb->sg;
> >         unsigned long pending;
> >         u32 n, gedr;
> >
> > -       gedr = readl(gb->base + SPACEMIT_GEDR);
> > +       gedr = readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
> 
> Since you're already touching all these register accesses - can you
> maybe provide dedicated wrapper functions around readl()/writel() and
> avoid any file-wide changes in the future if anything requires further
> modification?
> 
can you elaborate a bit further on this?
I don't get how a wrapper helper could help to avoid file-wide changes..

-- 
Yixun Lan (dlan)

