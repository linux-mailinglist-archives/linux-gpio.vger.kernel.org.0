Return-Path: <linux-gpio+bounces-1975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CC8229AF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 09:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98C3C1F23D1D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122DD1799A;
	Wed,  3 Jan 2024 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cXI2N51L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D618032
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4b7a3189d47so270380e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 00:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704271590; x=1704876390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr5k1eCQgKhAWxDFtU7XVem7q2d4j2uarLrX3N+6i9U=;
        b=cXI2N51LUGuTQBJHp6Y74+Ol3ZlKYmXxMvKO0N1wSuS92UMxdEuusWcWYdS7vy1mjt
         hcAva6/fZTq4M0VNxvKCpiWPc8WtpgOuVmK3trlLYD98mNdEs+CzigipCgqupGDZ7KM+
         2zfbATHjo56Hc7+bdBfYj+njHnuzkPYWc4JRQcumx+KBtOYxga7kPouEwyh2w64OEkBd
         o9CjKyTbbUX/miPoo+SIF/uD3BqU1LNC180dVhw//K4yOQA+J9QwgBQjA1/LJ6M+SubX
         kl1e0jUT2S7Y2rSeWAvelFyXu7qcxe+ZOhtxeFMbq2jn1EYtIKxI0uAxzLhAlahcL+zz
         5Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704271590; x=1704876390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qr5k1eCQgKhAWxDFtU7XVem7q2d4j2uarLrX3N+6i9U=;
        b=I5UKjP7QDQ3pt19L4MbUcCwlnKWCaqqk22yA1Lt5XZGqhgCGcV24+U7LT4rWU6gr3A
         LHbS/zImAG3xWCooT1jqf5gGjCA7+L/HONsON6IZ7mTS8j9iY4zyM5llYCxzuZtQSRy6
         Izc19M+HhCqlw04Oh1JS9qTRNGUaQPkfbSJvCyEfdTNgNFUEBuZwrqNwyKu00ICjGQTi
         X/GIjwqIk4FUkDDYbepakN90InO33skTvIIKLxLzIJQbqCI3V6d+tTcXqswmOv13TeZv
         Ti18Gxwr0RoKpZjo0dVOS3YO5gPNUTfMf/LHwnAGQgBDyNEjZzBxhEbIqTySK09raeTt
         ElBw==
X-Gm-Message-State: AOJu0YynYcKkM6aP3NZcwAShzxKfesTVV85wXMEpiMcT9EVCeKhAjxd+
	wjMIcfVxx7Mhk4Z40tlGG9cIGvePKrrfSSybFvzh2lhVsl9OJZgk2n7KZEdH
X-Google-Smtp-Source: AGHT+IHFvMjH3y83V2qKVdWyZBi4oAiuOEbmyOb12sNiwT0pCG+8xK3RCh9Ot4VnkhMtc/6pzHdfuZdiQoE6VTioi5g=
X-Received: by 2002:a05:6122:448f:b0:4b7:2ffd:9431 with SMTP id
 cz15-20020a056122448f00b004b72ffd9431mr5277626vkb.33.1704271590349; Wed, 03
 Jan 2024 00:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>
In-Reply-To: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jan 2024 09:46:19 +0100
Message-ID: <CAMRc=MeaD6DQq_xph4H+_c=Mrix-Wgcafkdhh4ByMsFi9A2AwA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] core: fix deselection of output direction
 when edge detection is selected
To: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 3:52=E2=80=AFPM J.A. Bezemer
<j.a.bezemer@opensourcepartners.nl> wrote:
>
> Fix deselection of output direction when edge detection is selected in
> make_kernel_flags(). Use correct flag to perform deselection rather than
> a library enum.
>
> For correct usage, there are no visible side-effects. The wrongly reset
> kernel flags are always zero already.
>
> For incorrect usage of edge detection combined with output direction,
> both output and input directions would have been requested from the
> kernel, causing a confusing error. Such usage will now be sanitized, as
> intended, into a working configuration with only input direction.
>
> Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> ---
>   lib/line-config.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2749a2a..9bf7734 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line=
_settings *settings)
>         case GPIOD_LINE_EDGE_FALLING:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
>                 break;
>         case GPIOD_LINE_EDGE_RISING:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_RISING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
>                 break;
>         case GPIOD_LINE_EDGE_BOTH:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>                           GPIO_V2_LINE_FLAG_EDGE_RISING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
> +               flags &=3D ~GPIO_V2_LINE_FLAG_OUTPUT;
>                 break;
>         default:
>                 break;
> --
> 2.30.2
>
>

This does not apply on top of current master, could you please verify?

Bart

