Return-Path: <linux-gpio+bounces-22095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C7AE6FCD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE6618905C8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADFD2E7631;
	Tue, 24 Jun 2025 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aki1tteR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163622259F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793908; cv=none; b=AEhuVpamz0xtCa+2O902CZnI2hL5BkmF+rud9VoIwdKjBirNQ49HM/nFSxuyfXR77+9wZdPfKd28GlTrRkJUW2waG2NiaM2HAg0FvAUfrNLTJKyELgKf5JAdD591RiqDZM7dy3afBj1lw8gjWeMbZMXiXym547WgwhMcVefX5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793908; c=relaxed/simple;
	bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHLrZDE3d6mXVNj7Vrsp4Fsbree8SSYo+BjWp1X6o6rz6Xy/rKVGMDwCty1BUkUpk1bsiCh/6hxQj9ddNhNude3Ev84cmNHjjSbMwVq/K+vULGK4QluLFm0WQSRE7LMPX9pEN+udzSoiW8gMknT/A1BtJNM8CgGLg0sUc4pmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aki1tteR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55350d0eedeso955346e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793905; x=1751398705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=aki1tteRXCS+F5x8LBFn8t48QV6TeIWhTzl8CGRqkDZ9AaX+uqHJGOaGAEHgb5EGQU
         K3SVB+IOVEX8gCmQTuNp2U9O5/HE0SvltTb5PP6xUYkkfjCrdFAe3ATvVrZ3BI27sWJc
         yJx+tzSVHz8qpKs3PyPQALkxf4pQvLALyuGQL4ubf4EXsVFjFeewg+bPcnXwUUO7LWH8
         IyhhGdJsNpFJ2/I5x1cw7tar42Qj+dDCqV1YH6XOn+h7OhIsXhraxYoZe/SivoxxPjfI
         eIfaVqxpOO4HVRIJtG4DUN4+1Dd+xte04tPs1Kv68xTtM1LWA5gCgKIplEnoAdefp2Pp
         Pi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793905; x=1751398705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=hIvCJlmIJKgR1DL7tB6BDhMcyT0oafrKFV1F2gpBGcRIRrOIwB70G4GHDvXuvCqupr
         JNOnA1BmTYOfOi0t4GmREMal12CisQ0zE1jDjWmRlIGiIRIGvc7cO2UYf8HGJnWQbWzq
         w6h8EHcGZ/hL5DqbE9gHeMCCB1F87VtU7WMCoiiLaBnhKPBOPpkQF2TvxzQCr9sozSip
         45tgAcz8UkTG+txYLokGiF5vn5Kaemwh2Fe+Hjxxncq9ZsAq9uBO6XaxlWf/o6pqv6bg
         tyR4U3Ws1vfiupnVCA8qW4agZdXle8ZxsSL3NRjB/IQP98ncRTAgJY3VdsA6m4U81Wuj
         0yGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8PJb3D3WEzN5i1LhNU2o34Hui5CXJ3S3187HfymNkkmWytqPLbME21AuiHLklcnnDCEhVw7e3ZIvW@vger.kernel.org
X-Gm-Message-State: AOJu0YyTY5g5zhI80Ps1CmmeVW7A1u/8Yth05Sg/8q7Z+Qr3B+XuPE/k
	dhq/+owZUBCLWojzST/ZTAusQ8x5tRHHc+j8RyWW4sUP8RPVOcjlCp5vmej9b2mjqBz/Cwx74/4
	HoZKYwLVRDGAIc1xYUR9OkespfEYydu14OR0eSiKYLQ==
X-Gm-Gg: ASbGncvnNBb8ViiLp8F6+OXpswTGb//moZoBdbjrV4cv6MkIu6uDkoLkmDdvvaNxAhA
	i2RLXKu4Nrbh4JZxGFb6jAdG1AsVhOgnYdGbnA848koZCjvQsh6s6IJ675yuA/Q2JvvqGQrl1Y3
	zOhlQ+0Ci6k4UEnHeQZJ+sRI3/vKPTVfcgBQ05Texp3H8=
X-Google-Smtp-Source: AGHT+IF8PpIrRaMkAe8YKe+Ia199YgjdboowW+LWa9jRIpq65y+WGtSchVD5OIWSHr98VSpp70vsXSL+42eeml7U0lk=
X-Received: by 2002:a05:6512:124a:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-554fdcfba1fmr47355e87.15.1750793905089; Tue, 24 Jun 2025
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623222004.280928-1-colin.i.king@gmail.com>
In-Reply-To: <20250623222004.280928-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:38:13 +0200
X-Gm-Features: AX0GCFtcDtI8whG-VjAJ07P3Ge7S8tTBWu6b5QMCPPumR2NvUwbFL-CwyFKH6Iw
Message-ID: <CACRpkdb1voqurnhj7TX8h1GPDO9ER_3JyZkDusJ8hz45YzYzHQ@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: eswin: Fix unsigned comparison to less
 than zero issue
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:20=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:

> The u32 variable voltage is being compared to less than zero and
> this can never be true. Fix this by making voltage an int type which
> is the same type as the return from the call to regulator_get_voltage.
>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij

