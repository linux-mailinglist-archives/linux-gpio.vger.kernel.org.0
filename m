Return-Path: <linux-gpio+bounces-27532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B9C0141B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461CC18C757C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B87A313544;
	Thu, 23 Oct 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpMVm1nB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1722F532F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224799; cv=none; b=uvqSuYRikBeD7I8QA8loD5uuj0KpkvGGAgzUxohfcxqqb6boWXp4XWp0S7ZC8hioA6DjuWPZdUcgWzap2bBxjIHOGGEzXzJI02S0zRoDGLKfVOEfopabUmXLiNIkecMcJpcuCW34Ihi5d7czQImOZtxNUWXetrjMSVlkPzlsYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224799; c=relaxed/simple;
	bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmS/fyYh+sPH8doZKlv8JRPyjMhFVRYvZJlt2oyU4ef2phV4P6jeG6+2XQttimYIqOSahEdr7G7CssnuKS/XHo9/tZeVqtLS4qzTbyxmIYu3VZ19nt/VVnNUjjXiPYZ2H2Px24SEW7ZdxhKcQp8sYgAlUgmgzNB5ACrwokUV6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpMVm1nB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59093250aabso846624e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761224795; x=1761829595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
        b=TpMVm1nBPHogrR/RSAEO4fO3cf90gbPTaPIZRY4vj5m3iA9odvhlS3L3JBrrDFVkBx
         zY0Lacn8qHqORjN5nZax6Gf/DsVD+yFeYhytccSTskxzxU+w2SZnMA6nKobSOJF06PCz
         lXLJqYBdNeGpm/h8aYzknlNnpIvp7lJwKWNMIO7W3ui2ojiP1NLidV08zIoyJ8Xr1yi9
         6wkoeVP/AR399bbdJ+Y7Ajr0Juqp9ld5pF0dbQVHbFm0txtXThdyhZYoNf3VLc1Tnk+k
         nWntLccvtkGLEU6KlrvqgSLIsvpiHgxNZjMbGA6vvWmMlVPAJKabQWyzv36M4v8+42tm
         oNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224795; x=1761829595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
        b=wFPJSdu2NqI4N+un3gsj9F+LuOBXZVWQYwr9arR4GIQ71ZR2D8J7rkhNu9JI4P3LBZ
         eM9o1YSMLVYmLgDRO7jM1wnBWwsrezjPPBMhVOkDOcha0YL4IRc+Arm+AqOZKBf8ia+D
         +bmsdeFWq7I2eoEkPEH3mvhTlQ0Xoo/xQP4WSRIvVTfb+viriAQJxaPmeOrxiYjK1DVJ
         jXUSNBaXDQA36XAORzJFnaBQAYZfD8wVL5RE1xTJF/+XfnQjSP5Y6sUYjgzrmRDJaku9
         VuKCn76fmyLMB9AqrfkFTTKbglfKgwRORQ4W1VIAooU75gfvJ2jaFmz+z9yYeWnBWG/N
         2y1A==
X-Forwarded-Encrypted: i=1; AJvYcCVbFt09EwbVOyQJpXH/i4AHfpKJI7fWPCaJYCKHD1QTHNtRNBEIyaT1d+Dh6ijEbH8IOZtOhArBQ85P@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYwyM3gNL8g9B22epM+N3PMsQwgVbWrW7PCzIKlIPTT4mW8on
	qK5EsyDGUVBa3lsGs36tTh2TWwzbDZDUgtP6oHgJfyTbwyw5V53ZVgrc7cCNcBQf9IWZUZL8nyz
	7CyMaQq9tZjYC0oajfkUYBPJpZCFVbm22tmhaKX0jNKhTqD/4KtI/
X-Gm-Gg: ASbGncu8rs50s6o084vXZizSscsOUCgCa9B4kqeEmPlHhS203ukCU1E08MyRg6KQyBL
	cBwxDzpfs56cd/46zpz02VfQUSd+nV1G2Nz0w5uljmAEYe91MBOqJxOd7LLoH3rOWp/975cNS9f
	oOoJ/G1JlXWpZgLVg//qseY8lL4XewMaJ+XmnVrV7+UuL9mugtEfTnsTfpxFdfGK+aBYNalZcJt
	LxiDx1Krx6rhdvTX0Mk+WnCm0PWmYzPBhq4nUmv3tVo0awxJMh28BcKukS5
X-Google-Smtp-Source: AGHT+IFcDL6HxDRjM9IOUsRvM6rR76FJYcYsM8X4c9fN3ly38LTHz737eOul0P1wWXKXqapOUkatEWFTswb/ZsXfT+c=
X-Received: by 2002:a05:6512:3f1d:b0:55f:6b4d:85d8 with SMTP id
 2adb3069b0e04-591d85576b4mr7264301e87.28.1761224795359; Thu, 23 Oct 2025
 06:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
In-Reply-To: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:06:24 +0200
X-Gm-Features: AS18NWCEbWHA9yKs1f5ZBEa17kPfiz81VJrrz-ESVNQ36i9Lz6DmgJHUp0v2xKg
Message-ID: <CACRpkdatXz_qcHx3yQ+6HcizdLdy1M277OqpE0ERFq04p7ZhYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO
 base in byte mode
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 11:04=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:

> gpiolib want to get completely rid of static gpiobase allocation, so
> switch to dynamic allocate GPIO base in byte mode, also can avoid
> warning message:
>
> [1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
> use dynamic allocation.
>
> Reported-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Given that you both work for Loongson and can be expected to
know what you are doing and are aware that there are no users
of the current static numberspace:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

