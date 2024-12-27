Return-Path: <linux-gpio+bounces-14315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A172F9FD5E7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C14B1885D85
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C17A1F76B3;
	Fri, 27 Dec 2024 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRMdJRDe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390E1F76AB
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316410; cv=none; b=UpY7bO5wSu+ZidkAU+6GwuKpXqMkGrivyfPUZq8iZB+mL03NXwKAxlsLMQbMn4Ziwt4VNhtB8SwZSofnUPwXvqWe2heg8MvUZwWgWFZQPirPvN8FVNsdpJ447ZG6BLrbgyCztq/GYTcUqzFIEHl0QcaBkVnqmDoGUkpZWPELbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316410; c=relaxed/simple;
	bh=aVbJnWxc3HnzjcWyW35ORpkVisHz4yDO0pY2qTzfLWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8jxlkjRSHYwOZEnN+bqXCyOMkhuv5WLigbtOyweKKFNj3qqYW2/3p7VbBHrU80vCKPNwngaHjZkqCYjoydrCyalrojlnh+5cFklUiSI3zIKJnVNbeHDJ8Bk0ghVFbywklbVHwJGwTxNbdo4M/YwQx3rPQS95vCrubnOhq1Lj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRMdJRDe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54021daa6cbso7674481e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316405; x=1735921205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVbJnWxc3HnzjcWyW35ORpkVisHz4yDO0pY2qTzfLWw=;
        b=pRMdJRDeiIYyCba81QAq7KxfMPQaZ9HshLooIWu+UoymoMPTrdKgksqj11POOHOiZ/
         ZOjAyFMn4sLHUQ9iThJbxtV3wjBP7cPTFkWDBRUWHp0v9ZwIvYCdCb/ioI0phg0/Q/NE
         dsZhdGX3IBybf40YHxOs95iwvO4Umm/mI4BFkAUqFMvtlJ+9OHjjY26YJ9/xVVK6CycY
         JrWgwbBF3iadwD2NNWUE6ccmo7o/LDE1VDGyJTeP1IyE5FydbRq7BxsVt59f+IVjA0L1
         NeNTvUJKnl+yTDcxYtbmj5+KGQVaVMGiDi5WXbIiE9malqnPNtdAQTvoT4Pl8K0n/5PT
         XMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316405; x=1735921205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVbJnWxc3HnzjcWyW35ORpkVisHz4yDO0pY2qTzfLWw=;
        b=cKfLxEXN26miSQwZszmEe1NqzSx4hjAeudDJBa6LSy0jWV5PeGXe3T6tAjl/9kz0xS
         4WwxKf43zHBucHSom1HVML3sef3v5F5yr17bgVkaRch0FwnyIwSpRQRDfakJqog/QOuU
         30C91qeDVbzvWOTXzs2V2MhVQA86OlcKoLeNaFnBTzjp8wWTcNttdZjS48wMjKWCqbYe
         Inq8QJy/ecqDYcaqCJLf1MAjCnOEts8Afx3VJXrT23JjUk7FZRmK4/KpqiH/lRB4rcfK
         vYIb2HoBxWohJbtyL85EUkHc8/Q8Vp42S60n/OYjryhuEtgZrwuHRK49KvQb1G5qHD2a
         TqUg==
X-Forwarded-Encrypted: i=1; AJvYcCVsj9FNJQk7us+wPsNuvrWmCa6sTmLKzQHt0cTKMLKnGb+/QR+YykaKWurwIlwrhUJNXheOEsj4TCfC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjgod9jmfRqkd1fETC468Ud6sdzoPL2V4YQvZHjNzAPk/OELiu
	8TO0NnkaKNCIB08axQm2OZR6J/4pSHJSKAMD3UkN7QRIPeOdBuu+9h0K+yDGVGEl9bJ+7rrNY3B
	SKPzmtUoyEnKN7jVl7FWC2MaADV061Fdxk/00rA==
X-Gm-Gg: ASbGncs1kH4K6r7oRlO1MP89MY1ujQyQnDOt/1oKVumLg3Jf2ZpBAiQdPKJulpzmhAo
	8MU416ZkXW6/049Ohciz4/LUFwDNLZ7FlZZKz
X-Google-Smtp-Source: AGHT+IGzU50N1k0rPMwqZpnXSnDmhN5kfnjoTXOA295CNUdTOPpbZYikYnMIW1JDcYAohNmURREOlGqv+1OZ3EkcwG4=
X-Received: by 2002:a05:6512:2395:b0:540:17ac:b371 with SMTP id
 2adb3069b0e04-542295860a7mr8568562e87.56.1735316405411; Fri, 27 Dec 2024
 08:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:19:54 +0100
Message-ID: <CACRpkdbiaT8UwfJZNuVExdJY8g_K-akt9ftuLzsCDXamK4nK+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 1:33=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

