Return-Path: <linux-gpio+bounces-2823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2C84464C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 18:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76495B21F96
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 17:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5C412DD92;
	Wed, 31 Jan 2024 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFRoN59Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D812C520
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722717; cv=none; b=sHcHnM6vNKeXo0KQ4elRps2HEVWW/uXO0o3MA1LS5baXzbuBzPmfNPIOAmhNiCcCi3dnQeVGx/2OgERCRfLnMhUq9pGxcqd66KuORJ+NdDKDRu2BFuNT1UulwY0cT6RgC14NJX0iL7iGiNicBTy8Qmy+ok//8luwmF7LsitcqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722717; c=relaxed/simple;
	bh=kgoXMLxLfwuR5CCSM+KrYwgsofMw5vUJyI7U1yTxFyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYl6vcmXZcNBLKhnUZ9f3td7Iu4402ksIQbx9Opg+FHHqbtYVppyOFuN6PVvbCse1GyopdlcOR7/CO3OWFqPD+TvVInoYmpX/B9nmfo4mz/u1VXV0Pg/Xt86vPmfDWA0jm4jMw4MCXxwiz/bBVVd+icf4ltICgOxo+Hbz12V4Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFRoN59Q; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6040d0c9cf1so141807b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706722715; x=1707327515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgoXMLxLfwuR5CCSM+KrYwgsofMw5vUJyI7U1yTxFyc=;
        b=kFRoN59QsJDZNdR+UQBR6WZSrUV+QNbwjXgbYXdBRrQRA0R5U561njt7f0X4LbBH/H
         HOkIJ1hPlyiK5ZCjcxlbM/ulkX2CL8I7zXUjLyyAp8ySNb4/vmAiCHHtM6iB8OLJWbYB
         cGXuagd/m7Y9lLyM9P8iyg54whA/HXMksclsY46elCBBiHnWpxTQlOW4xmVUxSf0II+s
         1PWrZ6zO5jFfprou0jwprtI1/5W9qwMysTO1M9yFV0Bhp29HqpM2wgpk9EfYSoz5uRvm
         9Al9xHrXRtpd0BLz6fg/BWKoMuNGRiXw9IceHEgbt6kaZrXRNgKaRyglmn4oIXMNgWG7
         qDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706722715; x=1707327515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgoXMLxLfwuR5CCSM+KrYwgsofMw5vUJyI7U1yTxFyc=;
        b=eVn9wBPurbDBaH7tUvxJJ5/rIr/ZGftm4kCIxWBTK/TFlRe1GHuLL6zQVCn/dr+eN+
         uEiOIKnftXMLi+Yr0UzXncCQndGSxIQh3gmEKp/Q45c395mtHv7iaqDFAU1FP8wQiOpR
         X7aXw4iCp7fTQSICip+neQIduCfZb0ZAhGG+6OYrzj61E0l5HBLToaLNV1PeynWYbf9M
         MPXpcivvTmNjG2OmJfCqW4EJc1c4tYmS71t4XyVzWnLnbpSmx6wxAQUHLqxToTqHVCfb
         A1N2q0wxTvIHfIE0eYbYH1p3QKcnAjWuOx8s/4A4ee/v26VjIEjzW4+TjUCjEnIU72UN
         HKIQ==
X-Gm-Message-State: AOJu0YxnrdpJv+ek8hM0kAawcQ/T7fDLLfcXUm6snV57KTeWYrFxZy7W
	7erNj1dSfioHcOekU2iVaX2L/1pPNM5hn/KvMiOo2S4fwMRQhGeXBA87gqmxXNPOahKHu3sIrc+
	LOPhceQsZGWT1r8Mz4iekpftLXs5mRj118diBoA==
X-Google-Smtp-Source: AGHT+IFDU69tl3ptim4AchQ0C4tXIvnPMcoBxudC8EBgKMMNWXqjtOuPcrpfIBAEWup3dDd3aXw2ZIoSRZVjmybockQ=
X-Received: by 2002:a0d:d4d2:0:b0:5eb:d94d:4300 with SMTP id
 w201-20020a0dd4d2000000b005ebd94d4300mr2211249ywd.19.1706722715084; Wed, 31
 Jan 2024 09:38:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-3-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-3-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 18:38:23 +0100
Message-ID: <CACRpkdYrBBiW4iv-ctEupfm=9xzy1x0fpxko=m2hDZriY=DeGA@mail.gmail.com>
Subject: Re: [PATCH 02/22] gpio: of: assign and read the hog pointer atomically
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The device nodes representing GPIO hogs cannot be deleted without
> unregistering the GPIO chip so there's no need to serialize their access.
> However we must ensure that users can get the right address so write and
> read it atomically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

So this would give barriers around desc->hog, so we are talking
SMP where the same hogs are added and removed on different
CPUs here I suppose? Seems a bit theoretical but OK.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

