Return-Path: <linux-gpio+bounces-27938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3360C2AC48
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 838AE4E7E9B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADCB2EBBA3;
	Mon,  3 Nov 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lWoEKgtR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6D2EB84F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162540; cv=none; b=lX5dtHJBqsx8fMZNXhPB6St4cUk49glTMNdQBAE1WD4QrMURFaDWMn4YdcksxpBxS80mAo9WiB+wMoDRqF18a3EKh6rUxNpD3tdWUqgBIdu25qKXmWZXhhW0nDjPXVT+EmGktljI1+21law014bTioeOm31H293oib+v1Ti+3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162540; c=relaxed/simple;
	bh=uL9hkDdS9yowyj3MXlIziFZUT0mw/hs8vJAxFSyvrNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j5hDQKl1yBGdo9IKOQXJkCCLsXxzQoBTck3dG033g1O3i4MAlLY6bDDr30ebAEX0IIfBHrQlo1tZEAhNhe47X0/AVd9PVRd+BxgaOBT6ZsagmmL6TQKBY4DLF0dzv/rgz17+kwxkMmyX2CGV/1r2MtryLfuXOquNj/Ug3lFlAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lWoEKgtR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-421851bca51so3676260f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162537; x=1762767337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMDQ8z/ze25ZkSnRSxzmKkV8qjQKMTr4x1IQxwzycHk=;
        b=lWoEKgtRkEY0kTasBMxAbyaTQ39zH+gQMOrXfctgAjsNB/unu8M2htiR7k5cfUGUkX
         +2wT3ZbN/kbSStVebRmJpOH+m1TXrJFFJ2yG9oIinq0CXtPSHd9ZXCSxbHSyxwPKbrmO
         t3UCl6KrrwQod9WHgY0Ctp+pkS0d/yU55hfprz78FwyhaxQzu3yx0LkMb0Qz5lYD6rAs
         iXIRF71bG0NtWr0cZRdPvL/onlZ4schwQ6yNlBDDs6BNfcXeLvZLMM5EOEVK2EW6O348
         63Y3VJUFxPXFp2tUEdfuA1733o4NCDanZpXDIJGHOfb0wQR3+scgYqU/dqNQLh6tDSBp
         C1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162537; x=1762767337;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMDQ8z/ze25ZkSnRSxzmKkV8qjQKMTr4x1IQxwzycHk=;
        b=X83iIxB36UTL29CvuQbrix3Olmfu4u6+mivqZszCGeFgCbEuofV99qyufvCU6xb4t9
         7iy3FAJr0BeBdaHS3xja/dscKYnrTNd6Q4cBVDqtVuce93Knhfy1QXe2Mj9NhopUOJ1J
         of8SpHCfifyKEkqvigiIqgPoMqhUXkiQOjhSg8kyCByjKUgpGUKK477gOehgBBEyAqHi
         xQTOCpmpMt6fbbqi1dfyy6tKus2CjFaoyff0EgNp+xzV7r4FeisJKHwmKk9WkE7rXkmN
         lyaUT5foWVGvWhHV0mILSr+9wKZ9q5xwbnbF4lXuJ08cvhU45whZ+WVEPvcIqbrD1q9t
         0fvw==
X-Gm-Message-State: AOJu0YwmBjEYTx1iwUrNGFg1e388cRaAOoCUQsWsNj7Hex0aRb2oVdmD
	TJvbHWpvsMObH92sFH+ar8Mm7qz2djnuxzz6aDh75JkjvzjELDcyc4mTYJnbIhIlWc4=
X-Gm-Gg: ASbGncsmugcIBwPwwOUmgyaQHs8RW8NDyJXYkhtEBENj4VGdeDsiqPRgBhIqFIId60Q
	38De5sh6pweBRdKHbbAh3IFI9maJrfIEDx6XiSkZr+X8hNBSEujD9O879wRhcIaVL6e+VuEYQYn
	6xL2e62sTxHFqo4nhSAOXQscZETl5ArLiku33OPq78rwikjieCf2hYNl80x3SEa3sKl6Z1Oj1hD
	qN9NMuvDwZtZ7wrM44vXF+QVCK1JsjhPwuZkBwByXYDhqOFQquf3LISBTbj3VmI/8auMRveyEc8
	L+jqlO+I3zHG6G4gZQkpU+L+lQlAyuRk165Pc18gYMdtHMho47WSPRD3ndqNoetFGLnQKHzecAX
	mjXL48EOKbe4KveS52MA0JruVu5Ek8el3gPNccRCrTCmpAiZKOT8HwAIhbLEAN2SvwNlpIEqKXG
	B8i/+G
X-Google-Smtp-Source: AGHT+IFhRvhMYOsQd0bYfmy1oP5+6BaX9aza8lBL2GeU9hTgdDHNgDKmbLxjmGSkCp2Hns44m5BBzA==
X-Received: by 2002:a5d:5d86:0:b0:425:86f0:6817 with SMTP id ffacd0b85a97d-429bd6be635mr9847432f8f.57.1762162536621;
        Mon, 03 Nov 2025 01:35:36 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/10] reset: rework reset-gpios handling
Date: Mon, 03 Nov 2025 10:35:20 +0100
Message-Id: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFh3CGkC/23OwQ6CMAyA4VchOzvTdQyZJ9/DeNigwBLDyEZQQ
 3h3ByeMHP8m/dqZRQqOIrtmMws0ueh8nyI/ZazqTN8Sd3VqhoAKNCoeKNLI28H5yOOr9zVFXlu
 lJBUX0MqytDkEatx7U++P1J2Low+f7cgk1unmCYDi0JsEB17UUqKy2jQ53p6uN8GffWjZCk64Q
 xCPEVwRDWWpJKAW9g+Re0QfI3JFZGnyyqZ3QPwgy7J8AQR+ZC1BAQAA
X-Change-ID: 20250925-reset-gpios-swnodes-db553e67095b
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5068;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uL9hkDdS9yowyj3MXlIziFZUT0mw/hs8vJAxFSyvrNA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdg7VPQDMubGnvwXaWvtSC87cVLn7Wy0yQl4
 hRqPVm9xyaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3YAAKCRARpy6gFHHX
 cmopD/4h7sIEOS5VaNm0CfSEfs6agGhOmbGWZvVMybwrBdsnfpNqfhmBcHevF2BqxlhQsgNJU/M
 CCHcUGkeIXffCaWsK0bELgzu76Q/9mOfMXxlInJPKu0z/57vYiwaylwjQti8TBTDaU0zlj9IzLd
 UNgLkxWhJdjZAmdqoxWsNb5dPdm4slBVTX3+SsYG8F6AcFiwk1grItBnsjUs1bf4GFYZO+UCwQk
 LvIayUdMDbsTmzKgL6BQ1smqZI55STwl6GMSA4p6JZNmo+3sxVcLCBWlUBEQyNsudxujR5blo1A
 dlzKml+HoO6w8rr5WWzA4AUN+iwwXsR6k65Qk1pQlahFRZazrhJ71MKy1gY9x9390jNRKvrAH99
 zyRKBGB6QGFfSaDxO3x6rZCNeiU/kOqjhVXhkHYTZZd7HmoL+pI2Miy+bpJm5epxuOYaLtEl55H
 EKYFWjahpaZll4bSBGidd4xDyGxAyHYT9Z+Z+5k3Vz3mn1mL6UtyQRLA++nkq41hupUQKsffzI4
 PvQfJVkY36V0MelWj08yhEK4kj7w5bwmGqShxC8ePXLhqK5/Uo6yRI1O84+dNdtg38lhkYw+5hW
 n9JPMUL2V2VNZW4jsboaBAWh+cp4aqjajCAd7R3ZlbsrZzsHeobXNY9TJn4zyYAqdc/7a6hZm/T
 Ry69oSDwI8nlVfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Software node maintainers: if this versions is good to go, can you leave
your Acks under patches 1-3 and allow Philipp to take it through the
reset tree, provided he creates an immutable branch you can pull from
for v6.19?

Machine GPIO lookup is a nice, if a bit clunky, mechanism when we have
absolutely no idea what the GPIO provider is or when it will be created.
However in the case of reset-gpios, we not only know if the chip is
there - we also already hold a reference to its firmware node.

In this case using fwnode lookup makes more sense. However, since the
reset provider is created dynamically, it doesn't have a corresponding
firmware node (in this case: an OF-node). That leaves us with software
nodes which currently cannot reference other implementations of the
fwnode API, only other struct software_node objects. This is a needless
limitation as it's imaginable that a dynamic auxiliary device (with a
software node attached) would want to reference a real device with an OF
node.

This series does three things: extends the software node implementation,
allowing its properties to reference not only static software nodes but
also existing firmware nodes, updates the GPIO property interface to use
the reworked swnode macros and finally makes the reset-gpio code the
first user by converting the GPIO lookup from machine to swnode.

Another user of the software node changes in the future could become the
shared GPIO modules that's in the works in parallel[1].

Merging strategy: the series is logically split into three parts: driver
core, GPIO and reset respectively. However there are build-time
dependencies between all three parts so I suggest the reset tree as the
right one to take it upstream with an immutable branch provided to
driver core and GPIO.

[1] https://lore.kernel.org/all/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- Fix an issue with uninitialized ret variable in reset core
- Use _Generic() to simplify the __SOFTWARE_NODE_REF() macro and remove
  one of the arguments
- Add a comment explaining the relationship between swnodes and fwnodes
  and why we're using the fwnode API in swnode code
- Allow longer lines
- Link to v3: https://lore.kernel.org/r/20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org

Changes in v3:
- Really fix the typo in commit message in patch 7/9
- Update the commit message in patch 3/9 after implementation changes
- Don't remove checking the refnode for NULL and returning -ENOENT
- Move lockdep assertion higher up in the reset code
- Simplify patch 4/9: don't change the logic of inspecting the gpio
  device's software node
- Add new patch that still allows GPIO lookup from software nodes to
  find chips associated with any firmware nodes
- Drop the comma in reset-gpio auxiliary ID
- Drop the no longer used type argument from software node reference
  macros
- Link to v2: https://lore.kernel.org/r/20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org

Changes in v2:
- Don't use a union for different pointer types in the software node
  reference struct
- Use fwnode_property_read_u32() instead of
  fwnode_property_read_u32_array() as we're only reading a single
  integer
- Rename reset_aux_device_release() to reset_gpio_aux_device_release()
- Initialize the device properties instead of memsetting them
- Fix typo in commit message
- As discussed on the list: I didn't change patch 7/9 because most of
  it goes away anyway in patch 9/9 and the cleanup issues will be fixed
  in the upcoming fwnode conversion
- Link to v1: https://lore.kernel.org/r/20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org

---
Bartosz Golaszewski (10):
      software node: read the reference args via the fwnode API
      software node: increase the reference of the swnode by its fwnode
      software node: allow referencing firmware nodes
      gpio: swnode: don't use the swnode's name as the key for GPIO lookup
      gpio: swnode: allow referencing GPIO chips by firmware nodes
      gpio: swnode: update the property definitions
      reset: order includes alphabetically in reset/core.c
      reset: make the provider of reset-gpios the parent of the reset device
      reset: gpio: convert the driver to using the auxiliary bus
      reset: gpio: use software nodes to setup the GPIO lookup

 drivers/base/swnode.c         |  30 +++++++--
 drivers/gpio/gpiolib-swnode.c |  21 +++---
 drivers/reset/Kconfig         |   1 +
 drivers/reset/core.c          | 151 ++++++++++++++++++++++++------------------
 drivers/reset/reset-gpio.c    |  19 +++---
 include/linux/gpio/property.h |   5 +-
 include/linux/property.h      |  43 ++++++++++--
 7 files changed, 173 insertions(+), 97 deletions(-)
---
base-commit: 6bc91893bd9c5d4c492cddd5b8b7a62ad1e1303c
change-id: 20250925-reset-gpios-swnodes-db553e67095b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


