Return-Path: <linux-gpio+bounces-27328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6FBF3C50
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 726C1351955
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD31E2EDD40;
	Mon, 20 Oct 2025 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PE7buZHj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3CC2DFF28
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760996126; cv=none; b=Sg1O6Y69KYeuTd3uTtyWtDVJGo/YUWmJYX7T0T+oTMp2BeTBcOveboiMTgGtSF8Yo/eK/+b0Lm1ZF3LWmhyERwfw5OMBHTzTeztfsOEfttYzbHo1Dw8Ve6CXi5xxXfzmN5xCbyUd+B702+TG5pYNEX/qzLh/JPwrvXjDGcoWO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760996126; c=relaxed/simple;
	bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFrchrl/qfe2wBNl9ZiqtIa+FKN0QrDOv1Z0c9vP0rqxdgnl4qVVhVMwdYeVZ/Lo8NzOvWI/F/Mbe0/CqzFC3aIOzw/RYuWpI+gcAfWrDJQtMSBdBG93akyVC1KBSew5qfElG4qQ7WbcN5WiyYfzp1YhZgbrAPtoPL4CK/sxUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PE7buZHj; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-784a5f53e60so13113187b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760996123; x=1761600923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=PE7buZHjoYUMImtbfQNuaX+nnmlXX0XVVE4OhOMIKupSEDMANMsRMetsBK08uqy9At
         1ukTlNhpTEXQrM8BahxXobWCEbiHW7aWVf1NWaIFS3gablTeWO93iMG4LU1l9+cCvhYH
         7tPLZf8TCIvYEugcAzJA5ee8dZgQLC2ZY6qu12KFYAw022n6+w2D/bEPPh8qiOB6GmHy
         nGo9fDaU0220t0tuLMv4f2WWl0fLIrDUMy5DWw2lnePBzMljbpA7pzYa5Ni8uDXxb7Yb
         +Yn+cMf8PyBX6KFf1okxtiAiwDvRW9AVz1yHmzxK4J9XtSee1T7ifpwWG2hxFnDKzp2Y
         EPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996123; x=1761600923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=Cl6xFiyTH6BAAGNEHCFJB/MRWzSQNabpv68kFptq+fpQAvdoR8OsZRnvQd4sePtU+N
         muzfI3WounsFITyXRmJyy0tzuCYEGPU24wGX70w6sFs8aW1L1lH7VRGj6vp3/+uVg0ww
         1ifuhcD/um4Nxw1nvC8evGiLWHEe7rQs7/4b0rSPFoullCNT9sEA+GhtNRACV9+sJfzq
         Om/Q7XGpBTeWo2Y81HPYHK9ighks8E7ZtOdA+yNH3BeVomBjXngFazkRs7Jx79jjLU5/
         4RWhXBYz2tifxd5XuCWgd6UaKUqEP1DaZbyyWONblycwDitK9hJ8CQGPUgb6RjbrjaGg
         wlaA==
X-Forwarded-Encrypted: i=1; AJvYcCU9NOju2gIABNbtNiyIH0xUl81JhXSy/g9bGYk4mw9nMXOjX/iYlHQKERM9QuqmtwhhE4VpVcIwXFVx@vger.kernel.org
X-Gm-Message-State: AOJu0YziZzA/hkWLKio465rLdjC3efoizGq3tevRFQvPCGBhgDRzdpOx
	6QqoqJSe7StaL58/YZrF9ie7AcOfPmx0Xize2fqD8ixaGRkKi38BvX2N8aiJM1FYkh46YNwZtY/
	xzHC3SiK43F5VMrv4T+Dscce3PrPk/r6fCqLbGaTXNg==
X-Gm-Gg: ASbGncuQrhmTUjX7hSqpLyCf0vT/5igucILQzFaBg/lhE83aCczhB+XyFNrIdCV/pAf
	TmAII0t0yky6GAz7mZ6hTzaXiE38xX5wPdMFebhX/KeNaYBO0h9OIpp/57JtFLNDVleSVrYoxpa
	Ctp8fMhsU4b7qqUQU/B4rEn4knsWmaeyUFgTRNqS55P+QoqdoUczfcnEA76Y/NJUd5CKbjIOy1j
	c/1ksbjtXW+s8UJf2CGqEYO8v9Au8JEVyQv23soaG9lB5iKxFd3rMCrzyT++oAHKbb2yWs=
X-Google-Smtp-Source: AGHT+IHcbLV8sjcTUSW/kYKLFIDfgxSVgbG/hCotLfs+E1Yurw11PQwO89zUraRAtmdIvysGYrHzIqa+Gk+I+qbLfMk=
X-Received: by 2002:a05:690e:408b:b0:63e:221e:bd38 with SMTP id
 956f58d0204a3-63e221ebe30mr9755360d50.64.1760996123201; Mon, 20 Oct 2025
 14:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:35:10 +0200
X-Gm-Features: AS18NWBAzh5HU2QEiT3WGw7lWd7_MVL73oGUD23tlLIja0Rs_422Nhq3kpTmHsU
Message-ID: <CACRpkdZFXxBY2AopX2bgFGE_nhXmV3YirfRwuo4L6qWzzAC4rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 1:20=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

