Return-Path: <linux-gpio+bounces-8295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861E9375B9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 11:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0131C21220
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 09:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8C578291;
	Fri, 19 Jul 2024 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zWvYkptf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87845F876
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381618; cv=none; b=G8K+l8IQj/zVDDtT8jNgk4bkJnh2vjctnrIvFRJIE8zS62x5v+dml1gi1cPl6QBg06KrPIwPRhZOPMe9aynWrbQjVtNOc2mI/mMePINvdvFao5qBDSLwaSVg0Mfx4JFEPbYCLgNZyKYke0Xjjov6Thap2E+5YocgpUYkLPqXmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381618; c=relaxed/simple;
	bh=fmBwmdEFK/ZhjCn7imf45PjN0JhL1Geo2gKFf8SgFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUXImVEs3Qs4YLEZh7XN5f8RrIB7yha5grK0117VlSj+sGVSz8uDdolwE3EW26w6IERY2OfKYF38pVNmnzVGOlXnm+HY0ch1fl6qzVVyuouCaWxISKXj5cnQG35otTOOjlpS0FGI86v2vBm9YYoE7euYtDJOxpnC56QGy5VzwuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zWvYkptf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeec60a324so25807161fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721381614; x=1721986414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjGBbCTIc2tjcoLSaEMzrNmaKQ11GjIwF71M6gs1Kkc=;
        b=zWvYkptfPC9D1E0IGn0iYbSF7aQph58fg0PK92bUr6b2CliaNYvx2mlF1eVnEzBXhQ
         uD0G/KMMm8ntO+cmXJX7tF+WMEORYYwYQZCSPRKZz5rFtAYPpwMMutPj2Henobf83I47
         zyL0JNRuRrrZ/vIbhB0ZifrWG9NU5T/vKxwJ2s86GwfsKjhTP/MuN3UPvamBUZfvr+NY
         RwyFizeq/8iqzTZ69mBlJEw+gS66BA0hrvj63dfIzLRiW9UtBIi4FpjoaQFPAWtzJC1g
         uazIQlG8whE3GGHkMnJuQWopBwtQlFWT2GHfuyRQCivwTejrdHT+O6V8jnYKf4YmkSCC
         gn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381614; x=1721986414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjGBbCTIc2tjcoLSaEMzrNmaKQ11GjIwF71M6gs1Kkc=;
        b=LL3gxls5Exj5OmNOvH8PHB8rZBDN6PH0c71ikRu4IoecB1JMs5XtGazJ/QGeOQuoie
         3F9U7maErESgBp5YEKY0BJNrhH8OJMliZu4R4IS2ZunhIfi11LHy472unQBNdS7SbFjm
         PT5R3IwigitpLarW7ShEbf/I5+fwgMS0hVdgmninIHiv56Tl7ClZ+BDZLBdIW9foxJyF
         xvtoDWQdYp6IcMpLggpe2URP5WIlzN3zY0U5XbmVBjokvmJS2Ssbc2wBcDiiXqorNPj6
         ScnD6JjiDLafZNxlA6CEU5Wy6f/RWa7rMpNin5RWe6FFEKrppUbNFBTV0YduXmwq17u7
         l8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5P9di44iPGayNW0mREnuELYkiXhy6g3XwjVcFMxu/eyw2cevigTCU3djH+7b0CZVmnFCBQx19ZA886njdru2niXY1XwQOVyIZFw==
X-Gm-Message-State: AOJu0YzAa9w8GhRz1GOKpr6GhBrkV1LfQJvSjTZ+WdrsjoLOPpJOV5bb
	y48yzlkZbi3AvV76rk8lkE6GVMQ23v07RwbdAZqa4tLk8AnEfDx8Dh5i6Sr8z9DfuN1LPSJ8Km4
	GAAEwXRSgy56mOU3MGC05H768NaCdwlQQN8CkBg==
X-Google-Smtp-Source: AGHT+IEVJlksg3wxbTsGoI1DEwpomAjFcyzj462fFT2RJg9MIxvSaxY9hX7/i8qMDvjBvwETZQNwsh8eVTRY9nGAypM=
X-Received: by 2002:a2e:9a87:0:b0:2ee:8566:32cb with SMTP id
 38308e7fff4ca-2ef05c73758mr37015821fa.16.1721381613741; Fri, 19 Jul 2024
 02:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721039339.git.ikerpedrosam@gmail.com>
In-Reply-To: <cover.1721039339.git.ikerpedrosam@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 19 Jul 2024 11:33:22 +0200
Message-ID: <CAMRc=Mca9hkN4pNRRJwvM2iYjyevSoq6nvt1TTmzbBF4qCiA5w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/4] Fix issues detected by static analyzer
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: ipedrosa@redhat.com, javierm@redhat.com, perobins@redhat.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 1:37=E2=80=AFPM Iker Pedrosa <ikerpedrosam@gmail.co=
m> wrote:
>
> This patch series contain a set of fixes for several issues detected by a
> static analyzer tool. They are related to wrong pointers management and
> string termination.
>

What is the static analyzer you used for this?

Bart

> Iker Pedrosa (4):
>   bindings: python: gpiod: avoid use after free
>   lib: line-info strings termination
>   lib: chip-info strings termination
>   tools: free to avoid leak
>
>  bindings/python/gpiod/ext/chip.c | 6 ++++--
>  lib/chip-info.c                  | 9 ++++++---
>  lib/line-info.c                  | 6 ++++--
>  tools/gpioinfo.c                 | 4 +++-
>  4 files changed, 17 insertions(+), 8 deletions(-)
>
> --
> 2.45.2
>

