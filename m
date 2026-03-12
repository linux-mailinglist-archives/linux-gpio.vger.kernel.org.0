Return-Path: <linux-gpio+bounces-33231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPZ2MQ5/smkcNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46726F2C0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 542D73024512
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F92538B123;
	Thu, 12 Mar 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA3QLlDI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE83451BB
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305611; cv=none; b=AMDuVSCpu29i9RRRVi3aQC/OtgwxCV0Ecab6md5E0lcTz/UC8BmSq/AZxH6D2r1Z6uIg4DyK2I2+XhWQCRHpSNSNXvHBKoHrgfrEWjVq2eZZNCRFDirg8Vr6Zme3lQRm9bCtqtsT9kFusoQ7RLPSK5WYu3IQ3P4IleC5HgJUrfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305611; c=relaxed/simple;
	bh=p/JAKs7NWzF1m5aEq+bkzZ4yMmdPKRK3yztNoRPiRjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRyvFg+rMtLJIb9xWYN+5vvv6zhH/U1CH1F45puNCbc4gKzIZAKgusNE5YTbciiezavfkPDnx6qNLsD97szAQq5O013VPC3PQ5YgEP6yjPAC+nOUyR3CZHQ+M8AAl9TjSfQu6JdkNUKFQtgb1vRLQNGGZ/9+salnNBtogU/Q4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA3QLlDI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso640896f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305608; x=1773910408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTrSsL9QlReX76KzoF5h5IAusAmbCrnvx9qilBb+C9w=;
        b=iA3QLlDITigZrgXtkcaIGXvuCsf6vgPVEzE1wwSW7JcTRADxFnl95dcfBgx0zTDhpO
         6JuOlBlitv2nxQfmoYixvyZtkK0+u30lb9w0DhHVQwoe/MT+GlXhnbic0xG8H8WYlCuz
         3Z6Oatk5cMDXSN2+BbwEp80+2WXQiWmokDLBtbZFu5irzgJQ6nrOWoJxCww6wS1vZiDj
         DQZeuWw4FVY/Paxy5/XmxKvHXBdb4y4acfhPRzPLpQS3E/MPz8StRZmoYbb2exvr6khW
         EIjUYy4ddIohYMrEe3DSb2G5IZq2uMHcBYky2WRFAkcgxVywggWeSNKbFp0zJdboFf6B
         mr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305608; x=1773910408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTrSsL9QlReX76KzoF5h5IAusAmbCrnvx9qilBb+C9w=;
        b=aDlAuyUK4TY2t4vsLrtcbFEo5HgYZvr4o02rSLjI/UEi61v+xsZxGH+2r1JYY+7cUV
         je42HjPShkdHFm40Cnxq0asWTckvNYCA4RuXKo+VVI9bkVoGVHFKwPeP+L7jsWv+2gtb
         +P3xkOvN/X1+X4DkMaLORWxuRkeDWKx0Bk4Jzyhf8PeVQdU4sqMzR0kuidsNqNg6GYIB
         1dFZ7Ou0OdeoF/Vu+lKo7sL/oGWJr3dbbtp/M5RNR+F3472e0FftzPBQ2L1iZacb0Ies
         CJhut2Yff1j66tK41WUznW/UOollKljfGKCWmuSkGdaifxJWushNC3U7UEDLUScF8Hgq
         V0dw==
X-Gm-Message-State: AOJu0YzaZTbtcNhyVP/t5ECON5CM5Y5I8kKnn+Q3jig/IkODJvBJwCMk
	euOQkfkolVtCZZS4/10rnxnSaaWF3/FXd+H/qokJMro2ZOAs84UdE2/t
X-Gm-Gg: ATEYQzyng0R1r7Meb/YYQCYgDCpHzBWpl6OhAJ37gRQqLo7EheCTryLO5rZV9+LH3iY
	DfIkLvpVpXFe4n/Di1lRcoBdZqJTm6AFP74gC3pXS2wJAjp1QLpL/Y57NPIedaXsEgbrpRYPskq
	Ct4nxU9oqUTSFQjuQK5pSZDrW1ATcDhp9cbg1JPzR7wHFtpERTrC+sw7XQ7GXnIx+RAiTEyKC+w
	WRMXdeomDAp7w+xvKl7ETuAS4ArSWfDBXldLjFc6GkrjolW7dlXkgkyq9qSY6Bg4InHdGypIqhT
	i5b0aPZXQaP+ffmDU0e8cwSxsVz0XtP4+GO5uNPVjAejwkUg61wwb1Of1zK0a24SNyJ8MulEvWs
	WBUOZoR4mWozqJwuoX/Lrcsftd3JPAsD2UGS0qsCu5Fp3YkOG2XjaOn5+mqdtOFb6HmmEo/hE8X
	D7J2rbzx6zgweLXeQ4bWW7Dz8=
X-Received: by 2002:a05:6000:24c2:b0:439:f5b2:d6b5 with SMTP id ffacd0b85a97d-439f81f2479mr10977159f8f.9.1773305607763;
        Thu, 12 Mar 2026 01:53:27 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v4 0/5] rtc: max77686: convert to i2c_new_ancillary_device
Date: Thu, 12 Mar 2026 10:52:53 +0200
Message-ID: <20260312085258.11431-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33231-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F46726F2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

I have tested this patch on LG Optimus Vu P895 with max77663 PMIC and
non-default RTC position. RTC is registered correctly.

---
Changes in v4
- adjusted pinconfig node naming
- changed interrupt in the example
- fixed indentation in the example
- corrected pinconfig node name in the example
- commit "dt-bindings: gpio: trivial-gpio: remove max77620 compatible"
  squashed with the converting patch for this compatible

Changes in v3
- max77620 files converted to DT schema.

Changes in v2
- dropped patch that changes max77686 and adjusted max77620 where max77663
  is described.
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: regulator-max77620: convert to DT schema
  dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema
  dt-bindings: mfd: max77620: convert to DT schema
  dt-bindings: mfd: max77620: document optional RTC address for MAX77663
  rtc: max77686: convert to i2c_new_ancillary_device

 .../bindings/gpio/trivial-gpio.yaml           |   2 -
 .../devicetree/bindings/mfd/max77620.txt      | 162 -------
 .../bindings/mfd/maxim,max77620.yaml          | 444 ++++++++++++++++++
 .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 ++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 -----
 .../regulator/maxim,max77620-regulator.yaml   |  99 ++++
 .../bindings/regulator/regulator-max77620.txt | 222 ---------
 .../bindings/thermal/max77620_thermal.txt     |  70 ---
 drivers/rtc/rtc-max77686.c                    |  14 +-
 9 files changed, 652 insertions(+), 585 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt

-- 
2.51.0


