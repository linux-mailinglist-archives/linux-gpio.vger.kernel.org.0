Return-Path: <linux-gpio+bounces-12705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0249C180E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C7D1F225C6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA9E1DF254;
	Fri,  8 Nov 2024 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjAlJJWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7A1CB518
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054847; cv=none; b=J+1xlwu937V5GNCIde5/bphV2iEqAbxPosNlkGF2/76BE3sb+vuE3IYvDVtQgq9lcTveYW4fSISeuuNaV9UcTAiwSQm9P6N0fnzPnRa2v2/UW1DO7tM315MvNMApFXgDhfpwv5fPJ/+KZ8rsmsRX0ZF4Hf/5/Ka2MfrzWfMzAik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054847; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3rYIEgboxGjNyLQnvlSFF30Hv0Q9S24FARgsbk8RbOjUFkJrfDSz6eI9h38X6rWcM2bEtFdWPcUiiPZZRuIRm87/FO82sLN+FjPbLZ7l7DKIgBmyhjasUkIEoJcvSSBCUgS3n9300+Yy7xNd7wxjGY3IWXO1q+ARgkN042FfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjAlJJWq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so17627711fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054843; x=1731659643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=xjAlJJWqX0HSSNoH6NdsMfiPu44D1spoJUIiT3J3Xp40RiHVFvafLYUmQzldCpIs5D
         WnLruQJJDv7+UlQJemNEYN4CogQZwaani60Ol7k0hz9L1jpCiqzhCMUt02yxVqZrjAoL
         QRJc9r8obpv+vQohZpQKKy+W/l4hvECRujmHRSaB7a5CvyuULcW2ndh75zxjGIrqFLMM
         cOws26E39SCdUPt9DxB8C9s2yPUNByN5aZJBDyyu9xPFGB9LmNWMgkjfCgq5nT4BzNUe
         tN6AHJ94trIAE8KOD1bOB/HHM6PX9KXoOn/I3t9b1wLyZGDzq6wnhRUKnwdFsSUwWaYU
         D6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054843; x=1731659643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=NOx65BG4Oh2CmQC4+PGDtL3SXQf9bdj/Hrq4BTdnmM8gU5ISgksC+rFm4VIp6Z86I2
         4GT2Lu6nKAVrxmK/i1HDgfRbKDsaCS1cBkGtusDwnEho4rePzfZaNxsCei/REKojX+pE
         /lYzUMTo7NW7hwFsfuCWIgRK6Hp3RR3fJXFbHaRtXVaclUWkuSy2B8BJLDOTwPmKrhpP
         Airl9WYRBzFcsl3kQ4QBd4Rdr5gjwkdrnFE4WgMjh9DIH77jozAJ9XILH6FIZfkA/K2S
         3405FG/PA9NbdOu9wZw1cD1wYYbV3KCkO7psVPI7nkLc2ekdrxHCtyf2E50ilDSIj5GF
         /VjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5soNg8HiEM+WpGdNYLDrU5CKFJ/RaO5lSZD4HtSIEAkg8AVP+w2/jXcU6JhZZfxwe4+AplV6mWWrY@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxjtPej1yozrQ2jjsLK2eE9OFA84sO4xSucVbCk4awxF6YJZC
	laku2jMsehy44jdwoMwnM4BNCe6sReOnGgP9wfupGqNfDz14S6/tfGl1s9h1qFZLzUWcpRiueie
	Nead121s7NdTD/0V9FgBAaYKCGCYTyTWWzfRBHA==
X-Google-Smtp-Source: AGHT+IGtlBw8/BzKpYwXBVKDarOJwHXN0bQ5Y2Edkm/hG0GzbaUmoWPVA9ksvjdd8kLv/JY3KG1mkk4/qEjDQJYnfQs=
X-Received: by 2002:a2e:be86:0:b0:2fb:59dc:735a with SMTP id
 38308e7fff4ca-2ff2031a659mr7523931fa.41.1731054843501; Fri, 08 Nov 2024
 00:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:51 +0100
Message-ID: <CACRpkdb2NvL3-+BahUHVWEj+gPKLRmVi3aTrLUSemFoNuj2nmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

