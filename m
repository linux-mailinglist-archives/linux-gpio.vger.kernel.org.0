Return-Path: <linux-gpio+bounces-5408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE918A2C52
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15461F23678
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455AD537F0;
	Fri, 12 Apr 2024 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpbUm07S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AEB548E0
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712917713; cv=none; b=OiiDMwEY4A4kk4gTMplhXVr6g+tkx4jzF4RQ/IID4gQ6yKGFe7OLYkcNjWVhABctsvK4QhpYgHWSXmtOZzKNU6RBX2/Nz3C0eeyX83lZGWoH+hBPLCJpmIw6ouq8dqDoJFzO/nHMBM+xP3kRv1BmpUh5dLk+a45s2vIzl6T1ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712917713; c=relaxed/simple;
	bh=eLTgpMLLk88+QMporuNHqvJUIoJTUhWc0odbIhAvwcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSqL0l0rF0tHN3P9T9mWs6+qPWlErWi5hOwKmiwaMO5Nf/VBuchvumpwfsIGDOvlNTog552+lNeyCwzP4b1WUjGoQVTolcMjlO2J0zcx1s9MJw7i6OB3DgS4EYH55lA6iOh3NhOaiC/yvE+P8plWVlhM/tQrWXcrrDZHS9R+eRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpbUm07S; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so815623276.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712917710; x=1713522510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLTgpMLLk88+QMporuNHqvJUIoJTUhWc0odbIhAvwcM=;
        b=mpbUm07SJGdXs0meD6z1g0TcjWv25RkUY0vZF3+25LLs9TkTTexu8WxHlcipO2rv0U
         qDsyGYsr5s9Nq7NRa0fyobD3Ih9JSeoca50gqLkk4TgSF1joEltrjz519AOkmvdrRjwd
         dNkNWCPxBGbNZ/Y10WbQBparW3t4NSsOmX66fZp8+66Degy8AzWW03TmH7+6v7VBWnHh
         ma34sN7LEJ9jyzGX0YasA7Y3WNhjKeBEXQaD3FpydVwhOFHUS0BXOMCu5aNgVBuAFyZ9
         E1weOagpZQ0cg0hN3k34LBaxOFNEU671W0A/eVkOqmcbNds3TPgqZBD+/feKLfijtU+j
         eu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712917710; x=1713522510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLTgpMLLk88+QMporuNHqvJUIoJTUhWc0odbIhAvwcM=;
        b=e1xQX3ExnMd/ejqNY1NBLs5dRtouzsTLaSdSBY0Vllw8Pk2PzHcd0saD1bLEUvtSUg
         uwUbkAI9iD8KSeoX+7GEbLbewqB97XCtU0iQi8wS64EvxHhw5p1VGgz+a4EA8MpgT3CA
         hCbJc4CUlJ7KadW3d4CENchYbuETjD2zlA0PvssJ37DxBCUF6I9xrwayyWI+7qEL1HVw
         gzn3acx2kLrfTBvfV9597rTNIoA5Hygm3uPyHJ+CwPztyBDA10oRuMCg7OGCNNr1G0QD
         1cpkRCEwBOfB5lHOLRKzSFb6PkqZkXh+L7IYtOE2YBKzJwR+pgkuyQEAabuZXj9iQ1l+
         9DHg==
X-Forwarded-Encrypted: i=1; AJvYcCWikX/le4B42MIZ51x2/w/b1AWfTg5JL8A63cbWdGoxQMYEixBY8eFkn4sdtxw2QxiTEk85ZwKPp63yjoyBQE8m2GXkbSwXqXfe8w==
X-Gm-Message-State: AOJu0Yw9hN6GPw5Fru5etA9vPx7aS98ZPEh/RptxfukYd/NLVujtWHxv
	CW8VmN885q6TlLGec2LIMCmT3grKPbjIVOix5q5LMKff1/lon2LUowCZAr/Nw1KTRc4nOUsVU7E
	1VHL7R8cxDWl3tFOUEgBfku+WNbSVgy47W5Zylg==
X-Google-Smtp-Source: AGHT+IHPZw4JI1weB5+Ueqw+or5cIs3gBZYlkfLh4xNn2Aly++Ufb8+7mPl2iiIIx1tpNTRhIXA81+uSZdB4VQ/U8mM=
X-Received: by 2002:a25:ba45:0:b0:dd0:1276:c2d1 with SMTP id
 z5-20020a25ba45000000b00dd01276c2d1mr1826758ybj.35.1712917710171; Fri, 12 Apr
 2024 03:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410064156.1199493-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240410064156.1199493-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 12:28:18 +0200
Message-ID: <CACRpkda-JN0TA3A19hWzB=Bx6pcyLmTDxvqOwo8eveJFGcwrOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: pcie-idio-24: Use -ENOTSUPP consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: William Breathitt Gray <william.gray@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 8:41=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> The GPIO library expects the drivers to return -ENOTSUPP in some cases
> and not using analogue POSIX code. Make the driver to follow this.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

