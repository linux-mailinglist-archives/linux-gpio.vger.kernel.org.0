Return-Path: <linux-gpio+bounces-27882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0FC23EB0
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 09:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 868804E5F3D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 08:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03F13128BC;
	Fri, 31 Oct 2025 08:52:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877E2F360C
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900751; cv=none; b=Z4t6tXm6kALC0Z2cNdMfUu2gf8JhbVg3wfQO0qzI8phxZkRkR3oEvdX8zjgKmJrBI7k6omR20TAVH4CXCNrtegoIcJEMqe/LYkjElJVOnrbWvRdWZvXrcZNDJFZ0p/Er5pI+Z5smDh3981un19FDXeHbDLw3csTj/OoMZYDS4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900751; c=relaxed/simple;
	bh=NYbl8HJcgb3R5SVJ9GXGI/Jq2+mOIag8w0HzHBPHPoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb5/Jw25iuzlCQ4gY+uzyThvg9j3IHgtZVQi+1W4z+NiP+d1+DkTIMmzTKAnCebU7vaueRmDEpftBs+i/JJPN32KqKz91WRRpq/dl6vFu6vIkaUuqsVLPXv2FWs9XyUbhI5q0aoEy7hxc7O2q12H27w8PhefR7JTu2mJPyDk4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932cf836259so944057241.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 01:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900749; x=1762505549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQVVX5c2GB+a2QgL3UYe6DKU+bmVaydohzEFkpxq/1c=;
        b=PLYJTDwHU5wRAZV6QojuYGN+60D2DG+WrswtQuateKQ7se1KmVks3nVDggDNO8pXDH
         g1pxlABcJ4cENDeVh1bsEuIfh7036uyJ0EvBfyKX8lC08qSQtbsCnBoPJHmDBm42Z5h2
         rT4lVF8GeapKc/+LUmNc2Oiz4tYtDeOn8waQBqGtcslKbfaSj9AyZZo91lVbYZwzGV+7
         DmHS8xS8awnA5YN4ebF/DZVlnwSkpfzxZWCxVTb7NTCOnw0aE9GcelKChjGgHThGCF7q
         XwLrOVjtpV44lcjLoySAP990Qrx3UtNX4CaKN3Mw0A0rjT2ZItGIKACaoLRfYMiM1SOy
         nZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8vFdJ7TmLblU6yrtWg/VNCaLPe5ZoISTpmkeFGwKpKePgP8hdkfE1eDXQHWvnBg8rqTPJnwCAa2JP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfi0kFmSMi0ILwQhrxrtyAAVTNvfdG5IgsJNRRb09/TDM2kffr
	G5ot8kynpf+3Hm+DeGy1Kngpb+2xgk9wYrwIQij7nQbtCD0oz0RVlg4Nnc1Js9M9
X-Gm-Gg: ASbGncuGFv1UejNXxQc4ePO9DleU0VxlNYJiOGKg+ZF7ebN9TsQjG5m6+3H7rpHy+NN
	12deK90tpkc+WGrKDM4xECPz1zuEmJ4mpjxFnr1jD39fpl/Y8QNh16Zj6NIDMgDLtseaf4jsi4e
	UKbVuwlyGtPtdVUdaU6Dcoh6d1X4ISXOT4dEUaYosSKUEbhZRhb2xNJ/HgXk5pKJ9niQKmKmyRA
	HDU33cZhlIYTePgEXTHM0jPkL7jugZexVte3Skt4HLJyis/0QLEQsaRpXzWO5ktFz4T2+LDZYdS
	luSpjthq4IsbFaAuBe3lSuDy8Sa7X6Yl3zhIxXgx3QdP1XFmYPpj4fz8dv4CfcIdBKvF6H29uMJ
	c9tcEBIxqBSuG35lvteZTuM3eSbO/gQlJAFMuQgFncM5JwjLU9sL9nL9Z/9lVg0rOS2qdjBy7uB
	3uBWHwLLGEOBaKy/mxf8490C/7aaUjOthPZmtW7G6MvAipSfLWTwYFlY+agg8=
X-Google-Smtp-Source: AGHT+IF9XEJpocqULPNBz8Dd++VM1QYxv5r54Qt7NySzq3faUuT9bLmWjXEkpLAUySZ5dW184l4ISQ==
X-Received: by 2002:a05:6122:298c:b0:556:a54e:f95a with SMTP id 71dfb90a1353d-5593e456afcmr964834e0c.16.1761900748732;
        Fri, 31 Oct 2025 01:52:28 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55944b96e0esm422280e0c.22.2025.10.31.01.52.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:52:27 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018ea5625so1019571241.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 01:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuQbLCLS9Ke4i0D8TLyq4T63tpyuIcwVWy1bbUpxbSR4TW9MX+/CO25ygMju2SEi4/ceRlgnmP0HxZ@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38c6 with SMTP id
 ada2fe7eead31-5dbb136ecc7mr717064137.37.1761900747573; Fri, 31 Oct 2025
 01:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-6-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm5vGlc5XXZic8RvnXrZNNcCRnf0-7M9Km7uh4sqx0Aign1FjKoX2MZmow
Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote=
:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
>
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
>
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Platform Bus
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  A Simple Platform Bus is a transparent bus that doesn't need a specifi=
c
> +  driver to perform operations at bus level.
> +
> +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> +  instantiate devices connected to this bus. Those devices are instantia=
ted
> +  only by the Simple Platform Bus probe function itself.

So what are the differences with simple-bus? That its children are
instantiated "only by the Simple Platform Bus probe function itself"?
If that is the case, in which other places are simple-bus children
instantiated?

Do we need properties related to power-management (clocks, power-domains),
or will we need a "simple-pm-platform-bus" later? ;-)

FTR, I still think we wouldn't have needed the distinction between
"simple-bus" and "simple-pm-bus"...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

