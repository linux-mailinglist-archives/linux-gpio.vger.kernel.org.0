Return-Path: <linux-gpio+bounces-8507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 773659445EF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285F51F22D85
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 07:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25B71586C4;
	Thu,  1 Aug 2024 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0Glb++37"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997219478
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498968; cv=none; b=rzekErp8OEf4GG/7G8Cv2WZ3N8mga+C8CydOul87zYesNAo3c4zbh+5/rdHPmH/QtcAOE1QoHxuCWTjRib9swmUXsV9pUsu7ZejCqT1+KnmO6c2UHo/gZWBLaySdrvyfJoZ5jIvO+K3YAqi+GWJhr7POtHuqHksZWIeew6B10HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498968; c=relaxed/simple;
	bh=Nrm1yk0P33H+69Xko6UNR6FutVy2MArMuS1Yeny0Lo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP+NUWvoqz1RzdAc+O+PuG2eoVJCjPD60f9VU+VtBETy9dMfJeXknWp6uBfE2HG6wJwCe0BQzc5D1Q0E0mdzHbLAmOblVXg0+oJxcOPRfUx7HHEpaTATgxZN1LeMYrONrfa02oTBVOkC4NlQrQsb/EWLNnSN2CcyaL5gEo5UIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0Glb++37; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f008aa351so9658253e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2024 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722498960; x=1723103760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfsajq4pGBqkZH+0h8DOO+qHIzxJjxpPnUcUt/Nduhc=;
        b=0Glb++37TX7qjLkEZ9GiTHg6iNelue5ko86ZvZP3aX8/iO6n8MEz8OvJ2eCCeW22I1
         /DyoxP52LnTx9vxhm3rf7rnWbc1Ha8xTn1tFOyPnIDvpY4hLdxzpM3PsgZ3UGzoyFVMD
         BKyHTxbInyjEDJ2ZiFCRZkPmq9U/zDhHVDNJHcV7+MvCqR81XiDI2JD479ac4h2Z5Srz
         wGWYgvbVz1P/59UzUxdiu3PPRc5OZsm+ZQuPew+Lq0xjgLyHJkh5DIwefwKT1fwt6LyA
         TOV9k4LWyDNKoFxqYQAR//rZwBgfCNBebmHXac0d+NmYdYSQDRs6bVwAenugi2K4VoES
         K4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722498960; x=1723103760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qfsajq4pGBqkZH+0h8DOO+qHIzxJjxpPnUcUt/Nduhc=;
        b=S40KrKrAcW5YdNaQIFBXh0UryJx7P9sl48xrHFQKWkM2g0YcmCXJjuNrwGcfLaMCnd
         nk5TrgUuZZZCbz0Toe0OLDv5Ay4To+HurEodDd4ufURJnZdcr6VTDIR9q0CQAJfO01bf
         rVqU5OT6qFTtawhFoCL1b4XXGIeuwUbPghxoqKBkRCrwcJf450PLNgV4yQYECVMwjvsz
         qsqHidy3Hq/QDCo1SXmjcbnY6WgAqK9BF/ImJb70bN1AdUa9OUXI20gsMTzu6XzmZYjB
         4cKg1nYEzuXK8JNnq70lvjPLafFxLy7wF1PP/4WGVhD7/wYCZytXGoa571Ft8t4FF8HF
         zFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2zN9sMs9DXtbhV3Z17nYzo6ONMAsK9TC4iK8dM15YQn07ORo1wE9yb5jkgfqdPVRhMRTkgxv7nsNb97XI6Ywn4z2YP+qoTSZYzQ==
X-Gm-Message-State: AOJu0YwIq/aEwxwelWUvIfGt3gLQHttqngsVTviveksEP9Ut+zhD7xWO
	VO76miNRb5aTvKv89li8RzmfvX0USgHUak4gP61cGw9qNA16/Yzx0UQbPlGpI6obXdAuAO6BARA
	PntYJrnRKx2m08bWu12MQk4Dy92SWpTe662t8cL3Jxdk/nEu0
X-Google-Smtp-Source: AGHT+IH/2UJj9GcZ55pEI8Sa71oUWnTzemXs+Dlsg7rwz8Rn85h6Cke3YBJJFEg6IGPotJLnRXwoiGIWt3+kAe7JYk4=
X-Received: by 2002:a05:6512:b05:b0:52e:9fd3:f0ca with SMTP id
 2adb3069b0e04-530b61c8b29mr1052110e87.33.1722498959585; Thu, 01 Aug 2024
 00:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731104658.93117-1-brgl@bgdev.pl> <20240801000753.GA10337@rigel>
In-Reply-To: <20240801000753.GA10337@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Aug 2024 09:55:47 +0200
Message-ID: <CAMRc=MfeeQGT3Sw_GAnnnq=Xn0LaqXGYjDjT-7SQa6kmnF1zMA@mail.gmail.com>
Subject: Re: [PATCH libgpiod 1/2] bindings: python: properly pass event clock settings
To: Kent Gibson <warthog618@gmail.com>
Cc: =?UTF-8?Q?Benjamin_Cab=C3=A9?= <kartben@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:08=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> I'm ok with this series, but the gap this identifies in test coverage
> bothers me - are there any other attributes that are not round-trip teste=
d?
> Debounce immediately springs to mind.  Bias?  Drive?  Even active_low?
> Maybe add or extend a test case to excerise those in a separate patch?
>
> Reviewed-by: Kent Gibson <warthog618@gmail.com>

Yeah, it definitely needs doing. I've added it to my TODO list, though
not with the highest priority I admit.

Bart

