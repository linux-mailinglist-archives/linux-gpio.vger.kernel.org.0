Return-Path: <linux-gpio+bounces-29833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DCACD93AB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 13:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD1C301CD13
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 12:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E7430BBBB;
	Tue, 23 Dec 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/YxtDV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64F1310655;
	Tue, 23 Dec 2025 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492472; cv=none; b=P372NSvVnLcER6tSWVOVQsGAitn3tg+1TN6zt2IiOQ1Lqzg7iJgmW+2pn6UyIicptxNFAlq7I8+MQ0bAlTnvB95rHXW60FpL0bcTupX/qhwvDPqU6mQ4Lg+SySBecBztAv78b9oxeqU3oboB5LTg6Lz/wiU/svG238NG9IOd+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492472; c=relaxed/simple;
	bh=jhAnj+Jtme12Nuo50V+EmKFGUW7KvEnmq6OcpQAxmfo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pW7wuNBIVNplCvV8XBBBpzPrv8EyGnwcRY8lVMxIr/D6Osv+v+E4LvNGPmvoN3O6q8dj7jxvK3K9jhQoN7kLaecASvbjZOK4Qz0i6Kx4cu+vaYtA9TcgdYfVDv71gssocaIs26nLe0TduJDbmg4dEqLqCnz9pp7AxCofofOc+s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/YxtDV6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C41CC116C6;
	Tue, 23 Dec 2025 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766492471;
	bh=jhAnj+Jtme12Nuo50V+EmKFGUW7KvEnmq6OcpQAxmfo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s/YxtDV6hlZCPbFetCtck8fvPhc+N2vx7pdgCv7duZkOB5vmqXn9KPD5LVC1ToKGs
	 CdVUndd82gCUotZ9fDPeBMG8kLkah3OT3iVcJ5eKdjIxU7m+OlAmt+qYoQi7zPfdsF
	 m8iUusFAX+ZonNyGpkpMUa8u9dnrI6wjkvFS+5e+Dji+0s9W2fXoOralefzw/yrFWu
	 Cz6Ix4SxvGXUec41NP8MfEB9k4H/dak2AHQzPYcyeaVahD/3teQub+Gtuws4T/G4OI
	 dO7YCUYAWaDOnEBd21A+zPqJpTAKYL3q1ckESeob3j8M9E9t3qvS7K0F7N2ZhjDd5e
	 xm4UWfKk+HS5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69069E6B279;
	Tue, 23 Dec 2025 12:21:11 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Tue, 23 Dec 2025 12:21:41 +0000
Message-Id: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFaJSmkC/23OwY7CIBCA4VcxnMUwAy2wp30Ps4dCByXR0kBtd
 mP67osmakw9/pPMN3NlhXKkwr42V5ZpjiWmoUaz3TB/7IYD8djXZiiwEQaQnyav0EheLuOY8sR
 Re+MVtda3jtWtMVOIv3dx/1P7GMuU8t/9wAy36cNSK2sGLrgxDj0FrWXA727oTumw8+nMbtiML
 8AKuQawAq3zJCw0IFxYAfIJAIgPH8gKKEedsm3QFvoVoF4AfgJUBXonwOrQa2vUG7Asyz/syFO
 GcgEAAA==
X-Change-ID: 20250812-ltc4283-support-27c8c4e69c6b
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766492512; l=2262;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jhAnj+Jtme12Nuo50V+EmKFGUW7KvEnmq6OcpQAxmfo=;
 b=zPZqYrKNriSltqV6XCFcc4IVOsfWr3FRco8uAuGRhzOTcsL2dHP7em+w2vcxSObft6G786oVJ
 25q+BgYyhV4ADNU5WL+NyG2r3rGS33ctPB5Jjt7zvSgCNrwjh/v9SIa
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
v2 that likely you don't remember anymore. Regarding the regmap story I
ended up adding a secong regmap for the 16 bit wide registers which
seems like a clean solution (if I'm not missing nothing).

[1]: https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com/
[2]: https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@glider.be/

---
Changes in v5:
- Patch 2:
  * Added a secong regmap for the 16bit wide registers;
  * Add default value for rsense so that we can probe without FW
    properties;
  * Make sure to give the right file permissions to the reset_history
    attrs.
- Patch 3:
  * Make sure to get the right regmap (given that the device now has 2);
  * Add error handling for getting the regmap.
- Link to v4: https://lore.kernel.org/r/20251204-ltc4283-support-v4-0-db0197fd7984@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1766 ++++++++++++++++++++
 10 files changed, 2561 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20250812-ltc4283-support-27c8c4e69c6b
--

Thanks!
- Nuno Sá



