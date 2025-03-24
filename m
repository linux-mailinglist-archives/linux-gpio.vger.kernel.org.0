Return-Path: <linux-gpio+bounces-17904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E57A6D619
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F883AF2D2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57825D210;
	Mon, 24 Mar 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udngQfln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A61D61A3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804634; cv=none; b=SARVY0hXwxoChHCL7yee506J8+aqNcLG+WyCcChE2eh0VeQ3sk7li4b3y8PdpiZ1smxUzd2yZ5yrWltwCyaoYz8fAuifB4y2Ag9OFzZm5QkFlAWemgfG2XE7d2hPqXJveLcrl3aQnB34Jx37cR1mOD1+J72Y8MhofPyFaz9Lm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804634; c=relaxed/simple;
	bh=7bDgvrnoRlrYBwaB5QA15Z1GcjEcWdwDWBx4tg0YEzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+TAUtBXIVA04iwk2eseMgF6DBShkGlgyoWSY0uT+WtJrBz7mWEE7EZYIcNeyiY+Plb8l6bpaqK30WmnXfv2swqtZiaHBq66rplf5cOcWHBgGHDurNbvP7PeGa2OBkNNLVEGPnQowLB0OdUCAYV6efWDu6oN+DWY8YDC5bTY2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udngQfln; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so4757813e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742804630; x=1743409430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nJur69nwLGZEuv7kca7NWGISubr7DxGJQXvrRC0WCI=;
        b=udngQflnq3v3uQZIyurnFBW7KcubxnMAVPPHIkibF9txFnqyz56ElM8TDSyqQ4gnpb
         e0yp1dw8BJ7lic/4ECxgBLDiGUkkbwWtl0qsFbC93JyrK6Aysrx1+3wjOYn7jJr9K5R8
         XbDsW0ZYLHFduLIYXJAEsm01WDST9p/13al71hF9hBRHgW0NctZ3Rh8kj8DQCnxj4LWr
         RgGFjuOfjJjmhCxE7wJscQSbyxLQ0mu6Cgxh24B+ZIz9DSpCIpDr3xp1b0KRc2uJGwnl
         aVM/nFUyU3yI5nmgpqMTsftHS6zpqsExhj9zH6yMEwCVHN/JLsK0i11aXIDu6leo0wZW
         EPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804630; x=1743409430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nJur69nwLGZEuv7kca7NWGISubr7DxGJQXvrRC0WCI=;
        b=sZprmr2d4cK6vOnLDovvoTfspMxBhQKKvbhI9RMWegWDx2ShynA6kZBnH1eUxnozXk
         xKxfcpYk9d8r8AOpqDIREw85vLV9u7PbPzzJ56+yf1SMefr0TbyrG6gWeDWjE/D6Cr5K
         EWl1tbypqDLEV/JUjiCYszkdeL3IZopXtHPddVYk/NMBWCep2QK2mueIsHYuSn3KbIuC
         F+xikXC5J7rE3whZN4xnvgdEYwEaz5b+OxI+MpeRl3hKZuFKnzs/YTx7wRRyYWGxyAa1
         db+HLvUbqfCpuqLDYzqY07VlgmeRo28ZPyGo2zLdSW2Sp4wz57VpPt8Bd9YUcL3AGEjU
         3zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxwfb//Fz4RvVqu/nFFTqnYd5lgHYMJy4G9xe7KloHx0NKvlIAmvZYhdYPYm68HlUNrDtU1oKPJzfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iDVCimHhyNJEu4fFJFdjCwwq5p7a39Zo03PaWb3z2Wgx+iH0
	1M7663yBF0OQyrWiAU0d16FPjxZ4rw9HxtbmSwvdtSOjX7qcwbvmE2yhEKjGpO7BADvewPiDYmA
	/WGHqkDaPaXNvKYdUCWU1KJsLVezwK4u1DitwaOzRlmBK7t2K7CY=
X-Gm-Gg: ASbGncuDOHKormp9dPnnKohlUjfccffqvMqUT/7VJkAf9TNDILaoF5oXC6lfyYQp+l6
	W7uXkgKkaie5z4klZhT+mZkpnDTQWx8KbjYuRaFmumBuLh5JEOmQvbH5A115ZTj0tjMUPq7F4zG
	HK8I3k1SOtJ/h1FkcAel5kzXs=
X-Google-Smtp-Source: AGHT+IEUNuiXsK28DcHdqG1WX9IZVYS3HmbU7AeEJJZJAoK7D9V3OmcEGMH3wLfdWG71ykhftl48P90KIq2rWvBQudM=
X-Received: by 2002:a05:6512:a94:b0:545:93b:30bf with SMTP id
 2adb3069b0e04-54ad64f08e6mr4576213e87.41.1742804630434; Mon, 24 Mar 2025
 01:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
 <CAKXuJqht5ZiFyt2uWXwPSEdszYQWKHm22+mAQCPQXn8b7AbL-w@mail.gmail.com>
 <PAXPR04MB8459D61091A8BF9ABD94DA7E88A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdZXG0JC7_-Mg6Dpq08Y=Kr3M+fRWQF_bPG8c-WH8pA9Mg@mail.gmail.com>
 <Z-ER6elHDYtIY0ap@hovoldconsulting.com> <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459B60880CC19480C5902B388A42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 09:23:39 +0100
X-Gm-Features: AQ5f1JqdI2uLqhfgx4QepLSst36sJW56R8LoYIG4KSFVVLp6D64VvNqLS9X6y5Y
Message-ID: <CACRpkdagFrz=5fRUfVuaZJRsBao4UrObNa7VknS_hmOAsWFO+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 9:09=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> ok, then the only suspecting point is
> wcd938x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_ASIS);
>
> I may need to use GPIOD_OUT_LOW to configure it
> to output as set raw set value as 1.

I think there may be a bug in gpiod_configure_flags() in gpiolib.c:

        /* Process flags */
        if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
                ret =3D gpiod_direction_output_nonotify(desc,
                                !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
        else
                ret =3D gpiod_direction_input_nonotify(desc);

Shouldn't this be:

        if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
                ret =3D gpiod_direction_output_nonotify(desc,
                                !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
        else if (dflags & GPIOD_FLAGS_BIT_DIR_SET)
                ret =3D gpiod_direction_input_nonotify(desc);

?

As it looks, the line will be set into input mode unless explicitly
requested as output...

However this means the patch also has another bug: you need
to either:

1. Specify GPIO_OUT_LOW when requesting it or
2. Explicitly call gpiod_direction_out() before setting the value.

Yours,
Linus Walleij

