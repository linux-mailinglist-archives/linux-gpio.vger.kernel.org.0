Return-Path: <linux-gpio+bounces-23622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E45B0D9B1
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 14:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D5A188705D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 12:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A72E03FB;
	Tue, 22 Jul 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z25gaQon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90423ED75
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187615; cv=none; b=Vo++eexK/04qFfBBIdtC3dP/dNVBlnkN9GQxAGUrRUJidOKV+a3wB4XNsHEzL8THFg2FaD2elIRdL7rS9fyKwYjzCA7ORuyzP8ADCy/S5Mg9Gp+L6CBi1XGypBkKTvJxB8lHVSi2dugsvqmugATS3SRE+x7O6tA4ibYxHmFK1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187615; c=relaxed/simple;
	bh=JQAmUAgM9/RaH27IaFC9XF/IxHkWyVVH3kpCZLC5sKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNeM29Hsk4NEgjNvXmIh4R4dtYM9Sg6mIqvvloE9F49Ckwl7bZk3AfttFhk6RnbR5CjjvIQ+og+XcZx6DV6hZDBsJNwxb9hCikUU5MQQah187H6pqO3eq0gU2wIVKKgpLfNCSO6jNNWc3pAFzz2X6zncOFRMSvk8vhag9OkrSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z25gaQon; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55a27e6da1cso4574830e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753187612; x=1753792412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+GKZahGmDdPv5L7LZQzaZ8ms1eU9iPtW5fE1sZ1rk4=;
        b=Z25gaQonh2BcW45vaEJQp/HWqnl1+hy5QQwAsr4LcO7R1jD3F0lf9TJ9s8q3O0xoet
         TfjqgSewMU3zg2g+PeW7xYdINxU5IKTkOIMOpfXJcnxAaNsTkcuwwGPhxqzhahmhXp+1
         JN/NqyWtZnjcbRf5pud3bGg1Tp7jTN0QPHFRrVnHZ4lZ0yyhFBL7MjvYDqfQsYjrHPKO
         jNoGjeEVgZUzuIItXUvk4Ghn82w+1VE1JntmAbO/BFMtgCeXpq36CbJXObzTnVkI6bFf
         fFjSsYFy5IQvPm5ezJWhvKMYjtil04NRq8eajsJsksb23Dk7z7/mTHS8VtavSClNICTI
         3Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187612; x=1753792412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+GKZahGmDdPv5L7LZQzaZ8ms1eU9iPtW5fE1sZ1rk4=;
        b=U07H/VDchREZdXhd0ln6F2pHqrB9b9t+uhHlEH8zYHn8DyySR9eTgVEDd/dKb5ki4r
         iLSKyctOd5S5cFDvpUP76I8WolJwjU31NvA6x03Cw8IhjiiUD0seIipAHlxU6SeBe2jW
         ShzjPHgU5eo/ojFfiqBC/v2YiHFMb4Lh6LcH95ACTxx0KnrwF5c3WK05t+4IbWwTI+79
         py6i63GC7j9tvbKXOFI8skJJp4+1b5IdoCCwEAja50dxZ5l5Nij/odBY6o49UL89tisO
         6jdS8WkoZrYs1MFQUuT8U1E/mxRftH52yfAWfGgLpmwFkZ1mFRcs44vK8W0nxJz+JnBI
         j2hg==
X-Forwarded-Encrypted: i=1; AJvYcCX7/i5WS57OLMsNP5lVHzal5YD9FpLlAx0WqaHMocxgppvVcQW4yI9AnsI7gfdJbADY+N2+u8gtQXEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrD8bMS6LXN4+x00x/Dzqjxb1kc7ALA0ISiwZ9t3vRhL+vr0n
	E6hDdic8pf58hDnuFWg+fbO+6S357jHWJz17vpD84wwZBKnUKaMJv9gYaFzYOvpAtbkd/+N9Skv
	bmX0M2KBSCl0tfVef9DW6Bta6mqxlsln42bXrrlGpow==
X-Gm-Gg: ASbGncsdUZo2PU3HqQxJW4bC+8wVx8g1oxlJP3aP2lhC5MdhBbBKLrA069qrRhrWP7B
	IwhXn05Z84wUOEzrGAj86i/a/sQmjEzCB4aKxe74Lve+Zi8Iwo8hN8ZISEbJn+VAtFYoUJLt/Rx
	f/azk5DIed5CSIcFYhSf3frIUfpbH6QEdN7rus4ExCaYKM2ZW4F2DlP++yBo5Jewq9tgNPSyG+D
	ennqEmEdRgwSPOd/kI8IiZG8jo1IwTmoICmBw==
X-Google-Smtp-Source: AGHT+IE4NLh74+eaL28wuve2GVp6Fz+dzUpqyQgftU5RDfIQz6VE0xFsh7GIWHtxc9eDY44fnzPlyDiXLFQXZa1zK+k=
X-Received: by 2002:a05:651c:e13:b0:32a:6e20:7cdb with SMTP id
 38308e7fff4ca-3308f526f69mr38693341fa.17.1753187611451; Tue, 22 Jul 2025
 05:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250721233146.962225-1-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Jul 2025 14:33:20 +0200
X-Gm-Features: Ac12FXw8rQB0btGgQIdOuuluV0bKj5UY1CC8pTxt_PxLMJg3hptyK0eG64L8UIU
Message-ID: <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	jcormier@criticallink.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 1:32=E2=80=AFAM Shree Ramamoorthy <s-ramamoorthy@ti=
.com> wrote:
>
> The related MFD series was integrated in mainline during 6.15 cycle [0].
>
> TPS65214 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65214 and restructures the existing driver to support multiple devices=
.
>
> TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
> compatible string is assigned to two devices in the TPS65219 MFD driver.
> No additional support is required in the GPIO driver for TPS65215.
>
> - TPS65214 has 1 GPIO & 1 GPO, whereas TPS65219/TPS65215 both have 1 GPIO=
 &
>   2 GPOs.
> - TPS65214' GPIO direction can be changed with register GENERAL_CONFIG an=
d
>   bit GPIO_CONFIG during device operation.
> - TPS65219's MULTI_DEVICE_ENABLE bit in register MFP_1_CFG maps to
>   TPS65214's GPIO_VSEL_CONFIG bit.
>
> TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
>
> Tested on Jon Cormier's AM62x platform with TPS65219.
> GPIO offsets remained consistent and functional.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
> ---

This doesn't apply on top of my gpio/for-next branch. Do you think you
can quickly submit another iteration rebased on top of it?

Bartosz

