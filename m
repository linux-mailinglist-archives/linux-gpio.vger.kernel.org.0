Return-Path: <linux-gpio+bounces-9568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4C9686F2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFFA3B24416
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC46187335;
	Mon,  2 Sep 2024 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JDkJHJrz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0216EB54
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278654; cv=none; b=bY7JRYPblvaT1rfrxWRs0dU9V++u13b2Ath/GJ29mN1RM0feR4i4lIQc3O8IFmfaQZ02BCb4OExkLc5jkUIOmyTfuYM4/JHZXRS1pyt04Qk1ykRDcfIVxfBCqRGe9YBDzc9VjoI48E65bhqPgYNCW7Tk/D3NznL9eElOWtSQn8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278654; c=relaxed/simple;
	bh=aJwqbTQI9DGIgXVMitmiF8X8rBG4gd6JRzjG03U7FHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrw2uR2kDPllfqPsAGNJ/AdG2VvnwPWcbI+uVwiqJQcAgig8IweWSoqMsU5J9BlLaFOHNn+pIkDFLvj3YYfkXEjL+nXQCV7ko5TROF7xtYMdQPPbcKzN3fiM2ze3Xggx8fnANPfCldMKhopHHZIyUrw+hGFKt5/DRGMXZxY6pZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JDkJHJrz; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so47007561fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725278651; x=1725883451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfeUtZ6B5pDlVbEaBzbzexWcTj0QriXatTBO8FS0nAo=;
        b=JDkJHJrzrkq1UzrEB3HQsWtgiWg8xFwm8kJ8FqjwOcHWZP9yD+cmTdF181qeCUZwmG
         fPNyvHfoe1hJnNc1sPN2vhAmPtKJD9nk932onKmSsDcx/5UR/L3HOuK27KHBD7bjcnUR
         G+UFPU135oEmrRS71ULCgYnd1xrXuXysu4eRgXbkN4KL8Q3r4qSoJOgrlJuhmTJm7FTv
         b7g7UyROMF+BDqqNEwAgNWpyRLRT8c6qw/Z48l14aZd3wF7kldx/tOFboS89GCXZq8/L
         zPIZvY02NwlbruOYtEtqkwk8f0/6XlugOzEyFSfRUCtluE+5vA1fCuN+tH8Wr6SIZFOx
         4hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278651; x=1725883451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfeUtZ6B5pDlVbEaBzbzexWcTj0QriXatTBO8FS0nAo=;
        b=sqN95ijCry8zYn/xH/loZwrSWaSDT8gqIu+KdzG3aobv1aPJSN0LN61CluXu3gMiBc
         Yk3jHl5xoYG+ktZftObZwRmKT82z48+lccaCYqdXFYkqro7pSbJhEyamft5qGyM2fnHa
         kezVhva9sQnCAqi3NMkTt8qHA1lxjPJ5mHR5R6Lo+jYNiMyr7QwYuYDWD1SG/PFI8Yry
         /gPIRSm8BNxLQd2Elpeavm8KQxTDgA05K7rplO7jE4Mjjyn0E8QfYsP9X2jJC175FSwW
         +PHNsaWKv9VMNgLGw28jTgnivgdPEzDSDFx/kjCtw+Hr8wHkt56UN705S4/5g0Rt+r1t
         fIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0OTYPr3mjKQsHPXJVmJe6+4IN8eXJtWrPRRPGz3iFoH4u4r+oHvrhW0Gk/PTU887ZHnSb0ZSTG5V3@vger.kernel.org
X-Gm-Message-State: AOJu0YwneMk2KASSMYllBJsJogNdJorfcLa64DflKpk2QW4C4dE1eadr
	i4IVggbSFGi9tKKS5HYX4UsIrwIZUjR91WCDrE5J6FkCnvJvwdozMKqRt2WwYS4qd71/DykQAR9
	GzSdJKYRFSKj0gqgNqeFtLGO4pdVwQg1Vw/9tnEWa7wCZo1XN
X-Google-Smtp-Source: AGHT+IGIZuTye8K4bzrJnnZAxLQdrPoKxySbuZgdViXBdZYXFrvBs/1ZBZ+OqX+qellnTsLL0xbkk/J6FCD02n0ANbM=
X-Received: by 2002:ac2:4c41:0:b0:533:4191:fa47 with SMTP id
 2adb3069b0e04-53546b69167mr5994649e87.47.1725278650402; Mon, 02 Sep 2024
 05:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 14:03:59 +0200
Message-ID: <CAMRc=McgbL5DCu2mr6oWERMQMFQU1Bm-1BkC+XR=-2fPXpOW4A@mail.gmail.com>
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 6:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Drop kerneldoc descriptions of struct members which do not exist to fix
> W=3D1 warnings:
>
>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' descr=
iption in 'pch_gpio'
>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compatibl=
e' description in 'syscon_gpio_data'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

I have a different patch in my queue that addresses the syscon warning
already. Can you resend just the pch part?

Bart

