Return-Path: <linux-gpio+bounces-3214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB9851889
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 16:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C9E2850ED
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 15:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AF13D0D9;
	Mon, 12 Feb 2024 15:56:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B93D0D0;
	Mon, 12 Feb 2024 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707753382; cv=none; b=h/jyVld7dNadp9yUXwwHA9UZWZ+IAZzlN8OusdUZMizj53Fui7C1l3/rTyGyry3BLv4CMZJ+D2yphNmxYBjxJzDEJjYt8gaNIjGzIN5QwlH+JcPbhOhG//mvQhV6LOtGU0B7qPkSrIz95a1EKQd8jtwsIzgu24dHoj5hz0snIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707753382; c=relaxed/simple;
	bh=GE/m6Aep3gp2A7rBeQpJFq3BPpNHcyzCLS4PiSlkx3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feh2qlSKrGL1rLZhEoCcZ+KdORwTqbUwnsTaGuQod2cpW43rrmezjN+Uo+YQorvC8Wffap22X5+BwK5adnDsknSR4OTkKkRs0UNhzH5vixY+yuvGWVKHbt1K5/mOapwZu49//fB1ZA7JQVznLmMcWd4rqt0EL+X22zMUTM3AkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60498c31743so30092837b3.3;
        Mon, 12 Feb 2024 07:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753378; x=1708358178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPU0AzcWuPmAEQNUN6oI45y2xb1KGPmzaps56c3fcK4=;
        b=ih1m6vKCRwkLKQ2m0+JtcZt6/gdOmQ3VoQT9DeMoEJvR2ioiy1jRPdC+UXemkQOpvd
         kDRiDw0hDkz/np8TDh9ER2JOwrUucSWkfvj+oTdGIG00iqt/srMrrlYGoF0ez2aGU9M0
         pSOw+n4Dk6ena39VwqwGiob+R6/70oNYwwo0XaALaOUyBT7zkFBwQe+K44iJFmTDfEHJ
         aBFOQFb8ibp6fb12XprhLmHetCnwOkRFdMAT5lIGzgHSFMJfmjOfp2NVgl3T5oOjLH9H
         xWHVCOZnGPV19LIxd1wrblrm3W0uDlMKeDuPWzlvx7EqIFZAThxFZkUFhnSBzfXeu5Rv
         3H+w==
X-Gm-Message-State: AOJu0Yz03wlcmKAXOGbfYDcXYwe33PHhffmJHThSYG5AUB3n3dhzt8Hr
	vhwAPGHzZ0VphRI+/oZWxyH45unCo4zLCSeIeGHPS0lZhBTuAqmC975oavuCv/o=
X-Google-Smtp-Source: AGHT+IHGb9GD7RqVOkC13/t6oTWH0xFhCyIMclwWQ7UbNY4/GbHq45PZrmS7C6HzMOseih6IC2+VNg==
X-Received: by 2002:a25:8501:0:b0:dc6:c510:4484 with SMTP id w1-20020a258501000000b00dc6c5104484mr5986879ybk.26.1707753377914;
        Mon, 12 Feb 2024 07:56:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIcUMyXGBJqS6LuhBPoRQ7wqq0FRpLeCMySWOLoWP7Ws2PWYoNxE8Sdh6K06ln8FG4whOQVvVz3vc2Q63rmvxREcS9bLEUcVwyOvFl8LSuYGMWj3c8ISyqNu0+MYaltTbA7BAb6Rw7h5zja02p
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p191-20020a2574c8000000b00dbd15c3b753sm1281920ybc.46.2024.02.12.07.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:56:15 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc75bc22a10so2339555276.0;
        Mon, 12 Feb 2024 07:56:15 -0800 (PST)
X-Received: by 2002:a25:cd04:0:b0:dcb:ce4a:bc2b with SMTP id
 d4-20020a25cd04000000b00dcbce4abc2bmr744036ybf.51.1707753375531; Mon, 12 Feb
 2024 07:56:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135318.165426-1-biju.das.jz@bp.renesas.com> <TYCPR01MB112695DD366FE13CBB161347886462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112695DD366FE13CBB161347886462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 16:56:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX551g-PWbbOYc_qpUkWOwv1w_L0rAL-=djVgkDo3qBhw@mail.gmail.com>
Message-ID: <CAMuHMdX551g-PWbbOYc_qpUkWOwv1w_L0rAL-=djVgkDo3qBhw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 3:12=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> + IRQ chip
>
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, February 6, 2024 1:53 PM
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> > gpio@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> > Subject: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL=
 in
> > gpio_irq_{en,dis}able
> >
> > Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL=
).
> > That means the pin is just gpio input and not gpio input interrupt any
> > more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
> > rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
> > during irq_disable().
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  * New patch.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

