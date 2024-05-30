Return-Path: <linux-gpio+bounces-6943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD058D49D8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC321F21ABC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8017217C7CC;
	Thu, 30 May 2024 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7jWDwUa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7F17C7AC;
	Thu, 30 May 2024 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066000; cv=none; b=Hcoo5NALwlwZHFHbCcf46dXRYD/ueaLBe1G5KElxuzy3xyY8aPR8SLbAXlM0070FD1rTtzudLwfBoeFtzqUWKTKXFdO6Id5JUnOJfMh+RfscudfgsjaGUPNv17Nr4tgFoQ6Le2R2Z1t5NKbQ1EKAVxVN5YJwJU+JQYbSq4+MVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066000; c=relaxed/simple;
	bh=2XWLfSCOwrVmEwps1n6tbubXtFhvhX9vqgpQv3SwI8M=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=KzhdXk8Ls6wftbJTYZZYnxgPpAcPMwEXlMMGSCna/X0JXz+CRNzZuWETvybMBdGh/PfswSFw4o4m0Cwss6cVuUe8V94rj7CVgvvAigacdqm64Nob83xGiYSdpUhuOHyHwZuhDMh5rreU0F9P/iW2MADbyFZJvJeI2/JiimIyMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7jWDwUa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b79447c58so1037086e87.1;
        Thu, 30 May 2024 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717065997; x=1717670797; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=g7jWDwUa13sj9T7K7Rgm5tlT58LSWLFTkdtInSWZOUrKCzbClKGnbEzVQMsWxAqhRZ
         LNsn1su+QXSUuZLW6tb+jloXV0tdwuSbmfCTNvEgS8MNhFocYFPxdQKh6kNQSiFWCZeI
         2VIAwg9h5nDubHM4vCZtUE6n3OGF5la1wFJfHZXgC8fnmKDs5mflJBjKYhSjoIQmbkhv
         YkHmEcmMtR57qTmLhcyBeSJKLyAvkPmuvcku4JK3jg/4R7/3xp7LPNx8KJFOddijYONb
         Iv81VUJH3WrzKsKyVx+0+Q5O4mAmgfpbaNmb8sYdge1xhbwgDiwYZjlBBVn+k8yfDG0F
         m62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717065997; x=1717670797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=bNJ/Vtf3rHtt4E6SnlehSMAQFIjelH4B3cS87XNEtLMnJvqopEhO10Jcf6Fw0p2hOV
         JiVc1CFhIGECcnGj2kRjPE7/xqTBFKjDAhuDD0KcGQ46VhR9vzGi79wycbI9pE1IMR5U
         P5GCS++dxRL1oMXCVCCvayEzlosm4bYLKmSvrd8ht9IzWE5tM/1pwpPVKdnOyC6OX1lk
         RI4lVpp8ITDWFQz3bthzzo8pTyu6QvehOyNNVPgf915yM15BS7vzkqZ2sIoiz5oFWewP
         C/T2JxrH1xnLX0exG6SMSHwUYFkqcea8olHvV4ma813ihdt38Hk9H4Gc41PlhrWhuG0V
         +fjA==
X-Forwarded-Encrypted: i=1; AJvYcCUHsWprfrUKWEg0B6yc58kh4KsXOumM3B6mvnwVSUVV3GOFeT3sHYWiDeIXOkke3LzqcxctkIzU2vb2Gf1YwGOQU6dTzrDwAHh2B3Dx7xp+N66In+a4a9MrYnhjgOY9GfZK3h1xRRLRv/y/QtIjjS6NAmfdjy7THpTR0gJL2zPb0OO/xsQUzbTkt2QAitEodA/DrTvh4aqxUlkUk17BfZ9M0EpKuzIPd/bZIlR0yzwi
X-Gm-Message-State: AOJu0YygyIRJe2g+efxv0Zm3fF42HjAieYkdyjTELRhdb2h4Z1h/vFJu
	pmTBABtaTAOZ7qghKSXCNTrirhQqtjl6rEjerwN3mk81LIKZXXAX
X-Google-Smtp-Source: AGHT+IF8HtLfN2jy2u5b6qrXpWEdw3o5ChBVoUHw6Bx6hyhWP9jrTNwrZOX6TBLkr1VZDWVNaz6SDA==
X-Received: by 2002:ac2:5979:0:b0:51a:c3b8:b9cf with SMTP id 2adb3069b0e04-52b7d4b1c97mr1485781e87.69.1717065996469;
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9376dasm807478466b.54.2024.05.30.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 12:46:34 +0200
Message-Id: <D1MX3G6VN849.WKRMI0MU71Q@gmail.com>
Subject: Re: [PATCH v2 02/20] pinctrl: tegra: Use scope based of_node_put()
 cleanups
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Dvorkin Dmitry" <dvorkin@tibbo.com>, "Wells Lu" <wellslutw@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Jianlong Huang" <jianlong.huang@starfivetech.com>, "Hal Feng"
 <hal.feng@starfivetech.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Viresh Kumar" <vireshk@kernel.org>, "Shiraz
 Hashim" <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Patrice Chotard"
 <patrice.chotard@foss.st.com>, "Heiko Stuebner" <heiko@sntech.de>, "Damien
 Le Moal" <dlemoal@kernel.org>, "Ludovic Desroches"
 <ludovic.desroches@microchip.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Dong Aisheng" <aisheng.dong@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Shawn Guo" <shawnguo@kernel.org>, "Jacky
 Bai" <ping.bai@nxp.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Chester Lin" <chester62515@gmail.com>, "Matthias Brugger"
 <mbrugger@suse.com>, "Ghennadi Procopciuc"
 <ghennadi.procopciuc@oss.nxp.com>, "Sean Wang" <sean.wang@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Joel Stanley" <joel@jms.id.au>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Tony Lindgren" <tony@atomide.com>, "Stephen
 Warren" <swarren@wwwdotorg.org>
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>, "Peng Fan"
 <peng.fan@nxp.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat May 4, 2024 at 3:20 PM CEST, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 7 ++-----
>  drivers/pinctrl/tegra/pinctrl-tegra.c      | 4 +---
>  2 files changed, 3 insertions(+), 8 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYWQsACgkQ3SOs138+
s6H2yBAAgeFKUkMlk3cWjVf9KNcypicIrr3j8r7LwohalNat613qoJ9YbzqqhwI4
Gz6WRZUeiS7foiJu4a7gpc+lM2BsBe1fH2Qp8quSuXvd3qUCG7X5x3lf3NKsgqTY
cXTyByotLJvYp5A/oUqWp1lwEyHec33GjJhuUzl7SD/HXun7zOdGWkBDonQJBlLj
Bs5fE7wt9ekYvMAU7EHBDbIg10fvay+qWs4EJoqxhFgSgnmFSK9NrRZIW8IpWcU+
AYMf2SPzWXdNPHij0BrXcWhV94d+XhSjSk1ERGByH2AOAr9WJ2YtrZm/W+7KVHXe
G/4DE+Ss2wpYr6d4kAVn9GEDwH21w3DBKY38Ah/0B2SE1Nv1LXdaPD2m4SiNSIMb
X55kEyxnrVPM9TTH9LlMKeJBwUDqohmQ9vYKDVuTVGO6Kdu3fc8euMIjCaWW7RkA
lbmgGT83eBp279Bw72mbM83wtPgVvBY9ufV0oy6Ox8cY7D0pDOFCCxLhxYld7XT1
7Sqg9E9rNlM/OX0QBFtCqcx/RtAY6ILPMioWUfFOS6FX8JjA9hviTvPYGNrSdvRl
ZC6LcNmGEY9OjNMxft3NCl+kjz3fkiYyd9UglVHjAi+q4odk2HFwg93bVAEC705u
xsy5uZQ96h1OIwzr643CV9p79G4CjuxDndqb4RfPWrnW3Dkw0iY=
=tJx3
-----END PGP SIGNATURE-----

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11--

