Return-Path: <linux-gpio+bounces-18113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC29A7602E
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CCF3A9037
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 07:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A4A1BE238;
	Mon, 31 Mar 2025 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eqet5Pfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92A318CBE1
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406588; cv=none; b=azY+1b0txrPtu3CNtIX2plJKp6Hp1pweGHOqzKuy7LmYQvd7aYuWYwHeCzHGutYuxPKDlIzzk/BFKm6Zd+VJOdhkO4FD7z/ymkKfDoKMoZ27p30feSSTXOYQY6g/xGWeMDYC4cc0Y4JdPYxhkPEBotdsH6L+8wX2NFAqYwLlrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406588; c=relaxed/simple;
	bh=QyLt4N4wZLyduJinq/k8qiXVy17sLytvUJBhnINNAnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3254Dl2zFQaw0+DTVOkI/+kdvXHAmYJPvP8fbOss5xlO/mhtEyhqzMZMiLhv3VUF4SWXWi6JiyLM5yWSph03PjzIHb1eFN+0rAJuixXvwRaoW+y81jcSyfixzO6k1+hJtwgsFGAYP/BwOf7I+Ac1F0iVYCFLo0JCYuCtPgt7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eqet5Pfh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5184995e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743406585; x=1744011385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHk99e5gnxtUp9asOQB4E8iTtC8OB1RJZHuycukp2LM=;
        b=eqet5PfhpHtaYoKPMxToxT4iB5iVv2kQk4wYlbN98SXY3UUsr9W1iNDS0uA03cWqjT
         5VZfjg5TjPqhJdIvwMNH8rAEReoFpqDRiJhM1uUdbN2LA5V+eGIYDSwPCw/iMZo+zYcB
         qCWgfkVqt8AeOVQrKBIEAAYMnTvQoqozMBLY0fj5kDPtOt7iCWs1LXqIjbeIh0tuFYA3
         SaG1bxwhC1M0QH7/N+lpk9Qd02vqS/m08C7AKj8qONIbC7Dso5jyzDqNWQk2/Uf4RTNd
         zf72CAmV953q9T7FBT9xlYCiym/7PbKtFYyj4IxMsdr88vUeU1klEJBY7THyAU+jrSnx
         b8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406585; x=1744011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHk99e5gnxtUp9asOQB4E8iTtC8OB1RJZHuycukp2LM=;
        b=Q5y+puT0hmN6/HbDG0em5EJNX5Z1JzFWqCnk2ds2joYJX/gtsyw27lragXFRUEfi5n
         wnk9MyMzsyVfd3tyT5yC4blUC78uyKF2LCHdfAmSppktGAelqUp8/XzrmyuaALrGWAgr
         yvj1HrlleySjfqe3bce84Vy79+KhP6hC5a2mwoJr8yeTWwHjZSXWdo/BxSGQWF2N2Afv
         rfS1Ahsz26LqeLLvLNe9C2Sp3Nu/D2fLf51LfaJRnuMRet7mjW/FgI3ZS+3UABf877jF
         OdmGaT5j8lBx2iTCH7y+1vJ2f3vFWMUWhZi1J9nZtDiTr5RRkhESWy995WGBuO1n+rwC
         atqA==
X-Forwarded-Encrypted: i=1; AJvYcCVqJq+tSuAtL+QH7YmvsHmFEB5inYz0WRXBJWsLyRKj1KvDKvPxkiBk05BpytJTLFcQ3xvKQCqEtXE3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kypBcGqUrBHDET8O9OHEfeaf2TqzneME4eJcqVPUaUBcEGpq
	VCPavA4LI4XXjAzthdq+ohN3Yao151RdIw8EKvGDoiMqNMfRc4Yh9lo2u8AOQhXHgPwO9aS+ojh
	hgw+vVgDACyKZegvRpJwABVtvM6RpPsNDKfJoig==
X-Gm-Gg: ASbGncuHyZQKMsbqU6yfo8Is0pM2ke9lgT0+pJRnQWSkXdOdaMiT4g8LwF/yVIsqprf
	P+Yp0fhXtc9vDzkRv48RRqK/9D6wPu/D/RW6KhoMAKD3rPC71bZOhKbXRZvAE/3D1vyHQVhVd3O
	BhyDZBoq4hUX9kHzZE0StC7XDqYlv+nw0L3DP2SAQ8qze+SoDUBjF4Yx/L6g==
X-Google-Smtp-Source: AGHT+IGyhvEeoPw64LNsndrt/+sosKv3AogA4mQRxuBQ502poVOEjcU1BVPSkPdwIY0u71SAxTxzwGkOPVNELi2wGpY=
X-Received: by 2002:a05:651c:30c2:b0:30b:e983:9ba0 with SMTP id
 38308e7fff4ca-30de02c8791mr26982091fa.23.1743406584711; Mon, 31 Mar 2025
 00:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
 <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com> <d4204a3c44b31c6527b91558f9691b6a05faaadc.camel@sapience.com>
In-Reply-To: <d4204a3c44b31c6527b91558f9691b6a05faaadc.camel@sapience.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 09:36:13 +0200
X-Gm-Features: AQ5f1JqYCos557rcCzy4DMQxB_6JY9I4cSmMc-HjsYAwMCdOvxlzyoAoyIhCeyM
Message-ID: <CAMRc=MeUA9FCp1P_e8Ztzs_2RuTWt0bBfQwKZDsx+N7m1wOR0g@mail.gmail.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed -> pincntrl patch?
To: Genes Lists <lists@sapience.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 11:59=E2=80=AFAM Genes Lists <lists@sapience.com> w=
rote:
>
> On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wrote:
> > On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> > > On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists
> > > <lists@sapience.com> said:
> > > > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > > > > ......
> >
> > >
> > > There are two problems here. The issue you're seeing is fixed in
> > > next but
> > > not in mainline due to my omission. I will send a patch for that.
> > >
> > > On the other hand, the pinctrl driver in question should be fixed
> > > too.
> > > Can you try the following change:
> > >
> > > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> > > b/drivers/pinctrl/intel/pinctrl-intel.c
> > > index d889c7c878e2..0c6925b53d9f 100644
> > > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > > @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> > > gpio_chip *chip, unsigned int offset)
> > >
> > >         pin =3D intel_gpio_to_pin(pctrl, offset, NULL, NULL);
> > >         if (pin < 0)
> > > -               return -EINVAL;
> > > +               /*
> > > +                * For pins configured to functions other than
> > > GPIO, default
> > > +                * to the safe INPUT value.
> > > +                */
> > > +               return GPIO_LINE_DIRECTION_IN;
> > >
> > >         reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);
> > >         if (!reg)
> > >
> > > ?
> > >
> > > FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> > > return value of gpio_chip::get_direction()").
> > >
> > > Bart
> >
> > Hi Bart - I don't see this pincntrl patch in mainline yet -  what's
> > your thinking on this?
> >
> > thanks!
> >
> (resending in plain text - sorry about that)
>
> Hi Bart - I don't see this pincntrl patch in linus tree -  what's your
> thinking around this?
>

I already answered here:
https://lore.kernel.org/all/CAMRc=3DMe0-Tv3ZZDsdijuErYZTswbjQ0obMGh_XtUn+cT=
-uCZ3A@mail.gmail.com/

Bartosz

