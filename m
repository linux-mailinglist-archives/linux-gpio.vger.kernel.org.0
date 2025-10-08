Return-Path: <linux-gpio+bounces-26883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E549CBC38BD
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20F319E12BF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAED32F1FE4;
	Wed,  8 Oct 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gYVRsreT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD82F0C7A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759907898; cv=none; b=sEt6rV2oE1e/qdSOinYbGEenKwqfZ8GRCLYuSNZwcimYSSauptx0M+6mCA64CHL98PHxp16JsvQAXubtFHWIYFFQ1EN7YP0+S6OcH33Ex+W0TY4KMPC+xKIYhpn/wOcDn0XpcdWy2yZJU7rOqGtxjsBkrEyO3En3pfDy/O8gHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759907898; c=relaxed/simple;
	bh=MKMPHmTNcAyRlJ1MMOFGz/GHSinMTp7O8OBhdYfHbpU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0ObAl0SAJlLLHJu2Yl9HmnMtFMp5/p3o9wcysOv2VNwePBHICKJIes4MrSxsNjfv/o5tVQYl6vXwqjh4g8Etm0fTPfnZrLOE9kU1kEO2w2tTn/x5Y/oRnlut/KWeVi5JRVhrGhU7GqY9MMFwNjMlGwX0LqYiUc3iAGs4MeYqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gYVRsreT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59066761388so632771e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759907893; x=1760512693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JEjUmbRYna0jJQ4Njy9dAhQR6lXc/eOMFRhsvlDe1M=;
        b=gYVRsreT1Odz3RwnMQjfrb3S9xql+yKBaWBsn9NxddchMP47UjHkLFkauplykaZBPm
         y59gLSi7kpUyr6/l2syelQUA9OHjh8xidhdxnDKDJr9mjWYJt3yk3XukQzhjv2DmfhyQ
         mDEr67Abu81VMDqGV5BxPDZ0rub+WysGFD+w/17izdsXG2OdshOUkT1zjkdhwFczeeDR
         fXLtRAdbEsBW5WmQx+n9+Q/JVy/jb0GYctTRpVDnVy3UoHy4yHWS7zJD75CfJVY/vkaI
         0nuRF1/X5jIuAyjXH3WSyC44BBNSKqWEI7GyMUlWn/l2xw4EqAGXS6K+yADvOjcsOChe
         v1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759907893; x=1760512693;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JEjUmbRYna0jJQ4Njy9dAhQR6lXc/eOMFRhsvlDe1M=;
        b=IAUiMdIMBsDUUHA7Pgra/80afZwjdw/fueep80LfG5W6cGf1Rbw6kF2qdxCC18weDs
         wkAFGeSqjeLNwEBHctzNvN4+fVqMMr5gDfAb4A9HGGW15TVYvKLl5wE0mkr4kjcelayu
         yXjxlky9t9Pj54EnVnMB6ng71tMcKKE4ncYhlsCiO+IlpMpF56nUHfVTcKBy9UC+iF3N
         EniQA/WeMdmwP3JYdUTFOtPVf+DgyPEUr/5Iy5zr1VTQYTluEEBL0egVJ/su42YBQyx5
         eGOi2dETDfv5USleavX1PKs895wxgc3P1/DEGS23pXZl2ZBWfxu14SQuTfLQecaFY48N
         GLLg==
X-Gm-Message-State: AOJu0YxQt+KbRynfm55vHNYEd2uh5pfBCYTNzNYNRFbtKWZGdI6Gp0o3
	xV6ucqPEc+Ix5Iu8UuTTJC/ho4G+ljftp9Fq5Ncer0nB5jS63h2EqqDwloUmp9zr8WyDWmKR0Lb
	zvl3IgZ0GS7GeakVzWhEdSWCOlszxly811y10J5yrktdSExtdT/6JSvM=
X-Gm-Gg: ASbGncvqxPCx9/Qyo0k4Wf0P7C4Rn1Vi2/BbNwJvRKiPE1uSd4cFdAcc4KCRwG/fYW6
	XDYaKTCGybOZr3Igio2lnsihhGB20muWb/FBiaRW9XCg0etP82zNFVYGOeO9fucQk3vSxAEGoEl
	JbZfH1KdNzhne1mDJQsSaBGT9Kn5hsOF+c2YeQphat5cMn+Jw6g1tizaCSTnoDS+OzlMK2XemHX
	FfNVU1Jj0f19xKqB2d1hNpU/LDZi8eWzuf1Mk/avEb48FKRX97p/PbuVkQVdOk=
X-Google-Smtp-Source: AGHT+IG5aOcnm+ccYQhLqgJ3TKrokJSDSPR6rxIvbwXnDayoiMYaXJGBtFH/ZMoT672DX5xrsE6gfIzBKLxyuKOlaB0=
X-Received: by 2002:a05:6512:e85:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-5905e3a0d18mr1622290e87.28.1759907893425; Wed, 08 Oct 2025
 00:18:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 02:18:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 02:18:12 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251007-pinctrl-drop-advert-v1-1-df16410680af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-pinctrl-drop-advert-v1-1-df16410680af@linaro.org>
Date: Wed, 8 Oct 2025 02:18:12 -0500
X-Gm-Features: AS18NWDkOJhreUAnXAv42KKCZwAZT2qhGPcwzJvh9__UaJ7jpoiFhCKWMr1GEnk
Message-ID: <CAMRc=Me5h-Fk2sNYpCc+y5Q9FjBC=z1m4raZ4JHF5_C_hKiCnw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Demote subsystem banner message
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 15:18:50 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> There is no reason to print any "hello world" from pin control
> unless (maybe) if we are debugging.
>
> Drop the banner.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index c5dbf4e9db84424ae9ceb90ed3681341654d1871..157510157d47aad96b459abf68cc0e4eed957f2d 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -2416,7 +2416,7 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_unregister);
>
>  static int __init pinctrl_init(void)
>  {
> -	pr_info("initialized pinctrl subsystem\n");
> +	pr_debug("initialized pinctrl subsystem\n");
>  	pinctrl_init_debugfs();
>  	return 0;
>  }
>
> ---
> base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
> change-id: 20251007-pinctrl-drop-advert-d1150d425942
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>
>
>

Good idea!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

