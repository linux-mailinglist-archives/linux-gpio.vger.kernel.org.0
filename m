Return-Path: <linux-gpio+bounces-24758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7062EB2FE1C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 17:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C92685FB6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E952DE6F6;
	Thu, 21 Aug 2025 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G4Ns05Zt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63025A33F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789196; cv=none; b=K6bjxd8FEUQEZXdLshcyLCNhl9uOYSJBDWqss+TcV4RttytqYWxzGo40ZNxdUcWJJl7eiMYF06EZCmiaffFE5DN0y3crQQgwOXnT6C7hlOt+xA3NJDNk4Kf3fW9a86XH4oce3p/ljfLrftn89FoxRw8zTXeX5wm9SYU2mqxewa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789196; c=relaxed/simple;
	bh=9nQwhppjTEwgUcisyV4d7XyXTyKaChRyMGDsYQad9o8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3dUDfMKM2LLwNei8oa3dAXWIa8B+GnJJsJLIjii/iiNcyUMxORfpxMlRzReoxo0eeeaffeA3iL3kowwcsqTLQQ3S1JUCoilec+KUznSvcGxxxcrTxFhC8ecJ37m/udztLlaMLSIi3lqTyPlmFcZLEtcQIaLg3Cae1ZdCa61Ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G4Ns05Zt; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so1519541a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755789188; x=1756393988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xtxRuaoXngMWzDes/bLKJ29G8INr9oKLKpCWom6nFQ=;
        b=G4Ns05ZtejOdEM1fPpWd1dKNjGt+h7dkwglwxgHpPFOmWbvAsf3OWICaSmQiL3ZFtq
         sT2gVGjcN4BZbJF7YNgiWsCDIk0ziesqptb8RcUaIxob66oELeYFerX8SU2Dr2KeXMvu
         5dcp3DTefexDtsPaWuypX1MZgV91Ug6vQT8Nt4s/Wi16DtiAsryb3fPicbeo/YkeVjLT
         kYc1cyHHwKzEQYNw9Ls+xdjF9IVjxB9zvOKey3oI1b2WstiCMSl5gNYswiwLv3eFmy4+
         w/NE4w3in73iilQVvtScRGusvocaFJROUmDo+JUksKEWrAC3fdFSOKtZayT52COYMDlK
         DC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789188; x=1756393988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xtxRuaoXngMWzDes/bLKJ29G8INr9oKLKpCWom6nFQ=;
        b=qOB3hPHWsN0lPOEx0Prj3xHlo0ufN5LkH1N0dtbeWKQ0jSDAnXPyfz7XbYwMHt3btd
         NZUugY9mP6opFmh3xxsJ8hhRBlFFEr6kul+yx/QPeQKp7VVTPiE7odZtIDbQsQthNR/S
         5EuzLiyTwMAvjL3QZ+qt/Lnlt4g2m1iEtIEMwiZ7F8HaRB21ZdXZ64n5qGO8vQT8g3Bz
         pvZA9Brp2s3uyT7WWkXnBrl3y6Fr7T6zs/BliLvr1xW+oGl5gpBPFJQEDQbW6Mamoy3e
         v62scec/BnVTLk43f66zCB51gk8jMBDB4g+O43AjsO4zpcbdmASR5jSF92OS9K6lVs70
         DtTg==
X-Forwarded-Encrypted: i=1; AJvYcCUMTM2O4o4W40YrX4GBfgKlLIjTPfIhOW44asxWnjtV6DT4U4zxXGt7hScvaWha/MsIU5FyLqdHT2WP@vger.kernel.org
X-Gm-Message-State: AOJu0YzDviNM2zMSJDEW0cUB8U6GMtd3xucqHIpb4p2b40JlfDePvq/F
	kBQ7pV0toxpwyfYgdvy1r3uZUdR4RA/Y1v6SD/9XL228BCncYHzOvV6PvWjEzZB/lrg=
X-Gm-Gg: ASbGncutoo2l9EQTXQX/fhxEiY36ZJmNmFEZBFf3Z7LJzhmOukdI1WYXaW4yYIhoixl
	jNgWG5ewa4P0I3xSeYA2jGIcZDKuf3TycinXtkNEDH3XWMYHGRdjCDgOc90vIlTkvnf3LbCKddQ
	AvGcj+2HsaKbdp2DkTwZgYFAXO/1vyARvN6BnGyf5vjTixJ2qI66eTuMFi/lg9N3Qb7WLQ8+yhQ
	JElc2nOIt/Rr4c40EAGaRGOIixcnS/nCxiVhf46WCxKMuehKs/FsWboGByW2NSp+LL1oMQ83FBL
	Qa/YwrjtA+td0VgB8AMK+xmzlYuaVsi+dJqL+cbezztWpNYbbTACLPA28YTxPwAw1PRcqIo/Mp/
	Rfxxb4K3JcW4JL04jQIBZhjsvixex6pJ6/BodpGDLJ8ST6eUi3r4XBBjspzKX
X-Google-Smtp-Source: AGHT+IET+pViMkmHfWuU+dAIph0lKCRKrp1cWSJUrymAHEUx2uNDRZI8YqflErDfwiyzgFbu3IhI8g==
X-Received: by 2002:a05:6402:84f:b0:61a:2cac:890c with SMTP id 4fb4d7f45d1cf-61bf86ef69amr2362795a12.13.1755789187656;
        Thu, 21 Aug 2025 08:13:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a8ca8660esm3796686a12.10.2025.08.21.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:13:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:14:59 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: serial: Add clock-frequency property as
 an alternative to clocks
Message-ID: <aKc38_NsDy4G1uRy@apocalypse>
References: <cover.1754924348.git.andrea.porta@suse.com>
 <419658ce1a1009c6f8b7af22a02b278cd695dab0.1754924348.git.andrea.porta@suse.com>
 <d02626bc-a00e-486a-854e-b4555c11ee85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d02626bc-a00e-486a-854e-b4555c11ee85@kernel.org>

Hi Krzysztof,

On 14:02 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> On 11/08/2025 17:19, Andrea della Porta wrote:
> > The UARTA controller on BCM2712 connected to Bluetooth chip does not
> 
> Bluetooth chip does not ask...
> 
> > mandiatorily ask for a clock connected to the high speed baud generator.
> > This is, in fact, an optional clock in the driver.
> 
> ... or driver does not ask?
> 
> Please describe here hardware.
> 
> 
> > 
> > As an alternative, the call to uart_read_port_properties() ensures that
> > just a simple 'clock-frequency' property can be specified for the clock
> > value.
> 
> Don't describe drivers. Describe hardware.

I will try to test whether the driver can just work specifying clock instead of
clock-frequency in teh DTS, so there will be no need to amend the bindings.

Many thanks,
Andrea

> 
> > 
> > Amend the bindings to allow to either specify clocks or clock-frequency.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../bindings/serial/brcm,bcm7271-uart.yaml    | 19 +++++++++++++++++--
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> 
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > index 89c462653e2d..96697b1428bd 100644
> > --- a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > @@ -40,7 +40,15 @@ properties:
> >            - const: dma_tx
> >            - const: dma_intr2
> >  
> > +  clock-frequency:
> > +    description:
> > +      The input clock frequency for the UART, Either this or clocks must be
> > +      specified.
> 
> Anyway, don't open-code schema in free form text.
> 
> That's legacy property. You need clear explanation why.
> 
> > +
> >    clocks:
> > +    description:
> > +      High speed baud rate clock. Either this or clock-frequency must be
> > +      specified.
> 
> Drop last sentence, Anyway, don't open-code schema in free form text.
> First sentence seems redundant anyway.
> 
> 
> >      minItems: 1
> 
> I'll fix this.
> 
> >  
> >    clock-names:
> > @@ -61,11 +69,18 @@ required:
> >    - compatible
> >    - reg
> >    - reg-names
> > -  - clocks
> > -  - clock-names
> >    - interrupts
> >    - interrupt-names
> >  
> > +oneOf:
> > +  - allOf:
> > +      - required:
> > +          - clocks
> > +      - required:
> > +          - clock-names
> > +  - required:
> > +      - clock-frequency
> > +
> >  unevaluatedProperties: false
> >  
> >  examples:
> 
> 
> Best regards,
> Krzysztof

