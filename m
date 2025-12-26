Return-Path: <linux-gpio+bounces-29901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11259CDE897
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 10:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F5A2300DA6B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257FF28D8CC;
	Fri, 26 Dec 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJpVyiJ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D654F28641F
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766741382; cv=none; b=kmKU/urH4Ws9PemzttxJwq//pjNcXFkJoCQOsiIYpQaZEGK+Ilt2maX+9G4y4zU2NwTFTLAsqFNOPuVc+gVH8mandtRxtfkwU5VE/jeV2mpvOw7eGoiMPeQZDfMukfdMfqayyc4dhmIcFQfFXiJfvF6YmsQdIjNTVK6Jm+9BALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766741382; c=relaxed/simple;
	bh=ajEhdSEL5pNc/Ubh7CXIVerCP1cnWW3WU3kkjZReQfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvlMFzzBAJZFkwBdePEynqnsPQ10YUH8hkePI1ihpAC//AOtqrTZOwySQP0yqki+Q+Sh+fSFGRjLGL9aUt8UwjMl7voYHNNIEifxbCGFMevlZc2B904aM3Ifv1loylHI43Rs1OeKFqG6DhOcPPOEQDKsl8Z51sWpaXZJkZk7cM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJpVyiJ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A67C19423
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766741382;
	bh=ajEhdSEL5pNc/Ubh7CXIVerCP1cnWW3WU3kkjZReQfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pJpVyiJ18DyN3LpXtqImIEX68eyZG78dLXXQxNSv7S1ovw6d39+Omz4G534l+PJ1A
	 V2vHVoyjTeAT3Y+L7WXqS/dFmTxDSIR6xb2NF7a+/91lwt/2I0qpiKa/ihDRI+/mZh
	 kxYuLvjOzWcIgjqwPAiCPF8PhDV2dk7eqtJsbuzr1a1LcwSt+ofoh59vNGAQFP7JeS
	 oVp7GgtUE9QtlX77U/0Mlaopce5jF9ZUZ/ILuHuIDC8l9ZkRkhrFYjKsi/QgW8mkJH
	 qLCCXjJtrfZM37Ogl81Yjg6q8fbH0qcklBLRjwoscY4JoaegMVDUf3UGlEdUMeHDqF
	 53S/5imKzBcaA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787eb2d8663so89580377b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 01:29:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhCFW/iEEk12K3lg4AycFG+K73Tj7+QlifxVI64gq649aFc5XaTAAYd20BBT595ROAZkE8vhhrICWf@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+6Juxz7zoFkmsQ5jyCrYLFyjwJPKnnK+w7BdhhaDXKy7cicV
	wUztiPFmG3O9JJ8cpG8iZu1GpFdTShZK0Gu37CBtkeCLeeCl+b0EHCoCAbqmOwD8XxXFx5W/JZm
	2J4ZakPHauVzUmUo9sHlsAcSkqizZ50Y=
X-Google-Smtp-Source: AGHT+IF3r5BG9hTIHr8zuwTx79GqFycotrCyN/4vMXe9RrjtpXeL6chNB8YbmmqnT/TEhvbFt44GOPJsJC5H2SIP8Og=
X-Received: by 2002:a05:690c:ed5:b0:787:a126:5619 with SMTP id
 00721157ae682-78fa5a8cb44mr238635187b3.11.1766741381741; Fri, 26 Dec 2025
 01:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127-bogged-gauze-74aed9fdac0e@spud> <20251127-approve-parsley-49302c061ea1@spud>
In-Reply-To: <20251127-approve-parsley-49302c061ea1@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 10:29:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLnLgLHeCjc7HD6KHQ-pWb9TFHbTUC-KB5X8eCFDXNNOBA@mail.gmail.com>
X-Gm-Features: AQt7F2ofkXwYRaQ5RRWsRICeS2UHrcZAnOb0uu0G4CApv4Ccik0sbfg0XhOvPco
Message-ID: <CAD++jLnLgLHeCjc7HD6KHQ-pWb9TFHbTUC-KB5X8eCFDXNNOBA@mail.gmail.com>
Subject: Re: [RFC v2 2/5] pinctrl: add generic functions + pins mapper
To: Conor Dooley <conor@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

sorry for being slow in reviews!

On Thu, Nov 27, 2025 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> +config GENERIC_PINCTRL_BELLS_AND_WHISTLES

Interesting name :D

A bit like GENERIC_PINCTRL_LOCK_STOCK_AND_BARREL.

Have you considered simply GENERIC_PINCTRL?

> +obj-$(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) +=3D pinctrl-generic.o

especially since the file is named like so...

> +/*
> + * For platforms that do not define groups or functions in the driver, b=
ut
> + * instead use the devicetree to describe them. This function will, unli=
ke
> + * pinconf_generic_dt_node_to_map() etc which rely on driver defined gro=
ups
> + * and functions, create them in addition to parsing pinconf properties =
and
> + * adding mappings.
> + */
> +int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pct=
ldev,
> +                                                struct device_node *np,
> +                                                struct pinctrl_map **map=
s,
> +                                                unsigned int *num_maps)

All code looks fine.

There is just the philosophical question whether groups and functions shoul=
d
really be in the device tree, as they can obviously be statically defined a=
nd
associated with the compatible.

I got so much pressure to do it this way because so many driver authors rea=
lly
wanted to keep this in the device tree (usually because it saves memory in =
the
kernel) that I eventually caved in, and I have also been criticized for bei=
ng to
lenient on this because the compatible should suffice.

For me this is all fine, and with you submitting this I suppose even the DT
maintainers think this is fine to keep groups and functions in the device
tree, so there it is.

I can merge this when it's out of RFC.

Yours,
Linus Walleij

