Return-Path: <linux-gpio+bounces-4524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E3886B99
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 12:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA6F285236
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 11:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F103FB85;
	Fri, 22 Mar 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ur8jCYAx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74F3FB07
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108363; cv=none; b=F27mIAe/yWX+mcn/0lgSb7Al0CY5jK1TUMYHYjkt2tNJGXnzaBFT/RloiP3lud7+X5V1vaXOnLwh6kskJ0U6x4BB+jnMQ2nflvuvmN8abcjgFYL925Q2wC7u0mKdmBRq51WNAuyEr/pttDwvkbXTDmzmgbTtxoHd5KjAC0RNDbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108363; c=relaxed/simple;
	bh=x+a9e6Frx0VlBb4fwtx3sGzeXPW2PGanVCb6UGSYC30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJ72p3EetPj8IYerLajKa0h1BKOoDcyJbB0OLZySQAIuTWfdkc+ouilP7GmnX5zt+QAtRRQjug/Qtz5LO1G896G17EIJU4KvdhzMRqiRsikKoySrkKTwmZRMb712dNm9GSgfNah6V3Bcu5exXqV+XUHfTs6GOj2AvBW768LnwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ur8jCYAx; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d68cf90ec4so33904711fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711108360; x=1711713160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVWFUDwpLHRWKDYEaq1Gc8i1EAEVOWiexCNmJxdcxRk=;
        b=ur8jCYAx2yLsvFWywcV8HOlgN7UrRzXgONknLA60UdcW1j6X3pkVAK9rt96aOVQHIk
         EowLG+h1vT/ysD77+Ale4zyHM6NCeEtPdq6Oyl49TmyD7TdkDsg3dTEcrHNa6S3Z8sWd
         7w+VfoNG4N7AbOAAiSaNwH0uwazh1fGQJycwLhV5RZ0fMDORjAZ8BNk5ZV3yO2Akv+sL
         tlwInav+rH1WY6Q8tzuZMhopPRZGiJwghgR09as5xH5lAsj4auONK0uFRRMKoKn+yUKl
         WOkomPl7gTjf92SuDFh9XYZ6tcImsWCqZYb7u7aSH4RvdRpUTftIapD0MxWs8S8EZ7ak
         COMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108360; x=1711713160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVWFUDwpLHRWKDYEaq1Gc8i1EAEVOWiexCNmJxdcxRk=;
        b=qSSOlnzVGv36l5wTlBzEL2npoEnxg3XGPrrhEh2ZV5aNJWdX1xrpVSANoSDiiaQl12
         OqNBAt+wW6o143Jx92DFQ09CEYLf6r8UydblbbJ+F66K467KiXa1Gs7nGc3xFJnkqSG5
         YgjM3P3aTmyjpcIZAYr3AdnYTaSC1LCXGT6yCt2UrB2+Kj505MvTbu+fQWOUzuuVyoWS
         kr0GVPpq5kBqaf694NR26dGB7dAvjB1hk7AxUx6+V8695xyModn4nkEzI62Kks32ohT/
         T64oXcfxfmkbn3JWpkvNkyBEi4wv+LLSjbB4JD4tjbu0+VF+jbJYg9IVvOn3kotQFa3q
         VkOw==
X-Forwarded-Encrypted: i=1; AJvYcCVPSbL2pwSSbLJ1eQnvpQVB3B0eEQ3+CSV8BUGtMMAGFXbb19YSlR973PzwWPyPjAsOk4CZn0E55nJF7i8YejB43/4EZGDpAQ02ng==
X-Gm-Message-State: AOJu0YxbZAjeOeeSt0PBIyVuoRz02XqkB0dYDiL5yrfCct5JEomxj7tX
	hPDGq+GEIIZcw8KuuOpWX/dzoO8Ff2B4jH8NhgUnTLAG2/9EM2q7YsbHR9mKH8Zp6h6lPSNs5Cg
	VlNhJrVvG897ypnUAXD6U/h7R4oPJnUDoDdBRRA==
X-Google-Smtp-Source: AGHT+IF/QBC/XHMCsVWI52LV3ij5tlkUWiGM7xOVip6HJdc4V/iuOPS3esn/2MrMi3SBgwp8I6jTFKtKxXphgBDt0MI=
X-Received: by 2002:a2e:9056:0:b0:2d4:76d6:e9c9 with SMTP id
 n22-20020a2e9056000000b002d476d6e9c9mr1542931ljg.52.1711108360010; Fri, 22
 Mar 2024 04:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322090209.13384-1-brgl@bgdev.pl> <20240322111835.GA24228@rigel>
In-Reply-To: <20240322111835.GA24228@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Mar 2024 12:52:29 +0100
Message-ID: <CAMRc=Md87eGmjehSEegdFCdv6D3H1p2On153JowY5cDnW9iw8Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: cdev: sanitize the label before requesting the interrupt
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 12:18=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Fri, Mar 22, 2024 at 10:02:08AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > @@ -2198,12 +2216,18 @@ static int lineevent_create(struct gpio_device =
*gdev, void __user *ip)
> >       if (ret)
> >               goto out_free_le;
> >
> > +     label =3D make_irq_label(le->label);
> > +     if (!label) {
> > +             ret =3D -ENOMEM;
> > +             goto out_free_le;
> > +     }
> > +
> >       /* Request a thread to read the events */
> >       ret =3D request_threaded_irq(irq,
> >                                  lineevent_irq_handler,
> >                                  lineevent_irq_thread,
> >                                  irqflags,
> > -                                le->label,
> > +                                label,
> >                                  le);
> >       if (ret)
> >               goto out_free_le;
>
> Leaks label if the request_threaded_irq() fails.
>

Ah, dammit, I didn't catch the fact that irq_free() will not return
the label address if the request failed.

Nice catch.

Bart

