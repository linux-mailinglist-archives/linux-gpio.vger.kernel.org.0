Return-Path: <linux-gpio+bounces-5441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8D8A3665
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 21:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7E51F244BE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A96150980;
	Fri, 12 Apr 2024 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EXAg5ydK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD28614F9FA
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712950290; cv=none; b=fLSa4V8xodTflXW4+n7lnX9c9ZqUlNbFlXL52Ij0g//mBzidKXiM85PlpaPnPO9LAolPhFcDH6uM489V1GJIvZyWB6LpJ7IzT8bH9QR/+ts/kRNbrVAPQZ2TXAtcdo6HzqGTdcmeWOPtCSeNOvlV6BV4lLci08QH17GkkQchYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712950290; c=relaxed/simple;
	bh=+cCQ1ug2Y71PWJDzryrMeJPeup48fb/gLGtRLAjnQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZ7SucnLFTfu3WJlbPCbsv+/sY61t3PIW+MfnEetqmPVdghzu+EMv7vB6Mrs+ocbLR2dLrNsWCfyuUWOzEvxSirYtVMAkWQQyxu/UUSbsrTzubfpmDuiY5nxfhA7PBmpV3DeC6I4wOGfUe7bFYqMq28erhMAvhQEyi+LGJvhf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EXAg5ydK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so13715721fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712950287; x=1713555087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDtRm38b+9GJbuqV4jT7bN562A01RuEMw7juSo3kmpI=;
        b=EXAg5ydKKlIY8G4JChgE9JXomMs3OhYh99rwjJ9KSAMCneQygnclQZVxtsgmzWJbFz
         06SReXGhlffzjnKnZG3Jv5DVg7WjI3AOHslIEk+oRft6AFGkO7ggadFMR7PkMsIX4gXG
         eMKSEcQjGVm3E28kwUrxyecuNh77R8YdEodcDhn/XG49YCvRYpV4iyvXEnGNO+UrbZMA
         cGQbNt3ETc2EdKkCSL8a7HDrH2hW8KJPlzuWqiafvD7My3G7cZm2nKyRIPnz79dLpXHh
         xn2mlBmzcxNUbZNoaTmEN3jQ7MjT6X3H0s/GHWgrUEwN+B6NPlKrHqjzySIbUmDjB7+J
         BEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712950287; x=1713555087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDtRm38b+9GJbuqV4jT7bN562A01RuEMw7juSo3kmpI=;
        b=Y5iU8zKbUB1Shy9KUb7lmuMFiFuAwRo7EhJB/Eq2C7Igwd3IM/cgetiDPNMINv3CXy
         WJjz7oyH7vr3e86IhH+RvpUxGH/TPjqBUWIxWRWjzuFH1N8RCKq5StjPhamavD5scJC1
         2NxFqh/mnQv5Hvas9v5ZvmMzAuPxwOfGXdAt1YPthSXZpYopNeCE71w1npz0stA3fVk4
         XuKD1SwoEJt5Vz62c3gTn7EgnT/72tOhPXvc13KFblQ5w4KCN6ZWjg5p6OkhFUhYjdar
         fHdP3tma9+IzlhpZCp5cDDcNV3UlREpawLjyhcnrtxayA+aDAKNlbRH3SiFDjhpm6VJp
         Qcgw==
X-Forwarded-Encrypted: i=1; AJvYcCXERMi7dYQsOUv1ilQ3XRN2Q6Mm2PDIuzl7Lj0yI2m2hQuPFiM+DF84Nqe7ct2tHp5xoR6FwrjSggDS22qWzkiX4cpeUKpUK6TYng==
X-Gm-Message-State: AOJu0YySFKnlyTDpD3SvHv6hQsh+50xLJ2g4CRIbj9YU0TqcZTGAjPbj
	6jCNBDhYFcAutW0zfUC3u18S4vQUoVjBkz01n1kb1AojGzu6duKcKl7SRxkCNMqcWmAHrOhIah5
	CcfMHvQCl/6v1auYTuji7DziCFiZR7APHChrszw==
X-Google-Smtp-Source: AGHT+IGBU6hkZqKeprFG8RmO4hkyhuEE0dUJ2DATz9JQajmHqiOX5KRXixatD0+1pp90KQcM29UUas6bSqfRnknjzBs=
X-Received: by 2002:a2e:9659:0:b0:2d8:2710:c64c with SMTP id
 z25-20020a2e9659000000b002d82710c64cmr2787581ljh.1.1712950286947; Fri, 12 Apr
 2024 12:31:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410170305.248683-1-krzk@kernel.org>
In-Reply-To: <20240410170305.248683-1-krzk@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Apr 2024 21:31:16 +0200
Message-ID: <CAMRc=McN_unXqJyu98=qAjMkp=GdqO7dXtTfO-HmrzDR18Y4Cw@mail.gmail.com>
Subject: Re: [PATCH] gpio: lpc32xx: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/gpio/gpio-lpc32xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index 5ef8af824980..c097e310c9e8 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -529,6 +529,7 @@ static const struct of_device_id lpc32xx_gpio_of_matc=
h[] =3D {
>         { .compatible =3D "nxp,lpc3220-gpio", },
>         { },
>  };
> +MODULE_DEVICE_TABLE(of, lpc32xx_gpio_of_match);
>
>  static struct platform_driver lpc32xx_gpio_driver =3D {
>         .driver         =3D {
> --
> 2.34.1
>

Queued for fixes, thanks!

Bart

