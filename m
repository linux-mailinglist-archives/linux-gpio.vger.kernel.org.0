Return-Path: <linux-gpio+bounces-20780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF0AC89B4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 10:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60D54E1BB7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19FF202F6D;
	Fri, 30 May 2025 08:06:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB038B;
	Fri, 30 May 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592397; cv=none; b=PS1DMPywh9PtnL0dZuCj/YHcTNBKnnoZrvk1rnDpyJ87BF+x62/wVUy0mNklku5emeuQwx3TP5DBXlZq2wAdUqJU4LP2uwrtfIZTdz0dq2UBUgb/ibKaZdoB9b0B2Oqlnka6D9OwE5t0lZ2hoqFSM2XWKHwC3kygD7PjFyoRBG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592397; c=relaxed/simple;
	bh=lvLxyVrYQzJysV3uOxVPsS5JhN/ohssoYL5mRw3MV+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu0Iq8xxEEz2i+lDQombBrC+Hzki611Bqu3MckStmGSzufIzCTBpah+B19aT8u6/LCCxOsZ7w4rQXMHclqJXhj/KTlLGVk/BjOGfDam7ywnRC2p23F1Sh9B3MrMatXWKj9wmNTGxaTRwpCFPlS5uwaLCQrY0vg7y+Wg2vmV3I3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87dfde2aea2so467738241.2;
        Fri, 30 May 2025 01:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748592390; x=1749197190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=;
        b=oNlFZsYdIE7gwINfDQw+t7ZjXs9pJFH2MiJIefyCXFRNb3LoyWIFRswXPo3vKrwZ0F
         F55MT1izLI/2R+uV99dSjF5pNpfRbhCxbIBHXIoPR63zMmlom8CM6bndHjrEA1gQ19FH
         upNBiHDADq5/3yDkSDQatZwDVhN9CwwK9pm9myVvQ3wTqMzfb9gMm6Pf3vE/9fIQBwlG
         FPBMRXwCfClsTcXqfPV1OzVidxCuej9iNI0iOyy5Kbnb668jNV3uNxUWaky35sTb9OLv
         ukGfw0j98Qkb0pLiOWTpuSckZeSqHEAnxfJllb9Psp4S7HLcgd6b/LTynWjoLZRdFM0h
         Fnzg==
X-Forwarded-Encrypted: i=1; AJvYcCUB6rnhVVrN++sOInR6FEmPk2eDAoCMYh5ClQd83Js5Ns/5ppT9QL9I2iP2K+DR6gPxpthZGswbgAYrBF81@vger.kernel.org, AJvYcCUrZFgu/FNVDqaAlnrZJlZ2DcFPnG1zKJTf506odnyBQf86ukoNglHn1vU89nIUJhh5RZyxXhf56aj+@vger.kernel.org, AJvYcCVZO/1q/TLnFA5aZpgdNvMljM4KpXOY1oJQ4GWOISsjNwnPGNGgrJTu4UmSY2YGn087TV12NncXWiDfbYw=@vger.kernel.org, AJvYcCWdG9N/PeiGpZPwLWL7rQ7J5PAohS1x75HzTmrCyhyAKPGJ3lodStRgSQuih5w2pZAJFclaPx7wuQ/c@vger.kernel.org, AJvYcCXtnh+VMDUiq2uL04wSu7KB0McGMcV4mncuOvHR48xm3txR914KqHLrdDovfocMmyDYZYazL21QBqKpZJhKNqHlhnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsXIuZPYofvTmPdqTrRKkA5c4bWeMD32QWLeHOmuRIQrmettog
	WE5pWEeI1jMrYAcrH+R5mKw6nl+kw02d4lDow2JRgGv7M5DXiaTvatO7N1jvSEFj
X-Gm-Gg: ASbGncvyu+cOWnwfz9IEBFd/IFUs0lh5xV8N3akIUKqjjnao3O3GNZpu+YK/KjmF315
	c353egU9FOOC+udoVmKpZO0tpatocPWNw4A/R0A6y/sgJmzn30nCWqRQONrEwERaihroXw6zsB3
	fBr2CsJb4OcrgN1Dnb1iUmRSOBN1ZHh7J9tw9FmS6N2Fk2sX4GzQcBEV1sAEzx5ge5htWF5XQzn
	Qh5MXjRL8wVcKGYiptcZcFk3kpMhcNRwQxTC65UdBWv8a0j0pT5QFiy4mOomgpKu2WWeO7tGlHQ
	q2W5Fldh/13fvdrk+78LWYwY9nsOp8eoJh206ZpXBPT9fC3TxrAo5QK9bWqiDjfmoqh7pWNUh1t
	7JZ/lnjGkBf9b0IJtZw==
X-Google-Smtp-Source: AGHT+IFWq1SXxMlo8s+dLVsk6Dc+TcdJkvf+UTgpCEvKu7cUsL4LnPlY+2mnpsxt3AQ+1ZkyBf/rWQ==
X-Received: by 2002:a05:6102:508e:b0:4e5:a40b:5a72 with SMTP id ada2fe7eead31-4e6e40d93afmr2320037137.5.1748592390606;
        Fri, 30 May 2025 01:06:30 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a3b63c9sm2320275241.31.2025.05.30.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:06:29 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-527a2b89a11so728000e0c.2;
        Fri, 30 May 2025 01:06:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZ5HETBlxCjIl/PE+SBuD3rCQluZPWGPXUYw+I/JLnNUrOsfeysr0WKJXMH9cEdPOkhXHTGR8+jiMz10g=@vger.kernel.org, AJvYcCUoWqKxhuWbBVn2M0caX90mfkkW3cwAqs7yi/7plCkst8iFwQHjJSbz76Hm7OD5/qPRocPp1i6HPRBC@vger.kernel.org, AJvYcCVqj+ulthrjb4OJEy1adZvC7MyimW/EYdxyzOOmHh1EP2fjgiZ50lR4ZTjDmQOCouiLxENqR2LykMIzPKpmrvipOvE=@vger.kernel.org, AJvYcCW87ir6kPgbN15zHj1/9dsZxVH+VY6WoFvnJ94ng4lS0HD1snAI9/gvZ4ynQ6+fA5ky9gojZEmBaO1g@vger.kernel.org, AJvYcCXi0Hxn1n6ckSApWBxIlxO2RWJ1dqZi6n7hQzWDQ+EpJ/0kEXI72JK483G2XIu9NinmCDJhv88WAI/KIoPz@vger.kernel.org
X-Received: by 2002:a05:6122:17aa:b0:530:677b:1e93 with SMTP id
 71dfb90a1353d-53080df1088mr2012964e0c.0.1748592388616; Fri, 30 May 2025
 01:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
 <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com> <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
In-Reply-To: <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 10:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
X-Gm-Features: AX0GCFuCNZIpijI8V-LFtD11RdEuCtx09JrM6Rph_c1WT65W3SrLJtlImd30cUI
Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
Subject: Re: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

CC wsa

On Wed, 28 May 2025 at 19:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/05/2025 14:54, Geert Uytterhoeven wrote:
> >>         .pmxops = &rzn1_pmx_ops,
> >>         .confops = &rzn1_pinconf_ops,
> >>         .owner = THIS_MODULE,
> >> +       .pins = rzn1_pins,
> >> +       .npins = ARRAY_SIZE(rzn1_pins),
> >>  };
> >>
> >>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> >> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
> >>
> >>         ipctl->dev = &pdev->dev;
> >>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
> >
> > ... if you would replace this assignment by a hardcoded name
> > like "pinctrl-rzn1".
>
> I saw it, but this would not be equivalent. dev_name includes platform
> bus id, e.g. pinctrl-rzn1.0 which might matter here - conflict of names.
> Are you sure this would work fine?

There can be only one anyway.
Most drivers used a fixed name:

drivers/pinctrl/renesas/pinctrl-rza1.c: rza1_pctl->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rza2.c: priv->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rzg2l.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzn1.c: rzn1_pinctrl_desc.name =
dev_name(&pdev->dev);
drivers/pinctrl/renesas/pinctrl-rzt2h.c: desc->name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzv2m.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl.c: pmx->pctl_desc.name = DRV_NAME;

It might change the path in debugfs (/sys/kernel/debug/pinctrl/) though.
Wolfram?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

