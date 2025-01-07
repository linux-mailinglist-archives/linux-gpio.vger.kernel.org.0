Return-Path: <linux-gpio+bounces-14581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4929A04A96
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 20:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3643A5247
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 19:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2431F63E7;
	Tue,  7 Jan 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQPz5jkn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507561E25EB;
	Tue,  7 Jan 2025 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279881; cv=none; b=CfmS+pduxm6EGdHVKVgoIQ11nIM+VjYKVgTbB2TI7U4p+/H5FxiSpbVWdK7+8NX8gl55Og0PZldcXihyHUG1kILjTZbGQ9HjKp2TzLVTFpvUQ/3hiPucJUYM741tp1aK2mM7gKOBmWyt54B8Wsakmjj/NRKKPmC09vivddvqiu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279881; c=relaxed/simple;
	bh=muhZERLUc+PLt9gOO8mTM0ZPZdencVJMNXMHUgMNKa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlRUxhSsyFEfuLocr7eLZxGc+4jPpCmiy/+pp9+IlwrYfE27Vs6I+pZWmsbnTA3DypAbiO1T3F4qPxEe12XTUUhyCDVr31571oqSLiAKJZyW/X3UcKISr5IoOc9MotAh2axGW/ZSoVQVOFXn8J8bWDhM0gbIW6scbx/X5JEJtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQPz5jkn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so19107895a91.2;
        Tue, 07 Jan 2025 11:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736279879; x=1736884679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS+/lrHLVt9gRLOXC+75tpOlbC5FLA8bi9/qLkTu4dU=;
        b=bQPz5jkncUrUTMM/aStBSbQw25CwXrJbyBGc5HQz8RfIfxgLtlP1BD4EV3FZBhAroU
         XmjZFVRMS7Sg+Vj93aYmCEr/lD5AFAKbwLx2OBLGh4zf7SpoSD07Wx68aupB+lChZk/9
         3kr65RmJKI8IegbsPXMMotWa2xgrfPgGY/Y5L8XJGODHGt8z7NTKjsZnkpk3oDX69Pes
         WRCOSjoZfMFMPQ+rsd47GcMzn+taT98ksStogu4W8klGzSumk79s2ngPyRPX4aEKjkSY
         1piB5RtjmR5mAOeNT4X+TJbbuJbGZkjjvb+6UgNdsEsqruJRGzeaHUeSyaZlJjzd+Luj
         ZQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736279879; x=1736884679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XS+/lrHLVt9gRLOXC+75tpOlbC5FLA8bi9/qLkTu4dU=;
        b=Yjk8CckJ9AM6/yUrZvuRTaHLSs4JNEUQJUoEi2JJ6bQ62J/saH8qDQlrxetDIgiI14
         CkyShP1kQA/DTdALwHWydvFNkzXLVLwy2qdT6SVkajHt7OmSO054NKoGGgXxIlcHHXfb
         zHK5+GqWELtT2yYQ/JE56waK+Zf4fXvh0ow88RltF7yW29+wikdUQsMCUHnubybfr4dg
         ofGbjCuru2stJ/3+QG3AT8DYfeEUrsNl546kPp+k/uBwtT7G9/JEg6VZW3KyfJIIMTCR
         1yLkqHhx1w/4nnoufmJnsOCL82aauF9ZOC7YIQ9Wl2FAIpTR0stvR3fyEkbbQI+f1MlN
         aPfA==
X-Forwarded-Encrypted: i=1; AJvYcCU2tbx+2f1q4VO/jef14GmDdbdOkmS01TkQqZQg05a8ZaT+qRPPOnDfxwdUd4lkLrGIDE+GNKisBqXL@vger.kernel.org, AJvYcCXFMU3xG/YXG9gb3dpLv1HZnqmp7Kuhw1ymUGjj00Ek3gedOK+6KXMBWMlIKCKzWkZokDBYsNgvh5Bvp2my@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfo43ub2ZT6zJIjDutK4fnmkl0zyT/8GalIbjf9W0MGP+1e4nS
	mVcLLgL/GBZjFHhZp921Ed8qnv1eLDxLJhPqcpEd9A9nmhEoZ1pY72527tBSfDalY0dWotAQxlB
	XtRNgHbdQr4xeCIg2ARCaUDj1/Gs=
X-Gm-Gg: ASbGncvoxVGGCWrwVbLvmc7OnQWnkkPZuA56fZF6Jky45xJsYj5N9/xYJv3t25/WGgj
	eViZqlhB1hX246NtUO/kt0FvpgBAwQhnGkAno7w==
X-Google-Smtp-Source: AGHT+IFRSsG0GRWwsSGg3v0nhUB0rddAoGf8zrD7gFmN8Y84vWlMuRURmjdpvVJu48VsJPKpM9SM+Tzg5+QEoT3IaqA=
X-Received: by 2002:a17:90b:514d:b0:2ea:4c4f:bd20 with SMTP id
 98e67ed59e1d1-2f548f75ea4mr158587a91.32.1736279879539; Tue, 07 Jan 2025
 11:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107102735.317446-1-noltari@gmail.com> <20250107102735.317446-2-noltari@gmail.com>
 <CAOiHx=kawxL8ABs9D3t8OCXDX+YynpzkipqhTP1ZgpViONi+qw@mail.gmail.com>
In-Reply-To: <CAOiHx=kawxL8ABs9D3t8OCXDX+YynpzkipqhTP1ZgpViONi+qw@mail.gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Tue, 7 Jan 2025 20:57:24 +0100
X-Gm-Features: AbW1kvYdeTr0S0hWI9X2Y1bEuqnNYk0D0M3rZY3Aq5E3Wt-Zh77aQ0X4bQk9KZo
Message-ID: <CAKR-sGemHA_9JqBw+Yt3=+u_eRHMX8sxAQxDM4cAzb97dFpp8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: regmap: add request/free gpio_chip functions
To: Jonas Gorski <jonas.gorski@gmail.com>, sander@svanheule.net
Cc: kylehendrydev@gmail.com, florian.fainelli@broadcom.com, 
	linus.walleij@linaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 7 ene 2025 a las 11:43, Jonas Gorski
(<jonas.gorski@gmail.com>) escribi=C3=B3:
>
> Hi,
>
> On Tue, Jan 7, 2025 at 11:27=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
> >
> > Allow configuring gpio_chip request/free functions when creating a gpio=
-regmap.
> >
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > ---
> >  drivers/gpio/gpio-regmap.c  | 2 ++
> >  include/linux/gpio/regmap.h | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index 71684dee2ca5..32ec85b41653 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -261,6 +261,8 @@ struct gpio_regmap *gpio_regmap_register(const stru=
ct gpio_regmap_config *config
> >         chip->names =3D config->names;
> >         chip->label =3D config->label ?: dev_name(config->parent);
> >         chip->can_sleep =3D regmap_might_sleep(config->regmap);
> > +       chip->request =3D config->request;
> > +       chip->free =3D config->free;
>
> I wonder if you couldn't just use gpiochip_generic_request() /
> gpiochip_generic_free() unconditionally here. AFAIU, these don't do
> anything when there are no GPIO ranges defined (so should not
> interfere with non-pinctrl linked devices), as well as nothing when
> CONFIG_PINCTRL isn't enabled, so they should be NOPs if there is no
> pinctrl link, and do the right thing if there is one.
>
> Best Regards,
> Jonas

@Jonas Your proposal is now used in OpenWrt for realtek
https://github.com/openwrt/openwrt/blob/6ef6014887c393dc07f0349028d93e4fa82=
e0733/target/linux/realtek/patches-6.6/801-gpio-regmap-Use-generic-request-=
free-ops.patch,
so I guess that we could send that patch to linux-gpio instead.

@Sander can you send that patch to linux-gpio? We need it for bmips too:
https://github.com/openwrt/openwrt/pull/17487

Best regards,
=C3=81lvaro.

