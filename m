Return-Path: <linux-gpio+bounces-17021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A42A4DB37
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25D41176110
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6211FECA0;
	Tue,  4 Mar 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1nZ4Qqav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1E1FC11B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085143; cv=none; b=jF1aYQ9GIiPwgVSp2zo98btXSsn3sV3tgRu+dpPjvwGci5P8La/Cq/DIQD0sxEnKmJALDtm754CpAKUpvGmmWIEL6/cgb4hKWa3CnW79UY95TBO08QEhWY3/M7INWJtMm+s71IwTOw1P4lVkduyplstffIJX6ZJPDtTtz7jeAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085143; c=relaxed/simple;
	bh=XrccfVlX78d8fm1mMioQKtD60WqdbUAbCv4lJv19APU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjLPc7Jf+bAb25W5rSnklh935CDEZZkExSPFSZxx+c1NxSfeT1nHf4nJARsSZmoVt8qVEfQKSq9srfeTJLpoQgObjxxlfDas++goFIYqaBWSTHe7KUlQ1+i4HqXq9h79m2SHRbC1HCLNphQc9yniDq7yMsJCSINVobFmRMGhDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1nZ4Qqav; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307325f2436so55177941fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741085140; x=1741689940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=1nZ4QqavzDcaZHcAJnFRHUByoeTC+8Jnxs0tdEa8v1iJg+l3keEduYcCQg2ZGPhG/v
         yq8+Zx2QN6n33rijKs9ZLZcHxstKuP/BsL69sZsLGIVZZqFQZXyvP7wIQuo6V+ymm2Uo
         zkIde1eYxTgj5WU/TfAs3gbQ9zacBCqNqKdt2Ce2oJFcb8F6BsBjAEK+ai0MTxM04wqr
         Gb7jqSzfW4T7VH977IjXvXLoGpiIr7zJJ281oE/8m80HnhTXaw80pf2ALQcU3x84ny6v
         bwBMe0XQmNiz5CkYfY4Q+C783dpg2rFTEojdBKxiQIn65o7h5KhysLCJ+kxxv+L1EcC9
         M2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085140; x=1741689940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/aaHwkC/E8uA1kqYtAAaX8nqXZT+jPYwGSFIvz+Wis=;
        b=RUtWPQbyVM2GZFSWC3p5DMYoFy1khpoAe75I1PLZctATHlN5zkBM+bdZ6h1NlL7B+K
         etpH8oktJyzMDA1xZ5iRfPCZxIpuNN42vaZJidcWhX23JPZPBBbt9i+SsqglLKJfaJY/
         iORkIGPInUPegIOMsTNhxRCyjSlONerv10QgqPC2IZi7CBkPBK+oU4FeLUYq8Xs9ll1E
         9sMUl8/Hz2Dc0iyom0F9cVdm7jOd5NI64hzraMhDq4Gko0ic5JKMI2lLs5QmM7ZJMOGv
         GUGw7VqlulGUtiMLHQ22PlHXWpvwUvAzl5HEM2fE26mM3NjR2flr8Ft3uh6pV/vsZNDl
         bfbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuyQozBzyu0mrtJF5uN0CvDS3wnyq8nJNkfQ2+lTiNyEdXv28fHithnKmFNUWRNrRdLm1ESeOLBNOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxbS8TtK+0+hniglcuqe+BSf+9cj82gtGRG68MvN7yXCQoqJUjE
	9VpPli+51VrA+TVrQW0NY4MF4I7/JGZy7RLsJrk4ZCorw2SPcX891gJ2ZhxAsqOhk+i2+HfBixR
	/sHvmd92qM0wvPyfpdZm5K8CSdJjVME5teylDUQ==
X-Gm-Gg: ASbGncuuNiduLe4K5nxAVsXbJMEyukFMXxe0Vl/qagY/IX5DdmoOuFufdVugDPku0Ix
	/zBqqg9L6ZoF1kQX7nHUpNZ6T15X7jPJ9EWbZkv6hAV4f5b9xqD1sLuNtTVd2NprW5TQxXGbt1e
	/yxVTsGvpR36NjmHbOi0OEQ5ZPBP0gVn5hht6wtUBJT9ww5qwHYFn+5kAkUg==
X-Google-Smtp-Source: AGHT+IFXXt2AqKqjjUsUgbBtUp0OHXy4RcnJzi21Vkdwe1SliF6nWQg1kfmRVJCF27CAXfJfhtKA7V7mluHj46qdMQY=
X-Received: by 2002:a2e:b896:0:b0:302:1cdd:73c6 with SMTP id
 38308e7fff4ca-30b9326af9bmr64690081fa.20.1741085139679; Tue, 04 Mar 2025
 02:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:45:28 +0100
X-Gm-Features: AQ5f1JqzX8kxY0W6rt0f6HfW2eatpxqYEnNpnql_NIg_4tkiueWX8b7wCcm5OjA
Message-ID: <CAMRc=Mfr0Bwy_OWRheY8U5c2-0nB+_JxZHLNjbHFzvCEQb3OrA@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This file does not use the symbols from the legacy
> <linux/gpio.h> header, so let's drop it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm511=
0.c
> index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45ac=
f9a28720fdde158 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -6,7 +6,6 @@
>  //          Sylwester Nawrocki <s.nawrocki@samsung.com>
>
>  #include <linux/clk.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

