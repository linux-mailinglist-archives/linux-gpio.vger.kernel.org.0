Return-Path: <linux-gpio+bounces-17253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3AA5694D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 14:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DFAD7AAD7B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FDB21ABA6;
	Fri,  7 Mar 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DMD604B4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EF218AB9
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741355200; cv=none; b=F7s7bal2NPUT1gKJJxME3y8yOiGyqIJE793XktEkVcV2U8IgGpBULDpFbf3FYfjbdDaTxh0Vy5TmRSjgB5CcATYguE4FGYSBOkoed0pe1jQqkjAWXt3N7/xybEEPm7x2ziF/Zb8ovJ/YS+AtIXZVPBKR6GJHGEQvAbrse4Ndx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741355200; c=relaxed/simple;
	bh=Ajl5yz/9HKZfXlHGqdiD19xxNeWVYLkq3LJ7DODmHrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oONllPU1bhLCRyJNxGTUOEJonO5R+PzHw+cBSq+MmRX2MnKvnZZy1ByBTdnT5gYSqOhxjlV5+8Gml8wz4kfoc0oqYr4HrsnkQTxukPJMiE7vx3dWDJNK9uulANYKNTyiCSEcg+KAFwndK/e+lrRk2lNMH+77SsIUjxiGX3CrD38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DMD604B4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54996d30bfbso73075e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Mar 2025 05:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741355197; x=1741959997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajl5yz/9HKZfXlHGqdiD19xxNeWVYLkq3LJ7DODmHrU=;
        b=DMD604B4fbXzD1Wo2WnupxIXIjhzkmP8xTghIQQWhmo90EZcuSk9ZKamSnhtewFpnu
         1m+kBcFogccaSrcp/im2htxyr/WDqEjj0NnR+tEm0fl7cuZaeWJaLeq9/YueXNQRZter
         X3NU5Nu3aHrCCBNJCdhVg50NT+EHFlIpezZ7T8wDfIC1eLPNQ3nbM1fMjWIqGbpv1fRZ
         Qee7Tx5xefQC33pZezQIqVvxfNbdo5Ldw2z6nb/WZyPd/PB3hebnWDdr37FSPaQNMt+m
         XWNdFuwZISQaNsfCG7SFJlNhLPSq7pORBh0URo16JHGtlF3Dkz22/Fu2RxG1Ia42os9V
         1ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355197; x=1741959997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajl5yz/9HKZfXlHGqdiD19xxNeWVYLkq3LJ7DODmHrU=;
        b=d4pj4aNydBAijQzBA/XBI0KK4CfzRKddN2+uJcPtbZtYOO3NZW361ps4Ly/mflrXUf
         peZ+UVqSRAQEeZzA3N6dGCbtnG2M9dn6zF1wJfmWj2xR3pTxN31N6BwLqnAiSpMGDg/g
         BGGhDJJniJRRG4idUJMmLtm56TRCnEaIjEvho1MAv0Zhp5pnvIvuUIjsoleuTGaONwxY
         U5OPvzK5fUTWHdQ7VbKogjsMhvUJisCdMuGbBJxz1dFY5IxOC3/t/0UBAYn/3j5/xQnG
         H3Y2Eck9Q8HGlvX81yvCykqAFyK4iqHu+rb2i5gOmQPIrqK3w5vqVQi2cUaPOqQvYHDz
         TTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPPBq0w8QEoeyzNOB2G7tFotLk+frYBuCKpJhFkemfBSO3wXtwzXfhIfC/TZjrcqZ1e1iD8Lfapec3@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFveIR6TzAbb6bE7AW3DiNW5ZoUqp1bp1spU/vZ/H+LrKAqiC
	2gm0OHv+CGeqaX8NDj3Y+vnnFIHYYPoVJMtNWpcqw6burSIkI8affK9S7NkeTzFk+M5avzwgUUZ
	LlHpvxuui64s3IhiH56n7RHaKFUVPBBTmEC/R9w==
X-Gm-Gg: ASbGncuIp7Ir+GJQgqXo55e7NFbJc0KO7JD7O6F82YcLTx8brIeOlTvPp8q6/mIh269
	IAfebu5JH/rU6fqC4PdH+J/1SHBbo9MH+jkQcRBZcIb4ifU2Yy2cpGgEOvL7Lo1wluvLN2QHDwh
	gWAWKWPg9nT0XfX5odqrrbQqrT6zfJI7Qj02Ef3rd97K+FtadFiWe6ARGg
X-Google-Smtp-Source: AGHT+IGMK8J2Fdw7g+cXg5tysK151M2NSF7Hkehrjd3iBWvSDjUL/heh6bjcQSsvIwkLA6Oc0HqPFi8q7sGz5nh4GlA=
X-Received: by 2002:a05:6512:23a4:b0:545:9ce:7608 with SMTP id
 2adb3069b0e04-549910b7d3bmr1262013e87.50.1741355196646; Fri, 07 Mar 2025
 05:46:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741268122.git.Jonathan.Santos@analog.com> <d055d21a2a1e4e1d64c457d38e3cf6630d4183bc.1741268122.git.Jonathan.Santos@analog.com>
In-Reply-To: <d055d21a2a1e4e1d64c457d38e3cf6630d4183bc.1741268122.git.Jonathan.Santos@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Mar 2025 14:46:25 +0100
X-Gm-Features: AQ5f1JpJ3gRq2Xfa5Nj21IAupyoFyo1b_V79VVEOQLABEY8o2gr7Aj8D3DfetLY
Message-ID: <CAMRc=MfKD4PNfZHz+BdVjUpCcZJ+eSjaNYYQkdVt1a4vo-2yzQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/17] dt-bindings: iio: adc: ad7768-1: Document GPIO controller
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	dlechner@baylibre.com, marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:01=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:
>
> The AD7768-1 ADC exports four bidirectional GPIOs accessible
> via register map.
>
> Document GPIO properties necessary to enable GPIO controller for this
> device.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

