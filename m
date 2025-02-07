Return-Path: <linux-gpio+bounces-15568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA7A2CD55
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E2516711A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 19:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3053619CCEC;
	Fri,  7 Feb 2025 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="syBEdqOT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C519992C
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958220; cv=none; b=jYIO3T7dEVbkw7NJzk6SYLt9U/4cSc9Wdac447GtgP5bGWdkmWtiPChiwStWxIHdp7wBxEZxxZ/uxXYh1MHbYbbPziRhbtWSsTT7OXIeYsaLKvhDtlIUTGvPOSNeORYiMAANBQFhZUDR4cEQuTa37YZhf8Rf2HaQcdQeOOejvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958220; c=relaxed/simple;
	bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgVvYYZWLP2Axly4TKxbSJd+Y6CiTE5ce+xkI/xbJu5g5cZ6kaaczbMHFD3XLDkslaztWThgRp7dUkV/SjTbKw2Iy4vwQwnyV7rIFSyvpmBUc8lQYsKgrrpow4JjiCuIiRJuSGEMfNx3XPeZDu5MkRQ9mmhdBdbEmwjiowkGFS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=syBEdqOT; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a59so26503481fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738958216; x=1739563016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
        b=syBEdqOTadXkZfHYjUXyDF3/b63gua7a9RgUgXbVet1Tuj+KAyuKzrSj1TswCxG4zL
         ja16qKJ51px5SoCQIZs0NgyVWrP925ZkX1xYILlxbCzOhD7/QHaLHxuO4f7R5p+QQdgP
         P1eQrXeMR+ROJIPYFW7yuQ3sAZv/M6Td0zCRhhoP5ay0rk8DhmmbZ7cF3imPFEE79Ad2
         MA4ovYu/oxScgB8/r+XdW1V4nkTdGkEynhqmw6oMey6FAy0b4f1/dG9ba50MzFTDiXv0
         ihQEBQOSPs/jfUtwsyL6zIp3qlqORO8n5YNShZ55GMrIaW5hhd2VW305a7Bp7M5as6c7
         umYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958216; x=1739563016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79LQgR3k/Btr24QSq/kePaUzIL0o36tX30EbGhUwh5w=;
        b=FbvnJRv2dmL/QunxqBZxlyQqcn36X0pHydg/Z9UrS4XazYmZfnJO26cT7Wzv8wAHUB
         kv16HdwtBBeh0zvorTfJQ32OCU1NdqvZJpySo5dmWbN5YZnnBn8AnFMr2I/3bY4wtJOG
         5XIUNsnwSMVlqHMGmKPjNW2+dttVQQLv75jlBXTOgyaPeJkrZq2fj/AdIAqGCWFop0d9
         U/jQEsJXsWO++GcSg8Mm2mB+ZD52KASS2zxBZ2KsqOZiRVNuK/xzLjny88o7BKta6yJy
         kOJ4f1Yn6SBm+vW6HtvBddFiptTzU2iGWt9935g1ioR5LGDKcsYDPpJmw2eCUzgq2EfH
         2xRQ==
X-Gm-Message-State: AOJu0YzLu+YjGudOhPzkliMVHKu4oHW+octn7RTjxa872I0QbBDZW2fQ
	mdrSX5VlZuSDYiHZHve2c3bguFdQ8iL+dQ/qyd+4Hq/B8m9pIueOc0oqOehXeovosSz3IWcakqX
	DTIugjlnJ/dab6bk6bVpI6YSLcASaiJjGaq8QPA==
X-Gm-Gg: ASbGnctdSV3jSAA2VY3PV8cH2B82qJHGTO0xQqjIAQT1ukm0MiFEnjhC6eZ7coklqkA
	yXSNkS80ZKxa4ZF7Z2EXVHpYmKyrrLTesg4sarobuI4LPA3dcXS+TQcx5f8TbhmXlP4N7gRQNsm
	GH7JCIInIjZCINUuahGMPvl1SPCHQ=
X-Google-Smtp-Source: AGHT+IGcldAttxlLtJk4Fmc6rBnfR3YDGT0u2J7Iom+k4vjkPDF1Uo8mr4HUXBeyLSkHxMEFExi1YbQDREIHsVDAdKk=
X-Received: by 2002:a2e:bea0:0:b0:302:1de7:ef3c with SMTP id
 38308e7fff4ca-307e5a84a4bmr12434941fa.31.1738958215983; Fri, 07 Feb 2025
 11:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
 <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com> <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
In-Reply-To: <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 20:56:45 +0100
X-Gm-Features: AWEUYZmXWJ_lbK-g8mszuq861gNNZ5AaVN8r5wA7kPpaIp5zjgxpgUc3nebktXg
Message-ID: <CAMRc=MeTgjHYCmZcDhvZGKCaKyHhxUU=3EF6OvsLW-H-Dv+Y6Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] gpio: 74x164: Utilise temporary variable for
 struct device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 07, 2025 at 05:17:14PM +0200, Andy Shevchenko wrote:
> > We have a temporary variable to keep a pointer to struct device.
> > Utilise it where it makes sense.
>
> Urgh, this seems incomplete...
> There are more lines to convert, however they do not affect =C4=85 statis=
tics.
>
> Tell me if I need to send full v3 or just this patch.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

No worries, I may fix it when applying.

I'll still give this series a few more days on the list.

Bart

