Return-Path: <linux-gpio+bounces-26857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE81BC0A39
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE255348962
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F042D592F;
	Tue,  7 Oct 2025 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA+t8WLI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66812D4801
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825970; cv=none; b=bFOgajT6bBj76I97nJrNmLwdXCIQHsWqJ7v0zYMQEEd3HxuSJhtfrD/Lp2nhC2DuMons8pKZlBPg7nULHhGJUkD9mufXs9hGUflbmcM9GNENjHioOBm7TjgFPwlh12Fncqaygb/3BiMdjffMTBQHmDihFvjzkEJNdlMIuREjRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825970; c=relaxed/simple;
	bh=6YA48dRdMn98EKLf0B0E8UQI+JrUJv05ObeY5TJyDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKX+C0tzjS7gE2cKXrKFGI+AWg6AtZOCkV6OlnEekZ+PWkWSrGPu+NfHI8ulQw5iuOFiCmJz23Hzd5Gq8agEm0Zy448LiVIBoMneZPQScpePBapsHzlJHn5RMjcWoYWGpPb9OfDcgsNRjO6+QuWrRv37BhcadVfknFrun7ZvaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA+t8WLI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-36d77de259bso49718961fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759825966; x=1760430766; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3IEuIwN+kSi/yp1WzBh4o8EnyjA8K4wg582tbfmoa4=;
        b=JA+t8WLIHPQLSAG1PL4DAX6nUWh4aRzm0huisIDpot1hyxgIOHtf68MR/T8Uumzjqw
         OOvNsz0NfA/V8vvqKOMayF09j8jzRXyjMad2nuem7uYuUjReD1VhdfXi96c3UuXqaMDE
         HeQfHd7ksDedSbAngpgd1Mlg5tbfCC6FiZy/BGltqn4/WUv3s0UTxDoMzNfzfCe+dOvo
         8I85F4uQDS1LI8v/dHPRKDxDT4Lum3nU93pzhRMUKcP5d8wLh/aWs4fAwsxiQytRPPFB
         0Hjc9+T7L8GF2kKA7hUDTG72jFw8gZaX3epenYd6Z8b+u3S6G+ZgRV5YZtN+GVcHIoCZ
         v9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759825966; x=1760430766;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3IEuIwN+kSi/yp1WzBh4o8EnyjA8K4wg582tbfmoa4=;
        b=tF6GL2rhMCeEMn2g1I+6werVVhdRugoPqaLMEQlc3gbX18/J/4tvrpPVLdsOOEJ0Hn
         qI9Zi5nRDo4Zj9K5sMFVPjXEwLS6ecwcqzHDkFZGLEV5qoeR5wn5hjw6zgSVuXiVBOVG
         Q8qGr5Ng5uIleli0Arl7oyL+E42XsNa2EMQqULNziGPAioyV5FrczAMO1czR0R5JLdOH
         yF2Oml20iby5tqq37Kb/6hfvs1jn0ylLLidO9qwCHj+ZfsL4ww0hHqYtGjfrS2GatBkc
         ZJm961qzkspuZ02W4SUc0dL0ZfM3QvW50KD+WiEH+F8/qr8XJ4r49Qu+VGx80GoBXlwN
         kqug==
X-Forwarded-Encrypted: i=1; AJvYcCWOvgF+hDupUYEV/2QbO9QthSiTwO30t9fi9EMi9C7tg/4Q48js3WVBLGjwOeOBcSaxutdTVxOF0PF4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ymXNyY3V10t/M79Of5xT2JIDB7wMe+mZ+qzSDMr7G/vHwVTa
	vibQqdWgT5NJScjL2L+DvR7GtrVJIWDY6avIIsF51hmlLVlWbKgnzIdm
X-Gm-Gg: ASbGncuS0/ZuHbrx75BkE7ovqSJHgwb2/LpzREFpLNtU7G74MwJ7By1XdVc4a+0sSdz
	uH4hRjb2Oikywz95o6qTpHbWvylAb36GAQYTXU2+NM0JAriI7rJmohzil9J4ktPgTBodBN09/h+
	9HVhu5blQdyx1ioasRl7C0cF+cnvjSrO7rOvBIdHympdFFvpo0so/yRdVIvK4PTRQxDyD5ieBuG
	oImZefYMl4w9j/lWOzBcY3bHC6n8im5KRrvnGQM1AZJIvcq7QG+ftRvQEeW/GbNLZpazK/KWFPb
	DB7IDdPAqZUbTsHn0qglrPAfmjDDz2hVuv8ZVvhn2l0btF8PEsJmLIFFnQB32d+nXYOkMAAwqr+
	mpESfDGxAWN4q+9jnAwtuVO7X0CHICbPp1UAeJpUvIGsCc8pfEizJMg==
X-Google-Smtp-Source: AGHT+IHKnIR6bZ7zCgqGQnWqvEpoa2uWu0PJzc9KxMfoImMFOI43uHYL9VOuRoaIsbm62UKnLJwRzw==
X-Received: by 2002:a2e:bcc9:0:b0:364:45a:5159 with SMTP id 38308e7fff4ca-374c3825faemr47972051fa.30.1759825965509;
        Tue, 07 Oct 2025 01:32:45 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b63fffsm7785271fa.40.2025.10.07.01.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:32:43 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:32:38 +0300
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
Subject: [RFC PATCH 00/13] Support ROHM BD72720 PMIC
Message-ID: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CSuc6sH3Hezd75HV"
Content-Disposition: inline


--CSuc6sH3Hezd75HV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD72720 is a new power management IC for portable, battery
powered devices. It integrates 10 BUCKs and 11 LDOs, RTC, charger, LEDs,
GPIOs and a clock gate. To me the BD72720 seems like a successor to the
BD71828 and BD71815 PMICs.

The reason for RFC status is the addition of VDR battery parameters in
the device tree (patch 3) and the fact that BD72720 uses two different
I2C slave addresses.

This series depends on the series: "[PATCH v5 0/3] power: supply: add
charger for BD71828":
https://lore.kernel.org/all/20250918-bd71828-charger-v5-0-851164839c28@kemn=
ade.info/
sent by Andreas, which is not yet merged. I will rebase this on
v6.18-rc1 when it is out, to see what dependencies are still missing.

---

Matti Vaittinen (13):
  dt-bindings: regulator: ROHM BD72720
  dt-bindings: Add trickle-charge upper limit
  dt-bindings: power: supply: BD72720 managed battery
  dt-bindings: mfd: ROHM BD72720
  dt-bindings: leds: bd72720: Add BD72720
  mfd: bd71828: Support ROHM BD72720
  regulator: bd71828: rename IC specific entities
  regulator: bd71828: Support ROHM BD72720
  gpio: Support ROHM BD72720 gpios
  clk: clk-bd718x7: Support BD72720 clk gate
  rtc: bd70528: Support BD72720 rtc
  power: supply: bd71828-power: Support ROHM BD72720
  MAINTAINERS: Add ROHM BD72720 PMIC

 .../bindings/leds/rohm,bd71828-leds.yaml      |    7 +-
 .../bindings/mfd/rohm,bd72720-pmic.yaml       |  269 +++++
 .../bindings/power/supply/battery.yaml        |    3 +
 .../power/supply/rohm,vdr-battery.yaml        |   78 ++
 .../regulator/rohm,bd72720-regulator.yaml     |  153 +++
 MAINTAINERS                                   |    2 +
 drivers/clk/Kconfig                           |    4 +-
 drivers/clk/clk-bd718x7.c                     |   10 +-
 drivers/gpio/Kconfig                          |    9 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-bd72720.c                   |  281 +++++
 drivers/mfd/Kconfig                           |   18 +-
 drivers/mfd/rohm-bd71828.c                    |  429 ++++++-
 drivers/power/supply/bd71828-power.c          |  172 ++-
 drivers/regulator/Kconfig                     |    8 +-
 drivers/regulator/bd71828-regulator.c         | 1025 ++++++++++++++++-
 drivers/rtc/Kconfig                           |    3 +-
 drivers/rtc/rtc-bd70528.c                     |   21 +-
 include/linux/mfd/rohm-bd72720.h              |  632 ++++++++++
 include/linux/mfd/rohm-generic.h              |    1 +
 20 files changed, 3064 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/rohm,vdr=
-battery.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7272=
0-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd72720.c
 create mode 100644 include/linux/mfd/rohm-bd72720.h

--=20
2.51.0


--CSuc6sH3Hezd75HV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0CIACgkQeFA3/03a
ocXGRQf9Fg+ekH76K2Nj0JPhscKVrENn2YhQbC79mnV8FMFze1JrFm3tjv/gUV4e
haaJ6oCOThcYJV5fW01BNO8cU1muXFK4cACorQIezuFCjrm+6eZuLHBLbCCFfeQf
qPHVe3OtW5OM7s7uuyWdvnJb++lD2Ml1+RgwFpSJjZhnn0nqw2ajCpbdmqWGcvmz
+pMNZ3wlwOXy7dEGW7KfqfKnsJaBdT863auNwGVASr7drPrztw7l3G7RsZgzTLdb
iUeKZFmHGo4//esuacjBO+IinTdL0Djr7MDrsGMHZGxLpVchVk4OLO0zMf1Tm4Dv
5i0Bo2Z/qfyXp8zk9renVN2jjQ4Q0w==
=nj0c
-----END PGP SIGNATURE-----

--CSuc6sH3Hezd75HV--

