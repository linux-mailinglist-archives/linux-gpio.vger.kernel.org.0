Return-Path: <linux-gpio+bounces-25617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA82B4465F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E75563D70
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88289272E72;
	Thu,  4 Sep 2025 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HYPoE5sW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEE25B1D2
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014100; cv=none; b=oNWLquuNdUMvv2sFUXXXz9xgFEG6eVsecjo6kS2KNjl7GQbh+wI2bpQBHMhHV731UAS73/8I9HDN3BikvrhtI0xTNxLnEi99DfxFwG34uXSCGLY8y27KT2sUYbPNbWqzL2nwUs1Dh6445VFymYtaV3k77/gQzMYi2/KJuUPIHKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014100; c=relaxed/simple;
	bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfbdK+cF14kg6XNMMzCCgrzplrMqzWATmHnmNjdG3XBgD0KpzKJAN8VgePrLAdmXsuK3yFfXdFN1Cc+G9wXUyBI48XkghSNBUUB/0517LUFQQ09gfpHHmfjnBahKtj8AjV34efO7aalejhJ9DiDlKeCpN4uYlwadh84murEE7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HYPoE5sW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3381df3b950so3103991fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014094; x=1757618894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=;
        b=HYPoE5sWz3tO8VwRYECtJrDKpckN0NPclo/BK7PYa8U9XW9zMbqE9edDoiMTKjRHa4
         YqdGd81+6ZMuUU/wqTr7O4awI20rYpd96unYO/VTWjzqoEtH02M9X5zL1G3TvYfnv+11
         mCTa88AzhocgY7I92tY9gIG4UmVtwDH/1B8RO2iB6xgLxYTN2j0eK2Ji6uMNQUIV/Ldm
         P586Xi/IolD+XAXUHgGPrsmBKgrqwC0oQgIBEYmfstxPSFE6iy7HDfV2pPg2hLuMLbB3
         gTJChImDeHyYJwF4VZ4fJf6hE5k0ob3rYHLcZYMQT27a08WtBiov4wQpEfK7VTQ7SWvo
         OB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014094; x=1757618894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wWeqZDwihsnWU5fR8qAMJR8kBNuhg+2Et/0lB5o0RQ=;
        b=IJEdmZhiBtmZK9fR8TXGjZ01rSJxt32WALs6Y3NH1cvid1ANz+ZuGuXHQtsnL6hbnY
         40K0r5HEGPc8mV30ns66mOkCxzhSWbgijh5XVJQOFKCP7PWPErwXwoKoQ3hwKDT+fBc0
         +JcAhwiL8Yy4XHbxnyD2xKgJyXgKBDiMyAT0ytk951L98y68UfVmvwszaMLtZjtCsIIc
         2MA3MC4vz+BSMaCeyVARtvEYVyVvrvhrS3YmOR1ArWUwJi+7AWWW6SScapW/gsqNrltB
         hUnQCSP2rg/ccEZKDOkrXas5A3dodIs1aClYCsboJvEMOp6sHdLLvZnmhcMwnhQbPHA6
         PugA==
X-Forwarded-Encrypted: i=1; AJvYcCW2YZJEYW3Qm/U14bRV6JWJlBDMe5NK+xj9rdwaMyiBvvjwPWk/HkuMsSEFmBtUzvH1D6LpDy1z5uFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6N5G/pste0Cc+ss5zR7YREATeXqrWcdjugz+1FVFX0aim5+sE
	tVtW0jXWFe15vyFW0bdpXrhM55oq2AYSqK3kCrfpNlYAuOVhdumYM5zH13D323VEUVDJ6myBjvM
	JtgTpENY0oZY04V2h3wvujRe87jvdqTp+r8BcSVB+aw==
X-Gm-Gg: ASbGncuQY9MMSxnlw7Sn0vcYQ3ujghP3pGmWQ9ABxOYAaxJ3abUeMaR2cY9IsocKKFt
	gP3xEH1HSwSNYCVjc45bOft0DMs0HUqXoocdytpVqev1eWeBZUCy2yc5vjV/I+6AiABFdG1Gl+f
	maAFcpYEl/IBVn8fkWBjTAMa6Fvz4ecOhb7U3713kOm09Af0WZykFYsAA0hLQPHto0GHC2/JOuE
	7OD02vp/he0dC4rvA==
X-Google-Smtp-Source: AGHT+IGZAJ8b0YkPbJI6nwB9uPLeNgs9zpFxiiAnMFlzG1hMkafUbWpHwREF8HCDungZg0gtUMcuWAk+xx/lpSPuMFA=
X-Received: by 2002:a05:651c:199e:b0:337:e4a0:ccf9 with SMTP id
 38308e7fff4ca-337e4a0cedcmr45750021fa.6.1757014094390; Thu, 04 Sep 2025
 12:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:28:02 +0200
X-Gm-Features: Ac12FXxWk1sRNmIPIFT74qDA0maXJ9q1kB4ftn-8phhL0UCY2e53FJ6aUC-84vY
Message-ID: <CACRpkdbJ--fMu-io2ryGu3QBY4EuiR6Eya4Wvor4-wb8QZrimQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 3
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 10:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All of these look completely fine to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

