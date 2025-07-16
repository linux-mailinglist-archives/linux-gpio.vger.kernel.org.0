Return-Path: <linux-gpio+bounces-23343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30063B07074
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 10:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F623B9FFF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 08:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41E12EAB63;
	Wed, 16 Jul 2025 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z8RocUg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26A128E61E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654419; cv=none; b=BnUCZBTmWK28/eJdzeU3m69Z2iWLhAhRrehrnWMxPGUaQGD7Bod6AE+cQTYE452Z77N1+ZcALgXoCJEtWfeLCwa2SdOzNkWnRbq6tnMjn2YT/iUa+JKOdQn6WVI1izQnVbze1Gh0/jxzKvuBhURej14q7nlNOJHVmkTqj3sZKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654419; c=relaxed/simple;
	bh=oZruOfLx6vYtvv9SzkE9hxxMTRFU83m0JHjiDSurRQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9QO+BxkH8k+skel/0LXhtGsQOachMFA36+1ooK0OknpJUJzeiYzE8xgTNR22StQoaL5Qg7fWAePtjOm6K6c+1ygGZt2YuICq131d0U3pOEkcmk5E4cndFDRfgpoSZWdTw7VQcAEzhcUPzPW0jsONv6AVXVSwMqG3KN7pBt6S+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z8RocUg6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-558f7472d64so620701e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752654416; x=1753259216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZruOfLx6vYtvv9SzkE9hxxMTRFU83m0JHjiDSurRQ4=;
        b=Z8RocUg6LBNxFw0IT6L5cvymGYN0gfwL1wpqar6d7Si0N10t79CnpC9O8RWqyzDZZi
         aiy+fhvEOXU75B4HJtNjq9KIhRV3hlOWiGY3eHUksW+8kcMasz+Mh5Qy79yFAMCtVMhH
         cG3vdulu2qkEAADOxlwT6LUDcxh3Az+LqQU2LAI2n1zdC2qOSPPIHxEJPnlEN2Gb2TXN
         vsfMlbQYFTzIsPoun1gfNtKgPIcvPi2b0UoLggqkw0ZZrF6+L9VlOT1/YgXprAyU0myb
         Awm/VlauyQTO5cKEpYg74P5rVdIePJdBgI/lwyoa7AtggX1ZgRoBVQhETJHe7ukH3Beu
         kd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752654416; x=1753259216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZruOfLx6vYtvv9SzkE9hxxMTRFU83m0JHjiDSurRQ4=;
        b=YjV0uy4RqPgQ/S2dEWMgvHDdKze/PP0bdSouqQ0NwU9hWAOjCsdzBJkBHvD56RwJnO
         3ISuqXck134Gx4iph1wenQZuo2ZukG4+8u2DLU0K/t51e0Wcbat2QVCYONaShrQ+kg2q
         pMfi8vwMxr9zT7h0DB1Owr19pd5hislJztk7MrjinqmQkuNjlUwUmsAGtOs0SpBw4JNS
         n1m4l0UcrfMpTKSIDiEXjLaLxEnLEJHh49VLqIaMyzJezEo11x4+1/vg5i8aYyFE668m
         X3HoQct6+Wc9qzz0o5G6kxGRztx8DiFWsr0TfcPOHV5RQkNBlOuU58yxxd9va3ok0Al3
         dN5A==
X-Forwarded-Encrypted: i=1; AJvYcCVgM9LlRWHLNMtws5nrlF9SBWpMQ3S+2Dm+hkse7rdEhZCjLuu8GjMsT5u/IZY/fbmuP7sgl1H5SV1K@vger.kernel.org
X-Gm-Message-State: AOJu0YyKt2WS8xpdQxsRGgBh9DFvGUkYch651Ahx4WpRgtCUqGHVOZpJ
	nBhx19Xnv7WP6ELVn8ZzKA9SSrB52vLY13soKjUJUYCcdV7aaSD+9P9lYf1SilK1Ji5AsUcWiKn
	yK6UWFAq2BZtufiaq3obNm4gZ+TziEuc9uWHQIHDwVQ==
X-Gm-Gg: ASbGncvaNfWDacnD6T4bSvShBDLcgxMl9JtajSPEAoTDUiqRJd4m/QSazbLlTEUXWOr
	XCHZcImt2RKz3tREfunO3C5YCM6RnXDj7R5lf9YFhemCrJJUy19jbZEj9vW7Drb2sSjFOZHiACe
	aHoMs+qH/bBqZaODxNbKJ+MYllORDRlDCi2Sux8VlR8imPbx6peLBFwhZmEWKhPqSxQevlOpj/f
	kc+m62BRDhjzSUK0Q/wNe50wW/mYZxdgvqsWig=
X-Google-Smtp-Source: AGHT+IFMU33bMlBg+SJGlu9Fd1Nu2AUbYMepUe+1nUovUoAemOaOJTZDwF5FiRr3lwqVEVPiugd2XbwVQxqB2INMLfo=
X-Received: by 2002:a05:6512:3b8e:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-55a238634dfmr630042e87.13.1752654415531; Wed, 16 Jul 2025
 01:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
 <CAMRc=Mc7HaVjchDWN_oWUuqgVZbj3ZVYvU-bwiA+ZUH+0gEXSQ@mail.gmail.com> <20250714013813.GA12284@rigel>
In-Reply-To: <20250714013813.GA12284@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Jul 2025 10:26:44 +0200
X-Gm-Features: Ac12FXxUY_OHqWeT-LEYjNq-JhVtr5AVNAES-8xycaxtO2gXxWorpIyfgab_aOs
Message-ID: <CAMRc=MeH=BB7QTOa5FoANLPS-BLutT87+E_guVjsWRvpEgDTnA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Kent Gibson <warthog618@gmail.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 3:38=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sun, Jul 13, 2025 at 10:48:03AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jul 4, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > >
> > > Following our discussion[1], here's a proposal for extending the sysf=
s
> > > interface with attributes not referring to GPIO lines by their global
> > > numbers in a backward compatible way.
> > >
> > > Long story short: there is now a new class device for each GPIO chip.
> > > It's called chipX where X is the ID of the device as per the driver
> > > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > > base. Each new chip class device has a pair of export/unexport
> > > attributes which work similarly to the global ones under /sys/class/g=
pio
> > > but take hardware offsets within the chip as input, instead of the
> > > global numbers. Finally, each exported line appears at the same time =
as
> > > the global /sys/class/gpio/gpioABC as well as per-chip
> > > /sys/class/gpio/chipX/gpioY sysfs group except that the latter only
> > > implements a minimal subset of the functionality of the former, namel=
y:
> > > only the 'direction' and 'value' attributes and it doesn't support ev=
ent
> > > polling.
> > >
> > > The series contains the implementation of a parallel GPIO chip entry =
not
> > > containing the base GPIO number in the name and the corresponding sys=
fs
> > > attribute group for each exported line that lives under the new chip
> > > class device as well as a way to allow to compile out the legacy part=
s
> > > leaving only the new elements of the sysfs ABI.
> > >
> > > This series passes the compatibility tests I wrote while working on t=
he
> > > user-space compatibility layer for sysfs[2].
> > >
> > > [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjFo=
ru4iKQ5npwXk6GXA@mail.gmail.com/
> > > [2] https://github.com/brgl/gpio-sysfs-compat-tests
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > Alright, so what are we doing about this? Should I queue these patches
> > for v6.17? Kent, any additional comments?
>
> Nothing beyond what I've already said.
>
> Cheers,
> Kent.

Ok, let's queue them up for v6.17 then.

Bart

