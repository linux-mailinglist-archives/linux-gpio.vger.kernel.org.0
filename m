Return-Path: <linux-gpio+bounces-2701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B625F84078D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 14:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7459F28AFF4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76436657CC;
	Mon, 29 Jan 2024 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+cDND//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C336651AF
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536538; cv=none; b=qR6lvTnvavwGdIy1pKmJq/oqXhzrYMRHBYx+rrtnz0m80Jm2nXlSJxHHClezhxLH0nql2BudlcC7FrPY+J1WBALilZ4B1XMCZ4nRxgHVq5bVd5PnKgSKPply8WHBLqD1H5va+oKCl1wYUHGPLzjXMcqLWO9u8AliqvDH81UwdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536538; c=relaxed/simple;
	bh=g5hnEmLuBTV9IeAPhqC/fOJTrs0WTAgexL990thdjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRLGWdji0Tzsv6uEyMmKw+4VOdDnaUBlYTC8TSsLVDlylKmpOQZuNi7+PukYCJN6vxoCF6EoIg/QTPBdPH2KxMJY7Sk4ayRE9+ofFfHCVUqNY1ZKH8y23/ksz3YjWFuj3ERtv1umYIXNJ5EobOyzM80dlsqD6y4iKqP/GFL0LtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+cDND//; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ffcb478512so18945167b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 05:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706536535; x=1707141335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5hnEmLuBTV9IeAPhqC/fOJTrs0WTAgexL990thdjRk=;
        b=D+cDND//IEAtDfGdtJoBR/k2/mIOIBWz5EBUecBiYYtu5ieWXQKy9YTTBhCnsip0yI
         ImC37o6dFcMk4VkUwKGhPPi608P8JfBGc8pzchlVH4gklpidIFQhqXyufQONutRPNH7Q
         MvpRZocAzLjvnf35m3/UOr3B3Bnbvq0oHb2e/sWOAbgAJaA80xlFDFHU7QyPBrCVrP10
         Q85xr9i0pwlxQdVCVzhHj29N49Ojac/1LmwGqVPtCE/F6kqbHabtIVlCQZW3+iy1iJlp
         u9HF/dlHzJBFAoa0jLX5TdJsCxgxOmx/2K0ZGijAf2lfgUt6NGq7KKgla2IRP9RHY9Wu
         VB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536535; x=1707141335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5hnEmLuBTV9IeAPhqC/fOJTrs0WTAgexL990thdjRk=;
        b=sJA5STJPOteGtRSH5MIQmn67msMoAFnuSO1E9u1O3xE9zlh6KqgjkDnsrcZyGJzzbe
         lJ6HJbPNI0rSMrS6Y8u6/yaTcWZd92w9PyOVSiRAhjUoGADrIXp8B0Okkyg7l4KmnaXH
         lpIL1pwV84jhCcMXfD8vTPP8WBy6FziHpsLBDhEohQ16VaXgxmVzbfmKhgt9L89QF7YK
         zhWxYcT84INRpN0g8B3N1EYUvj6fEjmS+DqFd4czLDU8Zy4GeBu14DrSqFAilXf0LeAg
         K++AVDaT9KWe3EHFSbu6t0wlORVcSuiiGroIXtbzakPjV9guGCsjHsJ8n/27d6oFreaJ
         OnIQ==
X-Gm-Message-State: AOJu0Yy34xRA7fAf9x0NZyIFUIo42fmjtvYWUvi955ytmzUCzV70o/SW
	zL2I2vr/rRZmGscxoVzv2QwgvBlzM7KODN3pjiqwUSTLr7MkaMh1fEUKxlvStL0d7L2Q4oXUBIG
	ZwYx2Fldqaw3Te2xcNOQc9QiRO9mmJnEmt6zVHw==
X-Google-Smtp-Source: AGHT+IEv6CE0f/Y1NjvVVdx6TknhydnToue5+SN9kI2iG5bQIL7oCxiClJdrtrn4bl1a2DbnY4glwWflCywtSdGlGyQ=
X-Received: by 2002:a81:b14a:0:b0:603:cb87:3272 with SMTP id
 p71-20020a81b14a000000b00603cb873272mr991325ywh.23.1706536535088; Mon, 29 Jan
 2024 05:55:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240128163630.104725-1-wahrenst@gmx.net> <20240128163630.104725-3-wahrenst@gmx.net>
 <8f525770-7e39-4bf1-9ad3-803826ffbb1e@kernel.org>
In-Reply-To: <8f525770-7e39-4bf1-9ad3-803826ffbb1e@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jan 2024 14:55:23 +0100
Message-ID: <CACRpkdZ=wikdPVtC0KnOX7ZAg2obwALqnKARxS3uyTmhKeCuxw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] pwm: Add GPIO PWM driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
	Philip Howard <phil@gadgetoid.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Vincent Whitchurch <vincent.whitchurch@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 10:40=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 28/01/2024 17:36, Stefan Wahren wrote:

> > +MODULE_ALIAS("platform:pwm-gpio");
>
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.

I was under the impression that MODULE_ALIAS
was something people put in to make platforms using
udev behave better by default, e.g. autoprobing these
devices better (on coldplug for "platform:*").

For example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D4f46d6e7e5ffbce0ee1d1a80767fdf45e56cc863

But I might have got it all wrong :/

Yours,
Linus Walleij

