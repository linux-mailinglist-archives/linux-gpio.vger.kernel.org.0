Return-Path: <linux-gpio+bounces-27070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E604EBD8C72
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C91C19247F7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2432F7468;
	Tue, 14 Oct 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6nK6nN1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E792EA14E
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438033; cv=none; b=qjiVMICjw64JUQ8xZ1GwDCNM1RoBAYismyjJ23tNaqGWQ0cmbd2XKZgN06BXJLcEjt6+p8aw4+QzqY8MvyIy2mdJPXoYO7W3khi6prlCP+1gXqvz1ZOWIpahxOUb3C+1Q0mDaKNvrxu1LNzQlcO5XULXe3enF+ioD228SitIYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438033; c=relaxed/simple;
	bh=QuEinUhar14YF6Y240Ai1C75X6imD/kq72QMKNsJnaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nta6Ddwj+JrwpCcPh3GaZ3tnE3UMiQaKowXOIlGjQ/p2u0az2V4u76JOoo/MbGhz/Iu1D4sOBTS/an8y48eEyl5UhrjxnwOpJ99pqcG1TgCAXXjD2F8LiJZKeX2Cj2LhzSgOvmxUpFKK504ZdsV5LEAICIzNC49nk/YVb4Fbq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6nK6nN1; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7501c24a731so60826437b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760438031; x=1761042831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuEinUhar14YF6Y240Ai1C75X6imD/kq72QMKNsJnaw=;
        b=K6nK6nN1LZvtp0hED3zEFDzNNzywxC7uHu5qIoAYDTMOe2xFKwCCMppI9y2WiakW6z
         t2GFxrxJVJKp5AmXIfQKMwzJVpjEgc2yqkYjXvBziCM37VNwY9oVrntdOZCYIBLKf6Co
         K1JTtw09FIbGrZkzLbB4gi9QXNjiLZwtPjhP6OqGY1YWI1vPM5UPoqQsPqP2cymCjpee
         +Aful/AlBTAerfWQLlN2v1lSsSm0L1MoRvCpyO5v022/6XWUki199KpnMr39xFU0X4hF
         uuRPDsHZbz/FyjuDW3+AuqpCxfW2/z5QVMvu69PmTaetzYkjt2As9VSd+vk5c52vnEpX
         3CCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438031; x=1761042831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuEinUhar14YF6Y240Ai1C75X6imD/kq72QMKNsJnaw=;
        b=Uw3JIQOEZ6r5ev+r1MchYjRVPOHHM6mXhrPelOtXloTIRLWi3iqaI8SHCffVN8O3wt
         eFey+mbkr3YeOwulwsvG78PbE0PagepiqnubIgAd0lJiY0IhZVJeWynR6uXCDMzYAvDC
         l0OxzE3QwXR0IA7DqWp+wQebKsN47lKNzoJ6MpbhxzC+9IR+dt/TSLmQXKXATXBRWQBj
         tWb4gZRDWDjrMU7RwvH4aAhTu062aQOzTqLyc6B/VB9zyfe1WwZqsCGZdo5IPGv8pwB5
         E+u9S1vGN7wgNO1t9JCXQTQqGRKDE36qfTEYBc8JLqCSSbidfLks2Zqc/p2/8NyaoZPH
         BXOg==
X-Forwarded-Encrypted: i=1; AJvYcCW5LdtW3r9afEzrSNESpYSTOhTyFei447Pohje+pWzYBr5tND3rlnO8n2sA5TX3tsAfbLiNio8/wKdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZLScBhsowckCAjXIMHa5pCF5xjpmKXz360skLpHwembSrp76
	niKhuW9MyZxbTrxD9UZjHdxV1OXkDJog/BclxKFzsyFQIoeuUdxX+kCOe7LD4K4lBuYIP90bncw
	calKrDgqPzQLtl0lxcZN11ZsF4WJhsC4Nti/Bhyb0Tg==
X-Gm-Gg: ASbGncsRbzmy6krYstHI6D2NBAVF+/vXXL+lRmfrb5Lw+Vr5mdC5uTMRHKoSpbG5h0i
	9MvHa3yr9guo7BingtzQFRunOuU65d6drIiRRTODeXAiJO3j1UOvBtWezo+d6KdvoTRD91oG4U6
	2CS9/Sx9eTeuqLv3JmwIZes5pDTRDoT+visV787goxh0aKO1ZJMPTmliU4iaYBQg96uMFlXuq7d
	WiKSKsRbXMNMbbASv6OhJPMm4APjoPTtJQdC1lJ
X-Google-Smtp-Source: AGHT+IHeonKC9+QYhOM7VuQykvKPFitUUF6gnFNcpL2LefNyxqXwa4BkJdaKg1KHUyXSH+yyFuP/4//FX0boj6kq7HM=
X-Received: by 2002:a53:b243:0:b0:63b:9347:1a5c with SMTP id
 956f58d0204a3-63ccb9035bcmr14962219d50.40.1760438031225; Tue, 14 Oct 2025
 03:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
 <20251001-unfreeze-ludicrous-9d744548bf65@spud> <20251009-amendable-trimming-da31551d730b@spud>
 <CACRpkdYssH8zObJTUH2VVB7FrVFmJUd+Ea7etTGbicQgkuU=CA@mail.gmail.com> <20251013-prune-deflector-b10b84425a33@spud>
In-Reply-To: <20251013-prune-deflector-b10b84425a33@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:33:36 +0200
X-Gm-Features: AS18NWDV62aIljpFKFrK57lWd5X1J4MSy0Hiz2Im8y-KTaCpfNHGRNY7xZpNzks
Message-ID: <CACRpkdaat_pNJ=_r51JuXXggDtmRrfjmN1AQffJVEA29yoojKg@mail.gmail.com>
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:55=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

[me]
> > entanglement of the GPIO function with another function, then
> > there is the recent patch from Bartosz in commit
> > 11aa02d6a9c222260490f952d041dec6d7f16a92
> > which makes it possible to give the pin control framework
> > an awareness of what a GPIO function is by reading hardware
> > properties, and that it is sometimes separate from other functions.
>
> That is unrelated, but interesting. What I don't really understand from
> the commit message itself is whether this is useful if the pinctrl
> driver is not also acting as a gpiochip driver. In my case, the pinctrl
> hardware is not capable of doing anything more than muxing functions,
> and the gpio function I talk about means routing a "real" gpio
> controller's IO to the pins controlled by the driver I am talking about.
> The 2 in "gpio 2" refers to the specific controller.
> The rest of that thread makes it seem like this is intended for some
> qcom devices where the pinctrl hardware is also a gpiochip.

It's useful if you want to use the .strict setting on the pin
controller and implement the shortcut GPIO enablement functions
such as .gpio_request_enable, .gpio_disable_free
and .gpio_set_direction.

These are often preferred when using the pin control driver
as a "back-end" for a GPIO "front-end".

Yours,
Linus Walleij

