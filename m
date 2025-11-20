Return-Path: <linux-gpio+bounces-28932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A52C76971
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 00:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC6504E281D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 23:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C415B2F6180;
	Thu, 20 Nov 2025 23:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cX6PRUJ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9A1E9905
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680799; cv=none; b=UaH7t2Ui3vZrypFEFc1Jz+TG/rgYNXnqy8jzzGDnmGFpXW58oRjC3IrqSVlntVGBHSsIq+sjXX/5YarkQ4SdKs1ecTW21Vh5axX0M0sFsDIo9DqkpfgLAgmqI/qbkIDHJNVX6diEbbdM9a+QECemDXJlZUxoCmS0GXhjoYJ60HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680799; c=relaxed/simple;
	bh=paW2rB+N/0S41beg0PnQCaYZ9pvCNYHWjXX/8qJOlxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukyR+ygj2OMoOWlolWeaxexEhqgvmsfHUeqa5Hseac0dMJ378Dig4ciNZHMIp2q4CFSLMgPdd4a/MAfA4g1l0YaOXi7T4V7oYX+ofW2vV6I9zrQj9ts4/u2BtyCg0FqBJAl3gbCdsDzJ5fDwoHp3r6cUPJJgegcEXJEVoncpyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cX6PRUJ5; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-787eb2d8663so23251967b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 15:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763680797; x=1764285597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paW2rB+N/0S41beg0PnQCaYZ9pvCNYHWjXX/8qJOlxo=;
        b=cX6PRUJ5kolANHkSqtamhq4DOHHhEGS6Yu1TAeL2Fusfdr0DJlru1od+7ZINMQ2Aad
         Z0Z+TZ/D464gfGjHFuQmOv239/PPlwkTm7IpctCtEIn1xosqo++1V9XeXp6tT5GRc39m
         OdH+IpdUt/kHQ8EK1FdoVzPLdkmEdhhr3nMTIHuwVfbJgIYOJncX1vllp0Rivt10wwIP
         V+82Loy/tnoBO2WID/z4JeIwEg96GUKBY4FTix4Fn4vOHaWH3XGu2b4foEH3owMxLFlH
         h+r2zLgHWs/lhRLwKqZvJ4LzFBv3nGpD50bumQgR9GDXo9qhpFMNbbh7fA4ai2W3UkpU
         9BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680797; x=1764285597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=paW2rB+N/0S41beg0PnQCaYZ9pvCNYHWjXX/8qJOlxo=;
        b=YsMFROzU17X7Lx0EWQOry7olEo/U9hXovwt3iLW7RuDRd31gHRTEGZ8ZGgbPNzCE68
         jET0U/supDZa0eG720PPaCo8aPxs1Hr/wi1mLDM8KiQAFVLh1Eqk4+cs4/Jh44AO2Men
         uyaesM18HNUUdKMS16YZtiBG/OXWWZGsfNr37On0yWAmnOL5SNQfs1EpUskk1wuO23xz
         Sxy9/OCTllYim2cDauAsJW/P1oWFvJGX4f0KJwekV7SwcJfKUozDF65ZdIdZDK2oDoPc
         S3BxUlrIbPaufLbd18wM8O2BX5ik3XH3ebGrAWt8Jnwt0lyd6ygDax58Y8JIqkt27huc
         AeSg==
X-Forwarded-Encrypted: i=1; AJvYcCU6kQN+2o2FBeMeNC7Lp2cFa3VWVxazCtfSKXeLMzgz3PxzkHzogfxQ8MXH2Y+PQHjoD4ObyNo9ibrp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8XMtJRD7rW6EXNrAxOaEWUjfS3NHpTjyi+jg+6GOhLhGWqu9J
	WQMRlDkbRtgjxv2uTzGdvq5Iyi04tF7JuUxL80M2wL0Kz/zkX0lxSIbG7lfO+qfWSSGt1Ck2UTU
	JkuqjCa1Xaji5NIyL2EaeAG2oncQOhhj3TZnppTHlZg==
X-Gm-Gg: ASbGncugdRQjVZvxiPWJmLeY2zXggsliZ1smGQYOZZWNqUGhx45m/xrV9abtjVFmu6u
	Db+onChF1HDiMF3APOvCTWRl84IEfOFK4uy3/996wp3Vo783CgYK4FbuuRWujCk7FhqgMstHnxN
	fImCbC82CcYuFy1c3WVgCBtbd7c3tcK0jbn17QKQjWtkQiw85O3xnGhGQgxXRUAqS6mMiEfBSMC
	eud/xHmRhQIMrZ/c6OkrdJZoi3CXZWRu8dnydv+2DmTz3+0+u/GtHcyP5EnmGJT82fYrUI=
X-Google-Smtp-Source: AGHT+IHCVrGJekuMYQD+foCBDGiyyGeo3byZNUFlppuWWBOZfFuUcrUBzjAa6sG8725ai0frWERcCuNbokRB5yzJtiU=
X-Received: by 2002:a05:690c:f83:b0:788:1521:4991 with SMTP id
 00721157ae682-78a7bb59eb4mr34707827b3.22.1763680797008; Thu, 20 Nov 2025
 15:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
 <20251117091427.3624-2-antoniu.miclaus@analog.com> <20251119-violation-enforcer-1362d3eecb69@spud>
 <CACRpkdayt+upQxxT-GdQOENWjdF2zz3DLEjcvD7sdg9-oaLwoA@mail.gmail.com> <20251120-evacuee-opulently-8e98840c4ba2@spud>
In-Reply-To: <20251120-evacuee-opulently-8e98840c4ba2@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 00:19:25 +0100
X-Gm-Features: AWmQ_bm3L-eNDzf3GitUsY8GpZUIM7tmeq8XIvce7Opl9ftYB0PquTliqyKLts4
Message-ID: <CACRpkdZHAFhvHBup+Kc87OmgviRkjLf0dN1EVLz0YoD3NwzSUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
To: Conor Dooley <conor@kernel.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 1:31=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> > Maybe we should make them named GPIOs after all, as the switch
> > has exactly 4 possible GPIOs. It was my request to have an
> > array I think, and now I feel a bit stupid about that :(
>
> It might cause havoc dt-schema wise, but is having a switch-gpio-names
> a silly suggestion? Seems more usable than having 16 or 32 individual
> -gpios properties on a larger device.

I think in DT the "name" if a GPIO is kind of the string before
-gpios so "foo" is the name in foo-gpios.

We already have gpio-line-names to set up names for GPIO
lines but it has never been used like this (to find a GPIO for
a certain line name) before.

> > It should probably be initial-switch-states.
> >
> > I vote for a generic binding as it is a new "subsystem" in DT,
> > and this can be exepected for any new switch.
>
> Cool, prefix-less is fine in the case - although Rob's usual requirement
> is two users for some common thing to make sure that it is actually
> suitable for being common.

It's a reasonable stance, but if we zoom out and look at the
usecase, who wants to leave all of the switches in their
house in "undefined" state after installing them?

Everyone is going to want an initial state. Lamps switched
off and heating switched on or something like this.

Yours,
Linus Walleij

