Return-Path: <linux-gpio+bounces-32794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDwkL1N4rmlwFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 08:35:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A58234D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 08:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05A9F3059FF4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 07:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F0E368284;
	Mon,  9 Mar 2026 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IslhMmYS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF835838C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041566; cv=pass; b=E0dKIyqAmtDh8UH/5Fa/4TaA1G6i/qeID/YIfY6SESfps7elsW2Fk/6Q8mxP24tcHuH54mVH651O/p1mUEv9eZ6P9rwT6eQmrBuWoFnxJwFZiyY7mk5XpiEw+OP+fN9fsTB+FscE46SFU4IhUXLYFNwW9ezt5FeYhVTC3vJ0mDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041566; c=relaxed/simple;
	bh=DH1rJ36nVJLLDjqFDxgTmWF1Mwn1wYvC+/hgWQyJHqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCOmuSHdn/K2tBrsfEgZLncDTBLCB/R090ioVWQ+l43HH+vkIPvhUeki8KlgvPr/qX9dt2Hrx9KOuEIJRRS0jxJ++Sv94BQONZjyhSQ8GasLBs1T86k8QydE8WscOpYNfkhBW7cSfGPU75uQjBhNjRfkNVnjoVhN0nuLILbBG3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IslhMmYS; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6611e4aefdcso7721412a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 00:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773041562; cv=none;
        d=google.com; s=arc-20240605;
        b=b3jVDeEVfrXbSzX4Q8bgtnUhxCXuZkZfA9essgq01uCN2Z03eICUX+y9CisHPsryIS
         Vok9NuCWD3XwADFffPai27wPWTCVF1KH/zhVu/N7aNk/Bx6V8lyK08EljncNyN+RBtF9
         8Q/b16ikJBQY1YYC7LsDO/ickXxDpowPo6SuFwIvy1ypSykGZlngQM/oP5CLG4W3utVD
         apL4VY+zmL0bA0xzBjvKlLJysAfuLOI0y0bPCignGokJHtGHY9pGje7UwwnA3nPHWRBo
         RLoEbb+C8rsk0lEDtZBWEBu3+hnpDiqOuXe6f66Ce6Am0WMiOlG4Z25EMB0FVTH3rrLL
         CJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=akeSupG5m8VPhkGeEV9BLXdavZm3NemGKXEB5aL2sYo=;
        fh=/RYh3UhkyWgMHuvV4aPzEoKjx4tyjRy+k0XIGNy4K9Q=;
        b=JiCp+7MljXOkXFLLuUgiyFOaj8MoJj3c6xWFzyg0EiZKntV0dVnDst1997/pDHVvfv
         mqif1t9LHHSE4rMjh5+WEvg9Y7BaE4y7DSd8j4Shh3Dih3w/+wrg4rYyiAo/1cQXiJ/Y
         EzANmeXZ9L+u0+JM5GfU8VJ7VmW0DYT/9s8cHVoyi8mDN67OMUtP9zCHW64poSNbCE8w
         0y3sSN6XIDDO/AdsoU3qfp4cFznqeS4BV2B50Ppt83EHvql1LaJk8yh8+YaqgU7r+Osl
         OB5apvB7sxGQfrKtRo2C5bR5POk9LzP10VQbKxMz28WigpbQq1N3GQqS5rBXFT5+ZfjT
         V7cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773041562; x=1773646362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akeSupG5m8VPhkGeEV9BLXdavZm3NemGKXEB5aL2sYo=;
        b=IslhMmYSh4HvKBypGRrLam7J90egy/IZTMjg/bBpBwrTSUzpkwGnq38R3VgVadvEzd
         aQwrlQ+rgQTBV/OqQorA23i7xqw66zq+X9XLVukkleNxDJf5qyA2jwpZBNf6sobYJHo8
         gRVe1hoIGT4Cep6HyWwJ6HUBeLElXoXb7Rhq2K/cJz+DsJLaTCeUZhR5MkGQnEIq6lHY
         gLzeGDzDmFRs2SYZGKAds3iggKpBN97LS4YeHdOrehDlwkszLG4Z7G33jmu77Y7+7k5U
         JOKGX1KCe3DOb+t/6Wwp+B2Kn0aJ44mf9GYKfbs+7h4hyXwR7MwG2+I/fmfEIgrZ+1Vz
         d96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773041562; x=1773646362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akeSupG5m8VPhkGeEV9BLXdavZm3NemGKXEB5aL2sYo=;
        b=tL1kwHQV/yHEkbZKztPAC0dAujQmQczzx5Sr90y75WQnOOFYVijHyW3Sf3pdojpCHu
         UQMGhnWDOhwr6z23apLNr1LFImVSOZnn4D7Y1kg22kjP9+6g8cu00TLtQug9o+d3jHUz
         Wi8Xx2sv98iEHYRBJm6gnIZAy42X/DezbI/0ZcdZWrFTEWbeBgZjDJCuWefchj3N4/Zv
         OMTjx1ZAial7jkjVHv16Zu2bPGclssjnndg5b5Yc1OqKaZ4N1hPOV1Bcc5LnGFR51rJ0
         NOQ4hfUdwSSAngVCullTzVY8h04Hg+TrtKZJDb/IxY4cDt6TgGSepOa/g6vo1J+XAXU9
         ikOw==
X-Gm-Message-State: AOJu0Yx4/NHsE4kNvZpjP67sP8rhx1cV3OZtpY2CZjDgo9w8/X90KmiV
	N2/2UVbs7YW2WSL6ae2U338F3+A6UYb11ei+pZWYV4+V7zwb+Et14ctdx/LZIQMYHyerE2jfQ8s
	AxUfALG8/r6j4bh4kA4WZfEDIs+Ig2Ew=
X-Gm-Gg: ATEYQzy4k7cbQxdLRK3YHLDScU3ViPfTfiTsc1B2ncZ+2rudPE12fYTsZmINbecenfh
	6dRA+XiUYvsDsVvoTEe8Y5RYJ5p+/Z9dhV3FRojRHgEqaYZ34PZ2+47nwtzXrEk6VJciSL9haZ7
	Imkf776br3HJEYz9LlCUOkfDN6gAuw/IG+JMO92wG8rUmy2kj6u7aHDCGnlPS15+yPQcUVAGbMc
	WcIVkzwOkmXnRKLAXVAENFzlrtq9LrcOgDQekMKmPUW36pAaxpSZwDPhtJNkM/2lpiK89DDXcre
	5fCl2jyWOhLaYvq/ZUPlxMxRlHEyYtpe1K2YN+aB8408OwwIVTRz0/jl/Fra69pXWu+sYeLBXI/
	OfKM7DA==
X-Received: by 2002:a17:907:2d9e:b0:b97:7a:768e with SMTP id
 a640c23a62f3a-b97007a8663mr61285566b.12.1773041562142; Mon, 09 Mar 2026
 00:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021201.47820-1-rosenp@gmail.com> <aa1pZdYEU8QkI_8x@kekkonen.localdomain>
 <CAKxU2N9WCtyoEhdZk=GY=3kuYkv3NKrRZ6kNE8-feGYp5AXTbQ@mail.gmail.com> <aa50jIM0Xexg1hiQ@kekkonen.localdomain>
In-Reply-To: <aa50jIM0Xexg1hiQ@kekkonen.localdomain>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Mar 2026 00:32:31 -0700
X-Gm-Features: AaiRm53KxlLd6cSb2N0U-kkIOonQLqmLftHrhzNhnzCzOcZN0Sz_D8pG2cchpVs
Message-ID: <CAKxU2N_kb-CGHkbZhfht+HauKj31q-W=vkN6TG35=zQw5n2Lfg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 45A58234D8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32794-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.902];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 12:20=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rosen,
>
> On Sun, Mar 08, 2026 at 11:54:07AM -0700, Rosen Penev wrote:
> > On Sun, Mar 8, 2026 at 5:19=E2=80=AFAM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Rosen,
> > >
> > > Thanks or the patch.
> > >
> > > On Sat, Mar 07, 2026 at 06:12:01PM -0800, Rosen Penev wrote:
> > > > Convert connect_mode to a flexible array member to avoid calling
> > > > kcalloc and to combine the allocations.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/gpio/gpio-ljca.c | 16 +++++++---------
> > > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> > > > index f32d1d237795..a531aaa0425f 100644
> > > > --- a/drivers/gpio/gpio-ljca.c
> > > > +++ b/drivers/gpio/gpio-ljca.c
> > > > @@ -63,7 +63,6 @@ struct ljca_gpio_dev {
> > > >       DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > >       DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > >       DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> > > > -     u8 *connect_mode;
> > > >       /* protect irq bus */
> > > >       struct mutex irq_lock;
> > > >       struct work_struct work;
> > > > @@ -72,6 +71,8 @@ struct ljca_gpio_dev {
> > > >
> > > >       u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > >       u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > > > +
> > > > +     u8 connect_mode[];
> > > >  };
> > > >
> > > >  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gp=
io_id,
> > > > @@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_d=
evice *auxdev,
> > > >                          const struct auxiliary_device_id *aux_dev_=
id)
> > > >  {
> > > >       struct ljca_client *ljca =3D auxiliary_dev_to_ljca_client(aux=
dev);
> > > > +     struct ljca_gpio_info *gpio_info;
> > > >       struct ljca_gpio_dev *ljca_gpio;
> > > >       struct gpio_irq_chip *girq;
> > > >       int ret;
> > > >
> > > > -     ljca_gpio =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), =
GFP_KERNEL);
> > > > +     gpio_info =3D dev_get_platdata(&auxdev->dev);
> > >
> > > You can do this assignment in variable declaration.
> > I avoided doing so to keep reverse christmas tree order. I can still
> > do so if desired.
>
> How does that affect it? There doesn't seem to be a dependency here -- an=
d
> even if there was, the dependency obviously has priority.
It's just cosmetic.
>
> > >
> > > > +     ljca_gpio =3D devm_kzalloc(&auxdev->dev, struct_size(ljca_gpi=
o, connect_mode, gpio_info->num),
> > >
> > > This line is a bit long, I'd wrap it.
> > Will fix.
> > >
> > > > +                              GFP_KERNEL);
> > > >       if (!ljca_gpio)
> > > >               return -ENOMEM;
> > > >
> > > >       ljca_gpio->ljca =3D ljca;
> > > > -     ljca_gpio->gpio_info =3D dev_get_platdata(&auxdev->dev);
> > > > -     ljca_gpio->connect_mode =3D devm_kcalloc(&auxdev->dev,
> > > > -                                            ljca_gpio->gpio_info->=
num,
> > > > -                                            sizeof(*ljca_gpio->con=
nect_mode),
> > > > -                                            GFP_KERNEL);
> > > > -     if (!ljca_gpio->connect_mode)
> > > > -             return -ENOMEM;
> > > > +     ljca_gpio->gpio_info =3D gpio_info;
> > > >
> > > >       ret =3D devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
> > > >       if (ret)
> > >
>
> --
> Kind regards,
>
> Sakari Ailus

