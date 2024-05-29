Return-Path: <linux-gpio+bounces-6808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD28D31AA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 10:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E5F11F26BC8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 08:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E810168C2B;
	Wed, 29 May 2024 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RohltbjG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E47347D
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971917; cv=none; b=iVqXVW9el9tjKz7kbdh4yWf6GKaAfm3+bUdXOxaSFeYGn67EBe/AOTC8lQ+yCgQPJ2+WTdPV7LFhgMRM62Ej6OMf0/Yuhvbv2ifM/odaodbP5R0lOL5Z1CqEDjFqeCQsx7iA5iVLACBCh4uDNiYq2k5jzjMeAlc3DPA35OZRQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971917; c=relaxed/simple;
	bh=W94EXWPFJ9q9UNIyDf4SkokQQRNWUNrNd3sGFspwBrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdX8R4vi7Vd/hMD9DUWpN3yqFvi6vcaWdDEmJz3JreRsEE4p3K4ZSSFA+ov5oM1mFOkbGGmzzS3UCOq0VUVc3x1eR3GcQittOjueP87nX4R3CWZ6jJps9186nN0yHP1a8NujWQxDyNnk1yqo2y2FT83nEN1pwyOLWL4Md1j9Hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RohltbjG; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62c5fd61d2bso4054757b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716971914; x=1717576714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfxCTrRrYhs+zH3S+r6FD6/9NwKyWS5rNPOaAhWZ11Q=;
        b=RohltbjGHWskRC34ddkEGjirCYmuy5pzcJreKnpaBNjsnXy1DMVfkO7PHYotpf0ygu
         dA/hZBhxrFdjZdUyCv7qg/rvAmK4yGkE5W8t1Hrx6cnmReaoem7cZN3m10ljVymJom3I
         OMlrU7jlQNmDjKqzmVJsNFbpjCuk60VzM68tXHd5EbfkKlQSXuK70XVER4kvnYwbk4nU
         qQatTgsO8+GD6dqBMKunE5RaMXiKbUpUZ6EHW7EJpbGFJxvv8r6JWbAoowecnfdY2PpD
         jgzTGZWV2750xAKP9TnX7FoNR+4u+amxufRhQMLlruOz6yTs9FVXglZB/ZteJ6bbpPYu
         wL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971914; x=1717576714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfxCTrRrYhs+zH3S+r6FD6/9NwKyWS5rNPOaAhWZ11Q=;
        b=qNd2IiLlgrVVR8dtkMCnLiBswsKh6CG5Ptw6b8XahWLfmMbx25cu5oV4qR6BTayvg1
         x96+aotIva+EKTSA2oJtBP9ZQvg8MN+MMvT806I1BuIw88HYV9aucDe3mErpc0OjlHij
         e21WyaQZ/WNdwcePsIQYmu2i0CCaa9u1g+HOEx/l2NbiYLkkFP+tU8B6hJ3ZqG9mJNwX
         ySoth/9q/lGEm2wCIAoyk+4VWGt7M3/jv0jubR/s7LD3y0kL9ZGHatn6fofBEPNwn5e6
         75ZdzAoPARYWKg675nadNLXwq7RrEPTYucoH8kKm8DHgZsby45JiLAcz3j/DiaisPFpa
         tvAg==
X-Forwarded-Encrypted: i=1; AJvYcCWwZxc9So9BsZVvnOYWp4DQ+d+245uz9eynf6YC01Rs/G6pJgEfKIVqe7tSj4TdaR4eI3zbEbQK4lv0zCDllXju+XFHyf05RtkV+g==
X-Gm-Message-State: AOJu0Yw7gG/DMHGCDpN9gc7/EVf26ndhgauZucahIgdNBKBCzfoUj5to
	XC4LKn53MucQoQ03/A4e5hZH394irbhkvGXuRRxZgLoSSz3v4iU3USMznVR4rBC1M1jwCZ0Aa9a
	ksFa9TYFTcq1jpisDiTP6mnxF9YpxCUKawHc/sw==
X-Google-Smtp-Source: AGHT+IE1L3rfPGCLoTSF1U8u6pMaFUTuNBhiX5mIr9Mk1JgZ59CkSKB1rpS3GkWmoGbfmxnz12oXzgSsF9H6xHUSkJo=
X-Received: by 2002:a25:107:0:b0:de6:107b:6557 with SMTP id
 3f1490d57ef6-df77218a0d0mr14340358276.27.1716971914233; Wed, 29 May 2024
 01:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev> <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
 <51d984f5-896e-469f-914d-2c902be91748@linux.dev>
In-Reply-To: <51d984f5-896e-469f-914d-2c902be91748@linux.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 10:38:21 +0200
Message-ID: <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 4:28=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:

> Well, perhaps you should have reviewed the original driver more
> closely.

Do you want to push me down and increase my work related
stress? Because that is the effect of such statements.

It looks like criticism of me as a person, so explain yourself.

Writing this kind of things looks to me like some kind of abusive way
to express your desire and that is what burns maintainers out, so
if that is what you are doing, stop doing that, adjust your behaviour
and focus on technical issues.

> > If you want to mux individual pins instead of groups and functions, by
> > all means, but please do not mix the two approaches in the same
> > driver, I'm just trying to save Xilinx from themselves here.
>
> I see no point in creating thousands of groups

Please share your calculations for figures like "thousands".

In my experience, groups are usually in the tens, perhaps
hundreds, physically restricted by the number of pins
underneath a BGA. A Micro-FCBGA has 479 balls and many
are GND and power, so that sets a ballpark figure.

> for every combination of pin musings

It is clear from the documentation that the point if the pinmux
groups and pins are not to present all possible options (known as
a "phone exchange" solution) but those that are used in practice,
i.e. these representing real world use cases. See below.

> when we could just switch to the solution in this (or v2 of)
> patch. For compatibility we cannot be rid of the old situation, but we
> can at least fix it. There is no technical problem with them coexisting.

Historically there are  ~2 camps:

- One camp want to use groups and
functions to combine pins in groups with functions to form usecases.

In some cases (such as pinctrl-gemini.c or the very latest
pinctrl-scmi.c merged for v6.10) this reflects how the hardware
actually looks: it does not make individual pins available for muxing,
but you poke bits or send messages to change entire
groups-to-function mappings, so it is necessary for some hardware.

So when you write that "groups are a Linux-only concept" this
is because you probably haven't seen this part of the world.
Groups exist in hardware, and in the SCMI specification.

There are systems with individual control of the muxing
of every pin, such that e.g. every pin has a muxing register.

These are again not really phone exchanges: I am yet to see
a system where any function can be mapped to any pin. These
just do not exist. What exists in practice is that each pin can be
mapped to 2-4 functions, in extreme cases some more. Often
these functions are mapped to adjacent pins, and the "chessboard"
picture in the documentation for the subsystem reflects this.

For this reason, it is often helpful for driver writers to group
adjacent pins into groups, so an iterator can walk over the
pins and poke their registers in order, instead of treating each
pin as a unique entity.

- Then there is the camp that just by habit *want* to control
each pin individually. The extreme example is pinctrl-single.c
which is named like such because each pin is controlled by
a single register. TI wanted this solution mainly because their
hardware wasn't described in manuals, but in other HW
description files, and they needed to process large volumes
of data into DT-form.

I didn't like this solution initially because it makes it hard for
people without datasheets to understand what is going on.
But I was convinced to let this coexist with the group and function
mapping, which is fine: maybe one size doesn't fit all.

i.MX and others also do this approach but with large sets of
defines in the <dt-bindings/*> files.

Combining these two approaches is not something I recommend.

Yours,
Linus Walleij

