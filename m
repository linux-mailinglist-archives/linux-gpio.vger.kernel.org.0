Return-Path: <linux-gpio+bounces-17017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 555DCA4DB32
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE331887BF3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16281FFC4F;
	Tue,  4 Mar 2025 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bZcJwwjf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B51FF7D3
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084928; cv=none; b=dhlyaVLOcTHwcCClL/aXItX4asVTX9pgFjlCMYq/UtNd/rA8tnUoRM+/yFD1p+1bBZTnWLPahxEG9/IcjVY7b4VUPykgjB80bFt66F+kbW4r8ILwn4YT4qLXwfsD92RaovYS1h+2lp2evOdcInXk0f/GPAxxtGfYwG2W3tpE4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084928; c=relaxed/simple;
	bh=ZzO+DwR7u6GHE+PXoe2AQYlkIThyL0XtZi9T46yjKhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxbbNjgxvKxWSL61eqhQDzyrZ92jPxmMr6J/yNhIW3MNDYkV8DkX2oZlTT6kf26boIfKG/OUjyE2Uiro8OpGDxrxjftDhfIKApBo8pHiZESpSUgZCsG3T5RapRtRf2EX4zky4OHvTCcwWnHmISyAWM5neAo5TpvtNGDdGNvL5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bZcJwwjf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54973b49353so1167742e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084924; x=1741689724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=bZcJwwjfIAfy89mwhuzT2myRhW0GeqVEsu5sUfyFB1q/mN0znFnRIBIzh//Lsveeq7
         XFjc2ybfGy31YMhPRgwmURZ4r/MqBTInIxQnTKVPPvw4wrN0sdmBvOdwaQVEX+dZYcdz
         w5oo6MDMW87lc2B35pDSnFqLllvrYayIMC21Xv9SOtlI/HFXI0O61bJB/1MN4fr0/9G0
         vWMxFkYQMrTTPA0O5ptZkTGhs/k18UevcCTHjG5JpOg1e81a23RSzJhzznAIOIg1mNDT
         V9h3EVAHWlJ87L3qncnJWV0A16mlD3UllQL9qbc1ZiTqsvKJj4IFOjxs63cgrENDkKX5
         ccAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084924; x=1741689724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B53w3MQPaxkNrF0zClZsbBbaKHU29woPD5v5NTL/nAY=;
        b=eaSMekiOXZlEY2kbk84ejZTDqh1aVH8zHhYKAyl6NDFjoE49n6okY9ZAGYdioPPZB1
         sHqyEO+W9eY5YvSxQeogKZL6TQ9AKpZj0tckwdO1LR4y5ml8OtezWHBhhefAQeoX2UNe
         00l5EfQ0uc2LGiDlrx9VmbAiCI+5Ww4OiwiY2rXCmh41B2GuKLnZEVGVJrm9+jcGGYMJ
         zdg8q4yVqYlhdoS8ReBKeywSsaHUr7fvRNgK7ldwyTSp9ijNQgbJTdsagGBrrQ//MW6n
         LcKVy/97LsjuJxdr1oOOs25pNufHHK5brPdmM57sVbFV8Dukw6bhMsouxqvAI15fvzsC
         LIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl0pZvaqJYsPhraoZwWvjC+1yFVdJhUoXHKqvm6BUUpyP+zsZtNfh3nxOHAdOVWXRozgkj9WsLBDZA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3wtsevOco2auCVhBdByGqA930UsHlTBQNJYcrkad6BtsrJG2
	4SXm7MVd49h3vBJZgfK5VTiR39OeOudNuYU+rQSI3R45dJRA2zKaNv5UmXGOipXD4UZ7+1BbSsG
	P4XnFsHjs4JryZhubBWZL3mkUTgFy7LxzV1kwwg==
X-Gm-Gg: ASbGnct9wqnHOmBJULVDJD+TR3HFvQmhL936GXsZB0omZxAw502nla4NCOMmcObnwr6
	9d73fR9bmORW4oumeWMZLGJIQOU2F59WM085sN58+/R+xZPQ+X4NOHNwklfJ2pqBkSHNG4TiTJr
	TvVIvZBzcLuRKfdOkV2zaw6Sk3KM1/SRAzBEvCI0ZftQ4bX9boRbFHSN8hXA==
X-Google-Smtp-Source: AGHT+IFjk1UnA0sx0Kef7boBRo1bABdfDdyjC8ITpkOL63KQEFB5T3AVF3JlEQ15FCRpk+EGUuIFoCvwxuTHq4w+81o=
X-Received: by 2002:a05:6512:3189:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-5494c320d3cmr6862388e87.19.1741084924101; Tue, 04 Mar 2025
 02:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:52 +0100
X-Gm-Features: AQ5f1JqqeOex0JCLsht-e_FnDn4g_HMa-cLCOz8gTdBj2tCIzQrrIWUji1KdsEY
Message-ID: <CAMRc=Me7kcLvYPgRF38ahNtq4J0e8yHPRyd9yMnsjN4dB7Y8Ag@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
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
>  sound/soc/samsung/littlemill.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemil=
l.c
> index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ff=
df499a3eeadfbaa 100644
> --- a/sound/soc/samsung/littlemill.c
> +++ b/sound/soc/samsung/littlemill.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm8994.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

