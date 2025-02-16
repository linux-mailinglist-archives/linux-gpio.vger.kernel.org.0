Return-Path: <linux-gpio+bounces-16092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCDA37549
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 16:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145BD3AAF7C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E655F193429;
	Sun, 16 Feb 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYi0VXNU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B408C8E0
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 15:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739721433; cv=none; b=JIClX7fX7yyl+AQY8KlEExzkkSh6rl2+QxKKSeTDQtC3Zh1uWd5pX6PQ9kHQgc/N2kgldxg66Z57C4wUOzpZXbf25bi8TZaYV0u7PKFfUKcJjWrOVgz0KbZ4FxxX9Qsv603lZxK52sXrVSwuw+EuezKtP0uCuJkdDkNPQKcZOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739721433; c=relaxed/simple;
	bh=PQOSe48l5H3052IuhYqloS2l0/kiRrTSYlXbYZPCLi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIa01im2oJ89Mda50WIcbOZ49QxslGagXyn66LLUJZFclp0MTsVDSnYP/EVHdx/ldzljvH+tp8HkQnQUb5wfcxHafMdYqxJAER3jFIyKpb5P7aY45WFSZ2SCXlfnPxDStT+Cwu6IIceJClop4QC7otUQRFNYh9wlguhCbjCmKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYi0VXNU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so34417191fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 07:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739721430; x=1740326230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uON2OJ+BM51lgivoMfk6BEzdZTXpCqG8oP8y5MgbvY=;
        b=mYi0VXNUUT2yyERqo2ievXsdOyEkcZrUi3oZQuaoYptbaNk8kz0G4ot940sLMub6It
         tkqzXGoxyKo+7cyB15sF2PzuXFnVpAKBCynur2a8wrMS8SPsS9Na3z5D6T36iPApT5Aw
         ud6xW+cQPpDdJV3ApZWbZzhVL+xQuTemlZvzc0FC9qfEU0Oqu9Au5FwoGITOnQnKSunZ
         ZN1qyT/edQcbK+AQh4BdVQIHSWf2gVvCkD85VMzAQJ+OZkAQZnAai7MUZAJfeuRIKXjN
         IoPlC+v1IZKpQ1gsY+al4yXUhxUKWcnEdV/F4XPUf1ltg08uyxEwdrT102LbfH7l+rr1
         Sazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739721430; x=1740326230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uON2OJ+BM51lgivoMfk6BEzdZTXpCqG8oP8y5MgbvY=;
        b=SXdbhUntObqtpTzH1JuiGJGedxgYg7lboNAW7zq9yMODhrezA2Ox+BRDDJExATWwyZ
         pzwpI33PDC2kZUfKwcjYpnIfhcUeaSRGPLGjt9gRFM7t3ydL03a7g1VydwYUkcC2JQ2e
         RDG4z07j7GPth0T6t1bwULngCyqILR9mn8eR+DlUraKGlQmk+9NmwSczsLeh5+rn85Hh
         m1s0f1OYSd4fxOxkO2V/V/W/XUvZCr09gEWkRZRrUyw0cCeBdd+k/anh0Vw8Ohj/Tlr6
         SnrWikeX/8OuKZFqKejSkVg56RwTXT0iB8KOoB6x9VFeE7dUGpWUfa+6BuiAnlpBkY5D
         aqtw==
X-Gm-Message-State: AOJu0YwMv1qNR43npgg6M3XzmGpzc2RmqT9QtZClFD8yByMmX3WaDfIh
	5YS7sqEisr40QXhKPSPta0qhK7t6oMOJdzek0asdu4ViMu/p7Omfn7S2DdTmXx7RbFIU5k3DLGs
	AGdxo7gMsbl5IVlm1LCyA+/lH4oncrPTpZuT6Hg==
X-Gm-Gg: ASbGncsCKiMeabupMVePWsAzjGiKzz8J58yLj862LJtS3PghHYCZ4rFFWd+GOAbAldS
	1ZT1QScmUvJ3ErPn6jo+vZ8ROWe2kV6n8h6IfomikrLSkFTOJmmFURIi6h4jms6dBt/qRnlzFZX
	Aj/SnyFyEHu8aOokn7q97YkOtekz0V
X-Google-Smtp-Source: AGHT+IFnLYCD9csXnL9Y/rkrv113y+IUlVb8uCQiU0GVnVKQINrFh9e8xERSxJoDVXjG8qI9A/OMS6PHaDmzWreXz9Y=
X-Received: by 2002:a2e:9209:0:b0:308:eb34:101f with SMTP id
 38308e7fff4ca-30927a59cfbmr15214491fa.8.1739721430120; Sun, 16 Feb 2025
 07:57:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250216125816.14430-1-koichiro.den@canonical.com>
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 16 Feb 2025 16:56:59 +0100
X-Gm-Features: AWEUYZml4BGUjHbzJW87WYTjgi7p1q0pUmUHCj6hJQULWzvmzQJKgFqCjeyjVlc
Message-ID: <CAMRc=Mef-cg_xt_+mEAyxY_9RfK4=qWEbt_GebeT2mu_8GWVxw@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 1:58=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> This patch series introduces a configfs-based interface to gpio-aggregato=
r
> to address limitations in the existing 'new_device' interface.
>
> The existing 'new_device' interface has several limitations:
>
>   Issue#1. No way to determine when GPIO aggregator creation is complete.
>   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
>   Issue#3. No way to trace a GPIO line of an aggregator back to its
>            corresponding physical device.
>   Issue#4. The 'new_device' echo does not indicate which virtual
>            gpiochip<N> was created.
>   Issue#5. No way to assign names to GPIO lines exported through an
>            aggregator.
>
> Although Issue#1 to #3 could technically be resolved easily without
> configfs, using configfs offers a streamlined, modern, and extensible
> approach, especially since gpio-sim and gpio-virtuser already utilize
> configfs.
>
> This v3 patch series includes 13 patches:
>
>   Patch#1-7: Prepare for Patch#8
>              * #1: Prepare for the following patches.
>              * #2: Fix an issue that was spotted during v3 preparation.
>              * #3: Add gpio-pseudo.[ch] to reduce code duplications.
>              * #4: Update gpio-sim to use gpio-pseudo.[ch].
>              * #5: Update gpio-virtuser to use gpio-pseudo.[ch].
>              * #6: Update gpio-aggregator to use gpio-pseudo.[ch].
>              * #7: Add aggr_alloc() to reduce code duplication.

Please don't ram this new functionality into an unrelated series.
Split it into the gpio-pseudo code, factoring out common parts and
converting existing drivers, then send the aggregator series saying it
depends on the former. Otherwise it gets way too complex to review.

Bartosz

