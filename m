Return-Path: <linux-gpio+bounces-28304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC3C49044
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C9218875AB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093E33370FE;
	Mon, 10 Nov 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LojUZMT1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC133555E
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802944; cv=none; b=fDz0K1BzJYhRDjS1jMZI9304TUwnMTCzwse5zrq5tYBWl1jfsDcN9yAwNbydd0BZPSrtU0oXR1xszWGxxK4sCunqy2gwZ1zW4D4SMHoLe52q8wdqevFq0w19QRJaQlf9YIV/OLxSbLFTXvAsb4yDHYMJS8hCd1OLztcvpH+hQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802944; c=relaxed/simple;
	bh=f3S1cKdht3kZHoel4MbQIxp/lZBX/mNmHWJDKrE9xDg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=adHytT7zDN4mZOrqj0B66zs3/MU8IISuWWfjmTL1ioOE9YKdEJKlNOIP7M/VuzQkSrpnGLjOvewjMhLjKkaKKf2tQ5nPUtm8nxiq7ZlaNgeE1eKi1bNzoTq+3+8HKqW8aYGusV+85jVEixWJASxIg5QmgcA1RMovXlXe8otNVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LojUZMT1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so3375344a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802940; x=1763407740; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKdZe89NorWwgJaIO/LXEozigX9tYIbwZu+kVWuAwYQ=;
        b=LojUZMT1NhkfMwteUEb5Dfjb07Se00OplvN+9CyuCs5+3956L+4t1ajeLNkxsaga2S
         xRLR62ROZAHPng1PBdIpI7MUsufRptZ5cvsjYRDm3YIWRnTV9qlOCSBRoivXDrslK4VN
         LuKAcX58NAEkTE6FMdZQg+UzOFBHor0XshSctJ53m+4ccG3WqeSZ3oivVwWHXzPwbEHV
         FoBN+Ua/0mxSRzojuvyzRMSMNqLlnjDH9Qqr8U/4KYPcEJlFe7FN/mnnuGEaNrBnJuui
         JnvBJd/5Q1+hoj7b3sEPZwJ9aFefOnUBMrg/A4gyYR11EZFSmJWYaR/obQapm4UZVVnQ
         aKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802940; x=1763407740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKdZe89NorWwgJaIO/LXEozigX9tYIbwZu+kVWuAwYQ=;
        b=jGlSOUzXJ/qQmqoIlhQCiryD24TlCliN/z2VF/GsfhlcKNwuCzEHXqQlVK79ORs47H
         N1nYLZ+6EA4z8MB/+QMAVQiYmWimhySEyZ1zwnyw+ujQ1g2tEcpP85uCMXJipl98qBMd
         LPfIRpRNQlBWjy64M1SQO++MxM5JRz+GgI2mR0h3f+TCbwLvclomWqEIyheDymAE89tz
         8fLZXa85DCWGEYPLqCXllzNrRF34c5DFfefJhf7h7nsl7s8pzqCbyYg3nIyx1GOldk1t
         ane01U08UxaA7ZI46QQg+gxf9rojFjhlVXSCPGwkZGDhvqWzrhu8s/5Eco5q8r13EoAR
         uCJw==
X-Forwarded-Encrypted: i=1; AJvYcCXVYtOghAeVWy85hJGzEYMd9018xI3JRIUpKURQQPakw2mYJDKJS8a/vdiD53hFXLXBAIVhLEL0IPSY@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgRgShXPtLzSxEWVUGIH7hzMHuvXUvrHwcSo7R1vlr9mdJc0d
	wry5i7wipJ1R0D4MRwDUCEiGPrJnWeiOcf3J0nJdQ6MC4xLdokbIHTtWn62gxrq1FNc=
X-Gm-Gg: ASbGnctqlrNSB4/3zcdSPfEbKlcgpjnmtYF+CtW6RJrZ4FVjW1/SG701IO7menuRrTB
	7rvZIvPaWgD5ZT27XxjgPp0AfyM7OYz2UnRRri1uxwArUtgrUChwap5YFvbqf8BZBEmbi+PY7Xr
	rIS/v3Lmr7K1XCuQvv/MewfZXQ0uh9zvbticNACbhkYbhamxn86+itCIZvoHstgPVT85+XnIIsN
	qR9skApTmdwBYURrOulRfbJs26yVYTV6YC2Jk5LEsyIZTuTcxADcsC8Kl3ZHajQS9DBclZWyWth
	Go1Ms/0iv7C/BWC14NzG9sjHyZ9CbKzI72cwlWvweKO/9h4vFS6JbATcS9WIl6E3vs5++gGK5jQ
	8zZ37Lz7ohBdUZFJRM52cUIX4LStEEDZ6lwxgnUvNcFu1GF/umkozidx6qCxk9rKlrbF7B0rYfB
	E8a8W309ZpqlhK6cp1RWrYH+sBtvYI6VpLmgeGOkbM4q6CRmFa56nNAz/Ebp7/
X-Google-Smtp-Source: AGHT+IH2dqirFoLkavJGS5qBPbnJ9M5TyrEZS7O2lfAv2uox0RTpc8G99qEsSV1feTjCe5cuHy12Mw==
X-Received: by 2002:a17:907:7b83:b0:b72:7dbd:3bf with SMTP id a640c23a62f3a-b72e045a604mr844093366b.43.1762802939607;
        Mon, 10 Nov 2025 11:28:59 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:28:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Date: Mon, 10 Nov 2025 19:28:43 +0000
Message-Id: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOs8EmkC/23Pyw6CMBAF0F8hXVvTF4+68j+Mixam0AQpabXBE
 P7dQqLRyPJOZs7NzCiAtxDQKZuRh2iDdUMK4pChulNDC9g2KSNGWE4KwnFgt7GlE/bQPnp1dz7
 gUglaV1xKpQ1Kh6MHY6cNvVxT7mxIe8+tI9J1+ubEHhcpJjhVVaUgRkgF594Oyruj8y1avci+j
 WLXYMnQhBswpmEFo38G/xiU7r8V+WpUWha6lEDy6sdYluUFsL455T0BAAA=
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers. I would expect them all to go via the MFD tree.

The patches are kept together in one series, due to S2MPG11 and its
regulators being very similar to S2MPG10.

The Samsung S2MPG11 PMIC is a Power Management IC for mobile
applications with buck converters, various LDOs, power meters, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC and both are used on the
Google Pixel 6 and 6 Pro (oriole / raven).

A DT update for Oriole / Raven to enable these is required which I will
send out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- Krzysztof:
  - s2mpg10-regulator.yaml: move additionalProperties to after allOf
  - s2mpg10-regulator.yaml: use $defs, not definitions
  - split samsung,s2mpg10-pmic.yaml and samsung,s2mpg11-pmic.yaml
  - add full example for samsung,s2mpg10-pmic.yaml and 11
  - acpm binding: commit message update
  - acpm binding: pmic -> pmic-1, pmic2 -> pmic-2
- ensure binding file names match bindings
- fix typos in s2mpg11-regulator.yaml description text
- collect tags
- Link to v3: https://lore.kernel.org/r/20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org

Changes in v3:
- Krzysztof:
  - split s2mpg10 core binding into separate file
  - drop PCTRLSEL values that can be described using standard
    properties, and update remaining macro names (self)
  - drop maxItems:1 where not needed (Krzysztof)
  - samsung,ext-control-gpios -> enable-gpios
- fix LDO20M_EN pin name -> VLDO20M_EN
- move all binding patternProperties to top-level
- one (driver) instance per actual rail, not per rail type (LDO or
  buck)
- new macro REGULATOR_LINEAR_VRANGE() (patch 10)
- address some (pre-existing) checkpatch warnings
- various updates to regulator driver (patch 16 & 19).See footer there
- more descriptive commit messages
- Link to v2: https://lore.kernel.org/r/20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org

Changes in v2:
- s2mpg11 also exposes additional GPIOs, update all relevant commit
  messages (nevertheless, GPIOs are out of scope in this series)
- fix some commit message typos: s2mp1 -> s2mpg1
- patch2: drop | (literal style mark) from samsung,ext-control-gpios
- patch5: add | to vinb*-supply description for better formatting
- patch13: update ::of_parse_cb assignment
- patch15: drop duplicated ::of_parse_cb assignment
- Link to v1: https://lore.kernel.org/r/20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org

---
André Draszik (20):
      dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
      regulator: dt-bindings: add s2mpg10-pmic regulators
      regulator: dt-bindings: add s2mpg11-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
      dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
      dt-bindings: mfd: Add samsung,s2mpg11-pmic
      dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC
      mfd: sec-common: Instantiate s2mpg10 bucks and ldos separately
      mfd: sec: Add support for S2MPG11 PMIC via ACPM
      regulator: add REGULATOR_LINEAR_VRANGE macro
      regulator: s2mps11: drop two needless variable initialisations
      regulator: s2mps11: use dev_err_probe() where appropriate
      regulator: s2mps11: place constants on right side of comparison tests
      regulator: s2mps11: update node parsing (allow -supply properties)
      regulator: s2mps11: refactor handling of external rail control
      regulator: s2mps11: add S2MPG10 regulator
      regulator: s2mps11: refactor S2MPG10  ::set_voltage_time() for S2MPG11 reuse
      regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
      regulator: s2mps11: add S2MPG11 regulator
      regulator: s2mps11: more descriptive gpio consumer name

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   54 +-
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         |  120 ++
 .../bindings/mfd/samsung,s2mpg11-pmic.yaml         |   88 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   29 +-
 .../regulator/samsung,s2mpg10-regulator.yaml       |  158 +++
 .../regulator/samsung,s2mpg11-regulator.yaml       |  136 +++
 MAINTAINERS                                        |    1 +
 drivers/mfd/sec-acpm.c                             |  213 +++-
 drivers/mfd/sec-common.c                           |   88 +-
 drivers/mfd/sec-irq.c                              |   67 +-
 drivers/regulator/s2mps11.c                        | 1193 ++++++++++++++++++--
 .../regulator/samsung,s2mpg10-regulator.h          |   53 +
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |   99 ++
 include/linux/mfd/samsung/s2mpg10.h                |   24 +
 include/linux/mfd/samsung/s2mpg11.h                |  434 +++++++
 include/linux/regulator/driver.h                   |    5 +
 17 files changed, 2605 insertions(+), 158 deletions(-)
---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


