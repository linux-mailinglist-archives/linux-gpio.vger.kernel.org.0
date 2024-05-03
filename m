Return-Path: <linux-gpio+bounces-6038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C178BA8A8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 10:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C72E2831BA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0960148FF8;
	Fri,  3 May 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlNS2NDp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24564148840
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724722; cv=none; b=g/1QFedoQzzwNKckFwda+AL30rscyoGiZbseAzaxeSZk16kx06wL3ZKzDtjKGrY0VsnXeysLWTWH8kaGKMDNezc40PyRMFfw7FRs4KM3UhLytSybgnFFnzvillsw9bQbrsm4UBdhgAbzWwsvm6hjo2lI9J/eD2jwjmMu//b3mzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724722; c=relaxed/simple;
	bh=cVP7B3sF120rjkDhDq/OGXc+zfN6c9JvSfwlIiJpnnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCACnjy9TKqP59xizs5tqi1LE8r6euSQcri6zhGQ1sisu1ldOCchiJXZvo/VpcSDvMXNOUTF7KmPmKHZ5ZRDScbYAX9J4F9LhFbsInk53OJRhIdeTAYtQx+FJ5vC8GUyC3V4OjtmV6jB9MwdAIildWrBMQ2CP80omiCINqbKRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlNS2NDp; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de604ca3cfcso4962285276.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714724720; x=1715329520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bchtsFZa231WDwhCK43w8WElucPGcRMAZVNIRVgrxXM=;
        b=xlNS2NDpDYmkSx3KWC3GG/+VkkrMCcKsjTpmGoC3Dc43cLgC8nrahSUP0IyizRBZCO
         8NTdJt4oMcMYyqhO6vfSrXW2wgYECtQ1R82I3HCFvRwMGO/IL1k45dxHAiakWpoZAS26
         Hd/chf/tmrpsVKM0ItUnHFDGMLGiPpvDQiZDIYrAdgVamwMuAThsWdOLDKk4sXwFP8+F
         fq8SXbXO2ZKFdB55WxsvUex4R6do6DhoJ9raTLrKlF4srJcbAVkuKAmBvva4TrPqsZp1
         noKNhcncfm390iCY8HRA6LKhHMhJ5cXEK2VZ78UzCRrH4tDAyixajOcngDV091NAUfIp
         C5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714724720; x=1715329520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bchtsFZa231WDwhCK43w8WElucPGcRMAZVNIRVgrxXM=;
        b=PnwN5r4knjk16mC0o6uK4OqLR0Z+MhUybRFcPtAcbSuDXZ6YNWBgnD/OpUcwH+EcM3
         hDbJuk4qvTzWv5KxdtQhHIjz0zCcc/6MOxpfqFwCR/jebMwMxK5I3ah5/NJ55MHi8+w5
         Ytk+Mnu2aDBRDdQjDk23k5BKuhHwK26N89tHdMlSfAnNQaFFDbpvaQkzAoB/yYdcBE3y
         ZoCKuetI2My57UzWYzxV66LqoGyxCIRJEemlVE0QSpl6/f3y13CI1VJSB4rDjXq3a1wl
         5IQcawU9RoEuVl2IsGiNJS081Fgd5mbTOAd4leNZw4hcQ3ap2W1SFlhq4zmumU/4UAFy
         idIg==
X-Forwarded-Encrypted: i=1; AJvYcCVIiM3lRfdOGrJ1C9JII6Z4HdrjRIsxnWuOssb31DqMJbnR6yGXbdCULCucDgqL0T3R2nRtDLiGXeMbENFru/TygEF0pAGqwHYolg==
X-Gm-Message-State: AOJu0YxUd34Hkw4xKqhB1l37OGHOrkdTkL7goxnyfnltUnMubk8W0jtU
	AY/yk2fb1s2IY+HkzFtuXv/bDYCpz9Qj86IJ5fZEL/7feBWqfShdoALCRf56v63pUj4oRxEA00X
	62dboyscfAvTKiABCcZdcbHfPVFU0+h01WDmKbQ==
X-Google-Smtp-Source: AGHT+IGOmgFRI3dij98vcr3a8JChYiD6KDG7uUhnFKFgBJEsL3f05wJE75Q8PObsl35X7cBGrSk31Q6zOpRlRE2IV2w=
X-Received: by 2002:a05:6902:1343:b0:dc6:e4f8:7e22 with SMTP id
 g3-20020a056902134300b00dc6e4f87e22mr2195573ybu.62.1714724720155; Fri, 03 May
 2024 01:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424185039.1707812-1-opendmb@gmail.com> <20240424185039.1707812-3-opendmb@gmail.com>
In-Reply-To: <20240424185039.1707812-3-opendmb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 10:25:08 +0200
Message-ID: <CACRpkda4v6Nu8V3MVamDpfs4qnc89e8Vd8fSyaNsqJQ40GQqZg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: of: support gpio-ranges for multiple gpiochip devices
To: Doug Berger <opendmb@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dough,

thanks for your patch!

I'm a bit confused here:

On Wed, Apr 24, 2024 at 8:51=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:


> +               /* Ignore ranges outside of this GPIO chip */
> +               if (pinspec.args[0] >=3D (chip->offset + chip->ngpio))
> +                       continue;
> +               if (pinspec.args[0] + pinspec.args[2] <=3D chip->offset)
> +                       continue;

Here pinspec.args[0] and [2] comes directly from the device tree.

The documentation in Documentation/devicetree/bindings/gpio/gpio.txt
says:

> 2.2) Ordinary (numerical) GPIO ranges
> -------------------------------------
>
> It is useful to represent which GPIOs correspond to which pins on which p=
in
> controllers. The gpio-ranges property described below represents this wit=
h
> a discrete set of ranges mapping pins from the pin controller local numbe=
r space
> to pins in the GPIO controller local number space.
>
> The format is: <[pin controller phandle], [GPIO controller offset],
>                 [pin controller offset], [number of pins]>;
>
> The GPIO controller offset pertains to the GPIO controller node containin=
g the
> range definition.

So I do not understand how pinspec[0] and [2] can ever be compared
to something involving chip->offset which is a Linux-specific offset.

It rather looks like you are trying to accomodate the Linux numberspace
in the ranges, which it was explicitly designed to avoid.

I just don't get it.

So NACK until I understand what is going on here.

Yours,
Linus Walleij

