Return-Path: <linux-gpio+bounces-20662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B983AC69F1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 15:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D10CE4E0D57
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 13:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF91128540B;
	Wed, 28 May 2025 13:01:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BCB3595D;
	Wed, 28 May 2025 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437314; cv=none; b=nySrysMTn2BJWq8Tha4AR3ixTAbENfDp4L2p6A7GXcwULDQXJ1a92EVOvHA+xPIJcDA0K/PdGAMHs7VzFwCiL+mGd5V5X9lu3FHeyiP1cxbdERtb/JM7gjD7B72JKqMGokxhw34fvQyzQ60S+7/FhNJc/EH1iinPtlocJTBkESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437314; c=relaxed/simple;
	bh=y9bMKWA1mUCVhYWK+2mE7dMzU1P7hxUNnWy/QdoIJFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvMJtkrodsUI3j++zARCTGRMxpM/JSGvrTEQtyWwl19snFuQt+rpaPqW/AZWWQFfVZl2MUhywxzwREak/+FOx7+8r/EkWzI2ivtoht72z+SmAO9EMvAJTiCycq5XiIxL1L7SWo+e8tioCCFDGxNI8zIGqeFGZS1r3Ws8hfEycLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e8f84653c3so4952fac.0;
        Wed, 28 May 2025 06:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437312; x=1749042112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=;
        b=BbTRec1bpCnN4rHckQFYX/xiPcs2SeZiLpQA4hYIzslpPo4VIDm23IprF8ZPrxyp8Z
         go++DU7QhfzytUMRiVqKemrg1NT2TA0Z0TJLiuAZTx91650yOh4m3eJVKJwgHb2j3qU/
         68CI5+7rkPvkSa9P1v8nZCm9hkMbEr8UDggsqdRxi+oXcS8yTuX//sLXfd89rUDT6s52
         ZvmHBplLV3IW+O/bqb7xclTT5Y5HnO1RwCkrNjW5nMdAyh5VPTfSMvwDJO2A+Ac11oVx
         D+BPKtesekyi7fvHO7L4uq8hg+OkfYg78h94ks2fRxqd1K4aHitLX8Js8G+ZrR+hURxr
         flcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZLXfTd7UFlxEjHH8O7C7pVO927/oElFlPnlw7HDaTfkqfixZKd86Elk7wGZmQpN+RxKPRid5uDiNUK/ml@vger.kernel.org, AJvYcCWZwOO3VpxZxygy18Vj8uvOH8X/Grwfr7sIBbRnRMFIbTEH/hP7hwzaB/8FQq956QfAnTMPSBkV4SPu@vger.kernel.org, AJvYcCWgZSGL9zOcq02+QzzLQ1SLhRK1C6+cp0z5ChGv8w+nyhaSY1Stx5A5BhYFL3H38cseGEPmKXlUiotW/fk=@vger.kernel.org, AJvYcCWt3MH2kG4BDq3KtqrgHzbVg8gwBrjNxRYNuKqjvcoOJft3U9+aA/TBM7JPqLwA1ID4czCzzQUO1DjXYTM/H4akrmc=@vger.kernel.org, AJvYcCXSoSr0uSSc0Iq5eRHN8eG9AeLbNvjw6hq09REB+FypHQ6PsZ4ReYLMMN4uueSOIcQXD/uTi2RktF5o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/OQ6bLrzJlcN/AyaUmMpkOkkRv4XCv0uF+Fh9PPwk0TIBcRLi
	Ev6p9t9krNrfROARyrIggY+5aOaJ/AdReEy+XnnI4GHbMGYFYDpgpbbmWUtrQWjY
X-Gm-Gg: ASbGncvGVf36xJt0B8A2czpq+epOKCzoihdsQJF7I46vcr8Lb1iuKSzzPohszC5SBs5
	VJG4KrL4WwF7OQmH47sQwJ6S1Kf4oJ3G2z/iol+uYDKXEjRWFbQcDWDizwKNlPBGPCpemXHfeyo
	hIsk8cGSZ1TA0n+ZxggSV6N8JkTnAlefzQwyiX5ZtI0jR5hW02t1EhbFStJYY7n1SeFJyG65xxI
	RcVsnphOnAktY29ASS3qc6XMpSYpo75UmbnFzUW8hBsNcNP3XZVSo6oT8O/C6InU3zfKDbu6Gec
	1iGvGREWdCowG5GnjJAUrNqtb75SBqb9ksCgyLEwvxbYRes5JMxBmGEj1ivMkcVQBHuZ7gR3gtk
	XG7KKcqXyoDKu6izi6yOLsN30kzsd
X-Google-Smtp-Source: AGHT+IFzcGONDX9eh+40zCjEjeFb827OyifAm7A+OIhWfUZ92FQgovECyH9fx8Gqkz32CO+JnAyf/A==
X-Received: by 2002:a05:6871:e809:b0:29e:6bdb:e362 with SMTP id 586e51a60fabf-2e861e86388mr8793896fac.17.1748437311165;
        Wed, 28 May 2025 06:01:51 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c0a6443asm5766681cf.4.2025.05.28.06.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:01:51 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774d68c670so17827391cf.0;
        Wed, 28 May 2025 06:01:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd/ngvJU7ORBgFZGig8fmQD8V+K9FlzCiIFf4p6nUl5XBhdv3RhLgisfnfy8nD5PfToGe03awvkW/o@vger.kernel.org, AJvYcCXHmFd9VzH/Sti9F6bliEjmWdOvgeIQVtnDmSZrlfm6CiReQt/cdw0WHoY5OWAtiErx61vQWUVOSzhyCbmO@vger.kernel.org, AJvYcCXcAltGmwP5hvB2y5IavOMge3M3Orgi9yRrGvT/mmVjlowIyFXMJd4j+v5WZdT7GWbMNznhs5Zif2RU@vger.kernel.org, AJvYcCXjSqWj6c4ravcAstUXBZn2CNPoquKiP4Yd/pFpcl2rzb/5UKXmrZ6iYMDGqGj/+9DLWGHW7GgNmPJ37l45FkJJla8=@vger.kernel.org, AJvYcCXnQBrVzL9MiiQxR0fSehtVn1NFtO8kV4TUQV/a5ssbmwMwQeCkDCHqu9NJZUpAsaudT3hQQlbcK9WUo4Y=@vger.kernel.org
X-Received: by 2002:a05:6102:2911:b0:4df:93e0:fb7 with SMTP id
 ada2fe7eead31-4e42419b8c0mr12541235137.25.1748436893682; Wed, 28 May 2025
 05:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
X-Gm-Features: AX0GCFu5yojjEPsbiWTwjJJQ5khyE5KBTwGS5B0aqZkGtvZvOhYOGPRkjlMB-4Q
Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
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
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 28 May 2025 at 12:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Assign 'struct pinctrl_desc' .pins and .npins members in definition to
> make clear that number of pins is fixed and have less code in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {

This structure could be made const...

>         .pmxops = &rzn1_pmx_ops,
>         .confops = &rzn1_pinconf_ops,
>         .owner = THIS_MODULE,
> +       .pins = rzn1_pins,
> +       .npins = ARRAY_SIZE(rzn1_pins),
>  };
>
>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
>
>         ipctl->dev = &pdev->dev;
>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);

... if you would replace this assignment by a hardcoded name
like "pinctrl-rzn1".

> -       rzn1_pinctrl_desc.pins = rzn1_pins;
> -       rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
>
>         ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
>         if (ret) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

