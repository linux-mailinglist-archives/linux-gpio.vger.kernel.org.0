Return-Path: <linux-gpio+bounces-6656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D72038D007C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 775AFB227C2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8706715E5D3;
	Mon, 27 May 2024 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHuA/6Gp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC5715E5C6
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814433; cv=none; b=M7oFDPbTIoXH4B0fqhPLeQIFSkfUm4HyUaBwa6p3dk41sl8MWbnQyUv2Q/Q9SHFEwOJzpodYBTsZ29qQRl/7PY+bONRYiymP3hCYW09X37EN+iTwoEak/WzutrCoDn4N7n5qb2bpHfNFQjET+0Nys130/U7aDjyWPD4A/7MB+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814433; c=relaxed/simple;
	bh=kRzIkfk9aA6AIARat06tGUsnw6dX00qMxa9B4WK7jyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyYKiFNkPW7rP3az3/GxI/EpBn3oysKn9aVu4ooQg7C4wDXfPoPPOq1yJHsvhGHw8QhRQzxRJEXEZMHFFhfwNGZFN40L8XavX1/XXj2f6ixA8Q60sDdbl9nW4IgZvYkg+X71DXpnkxMek8FWhFAhWkMmbrO5IhfYa/quLXFW5tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHuA/6Gp; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df7713445d3so3278488276.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814431; x=1717419231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n38xc1OaRNv1MJQDIDghtRWtDAZeB5O1XOyPBUpnu/Y=;
        b=fHuA/6GpxbFta6a2KX9JdEHNG6t+L6ldm26F55NMH3FVFDYSmaI4b8hfgB9elpuPE8
         4QOi7ghU1ZJ+aEvgPDvzFMAzicQ9ciDAx4wZlNqt35IGHzvRz8QT4ezg3lVUKMGJ1i8p
         PasFVK1F3HTj61j90aXdVEKFBGFfKEPbnoLl+0Bmwl5UsrKMduzD1VLlLT7ll4X4CEVB
         th33+gx5wbhrOy8ArFLXwq8foalOZpDCOLI3ASrnmvhXFhRSm6ePV+/n3Uo3xxp3g8z4
         8CjKpD9rPfd7bMqCidsUp07WXvjRshPbpet+UB3iLo7U6uZFvlJdd0dwPA8yT2mKxurM
         l9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814431; x=1717419231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n38xc1OaRNv1MJQDIDghtRWtDAZeB5O1XOyPBUpnu/Y=;
        b=mKgvgAP70v/rbfELqb2soh+IqLgn5CDyzuhjw6VN3gNfotPKXDidYYIeogxn6GJFuW
         SFvAyf7ErAqLS3MJ01ipbcVB0wjBx8q3LcnlMDXaLajah5fmFLClUdyJsmBRrbNZQVs4
         1QA9efRl7y+cnGd4pyBvjKqStrNP+POQlct1cHdjiHOPqPKCkG4y7M/rJgR0Unkdhzf1
         6yVQwbGqGtF4jGvf88jcbB5VxJPu9gPhTUZsXFn+GihSlDYVerrJU7zunWg3k7P0aihi
         SdmDdnprSdxpltMUP91+V3BCzmhyTiNNk7a/JFxW4Jj9YmI7tQ2pBpNjenZZkUfUEpnz
         p4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX2CB1QBmuKDdL8nxpRW2/MXUVTQ4dQCV0mwVyjoBIrzQ5SEsxh96Ie3stTZ4B+qnIfraqlQvDBIx7sJXIc3YAu4tQr8g3QziHjzg==
X-Gm-Message-State: AOJu0Yz0cSseXyAFKf1CAsg+JpT5tNKzT6AFLAkgJuaKeP5cz588LESb
	oAg9BjpsaiT2zRMO6WPbdk1W6rAWHR90kcw2EQKvi1LIRrd0Q75n7DRKxBns1XHLaC0lRtd+7NG
	8K6PZRKiVjet4XRr7OynNcwUv2YZYmWpc8nbBig==
X-Google-Smtp-Source: AGHT+IFzU18N+mOTSmGUX+D8nV9CprtXNPZ2YG3J4xB1E5yVmFBi3UzDUGrPZaFYiDw2nCnS3zR2JAFmDI/T6iCD3W0=
X-Received: by 2002:a25:ad50:0:b0:df7:887b:abfb with SMTP id
 3f1490d57ef6-df7887bb0f3mr6066354276.15.1716814430908; Mon, 27 May 2024
 05:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com> <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:53:40 +0200
Message-ID: <CACRpkdanc3gJ7_z+V5zwKbn+L-Qy1+nwsPLCSF9ZQ_xk3qJOXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 8:17=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> +static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                          struct device_node *np,
> +                                          struct pinctrl_map **map,
> +                                          unsigned int *num_maps)
(...)
> +static int pinctrl_scmi_imx_pinconf_set(struct pinctrl_dev *pctldev,
> +                                       unsigned int pin,
> +                                       unsigned long *configs,
> +                                       unsigned int num_configs)

The code in these functions look suspiciously similar to same code
in pinctrl-imx.c, I bet it is copy/pase/modify.

Can you look a second time if it is possible to share code between the
drivers?

It's not super much code, I'm mostly worried about bugs having to be
fixed in two places.

What is the opinion of the othe i.MX pinctrl maintainers?

Yours,
Linus Walleij

