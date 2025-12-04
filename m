Return-Path: <linux-gpio+bounces-29259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFACA4765
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 17:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908D3308BA39
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 16:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E352F261C;
	Thu,  4 Dec 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjrTWd7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA92EDD64;
	Thu,  4 Dec 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864888; cv=none; b=cz6y1Z/gjK9LfPVrkEqVx7Q3Y0ya2tn6BtuU0Z11YaZ5W/a8mFtFGPMeVn+4Dbw1wP9GRFPmGqVfPyjrtgk8PupIFJ8lPUsIlpWWejtygik8CUvrE13kh9KIPfDH0oYCIn+twSL6O38jMzk950yM4RUwPNGIrtPx+D5Usuf1cYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864888; c=relaxed/simple;
	bh=pAQTPCvFXYrGAotRnk0JwW3gTHvZ0ixKDshwUPXxrK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NBQ8OogupZP7Uen4zIp/VixQ3tbN/DBNXFV3yIG8f1VaHUoGHODLBI08rNkR1YmZU7QsBwTEPivnQJIEKBOcQMXtjK0sgEnSajRG8gm+a2QeZHKY3J09J2hwzcM51zsvKQfpXQdYQ31vY8G8dxZWjF4qVpgusiWkYGt8X+93zOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjrTWd7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2B36C4CEFB;
	Thu,  4 Dec 2025 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764864888;
	bh=pAQTPCvFXYrGAotRnk0JwW3gTHvZ0ixKDshwUPXxrK8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MjrTWd7IESQq2OaB5iubUwsUjuDu7SzTTl+xi5NHzYGk96AQlLJ0egKjKgELyx6bp
	 OQnWHPiQXiBr6iIw8IXYevzw7lAC4Bfv68IFaGzXR7665HE7uz9jPMX3keQOMhtzty
	 QRGw+AxSQ4Rfp501MKgCGIWFQED3tSJJmpoqOMLbd77xNd78lRF6DY+GuoJd8uiPlk
	 kpilDTgFD0KC209iWiizP7AjznIrjWNFIJH8kiwf7z0A2zM6QjNSGuK4O3B4ud+JYO
	 RbQ75N2ctTev3T2k53wdQkBOKuBOIq9c3cEICP+CStdBz80xu0jFzh8NlwFArqTaGd
	 fmAj7E0ND53tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC346D21693;
	Thu,  4 Dec 2025 16:14:47 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v4 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Thu, 04 Dec 2025 16:15:25 +0000
Message-Id: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ6zMWkC/23OwQ7CIAyA4VdZOIuBwjbw5HsYD4MVJZljgblol
 r27aKLGzOPfpF87k4TRYyK7YiYRJ5986HPITUHsuelPSH2bmwCDkikOtButBCVoug5DiCOF2io
 rsdK2MiRvDRGdv73EwzH32acxxPvrwMSf07clV9bEKaNKGbDo6lo42Dd904XT1oYLeWITfAHNx
 BqADFTGItO85My4FSA+AOfszwciA9JgI3Xlas3bH2BZlgd8uPueMQEAAA==
X-Change-ID: 20250812-ltc4283-support-27c8c4e69c6b
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764864927; l=2380;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=pAQTPCvFXYrGAotRnk0JwW3gTHvZ0ixKDshwUPXxrK8=;
 b=rnRdWJg2gZbjIbep6IktGTICmCL3KUTRjQh1fqixdCvEtA/d80rvVPRF8MbAvxApjC4N6vMlk
 w8DGYDag4aLD5+OHcQbdhqN/xoI6qGCeA7VvxO2foozbWObJB1KZwLG
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

This is v3 for the LTC4283 how swap controller. Main change is that I'm
now using the auxiliary bus for adding the GPIO device (done depending
on FW properties).

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

Guenter, in [1] you can find some replies for some questions you had in
v2 that likely you don't remember anymore.

v4 is based in last linux-next (next-20251204) so that we get
field_prep()/get() for masks that are not compile time constants.

[1]: https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com/
[2]: https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@glider.be/

---
Changes in v4:
- Patch 2
  * Drop driver's own mutex (now handled by the core).
- Patch 3
  * Refrased kconfig menu to "Auxiliary Bus GPIO drivers" as suggested;
  * Add blank line before including the headers;
  * Fix includes not in alphabetical order;
  * Dropped custom fied_prep()/get().
- Link to v3: https://lore.kernel.org/r/20251104-ltc4283-support-v3-0-4bea496f791d@analog.com

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20250903-ltc4283-support-v2-0-6bce091510bf@analog.com

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 ++++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  215 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1719 ++++++++++++++++++++
 10 files changed, 2511 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20250812-ltc4283-support-27c8c4e69c6b
--

Thanks!
- Nuno Sá



