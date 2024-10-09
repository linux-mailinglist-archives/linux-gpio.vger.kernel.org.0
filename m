Return-Path: <linux-gpio+bounces-11098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA6996714
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 12:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50859B256A1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 10:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0507F18EFEC;
	Wed,  9 Oct 2024 10:22:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342E18EFFB;
	Wed,  9 Oct 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469370; cv=none; b=JI3dWt7DQifCkULPsfW5FGXB+HTkfPk4OL5GYzJ4yAiFl8qnAlaBzR73yVQqDPb75ChuBWmKmWqN670qTwCTnxzE9NWe38R8vSDNy1i4e60DkgVQ0o3ELdRGi6xcMOA1El8nPeGXALwlIw9xyy+SzfIoakYFEqu1w+vT9ms+Qbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469370; c=relaxed/simple;
	bh=K4uNaSJ4WI/XJ+BJRt1j4ykzLRyAnavC8u/VctcOnAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHznW48AR8xeSRo9NPHbJSNgey5Ze7a0vyGTpbZpcpkuD54w6E8lgAcVcwaT7NLcKAQd0PKkcza5p8G8+hbbx8y8Sw1sa8gJGSTIM1ck2wbPlhdw7dAd0GDDRLMLfwiffBcZlujI8vryqiwpXkZ3+UFYal/Jqg+UChmcSWWLEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e28ff55468dso595143276.2;
        Wed, 09 Oct 2024 03:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728469367; x=1729074167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v6cVMXVcQ+duFeyKUWiTBYeZMD7oE6IYMW8xnFpxuY=;
        b=FTZjrlYo+6r9IKbVPn/G1PgPyaOL7hKtQa8eGEXJlHEcvyzzJ/0Ml0IHiks6KWpR0n
         5p2JAvxT9T6hl5MV9kbueBsN0v6STwnQxxeg9ttwu7PX3AS1g9UFa4zJUyxE88Qwsb0O
         nl5SFQkSzMDmIsm7eWCpuTmOnhDlTh3MBSo0o6bVOyJGCdtghUHq/C09i01L/QtYoomD
         HkEBVkEZyudEdEJGTR585LvFAQ4lxTo3PDO/9CJHJ2/Cy+ckZwK4fuU+h6O6NMnXauLf
         HEZiyqU5EqRDNhFzD2TWgCbShToFVhjj5tC8qzF5j8nwTqsS5AY2NMHNTTnEi3EKDb8m
         B4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUJjZxMfjKEGahlD3S4AkTY79XEeFtk4FOk6MJnV7ZeN4mOOQvyZS1IzYWjSWcIHfGeWnkR5juN9Ch/iXsULJLXHY0=@vger.kernel.org, AJvYcCUtPeeRC7GqhY7mzYl0widD+2HTnIJB2xf4wVhW/IU4XYL6X75CdxPmCMNnGQHgd4CfpbZ6UubaaKAU@vger.kernel.org, AJvYcCXPH2jsLTWPREc8ZE5mvMzzPsiTizksaNMAEBpyRvMGM38294TBTb5EgUJZpp0GyqiqL5a43suhtMiKXIOF@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNLCi3g+W8ecRTlGf/NdtSO7MhJPVjctjb5V+AfGwlSvHTYww
	GaHNYX9TVoyZUb6iW/owHNjGysA9MtMuFSDyVuVVwTt4VcVlMgfd6EGVQRUz
X-Google-Smtp-Source: AGHT+IEQilo6Q3Go46I6QGC6URXLP5/F5XcfAPe6Kh7fOyaO/LvdAKdZdUVPqfn+VrlkREYUztmTtQ==
X-Received: by 2002:a05:6902:2804:b0:e22:5b5b:58ad with SMTP id 3f1490d57ef6-e28fe6aae3emr1582948276.54.1728469367410;
        Wed, 09 Oct 2024 03:22:47 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e28a593b359sm1701780276.1.2024.10.09.03.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 03:22:46 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6db836c6bd7so62653677b3.3;
        Wed, 09 Oct 2024 03:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyrpPml8GKeUqOFCWG8JaNQnODY6aZwhe+NNmO8itU8Yu6MhpDKyAUJKIRbbLITNXWQh5UBi2NQKAwNsTdpJ5bU54=@vger.kernel.org, AJvYcCVKNaXAlWxbBj2BSBQFweU+VYB41ukQCzf0v59ggMOtEXCvFLFdKVduTs2S0qtD34GnrKbvVX1GC7cH@vger.kernel.org, AJvYcCWCS28VftmK73SEC7UUgi8O3vRwq+brf06Um6lMPR1mj2SJXeuvv0/oCKF0w2THpV7AUH2u7qCLynw/eLF7@vger.kernel.org
X-Received: by 2002:a05:690c:fc7:b0:6e2:ad08:4914 with SMTP id
 00721157ae682-6e322434754mr19891117b3.9.1728469366702; Wed, 09 Oct 2024
 03:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
 <20240930145244.356565-2-fabrizio.castro.jz@renesas.com> <1c3c8c5c-8f84-47c7-a9d0-963f95cba147@tuxon.dev>
In-Reply-To: <1c3c8c5c-8f84-47c7-a9d0-963f95cba147@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Oct 2024 12:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuOm8xwYOMsJthcR+WaFjQPM--0A--f=FtXS9k5MZnjg@mail.gmail.com>
Message-ID: <CAMuHMdXuOm8xwYOMsJthcR+WaFjQPM--0A--f=FtXS9k5MZnjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Oct 9, 2024 at 10:00=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 30.09.2024 17:52, Fabrizio Castro wrote:
> > The RZ/V2H(P) has 16 IRQ interrupts, while every other platforms
> > has 8, and this affects the start index of TINT interrupts
> > (1 + 16 =3D 17, rather than 1 + 8 =3D 9).
> > Macro RZG2L_TINT_IRQ_START_INDEX cannot work anymore, replace
> > it with a new member within struct rzg2l_hwcfg.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks!

> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> > @@ -251,6 +250,7 @@ enum rzg2l_iolh_index {
> >   * @func_base: base number for port function (see register PFC)
> >   * @oen_max_pin: the maximum pin number supporting output enable
> >   * @oen_max_port: the maximum port number supporting output enable
> > + * @tint_start_index: the start index for the TINT interrupts
> >   */
> >  struct rzg2l_hwcfg {
> >       const struct rzg2l_register_offsets regs;
> > @@ -262,6 +262,7 @@ struct rzg2l_hwcfg {
> >       u8 func_base;
> >       u8 oen_max_pin;
> >       u8 oen_max_port;
> > +     unsigned int tint_start_index;
>
> Maybe you can use u16 (even u8 is enough at the moment) and add it a bit
> above (if u16 or even if unsigned int) to avoid any padding, if any.

Good catch, I had missed that struct rzg2l_register_offsets is 16-bit
aligned ;-)

I will change it to u16 and move it up while applying.

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

