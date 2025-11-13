Return-Path: <linux-gpio+bounces-28444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B6C5775D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 13:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 79AA834C868
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 12:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6D134FF63;
	Thu, 13 Nov 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k70PRfsx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B534DCDF
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763037604; cv=none; b=eJhgJboT16VA2dOwsqPFlocXEXMK7Rs/1nrcz53AmiZ4zSL1pq2jOkQOPwTGuHSgfsk2GgUb1vrawPN24gjRzd1d1ya9FjDZbaj1HyhsAMcb9Q61pd9gJ7+QtBNpAJEj3KldMqFeA9dm23o9bXkufnm0zIqGdOJD88pKkeX1dNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763037604; c=relaxed/simple;
	bh=+kTwDuwG6rspdkZ99dNoC1BLBNHio/t4Ku94BnnhqRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbxP9o9z3zZx2T2hvnak57QbjMe2mPoFHJpUsb27gHIUfUkbw5sUrbvaxDTvK+j+1cYDnq3to/RsftpBs8OJ4E+5Pmbdmww5CEQzy67jIPG16SpgHk0YZyTu6dVSGYwLGXyHGGeoC+CkvJ46hXrpe0fn4qq1raYSXjzaEQy+vCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k70PRfsx; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5942e61f001so728030e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763037600; x=1763642400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUOrtPsGub1HhpXyzrUpFchIESa38qs85WIyjbHg4K8=;
        b=k70PRfsxSapODP2hSfOJ/F/sCO3uVA5pmXnaBQcvEkzOkrmmaBgIMLdKvCB+GjKFhg
         DHsWqidK96RQgK80hLFLKn8nbDnEnRAr7avhDtWujfGOLfFdfCNodLgos8wYgp+7v1+p
         Aiu/OK5XSqJZyEwCA4xYQ1XazUzGGHwajHC/6EQ1w0E0KzdqLFPSTxZUJogI+93I0xOP
         P4ZugIH4/7WVZZuklJyhwmIbYkYJ+gpGNSmwfIwbcdqiCaPC4E3PhjqkMPgWMWM4v40q
         uS93wPY0UOD90sqXNt/OXYWk3xKuvblwxguwJNUzpCwYTbn7cryMGcJmhsGCo+4WPMeO
         sHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763037600; x=1763642400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUOrtPsGub1HhpXyzrUpFchIESa38qs85WIyjbHg4K8=;
        b=Wk7iclHViZDuN60IKHK3oabu4mQ1XBvvHsmDJzlaIONvF7lT3TNhXmFor8LZI/B8iM
         usDsnaZUGFcZOe84F8Ppym/P0HQngy9Zs8F8cANA+BgqxbGhGtjE7OWm02odEa7W3ZNS
         Xtyy02PqusOR65Trpql0mOV4WtB3tFrlkXKAfh7tPdRJjlOW9pbYvb5wcMx7rdfC1Efk
         r3br2/vmJnR7KGv0r1CANxtwxmhwUk87QDLqoywmtAb0VELVWIDVieYXSeiLTofwAPNl
         ik3z1ICRTlAQW9/NPbzZIZ4Rl2oGkKD2DJlgxKEZVMo5C9uLRfN2LKlxc5vomR0M1N8C
         onQw==
X-Forwarded-Encrypted: i=1; AJvYcCXyYAzLQdYQcWnv2zPDX11mhngH5uqMTlNXMonlK9cqHya619EgvSiJ8TuOTF16zA/TSj0uFEukqhRm@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJWjnLmntptg0OEfUBYK7PNKXsWcoGMZD27+goN6sSQX9TYXA
	lkDEnNr7+rLoTaRbpEaOsWBZphMDr3y1slkQM715PM2qBDy99m4CP4OL++xEQ9nCQmmUSTrbylN
	vqynqFqXBtCqXZhFT/N4hN03MtHTiAyXfCfdx2qAOzw==
X-Gm-Gg: ASbGncvCbKALUAqrljrJERxXYX3bCqRPPUJ/7ZFufaGqrBkxASPNmPL7lNJixXJm9rI
	vCAzul3r2tdpb59/EYBG/ut259Hy85VE2x2LsQtGT+sNwBqpq6nHiRo83tZ0YKQVrmSPdz0Q6IQ
	kwMOirJYKawAFH+tDMXQ12CM4795Iqjoqg4ulac/yEODSzhVLqb+hMHi8zST6DSP3YnrcjwTNQG
	DzTObwicHzfwBXLKmbrp4as3to2/d/NYwa8c0fdytuiWOnrkIhVBDwdQ99PgkArCzpj4aaf9ybw
	I+Ca1d9L4g2FUQ5c
X-Google-Smtp-Source: AGHT+IEwidGHoNOMaYo4htt19dYp1oulw6jtGUPFtCAr2wRYS9NFrgMFss39wedYdFqyQ0XIZvSRls+UzQXDbZ99yYM=
X-Received: by 2002:a05:6512:3b1e:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-59576df8da4mr2157404e87.17.1763037600276; Thu, 13 Nov 2025
 04:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org>
 <e0e81310332cfdc075bf13f66d7be712b42964ed.camel@pengutronix.de>
 <CAMRc=Mfcir56ZizXgZZpt4nQY234PA9jx3CQ24YCVQJFBQ7msA@mail.gmail.com>
 <7aa5a0ce599f86cc29e5075aa4e35155dfcd013e.camel@pengutronix.de> <CAMRc=Me3mOaFpn=xwpDwBzLWjOqS0Gx4rV0E=v_aEg6s_uJyvw@mail.gmail.com>
In-Reply-To: <CAMRc=Me3mOaFpn=xwpDwBzLWjOqS0Gx4rV0E=v_aEg6s_uJyvw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 13:39:47 +0100
X-Gm-Features: AWmQ_blTF4bGHOPBFto4bdAeuDnTVCZ4z2kdDUSFoogNBWSvY3rUo6lXRjR-7mU
Message-ID: <CAMRc=Men0Dc3rokguW-ghsViyMmJzLgvJZtx9ACur5h7U4z_7w@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] reset: rework reset-gpios handling
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 1:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Thu, 13 Nov 2025 11:30:39 +0100, Philipp Zabel <p.zabel@pengutronix.de=
> said:
> > On Mo, 2025-11-10 at 17:57 +0100, Bartosz Golaszewski wrote:
> >> On Mon, Nov 10, 2025 at 10:02=E2=80=AFAM Philipp Zabel <p.zabel@pengut=
ronix.de> wrote:
> >> >
> >> > On Do, 2025-11-06 at 15:32 +0100, Bartosz Golaszewski wrote:
> >> > > NOTE: I've picked up commit e5d527be7e69 ("gpio: swnode: don't use=
 the
> >> > > swnode's name as the key for GPIO lookup") into my fixes branch an=
d will
> >> > > send it upstream by the end of this week. It will be part of v6.18=
-rc5
> >> > > which tag will need to be the base for the future immutable branch
> >> > > created by Philipp.
> >> > >
> >> > > Software node maintainers: if this versions is good to go, can you=
 leave
> >> > > your Acks under patches 1-3 and allow Philipp to take it through t=
he
> >> > > reset tree, provided he creates an immutable branch you can pull f=
rom
> >> > > for v6.19?
> >> >
> >> > Now that -rc5 is out, could I get an Ack to create an immutable bran=
ch
> >> > with this series on top of v6.18-rc5 (and merge it into reset/next)?
> >> >
> >>
> >> Hi Philipp,
> >>
> >> I assume the Reviewed-by tags by Andy and Sakari under patches 1-3
> >> make them good enough to go in?
> >
> > I assumed I also need an Acked-by by Greg or Rafael.
> >
>
> From MAINTAINERS:
>
> SOFTWARE NODES AND DEVICE PROPERTIES
> R:      Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> R:      Daniel Scally <djrscally@gmail.com>
> R:      Heikki Krogerus <heikki.krogerus@linux.intel.com>
> R:      Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Looks like neither Greg nor Rafael are mentioned.
>

Ah but also:

DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
M:      Greg Kroah-Hartman <gregkh@linuxfoundation.org>
M:      "Rafael J. Wysocki" <rafael@kernel.org>
M:      Danilo Krummrich <dakr@kernel.org>

So depending how we look at it. Greg, Rafael, Danilo: can you leave an Ack =
here?

Bartosz

