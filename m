Return-Path: <linux-gpio+bounces-30075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA167CEE82E
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 13:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC5F30402FF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 12:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FF930FC00;
	Fri,  2 Jan 2026 12:20:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2BD30F93F;
	Fri,  2 Jan 2026 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356454; cv=none; b=M1YCXLu8yNzslR8n5uHpNNag8z4G77oCYq/KkQCyWT/konYa3KpWRXpCSHLf225PpbLsqFwNNTIZnEGU6JH4XxQKVvrSRrnj5Ik9RNQUiZsyXr8K0xGvt8QXnZt0T/S3c2IOIH6p/pXNEZb8D2f3AteP+mzwavjSQVAxwkV7K7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356454; c=relaxed/simple;
	bh=4Mdq6hZB0+/x5dVwQ7uZ67F5C7DJej573g6EGXHCG1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWiFhQ80S4wckItSZ2HMusuCFFb+apSX1ijxvF8EerAkQaMwc4fQmp9qmzTwMEVBHoXn9ln5BZ1Nw/XYUfeeRMMsRKcMEPLnOH65Nk7vwj8wbJWD8AAFX0dHBafR3U+uuCol3I/I2jKTdBOAA5DPH7Nq4jNzwZIq9kkwAl4D2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D5F8D341291;
	Fri, 02 Jan 2026 12:20:50 +0000 (UTC)
Date: Fri, 2 Jan 2026 20:20:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260102122045-GYA2060493@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
 <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102113643-GYA2060252@gentoo.org>

Hi bart,

On 19:36 Fri 02 Jan     , Yixun Lan wrote:
> Hi Bart,
> 
> On 12:10 Fri 02 Jan     , Bartosz Golaszewski wrote:
> > On Mon, Dec 29, 2025 at 1:47 PM Yixun Lan <dlan@gentoo.org> wrote:
> > >
> > > SpacemiT K3 SoC has changed gpio register layout while comparing
> > > with previous generation, the register offset and bank offset
> > > need to be adjusted, introduce a compatible data to extend the
> > > driver to support this.
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/gpio/gpio-spacemit-k1.c | 150 ++++++++++++++++++++++++++++------------
> > >  1 file changed, 106 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> > > index eb66a15c002f..02cc5c11b617 100644
> > > --- a/drivers/gpio/gpio-spacemit-k1.c
> > > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > > @@ -15,28 +15,19 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/seq_file.h>
> > >
[snip]...
> > >  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> > >  {
> > >         return (u32)(gb - gb->sg->sgb);
> > > @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> > >  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> > >  {
> > >         struct spacemit_gpio_bank *gb = dev_id;
> > > +       struct spacemit_gpio *sg = gb->sg;
> > >         unsigned long pending;
> > >         u32 n, gedr;
> > >
> > > -       gedr = readl(gb->base + SPACEMIT_GEDR);
> > > +       gedr = readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
> > 
> > Since you're already touching all these register accesses - can you
> > maybe provide dedicated wrapper functions around readl()/writel() and
> > avoid any file-wide changes in the future if anything requires further
> > modification?
> > 
> can you elaborate a bit further on this?
> I don't get how a wrapper helper could help to avoid file-wide changes..
> 
here is my attempt to solve this, define a macro to register address:

#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->reg_offsets)

#define SPACEMIT_GEDR(gb)      ((gb)->base + to_spacemit_gpio_regs(gb)->gedr)

	gedr = readl(SPACEMIT_GEDR(gb));

please let me know if this follow your suggestion or not

-- 
Yixun Lan (dlan)

