Return-Path: <linux-gpio+bounces-19290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D030A9B6DA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 20:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9963AD013
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 18:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5B1290BBA;
	Thu, 24 Apr 2025 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oOadD6Sr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B02820D9
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520949; cv=none; b=U0/N9JxQxRKKkgY6+7GNdj9xW07PkIGPRxP8o6BFh+FrjXee0+oo6w1wU4IHwt62n3I6+aWEYXG2pgxppOvM+Qz9obVGpDc53yNSECdKnQnn6DlL9yIZ94M5ggfkpdqvC6uYC/+NyEyYA6jZAHSxBZRpiEz1O9By3ELlXgxoIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520949; c=relaxed/simple;
	bh=rZUxyELSfnVXwreNQjwJQoaXQJWZ9fkMyqWksLWMfUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkGCtm2UBRrSQGfKDD6vyX9iHNAaG+Ao+XdUZAgH3/TNTf0sn99BEvW2a+jrWgVZ7ryg9ru6yhaePEO3/jujCClv7M5lttJdN5y3BJPR8QU8QjBOLl1aHPrGRosllHMda662VrnQqLnklAElmMciT6ttzUbGtbVYNWBFQ4iFkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oOadD6Sr; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so16137021fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745520945; x=1746125745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=oOadD6SrYOVFwX3+5Y/nBEQ75lMAcd2yH7FAWOvxmqnt72wQttKx3za/ShKG8zuUtu
         +BgZ+4D2eYfAWxZUZKLcQ07UDxHZNaSzgtPHMo9wniXRY+5aLY29WVQF8yXW8Wz+XXm7
         FObeRCk94n07XxsX+kH1KoyVJYtSOomeFCt+P92tN6yjta8ZvbMlq3p/GuV/JMS8l/UV
         Hk9EyJHxZ1NmBDZvJkcoDjBpmCEc/Y+7CW1JN2fMMRObLvMv5GTWeBeD0iPjbTiiDp1z
         MQ1KVB+3w0TcD2ScrARSQgzuzMnOu0zfLEarYO/SrPVZKs/D6DYjLtaDs6hdCrfMrKvl
         Waig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520945; x=1746125745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=b6q+BwFVK7TKmoVwMAffH8qj71iz0xnXoPYUGtx0Zyf9a6uEFRqY9zy/D2K8/CgCYW
         a/9aTnZ5smzuhDs2RwlNtqJj+HPH571EngjEYnVK1IpGe7lDJKsMjtgj7e+NKUC1m+fn
         sXge9ygTW4GShPp+91oJ8CbMlWl9Att28tPqZxo1NUNcUhTPCVvJgmGdBu78O++vOzjP
         AoHRmTbyPHaZMAD02jjHwedMU8xL6ngn7+mq4+I689O6LDo+8sKsG4zIfvgkGigGzrjF
         5DfRDp2CKovNq3eZK4r7I03rYPIVtHaISkePNBvLbMMF4VUzyOqLqNYH6tLWf4mQOh9X
         vo0w==
X-Forwarded-Encrypted: i=1; AJvYcCVkbFhMBXlxKWN5PJXYevqkqd4/tyvXg6541U4gdke1FSF7STuTg+Z5Li5mFmzA3MnzyC95NmVe2G12@vger.kernel.org
X-Gm-Message-State: AOJu0YzhP3wFhvOmhbAlWnUlBKzfW3CNt5/eFeHjTrZcVWViF+QQbZK9
	zb4Tcsoi8bycLP66d9fZVOsh44l5sXAiWIDjpaq0hepjzk4/PQemGUGdQzFWyGSgOZhcpx8CQHf
	4cSSSjwWua28K0MB8fw4lX+YjYwL1YFs5OqaltQ==
X-Gm-Gg: ASbGncvlb/C5x51QDm0duAzNij0lo0fAZKTzMUitHLeo6eJYGjNgQtUHaeS/TNM04N6
	k1Ex0LuV+DNH/y4ZxPixFmwhoXsC1wvonvHnvEt80ji731esheAneSeDFuG0eWN/Si0HHfmZM0b
	vsE9xJrbI/w556+gdTKpxuQSPnns5HJ0Mca2jlvAjV4Q6+U6Un7QGFPw==
X-Google-Smtp-Source: AGHT+IE0c8VGEk3/LwHw0m2axs8IZ9HjpeBp8o188g75mkoErRBNX5c5KptrxgTjbE1qe+vTvqn/BpVZsaupGVwBUJc=
X-Received: by 2002:a05:651c:210f:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-318a7b0b7f5mr2808701fa.7.1745520944675; Thu, 24 Apr 2025
 11:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org> <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
In-Reply-To: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 20:55:33 +0200
X-Gm-Features: ATxdqUGQRJTk1Y9jikLuWRcOSvqi5BIyaHo-9YdHMReWW67MF95w4__wq5ceBqw
Message-ID: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: wens@csie.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Apr 24, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> >         /* AXP209 has GPIO3 status sharing the settings register */
> >         if (offset =3D=3D 3) {
> > -               regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
> > -                                  AXP20X_GPIO3_FUNCTIONS,
> > -                                  value ? AXP20X_GPIO3_FUNCTION_OUT_HI=
GH :
> > -                                  AXP20X_GPIO3_FUNCTION_OUT_LOW);
> > -               return;
> > +               return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CT=
RL,
> > +                                         AXP20X_GPIO3_FUNCTIONS,
> > +                                         value ?
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_HIGH :
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_LOW);
> >         }
>
> I guess you could also drop the curly braces, but otherwise
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>

Right. Linus: can you remove them while applying?

Bart

