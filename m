Return-Path: <linux-gpio+bounces-29398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A8CAE36B
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 22:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D32F03095E72
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 21:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4562D7DE2;
	Mon,  8 Dec 2025 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqTD+MRu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB17227E82
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228682; cv=none; b=gvqad2RPwb7qHZOsjVNaQK88CpQ2inXvSwWna+OZ0/bh0B6Ethj2dDnMNB+ysS1yWuWwoOPkk7ruRGNXHug1lBFBaFPJ9WZ457kx9EmlsADdlICWGZ91yBz8SDq+PkK86dTIkryFvuxYEcPOsIV1wq/bGiO36ovpoA7hyL57BKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228682; c=relaxed/simple;
	bh=7lZ7yFiwE4BfabfizLUm86ygg5oezWglQcFnqPk03BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQPLMWVUTQlBeXx0O4nb4bjsvHimSoje0r+OHoJ6m3ci1cfZZbnz7QDnl70imGdQLt5xyxo0Xy+5wqdfvPw1kTYluInRPgOGWmJv4GZkykhKph8sEQAltFpPZeXsPs/gPcmOEsCCjcT/fqUb3bQb1atENbflLP2auVzMigruzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqTD+MRu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so38579095e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765228679; x=1765833479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FevBVXsdxMvnzZIFlQ7ZnJU5t6FuMkK60eiavRkgSq0=;
        b=OqTD+MRuf+ggNDx1WnpmEg4cE/RoBU+ipt1XZtUMbaz+BW+355TEGCSuaKiJazxc2N
         A5HB0OOuhZwMTV3JR4jhJyYe4jUREnY31z2O5E+xjH9R7P+DyStlpHM6xN05XZ9tqtaq
         L/xxwrVrMSLtCaOz+NpH2mKEfc8ozzS4zQDd4xlxzx2/2R/WuutaPzkqHGFjTW52+osn
         R4FtViK4LPl4pxIaRtIyuG8xFXr8+/Ci895DefvmkbUlRBBBTiDjE9tOn4Kl62gC5bbx
         4aV+//PYq61ImeFC0qMif4nR2OHpjs1kkxesuzp/DjJqSlgt/9r0YQxr811IgDg+Vm8G
         u3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228679; x=1765833479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FevBVXsdxMvnzZIFlQ7ZnJU5t6FuMkK60eiavRkgSq0=;
        b=lYy1Wd3tBnhpgp6aw7QvRT4XG6dwSyMFM+Yvdf3Gjd30Vwi4xPwwN0EsjSWWHDDcVH
         jkD3bLbvfsvX5/M6pI7oTJ7FBEvRYJFPgwrCtJS1HYznhvEE/ZLs5fkiKpXbx8CjR3xu
         Qna4+dEpr48OUIWIoeUln86405Yqh1AcdBRvA6wT/8lARtvCCwti6WJjPfzUv1TG74DL
         qm5+1QS+47eUXFoVWMyZl8i17/X/7cz+B4LbkXHXLvsB/Hvj+zkJ2FfB2B6g3Q9FLaG/
         mpb1c6rRjdeOZ9QLSYuXDQFeCILHnKKUd+6TmuUTb+mKh/pJjSozeaEykzpJuZwciPVA
         lw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDNexmNDfHqBQcryD8FE29mBeJ9TKefSpDl8o3AI9GA6RsRoBuU8DQJHsbOhToed5LeL1RjGL2Fy+U@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbIYexL971z7U5jbfrvStXHr5yLKO9k0RKmHH+FlzcKjVE/ZJ
	rOh6LkdFzDXSQuxNC/ZpM2QwtHmFxcPLlL8/KxLFed4WneoITRIGArKF
X-Gm-Gg: ASbGncvkYmbElE9oUEqGYK8t4DFQM4ebZhY0PZusy2EsjEmFsPlXnbqqUeUc8TLL3gY
	gKg0QjRTNy4CaCDreOAqlf7j5SE/5vmUpzY5xlAsMBoocH1bEEx3DBUdKNl6rJT34Pbn+SEHJFh
	nb51OW0/2YmjReL1Tacg9zkux9noqyWsYB6wqaVQ5BqbZl7gQd/Hibg+u/+bwFv7r9UND43dZE0
	6wUeXgBwcFbUVIPcHX4E5zsVQ/qcua6RYRF+ho6CGoqIBPQy6Kmd/fco13kjHEuExG4SLJTsoBS
	VXDnG9wbzZDM67FZX7hYP8YPFusUgw1DZOVrthGKFlX+5+KipUfkZdWXYOP3nVm/Vw4S/mXLzXs
	dQqESA9G2XAgIzVdnnxdEWjq5/MRlp3y1aQfHgLC344lteq6bMTZniMd5wBns/bUuWDVJup1lzi
	sZMu2wL3z0xP56jwk1XhEXlM6YS2ONxm2TkkGm+hAroWnEhYbo4DeB9mWDmKqFE9uj+a4=
X-Google-Smtp-Source: AGHT+IE4yIfqhzMNdQUtI3A3IPxOwF1ZjFVLCMqKqyD/wHiW98WHchIOle5of1otFBu+XeUJTcxuQw==
X-Received: by 2002:a05:600c:4f82:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47a6f9b153amr68618885e9.8.1765228678559;
        Mon, 08 Dec 2025 13:17:58 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1226:7701:cdbc:9893:8abf:1309])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d810c49sm3855035e9.15.2025.12.08.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 13:17:58 -0800 (PST)
Date: Mon, 8 Dec 2025 22:17:56 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: Add adi,ad4062
Message-ID: <urniyc27qw5ex6jrwqilqykkcbswxbxlsdshnxqcts5gizdaly@a2ncsddzuyh2>
References: <20251205-staging-ad4062-v3-0-8761355f9c66@analog.com>
 <20251205-staging-ad4062-v3-1-8761355f9c66@analog.com>
 <20251206165822.778606e1@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206165822.778606e1@jic23-huawei>

On Sat, Dec 06, 2025 at 04:58:22PM +0000, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 16:12:02 +0100
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
> > Add dt-bindings for AD4062 family, devices AD4060/AD4062, low-power with
> > monitor capabilities SAR ADCs. Each variant of the family differs in
> > resolution. The device contains two outputs (gp0, gp1). The outputs can
> > be configured for range of options, such as threshold and data ready.
> > The device uses a 2-wire I3C interface.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/iio/adc/adi,ad4062.yaml    | 124 +++++++++++++++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 130 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml
> > new file mode 100644
> > index 0000000000000..a7a2ad761d1f0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml
> > +  interrupts:
> > +    description:
> > +      The interrupt pins are digital outputs that can be configured at runtime
> > +      as multiple interrupt signals. Each can be configured as GP_INTR, RDY,
> > +      DEV_EN, logic low, logic high and DEV_RDY (GP1 only).
> This is a bit confused.  logic low / logic high aren't interrupt signals so I'd
> not mention them here.  Maybe something less detailed such as
> 
>     Two pins are available that can be configured as either a general purpose
>     digital output, device enable signal (used to synchronise other parts of
>     the signal chain with ADC sampling), device ready (GP1 only) or various
>     interrupt signals. If intended for use as a GPIO or device enable, will not
>     present here.
> 
> For the binding I'm not sure we care about which interrupts are possible.
> I guess even for device ready we might treat it as a onetime interrupt. Probably poll
> it though - which requires a GPIO not an interrupt binding.  If we don't need
> to use that mode (and can poll a register or something like that) then no need
> to mention that bit.
Hi Jonathan,

Device enabled (DEV_EN) and device ready (DEV_RDY) are not implemented
at this time at the driver. I believe it is fair to briefly mention in
the dt-binding. I will use your suggested description.

Best regards,
Jorge

