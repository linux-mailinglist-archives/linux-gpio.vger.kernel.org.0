Return-Path: <linux-gpio+bounces-23196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B670DB03049
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 10:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A7A3B8422
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 08:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C6276054;
	Sun, 13 Jul 2025 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AY6/d0kE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF5265630
	for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396499; cv=none; b=CHnzByShFA3JDB4udKdoukTaBTgrZngHbHakWp1+UVNO6lSUyvBU/EflhRAXIdYjJ9g3M8p2I3X135DJOeBDI0eF1gxM6m1kKYdRgAEsrqlxO8G8bDroc/RlHtReDCacpr6sTejP0P1cdmrOtBP0/HGXILSfSttGXDD07Wqnbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396499; c=relaxed/simple;
	bh=4b1RzhGLocyTqgEGos+nou0Ocqh95hmhG4E0aXCsinw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxNYrfk92drR/MGhngRNWax/YdKeC+QvhjyO14yGJlZ9SjHF/ni/g9gx604hst99N4iRkSOfQEsYvqGlzVxNx/beZ2p8SS3MyqACewl4sJQWPNoA7uED7iH8NHaPvD7YMkvov3d08gmua/Gi8bQVPh/EGKbB1L0xidiFcnIsEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AY6/d0kE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so28812641fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396495; x=1753001295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b1RzhGLocyTqgEGos+nou0Ocqh95hmhG4E0aXCsinw=;
        b=AY6/d0kEFQloBrh3Cm8qZkMyoe97p2cj9FwQjAUlQY2aY/w58ROLPNnfb9kX1bAp4a
         i800kJtLMbXaY4QOKQyQJYgP+bX0LBxt8GY2kUfE+YAbZHT9nvJte6+rx/CSlCkQoE3B
         HdlIOCVai7WNW9eX/pmKc9suQlUKzGBY1gL15seqDf1ZTuHEHJ4B2I6/+AMV/CWP4Y/O
         q48sal1g0AZ5O7ipHH/kg7ilw3q/6u5sHExZHZ+r4TbEyoGzvkIajcOc/NtDB8fnCr6Q
         VuGMt9r09yX8I6pP1QAnq/juxhNOLi/HvSW98Gr8LchRuPpvKUqKYGZvpuAAfZJgMN4S
         u1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396495; x=1753001295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4b1RzhGLocyTqgEGos+nou0Ocqh95hmhG4E0aXCsinw=;
        b=u60WwedDpQNjQ2lFeZ70pK74JlqNstYhiQQqZyLaGzluw+bc6lsY0SiyP9rN3gH1HM
         b7/3zI6E3t1MC2/Gop4VNxQ9KFXGYyKw29ucngm6e5G9iz1VOnXeNqtc4mA5RCgtApVx
         snbjlNpCOWJrPpjmwG9YWUMFgIALZK3zuoq2mLm/JIfsGEOV/3GmwTsp7QRTVhv647VX
         x0s58OT26rzp8tkggJN1sMPF/4gE5E7cjwi14qJRh8QsEEVBEzLOmqFJAR+HBYsj+97A
         +7Rrr8ZjLcFOxB9ns1yr2SLic/mTqQTER2wx2mqFAf97NP2IMeP1BcFRWXjI+O+oKV2k
         PskQ==
X-Gm-Message-State: AOJu0YyzOvFjhU9LRbi6/r3lsJhEUIQUvEQSsI4175QHHimUFqUFXttZ
	OGvLfJpkxv+Edw66e7SEOXXoGgb7k4G6aPTSv/jf6xPVz8D8EiaU52wR2QCL3fts5M83Sx1MWHV
	v91vC/mALbgLOACufuu5PCQdk+HW0cl8/dmfALUt7kA==
X-Gm-Gg: ASbGnct1Lx7GMHnV6i9vGx31GcccTF9tjyqFWTfnATOsW1U9m7qQTbsMZBnxiRvsjp6
	6ZTQntoq/wDTA+1cu/uLlBbnJtkj4TaIw/KAroSyO0FHqNookd7ti2x622lyD35z2tvcD/7QzwL
	bCmmyjxRu8Z/9RV1LchBins9cB6XSiTO9xvlE41InGqL96HV2us419sYzLYG03JOJGy9Y8NWtwO
	kHlbOs2X3wyjS/IIFmEDGOYl5S/D9dH27usggk=
X-Google-Smtp-Source: AGHT+IEMQ8qvsT0gD49ppygPji2wl8zH8MMB5P85cSeLdyT6vPgvgA6klNb2G5Uxgqr1+aVCiAF1x3H8jZNhdEI4lwg=
X-Received: by 2002:a2e:8e6b:0:b0:32f:1f1b:1e68 with SMTP id
 38308e7fff4ca-3305335d25fmr17946411fa.18.1752396495454; Sun, 13 Jul 2025
 01:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:48:03 +0200
X-Gm-Features: Ac12FXyOzkUIwK5gHvio0xjvAL6VpwaDhTwgxCU_kNCh0r_CV4jxSET5k5vQkuQ
Message-ID: <CAMRc=Mc7HaVjchDWN_oWUuqgVZbj3ZVYvU-bwiA+ZUH+0gEXSQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
>
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group except that the latter only
> implements a minimal subset of the functionality of the former, namely:
> only the 'direction' and 'value' attributes and it doesn't support event
> polling.
>
> The series contains the implementation of a parallel GPIO chip entry not
> containing the base GPIO number in the name and the corresponding sysfs
> attribute group for each exported line that lives under the new chip
> class device as well as a way to allow to compile out the legacy parts
> leaving only the new elements of the sysfs ABI.
>
> This series passes the compatibility tests I wrote while working on the
> user-space compatibility layer for sysfs[2].
>
> [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu4i=
KQ5npwXk6GXA@mail.gmail.com/
> [2] https://github.com/brgl/gpio-sysfs-compat-tests
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Alright, so what are we doing about this? Should I queue these patches
for v6.17? Kent, any additional comments? Geert, Jan: did you have the
chance to test it?

Bart

