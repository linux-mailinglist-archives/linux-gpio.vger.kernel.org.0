Return-Path: <linux-gpio+bounces-18689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA34A85C03
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 13:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D1D4658CB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 11:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB90B238C22;
	Fri, 11 Apr 2025 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3gU2NpFK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25A238C21
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371524; cv=none; b=GN2SJQvwllwQeukCHqoqRei1x8kY+nrZv6VsKm87MwgeWEgTKSUSfOVfkbfluA/yOi7O77Fyy18ksDVklfddVsqejuF2N8Boski5LUAiZCnVkMq4em2809nvQ5fcHozR0NRNH76wt6pZc51fHK98upqvPz1t/geAdUn2be1L7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371524; c=relaxed/simple;
	bh=odkZFZUi0f71HBPvN8uYjy7mYt551ylhud30ueDx3R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJC67cNVzX0T3SMEbEfzemIjw5P14MKIl+9Kcnw682DZHLEnRCqH0JkVl67iuTVSiCcXwE5TB7fxATLmitHtjMQfkKcStinF2/JtDxHV6L+QQT68aJZMNKx3L36HJCCxkpBZbIFfkn4ZOE6SV0llCbAk0ENGGhEq/i7kaaw8sK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3gU2NpFK; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3061513d353so19470251fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 04:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744371520; x=1744976320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dh8vYDsog/Ci3+DrgXMQu6sX2O8M8O9Wafm3pVbf48=;
        b=3gU2NpFKoBHjKBeoK2isTG4PGs1TxydkmO6Q7r3d0i4xZ23tf+PMwiGRAN0xFGiGr6
         4vSuHNE+YhHv0Mhr6JtTTtI4M/8FzXi3fWqtx5OP8VqA0IUzJYx1UME3xEvZRF/Eh1ey
         uU2lfyl5GKDXgn7fCgyWCn37wMvG6y90Lyf8AMUvb+dQ6jJWEDsrnyycy5YrNutG0xoP
         rBwI0bsfgM4ifxUXwP/OTRqxHzw4o2QEG1bJPq1vvgmBS6fFX2e4IUMfchh8SBQp1FnW
         FMbFLyWKbuKoF1BbawgybKzxdIxZHuASTGrasoznUwfq/ahWlnR4pXXXXgi49+z2aYsE
         xjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744371520; x=1744976320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dh8vYDsog/Ci3+DrgXMQu6sX2O8M8O9Wafm3pVbf48=;
        b=PcjrIgfFPlNI6IX7mFa81207h2hATLkT3O1BXGLQErVfMXKCF6s4XQ/BIZLN38/6u0
         ck1hVbW39MHGN/7jkWpjXs9cGLN84vzlPBvZqtXxZ1vfaoxjavaqYYiUTxrZgH1Lqlwn
         2jYevg63p+mGVI+G45oqys6ypK5yp9LJfztvWdslT/rp1PdxW/6ZHuRSJc9YVgxWiOfn
         Rx+Qdj3rdZg2qmxHTqFIVftPAnK+HAgTRcU2RQbqqTkFM1pgvC7G+IBYv5KLO4YgGF0A
         TIP1+yAs2CUH30Tn9zeKGLP3CLZR12Qwmm5IlMKLY5NyQSv3BAPEv17CsfLlwTP/uOny
         Obeg==
X-Forwarded-Encrypted: i=1; AJvYcCWCW0M+INV/08hLLiCJ+jDiJ2SROwECveNjnK0p6ET3doq9i/r3HOXi0ofUtfJ0EY4DOY93GFg2ztTG@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGRiy3n8Ti3AVp7caYrW7Cbtpp/5DGEfHWTR4+HneQIz4V5Wo
	Th8x4e6z4Iq25uTlUJWDiYOQUCes81wjXU3VFZEJpRMZnd/CSktf9RJFFxStyss3e2fa6Kztq1k
	3HYYhjD2gI2zbqYPnRTOct613wnM7WkFSDkI2bw==
X-Gm-Gg: ASbGnct2X6mDAE1keBHvOjls5ZvIKkS20sYKiGjLLYpsDx/DxURIivt94QejLJy18tx
	3+tA/UJycqN8g1FLye87OXrXTYorEU4dn3WeKpJicZzr14Hi1BcO711L3tQwb1qApdeQ605vURe
	yrB59mq8dU/W5aepO2wdQo+zxdWBVrw7Sk0jo+7suZBU+dvu7APJk0kSy9
X-Google-Smtp-Source: AGHT+IFFm00GPIYdXZ4l3vc4zErYQVOB90f/c77ivhuoRRZN68YVc/a2XaGhO2gIGxfB93Qso8/XMsIqT+2Mct+UlFg=
X-Received: by 2002:a2e:bea2:0:b0:30b:9813:b011 with SMTP id
 38308e7fff4ca-31049a7e684mr8679781fa.28.1744371519491; Fri, 11 Apr 2025
 04:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
In-Reply-To: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Apr 2025 13:38:26 +0200
X-Gm-Features: ATxdqUHeXHWBZ4MIFvMYwmaS8Gr1mIm67O6dg2SJ8aNNGnkJhnRQNVQbFwlbeI4
Message-ID: <CAMRc=MegvXZGAVA210rjnFuKZwg4appN4nAJNejfC2jpY0JLOg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Allow to use setters with return value for
 output-only gpios
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 12:31=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> The gpiod_direction_output_raw_commit() function checks if any setter
> callback is present before doing anything. As the new GPIO setters with
> return values were introduced, make this check also succeed if one is
> present.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b8197502a5ac..cd4fecbb41f2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2879,7 +2879,7 @@ static int gpiod_direction_output_raw_commit(struct=
 gpio_desc *desc, int value)
>          * output-only, but if there is then not even a .set() operation =
it
>          * is pretty tricky to drive the output line.
>          */
> -       if (!guard.gc->set && !guard.gc->direction_output) {
> +       if (!guard.gc->set && !guard.gc->set_rv && !guard.gc->direction_o=
utput) {
>                 gpiod_warn(desc,
>                            "%s: missing set() and direction_output() oper=
ations\n",
>                            __func__);
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250411-mdb-gpiolib-setters-fix-b87976992070
>
> Best regards,
> --
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>

Ah good catch. Since the culprit is already in mainline, would you
mind resending with Cc: stable and Fixes: tags?

Bart

