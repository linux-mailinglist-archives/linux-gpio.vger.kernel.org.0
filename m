Return-Path: <linux-gpio+bounces-19236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A665A9A572
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68AAA1885547
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B57C2080E8;
	Thu, 24 Apr 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LRczqBk7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE7205AB6
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482334; cv=none; b=RnMfqhW7mvem0i3Fzu7WKjlcXVEbH8ZlJrP8Gq1lEJ1pN4rMKqS0s2AkHpqUeMLI7oXQsL4fKY9Cle+Y9okcAkHF9XuKUtI2Eav7p5/K7yuHmqQd6mMwcRGnIfLo6KDQITSTs64VVVH6NKdi95I6xWNcpRfgUpebDt6xMNjMcp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482334; c=relaxed/simple;
	bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PsSLThWO/EubqObLpe6PcbvHUpWlADZ6mzWxZnDgtO7lj39zp+M6GQH0m4J4C5qZuxsCzHAlV7Fd0K7CSFpK8UMP4XVfe9NrRmkco9F0vQh/DaQ27BhTUOwzyoyVyFWFY3rQp3tmhe58vhPSo5XUZZqZI6hIfRIb6xN3CXxIKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LRczqBk7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-317f68d0dffso3409361fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745482330; x=1746087130; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=LRczqBk7+fTEuqOuvf/sG+ueEjruAUrFhaa6WPL49sgTP+bsK0peeL6KsxCSbHVWkZ
         5hs+ARh5sedq/MXm0lAqvdTXTfqrhuiXFXSIpy1wI9XcpQKAfkO/KZHmQGBBqe72IUbX
         HmCjgMsXkWZvrsKBs8wo9k8HNMpFSWLZEcvQiZYy+Sp52l2dil0TjwSwG8KHwSDQVx+2
         HaJVaiOlMux1nfbZSf1xLy7kOe+mXCNc+2C49eYbrPMnSjGV8/5f4OJvu7CvBNwOZq3G
         coWbyXrvP+jB+lz27pn57MeK2cu21jrv1Tb3mmb4+C34APn50xQk0ZoKPVR67utiP3dG
         uILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482330; x=1746087130;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=a+Fq9DscIoMR9UVn6W0oA8lw47TqicStCs9zMY5qNnU2dA+B2UMbPo+NUyjvOsjXOc
         9qom3++gIkkBhrE6RQnvfYL+cG0EaisC2WSonK0OLbY31qRcKgxgFQ4OOnlX0wXH4AVn
         c0k8lopO6uqpVCCDhhx63E4ev0Ut+dx8GiK8R6D+xThQSUGZFv+DGwcb4eKz09H+ftLn
         ifwCryXGgtpo7hq09sUE86uygnwHztg+Vh/JlfDa5bZP8bf+hlZZbwu52bwJElO15j5I
         1UJIW5WSJ005F3dAHNEcobKL3zCHQ4Vf2t2HdbhiNbQ/Vl1L+odyKCZvh8+EAbLQZzpl
         Z5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+v3djXxP0i7J1DDLxTJn5tuHLItRCEhrQ0pjkPyOmALa3O2ZYWyrXkTvIKBrksiVintKSqsz5NhYV@vger.kernel.org
X-Gm-Message-State: AOJu0Yypiypaoj3gzxBUfqLXEPXh0Lu5IIW1D3/dSRaTqL5B3NbbNmjY
	xWJxjnxV0s3zywkqqqfmeOb5PaAdtxW00znjkosv9udTxr41IJvLFYyg4Nqra2BepPkFCOydg0C
	S8iKkhzz9jbYBIfof0g9GwZemucMawnEC8WaQSg==
X-Gm-Gg: ASbGncvHTs0Ty/MxD/CzLTueiVwv2bjp7LmUmNBw8XnUb7aAL3gEJsJS+OgCUQdFOZO
	PmoPtGax+z/mFLaXkxLGaiL5qOgfCH7CsYO09uvVTmGi5oBZCFWG7uBL4mzPwGm5FKW4zX28aq6
	yl7UrVwEb5cFJIKQVXfwmFEyyXvJ1WZg+MMG9SJX+U8q02irDCO4qCIA==
X-Google-Smtp-Source: AGHT+IFbceL7o3clhs2RuiDyAIdchIBr6aL/LMDMKc7zOsM9dZhn008UBHhrWBGXFXtx2+8UxJ4Pdl2ytx5iQJL1TOE=
X-Received: by 2002:a2e:bd15:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-3179facad69mr7495011fa.28.1745482330540; Thu, 24 Apr 2025
 01:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
 <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se> <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
 <aAnyAASQID8SK107@shikoro>
In-Reply-To: <aAnyAASQID8SK107@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:11:58 +0200
X-Gm-Features: ATxdqUGHb7ZpzSc5O8AT5fXNftZF_IaZxwgwcmYklmj1TMA5Isf7jQ0qXPGf3u0
Message-ID: <CAMRc=MfdcH5dugiBLigTtoqAAsqZ_-fKJpJXnrDzQuSbKfw6oA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Wolfram Sang <wsa@the-dreams.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:10=E2=80=AFAM Wolfram Sang <wsa@the-dreams.de> w=
rote:
>
>
> > I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
> > now. Wolfram, Andi: do you want to pick it up or should I take it via
> > the GPIO tree?
>
> If there is no dependency in your tree, then I prefer to pick it myself.
>

No, everything's upstream.

Bartosz

