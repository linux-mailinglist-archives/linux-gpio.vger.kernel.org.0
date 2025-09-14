Return-Path: <linux-gpio+bounces-26108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574AB56963
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 15:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80AEF1896BBE
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C731C7009;
	Sun, 14 Sep 2025 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfX1w5nC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8E227713
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857082; cv=none; b=sReyaYLkVRFqz6Nm1FAKsd5pPgtlNkAOD7zg5u+zYjZRSAQzTcoi5CSbcQCSsQGkdzTva5u6sQNPN05gqjtHBG17rEHsN9KRTzZzcjUeErPLZlILez6H6aGZHD7ma26d5rFV8Srh+yVQJ03XEJvYKWQ2E3G7RH9K7FNJATUAL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857082; c=relaxed/simple;
	bh=lMrcvvqzKpJ+FR5ryIFLNz4rhYK1otrRsaTwc0jJNe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3XHjEuKbdD9VWFH+okomx5VkFwBRmsTaTJL9KsOgvxtYoa6/o6CAWaM//bC8hvQsINkVwWppMJBaMo91zawUos0yfPCWQYgn50MMnTJWMlMkqC0teVH0BumIQqL9durQvuZr9wB3smxjFiIhngRJ4UrMnVVsvE8yyj2whGzBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfX1w5nC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a16441so500233366b.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857079; x=1758461879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMrcvvqzKpJ+FR5ryIFLNz4rhYK1otrRsaTwc0jJNe4=;
        b=AfX1w5nC0IiOLdmFEPtYTDnsSP44DArAeP+nHuTbi9Ylci5s7ryNAwtUd9FZ+84Wbn
         2A354gpuMyTmKQkqfx112dcuas2K9VvTyAhPq205CnuADASaPOoawSx/+D/VPGfYb+ry
         a9X47q+7b3GEjqggUdOeM+/3BoXMmMl7McyMB6qO+EnUeFCoYAh/Foiumr0nOINBxj9S
         MjVR/SBEOFmhkVIQf3Rmk7mg8ehdTNlXfye1s/PAPyOHv/DncKgPQPdd5sudKQDg7Hm6
         M+9Zcm/fbKBZZa4Fyu579UPN47q6+Jl+C+P4lGEDnGhtSNW96nby1jd+XaLs8qXU0Hs7
         u0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857079; x=1758461879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMrcvvqzKpJ+FR5ryIFLNz4rhYK1otrRsaTwc0jJNe4=;
        b=vmFlSMgNg76V/4WSAv8PtoevWyecROsxbAbHDkURQHsgbLCMo8X5gaqqkgCGIsQx9m
         jIpHjn2RrOYQyGC8bdmEoW+Sqnc8TM+XwoyJ/+v2eSorJC+NSsrBEC0XqxQH8XTSgPSU
         sqOvoak8jAPy0hj2gCmPR5JINNY4AawbITqboiC8B+8vPtvqEFt8tTYJ0oqkyWh4UWIw
         kniRdqhFjvlIFjdUArLW1HUufwMQAoVBZsuJCbImeF0aXTgYqYHdjscaDmvep1RGYpWX
         Kpy6l94cevutKIAHmKoHM6+o0+wh9chc7WyCUbhyXWlRiORPfJcnWkVfpM3nWa0KfYbc
         ZwMg==
X-Forwarded-Encrypted: i=1; AJvYcCWopQJVc9/RGvuxQ6tJfkmHlqT3+00lIE8rZepSAWFgBDMQuNwlG+tKKEi8IVwBLqWBuFpHn1wGlwab@vger.kernel.org
X-Gm-Message-State: AOJu0YwUT5N7kE6/+1/WNfXg0j/XiIr4VDzhdYQ+py4Z/joLC/eq7FhN
	xq6P/puUxaBFqxTF072hCwiGRaadAdHz1nxrvTiR0xD9WBcyfC0/azoyGOnS+X8o03ANZO2mRUD
	rA+EEkjBB1+Wb5sOZDcxEEY37j4ZJ8ZI=
X-Gm-Gg: ASbGncvrfDkUQZxgSkJDXg1KmL+Ejxpkc+zhR4gtfrQIoefCu9DAMnRRd5UVSpsvjhQ
	rgsXVu6QXrRT6vfE0dZ+HImjw3Yg5RrBzBIJta6rcZ1y9vYr9H1Y6hQtTby3CfzWt2xbGLdRcWM
	1sJyxluiXjfLwM8yBjH8KCxHjZK5J25oNfpm2+0OQKahNtvtJ8+nk5qyQ3vRh/PwrO2FkdsZhK+
	dfZrSI=
X-Google-Smtp-Source: AGHT+IGfnNEJFC1s5f7JupV03SKAVrOW/DPcZQHZv/iXc507q+L63olUL1PuI8YFDsf1QGeAZ3r9DNlP8wCURNzzApo=
X-Received: by 2002:a17:906:f5a7:b0:b04:58d7:374e with SMTP id
 a640c23a62f3a-b07c35fb4edmr961874966b.31.1757857078731; Sun, 14 Sep 2025
 06:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913184309.81881-1-hansg@kernel.org> <CAHp75VdeNQ4O7-eDjA9otdGeRnzweYhXyvxnpEEAHoestB2=mQ@mail.gmail.com>
In-Reply-To: <CAHp75VdeNQ4O7-eDjA9otdGeRnzweYhXyvxnpEEAHoestB2=mQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Sep 2025 16:37:22 +0300
X-Gm-Features: Ac12FXy8Yo251utOX9pFnsB6hi-zjqCS6_QAoJV0mZdEdAgeeb9uaI3O0BP7XEg
Message-ID: <CAHp75VdrF3L-Po2j_dv1bDV-mnjF5urGPV25ZiZpYq6rt7CagA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Extend software-node support to support
 secondary software-nodes
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 4:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Sep 13, 2025 at 9:43=E2=80=AFPM Hans de Goede <hansg@kernel.org> =
wrote:

...

> the long term one should be in a full
> redesigning of the fwnode concept in the kernel. The limitation of the
> linked list to two sooner or later strikes us. Besides that, the list
> of fwnodes conceptually is not property of the fwnode itself. The
> struct device may have struct list_head swnodes; besides possible
> other users. In particular this also will allow to have OF and ACPI
> nodes along with swnodes. You can say "are you crazy?", but look at
> the DSA development and other interesting PCI devices that are
> basically computers-as-a-card. The floating patch series is to enable
> OF enumeration for the devices on that type of cards even on ACPI
> based platforms. Which make above mentioned use-case not so
> theoretical.

FWIW, that's why I for more than a year require people to use
dev_fwnode() and dev_of_node() (and similar) APIs instead of
dereferencing them directly in order to make less churn in case of the
above ever happens.


--=20
With Best Regards,
Andy Shevchenko

