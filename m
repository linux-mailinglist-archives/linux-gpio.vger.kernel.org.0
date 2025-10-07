Return-Path: <linux-gpio+bounces-26870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4CFBC0C22
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEDA43A2D24
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CC82E3376;
	Tue,  7 Oct 2025 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTCUXA1+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B672DBF47
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826125; cv=none; b=S+70oOFl3yn2XLlGOAQ+DarIV5vyAbRZqzY7MNCy/quCkdm6VAE7EyybuG8T2YWAzlxJMMK5X03cAk8bZxFJG14Op19OEuLl+TFYLZbZjnnKvgeq483wydr3rTgrrSBpgW6+IE+J5YAxfDt2Qz5OcFmTrVhDPYzkIkCpsxVtdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826125; c=relaxed/simple;
	bh=ZHDZ/62yyQM2WpcdFkqxEjcI8DLW3Glqgwz1/vt5I0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJkvIiRJRgT3DE9zae4eki48YYrGt4Fpyv+whPWMI8IdrCBrySlUSTlADYwGRj78s5OrRkR5ZlpoVM/KFTz9w2m0zrTtp+rteeJavra1WwRChwiBrr4yKpdnuIOg0nc+ARjtfB//UNc+F8P5vEBc9cmdIUhoqssCAlD47hgG1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTCUXA1+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso7885900e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826122; x=1760430922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lA2K8SX41xRVhtx0TGelIGFHrpKngX8UyetIiKY/xmk=;
        b=VTCUXA1+FaEj7a+2/oVxdnJNo3BnF/OqvSgUf1HOaNGCamMJjXyoGVmmIX0DegCvvn
         EaIib6u4cM+JuIk4JXcwxC/7+fL0Y18rEHChyr0tFnZ3FhvkDxSCUjX0crvSNwpsTvGm
         sNlUswMSOHz7LRZmE7+BUMnlB5TuDl468/P/8DPaRclpP7zY1B5or4B/CyMB8iw2W3VY
         vfyCB9crDrkUDflJccFbw/HWcM1WyQG+XVVXRlivYuVhJw8DyRJQT4fWDw137MTA+ghK
         on3iUUeq3DGc5ZcmsG8bd5s7snk2+xkHIQUQu2QRPJs4Aog2RCualAfCDR9Q7tAMS0iD
         T4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826122; x=1760430922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA2K8SX41xRVhtx0TGelIGFHrpKngX8UyetIiKY/xmk=;
        b=O743pFNDomSJt1XVQqbWAg2X83kYmJ66UL53GS+YquHy9wAU+GHp0DC0zAbiDB4iMR
         +a0eC8c2RN6SIkythyWTo7YkMb2xi8WDcM3iI2v4dvUQn9orooGyk/syVzVuGo9TGDiw
         uixM/edWGd+l2N7FKyG9ruLWJ/Pj/n/HA588sK1DkLmdOaoHBB3g4/uEz696KQkUzAUX
         pDz4S28VPBMi3aaHqw+6Q3MUlGoi3cgQ243xQ7AQZabbJhYoC96cMLeQq0rOT+BYykP6
         NiArz4AH5/M0gJjUU0Imj86HrEFeCdOl8Rv1IsKLCp8pAXD3gmTLDFB2jI/8CpJfDxCC
         zIkA==
X-Forwarded-Encrypted: i=1; AJvYcCW+1nskPiKXl+ifHFczKfobkxMkLH2l75K1C/6OWO0lY/sGHT3Q1C+QdKYEa73I4y068aqgkgLn/6Kv@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEqAasoUFgvMetazCs4frOblSNDNI4QGc4avFf5/EsLwfFPxw
	VOl7u85KujfeN7dtA24kDJUfAa04HuKn5WmS9kaxyOL2lfrJNXqymBMA
X-Gm-Gg: ASbGncvA6TVLKcfdqzzpztqA61kijq/QuoKWg5R9pjb+8cVudK+tV1qkj+Ufl7mo2JI
	8aFWI4d96SWLYVQP1dAs3IrWdU/eMprt/jm4AR6sutQd0F9DJ7zAF6YURjGhzAojJtbyKLjiZJK
	Zd73Z0n/1p8GG5EOlm+McPlGmYRLv0B4Xw5JkiMso/csG06kdfl564pY1MpneSj5Fn9SSkw2onf
	9o6KOIL4Ukr6eHrPmZ9d6S2FJmZhL+8lsFpU+v/qIYyY4yGw6YnV+Giqs3z45z8UvAD0Ytz1Gw5
	PKCsSiNgTkc1VjJLYnWafjGNWp9W25Ggt+2LGcp88eEAUDRKyeE6oJhC6hN9oc3KFbvA5cvMmjF
	CuBFozxhJh1Pm7tn2J8OuoVcMrVN43txlEqd/B3sDvgD+c/UXCu5JAKES+u7PLkBh
X-Google-Smtp-Source: AGHT+IHWvQFZoM0ayT5AgPXGKHGCCpp31nPy7gmVdN+F8yj0NL32bKU7cfG819gEXcZcLzrJj4brIQ==
X-Received: by 2002:a05:6512:104b:b0:578:ed03:7b87 with SMTP id 2adb3069b0e04-58cbb4416a6mr4798688e87.33.1759826122219;
        Tue, 07 Oct 2025 01:35:22 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112462esm5893790e87.3.2025.10.07.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:35:20 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:35:17 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC PATCH 13/13] MAINTAINERS: Add ROHM BD72720 PMIC
Message-ID: <e413de5850eba28be024f642a4a7ec26c197662e.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlztX/me0LjlXKoG"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--SlztX/me0LjlXKoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add the ROHM BD72720 PMIC driver files to be maintained by undersigned.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21ec42d93ee4..3afd9cb978cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21940,6 +21940,7 @@ S:	Supported
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
+F:	drivers/gpio/gpio-bd72720.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -21956,6 +21957,7 @@ F:	drivers/watchdog/bd96801_wdt.c
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd72720.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.51.0


--SlztX/me0LjlXKoG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0MUACgkQeFA3/03a
ocURTAgAu6dnmWP/JjZcJMWGUn+hYLg15qVmjQNYJoLBcZtaNezTwNj9uXTJeGp4
aF3xpHcZtryUyaerjRHwCYmHkyab19+2EgxtORp2dmdqVhsb/bvOcyuNLz2sFfOS
eDFFRQadRdLwYbi0wx2lhHqfh9/HXUqYQjBwWSaIidlhU5sjVXlsOQYFlkOv/aZe
E3h6QunJQxBavA27oVpucRouBOxpGzFLt80PyB3LwH1j2+PRN2ugZiW90TDmFZNl
e8/nPHDTqoF5T3VyxAXleGRLyrfnF8d+VsTF3R6rj7aQCv2jOw2aHoI96AJAjZgO
DUZUp9dgZicc5YzSzYQmOfchxX1dJg==
=phW3
-----END PGP SIGNATURE-----

--SlztX/me0LjlXKoG--

