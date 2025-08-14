Return-Path: <linux-gpio+bounces-24384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A74B26381
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57F865E5999
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AF23019C8;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ1g/ViX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A42FC89B;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168734; cv=none; b=jFiFkz6N1y0MWX+m+GZf1Kp7Mg7JgWMP7MCDpBVhih1ZwS1RhrYDuwkfmtk2dIQKs1XsfeS9qATtAnO6wG3SWT57MRGsI333mzlRATIIfIyOkBOjcwAtAW8JOcWG6mOSKVAcxoYu5Ln7vEnZYHWB0CZNhAtbZs5ZODd3AfcwGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168734; c=relaxed/simple;
	bh=LS7UVXZq5BcWKHTjEz4xF0C5gnYu/PomYCrf0wF8d4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HHQxU+p2QlZgcqCe9fgqIL86Siww5dqVk+4FiEwdaXbJN8PYRLnUSeUb9cdK1TtGKw15Bp1DaLL7Gxpv8fO13r6Yvf4WvSOv1rJx0DpAvkyr1NuS6+P+MFnASwFJs/rDhUd+B/8jyFj8OHDC+0bthzGlYqp2Gc3ykgZinNrMZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ1g/ViX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9614AC4CEED;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755168733;
	bh=LS7UVXZq5BcWKHTjEz4xF0C5gnYu/PomYCrf0wF8d4E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aJ1g/ViXBXs2iruF7oQkCtU1HxWGhnC09lXi6kvjc8adbYelCRMgpNgXZkAG9tu9B
	 Vg7oVvPl23Bog5EbB+q2Xtslou7c6shQ5gMp5jxpRQYWYrRF8IAnWLhVJKz+gLL11B
	 jqI0eRLIaF/gWgLPoHmMV46tSvE2HYHJ7v0MSb48VcgppRV6HVDabGWy+5kYi9XlZ4
	 88oGmOSH1iCeLP0yEtvaNpvRRSJbKN1xkPytNZMLeEAXnm2S1R/HzcbZvEozuQcmG9
	 pFe/uQMc9HQmsfikV//L7AZ9+5pPuSc/0N7i7+NZPn7IvBcUlBQ6zSHGsYmY/NHltb
	 koVaLhMkaRcCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85884CA0EE4;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
Date: Thu, 14 Aug 2025 11:52:22 +0100
Message-Id: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOe/nWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Mj3ZySZBMjC2Pd4tKCgvyiEl0j82SLZJNUM8tksyQloK6CotS0zAq
 widGxtbUAb10EdGEAAAA=
X-Change-ID: 20250812-ltc4283-support-27c8c4e69c6b
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755168752; l=2545;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=LS7UVXZq5BcWKHTjEz4xF0C5gnYu/PomYCrf0wF8d4E=;
 b=MYo3wIvH+i4xncYor+OvLaAiEb1eJDXKd170JjyFYsTrHb/1XGEBmjy7wA+RsfpOVF9yBBaDf
 xLciOBqry6+CDhImzd4dU9U25eN8kmw/N78xJAXiS+eJWxTHiAId65b
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

The LTC4283 device features programmable current limit with foldback and
independently adjustable inrush current to optimize the MOSFET safe
operating area (SOA). The SOA timer limits MOSFET temperature rise for
reliable protection against overstresses.

An I2C interface and onboard ADC allow monitoring of board current, voltage,
power, energy, and fault status.

It also features 8 pins that can be configured as GPIO devices. But since
the main usage for this device is monitoring, the GPIO part is optional
while the HWMON is being made as required.

Also to note that the device has some similarities with the already
supported ltc4282 hwmon driver but it is different enough to be in it's own
driver (apart from being added as MFD). The register map is also fairly
different.

Last time (for the ltc4282) I tried to add the gpio bits directly in the
hwmon driver but Guenter did not really liked it and so this time I'm doing
it as MFD.
 

---
Nuno Sá (6):
      dt-binbings: mfd: Add bindings for the LTC4283 Swap Controller
      mfd: ltc4283: Add support for the LTC4283 Swap Controller
      dt-binbings: hwmon: Add bindings for the LTC4283 Swap Controller
      hwmon: ltc4283-hwmon: Add support for the LTC4283 Swap Controller
      dt-binbings: gpio: Add bindings for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/gpio/adi,ltc4283.yaml      |   33 +
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  159 ++
 .../devicetree/bindings/mfd/adi,ltc4283.yaml       |   85 +
 Documentation/hwmon/ltc4283.rst                    |  266 ++++
 MAINTAINERS                                        |   13 +
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  233 +++
 drivers/hwmon/Kconfig                              |   10 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283-hwmon.c                      | 1658 ++++++++++++++++++++
 drivers/mfd/Kconfig                                |   11 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/ltc4283.c                              |  140 ++
 include/linux/mfd/ltc4283.h                        |   33 +
 15 files changed, 2654 insertions(+)
---
base-commit: 9703c672af8dd3573c76ce509dfff26bf6c4768d
change-id: 20250812-ltc4283-support-27c8c4e69c6b
--

Thanks!
- Nuno Sá



