Return-Path: <linux-gpio+bounces-27063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E76BD826B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4B03E8770
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDDC30F920;
	Tue, 14 Oct 2025 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5F/ktAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D430F551
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430201; cv=none; b=KgAtOTMK7V269Lf7JJNuhBiEViN/Z1wPEEcgXvQDBaqNT5gKm3DWtQelqPrk1jLtidve5kRnPfDHc4ickajxYmFiH9CZCvyHkR00GW7AkjiaWZ+L72ZbZg2snen+ZvhYmPaR3bBqcqumfw4OjHefXq04/eZ6T1ThEUnmua/4jXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430201; c=relaxed/simple;
	bh=QpLLN7omLU7FVeu70pu6uFOP+AtOBErrgm75t8rLSRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmndY+RgJOVAUDlbhJLEt2tLfJPPXFxF1DbilLO6RY8fs3stTUZEUkR/W0WEHeX0IgRJ3FgQdZfbJTciTdz0Ca5grajOjku4GbR5ueJv4qQiqtGaPP49aS3x+oajbHMXrmbvmxhVlyn8w0imtQLYjwxkcMPXQIASHzfkCB4PcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5F/ktAF; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-633bca5451cso5023928d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760430199; x=1761034999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9TclHM+FlxL8k/EdZlfp0sKQpkcWovBD/evGnk/JRY=;
        b=d5F/ktAFXiAlca/nL4hv1iOe9/I8zrpQX5eD+YjxQvMcYsXB3gO0yt6NdWCwZZ1Q8f
         YGm/uQWNq9Z302yY+mMQLJSQTzyTGw64d4voZuBwYDnLfJjZ/9ZYGSzDaRVh1Oihsyvh
         8oKbrs+cvUN7M5292eAW5DZCwfjbkCyQXaGP/YhGeWcgOw4qkwYQ815xURYyl2yt/suN
         XZtcl4QSVC7UHy9+ml8+wKOZ5EGmBnY0j9EpKCpNTrYcnDyF2qc766x2kqReFaBw0Zo7
         yOZp27Y1L9JGsiD2XKQhRQdoRk8SF2q0YzB3vHEjTo0/lrv5Tv+y87v8+kcC5qHSnvJ0
         5IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430199; x=1761034999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9TclHM+FlxL8k/EdZlfp0sKQpkcWovBD/evGnk/JRY=;
        b=xO0IAkuO9Qiiuxqd54xiOH1jUTiGrojxza80b9Cy7Z81mNcL9wMMs1NMtcBvXJJ3uf
         ax/uOP1fSjc+vK6nTokrlLhgcEnXKgP/2DhuXb1/4jFkC1rQ9LeScqMbepXewzfxP03I
         CchvJqOT+rhoWzqo+ffJ0u51cRWRSGzSRihUU8tuFvgymYFHTPFS+daEa+cbYVWV5MZj
         KcfPDzRfCDBPte2tGSmMr65en7rKQN+/Rv5sVVFViGzUtVUzZyoOTwqYPjiykPmShP37
         dzfa1l/My44tG9uFYLmo+w85QwJ3UgA8HOrzM9TIjQeS4BfYhSI2uVnWOtnX+NBXIMWC
         jAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRxVrmTc8X01ri54k4IU004FE5qgQMsetGyDDE5xMATLg8II3StXmkhiKUzT8u6HDExgkfjWPPv2FJ@vger.kernel.org
X-Gm-Message-State: AOJu0YweAO8eDbByqpSmn9Ud7x57eFz9+lROM3FgQwjcXWnTqoL6+bAP
	HJRXwCarIcD7a/7s44eLOzG2AR6Z0Iy7vU7occOSTPH/r9+qjWu7sGgruCDUTDhyYZSFWxXNZqv
	A0AvmJYTcLFl7PButkr3kmi1gHKulx7aXHb3e3WiWmxLsBoYhHtsKyGU=
X-Gm-Gg: ASbGnctCiPBeETbGdzxW/GJPiVNlytHfHYYG61VmOfrkrQpi4IaCCskaJjijVAcUBPQ
	VGr/7nt0DfkvUVS9QqjH3W+CU726QeI9pWchg7HlvZLywEAi8UEYP46Z+wbb0zg6xAAFRhD8Nvw
	lDyKx9nbQ8BUTRiKrSuEJEU1hbzQCC6vbyIypJqZagvLbHmd6vhGqTC3CZN825i5iCFV5tv/Nhw
	I3nYiAAG2Nxz0SJYOg5XTBLQjEHaUwLuugZ78ZS
X-Google-Smtp-Source: AGHT+IGUPFI5jCPwxpBaBsUtA4t105DOhgNvQsDGVLBIPQELjrZFFsrZcl9lsa37EFuLVIbBf5ZvE7ZH81SU0iQy1BA=
X-Received: by 2002:a05:690e:424d:b0:5fc:5d98:3478 with SMTP id
 956f58d0204a3-63ccb7fabcfmr16158005d50.7.1760430198919; Tue, 14 Oct 2025
 01:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009223501.570949-1-jelonek.jonas@gmail.com> <20251009223501.570949-2-jelonek.jonas@gmail.com>
In-Reply-To: <20251009223501.570949-2-jelonek.jonas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 10:23:06 +0200
X-Gm-Features: AS18NWBS0RiqVLOn6OGw-S2jkVsKedTw5UCNSQ2_7gUR2ne-WB-LpCsCs8TF6SE
Message-ID: <CACRpkdb6bTFbTtNsO59GXFa9eMK9x=+BGK5Vx4bKv62wxiSpiw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: gpio: add gpio-split controller
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Peter Rosin <peda@axentia.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

thanks for your patch!

Including Peter Rosin (the gpio-mux author) and Geert Uytterhoeven
on this review, as they have worked with similar stuff. Please include
them on future postings. The result definitely need Peters ack before
we can merge it.

On Fri, Oct 10, 2025 at 12:35=E2=80=AFAM Jonas Jelonek <jelonek.jonas@gmail=
.com> wrote:

> Add dt-schema for a virtual gpio-split controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
>
> The gpio-split controller is a gpio-controller, thus has mostly the same
> semantics. However, it requires a mux-control to be specified upon which
> it will operate.
>
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

So if I understand it correctly this models a 1-to-many input-only
GPIO multiplexer, we need an illustration such as

        +----- A
IN     /
<-----o------- B
    / |\
    | | +----- C
    | |  \
    | |   +--- D
    | |
   M1 M0

MUX CONTROL

 M1 M0   INPUT
  0  0   A
  0  1   B
  1  0   C
  1  1   D

Is this correct? In that case include something like this
verbatim in the bindings (feel free to copy/modify this)
as it makes it much easier to understand what is going on.

That's a very minimal example of a way to turn 3 GPIO
lines into 4 GPIO lines, which is a bit crazy but I'm not
the one to tell vendors what to do :D

> +  mux-controls:
> +    maxItems: 1

So this needs a description, it is a phandle to the
gpio multiplexer (reference /schemas/mux/gpio-mux.yaml
explicitly!) used by the splitter.

You should also in the same patch add an example to
/schemas/mux/gpio-mux.yaml showing how this is used
to muliplex GPIOs so people find this new usecase easily.

> +  shared-gpio:
> +    description:
> +      GPIO that is shared by the virtual GPIOs and controlled via the mu=
x.

So this one is shared one-to-many, and I think the bindings
overall makes sense.

Maybe "gpio-split" is a bit ambiguous?
We have io-channel-mux, so what about "gpio-line-mux"
simply?

The fact that GPIO lines are used to do the muxing is just
a detail since a mux is an abstract concept, it could have
just as well been muxed with some I2C device for example.

Yours,
Linus Walleij

