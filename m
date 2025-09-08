Return-Path: <linux-gpio+bounces-25772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8068B49B75
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 23:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 774633ADBBB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4E2DCF6E;
	Mon,  8 Sep 2025 21:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehsYEgyz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EDB2749E4;
	Mon,  8 Sep 2025 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757365517; cv=none; b=s3Skom1TvdHJE36QZPkrPXhDtQyExZrW1iT8G1vAQEqqLzFZTxO9/qAczD+iU1k0hic6pZiQkbyBEIE09+1T7iApoCKm59hmwhS2oTD3KJR+JiqWx7SQTJea5EtfhGhO9SrEoOkMeH0iJfvguD/6/756z3ojlT/lA5/Z5hA4BaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757365517; c=relaxed/simple;
	bh=SjhPIsOXbnafUmxQCRUw77cLJlMAd0utMB+93J7XrTs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKR1O+jVhYHtWK4RJ17zt6QwAlJNT4Eof0SgGGP+OHzbpdYf7kuG1IzKVRPSOF0oaYKHS33t6wR7Te4jFdb+ew/IjX3suGgthuErjSeY+fXeLRYHEm0V9W5ZceANl+kI2Shv+x3yM5alEKdn1tedfKTOty5O5scRSMC9hDtEqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehsYEgyz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b9853e630so45727855e9.0;
        Mon, 08 Sep 2025 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757365514; x=1757970314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD7GjWaRllncs0vWRluquCxxcL1VUrY8PY0Pyck9z94=;
        b=ehsYEgyzg2WoMddWBYCnBIJg809OLaWl7j15Xjs5V0qqAKpch06xbV8S6DFGegvJjW
         hNPiK99ea5jsYT97qdPuOIFOqsVhnHLdG6qAnzegA6RYNIffwpjxGzVIB79p/j0iJmjL
         NuoEGYvKsilwN6Gh93jk18iDMPdHVZoC5tp65kxH1P9SzmUkaM0IjxYho9jYwwTKO1B/
         y4BgZagcxj1+F8l7RvbOQXcBqm25u8AT5ud6+ACqW4/dserfAXEq5DMMUfP3j3PEahYK
         vRItLHL59bBpHt+zIpZlESxKEWKMjVxQwZfIBxguGcBb7T1BAXTxqUKH27mZSSOH/bwc
         xs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365514; x=1757970314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD7GjWaRllncs0vWRluquCxxcL1VUrY8PY0Pyck9z94=;
        b=tIEktTXjB1yf9Fhw4JrcqJdyvy1S/HOQDMV1EkeRRzMVoHolbMWBau5MCohaZEUV2e
         gnENRBsjdrQgLgCqAe+9iXpXX6HB1lYr1Lv5wh1pD/YwbE16ukjuD4Gr7yKPY15X3QQN
         hwYWDKGrHVGNeUNO399rRA8nihl6aB7eJAQzu9OqLEleEHby9feIdqDKBkLaPoNwRXX0
         BaCzAOuF2ylwuhKAuXptjSdfxp2akLsz0MUQ8RfLH6QVsl2v9SWi+64N7x1j4r4Jhpsv
         siW802P9EQ5SNsAn1X4HTSFKmBEZ1YeHJuBowYFnW714XtDGjgLSSNrTu8n43/Vq34+i
         wQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyRa0KNL/wfZuht9sB8EZensuGJ5ut8kaARK6UutRW+rNlJsDScgG8jMcfl35mL3wmSVf3sNrJ@vger.kernel.org, AJvYcCWLW0gK7x9plSRTAAfhsgIXHIS6/0vyZt3BUw2ofGW3MmAZT81/235G5hvmY6Yig8b44I+KGfcdm4dcOI45@vger.kernel.org, AJvYcCXjIQ/Fjr0u31pIkio42JZ163B8BcUyI4lWXHeabsVBVMHjygl8vfpZNiBWfQ5JMdfGc6tZugjcVKkj@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbmQ1rQqVEb+iwkz6LxClNfyMf4r89bKy3nm5UxXvYDzwwsBW
	SWqwoMpeoV2h/fvUJeWRLuGKhFcySHmCsGijNSFhrEYKadXSHBIEuHbs
X-Gm-Gg: ASbGncuMYQWAEmUdXsa2YRu6fveZf96RoYh3ce92UAQj6fNgk+G5Hg9EG1mbQmMF9Br
	TtVGMbh6yvuzM++uFUJi53TGmqV7GpjKc7MPwX/QvqnaR525c0xlCty25Vlj+LhxosbyfzIP5oq
	tVymrdF9G4ECPUBrCBsqEeFVWKoQmbQj/uYJ6HKbyENR/KIBPGCcOJ9n2Hoh/eDU8i3wS7s4elw
	toN+oDfZefknZlBezIEhTeHRf00kMnJYbo+wISB2PTtD8Qa/HA2lygaTNT8qCJUwWSRS8+RBRGd
	vWaSeAY6eXw7+vK2458T7PLBEArPPH4jGvvUI+3I0RG+8wKnDG/oeZyBOFC0mjwxDjNekK2PiIk
	A7dLU6JfCJjz4cIlURyp69J2BPZ22/0kQWfkPh6lTuLTcTfQ1fSWh1F95kA4f6S+tBBOBhg==
X-Google-Smtp-Source: AGHT+IEjhWtTt2FqPYcZpCHMHRur4SWcQlNaJiusM1qV0CrfIn2kd8oGgSYbE1m3LqTOp3T97igKcQ==
X-Received: by 2002:a05:600c:5248:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-45de078401dmr81273885e9.7.1757365513615;
        Mon, 08 Sep 2025 14:05:13 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda202112sm160712185e9.5.2025.09.08.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:05:13 -0700 (PDT)
Message-ID: <68bf4509.050a0220.345893.9bb4@mx.google.com>
X-Google-Original-Message-ID: <aL9FA7MiwUBFilRV@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 23:05:07 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
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
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
 <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>

On Mon, Sep 08, 2025 at 11:03:31PM +0200, Linus Walleij wrote:
> On Mon, Sep 8, 2025 at 9:14 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > The usage of GPIO might be confusing but this is just to instruct the
> > SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> > Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> > (that is configured by a different register) but it's really to actually
> > ""enable"" those lines.
> >
> > Normally the SoC should autodetect this by HW but it seems AN7581 have
> > problem with this and require this workaround to force enable the 2 pin.
> 
> In reply to Andrews comment I copied the two above paragraphs into the
> commit message in the applied patch.
> 

Thanks for handling this and adding the extra info, I was about to send v2.

-- 
	Ansuel

