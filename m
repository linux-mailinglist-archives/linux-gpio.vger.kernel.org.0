Return-Path: <linux-gpio+bounces-2400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4D835EAE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 10:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA291F22AF1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393D39FD5;
	Mon, 22 Jan 2024 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V4mrcj1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4739AD6
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705917015; cv=none; b=WWrIffkxmXwQIZs9+bhIsvn1pbveo2oEI0zxwqcbHhc4vL3GTgXCF68/j+OXlc6f6667xtHf7BjdyrZ1iEffShT+7OSh517CSBKulF0KB54FDS55h+8A6DujLwxdoJxMOKGYg5CidFl7LM8PLxLPPMT8SplFmgMmJOAtI+p+aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705917015; c=relaxed/simple;
	bh=ZXlG0hrIQ9hV/XH8uPY9MP151/A3X5mK2x42WSdRHuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eETWyi/JXkzR/u9YCZ7qX8puqClpQoT/pldvoIWn6fUjLbo/JyCmV1m+My9TF1y3s0WrEn+1V9U8XdQCHupJrSezaaEcuwLFQBONMDL6AyAg1dxrtG+z3fWPYhJsZNVqm7fsdmhk+7HopkCKD9Ftep1dR6rjxandL8BcoAS5Lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V4mrcj1d; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4670a58b118so407518137.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705917013; x=1706521813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3NX2zTIiUHCv4VYTn24Y9a1KjUPwQyHtr/3ARaL0OE=;
        b=V4mrcj1duGGbnD8yyCHjqBxawhHlqf0DThEhVTzU4w/qf8+Im4xpK0jFJmeW2r7v0+
         v39OuE2EHWkRU8DAmtdzQrXcmJdDho34bZQ5Oui79CyjTaAMoPencdAM0fGG4m7CdZ+I
         Xg5a5P6BmeW6B3RzVlw0mPHr8bimBIM/T1U9KbgWV2UYrmCAuL37nJxIeEgcKZUrJ+0W
         4v8CrS3VaqdBE0UvKA5CA7/nZvN+TwBJ0h8ebjq0wue2sOs5xojbviThZs39DOQg5mTj
         szzerbrXlf2tYspYS5rW8knto3bTazLP6TVyY1nRo1UwIPKNkvbMBo1m7VcqMws0lx8z
         MWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705917013; x=1706521813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3NX2zTIiUHCv4VYTn24Y9a1KjUPwQyHtr/3ARaL0OE=;
        b=QjJXXGWwkP0w8LqYurLMwYcfxqksqQuZFecKQ7gnUPIEPqbLoaZwBjWJEUYGR9e8tV
         riYdySI4md8Cj6wIpY4mP6ml8/YPGDvkmm7LztgRaW3sPoIk7u/tWjtoBZ9K/KkeNPK+
         i7P1pgQ0eYY3Cv7IO+ueXBVCpWW1RwPNSgQ1a9lSwvhTitKoqa8g3piJ531sOPmi/9Mx
         CHwxfSpEanoumRAvMZ+li4KQSOsQK/1TjFvG58gVWauXz0uMtbMfZVgkcfx9wdZbv1nP
         Tylrn+Tc2YKpIXNieA5hRrYUS3Tcylq6yA9ySNfpErfBFdMrvul32sujGXnRKG7mGgo6
         YYZg==
X-Gm-Message-State: AOJu0YzfK+Jsq7Q0Ery+pW8msG1ZsrnXdMhK3Hoq220ORaRWBpJdF5aN
	3GGG2Qp7s/P/qeF0jpiyTjZmyUWvv8ZAbE0Mb4/5cyiDgDSLe+kjVDlh+8SPcrJdgwUguy2HIUR
	VxI1Y9KQKaTS2R6U22f+15Djaf7vpYsWTmauRlA==
X-Google-Smtp-Source: AGHT+IHpqZg5YhvrFh5zdUl7ZObsv+cwpbu3YnlaZCIpBqJhgApmOJP++5AUaPSc/c0rKJF2M5hCXuolsqSWC7YKpUs=
X-Received: by 2002:a67:fdce:0:b0:467:f13f:79f2 with SMTP id
 l14-20020a67fdce000000b00467f13f79f2mr1484297vsq.13.1705917012766; Mon, 22
 Jan 2024 01:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115004847.22369-1-warthog618@gmail.com>
In-Reply-To: <20240115004847.22369-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 10:50:02 +0100
Message-ID: <CAMRc=MegMkgyBmanxTAvQwcGJ1_doNdqUAhCu-MECePZ=-_KrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Documentation: gpio: add character device
 userspace API documentation
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 1:49=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> My new year's resolution was to improve the documentation of the
> character device API and gpio in general, so here we are.
>
> Wrt the formatting and file breakdown, I've taken inspiration from
> the userspace-api/media documentation.
>
> Patch 1 adds documentation for the current chardev uAPI. I've added
> it to the userspace-api book, as that is the most obvious place a
> reader would look for it, but have also provided links from the
> admin-guide book where the gpio docs currently reside.
>
> I realise MAINTAINERS should be updated with
> Documentation/userspace-api/gpio/, but the split out of GPIO UAPI
> hasn't made it into gpio/for-next yet, so I was unsure of how to
> handle that.
>
> Patch 2 updates the gpio-cdev ABI documentation to reference the
> chardev documentation as well as gpio.h.
>
> Patch 3 updates the sysfs-gpio ABI documentation to reference the
> gpio-cdev ABI that obsoletes it.
>
> Patch 4 relocates the sysfs API doc to stress its deprecation by
> moving it to a new obsolete section, again in userspace-api but
> with a similar section in the admin-guide. The obsolete section
> also serves as a placeholder for subsequent changes.
>
> Patch 5 updates the sysfs API doc to reference the chardev
> documentation rather than gpio.h and make use of reST formatting.
>
> Patch 6 adds documentation for the obsolete v1 version of the
> chardev uAPI.  It is obsolete, but still useful to have, if
> nothing else to help identify the differences between v1 and v2.
>
> Patch 7 capitalizes the title of the admin-guide/gpio to match
> the other subsystems and the userspace-api book.
>
> Patch 8 adds an obsolescence note to the gpio-mockup, as it is
> obsoleted by the gpio-sim.
>
> Patch 9 moves the gpio-mockup doc into the obsolete section.
>
> I've got some minor updates for the kernel doc in gpio.h as well,
> but they make sense on their own so I've sent those separately
> to keep the cross-posting to a minimum.
>
> I realise the only thing less exciting than writing documentation
> is reviewing it, so my apologies and thanks in advance if you
> have the fortitude to attempt such a scintillating endeavour.
>

Not all heroes wear capes. Thanks for doing this Kent!

Queued the series for v6.9.

[snip]

