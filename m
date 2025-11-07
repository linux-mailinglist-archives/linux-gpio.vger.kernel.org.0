Return-Path: <linux-gpio+bounces-28255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6429C412EA
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705383B3DC0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABAC337B92;
	Fri,  7 Nov 2025 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMXcaIBP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6A320A38
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538325; cv=none; b=oJepGPYlWp0JD/FS9fGBLmz86S/THXs5fpb6kEXVadGMuveTe0EjKPd7OEEclnczu0drBrB4lifWspSaxSYSFp6QE+bjfgMYhO4NRnsYSwzwCUOa0aZA2/d4XXETO95lLKuv43S5fD1tnBVd0YIsW7UicLeY4Z1DFHgVjx720+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538325; c=relaxed/simple;
	bh=zcMWRLy2zTfSrZa7T+hCLM/4/N7QvFnX+Xx3zpNBBGo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0cEuq7ZvPRYeRax4hYBQxPc98mOmrG3a0HB9MJuUImf77Qi36ktkajjQ9zVm73F4j7+yAVa+sIscFxhIEE90YaP83hqzyEcx/oDlRKMOOdEP/AaNIzsI8rPVW9Rtz+2WOssp/Bbv/e9aNSwnErP91LnKdbVPUzkX2NfJ59Xayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMXcaIBP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso627959f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762538322; x=1763143122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=kMXcaIBP4T1ajPvHI5jq/hMge6Y30jyfxD7ylSxWWlnTwkKPXwJYlxcFt5R8hjXuk4
         DfJP6GP7u5O1D1Mx+4pS3l3MF+yrs1E5jtt85imr7GgLu1+emYH3OoHjbJrd/YoZcHCi
         qisvGamcAryoccGe8o6F04cDhB6+hOUV0rkcZ1qth5Zs3x6dZVYKK9OM77o4Ku/Qljie
         f5Quju1TJA6J/FsRiy0iQs3EbYx4MgBELz7LuAZhMsGtzQJQboydhzCovQb5/gGQspFQ
         U4HT52hsHwupqDYwIsSyEw20ElnMuIlWn1Q4vDcSs4lD/wSXrmABQTW8olaDvhRxrebl
         FP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538322; x=1763143122;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=j3MnskYdmIaZie85GECbtBRGWwNDMGSrv+WD4VrTlJhcKfpj/3zsdmprLxnIgXl7iw
         WsMYnLL0Gi6JsDX11XmZhjj4M7vVimgPo69YSID6qG53HA/a74ZiiQUZ8D38wtcAGeej
         CFcd2ECGBQf/j8tsOjYaJW5JLSyxZP9J4VAOtKxy+sabon7PRrEo+tYj12E4U9Jp8P8H
         Qmlv0peJoGwnMZCkcY4yrjGJ7DbRZb71cyjGgahEhIVsEPIEdiyBDhtOcfswWWwMU8Cj
         6OIYD7be/A4HHNal8p/hQxfY77ZeEvQl1NTEHzS2GxnMVmxBnW0PXcY4UwRnSlMXelEh
         tR0A==
X-Forwarded-Encrypted: i=1; AJvYcCWuWYO0NUjqVLcg/+FvY5S2nidZWmXzHlnfjrXORVY3EnttuWAICBA0GeaZ9Eng9YkCWv8O3Qmdw0Wh@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvglpUUR/UvdbHO0kN2BE4a1KvYimJtZdbNRbXFnqO0eFsaJD
	/bHbgv9QBaeKs1wxcP80KFjz1a4uwR8RP4AusVxP1+6f8vlQ7MNHCUgl
X-Gm-Gg: ASbGncsif20Hv9AvszadmB7xI4yTgfZyeFfOBPHxTSdcCXU/QtHvcesjV1WqSLHJgNP
	50xRu2U3E+DgJjz1tYda+1obz89iRVGabQeSBGBXlIriS7LsDivIiMBCjNqW6UgcIm9bWxEIcjh
	RksWuvcI/bzke0wYo5jAS5u6lVt2duFYr+PWnyjF/2TqMFrdIx4aPBSqSukJEcdJ55qcrZiZpIg
	JWMICBSXelJOw4hrA3KKuSspE96YySWoH8g3iAlA+XaJ8ZjDLATU8GLo155WyIgRnGeZlbV/EE2
	j27TX+43yBD6kbqFV3sfKap9QtSzpO3nwTU/7eL0/IHqxltiksecQi9GWp5TBLTQfl8II+01OTf
	jFy8utwqN4rN47Hpu57fl8wuA1FmaIdQV/oLgBk93JGzufTvM1p61uIURnrJbl9tH3lKsH2rcC4
	U4Nh39OX99lDvGlEd+mO82+Yms8tn0
X-Google-Smtp-Source: AGHT+IHxrsG4B2duEE/+GCKG0QyJVFEsIc/yuwXnmYOAcLA/FUrE6rMl803DqisMTH4v+FhxV5j+Ag==
X-Received: by 2002:a05:6000:26c9:b0:429:ef72:c33a with SMTP id ffacd0b85a97d-42b26f4be9dmr2506029f8f.3.1762538322141;
        Fri, 07 Nov 2025 09:58:42 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb801sm45371425e9.11.2025.11.07.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:58:41 -0800 (PST)
Message-ID: <690e3351.050a0220.15e225.cf82@mx.google.com>
X-Google-Original-Message-ID: <aQ4zTvBcOb-258Gg@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 18:58:38 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
 <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-jasmine-unarmored-e3f5d544a1b7@spud>

On Fri, Nov 07, 2025 at 05:55:43PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> > On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > > > minor difference on some function group (PCM and LED gpio).
> > > > 
> > > > To not bloat the EN7581 schema with massive if condition, use a
> > > > dedicated YAML schema for Airoha AN7583.
> > > 
> > > You went to more effort than I would have here with that conditional!
> > >
> > 
> > Well it was suggested by Rob and it's honestly a copy paste of en7581
> > with the relevant thing changed.
> > 
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > 
> > > What's up with this regex? Why does it allow either - or $?
> > 
> > It's to permit either mux-* or unique node name with mux. Pattern is
> > also used by mt7622 or other schema. Other use mux- to require a name
> > after the mux.
> 
> Ah right, because you can have the config properties like drive
> strength in the mux node, so sometimes a -pins has one mux node (mux:) if
> all pins share settings and sometimes there could be multiple, which
> requires a suffix.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Mhhh why not-applicable ? :(

I rebased on top of linux-next, did you spot any conflict?

-- 
	Ansuel

