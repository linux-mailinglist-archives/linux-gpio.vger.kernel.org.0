Return-Path: <linux-gpio+bounces-27193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE0BE213F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 10:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0524189164B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 08:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B82A2E371A;
	Thu, 16 Oct 2025 08:02:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED532D46C0
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601759; cv=none; b=PL2+r8j3XCZdXDA8Fp3AGVA7XtCnTsLNmT8DiuiIss+mnX4PDTMkf9esEbMnhpje6wLKjZAVrSl4f9USe8oDfb6pP6jJsGt/9OxjGpaW0OM2vLhy34l+zM8vDQYvljCnlblvIkwU7JvW99FCks6hAq6a6Tuwnx0tlGtP8gwF0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601759; c=relaxed/simple;
	bh=1eGQTAnWNGY3mGah0Neq02H/T5/f9gtIvSd+fn8FW2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCv9YNUV3W59NVTJJ9TggWbajt627Z6AnH2261KfUNy4dCOrKMcTNTHlGGzqTc2C9Y8s+BsZWs0WN2jyyCSQgecf/uS5lFD6VrgZ7tGNLqLU+An4hBtqV6gxs7LwsF4atEP9ieNVRb1ogsQHOwiMsKE/ClZCSz46/cQaKeMEv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-796fe71deecso6274956d6.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 01:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601757; x=1761206557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd9DhXGFTz7VluvF3CXaOYryMfT47ujx56ubcyYXsIw=;
        b=hhj0qHLgtv6O76m48y5x2rdovdSE9o11yKrZLtmAN1YKooKTpLtw97DbomwgtktEKy
         oPEUms15HTYq1gwLlL6SmLK701P7v6Jvw1NVX/xkXypDy+2ElOGViY9qTTBVHHXIRy4C
         AWxUCCX3sC+G98vV18Nx6hYKUuLCMqVBIx4vOl6d12CBJ7bxOGWGrojo2y3x8ZnGJr1w
         42Y0q6Azc24c07ui1DPuYCC3YtBLZXLVEjKw0ACQcYvZdjqRf+JQ1Isu86QgaKF1qdmE
         7f2cmqzPnstxGWnl1Pb1bEVjEJuTwPi+XJvly646vHN3P1LQzCMrYEfy90GpZelOyuYz
         RdYg==
X-Forwarded-Encrypted: i=1; AJvYcCVKf+7L0HrFJjc4M0M/9Jw7FmhmBR8vrNs4i2oyQBn9xbV6JwqLmmEfqmpmZ7cjKtZyuHes2uLBxeU4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFla9eQ0GXk96caK3sRS6P5JNZdojoAFlqxxWTCBWEa9JbeNCV
	OCv9jOmAgmHjfC3eC1Ujg1e7f2BjmAtlncuQJaSa+fTZTJDkrCZ1wxwu9KwS6iRZ
X-Gm-Gg: ASbGncsNS0dGLdOvL8IbPUlq8XYEm0i6aLS4tvBm8/MP5/y0o3vGLkYyHQTCr6ty3rr
	Pm97gmSVqUEIHoUU0mQPa64/lOx16URRTWiMjmBhINn/OZnIlsGXa/KISlEegGbCy+oNLT4G5qU
	7BfB2ls4ovirygub7VkkbodeFj2ejhFUomQc78QXjDEtmGRC2SfVAD2H8UZZMfu3wIT/maQYMCr
	HklVU+DTUEp+kbBft55JbI5eIs3wnEE9YyF7SuLYdFvI2xpokR4ouKW6yZv4gJgbWFB1V2Su2yh
	T74zK0zIY7lSFnPVqXBKxOJ/330Nle8QqqLQ8MzVvIy1EsOEeziylpmaTfCx1Hc5VmqgMsVBkXq
	3eCqA/GpA6aTaIRVWaBJnKIUysh60JDFk2MslGKe8Oq8l0pDWh7GJqcQs8iVerse8k7OmCZlDTF
	Y8XQgc6P69G5QsH6nGQBlGXFYZRsYMW67dtoPk10bMvSjlNAoAtNEX
X-Google-Smtp-Source: AGHT+IF0m2rrEjFF03EOowqvTB5wsExeZRS7hE2Ux/fUL/guS+2JgOqIl3lf7D1YzUPeSo7q2gLRug==
X-Received: by 2002:a05:6214:202b:b0:786:50ca:73dd with SMTP id 6a1803df08f44-87b2ef6dec8mr411372236d6.46.1760601756867;
        Thu, 16 Oct 2025 01:02:36 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e899b0b8dasm1060271cf.19.2025.10.16.01.02.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:02:36 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-856701dc22aso71555385a.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 01:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVcPTqyE2JxwCCZW108TNWJoIKLn4NULjxI8G/LRtPhmO0084TyeoVhfCUNrJEbUu9f1Ok05DOEzIU@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-5d5e23afcd1mr10705349137.30.1760601430958; Thu, 16 Oct 2025
 00:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
X-Gm-Features: AS18NWDjBoTWi0arzS-uHQaIyzTZ8PYUb4ECqZaEUF0sSO-4JEe-m7M7qjhxsvY
Message-ID: <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote:
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Since you are mentioning mixed quotes, is one or the other preferred?
Shouldn't we try to be consistent across all files?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -129,7 +129,7 @@ additionalProperties:
>
>      - type: object
>        additionalProperties:
> -        $ref: "#/additionalProperties/anyOf/0"
> +        $ref: '#/additionalProperties/anyOf/0'
>
>  examples:
>    - |
> @@ -190,7 +190,7 @@ examples:
>
>              sdhi0_pins: sd0 {
>                      groups = "sdhi0_data4", "sdhi0_ctrl";
> -                    function = "sdhi0";
> +                    function = "sdhi0';

Huh?

>                      power-source = <3300>;
>              };
>      };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

