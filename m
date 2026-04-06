Return-Path: <linux-gpio+bounces-34698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JoxKhtm02nmhwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC33A217C
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 490FD30158B1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 07:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B960F366DB7;
	Mon,  6 Apr 2026 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwINUzzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E9370D73
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461890; cv=none; b=FPvPYPJjZoJRB6DAKwo5jFS8UogSD6fLAdmbuO3idIollOmqPoGwrRaiEomxorRqNvjkPqPWIg27jOg4JfMZw0vH+scAUvkgHIrrNMkFT2gXKgMBaAkIVPY/pLk9AS8tDWYmdJ+0jfvXDTZf5SIpdWGS28ap8nOAHu6Q4RUrYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461890; c=relaxed/simple;
	bh=SEmsAqHjWzSjMRRIk9zZE76RG8HXzQCV9AOLnG25kjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jwe/63o5vcH+wCLMJ4KmMRRaVIyy2UoWM3gfql99MuCIaPFphb7I9ysKEETvyFHcQ9JhmfIasAq87XHFYytXxosMiAe9hRgBvgiThQYN95duu+iAcOcNJSjRSMnEETKE9A2SIAAjRCqpbuKQdKWV3qtFLpT/rKCLBn2UBMu2GwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwINUzzN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8efed61so151825e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461887; x=1776066687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rsA0Hj8nsuRsqpJ4sAx6KrXhjtnw96EIBhafsErWLc=;
        b=ZwINUzzNNI8BbGWL6v3rkB+wPTIdXxQejjVYahnNib1osa1x/NQYZwEYxxynCMqJP9
         s6KQT/m5J4daGTGUSxZBTkwigjXpTc0wwak2L9fBQf4oCcw7kkxAocDzqO1zjNSApv+3
         2X+vvWn0hjkyMB+i743QD94T0E3zS+YUiUaNa+ND3JlawJqo80ViM7JPyoA8oR+nuZ7E
         ULzAmR3ZW7oPzHo4x6UlT8CZ7fgTAzLbqP69rmw/tO0Wvi3Yu9FeG1Q63dG7t95iwG4A
         ark/uhhpZh41s7E/1BfcYcDQhGzMjGw+16Ar1FKDf5nGq+OKzwsxC/hbWLL0iNHw3Gw0
         cTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461887; x=1776066687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rsA0Hj8nsuRsqpJ4sAx6KrXhjtnw96EIBhafsErWLc=;
        b=lM5sQAvVbJmN6TmJytFFUrkINnVvPF5wK5KJgsiVUQvdOnZdqKVY9RPl0f19LYPxSR
         CU5QhxiCesHZ7GvK5O9tWolOns6+oKszZaS2bdFPNVoE2JwcewKyMqzdQvXiaGhRCBIZ
         udjuced8rx6T045DoMjsAZLo40DO0kJyUPXQl/AuEhnrNBJ6ZK03eIeYuW6UzWLmBIT+
         lcJEbd5LZZX0BrBtsei1etjrU8IuJ+aKshKV2sqP8/CnuMunWr94P33YXkUgQQ0fgd1c
         vi8wMDUSgVSMDHtFzy7NwvEZPGnXqJLteg8M9fUm1UAtukPoNJ2uHYyC4Htv23Sq3KFM
         y8Sg==
X-Gm-Message-State: AOJu0YyjRa2LTLEclDiDSOehv3naPlRY3/HCkHKfnb+/O/GRPX5lXuOH
	kU5+PIVzVXiy3c3LFVuaJ5TrDQPiGkdVPIRPR50+IoFXbWFRV2AAmukuXN2aGy0J
X-Gm-Gg: AeBDietNhuWYZjBsGsKAlL+2vAYS5IZqSNs8N88fRFNenrH5ch6r3AiBgE4CctET8i1
	a0DmIy8qqelNP1s8+JfpujYPpaIsAWVw2AhD7lVyI1sQvlpUrD4HWDLLGRNLp0JtebbGYyqMlF+
	+LuuoZdTkJ/hejcQsGVrDd5X3Uo/b/rR9UqkyyTkRes7LOdmRRYuha3DzvvFwm6HgMgpy5p4QbS
	m5DieIkFnK3+ltZttA+j6WqSoi6bfPpxhg08W67yc+8qJjmGL33pnQ+6dvGNIJYzrpXqi1ID912
	XqI4LaJ3YCmE4KVv45y65rASBMV9RZRhq50MXfGpOul/QinNwBx8MbJYYFJuo7bMpbwA8Vyi/pX
	P8qlVmDQedgiNq0n4NchNxxA98W6fRt3lD2j20cwdINaCOHQZkfusAz7qtWLi75LKoP4riK+W02
	l/FO4maTCWLy6W
X-Received: by 2002:a05:600c:c0cf:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4889945f8e8mr108708845e9.2.1775461886934;
        Mon, 06 Apr 2026 00:51:26 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b739e00bsm20393525e9.10.2026.04.06.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:51:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] rtc: max77686: convert to i2c_new_ancillary_device
Date: Mon,  6 Apr 2026 10:51:12 +0300
Message-ID: <20260406075114.25672-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-34698-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54EC33A217C
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
Changes in v5
- fixed pincontrol schema
- dropped applied patches

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

Svyatoslav Ryhel (2):
  regulator: dt-bindings: regulator-max77620: convert to DT schema
  dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema

 .../pinctrl/maxim,max77620-pinctrl.yaml       |  98 ++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ----------
 .../regulator/maxim,max77620-regulator.yaml   |  99 ++++++++
 .../bindings/regulator/regulator-max77620.txt | 222 ------------------
 4 files changed, 197 insertions(+), 349 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt

-- 
2.51.0


