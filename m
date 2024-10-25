Return-Path: <linux-gpio+bounces-12047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A6E9AFAEB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 09:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C03412817BC
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 07:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1311B6D11;
	Fri, 25 Oct 2024 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NNeY31bl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48401B393B
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841159; cv=none; b=tkFoA8heoWRsZyti1cO4xhkuiGXsB1MZUkv6sD3x4Zqk6RFzPOTBHzwhPeL2PmsUhe4Ei04aBp1VQfJCduWDGXMW+fcoBeLquwMiXxOeZJID4ueKw/FpuKdgQaR46tTIVSgv5GO7wBHLyHufQxUSSDonRYBn5ETEIiARC2HV5Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841159; c=relaxed/simple;
	bh=JFKQGkzoJxF/22a+VPfGsDNqyIxoXEnmvkJ4rlwJMjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaETRrz8D+3Y517igiSkC7l5CHQ97txvqqc3zcQEJJf7dau88tMlJRKDKXYpj/NazS6l7JKHEXRT215dF9qAo+JDp/1Jbw6cHdprXkZHbeJ8BOmPLoIPo+ItdZuQmvDi/gqHZnNRxhrv3HGZ9aOkeJiaHV4Hi9gh93qUQ7/DYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NNeY31bl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2019220e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729841156; x=1730445956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g2gos01gcs3ARV9xOeM9xEQeRnKHcL1K/otT/YNFqk=;
        b=NNeY31bl4CL2K6eVfkF1QUcrwIsdwetHupudcq1NrtSEIpvRZNIh1eB4CvvTDihQ5T
         5KfclZk74AGwF6XpUfSJGhPA3PUHZ+nMAM36koKuHvtBdS8Vne6x1xGmEEBp12LV2Eje
         VEKSxfMB8x3Yy9cqGKK0fNqUYg5YoxtZi8ehVmltaWhpEGr74lmAZMe8c3PvSji3pwf4
         77hy2d7crgF8bgrIzifcOcA3JL2vD83I/3JhaJjvluazPrGByOsmWHoxIZH359cvxonY
         s1qsGdBbNurdvmXUyZiOMxqRN3YEReJns1qNuLbvsl5vxivl7qOEaut0Zml2T0ujyEsx
         Ra7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729841156; x=1730445956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4g2gos01gcs3ARV9xOeM9xEQeRnKHcL1K/otT/YNFqk=;
        b=CRUH8cs9RucRVU2MrD6KNM+9gjzRUGiiOEg6DzCqDI0WdIeSGvcBuUlGWuYhe7+JHA
         O2+ExPXLKD1hXs7I0YAoqqjHhbs5eVMWaz5SJL5RzQllJvfgn9C7Zde8WjH1SnGrPicw
         MFTtsLlkMUvwzno+RnJsrbNCvBXUGoPKZ0Ci5BteiUX7gbgJ3e0LBWjWlAIwBnGjaX9l
         8t6gAQaiK7ystlgwpfgJkZLFc0YPQwGIkjymCNBtPsxR22k5cXkuqMbi0K53fj/WOaya
         ELtG1T8UTsvwzwLjph/gvzDQaSeV85q7ZwwobnNkcdwCiFmaiZq2uOju2t1X+cybYctY
         QHsg==
X-Forwarded-Encrypted: i=1; AJvYcCXjPR7SV/lhhuNnOGX0LlYr1XoXdIrV1PcnB2AoAmxqIbjBeXVFkUzd92WQjzxJ7yhT7O67HHqGGdsB@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDpfKqCGJhKRfOQdZglDLqhYzIf/DUl/oSVa1/8Qc5WsiUQTJ
	uruRqELRYd2PPfGPfWqoCoMBQTKfXWyFPptxkBYOdMjKMAZgeT4biLeNT5LrjJXw22TM9Cdi1rA
	Ps5dq7Wt6ordfxa/UzhIZRG8GhDEWrNRfZIaBhA==
X-Google-Smtp-Source: AGHT+IHXU/RWVGusZgTS+hnrrCbnABNHUWKcp7Gd9i5eDRQCyJgRfL6gJjAxp02BR0Ho5+hu73aPvO5Z/5YPkljz63Q=
X-Received: by 2002:a05:6512:68d:b0:539:e9b4:7ff6 with SMTP id
 2adb3069b0e04-53b23e8f1b5mr2874194e87.45.1729841155737; Fri, 25 Oct 2024
 00:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018015640.2924794-1-fj5100bi@fujitsu.com>
In-Reply-To: <20241018015640.2924794-1-fj5100bi@fujitsu.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 09:25:44 +0200
Message-ID: <CAMRc=MdsgJOFK-U9pxK2NDjQ=MSCnq1oZtVALvKLwMbuHPrLGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Add ACPI HID for DWAPB GPIO controller on
 Fujitsu MONAKA
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 3:56=E2=80=AFAM Yoshihiro Furudera <fj5100bi@fujits=
u.com> wrote:
>
> This patch enables DWAPB GPIO controller support on Fujitsu MONAKA.
>
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 798235791f70..6113ab1bc8de 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[]=
 =3D {
>         {"HISI0181", GPIO_REG_OFFSET_V1},
>         {"APMC0D07", GPIO_REG_OFFSET_V1},
>         {"APMC0D81", GPIO_REG_OFFSET_V2},
> +       {"FUJI200A", GPIO_REG_OFFSET_V1},
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
> --
> 2.34.1
>

Hoan, can you leave your Ack here, please?

Bart

