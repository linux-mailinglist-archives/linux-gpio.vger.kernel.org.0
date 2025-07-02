Return-Path: <linux-gpio+bounces-22617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F6AF58B5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562083AA0F1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00DF27C162;
	Wed,  2 Jul 2025 13:20:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811327875C;
	Wed,  2 Jul 2025 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462401; cv=none; b=Y+qBUV0SD1BBe3Io0u0Y4gqTWA+jduMdjJOqaCfSC/6b9BZCo55DLLSiigKxLWDjHgWTTa56APbzCOjVcXOKzdQzCh4+Xc18aPlLm8uqsodkli0addmhnqM/G0BtX17/HNbE13SAj+qBBQ/aNwotB/vRBzKBdHAULOE3L1i6Rak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462401; c=relaxed/simple;
	bh=85ruyl2LVlHR8nSggDDFRbuvkEepOfyZN7EwSafKY6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYCH2TJ1lfiybuD/QBygqw4T+fe4mhCcUyJnO1Z0YSGizrg11nT++Deifvz1/NIli8LZ3Kyfi11/lzhfHmU7dZf8lpcmnP2EWyH0fLqRLGKk16B6pj2fVNNqAy2NwP9UMz6ssf/4Fs8W6fEyqFnX78XF88ADSc/0sdn6zoOI5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52b2290e292so1247066e0c.3;
        Wed, 02 Jul 2025 06:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462398; x=1752067198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOjOgujBLhdh42XnOnmsLevgNhI71hwIXKJu5W4lV34=;
        b=laeutsph7Pspdkmc+pXEAFMegNqSFl08wzACcnFnOv+OTTNzAggEEiG7Owwh6Ed58T
         o4G2WCshVrceRH9t/8n+93sjMPoU0GtNrzeTxDbhcPVqr7H4n4s74QW1bT0yWsytE+d2
         l2DierguTuhsOADLmOUCiCD4JzvpHjjuhYr4ueId7IXURCPM72cGg0DysquqrLZL4kK8
         7cBA07Br+ix586kSRAC800orYrDj8ZBp9YHR9BHPaHTFPfyJtM5F6axmtaMcMx0UXEvp
         SybzS8ZJ2I1xUfkblREMCuSI5OgwMq3zWfs2j3Ff2UgqyQBwdDmdnWXiCR6wF2jPQ3dT
         YNsA==
X-Forwarded-Encrypted: i=1; AJvYcCU9S6crSaOWJLH/MId4FiIXb76shHOlqavoJmIPdZn5NSOWR9XB5nWEHQQ0CZrgMKjpXke0v2IKI0Nsn+z4@vger.kernel.org, AJvYcCUYN/vPw4Emr1O9n3jXwB2SYzqT5vxUhT3unWMWVUm1rMTeRuE93gi2wxw21wkS0uQcyGYVtmDbVgNU@vger.kernel.org, AJvYcCVzICaSWuFxkwLBauq+VWAcVgU6btymEoFRWTOVR7Ppr8LnLe0AIzdS+1ZQc6FHLavQbL9fftAOK7bS0LoN53pN14U=@vger.kernel.org, AJvYcCWd16nHBjQsZdtgIaenSCFKiwbHeS6iSZk90PN49r/vHWM1xgMMswSRz0cmM7GJp8zkwq5OGgohpn+X6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi+NO/BL92agChEkl8U9S5UeflXUbYxXMmhB/cZ2uKIBC6VpAy
	Fc2b3so3Wvpaa8nO6BpzdvlKOehX+M0shOUtvaT30mZsVyF9sTRKI/GU+0ZQobFI
X-Gm-Gg: ASbGncvxs8zubsuaxeELfIYWwCGp+9hu+EnqHjiBVPan2PGnPuEratiUyqtCKDUi9dZ
	xdpUiU+OdIigOnTD0SQfss932yFFtFR2yCR31q/LYgizQnglhSYbNvneVWiDW20Iys7OBRPa6Mh
	5dmogTvT0pUUz5c8IFM1jRX4uMYdNGzXvFt0BmiVw681t04BhtzkRlnX8OAVTlZsF5lYLUN22wJ
	jNLhShbnNagHkymAASApgFMFVXFFq7Eu/wwZd/KW9L2HQORUPbsR8oVQNTK1/Nfi0wCvsQMMOdt
	f7AwQ9P8NR2fkh2GLPLueQ3zVuUlMdHV3EwjHh455bXLtk6dplce1iAcjkY8hfkVQY04NhJs+Y4
	1hNVK+7KiAhCs9a7/+bxBwNJq
X-Google-Smtp-Source: AGHT+IEnwLIndcUKAdrmJZYxxHSNfSGC6MvTSwmlQBJkP2mfWluUyJWP2Jerw8osY6On1i25meOwKw==
X-Received: by 2002:a05:6122:d08:b0:531:2d3a:32aa with SMTP id 71dfb90a1353d-53457c61245mr1760232e0c.0.1751462397253;
        Wed, 02 Jul 2025 06:19:57 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5330924154esm2095754e0c.48.2025.07.02.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:19:57 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so208547241.0;
        Wed, 02 Jul 2025 06:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVAws/ARpojRXD8n8RXhpSUhDIRetjCchDLk3ng7mWSGqk9Ve1SZyttt7axJobFQetZ/9CifuTjBL9RcjT/jYGXDQ=@vger.kernel.org, AJvYcCWG2c9qANNogntx+furJ70rEio7hsdIaNqpBTKeuJPc2s5PcR+J1WJ2d14bicBkr8llAtR1rs4saswEcg==@vger.kernel.org, AJvYcCXGg1oX+8weiUA5yN+m7CUo1V4NtlMRRroQE0WWH7TFywQ7t8NwL/GME6eqcWD4/r0C9RiSSFZwn7BE@vger.kernel.org, AJvYcCXOIJJsHKJse+yyk/oT/z54UmMybgZsnqchNceQ+9VZ+dqFImheMO7E0wZvUy5n1jWYItQHE2Ty0cuJnSyp@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:4e5:963b:738a with SMTP id
 ada2fe7eead31-4f1612289e4mr1219271137.16.1751462395540; Wed, 02 Jul 2025
 06:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625130712.140778-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627210526.GA128966-robh@kernel.org>
In-Reply-To: <20250627210526.GA128966-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 15:19:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+hT=i=gs35ia_9vvmqJPAsjscQ0CBhBZK3wyn=35Emg@mail.gmail.com>
X-Gm-Features: Ac12FXzUqy0vTSjo4_AKL8CJawsMDkDPDtVyP9enUVNCvJ78ZI9kbmcr2DTv_-M
Message-ID: <CAMuHMdU+hT=i=gs35ia_9vvmqJPAsjscQ0CBhBZK3wyn=35Emg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Rob Herring <robh@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 27 Jun 2025 at 23:05, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jun 25, 2025 at 02:07:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the pin and GPIO controller IP for the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> > header file used by both the bindings and the driver.
> >
> > The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> > Both share the same controller architecture; separate compatible
> > strings are added for each SoC to distinguish them.
> >
> > Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
> > +additionalProperties:
>
> This style was for existing bindings which had no node name pattern.
> Define a pattern for node names.

The node name depends on the device for which pin control is configured.\
Typical examples are "sd2", "sound", "usb0", ...
...

> > +  anyOf:
> > +    - type: object
> > +      additionalProperties: false
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        Pin controller client devices use pin configuration subnodes (children
> > +        and grandchildren) for desired pin configuration.
> > +        Client device subnodes use the below standard properties.
> > +
> > +      properties:
> > +        pinmux:
> > +          description:
> > +            Values are constructed from GPIO port number, pin number, and
> > +            alternate function configuration number using the RZT2H_PORT_PINMUX()
> > +            helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>.
> > +        pins: true
> > +        gpio-hog: true
> > +        gpios: true
> > +        input: true
> > +        input-enable: true
> > +        output-enable: true
> > +        output-high: true
> > +        output-low: true
> > +        line-name: true
> > +
> > +    - type: object
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"
>
> Do you really need both 1 OR 2 levels of nodes? Can't you decide on one
> way?

Having two possible levels allows us to group pins that need similar
configuration, which is quite common for e.g. Ethernet and SDHI.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

