Return-Path: <linux-gpio+bounces-19485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D5DAA39EE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 23:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E091A880BD
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2026A098;
	Tue, 29 Apr 2025 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKST6pdr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ADA2550CC;
	Tue, 29 Apr 2025 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962732; cv=none; b=VggKo7XqSmV0tRpS87t6NZ7VXhQKSNVopcNNrUdHtJOP1xVP8+SucDaqnXFmzg2XTQI4qTvoxrEVHL3iTcEaH3xCLUDiRq110WI8uUN+4D3/R/9n3KiRHhwsy7bhCtjrf8Tbzsjw+Thfl6xeZfPe5SGsiRog9bDDdQvzicH8FO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962732; c=relaxed/simple;
	bh=mXA21M6mTenzQacSVg7jO63XICl0pQTaU9Sf1g+noZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+BNOVY6RG0cPYg1kpZR6O/ocvTUu1I2SzKb71r9MgzNof7QTnk+s8Amq9kuqHdnJfqULqLbib65cbXmMLWDzNRrpYXZFu4i9NJZSx5d91/Z+yDIPlPPitC/hpoIoIxfXg63YrjQt7NqMer4HwYDaxM9FeKGHmq1ufXc77C1WMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKST6pdr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c2d427194so54002211fa.0;
        Tue, 29 Apr 2025 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745962729; x=1746567529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dOsoZsb5X1fqF1yit50Q/60XIfapyBLfA2TkiLo//A=;
        b=MKST6pdrR/SHBOt/TFU5dn4tOnA66xjoBrV08KILfL22a8JRw6ocgocuYiK12CNtN+
         H+yEZLAsrmQVIHPj68xf+kopbFTbgTDozKyc6bIQBT8f3RVMtBm+b06akS8CzWOYJmkj
         igEvH5NxcvBF+1LfbORGgYWil2UrnGSOY0hATTPpmgB5cVQN8+ITHOWbYoT9WI7VI/MS
         +zQ3PDq0tadjdHC6WWgkHEww1Yi3WLTFxcAYRNt99HeQ/z2tiQXOVLbLmyesF+FzgIPh
         rUja1czJ6qEOUQrgxA3h+1aXk1m0+/+307LHbXhE4R2n1JKkO+pQxXmCeX516ifszFVW
         JH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962729; x=1746567529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dOsoZsb5X1fqF1yit50Q/60XIfapyBLfA2TkiLo//A=;
        b=JP+F0BvFQOuL+ieDmm7O1s4cXduQWuDKcrqJNYONWRlzSUix33olR2jj+2aHeygZJB
         TJxs8KVCx4LJoX2m9EF2sejgdRmpgAUMcNq/ElV31zBFesaRt8gJbmcQypelhWENiIY+
         siqalTqCHFJZmud2NCKAlpkFaNQR/CzZWqiWTvNa2rhxte4mhR6ueooHpd2nQoPgeU0P
         uiDhFyLgtuIXojdPRpXsH/rh+SXQ2pisgxtJzR3VRLqk/Q2fcxbY760T0wDPHlnRXD28
         9+CCie1eaq9yHgP3aRbxfl4GIUk1mwqaoF7b4YTJRbO9gtSxlGh55QGguqvmG0nmDADF
         xdMA==
X-Forwarded-Encrypted: i=1; AJvYcCU+1r9ev5IGARnhxPKfOC2EfUMLhbbfOXjK3Ds+LCzYeL+WvEU2nI+mriFvt1b1Ubkq5TwyWXMEPaUV3g==@vger.kernel.org, AJvYcCV4j5tLXzD9muXR2Sokac1FXMI2FuOyh4zKCmwcMyZamkU+9LMNh6EzOI/seKvCHe6P6zAz7R9hDZZP@vger.kernel.org, AJvYcCVwC8NqlTwUzhMObXwjlO4N6PIrYdjlWMFpqJvGtOVH+0+weO2G1iEoUKJuCH58QZlwuMQ0Bpqf7rUhpt8=@vger.kernel.org, AJvYcCXZPZBKNiCkxTY+WDY6r4ErGxlmvTL4hq0NgAlN7nPBRNapRsqu0Lfum2Kffiy6U+/o1+BtyJd3Wki25bi8@vger.kernel.org
X-Gm-Message-State: AOJu0YwZReVg4J9v4BoXPfODZXRIGUM22qlgv8lIl5BA+XpjyYQRw7f9
	jQ4cKGGaYAGSEhskDt2AWbXOVeCKNXo1rz60dR8zaJLCDqItyUbZUUZFpr9kg3qmrjzCQVdWw6s
	r6K8Z9n+eYaiLqal8TUgSGOq460+C3huMVtU=
X-Gm-Gg: ASbGncuja5KXUI4OD+WdQEv84QWsvNjsEs+pONlk+MqA7tf5xdORqLmL6XnMdT4E/QE
	qa4S/pmDgyBSkkP8IEro2jaNtdUHv1EGZRnjtd+pBJin/6VzYu8LRAActNc752AHA1YFUoUX92P
	P/qR37xC/mn729CJmTNKJC1w==
X-Google-Smtp-Source: AGHT+IF/UK+zmUfmInoS3qAk2Frv02mr3palOxT9R0ZL4Wb6rRZD8cvke+THGluTfwOcD1oVA/cmORv8R6u4Kfx0w1U=
X-Received: by 2002:a2e:bea0:0:b0:302:1fce:3956 with SMTP id
 38308e7fff4ca-31e69e31164mr1843481fa.4.1745962728717; Tue, 29 Apr 2025
 14:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 29 Apr 2025 16:38:36 -0500
X-Gm-Features: ATxdqUF6jiRcVYa2bPh00Yw29bjpsdm1O4i4d3vZ_05WVXSqM1W38cGmDPoJUao
Message-ID: <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 4:33=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This series adds support for Tegra186 pin control, based on a downstream
> driver, updated to match the existing Tegra194 driver.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Aaron Kling (4):
>       dt-bindings: pinctrl: Document Tegra186 pin controllers
>       dt-bindings: gpio: tegra186: Add gpio-ranges
>       pinctrl: tegra: Add Tegra186 pinmux driver
>       arm64: tegra: Add Tegra186 pin controllers
>
>  .../bindings/gpio/nvidia,tegra186-gpio.yaml        |    3 +
>  .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 ++++
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   12 +
>  drivers/pinctrl/tegra/Kconfig                      |    4 +
>  drivers/pinctrl/tegra/Makefile                     |    1 +
>  drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1784 ++++++++++++++=
++++++
>  drivers/soc/tegra/Kconfig                          |    1 +
>  7 files changed, 2090 insertions(+)
> ---
> base-commit: 1110ce6a1e34fe1fdc1bfe4ad52405f327d5083b
> change-id: 20250308-tegra186-pinctrl-651ffbbbe816
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>
Thierry and Jonathan, as the maintainers for the other tegra pinmux
drivers, I listed you as the maintainers for this one in the dt
bindings. And I think MAINTAINERS will do that by default for the
driver itself. Are you okay with taking over ongoing maintenance for
this one once it is approved for merge? I made it match the others as
closely as possible, so it shouldn't need any additional changes over
time that the others don't. But I don't want to sign anyone up for
work without prior approval.

Sincerely,
Aaron

