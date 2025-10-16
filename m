Return-Path: <linux-gpio+bounces-27204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA77BE3489
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 14:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889414800F8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9F326D70;
	Thu, 16 Oct 2025 12:13:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F02FD1CC
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616810; cv=none; b=MUPtgjelRsROECWT3o9Qv9NS4GI63fBWqhc43BTRlKS1CPxJkty1stMccwVL7HqB3jjHABnnNKWb9AAOTKsLPRXV2NhQ0LevJ+8taFRbNcYE8NKkSZh/ZpX9Bcg7gm6xv9jPnW9XFxMG3t7Kkh3ihJ6qYlkcC/JQuXsFZEocjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616810; c=relaxed/simple;
	bh=Qljm2z2l5uF20OnzQWwo+pu0aWLXVl3TFALx6BWruW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feZ733Wbs/GD4une4XCrxLBL59sqUg41I99XkqH/dM0miWxW+ph+NgGVh+M/7zFWWTWYUkPyhgEYq/rXNBuVfi1cNv7hw/siKt3lXtZHwyncJi1vqc0TMEfKWYZwHPHlc9hTO5Fhv9wLcj2EtgkQaHV7fVIxm6Cymw/+t4KR/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-863fa984ef5so141387285a.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 05:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760616807; x=1761221607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3GThzLUFjGbl3VuQITKYi7/BLSw+ups+ZHEY60Y/84=;
        b=fQ/NiRf7YNTY5n0REDDdOnFEINSG6r8KLEpT/1klglndL3kw9nF2Il9nbYLpIGLoKc
         45Cj7vEMbC3MraBEVeIMxXDc9V9xj4UqNv51RLQSXbf+24xWuH5ZX0ewtW/peUrS8014
         PItDADtq+VYMsLLTVHMyhroNyzj645Y1vlFRSuB2+c1c2/zUToVQuS6b9DCgVn6k8lSv
         3q+cufUJhRgS3iHftvMy/zCwf3uO4RtkLJC1VTOWTjNersk5Su+Ar8SmqW5zPgv+JnM4
         /qmkwhqOaseflaWbLGCOI0ve4pLNi2xcitbr1eQQQE1s8Quhxu6DyZ2XpNISHRvaNbyW
         HYdw==
X-Forwarded-Encrypted: i=1; AJvYcCXdZSiEd8DnQzjSJvCUV/HbPtxy+5YVZ+8G13ew7nmYWWLCnm2fUu7q5Vubr8+IRCcAc58H6WiBX+Ct@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjo4jm+rY3w/W4526SH02Spqec5who9uptIZnR3LrYFm5OXmKt
	HCT02PhFx10EbltS7c2BLfElO8Sq2T8CwryB+7SY+E0GOsgEhaQzD304fvxQNeIV
X-Gm-Gg: ASbGncvCfClnWA7ZngE+zMjZKcD7RW/x9jM77PV6TSIr9NM+J2M9H84xNteOHItzYZT
	va4AmeLq49GQDtd5Qk7IDJeLMd53YStKhRwqeN+08jcLMCN0NM0a5hqjEGnYJ4pHL6QO7D9l6vo
	8obon7+PgX2U8pzkMYjOfPdjK3GTJHActDI5Ao8JEhDCzkrXF261Q+3keFHszHVuI8+F/LvNKIO
	8If00smg8aptFXH2k9kIV7Isj9skrGIo8euvV9tUgtMDBsLivjVxO9kEHwx7X+meyMKuRX2lviN
	swh7NS2qvYuanrWaF+dbeSAUDvIV+nppsJpaJblRpimWRdApR1Szccsi/ro9IfEGUr3rAxpYuki
	6vPtDD0u8HPgzFq8HT6JwpZE0MI8R163G0sqCJXfkdnrJN03g12ZAEivdXHEq//RCslgTb6vcl8
	wY7YOLe3dKAOMrIDdqusybeNi3eDWNRAMN037NhPmx+A==
X-Google-Smtp-Source: AGHT+IGiGUxgdHSKm6SR/PFqDwHvQcZT1mYLs15F83PdAWkbuZ+RaoJHlQyCkgAZHIJWV6tAvbghig==
X-Received: by 2002:ac8:5e4e:0:b0:4df:194:b479 with SMTP id d75a77b69052e-4e6ead5c336mr424185351cf.59.1760616807141;
        Thu, 16 Oct 2025 05:13:27 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881c55664sm39046971cf.5.2025.10.16.05.13.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:13:26 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-87808473c3bso140749285a.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 05:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeTxgir2jxH3g8MYGdBjY68kzfED0qpEgUraWuAkNWjD0RYuN6C/nE0GzDxAaOw8oAEUDvAAidCPIC@vger.kernel.org
X-Received: by 2002:a05:6102:6c2:b0:4fb:ebe1:7db1 with SMTP id
 ada2fe7eead31-5d5e220448dmr12281536137.12.1760616407229; Thu, 16 Oct 2025
 05:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org> <CAMuHMdVBDN8-gWVs1f=1E2NgD6Dp4=ZFUnyzqHaQj9JWPpZepw@mail.gmail.com>
 <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL1KL4CvnxF5eQG2kN2VOxJ2Fh1yBx9=tqJEWOeg0DdzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 14:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
X-Gm-Features: AS18NWBH0cbPp0cJrT4sY267e4E8JBEuMEr4tkAtjK9DVXEqfelKr3ZBbd1AYGI
Message-ID: <CAMuHMdUUZaL6qyuTZPoRc11WSuqcoRUFNksXZNJoijTeL+vfKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: Rob Herring <robh@kernel.org>
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
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 16 Oct 2025 at 13:46, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 16, 2025 at 2:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 16 Oct 2025 at 01:20, Rob Herring (Arm) <robh@kernel.org> wrote=
:
> > > yamllint has gained a new check which checks for inconsistent quoting
> > > (mixed " and ' quotes within a file). Fix all the cases yamllint foun=
d
> > > so we can enable the check (once the check is in a release). Use
> > > whichever quoting is dominate in the file.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > Since you are mentioning mixed quotes, is one or the other preferred?
>
> I have a slight preference for single quotes.

OK, so outside human-readable descriptions, there should only be double
quotes in property values, i.e. on lines ending with a comma or a
semicolon.  Sounds like that can be scripted, or validated by scripting.

> > Shouldn't we try to be consistent across all files?
>
> I don't particularly care to change 915 files. And if the tools don't
> enforce it, I'm not going to do so in reviews.

Fair enough.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

