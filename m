Return-Path: <linux-gpio+bounces-8219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B1932845
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 16:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869D81C221F4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E7019CD01;
	Tue, 16 Jul 2024 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nObZSuhB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6F19AA4D;
	Tue, 16 Jul 2024 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721139864; cv=none; b=bd+uCtXqdT6fDwBjZ+SKGpRx2mrFRI/ii3KfeKBrGRGW1Q2zJySM64QE29K9wR6i+IKPWGKtnQzjPdnam9bvj4wl3q7KfLa8RRDXYoOoMyjjMTzxAAxtaBAHGlpf9WHgzfAD/GYwkTDwk10Thw0Sjl8kugSlIXXj3vCS9w1FGiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721139864; c=relaxed/simple;
	bh=fxEQUXnEMQA5C1VJILrD6j+i9GLSuIHDtfy2J+qm6lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR6o4E1mxZwU900HHYRFBwTZrEZr4ilD5JFcxE6mgw+85MFNJ/eBdq5XbN3TjwgvWSHT9Lbx7It6/HQwFsow79CoyOocpuIrduXV28i2ztfo3Eup9++HDMXyAza/E9bPmLhpS+tZAJD0052YYUuvlPNvjjhe8JnOdEr3U8JUmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nObZSuhB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-64b0d45a7aaso57954187b3.0;
        Tue, 16 Jul 2024 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721139862; x=1721744662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IloAEevb9j/jeRb0W1UmR0i732zAODizdCFxqOWvxSA=;
        b=nObZSuhBxf26+OXftH6jkotZCgVOVSgBMlE0x5BoOZIpZh0o2T24K3JW3SlAzrFwsn
         WeF/UrzlRy7oGGtf6tFtKXwsN0wKghrkfzuW+o3pd/Wez58xXaP4QL3wXHr06aW2lFOc
         J36XHBhWJYiyBgCT2OOZANCRiAWwOyJN+PdA40oOPV7iVF07Sb7Bt+eoHh3UHwplaftc
         b+ARCLdE7emPM6IN1tVzzUO2BUxyk1QJUxqQpCOPtwtxVaaDy/vLQXtKbuQoIakBP1OV
         +EzM+pPS0Qmj6dzYEfd32ZFExTzExm6/Oz1QInfiZ3azZrxVjQvH/pCD20c9eQg9eJwk
         bS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139862; x=1721744662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IloAEevb9j/jeRb0W1UmR0i732zAODizdCFxqOWvxSA=;
        b=OiDKLwIh8k0OhENwr/CawhuBl1Fz2HMg/c2APliAUWkCqHQjKIHOqO3+NDi9QuPT6O
         RYYefq4/74yYd17M5D7sfTFl0Yr23vZsufMS0jbJPGNJ/syRnrebHHKJjAVFaa17TGE5
         wEFxqV62e11khjGDa9hxgqlI6LUe1a+dsGVg8nkfALWObPSK322+UuJUDSog0H3j8EeE
         QQRh58FL1repJK9S7ohXEP+Db02mToPGCuKPcex6qYfCndw/odh71SibgpSV8HUyLTpe
         x9OdwbNuMToIMl2sIFPwGRniQx6iurmzOpiUJYR39PHCjITn60AsnJl9+CVuq8oZMJpb
         Y4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+RH1VgSQAWf4m4ra8I15jyPrftaZ6QKtcNG4+YVNQDIWJ6fVp22CM3f6cWvD9KGi34DpFKCb1QrQRVp7xCIccHY8dcqrg7+0sPG7HaaHdIAv9LSeX6tvlj4zC2g2hUfDuo0LgydibdA==
X-Gm-Message-State: AOJu0YyPCPrdYFniNkq4+Y0tZxwbz41wPL0MXU4rC1JDpV6pKqF08LP2
	yuDp5bP8+jeIpwzyaU+Pl4YE/shBVDYyCYnRs0AERD5ss5nNhXcFdWIhujHpbNpz/V3J813K7RW
	d7SMEHk/M4GG57cuNOdAvE2uOa2w=
X-Google-Smtp-Source: AGHT+IF45F4/cjaTHhqZQI1M7kkXoOzONUc/n2JH/TE3b2V5uGdk0Ign5R7+DjG+ypwkKUTt2WfJP6BJa8GLui80V64=
X-Received: by 2002:a05:690c:ecf:b0:650:4542:56e6 with SMTP id
 00721157ae682-66381abfa0dmr28480317b3.48.1721139862151; Tue, 16 Jul 2024
 07:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook>
In-Reply-To: <ZpFrslx57m62SEsg@probook>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:24:11 +0300
Message-ID: <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc: linus.walleij@linaro.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It does not exist, do you suggest modifying the "unused" to "not exist"?

Thanks,

Tomer

On Fri, 12 Jul 2024 at 20:45, J. Neusch=C3=A4fer <j.neuschaefer@gmx.net> wr=
ote:
>
> On Thu, Jul 11, 2024 at 10:37:46PM +0300, Tomer Maimon wrote:
> > Remove unused smb4den pin, group and function on the Nuvoton NPCM8XX BM=
C
> > SoC.
>
> Does "unused" mean that they are just unused in current board designs,
> or does the hardware functionality actually not exist?
>
> Best regards, J
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctr=
l/nuvoton/pinctrl-npcm8xx.c
> > index f342aec3f6ca..396bd07e7c74 100644
> > --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > @@ -438,7 +438,6 @@ static const int smb4_pins[]  =3D { 28, 29 };
> >  static const int smb4b_pins[] =3D { 18, 19 };
> >  static const int smb4c_pins[] =3D { 20, 21 };
> >  static const int smb4d_pins[] =3D { 22, 23 };
> > -static const int smb4den_pins[] =3D { 17 };
> >  static const int smb5_pins[]  =3D { 26, 27 };
> >  static const int smb5b_pins[] =3D { 13, 12 };
> >  static const int smb5c_pins[] =3D { 15, 14 };
> > @@ -700,7 +699,6 @@ struct npcm8xx_pingroup {
> >       NPCM8XX_GRP(smb4b), \
> >       NPCM8XX_GRP(smb4c), \
> >       NPCM8XX_GRP(smb4d), \
> > -     NPCM8XX_GRP(smb4den), \
> >       NPCM8XX_GRP(smb5), \
> >       NPCM8XX_GRP(smb5b), \
> >       NPCM8XX_GRP(smb5c), \
> > @@ -949,7 +947,6 @@ NPCM8XX_SFUNC(smb4);
> >  NPCM8XX_SFUNC(smb4b);
> >  NPCM8XX_SFUNC(smb4c);
> >  NPCM8XX_SFUNC(smb4d);
> > -NPCM8XX_SFUNC(smb4den);
> >  NPCM8XX_SFUNC(smb5);
> >  NPCM8XX_SFUNC(smb5b);
> >  NPCM8XX_SFUNC(smb5c);
> > @@ -1173,7 +1170,6 @@ static struct npcm8xx_func npcm8xx_funcs[] =3D {
> >       NPCM8XX_MKFUNC(smb4b),
> >       NPCM8XX_MKFUNC(smb4c),
> >       NPCM8XX_MKFUNC(smb4d),
> > -     NPCM8XX_MKFUNC(smb4den),
> >       NPCM8XX_MKFUNC(smb5),
> >       NPCM8XX_MKFUNC(smb5b),
> >       NPCM8XX_MKFUNC(smb5c),
> > @@ -1348,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] =3D {
> >       NPCM8XX_PINCFG(14,      gspi, MFSEL1, 24,       smb5c, I2CSEGSEL,=
 20,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(15,      gspi, MFSEL1, 24,       smb5c, I2CSEGSEL,=
 20,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(16,      lkgpo0, FLOCKR1, 0,     smb7b, I2CSEGSEL,=
 27,   tp_gpio2b, MFSEL7, 10,  none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > -     NPCM8XX_PINCFG(17,      pspi, MFSEL3, 13,       cp1gpio5, MFSEL6,=
 7,    smb4den, I2CSEGSEL, 23, none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > +     NPCM8XX_PINCFG(17,      pspi, MFSEL3, 13,       cp1gpio5, MFSEL6,=
 7,    none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(18,      pspi, MFSEL3, 13,       smb4b, I2CSEGSEL,=
 14,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(19,      pspi, MFSEL3, 13,       smb4b, I2CSEGSEL,=
 14,   none, NONE, 0,          none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> >       NPCM8XX_PINCFG(20,      hgpio0, MFSEL2, 24,     smb15, MFSEL3, 8,=
       smb4c, I2CSEGSEL, 15,   none, NONE, 0,          none, NONE, 0,      =
    SLEW),
> > --
> > 2.34.1
> >

