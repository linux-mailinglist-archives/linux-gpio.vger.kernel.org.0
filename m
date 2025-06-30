Return-Path: <linux-gpio+bounces-22400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEBAED81B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 11:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B9B3B73CE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89571219A7D;
	Mon, 30 Jun 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JMOgk5TK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9011CAF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274202; cv=none; b=NzoAeXduh/fyOSnxAVBXlgAksWxMXwHfadySeaMLyxlcQQeqzxlPhrmxxcNDfpMAn401yvKJVlvF0cnGfOn5rw81SpixiesZ8Gte3behLvi+sqXw0OvmMpMoIixX2N9KFzgH2Sis/hawoFKc4064F7IM21Fd0vI99AUdpWddILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274202; c=relaxed/simple;
	bh=jhiz5uTGaBjjPcT0ccLSwhRZYUnDPnjS6PAZW9PeMfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hllOfAW7hqriq9bmlbtrSAwE9qpl/JwAyzFs+gKDzgNsSuESUryayJUHSen+A5Kpew2dT9DiNCVfZzzzzqLvdsak80G3EBLquZXPstZAhtKasPhRnw4pZYd5wO3QyX5hQjloNPhtGQDAnMyohzRhk4ty9HXU+k0o+aWG0pPjtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JMOgk5TK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b60de463so2099347e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751274199; x=1751878999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWfytxAE0yR5JMaVn6nj9jza361wcodwPKcuA2pMsu4=;
        b=JMOgk5TKhVqI7GoLaXd3udzqkXeov3TEFhzD/oWMpbqI2K9fQfznHK9aUEEA99kury
         eA+gJ3Du6Jpw2/Ay7bVymcHWhKVyAYuOX/T7TE4FzupGClU27bGhPbMq24wbZLxUTlWB
         o6NKwLRgGwJEIwXPuuIMKe+u1Oa8iJqVJhWlZ5UH57SVuPGlCsen1wSM5/M1TZmbAJSa
         Xfb+2oiG8+SfqHP/ostdsX31kTCoNmQXL5e9eFb1bbSLH9J7OKyKi1gTyP2TLKA7QBar
         v+PnEmbtJe2YxqOlb9H/q2awkW2tHBldb93jbs4mlgOpR4vLlpod+bPnZ4ug+TfyHofQ
         FufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274199; x=1751878999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWfytxAE0yR5JMaVn6nj9jza361wcodwPKcuA2pMsu4=;
        b=ma95QTCkPsUksN+hzwojNhUW88THi4Rbi2zbYlv1aJSbHNbXFTTep56fRLlpk1pS8c
         5GHleRb5MIPytcreexwovNbSA8k3VGLJDsZb7k/YTFfwCVid8t7rrF95AXflmbfHWD+d
         pCjSJy1mUaGKNyMnZgMKkqzR1PB9RFp9zF+JzYrQnWaxCDM+a3KIkwEcVzbvl7RGCE8s
         VrL1ZSgKnSZaxINc/Y29RVCtQdr35kWukkPTK5I31LGvJIverNj8Mo93meqW6zfECBq9
         0A+8ZO0u8rmAEDlaqhkH0y2txBrm6xHbBAtUO8vkcmnys9cym0eV5ZUbpMltZMeaHBr5
         PrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVODOuOLbldWwqGHx8z36tr8CbtR4W6HKs9cgI45nDh2R+p2GnDItNHRsQMz22BcZ/cCcdLMeUXf/Fp@vger.kernel.org
X-Gm-Message-State: AOJu0YycAKm7u3x4/OQTpYWIjDac11XJC1QEXpMwL/XPnRMzKVjeT95F
	mYMCWTDKIgIbiCv3QteMLc+t42AtsRoXPQIloc6QL5vNnzmRT0etQ3VMbjRIXVu1/ajO3FRKmIn
	ARuEVQ5eh8UyHUVrkjQ+WBkqUjcBKA4UHhGS1uINvog==
X-Gm-Gg: ASbGnctuWA0KUDUtO+o8FWcdLVF6EymK1RmQrY/TPSpYC2CF28Wik02tEZ6zZieIs0h
	Pu4eJDTlZY1rCHj2xph+sx80Ml/jyJaBRgm8gOPRisW0weW83b9bT6PWhycJv+Pvhp/iYsFeLU4
	VVEtpvIOPUQWI2BaYBLKfWa7B88chOs8xuJONfrKW/k2EKqeyEgUIlqspDSFjKqIfjNspfAjdG1
	v6I7fMIviZoUQ==
X-Google-Smtp-Source: AGHT+IEZM94paauPN9kvyN5Wy0jAVk6uUDoM5NB/O/ifpnz8OMcjWjTVIWjVVV88LAhS1A3q1SKAqCf3uJXQmzaN7aA=
X-Received: by 2002:a05:6512:3ca4:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-5550b8d27demr4364859e87.32.1751274198860; Mon, 30 Jun 2025
 02:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
 <aF68N4ZYKupWHJoL@black.fi.intel.com> <CAMRc=Me9QX8OWwFcTHQjXgDKiu_90gaLGeQp600aSSJi0yzbYg@mail.gmail.com>
In-Reply-To: <CAMRc=Me9QX8OWwFcTHQjXgDKiu_90gaLGeQp600aSSJi0yzbYg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 11:03:07 +0200
X-Gm-Features: Ac12FXx7mT93_RUnod8ZjnTuvOmNDb0--jhnoYMQ5ORLT9Cbc4o-DnA9kg0kdWo
Message-ID: <CAMRc=MfrqmBKZFGvTzyasTnAf6NcVBhTPaZHj5ncEeCVxH_LSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in gpiod_(un)export()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Fri, Jun 27, 2025 at 5:43=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Mon, Jun 23, 2025 at 10:59:53AM +0200, Bartosz Golaszewski wrote:
> > >
> > > In preparation for future commits which will make use of descriptor A=
ND
> > > GPIO-device data in the same functions rename the former from data to
> > > desc_data separately which will make future changes smaller and easie=
r
> > > to read.
> >
> > ...
> >
> > > +     attrs =3D desc_data->attrs;
> > > +     desc_data->attr_group.is_visible =3D gpio_is_visible;
> > > +     attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] =3D &desc_data->dir_attr.=
attr;
> > > +     attrs[GPIO_SYSFS_LINE_ATTR_VALUE] =3D &desc_data->val_attr.attr=
;
> > > +     attrs[GPIO_SYSFS_LINE_ATTR_EDGE] =3D &desc_data->edge_attr.attr=
;
> > >       attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =3D
> > > -                                             &data->active_low_attr.=
attr;
> > > +                             &desc_data->active_low_attr.attr;
> >
> > These were added in the previous patch and immediately got rewritten?!
> > Sounds like a wrong patch order.
> >
>
> Yeah, bad rebase. Thanks for catching it.
>
> Bart

Ah, no actually I got misled by the indentation difference. It was
supposed to be like this but maybe it is better to change places of
those two patches.

Bart

