Return-Path: <linux-gpio+bounces-22399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFAAED7F6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 10:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97B23163522
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 08:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDF424167B;
	Mon, 30 Jun 2025 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vICJWPed"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B477238C1F
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273878; cv=none; b=scFnMVueg3HRqgpUXFKTj4wbbaLwAO/Z26j7AVyl0TWc2GNqo9KVGOV9oNUVCEXy71z7uoqiBMKpeQd3WT8/CYXo3jj/G6DZGqEd/GDYgLzxgPvA0+NiRYZFRmESSSlFcuCoV0YD+EYwEutAd0pP1UcIquGlk9Ktj/07cE3lgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273878; c=relaxed/simple;
	bh=onLgqf9wBQTKSo4b8bzwNbk/HjG4OEyCuw7AQptX5lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwfEI07+8TyeBGgHLK+jD92DH/KBkNErRBVcfLfhd8aLRbOxtEtMjmAwPEXpjusbSM3FIgiUZDVh3px+gqitaVE5t4c/WXky6PjmjBP9z1WHdg2e4wF3/aMgkVoiuYbyLFm3Myh88CqNxOPckSlaOR2spRvjBMCdrw2vsv1JlR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vICJWPed; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so5730598e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751273875; x=1751878675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFXh1Z91L70sdrJwqWRqSBN592H16a2JIB1wd9q9WPE=;
        b=vICJWPed84G7CviciejousAgpZUjAY9W7mXrPCSzycY6Lf4+tS3rQSfRDGzHtxWvEF
         cD84eLu5UKyVKxNVXy7UMhw5vzqLN8g18KuTEKErg12jAIFQYjvgw2hsnYbIDAfw9uMt
         VLET3VctgLCQxshJ0+Fru9GmmfZD/LlARt6ZmQ7t2mBxJ1vm8sFJCYXnZUey4MrtCCGf
         a5GG2bZKwTADX9adF0ITpS08n0XvI/7Eos35WhTl85QQNZ454EOX1iQ18OLdqgK+3UNc
         a8+7QGnkiUHoGFBeT27047mqL91tse/uT/hTJGXPD0ZmRiJtzRCofrUQskDFRjqQ3d3d
         1VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273875; x=1751878675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFXh1Z91L70sdrJwqWRqSBN592H16a2JIB1wd9q9WPE=;
        b=rKUfZLpEdZNcBPOs7BeXLNLA0VVwOuUrdaRrTWS/YLyxOctVBk2fb2pZhlGMTikNJH
         c7AaxONWMGw522mBkdgHV7NGRwhG0et3BSQRTf5PqSgc9f1xTwgMlCtsSQVuDlLQ7CDh
         FaY4CWGQ02qkyBdx5TJS6DergqKGbRfAFuGL5B08BpZMfTnbUL70fEtHO02OJoZo+w+j
         t7QICxl7mmeuEUKXrK9fKBGCZaj+v+Rel6XCNMtJEJKq+mqCmwwURxPonYtEkf75FLJU
         E5t6UVpZ/1K8f95QP/N1l8Gs7xpArmGKCdVpRzMG1UiSmAB9aZjZfntyG8DE6MxCz47F
         x1jw==
X-Forwarded-Encrypted: i=1; AJvYcCVW5KuUjwvVQZ/6iETo6ANpDRB8q3/evDgo0Va21mliIwFc3evzskzzdC+eRqYnAHGb2b7MedI0otxD@vger.kernel.org
X-Gm-Message-State: AOJu0Yytgs5zdknpk2DJFGf8QuT9BULGO02KPkaaLma/g6ONnkoX0AxE
	01PYP/BPL56ixV8YIY5mbT0JknFG+fHoWE742KdKIzhptbRazRkg55tKYLhYBRQJ8HnWr5Nc6dx
	ZC4QT02BJ2NX2u4aGrv4q70YZDzGA4RUODbzOBoGUrA==
X-Gm-Gg: ASbGnctobG9dBw4L3fyPjoAY/9C1noTjvYstIuVIPulj3ixpmsV4+w3QeQZMHDLhv+o
	IKJsN9U0aQRR9/5Bamk5zEy4k11pD10lGoRrVJ/XNzsKLQmpEp/V/AEX2oPN+y2o1zgxr75HoiI
	7o7dwjb+b8umPA8oJnzJfKFhx+e6p6B4PLECmFpQ6AcVAladI5zVyuHFnDt7WkMsd1RRE6B1Biu
	iw=
X-Google-Smtp-Source: AGHT+IHOVxPAMJSWh0SZLmaax8LuaMUfFhCW4STA1Hrax7bYhPG3/h1ZqtEQ5/+skwDUgLGcELqi8cmedawhg6Ze3Rg=
X-Received: by 2002:ac2:4bd1:0:b0:554:f82f:180e with SMTP id
 2adb3069b0e04-55502cb4e30mr5622503e87.16.1751273875362; Mon, 30 Jun 2025
 01:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org> <aF68N4ZYKupWHJoL@black.fi.intel.com>
In-Reply-To: <aF68N4ZYKupWHJoL@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:57:44 +0200
X-Gm-Features: Ac12FXyIhO7e-cJUzkPo19wadzgUrXNHYc5Zx6JLIkPswC_feeEvjBGPtz7bWAE
Message-ID: <CAMRc=Me9QX8OWwFcTHQjXgDKiu_90gaLGeQp600aSSJi0yzbYg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in gpiod_(un)export()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:53AM +0200, Bartosz Golaszewski wrote:
> >
> > In preparation for future commits which will make use of descriptor AND
> > GPIO-device data in the same functions rename the former from data to
> > desc_data separately which will make future changes smaller and easier
> > to read.
>
> ...
>
> > +     attrs =3D desc_data->attrs;
> > +     desc_data->attr_group.is_visible =3D gpio_is_visible;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] =3D &desc_data->dir_attr.at=
tr;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_VALUE] =3D &desc_data->val_attr.attr;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_EDGE] =3D &desc_data->edge_attr.attr;
> >       attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =3D
> > -                                             &data->active_low_attr.at=
tr;
> > +                             &desc_data->active_low_attr.attr;
>
> These were added in the previous patch and immediately got rewritten?!
> Sounds like a wrong patch order.
>

Yeah, bad rebase. Thanks for catching it.

Bart

