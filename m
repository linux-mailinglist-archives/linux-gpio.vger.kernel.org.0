Return-Path: <linux-gpio+bounces-1460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAB8131AD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E22A8B21455
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128805675F;
	Thu, 14 Dec 2023 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4H0hrBv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A83111;
	Thu, 14 Dec 2023 05:35:05 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db3a09e96daso8264419276.3;
        Thu, 14 Dec 2023 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702560905; x=1703165705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3s9nt/dkGYTh2W2+GQ2SmWUJnneEpQA8EgYbyB2HA0=;
        b=U4H0hrBvihtKC/A06Azu7/Ymbqle9om675BxT7K85PHzzSM/aZpAQiIgvPyI2ar+tU
         XxTFs9iqpMtKoNJadt54fniW7/0CYraTdmxIh46jkDbCOaUFwu01gtTKg1MmKRHzWF34
         D0+YApRNryJ5CCQWyIrFyaex1vnI0L9iOOjStoKT0AmTsAdIBJF/oXeOTAv/NzPK/+8Z
         GvXV4EiE1ZnN4fVM8M+37sAxpX/4rnoOhftjXnDHGnH20Cnz0OvVUMiRxa0eAyTofc2m
         GFns//waV8i5tgycp/5BGk2ZgyqbBuYJ0ScT8cvbMwcDPQQNl2Eg9s1zVj97fnaeh7Wv
         cUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560905; x=1703165705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3s9nt/dkGYTh2W2+GQ2SmWUJnneEpQA8EgYbyB2HA0=;
        b=kpL+RGNIBtWQDIeLX4/jwCGXzylquu0qWpq1/TGURPhapazBe0LTl6BuiBcoRc4ygN
         vOPKPuypxPLMuY5m/SSZCKF1KLqFDCZ+NWw/p+vjLTc7kbLkk0gPHqfTk980JHij5TG0
         Dm0Gyl8SXJbLYGBg4Tji55rL6qF7ms9nmjNrVKdrBfujBMb0D/c8Ceqq8kCiOA85ZJbW
         7fd62EE4MNU+FISKxEMVk0A3oS44waDsE/IybtzY3+/3iEhO/1roeFGto4h+WFdEYf8m
         yKSmLLaLEzp8Gfk5RT48ffXc0aXRKpQgmX160x6TTWkx+kdRK56KyA+Azlc8wDIVSNeX
         XCHA==
X-Gm-Message-State: AOJu0Yze9DT/xogQL4T3PqQVAwqVrijXneVsXRYj4S7/qTov6do5IH4+
	Dj2nuq1Dm1CQq2o/kkggqh5dFueY0qCP4nzFUto=
X-Google-Smtp-Source: AGHT+IFH0sGhWqrMql6feIySTna7hEqbkNg/aDh9joX9iMx2qR+eNM1NkuEkHw2rj+og88fzdOt+ITN7+3dy/pW4Z6o=
X-Received: by 2002:a25:dccf:0:b0:dbc:dc60:1e36 with SMTP id
 y198-20020a25dccf000000b00dbcdc601e36mr1110925ybe.36.1702560904819; Thu, 14
 Dec 2023 05:35:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213190528.3751583-1-tmaimon77@gmail.com> <20231213190528.3751583-2-tmaimon77@gmail.com>
 <ccaefd08-161f-4aa1-acc1-5216c5f7f7c7@linaro.org>
In-Reply-To: <ccaefd08-161f-4aa1-acc1-5216c5f7f7c7@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 14 Dec 2023 15:34:53 +0200
Message-ID: <CAP6Zq1i42ZUJmt_=VpLa6e-gzOndMFYL-Tuc1gEPr-fARS3VBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: arnd@arndb.de, pmenzel@molgen.mpg.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments.

On Thu, 14 Dec 2023 at 09:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/12/2023 20:05, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> > Code (BPC).
> >
> > The NPCM BPC monitoring two configurable I/O addresses written by the
> > host on the bus.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> > new file mode 100644
> > index 000000000000..c04302a1d52b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton BMC NPCM BIOS Post Code (BPC) controller
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description:
> > +  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> > +  addresses written by the host on the bus, the capture data stored in
> > +  128-word FIFO.
> > +
> > +  NPCM BPC supports capture double words, when using capture
> > +  double word only I/O address 1 is monitored.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,npcm845-bpc
> > +          - nuvoton,npcm750-bpc
> > +      - const: nuvoton,npcm-bpc
>
> That's not what I suggested. I asked to make 845 compatible with 750.
> This works, but I want to be sure you really, really understand the
> consequences of this.
Did you mean to do the compatible as follows?
properties:
  compatible:
    items:
      - enum:
          - nuvoton,npcm845-bpc
      - const: nuvoton,npcm750-bpc

Appreciate it if you could explain what is the difference between the
compatibility suggested in V3?
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  nuvoton,monitor-ports:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>
> Missing constraints, like min/maxItems and maybe values.
O.K.
>
> > +    description:
> > +      Contain monitor I/O addresses on the bus, at least one monitor I/O
> > +      address required.
> > +
> > +  nuvoton,bpc-en-dwcapture:
>
> nuvoton,double-word-capture?
Modify in V4
>
> > +    description:
> > +      Set DWCAPTURE bit in BPCFEN register that enables double word capture
> > +      according to the first address setting.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - nuvoton,monitor-ports
>
> Best regards,
> Krzysztof
>

Thanks,

Tomer

