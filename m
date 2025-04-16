Return-Path: <linux-gpio+bounces-18926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581DA8B419
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2688C3BABE8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C47230278;
	Wed, 16 Apr 2025 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3b1vqnR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D55822FF2E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792877; cv=none; b=hL3MjYzxXmJmxHD4tS1yzQDDq4Trnbf6hePSiHObDCDBRYZbnBvKEm26RGWZK2qd9okWSMRZCx8QY5g+O+BEHxQsHJ9rLljR25z9a7I+y/pZfFlCYMb6257MgS91wI09kwPAcnutrP4pDWou9B7c9QX71dNS63hNc4jKTXl+sHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792877; c=relaxed/simple;
	bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CChh76B+dRLjCbyfp1NNoDjtFIXI1C+lHp2y/kgzKkUghRaEdXnbTEQBcYHYTzPUPFn1JnldzZW18p8rBcWnVgpTIuGC/qbaqq9IqDoKnvH375AgfXHtIzHQkZmpac/2QSxUug6VzzURuU0ix+MXbrIObxwq4nH3Btt+VJC0XQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3b1vqnR; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a070so37889751fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792873; x=1745397673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
        b=z3b1vqnRQW2hkxo+c1smDcVsC7DptsJJ+RMdg9H63IRMOw4sM72mdSk7ppb0vCXMdD
         zZN34g6FRuG5L5zcrAghJBhMZWaXhM/l3MLyaC9A9P0mZsOCMrZkvEbjTCC3K2+H9JIr
         RXTZg9p8p/OP7hZ2SptBLfJ6vpsXa0Yb1Iao4xljt7Xxh2TTm+pn7Hw1DlVA1hpfUTEQ
         dYc8iuZWEV8j+EKO28QmXM+AvEVuwjQYdCMhum77UYLoPsXyL5MM3AeLXe3FSGp4Zz6M
         P5RXL1w47U7wCd7K87QcqkB7wdds8yzvAis1Xh5XzprnZEG45gDaM1s6f8wgvjDNOQXP
         Md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792873; x=1745397673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
        b=RGXjB1AWZVz8Y9tXc9Lrz94mdTWvysB9tnQruyF2LCaZ//oMbUA78DPU5g5IdW2rqZ
         nN8JnZ3AMHG6Kl2U2d7zgNlyTYTDqeUAueZIPArcdnmvXs+3n96K0/4jOkBnjEIYwh4+
         JPovKXWl/P0jBeiF7VsL+MuWkkI6v/TGxT42GNtpFMJ0Z7PYHvpUh+vXKPo/TOAAR4T4
         b56oeYqq1prqfjReyUehYigLeSLBR+fuwjE4JWTSPaYDQ1qVo/YtMDcq+1l2IhRmJyx0
         /Jw8lBCy/0g5tbMi+5UD4vtb/w8QhaekBmN6NujPMjfWsuzPlyUds5y20gvZ3IajmoB5
         Ds6w==
X-Forwarded-Encrypted: i=1; AJvYcCWblXU56h7c9cI129poCCijRRHmH8MmyOxN3hf0+XDU6p6G1cSjUmLE/CYas6tK1UYAeyNGALER7ECA@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUylx+KOQUZsa1nCq1lbkyc94BmI+ecse6jEV+Z3ZGXpcRnHz
	i3gXX+aXZZLNMXx+3TV7+y3HbnhyBfGXIET6wYT+ApmBBrSFwotjv94lepGTit5hjVLvcZ4k7of
	tKxOrMXzKnNXbPwpZAbjAVP7YTGHsvh+TN/3kSgRpS6zogYtYMrQ=
X-Gm-Gg: ASbGncsSgAVw9h9Xt7O1k4WvCBMyqaDv+nGMiF/0Ks9f5tWw9KZrU/7xVCzuBkGR3pO
	b3WZTs/BRQBJ1VrVJyyzh0T5MbrTSmkBYNA8la4MdjhbVdh1kkiQyGpF+Vb3LnjzCOcpvKvomWi
	JaLbeWR8qMrXEs8ZNBeXcHFQ==
X-Google-Smtp-Source: AGHT+IH8mo6xpMWNcNdJIoeRY1eieSGQRWpdljySoJo2oFh+1rfwiEfyJ4W1HXlDeTDoHfIKfBC6KiTuMxrkOiZWAAk=
X-Received: by 2002:a2e:9a10:0:b0:30d:e104:b795 with SMTP id
 38308e7fff4ca-3107f738f76mr3366791fa.39.1744792873359; Wed, 16 Apr 2025
 01:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:41:01 +0200
X-Gm-Features: ATxdqUHW4QWAWi7HIzYahxDVWb0xBJmLw-NFLTCrGCQlxhs2EcqoJMd9xzITsLQ
Message-ID: <CACRpkdb9guK5hUuA+p4_EdwVVhbZPea8y83g1fY4Q+40JvZ7_Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] gpiolib: Revert "Don't WARN on gpiod_put() for
 optional GPIO"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No need to double check the pointer for NULL since gpiod_free()
> is using VALIDATE_DESC_VOID() which simply returns in that case.
>
> This reverts commit 1d7765ba15aca68f3bc52f59434c1c34855bbb54.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Well spotted!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

