Return-Path: <linux-gpio+bounces-25759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39DB49996
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1556D442752
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A8723817D;
	Mon,  8 Sep 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JChBP4GH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3008238C26;
	Mon,  8 Sep 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757358897; cv=none; b=eU8VCxLUnsJPtE6CipphjvFweHDvef/9i3oIYgiC6Oz5J0BtiH0yHAIXf9dnCyta6EkYFzR4gfSSrtvarcCZ5TiYM9BS2IHllofgbizyyZ7sHZT2Wsn/t3aLTa3JCOZmHGM9iMOtJGGVlmM1M5qch5rQGWoVpRfd3hI24AS1BPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757358897; c=relaxed/simple;
	bh=QXGuf1VVAykG+B3ZsO/oBKnwI0j3Mud9gIZCGS/X+ic=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2u6uGPkLgLv2ZPkSkK652wuwCjOTxj4XYPAoTQJMSuJ5ofABTvNWdPhQNmIXZPXD9BKv1Nsb0LJEmHJTsvzI4IJSsQnsg+vik/gbIPCC3pB3J4gjuICJ564GDHX5O28suPjGho3dcrMRzd3yFRS7cYK2WD6oTZyaBOb9v1Dhos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JChBP4GH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so2239091f8f.2;
        Mon, 08 Sep 2025 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757358894; x=1757963694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=srx4MAFwGWE7Nwzpo2SsNjXaK3mzSAkkPEoW4/Hw/ic=;
        b=JChBP4GHSqB58LNwIbhm+xuf3HYtWJ53IzupCXneqbP7mOJSqPTK2LtkeBwBCf6mGd
         yniUnGkfRCb3Syvqa/ZAnGYq+kgg1yPHD3oRNnPR9szSQnIWZwrQDRawy1Nt4Wr9prh5
         MIEP4j8xmwoxNQ5/D9ycQbILdIvu9Ayv/fXl6qd7ecTGYvwdovqrBofE608CC5DX08Qn
         LRNta5QdPt1EctvJ8WGSqWqoKW4EomkWelqGPrTc0+7BvJPuDbuetyeiyUXInJzLPvo7
         pEKLqNjztHIeg7Pcsq4YaeRhtPtTimJ+F82tBKCCH5p21LQ+YQhbg6iMbSOXAzdyCmi1
         c2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757358894; x=1757963694;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srx4MAFwGWE7Nwzpo2SsNjXaK3mzSAkkPEoW4/Hw/ic=;
        b=H3SZrw1PBaYmTR/m089b10lxJNn1uIzM7D/wkVEJhWlWWiGl4eRXX4i7xNjIgIyHGJ
         RQ10ojQYa2kAL6fMsud/HDNvfSUKH8Qqt2apnsVkqbPIvT5l7Ugwv/h0zvvM9h+TD5eg
         v9Ksx+yshcRtUA4lcEo2AEhBQlHVIjqvbJYo8qt2C/BdRFQ/dehU/wcd8IQtkDXAG7rF
         ttANoc8EoaPQFgMLmCYgGmrDxaWKpgen1UHqV+mBYKIbeAsm7bQ+svI3Ci1oPhPMyvmm
         fTefqWyrlhEuy1ryc70vkOqwq+W0rAFFv6p8FVvG0X/HuKoU4yZh9bSz/upt1Pgj6DKO
         0r5A==
X-Forwarded-Encrypted: i=1; AJvYcCURRk4YY4yBfPZ0wnPJmM6a5FFgXl++Df+O4Cpv23RDP/d3jaokTT1zNFI9p0KAXmdYau36ddmTgXt5InpW@vger.kernel.org, AJvYcCWC8PhT5lyCsB26g5YaEIWv4duFH/2LVlcm2sLLyBac3DKTjr99/BVIng/umpwXOCmhMXt1belzR4hg@vger.kernel.org, AJvYcCX00y1kps7rnDDt13BlmqcaRgqwNFecPssntlTSCRe8gVGfo5BwagczSGeHqrJqmYXk8sIaXd2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0N+HAhPD9RyA5UAIJ9cGXVkPaEWnhMsWa10pJKyguLE9Aw1KE
	PzGzWeW+9oCr17tpuzpLTLGwOzwwrKidf851BEkuqQLyXMWLoVNOg2Tx
X-Gm-Gg: ASbGncvwMZUXmwPk6gHJjY6ofuABOuCTn0jUhMIkq6hk5o0sRDp9YfMkQ0LvyKCVP7T
	PPlv4QSWCAPZXCukQwya9yymmukdLglDGnKiLRy8AokG2A6Bo2ESoU2oS/m2+X+kEbtHc/T+fNw
	Yd+8aqPTyp9XzjtNs+L9ifl6ndCKFfM38Ugp3iYE6EjSiDzkMph5208dNCTXAFAh6DM9hUdj8X/
	A4h8IXR3pwfclPYX3rxk6tQtpvlkL1oCZ8XD/AI0sthRl16sNmKSr62gbloc34TZoeFhvm+UVAE
	TqsMwb7iRY06NHx7rF4mWURCNHcFgTRK+fg/20UIAvUw81ZdQ18/SLDXhUkSv3hbZJve/zv8eYN
	enEXvudGFklk7wiNegnI6mHGxUINw1+4RGfmX01UjZy2pygInjc9H4vABmg/fiL67c1v2Bs6myL
	NGLazz
X-Google-Smtp-Source: AGHT+IFziGLQzNAImKhYRQ8IDTrD1/2WSj934yaWV0EXCVxUAxpFR9rChLUkdsHXYck7WZfp1SktZA==
X-Received: by 2002:a05:6000:2389:b0:3c9:f4a3:f145 with SMTP id ffacd0b85a97d-3e64355556bmr7434762f8f.27.1757358893920;
        Mon, 08 Sep 2025 12:14:53 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm202559135e9.7.2025.09.08.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:14:53 -0700 (PDT)
Message-ID: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
X-Google-Original-Message-ID: <aL8rKX72YDo7iU_V@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 21:14:49 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
 <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>

On Mon, Sep 08, 2025 at 09:06:03PM +0200, Andrew Lunn wrote:
> On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> > On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > > With further testing with an attached Aeonsemi it was discovered that
> > > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > > probably caused by the confusing documentation related to these bits.
> > > > 
> > > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > > is never actually set but instead it's set force enable to the 2 GPIO
> > > > (gpio 1-2) for MDC and MDIO pin.
> > > 
> > > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > > 
> > 
> > No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> > that the MDIO pin can be muxed as GPIO usage.
> 
> Then i do not understand this patch. Why configure the pinmux for GPIO
> when you want it connected to the MDIO bus device?
>

The usage of GPIO might be confusing but this is just to instruct the
SoC to not mess with those 2 PIN and as Benjamin reported it's also an
Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
(that is configured by a different register) but it's really to actually
""enable"" those lines.

Normally the SoC should autodetect this by HW but it seems AN7581 have
problem with this and require this workaround to force enable the 2 pin.

-- 
	Ansuel

