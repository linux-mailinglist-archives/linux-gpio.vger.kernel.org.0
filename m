Return-Path: <linux-gpio+bounces-18761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0548A87970
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 09:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C456F168C86
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 07:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B862580F4;
	Mon, 14 Apr 2025 07:52:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98F539A;
	Mon, 14 Apr 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617169; cv=none; b=bq3onvop6PxehCsb/ENeheZcOOana7Hz0OL64HpUlLm+eVHRhmivCF6A/hmYqUr1JDzJ9pL8Tt66CunspTEsAeQtSQ1lgehOU4yJN5/GBbT4cM+LjkoCDDJ9aas970aT+EotVIXSJ1AT5vW5jQ9EneCf/9IbVMqToj7a97XEHLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617169; c=relaxed/simple;
	bh=nquDgEh5RnVpQx40oEhXtIB02iZOKReaSjU2Tt2wBmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJfhMGsXOYUotaFLMZMuXq+jPEuy33AoCNFbmZfZgELPOHlBHN+N383GzMhbcPvT+n10XFWm1/gzSLiZ5NYW79DMd5GNneMRniqJm5F8liGu9NxVK01ylof9I2roLfavlVNsosiWsZwV6cMdm9vS4nE5N8I1ETr31g8SFugOvg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524038ba657so4021192e0c.0;
        Mon, 14 Apr 2025 00:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617165; x=1745221965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoumkQ8dLgCbW6zBj87ypAA+R7IZgKsFVu4nfGo0KZg=;
        b=eeIH8D71C6OiLbNyaZS9owgdpAvHEDnRaOdPd3ecq+qxM87OlnfrWO/cIknuwofRU5
         5Z/NcaIK+7leu4KoK0/YPgpa36c57imwjOhgabz5T/iRuoYxl4xz2JfP56Ihl8T206W5
         oZPtR4Dw5f7AMcYiLncT0LBGMJtB0MSEqq4Z7LOfDHkGKX1neCTz2Uwurz7y2XFO0R+m
         ZLQGvPefUqPTrSY/ybGTGUTt9a4Z6yG4tR4810pGd6XsxNANi147w9XurfnVoj8Q+xxN
         DVKKeKRrHLos/lSrhwINKg424MmY/rzBFOUSb2IA4nhurksdC2re4/po+ZO6RW1S3KQF
         Bxrw==
X-Forwarded-Encrypted: i=1; AJvYcCUazBt/QEr9RlqxE29dOsfa8gjIM+Yqmq0vtifbOUiVLEPQ3ShFhcvzsRGUSipIwvA9zhA8Hi0N6dwG@vger.kernel.org, AJvYcCX/Ul4wwY7fP0N2dISJqUEKx4Qxdgohs/fiqU1geuIbNt4vcYlDyHeVRnzSWng6OZEp5k0V/EHyLmLLu1vN@vger.kernel.org
X-Gm-Message-State: AOJu0YzMD8N5bPusn5nP19GfOt/K6Mhe7GHg1a6NAmeaCO/WjfDhl7c9
	yyvKy3AR9v/p4LUsnxl9WmrIwHDEI9+e+Gt9anmteeWdp3f+Wk3sdeQ4g+RP
X-Gm-Gg: ASbGnctGSd6vB/Ji/fBtG3rIDFVBN3CWZ79k8yFAVdZhUyP715HRh1ADmsTfMdB/3Pt
	JtGbY7NSjx0RmHN+p47x7AYobbUafo6mHZebp+ZxuwpOn7Asac9zetNZr2WMzPPRml6AI9k7vff
	/NgjS7QFKiMA9WY/xuMnfzlLGQTm1q7CQEkE07EGvR0r+PmgIxq/4hoh4TcxjakWpeKWkbbLKnp
	lTcQRBVlJ/xl47YpjQpDvq/CFDgooFmV8cYFfyT/S9oIb+5MkU1ZqfG8ShnyxZDIFNm+oRFHZta
	YII1N7UHGDmG7zb0ngI/B3G30M/OSnENkzIz4wX8yCM2Mpn/vUiJf3cX+CA46taWhuEYRAQzse+
	57wo=
X-Google-Smtp-Source: AGHT+IG2yhm9gnUhxm3YW8SMgAimqRBWxNu5pHPW8xM20mW3D4LpQfAmc2dt0W4qBfmjGjQsOGBWXw==
X-Received: by 2002:a05:6122:318f:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-527c2d2a282mr7786125e0c.0.1744617165502;
        Mon, 14 Apr 2025 00:52:45 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cdf8sm2122963e0c.3.2025.04.14.00.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:52:45 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d30c329f2so3966469241.0;
        Mon, 14 Apr 2025 00:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaosL3MBIANXz/N3kys6NkGK1/JA0QlYiE+TSTddkE10zXKhFZ2/50lfDgoa3HNJ8EzJ9/BDN6T+8N@vger.kernel.org, AJvYcCWH/XC6AvSQUJOUQz+9JXc2guZzVgK2OJB8Pe7GUZJI4Yq1arQ+6/X5U6b7KzLTNClniaAMRXxStPMAQLaf@vger.kernel.org
X-Received: by 2002:a67:bc0b:0:b0:4c2:fccb:a647 with SMTP id
 ada2fe7eead31-4c9d3eac9b8mr11057852137.5.1744617165139; Mon, 14 Apr 2025
 00:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744452787.git.dan.carpenter@linaro.org> <30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org>
In-Reply-To: <30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 09:52:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVo4hPExXtLf9UpFvqxX6RF4RJKgO64JpRVWtwwgqZAg@mail.gmail.com>
X-Gm-Features: ATxdqUFL5j5FwdvCyWmzMHa5uv-jItExKzidxRmFV3hcvZ6ES-ON3sa-dq5nxLo
Message-ID: <CAMuHMdVVo4hPExXtLf9UpFvqxX6RF4RJKgO64JpRVWtwwgqZAg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: aggregator: fix "_sysfs" prefix check in gpio_aggregator_make_group()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Koichiro Den <koichiro.den@canonical.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Sat, 12 Apr 2025 at 12:15, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> This code is intended to reject strings that start with "_sysfs" but the
> strcmp() limit is wrong so checks the whole string instead of the prefix.
>
> Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -1016,7 +1016,7 @@ gpio_aggregator_make_group(struct config_group *group, const char *name)
>          * for devices create via legacy sysfs interface.
>          */
>         if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
> -                   sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
> +                   sizeof(AGGREGATOR_LEGACY_PREFIX) - 1) == 0)

Or perhaps just strlen()? The compiler should optimize that to a constant, too.

>                 return ERR_PTR(-EINVAL);
>
>         /* arg space is unneeded */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

