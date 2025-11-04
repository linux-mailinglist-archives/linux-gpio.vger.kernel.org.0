Return-Path: <linux-gpio+bounces-28010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35849C3086E
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271DB3A5236
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C422D321B;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwP7nfHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D5836B;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252318; cv=none; b=uSjbLFsVcgtSyVn3hiL14rWOfSggGAMhiEBVK6pAGroanh0oyQ6GW5cKCfrAk+rLXMq2mnYGg+pfcIQvwV5zIK7x38vNQp/s74YXGP1xW6ZAqY1AOqfSxfL/Tc9P7ljBN73y6smfQtGIwWyB/IhL6Gc32JVkBswVbkp8Y32IGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252318; c=relaxed/simple;
	bh=lqrX3VJKmck4F8Oum/ghWQkXbfNnSJQYqQa2Z2DOAIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l9NxqZScRoGztW2ugUteXy6CrhGTlsSstLt90sq52cEhk8xyxxXD5jTsk9McuW+PSpJZnxNDjg//Dcmn9pBBI7g/V28951armnve+o6QDUQovq/drGtdQ6cpbLoBb5RFOWkeN2wv6BqDIYG4dl3wBVWIICePhcoJrWM9Grr3qJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwP7nfHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0FE6C116B1;
	Tue,  4 Nov 2025 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252317;
	bh=lqrX3VJKmck4F8Oum/ghWQkXbfNnSJQYqQa2Z2DOAIo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gwP7nfHKEIvvfdZjBaHwLqTF1IRHuvV5Fo+oVClSexefhvZx5Apcn4MqF+Ez/6Poj
	 7jSdJbr0Myqy0PIo0X3riDc2pcfKdqnwu+VuIJSvRp2WIsK4wBue40wGcsW/WsfzRX
	 Hqf3eU8Yi/fbToOpFYXTrf3lYDy4d2llvvIFRXmvLI/6pvF5BFw/sjCs1DKXDJtkzi
	 nxv8/yhYfNhoVWm+DEiom1nDx8X7YyWJSu5hsSZjThub+W85Ezcb5MDk1GUEOVYNiu
	 EwC554P4liIWh2Dnp9Rk+WXMbGdBavYN8414qZNW3XzdA54R5eEL2lEeM5gjy9dOD+
	 nXBx+e1BS3htQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02DBCCFA05;
	Tue,  4 Nov 2025 10:31:57 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v3 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Tue, 04 Nov 2025 10:32:27 +0000
Message-Id: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADvWCWkC/2XNTQrCMBCG4atI1kaSSX9SV95DXLTjpA3UpiQ1K
 KV3Ny2ISJfvB/PMzAJ5S4GdDzPzFG2wbkihjgeGXT20xO09NQMBudASeD9hBlrx8BxH5ycOJWr
 MqKiwaFi6Gj0Z+9rE6y11Z8Pk/Ht7EOW6fq1sZ0XJBde6ASRTlsrApR7q3rUndA+2YhF+QCXUH
 oAEFA2SqGQuRWP+gGVZPpcyOkfwAAAA
X-Change-ID: 20250812-ltc4283-support-27c8c4e69c6b
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762252353; l=2772;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=lqrX3VJKmck4F8Oum/ghWQkXbfNnSJQYqQa2Z2DOAIo=;
 b=ShNcElYKzU+ApENVMNTC4KT4zE/bT4YDejGBzaFtFiH7nu18fGZ5syvmOBHN0BdZUkcA7jV1c
 smsJ2KU86ZXCTJgNNIkygRTmt23vRQSU3tlFZeHj7XbawvmRzB0d0Mo
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

Linus, I did looked into gpio-regmap and even add support for
init_valid_mask but the register layout is just so different that using
the gpio-regmap is not feasible. We could maybe use it for ADIO (if we
used to different gpiochips in the driver) but the drivers is fairly
small anyways so IMO not worth it.

Also note the driver uses some non constant field_prep/get() that should
go away as soon as [2] get's merged (hopefully before this).

[1]: https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com/
[2]: https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@glider.be/

---
Changes in v3:
- Patch 1:
  * Changed -if conditionals as suggested by Rob;
  * Fixed typo in commit subject.
- Patch 2:
  * Add ltc4283 entry to index.rst;
  * Remove lock under energy_enable read;
  * Make use of the new energy64 standard attribute;
  * Fix always false comparison in __ltc4283_write_in_history();
  * Add missing reset_history for VIN;
  * Remove energy label. Not useful.
- Patch 3:
  * Add AUXBUS menu entry in gpiolib kconfig as suggested by Linus.
- Link to v2: https://lore.kernel.org/r/20250903-ltc4283-support-v2-0-6bce091510bf@analog.com

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com

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
 drivers/gpio/gpio-ltc4283.c                        |  217 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1749 ++++++++++++++++++++
 10 files changed, 2543 insertions(+)
---
base-commit: 65bc97a5e49ea4174ba7e89afdada3e30e6e39c0
change-id: 20250812-ltc4283-support-27c8c4e69c6b
--

Thanks!
- Nuno Sá



