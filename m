Return-Path: <linux-gpio+bounces-29950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B6CE00AD
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 19:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FBE3019BDD
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B7A1419A9;
	Sat, 27 Dec 2025 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/uI9pVc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84718821
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858505; cv=none; b=qZlHUGkdbVNlQ2I0uI90dD8iAggEZph9xqKsZPJyV+WcD/isCxARqeXBEObeuKrby6vSc5ZxYwoGyYeQF1txTT6WIgvDhWaiAMqXv5Rav+uwFb/vsvonWsZc+c+voR7RSClgx40E4oPoeVJs14u3rBM/JYwNJi1lHbg5S3IFGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858505; c=relaxed/simple;
	bh=Oydg4VJ6OZjbJVdbmKkzmOJpXAH0/nu9wbVWjjuvUBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bd+k0bp08hSmPV0hVssVrVRDdad3sVqlmoh4lcSeETDvropmkti/w9K29P9lT6mkdP7boxE3OVUyq4qezYNAu9e+DTk/QizSDGw+BotjQoCt1wVH1u82X4GDKnt/QhIKb0ZkUL9y/gBrFXnSHiZkEfWAyxpx8Qk0vpIaUazbZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/uI9pVc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b832c65124cso282831666b.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858502; x=1767463302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKT3I0UidJ1S2vPkh+3eJ8BxgPcxDYdzSMUQuQyedgI=;
        b=N/uI9pVcnsjxdTyAhzwD29gVaEkdsSz7YnUtqIOxTgmPwjg/dkrsDT6SfE+vW30ksF
         Z0LI4F9uf9845qi8o+4B0Rk68Sp1NlmxqTd+1RYsnj93aLB48+9oaznglLYcrJD7OTCA
         krvieG80u8FTq5Karrf82JMYgTJOyL1KEyoV2eKVYxFmLVWtnIEtxw0corCFSPIfud9k
         5h57xgySueUdBGT0Q6hlId572QgiDoxRXZGjUp6AMrMHFTJgihMgDtxmJAzXtEa2lQvb
         ODEoMsH3JVBPgcxR3kGuWRFX1ipGZ/GveRvQALHq0Hwl4XC+ArufUM6zM7HG1J9oq7qJ
         0x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858502; x=1767463302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKT3I0UidJ1S2vPkh+3eJ8BxgPcxDYdzSMUQuQyedgI=;
        b=cSi2bErcgmj621CZtu3BzWvqnQWfUwj1QFH8Esr+BinYWTqBfic40wtuQ6crB0E+1Y
         6NtLUPE49Be+TsnTg4b4hXCz5LGyaWKLafDCIV3E3WlFY0eKX55wbZf+cLr9oxa8T3+I
         GwX1S0E35nBcuxzvTOaz1A9ohoShSxt0TZgC/KGp6mZniGig0+dqDgzlelbEKA/r36KS
         sKhpBGokmVmg3g4eBjKnvmbYHz6XPvtp0Ddbjowxar7RNbSwP94SmzDybC0YPK8al/5/
         u6+CdqS7UC6284MtYjlBBA8r023v+LIwRLp2dL/awhkRVQp76RDv1yEijPcN3V1E/Huc
         BA3w==
X-Gm-Message-State: AOJu0YyXL5Nk/i03toDIEt42rVuL5aY7+NqBHaeZyqkuXwdXO4hbRcET
	iubRzqZAbjJsnwIum58ZsTlh4ioqustfaBG6bpNGAWOuh9Ztm2DYuE04
X-Gm-Gg: AY/fxX6o2vfNJrJIq4KDU8dgZ8BgWAdezn3p4w8OcFPCRuk2BTuJRA/4KoH1UO7Gl2X
	YNrg45OBqxZLUaK+JUzSRtnUNa5mU56PUrpOo6qnM38bzw3V23E/CtQ+r+3AXlwFriUQEu8nRHZ
	i6qrCPtnsbQfvkHh+00j4gjS6ohjBJqpXWt85odz9AeX4RVwGvAxETGmn+qPQjhydD3Bae+VIcT
	P/2CWV9qXwL59cF/W4QBoTv8iHNNwtaE+CsSHduqDOqvof81pFgXSMv9rTmG6f5GDV+dvW7/qVF
	nIDtcnaL5tWFMdci08W/ijVtaldsXx3I2wALoeYtrEP4uXoAPtqPw54nFUfXvryeohCfj8tECVW
	NzvlRJmzGqIDxbFMqLBVolrJNgQcfrgjNg7Nj9erVR3hNap+Tnia9JicPmPfydgOcX9lzt6fSOw
	OesqmpXAAPQzuAZcE=
X-Google-Smtp-Source: AGHT+IEUtPSOQxPHsEf/Vkv9ByTKm8qPp27yUPXT5Gv6c/WNBB8eHvyu9sa4EWOOgH5Y5qNhRoChpg==
X-Received: by 2002:a17:907:781:b0:b73:74b4:f236 with SMTP id a640c23a62f3a-b803719745cmr3081311366b.46.1766858501897;
        Sat, 27 Dec 2025 10:01:41 -0800 (PST)
Received: from builder.. ([2001:9e8:f10d:7316:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm2794835666b.41.2025.12.27.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 10:01:41 -0800 (PST)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 0/2] add gpio-line-mux
Date: Sat, 27 Dec 2025 18:01:32 +0000
Message-ID: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This proposes a new type of virtual GPIO controller and corresponding
driver to provide a 1-to-many mapping between virtual GPIOs and a single
real GPIO in combination with a multiplexer. Existing drivers apparently
do not serve the purpose for what I need.

I came across an issue with a switch device from Zyxel which has two
SFP+ cages. Most similar switches either wire up the SFP signals
(RX_LOS, MOD_ABS, TX_FAULT, TX_DISABLE) directly to the SoC (if it has
enough GPIOs) or two a GPIO expander (for which a driver usually
exists). However, Zyxel decided to do it differently in the following
way:
  The signals RX_LOS, MOD_ABS and TX_FAULT share a single GPIO line to
  the SoC. Which one is actually connected to that GPIO line at a time
  is controlled by a separate multiplexer, a GPIO multiplexer in this
  case (which uses two other GPIOs). Only the TX_DISABLE is separate.

The SFP core/driver doesn't seem to support such a usecase for now, for
each signal one needs to specify a separate GPIO like:

  los-gpio = <&gpio0 0 GPIO_ACTIVE_HIGH>;
  mod-def0-gpio = <&gpio0 1 GPIO_ACTIVE_LOW>;
  ...

But for my device, I actually need to directly specify multiplexing
behavior in the SFP node or provide a mux-controller with 'mux-controls'.

To fill this gap, I created a dt-schema and a working driver which
exactly does what is needed. It takes a phandle to a mux-controller and
the 'shared' gpio, and provides several virtual GPIOs based on the
gpio-line-mux-states property.

This virtual gpio-controller can then be referenced in the '-gpio'
properties of the SFP node (or other nodes depending on the usecase) as
usual and do not require any modification to the SFP core/driver.

---
Changelog:

v7: - dt-bindings fixes:
      - dropped unneeded reference
      - adjusted presumably confusing example
      - added missing colon

Link to v6:
https://lore.kernel.org/linux-gpio/20251111092705.196465-1-jelonek.jonas@gmail.com/

v6: - added count member + __counted_by attribute for gpio_mux_states
    - included Reviewed-by tags

Link to v5:
https://lore.kernel.org/linux-gpio/20251105163610.610793-1-jelonek.jonas@gmail.com/

v5: - renamed "shared" to "muxed" to avoid confusion with Bartosz' work
    - dropped Reviewed-by of Krzysztof due to binding change
    - use GPIOD_IN in devm_gpiod_get instead of calling
      gpiod_direction_input explicitly afterwards

Link to v4:
https://lore.kernel.org/linux-gpio/20251105103607.393353-1-jelonek.jonas@gmail.com/

v4: - dropped useless cast (as suggested by Thomas)
    - dropped unneeded locking (as suggested by Peter)
    - fixed wording in commit message
    - included Reviewed-by of Krzysztof

Link to v3:
https://lore.kernel.org/linux-gpio/20251104210021.247476-1-jelonek.jonas@gmail.com/

v3: - fixed dt_binding_check errors in DT schema
    - as requested by Rob (for DT schema):
      - removed example from gpio-mux.yaml
      - added '|' to preserve formatting
      - 'shared-gpio' --> 'shared-gpios'
    - general fixes to DT schema
    - use mux_control_select_delay (as suggested by Peter) with
      hopefully reasonable delay of 100us
    - gpiochip ops implementation changes:
      - drop '.set' implementation (as suggested by Peter)
      - new '.set' implementation just returning -EOPNOTSUPP
      - '.direction_output' and '.direction_input' dropped
      - '.get_direction' returns fixed value for 'input'
    - direction of shared gpio set to input during probe
    - as suggested by Thomas
      - usage of dev_err_probe
      - further simplifications

    Since the consensus was that this should be input-only,
    '.direction_output' and '.direction_input' have been dropped
    completely, as suggested in the docs of struct gpio_chip. '.set' is
    kept but returns -ENOTSUPP.

    The shared GPIO is set to input during probe, thus '.direction_input'
    doesn't need to be implemented. '.get_direction' is kept (as
    suggested in docs of struct gpio_chip) but always returns
    GPIO_LINE_DIRECTION_IN.

Link to v2:
https://lore.kernel.org/linux-gpio/20251026231754.2368904-1-jelonek.jonas@gmail.com/

v2: - as requested by Linus:
      - renamed from 'gpio-split' to 'gpio-line-mux'
      - added better description and examples to DT bindings
    - simplified driver
    - added missing parts to DT bindings
    - dropped RFC tag
    - renamed patchset

Link to v1 (in case it isn't linked properly due to changed title):
https://lore.kernel.org/linux-gpio/20251009223501.570949-1-jelonek.jonas@gmail.com/

---
Jonas Jelonek (2):
  dt-bindings: gpio: add gpio-line-mux controller
  gpio: add gpio-line-mux driver

 .../bindings/gpio/gpio-line-mux.yaml          | 107 +++++++++++++++
 MAINTAINERS                                   |   6 +
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-line-mux.c                  | 126 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
 create mode 100644 drivers/gpio/gpio-line-mux.c


base-commit: 48befae0d6eee275c3e30d1cd45f39d6ba011e19
-- 
2.48.1


