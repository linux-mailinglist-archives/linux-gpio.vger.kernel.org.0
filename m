Return-Path: <linux-gpio+bounces-27809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A9C1A74E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0EFA561F60
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8106734405E;
	Wed, 29 Oct 2025 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ULKV6xBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2C194A65
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740933; cv=none; b=RNNGCWHHWxu196jBK+y3uoLVv0fv7Zlf4tVTSHGJRVTSX6hcRqPjgHdQc8cC8BfHLabTv3vXg2Vv97BP6Pg7oyHCBfv8xfRUFQIPkinCPm7v7BywmslRcdLjK2SlfJX7NLJoWxWRda+PdEPvg098Qx7eV01HgnfMXemofs2zNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740933; c=relaxed/simple;
	bh=+fd/3iqijZWE6ruePHbh2ZeE4Vvwsaoa6eHE5+01rLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AtavWsAIyT0GEqKjm3BR5lsvcBRJp2kITuyiedng7Khx+q9Ck17v/soFX1lK3RET6nlQC4GhDncsEOfruh6syMxoGulvKT1OFPo+5jrPJctYceFEkC21J3IzrWI5z67a1ihxaiAnAdFt0jMd86nh8poMhXPW7teIjXSG/74bThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ULKV6xBN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so56016995e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761740928; x=1762345728; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6s1VdFdqkJWeoovDcep89eqJy/KpmVn7+tbn6n9mmZQ=;
        b=ULKV6xBN+K83RyXQeedO5MPxzDnZ/Dzg7YGRCS0RgJgZeuZ5iaJIy8f5REUdTFaN1F
         7NDZllCH7Uw9iPZzMw+sUDThv3Lk3OPhay9jFz2xvPD9g/aODNYjMvCB27Fz8ZMFNcLa
         8dVEx1F/vPzz07Yw8QlAtOJuzRsDANHk72/BezCSXUYjYR3JL2CgU+p6okQOu5aFH0k0
         ar+fimgIYRsB6lLfiWaFW3jm0jzqT1dWulCksjQKT+w5VnK7+2cS6wjoeHnsu+ineHef
         1cuR/tEdqS8357xugpDNoe5vCrvW4dWxHFk/qIYjphvdloQpbKIzs9Y+NbfnVNO94H4V
         5fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740928; x=1762345728;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6s1VdFdqkJWeoovDcep89eqJy/KpmVn7+tbn6n9mmZQ=;
        b=vyDsqIZMgtCIWjCY7qyKEAaMSZd9ur18m+cl01QGOwKPrBT31x+Rk2csSo8QMr6ryn
         +qasAtUV5Cz74RR7qhW1B2256k9VdoyszgtNO+WWg7jLWrrStgDRqwOGybrAmYYkURNj
         1nzxAHf+xRGSN7zFJD5VkZ3QAP1kNzGaZy/AlCQTvaqiebRCJJuGELLiIHZQ5lnVLFSV
         U1+7q0X+OgFZhBztFvMR15JkGx9+2u56tCnY0p9YlL36452oRi2ntFPHz5Hh9uPU0wX0
         4X8eBXlt68qrIRhmyh6U9LCxbLRga9qTEghxF1iu4zMGMXpOwO6wV67Cb5PZ6+9Sw2XN
         9huw==
X-Gm-Message-State: AOJu0YzsRaQPtW+bCertfZjZBoGu14RLpD/KlnDNdCcFodEbCCbIlLzY
	1LV9a+iDL3sk/v+6sZLKGw1nWEwxe6QFjWjQx0KMJeGvKkNtUOtMqytApZxXXWECgkw=
X-Gm-Gg: ASbGncsKDuMKfNS+ROI8r1pkhJYvE4DjWqGzUySVATWb6x5zb29KwVaKCDzGTk8/x9r
	pEOmJmYJ13uHJhQceTMb5jbKjW2bb7+RS0DNve+LbTazVty+A899TSvwtlcZmpj3vUqrJ8NXuag
	9fveXESdryFhpcwI7Upd4LPR9MvPn6PDikBIAPjzgKS0sVNuQWyDoQ+my8HAz2dFyBd3ctgOP0c
	/bcPA1KTxENoSBaxYZCulvWeUc/49ifvhGCfVv1geRUNzg4g7VsFXGrpu85CrQqz7c5XqALMjCp
	Zl587rxNS4jwoBgBEIMlQm+kQtnhdjxztd1Ijs0XiQb3fLkqi1XRaxe1LTLBc8mMBheKiJYVmYz
	zd+SIfhtBVV3mWXNJI/1Ido7HmqWQBlSr5MBkVxTwsdu42zBjaiVrBZbxSNvU0ELGLuihTA==
X-Google-Smtp-Source: AGHT+IHMlM8eyAqPOulQC1tnFXIQIiiorv7v1to7ZewkoNlnAbXuTrqAt3rqd0Pt1HZLQUD17/+L6g==
X-Received: by 2002:a05:600c:6215:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-4771e24ce01mr27359885e9.36.1761740928502;
        Wed, 29 Oct 2025 05:28:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm52775545e9.10.2025.10.29.05.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:28:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 00/10] reset: rework reset-gpios handling
Date: Wed, 29 Oct 2025 13:28:34 +0100
Message-Id: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHMIAmkC/23NQQ7CIBCF4as0rMXAILW48h7GRZFpS2KgYRrUN
 L27tCtNuvxfMt/MjDB5JHapZpYwe/IxlFCHij2GNvTIvSvNQIAWBjRPSDjxfvSROL1CdEjcWa0
 V1mdhtGXlckzY+fem3u6lB09TTJ/tSZbrunlSiHrXy5ILXjulQFvTdie4Pn1oUzzG1LMVzPCDA
 OwjsCJGNI1WAoy0f8iyLF+iHfN+/AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4411;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+fd/3iqijZWE6ruePHbh2ZeE4Vvwsaoa6eHE5+01rLQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAgh4cPx3Yp6F1lBbEjREoOK0df8M+aQNPEdWm
 Ar1aJWISt6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQIIeAAKCRARpy6gFHHX
 cg0vEACrtTV6dfMYlP20/k7I2Ztvb6RdmNHXwYf7aqrnLHk8sfVHXRLASrT1ahc1PGAsWC9G9RB
 Zrphn0P5YsAiANmOfG7oi6prfCkBfaybVePLXJRnoWLr5Gg/DyZvE08Fj+9Bn5NfMh/A+CgY9vd
 FMeJa+hvB2xDqB+7CxuRB6Ih3WF0TpVPzFegeJXm/eFFPdeQXZ6CxtJ528vQivNWOts5oeC6JAp
 zc1iwxALhfDW1eKdmJtUa/Omt0rjy2z9grimop8qlmHzebtrwJrrL4OZKA+F0V+UIYUbo5oV4rT
 55EaH9y9CbdhHypv2zlMKHnOk++ZGkOZbB2jYagOdec4u2YzatTTkop8fB0CDNMvB0EFqVgLmKd
 QfJ17Avdvir0++FU1ULnuSdIa3oGLrp+0Jfh5bOxU7U4dRd/M46C5wsl7qvfMT78jVjdfQ0jlEf
 x84PJPBLirOEEgr8QPlgg/9I/CR9J7kNyhAhWAfdoMs24qWXZjO4SaDjbR12ETj5/rkzwyR6TYh
 BnEwsFh1DJ4ir27sc3IiCweHtblaD/dI0fglmk9A20Vec3szqYFIpNupukLZDpreRzEHlaJ9uqR
 RPSTCsTDQ8ZjaE3i3+uYQmojVJ3PZ9AC3kZQav2M+xP4ox90fVr/Tz5Lp36+WeghEg1xA6qgdpX
 rmx08a0k8wQtzcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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

 drivers/base/swnode.c         |  20 ++++--
 drivers/gpio/gpiolib-swnode.c |  21 +++---
 drivers/reset/Kconfig         |   1 +
 drivers/reset/core.c          | 149 ++++++++++++++++++++++++------------------
 drivers/reset/reset-gpio.c    |  19 +++---
 include/linux/gpio/property.h |   5 +-
 include/linux/property.h      |  38 +++++++++--
 7 files changed, 156 insertions(+), 97 deletions(-)
---
base-commit: 5218492f1eb93da3929f0d993d2995a4665ca760
change-id: 20250925-reset-gpios-swnodes-db553e67095b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


