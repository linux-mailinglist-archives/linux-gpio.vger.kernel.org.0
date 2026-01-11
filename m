Return-Path: <linux-gpio+bounces-30411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E2D0F76B
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 17:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D150304B3CD
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 16:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BB433E352;
	Sun, 11 Jan 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ6MJ9LH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1797217F27
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768150018; cv=none; b=TjCdehyHNdTG9XlVgG2/xSP9ba2HBb3ZDm9xCkD/IHpRH0JIYBxYe6fdSjvX3sA+pylbw3cKaC2UPeq2rW7/+9hUaGxROrUv8yD++OT0p1Dp7tgW9WaxzAihIZYIXwaIThOlZySHHCesdjLO+dqrSLUDsB0/87xwLfG5lKSciTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768150018; c=relaxed/simple;
	bh=EKeMRlHlw2Rgeq19TymBbPBx8wczT3GJe0/hQx0Xx0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uup4IRUDzHpfEwDPTt06PLTuvwu0pHrWJU2FqyLwcFAk0OJKPKI6QR9ScaC3qUbHTX4/sVoYcoisnrwd+Ems8lAHuXY2UcvjaHKM+2xrfHE2FRRxgo7c97CiO5EPVOZrURzeq818uUSjAnVNeYlXbH8G9E66Bzbn2BpYrcg3n44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ6MJ9LH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so30816725e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768150014; x=1768754814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXXIjf5GUwJDqboXk/BUgrbJnl8FqgJPhbiKhNF9WA0=;
        b=RQ6MJ9LHuABBd9ogQNkQfS/9O3RDmNxuR4vrJ14RGOcQgHchoqwJE5e4RpNtRWWYU3
         OfEqQYJktCFKykX/DeyKL3ddpF49HcfKEwe+g8n5+nEDREgPIZnH8/F7fGLYqByTJwSW
         1jgwVLD/DXoenWTSNiv4OCvV2PDZgWRDT/lxbdy5Wo3wB6+DdrlP9Qs8xowncs04aGfS
         PWW2D6x0BnEU4D/hYc2bDaXkjVp58VIFosSRTQ39VgPP0GhydlCDF+hCDfJUxZsD7i2v
         +tH/ovKHwBrvUtY2+Mf2DK2l1ErL0+NOUPJlVCZjdFtRFH4ObnucSJrKL3N3g0bMSmZz
         1YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768150014; x=1768754814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXXIjf5GUwJDqboXk/BUgrbJnl8FqgJPhbiKhNF9WA0=;
        b=PMDm8xuTwiR678cSn93GGfgrtcyCtBXvH9PjcKHdxJuWbtO1dV+/iYNsupAp75H7El
         uk5pc+TfBowBVcHP3kUEg70S3euFjBXK9G/zQs4AN73RFvgG915Dxpf7ydS2ic+5xbmp
         QKqPSZKQiJahn5538kgwRqtSSaa/LfmiEGdLOgAFbVLkhJt/AOzpnAc9UMOAI9n0dkVw
         K4XPA3D3s9kF4YLrRNK9VXvWsNXsvbTDaSU9D5ThASwNh9MRwjwNdqkQY7GyKClCwMrA
         LcnO8OFFjKaOUf3HUztl+36jsBDSbPCcGgpNbQBhqqqWuSjS5qme23APL/UPSMm8G18y
         mzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpajZ1imkrq1JTwv5vVQdEO5jg+vuq0aUa9+0b2GdBQs2/r/ga/WIAXLiDP/zPp5jaiEqAcuLvMxZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwXk+MQksVnWAXr8h5uCCEj7zWNqSzup40IqJYmc/tMuAaNSKzK
	1KoIILhYBRxKb3Vn3dZzI5brozms6JJs+Eeux51HebjMJRWjO+JVBCcy
X-Gm-Gg: AY/fxX7DL1/dJQ37YB/7Ae7mWswi/NP4Bk86h8A+Gclz7G6pOhv/5jC1kmpfPeV2kDE
	yh1sMC6t/wLPGFew/OAAgcEGB+D9PdcGT6wrKYSHe6PNqEMu9z2Tbpqd2ihqnxnw4Z2UomWWjeC
	8vCAzj4aZW/508JSkObyC5HnQRQbL+sPcRhd0+b2hrYG/WYD/DGzhKoNMXjYgYt7bCvjfkAzs9l
	qb6Eh7dN5kgX3iWYD4LQjPI6qtbnM0ebCMpYFg0KJ2x+ZYxuIfZNDFIZzr8+KNxyJAWk8A4wBxi
	uO3jDFLvIQCzWOQuzdbFwr6nO+fxOusjOaV2I4S2yS69yV9VrX5ThO2h9DL6jP4TwYjvY354ROL
	Lef/IXpaHGXOR0CRwFucYEvY5829N4mCxB44ag6+DOBkFX1OtD7/F+beUKJkybygi8+WWIXrK+M
	tf8CYM0rlU2fBBXACKnVF4NG3Ut9AmFNJLbgt/T5nZz4P+okxPVRdR9479tXL/xD5N
X-Google-Smtp-Source: AGHT+IE/2VrwBn/B2S3fOGbBdhWgsr/s+ZUXrx13BwQ/UzL/3rHx0t494nmIc60K28I7RKjr7ysiHw==
X-Received: by 2002:a05:600c:a08:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d84b36b7emr195633575e9.17.1768150014007;
        Sun, 11 Jan 2026 08:46:54 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm110128995e9.3.2026.01.11.08.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:46:52 -0800 (PST)
Date: Sun, 11 Jan 2026 16:46:52 +0000
From: Stafford Horne <shorne@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <aWPT_HsRVC0dQ_j6@antec>
References: <20260109134409.2153333-1-shorne@gmail.com>
 <20260109134409.2153333-3-shorne@gmail.com>
 <20260111-bold-wolf-of-champagne-58fac7@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111-bold-wolf-of-champagne-58fac7@quoll>

On Sun, Jan 11, 2026 at 11:18:42AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 09, 2026 at 01:43:53PM +0000, Stafford Horne wrote:
> > Add a device tree binding for the opencores GPIO controller.
> > 
> > On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> > opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
> > 
> > Link: https://opencores.org/projects/gpio
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> > Since v2:
> >  - Fixup patch to simply add opencores,gpio and add an example.
> 
> Simplify? You completely changed the meaning of binding here - now
> device is not compatible.
>
> I don't know which one is correct, but your changelog must explain why
> now devices are not compatible but they were before.

Hello,

Did you miss the 1/6 patch in this series?  We add the compatible string to the
driver there before we add it here.

Sorry, I thought the series and the over letter would be enough to understand
what I meant by the "Fixup" description here.

> > Since v1:
> >  - Fix schema to actually match the example.
> > 
> >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > index ee5d5d25ae82..d44edc181e0a 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - ni,169445-nand-gpio
> >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > +      - opencores,gpio
> >  
> >    big-endian: true
> >  
> > @@ -160,3 +161,11 @@ examples:
> >              intel,ixp4xx-eb-write-enable = <1>;
> >          };
> >      };
> > +
> > +    gpio@91000000 {
> 
> Please do not grow the examples if they are exactly the same as other.

I figured this is a new compatible string with a different set of 8 bit
registers so having this example would be beneficial.

> > +        compatible = "opencores,gpio";
> > +        reg = <0x91000000 0x1>, <0x91000001 0x1>;
> > +        reg-names = "dat", "dirout";
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +    };
> > -- 
> > 2.51.0
> > 

