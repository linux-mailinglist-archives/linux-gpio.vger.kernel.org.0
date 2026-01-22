Return-Path: <linux-gpio+bounces-30908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJtpDhtJcmkJiQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:58:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A669573
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A01A43001BCF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBA13D3009;
	Thu, 22 Jan 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPD/4JVV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D23D3D0A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096617; cv=none; b=KP2DS1v80nWJYi3y+1iw71laSYccjIIUFhKqA5PPjOcgSLWrdJ3/rg0emqxs749U176uzLztGfWW35uWCZgWz9796yQGQjdrXd/xSMnXhKmRE/Yl94a2pKG5AEYBJzQXM3Jvnc1YV3+/jdekC34tDRf3Or1oSIhurg1tf387VeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096617; c=relaxed/simple;
	bh=Cqn2/FhFDv3ouUts3xdUx2ZsR71yelZuw5MD4E0vz/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MTKFIrV+A3Xf66XPOYp1zK0CA5O7H56pOPVResINPersqE3cxCr3kqq+HO50fM83RHVckaC29gDwmqYG06RrOxwAy4EvcfY3Ezj7AlpXMGBaI8TvfK7pVJQv4ggNaUKVsHynZpUAR5LPfwg1NC55Qb44Ogh/h1oZdXiZUpve23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BPD/4JVV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so3648567a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096612; x=1769701412; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tax40dYK7KM1hY0kgZCOBhg+YAKWMG1OWQagWQ6C6eU=;
        b=BPD/4JVVK7ccIBXBi/5axFnlviT0khwur7GeR0KZtdILPwmNnyKHlvxQgUR3QJh93i
         300A24Z0R/wzJK6IZJ8CYCXQMIiR2+F5s0HxwDu7n6W3e8Y6K8Wy+STGk2qSGrngS5gN
         eKwkJ88AylE1AUYuzXfzre87ClpII5x7cVDY7VVMLrcdEXc9esuViHY7FL89vfooKUa+
         9Y1k0awRi9zSo+wmBZFUv060Y2SeXSiRLOuIy/71R2Nm5gLqhcOVrbwj9pxJPT9tboSR
         B1lqEI8vGmgDtJWLCV1d1phhZ/WtNETVXskgqz29l9ifWGn/+lyYySVXr9b5241rlF0v
         0oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096612; x=1769701412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tax40dYK7KM1hY0kgZCOBhg+YAKWMG1OWQagWQ6C6eU=;
        b=VNwU+F55VTCJHsZqlA1vGwF9PbeTflgFKNgD1ijtfv/8jj0F94hjv6RotGDFaJGlXh
         rtXHslimyigqRPidCNSCmV0vBxIWoeyW1b3sfp9NQl+70NCIR3RIYgPhcmuk+ljZxmvs
         Z+paR8tycoM7iVsNPufGdO7wlUKv2g5TsCI9tpLu2qjKk0l6tTY/dDJYJ90Xab57YBZN
         CBQpYlSgWIC3n3IlTzEfMY/YF2SQZ5OY0lKMxchEoc3+el4P9WRXJJBqRZ4SkDl7fkMl
         pB+hZvet5QLq1M+xQxqIB4Y35fshdk6JR0yvLVVfEEZtqWW90WIjQnkcBTP7vIMIV8Px
         VMuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXTyrski0OPbyno/Cdy+zylf6u6PXKIs7aEeofeHbl7VThkjh3YwlRVniwu0It5C/efDYaKXBVDSv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gaDYutUFOO290xzqiP+8bS3VBlgUiIHisMIVYJRV6bBYRYoY
	VHYBRmnD/3et6pUg47e+1C9xm9+VLXX7CKiC51XriUv3kKunvqQTYsKksVTiWUYD7ek=
X-Gm-Gg: AZuq6aJD62zCJuorOqb9ct7TVgjYws8exRf8Lqd+xDSRn9E48GmJpMzBKFRBkORj/HO
	O2CGvNJ5Y/DaVZn551QiBgbruDARk2qISC/dCKwoQihSeMDC/lslc0e9z7iZIvJ25FOuetP0CPg
	/LcSLbVPBcTQW55c0tFRW5OtA9D3HABDGHXSu53lIdeT8ZCreo+KSC7SIKxIxiphHOxdx80NCtQ
	EwntWU8QjQ9bzpM1N45iBC6llpdD3JA0S2zdPS3iFlnD77TW7vmyskER6bxmCOXMMw5Tn3psfz4
	J7WcOhssvm77DNbRKw53BKShpxwx5tNu0WmExLO8pR2hF9MCUl2P3qDdm5Jvp/zAd7WHg9LaoCB
	gavI4bcBEPkUZv/ZhyrwHhHMO/8OaIiyew0UZLgFeUxdXZUHtyjR94g1CttMarlWXJKqwgDJ/3i
	4zjxMW+RLN5Rus8z69u2oqUdV/Q1HAkWleDJAdUjIbghpb2xCTgQzaML4aCklZjNECJUGCI3Cd6
	yK47A==
X-Received: by 2002:a17:907:c03:b0:b72:5629:1789 with SMTP id a640c23a62f3a-b8831b4088dmr272749866b.13.1769096612155;
        Thu, 22 Jan 2026 07:43:32 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Date: Thu, 22 Jan 2026 15:43:27 +0000
Message-Id: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKBFcmkC/23SzW7DIAwH8FepOI/JfARCT3uPaQdITIrUNR20U
 acq7z6nW7dO4fi34GeBfWUFc8LCtpsryzilksYDBfu0Yd3OHwbkqafMJMgGDChe5PtxEBeecTj
 v/WnMhVuvRdcq53yIjC4eM8Z0uaGvb5R3qdC5z1uPSSzVO6dr3CQ4cGrVWg1RO48v+3TweXwe8
 8AWb5KPhqkakowAKmKMvTRSrAz1awhRf9akFqMNzgTrEJp2ZegHQ0DV0GQ43Tm00vQ6+JXR/Bl
 S2qrRkAEd6KAMBLJWhrkbBgQ0VcOQ0dJ3BtOLEF3/z5i/h5bx40wLcPqZ3Dx/AZNfHR0eAgAA
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30908-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: A38A669573
X-Rspamd-Action: no action

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

--- dependency note ---
This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers.

Due to patch context, there are dependencies on previous Samsung MFD
patches, hence this series is against current for-mfd-next.

While these patches compile, regulator probe will only be successful
with my deferrable regulators patches from
https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
(already in linux-next).

I think patches up to and including mfd changes could go via the MFD
tree, and regulator patches using an immutable branch via the regulator
tree on top.
--- end ---

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
Changes in v7:
- rebase against for-mfd-next
- add 'domain_suffix' to s2mpg11_irq_chip_pmic (patch 9)
- Link to v6: https://lore.kernel.org/r/20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org

Changes in v6:
- merge patch 21 into 15 (Bartosz)
- merge 'con-id' handling into patch 15
- collect tags
- Link to v5: https://lore.kernel.org/r/20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org

Changes in v5:
- rebase against mfd/sec alarm IRQ rework
  https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
- switch to async probe for mfd
- Mark: one MFD cell per PMIC, not per PMIC rail - drop or update
        related patches
  - making the series runtime depend on
    https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
- new patch:
  - mfd: sec: s2mpg10: reorder regulators for better probe performance
- collect tags
- Link to v4: https://lore.kernel.org/r/20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org

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
      mfd: sec: s2mpg10: reorder regulators for better probe performance
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
 drivers/mfd/sec-acpm.c                             |  171 ++-
 drivers/mfd/sec-common.c                           |   17 +-
 drivers/mfd/sec-irq.c                              |   86 +-
 drivers/regulator/s2mps11.c                        | 1186 ++++++++++++++++++--
 .../regulator/samsung,s2mpg10-regulator.h          |   53 +
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |  105 ++
 include/linux/mfd/samsung/s2mpg10.h                |   44 +-
 include/linux/mfd/samsung/s2mpg11.h                |  434 +++++++
 include/linux/regulator/driver.h                   |    5 +
 17 files changed, 2527 insertions(+), 161 deletions(-)
---
base-commit: 76246f598ee3e8ba8796360f24cc8ea491350937
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


