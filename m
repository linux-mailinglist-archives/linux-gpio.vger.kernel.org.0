Return-Path: <linux-gpio+bounces-26756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EDBB29CF
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 08:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8758A32451A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 06:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15ECB28727F;
	Thu,  2 Oct 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0oN3lnc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B127AC3C
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759386052; cv=none; b=atX/I42CoziCE1EC6+MUI3tujDMi/ZX1eM3FJMuEz+uqC5QP0M+BpiOyQqR0wjddgOvX7hnsrjPtJQ26bB31Mt5qPnEeb/hfeuorau4LZUdHpBiy2juist340doAxpq6uL4+jUf3vMYsU5VdAFupCvdWF8SynM6Q3PAnuQ8a/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759386052; c=relaxed/simple;
	bh=UNOlGRUb2F62rGzVEa0QkuGjIMpHnAX408mUBw31bhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0UZylek1IHQEnu16JBtf207avyoeVdkf1DUUY9IK9criHZ+4pYopOCwWW/H+qkGNM7HVgrCGVFeM9PNlwN2wgdHr6J9JhKamLPmpDjkIvQ6acyDcSwbkuGfW7PLlGxP2eNgbaZ9m6cIGih30XQaARZzbYush2UXl0QhJTyTQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0oN3lnc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e504975dbso3406275e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759386048; x=1759990848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRTBM8LnR/gK/57/NUtGMW396PKa7QUFyM6GxtmZzcw=;
        b=E0oN3lnc59W2KB5Gaie3GBYyi5o5MPYYuwoz+HTuzMOSYgxacgW5iV7XsRGaj/4z08
         tXOTG8RIJ+0w69jGO/FevHPBowiVcyr4b3Hl2KT16GRoZWvSH3JtfNWfHS4Ji3h06Xfe
         8EdZCfglKrNcDWGOIwy9TpnsNIg9XsJbOFqZ0CDmNCbZ18tDaMEKPJ5eQksanhDG2rQ/
         lqmEpKA7ofkvB1tDWWk/NGjJWTc0Mcj/dDnTTHM5YLipi3g2NppqZxBq83K6AV72atRv
         6NJ2CRc6ly/bfkp+WLpX7BZZjmPoAumWgPFdmXDBj+5kosyqjcHy8OV3Tzllue5vXvbH
         6sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759386048; x=1759990848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRTBM8LnR/gK/57/NUtGMW396PKa7QUFyM6GxtmZzcw=;
        b=qe+41NTvdCV3yXW4PK7a6MJx/iw8EedTNertAT6bRWdSJF/bUJdoGXabF9qEqfIWOz
         10ad2IxE6eDGLcXwta/IwJe+rd5+R89sXs5N0M4QKRRtcwBhKMc/RrObhY47qYbYoNEP
         Dl8uTgrf9Ihcn0VJMRTFOwtOAIYWVwh6PJb+WeNWJk3OJuNxBYsLCNEiu+sNlY5FWlL4
         k0HUU6z2yLE43jrAE3H1BfBCtoUgvzbR5SFVFshYs8KIiqFFMJuzf4nUOMk+evv7YZHb
         UADsJMxLVXQrVeTw3UIVmzaiYSwmNkmdgkmoQ/UgUiSZgXZ/RXtQ63IE6AARn0BYGNge
         hc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnvRmFmLbf+DOb+tUcVsFTU5Zc1/9NBHo1ikUdqnFS4NEY3o//6cDM/sG2B9YYKxoTV5DIhUFsbLjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYNJs7+nxKzWeIS2A/+Oj6Jz0XM3sLtTWkGecUWvNYZkRP36L
	tQ+fc8Ze+BIQqsBCFKvllTT4ZDMqHF1GQp6TNRHw4XqHUf8Wm4jitojG1smI/+dHS+pdWzbrdox
	7Ed0oBNrccOH6MNtqelegRwFEVwHJYdo=
X-Gm-Gg: ASbGncvr7me0qQOmMcqnbRLQ6q3oIaqO0Q+G5gpIaeWgqx0kAjaxZhyBVMwtd20RpDs
	aqSqiiSh2Em6KuE8bgbzUyntSlO2WMHH+r+M+KbIULpTisByhw8wS1MeHRiXZYN4PmNvrHuFZbC
	cCw4JQM8NvmxjsTfBl8IThRyum7UFcjmwNFv3v8IfDhZWgEMUzKKTaZhWzKorPV/D94cuvubwBJ
	3i4XmL7kbc5iYTBP9od6XCJHxFME6uc
X-Google-Smtp-Source: AGHT+IG9I4dMog6DxhWZOtxZxWspqecPS6EJtfodnZXn/7hJIjt8sWMqMJeo+ECpmT/FYt/a4eXCECTuucjee6Wbagg=
X-Received: by 2002:a5d:64e6:0:b0:3ec:e152:e2ce with SMTP id
 ffacd0b85a97d-4255780b3bfmr4279258f8f.32.1759386047845; Wed, 01 Oct 2025
 23:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com> <3862885.G96rZvMJ2N@senjougahara>
In-Reply-To: <3862885.G96rZvMJ2N@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 2 Oct 2025 09:20:36 +0300
X-Gm-Features: AS18NWD2rw-jNTiwDDXFJSZS6WdVYt-M8PE-7b82qk0Xm-jz28tlJ9BCRahpUc8
Message-ID: <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 09:12=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, October 2, 2025 2:41=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
7:00 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wednesday, October 1, 2025 4:59=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=
=BE 10:51 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =
=D0=BE 08:07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > > > > >
> > > > > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80=
. =D0=BE 07:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > > > >
> > > > > > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav R=
yhel wrote:
> > > > > > > > > Simplify format align calculations by slightly modifying =
supported formats
> > > > > > > > > structure. Adjusted U and V offset calculations for plana=
r formats since
> > > > > > > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/=
4 planes for U
> > > > > > > > > and V) so stride is width * 3/2, but offset must be calcu=
lated with plain
> > > > > > > > > width since each plain has stride width * 1. This aligns =
with downstream
> > > > > > > >
> > > > > > > > plane
> > > > > > > >
> > > > > > > > > behavior which uses same approach for offset calculations=
.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++=
++------------
> > > > > > > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > > > > > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c =
b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct=
 v4l2_pix_format *pix, unsigned int bpp)
> > > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDT=
H,  TEGRA20_MAX_WIDTH);
> > > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIG=
HT, TEGRA20_MAX_HEIGHT);
> > > > > > > > >
> > > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2=
) * 2;
> > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) *=
 2 * pix->height;
> > > > > > > > > -             break;
> > > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8=
);
> > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) *=
 pix->height * 3 / 2;
> > > > > > > > > -             break;
> > > > > > > > > -     }
> > > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp=
, 8);
> > > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  /*
> > > > > > > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_set=
up(struct tegra_vi_channel *chan)
> > > > > > > > >  {
> > > > > > > > >       unsigned int stride =3D chan->format.bytesperline;
> > > > > > > > >       unsigned int height =3D chan->format.height;
> > > > > > > > > +     unsigned int width =3D chan->format.width;
> > > > > > > > >
> > > > > > > > >       chan->start_offset =3D 0;
> > > > > > > > >
> > > > > > > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_set=
up(struct tegra_vi_channel *chan)
> > > > > > > > >
> > > > > > > > >       case V4L2_PIX_FMT_YUV420:
> > > > > > > > >       case V4L2_PIX_FMT_YVU420:
> > > > > > > > > -             chan->addr_offset_u =3D stride * height;
> > > > > > > > > -             chan->addr_offset_v =3D chan->addr_offset_u=
 + stride * height / 4;
> > > > > > > > > +             chan->addr_offset_u =3D width * height;
> > > > > > > > > +             chan->addr_offset_v =3D chan->addr_offset_u=
 + width * height / 4;
> > > > > > > > >
> > > > > > > > >               /* For YVU420, we swap the locations of the=
 U and V planes. */
> > > > > > > > >               if (chan->format.pixelformat =3D=3D V4L2_PI=
X_FMT_YVU420)
> > > > > > > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_s=
etup(struct tegra_vi_channel *chan)
> > > > > > > > >               chan->start_offset_v =3D chan->addr_offset_=
v;
> > > > > > > > >
> > > > > > > > >               if (chan->vflip) {
> > > > > > > > > -                     chan->start_offset   +=3D stride * =
(height - 1);
> > > > > > > > > -                     chan->start_offset_u +=3D (stride /=
 2) * ((height / 2) - 1);
> > > > > > > > > -                     chan->start_offset_v +=3D (stride /=
 2) * ((height / 2) - 1);
> > > > > > > > > +                     chan->start_offset   +=3D width * (=
height - 1);
> > > > > > > > > +                     chan->start_offset_u +=3D (width / =
2) * ((height / 2) - 1);
> > > > > > > > > +                     chan->start_offset_v +=3D (width / =
2) * ((height / 2) - 1);
> > > > > > > > >               }
> > > > > > > > >               if (chan->hflip) {
> > > > > > > > > -                     chan->start_offset   +=3D stride - =
1;
> > > > > > > > > -                     chan->start_offset_u +=3D (stride /=
 2) - 1;
> > > > > > > > > -                     chan->start_offset_v +=3D (stride /=
 2) - 1;
> > > > > > > > > +                     chan->start_offset   +=3D width - 1=
;
> > > > > > > > > +                     chan->start_offset_u +=3D (width / =
2) - 1;
> > > > > > > > > +                     chan->start_offset_v +=3D (width / =
2) - 1;
> > > > > > > > >               }
> > > > > > > > >               break;
> > > > > > > > >       }
> > > > > > > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops te=
gra20_vi_ops =3D {
> > > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > > > -{                                                    \
> > > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_COD=
E, BPP, FOURCC)      \
> > > > > > > > > +{                                                       =
             \
> > > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,    =
               \
> > > > > > > > > +     .bit_width      =3D BIT_WIDTH,                     =
               \
> > > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,     =
               \
> > > > > > > > > +     .bpp            =3D BPP,                           =
               \
> > > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,         =
               \
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static const struct tegra_video_format tegra20_video_for=
mats[] =3D {
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > > +     /* YUV422 */
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU=
),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV4=
20),
> > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU4=
20),
> > > > > > > > >  };
> > > > > > > >
> > > > > > > > Looking at the code, BPP seems to only be used for the line=
 stride (i.e. bytes per line) calculation. I think we should just make it 8=
 for the planar formats (possibly with an explaining comment). With the cur=
rent code, we end up with 'bytesperline' variables in places not being the =
actual bytes per line, which is confusing.
> > > > > > > >
> > > > > > > > Actually, we can then just make the 'bpp' field be bytes pe=
r pixel as it was before to avoid the discrepancy with Tegra210.
> > > > > > > >
> > > > > > >
> > > > > > > No, this code is actually cleaner and in sync with what downs=
tream
> > > > > > > does, Tegra210 bytes per pixel is confusing since it totally =
neglects
> > > > > > > formats with fractional bytes per pixel, it is impossible to =
set there
> > > > > > > 3/2 for example, which is used by YUV420.
> > > > > > >
> > > > > > > According to downstream code bytes_per_line =3D
> > > > > > > soc_mbus_bytes_per_line..., downstream directly name is bytes=
_per_line
> > > > > > > and soc_mbus_bytes_per_line returns width * 3 / 2 which is co=
rrect
> > > > > > > calculation (12 bits). Meanwhile for planar formats Tegra has=
 3
> > > > > > > different buffers so with offset calculation plain width must=
 be used
> > > > > > > (which matches downstream).
> > > > > > >
> > > > > >
> > > > > > If you mean use of BPP by VI, I can propose removing bytesperli=
ne and
> > > > > > sizeimage configuration from VI entirely and leave this to per-=
SoC
> > > > > > fmt_align function which does this already anyway and guards ev=
ery
> > > > > > time those values are referred. This way there will be no insta=
nces
> > > > > > where "places not being the actual bytes per line" comes true.
> > > > >
> > > > > Without trying myself, I'm not sure what approach is the cleanest=
. In any case, the downstream code is just wrong (or incorrectly named), so=
 we shouldn't defer to it in this matter. I don't see a reason to keep the =
value '12' either if it doesn't serve any purpose (admittedly if we changed=
 it to 8 or 1, 'bpp' would be a confusing name for it, but explainable with=
 a comment and improve-able later) I don't mind having an if/switch stateme=
nt for the planar formats to use a '8' as multiplier instead of '12' if we =
need to keep the '12'. But the main thing I want to avoid is a bytesperline=
/stride variable that isn't the line stride in bytes.
> > > > >
> > > >
> > > > I am proposing you a solution, handle bytesperline and sizeimage in
> > > > per-SoC fmt_align function.
> > >
> > > Ok, I think that sounds good. It's good to consolidate the calculatio=
n in one place.
> > >
> > > >
> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 for U
> > > > plane and 2 for V plane, total is 12. "but explainable with a comme=
nt
> > > > and improve-able later" why then we cannot use 12 with a comment? t=
his
> > > > is all arbitrary. Downstream is not wrong from this perspective, yo=
u
> > > > don't take into account that YUV420 is planar and it uses 3 planes =
a
> > > > whole Y plane and 1/4 of U and V which in total results in wigth + =
2 *
> > > > 1/4 width which is width * 3/2
> > >
> > > Yes -- but AIUI, the only thing the bpp value is used for the bytespe=
rline calculation. When we add the special case for planar formats, which d=
oesn't use the bpp value, then the value 12 is never used anywhere. We shou=
ld at least have a comment saying it is unused. (At that point, we could ju=
st hardcode the bpp values in the fmt_align function -- but I don't mind ei=
ther way.)
> > >
> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
>
> I understand very well that for YUV420, each pixel has 12 bits of color i=
nformation. But how many bits of color information each pixel has is not us=
eful in the context of this driver. The number of bytes per line is not rel=
ated to how many bits of color information each pixel has for planar format=
s.

No, it has direct impact. This is how buffer size / image size is
calculated since we place each plane consecutive. And bytes per line
is used specifically in image size calculation. This is common part
with non-planar formats. Then since Tegra provides a dedicated
channels/buffers for each plane, configuration of planar format
includes an additional step with calculation for each plane.

>
>
>

