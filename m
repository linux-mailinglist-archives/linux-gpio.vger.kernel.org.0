Return-Path: <linux-gpio+bounces-25299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D64B3DCCE
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7893F18851B6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B5F2FB63A;
	Mon,  1 Sep 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DqpdJwZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3B1DF252
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716118; cv=none; b=pXuSnHvFcdXRYvcPxRUOSWc99pTnnp3Kz8svRdmIEvOLL4Lrc7n60PnDuCxGu4XlYwV6AQaXdV/O0JeBN0gSlypkulq1bRK0GX1LSnLpaq9qxjuuR8Metnwr7f2KS22ZSc0R2fc+Z22cOfDbiNllTpSttvyaRHMB0aBoOCZA4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716118; c=relaxed/simple;
	bh=y9iRXq590XV9YKgrt7JJWzvjNNPhcah5oQSqjYeIvPc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9pAZwa+5ppljleL3K5oXMH71fgrsdLTixCsC1uii3AmiIxxSPRv1TsyknFqjrHflPc0OJikGkscRofgQUCIDI1Wr+O1Fw9VqrkowM4e/YkkW5k0SVTnSIdN2sgehuuHGV4kWoCuhecZ9sJz2grq/ugZ1dCXlgl9D1ho9AuMluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DqpdJwZU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afefc7be9d4so434620766b.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756716114; x=1757320914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrzB9NAU8AL+JbGiYOShZmT1xWel7aF8cSCJNbT1IGQ=;
        b=DqpdJwZUZddDLfG9UCnUnhpp1pOW5hCZj7UzHbwh0/rhuPrtNnAwe0ZviDzje8ZO3K
         TSC6oUPA433UvFHESpyIsz+6OFLv2v+uv0AWYymEie3MLBkKyG+bww6F43HagJ2DWbOB
         5N01vA+bGdhWl35idrljCGlwbO0nTmrn3QuYK+wTCuUOTYVVPE+2Z2voyPrm4gwp4td4
         FQL5vksx12rSCaKujAx/he3T52MJlhXHaY9YeZop0pjXmnQuTpT2YxY/UE9Nu48oQydp
         b0Ff7dpLi9+L/7nX/9dDnkejjzBDNLWplaU8JOAO8DbvAp4VaZCfjU4XdV6Gp5cPt+Dp
         rCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716114; x=1757320914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrzB9NAU8AL+JbGiYOShZmT1xWel7aF8cSCJNbT1IGQ=;
        b=qdFSWPgDlemMmq4BJ/hwvy4BtNpE32lgmSG52BA7PPeT0QfuXNAZ1nHlpMT0sY8ZRa
         Wd09XzlxcGFCKjM/4f1BFymo5H0HgBEZ2CcMkSaEF2IB++ZBkj3Dhi+SUuC3OfKICYCR
         hHNRQtZusDYfOCrcjV89+mbFW86tUxHMhZaTfxv2uxp9L//ypx4eZdAgodMtc0KQX+fH
         2GHP1oxps81xNcvo+i0Q0fEdKUG5MzbKt6EIB7W0ZZKvgh6fA30lfsfcS3EOI0MushzY
         XrqgkUmIUeunPRnNN5EYZuTRG85x1PYD12Nn3f3nEC+ahVGeRZ5l/cnvSz4DwA5oACHp
         DhMA==
X-Forwarded-Encrypted: i=1; AJvYcCUSXlaQkuzsMPk5eJ5tmKUNZWo/g/ykK5UlrNqHW+SiGT63D/BiTCgZFxYkYtjRyoaWCoWwbg7c29ij@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJQr8goNhWjwLg/oJxvMmblS0jvNPWY2KYIJbWtKz0lHKNMcS
	nJQm14qDs9il7xtOMUh41mA6Svv2ieR3tchvPPtp7uhBv2T8zZDSjjO3AADCjM642wQ=
X-Gm-Gg: ASbGncs1GnuoDL5YkoHHDW+PMp6+m9P3i8aJHLLltNbwmmGqf+3dq666vuy/N6TbDBi
	o3B2ZjBNZYiSiKiZAt+4oNxsbAzktCXw978YHs1SxPuvzQjWuig6CjlFZgn31/sbuG7AYo8MkgS
	NvPGJ/GbKZnpEyp4UVL2L9Wbf/TBH8xlq2ZLq7C9rm8eLSISj+kBHKfL5NzZZ9Sx4B5SX1/TQkU
	+DQvGff0+9jI/s50mMsOogYVKE8gGzI3U8pgTmQFTV12+5T5bPhdom9Lsa5uXuAf4coKvrdZSJ8
	CSeWm2WzHc+YLXmFx0bruSFxh5P8SyAwtO7MxwhvkjA/iilsxml+eX54XClZWmRRDPTCdtw4qAy
	hRY0G0tP8SrEbkkTGo5WJstw9wEfKdWfvd6rWsHwft4lPtuZFdrDphPwUJ57TWVUiryWxbuRtk1
	OZoj3MBvxZC59ZzgkS
X-Google-Smtp-Source: AGHT+IH2zSDfBqSV/fMxZqWNDlUTgT9uEj4Uc7dil2+MCQuXaiyEKD87E68kEKAxnY0UHRKOEarrsA==
X-Received: by 2002:a17:907:e8f:b0:afe:8f28:fd5 with SMTP id a640c23a62f3a-b01d9719057mr758066166b.41.1756716113939;
        Mon, 01 Sep 2025 01:41:53 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0410138d0asm408801166b.53.2025.09.01.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:41:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 1 Sep 2025 10:43:49 +0200
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <aLVcxYeMeQqHoH_U@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
 <20250829175957.GA1073350-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829175957.GA1073350-robh@kernel.org>

Hi Rob,

On 12:59 Fri 29 Aug     , Rob Herring wrote:
> On Thu, Aug 28, 2025 at 02:47:38PM +0200, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > The STB pin controller represents a family whose silicon instances
> > are found e.g. on BCM2712 SoC.
> > 
> > In particular, on RaspberryPi 5, there are two separate instantiations
> > of the same IP block which differ in the number of pins that are
> > associated and the pinmux functions for each of those pins. The
> > -aon- variant stands for 'Always On'.
> > 
> > Depending on the revision of the BCM2712 (CO or D0), the pin
> > controller instance has slight differences in the register layout.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---

[...]

> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    brcm_pinctrl: pinctrl@7d504100 {
> 
> Drop unused label.

Ack.

> 
> > +        compatible = "brcm,bcm2712c0-pinctrl";
> > +        reg = <0x7d504100 0x30>;
> > +
> > +        bt-shutdown-default-state {
> > +           function = "gpio";
> > +           pins = "gpio29";
> 
> Wrong indentation. With those fixed,

Ack.

Many thanks,
Andrea

> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> > +        };
> > +
> > +        uarta-default-state {
> > +            rts-tx-pins {
> > +                function = "uart0";
> > +                pins = "gpio24", "gpio26";
> > +                bias-disable;
> > +            };
> > +
> > +            cts-rx-pins {
> > +                function = "uart0";
> > +                pins = "gpio25", "gpio27";
> > +                bias-pull-up;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.35.3
> > 

