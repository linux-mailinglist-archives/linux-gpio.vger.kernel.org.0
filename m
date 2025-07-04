Return-Path: <linux-gpio+bounces-22794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC99AF9348
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 14:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E423AA927
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 12:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057DB2F7CFA;
	Fri,  4 Jul 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XYZr5oWv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50092D63F0
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633937; cv=none; b=Vh1bCrLChPHsKzteYAn7e/Dgb5u6cTZPC5euVWD0GLBEKkSPcJEkG0aUOFdvXTIHN+lA+8vRVfGDO64xevmGZAAYkFE4iTy1fTxm4giI0bBiZEmqXR8FJJ9BiSPi5PDP5EJiHQGQqSP5qjrBl/qrRwo/8Pq8WgVXkGBA/qakiEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633937; c=relaxed/simple;
	bh=Rmy9NIDFrAI/XuTDCIDYfJtMLVfyZIHo91lbOs1rWw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aTlPBCG4Ho2qsdHAXp7BWuyTeGxyeNUDOh/JYU7Q8WBHwIWcjtyZwhEKmM1Ro2KlIbnjWbD7hmmElTCCLJK+GwEIrlbyOilQQ483YwYN++8b/Cf2Okzf41UThkg878TEvs/+CuHwNq53DxyflZI9p6UkLZ2aHbnQ26kmedH+z9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XYZr5oWv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45363645a8eso6389845e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633934; x=1752238734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNwZsoeqoXHoOATMYn/1BYK+BlrQW1PbbWtZf2zI9aI=;
        b=XYZr5oWvYj/+5zOBT74IUV2ZWsVN8Wt4fqgltJF0cyK7Sx9R73grWfBQdyLrENRY8V
         AjNAOyCQffsPLGvQeRa0WnckodTYqGyvCf6ao59V4bFO7UboZv2tDjrRdkvqGHlmbKY5
         BXi2sxy9+KTrYXxWzmnM1Tn3O3CoyQrb9PpnKehuxVkP7xpq/Bzm+mlKoYCRIOL+ZsE7
         +ITcA7eArcrxZr4DDUL6xXTkqaB+MB9ocsgCVuIwoSIVSpn6X+DD1r0tB8cavQANNfbn
         fXibR/QcLf44DsrtqRnGdlIjoYDGb4N+WOa3TKvUdI3iEKTPpEmKtTmbCtDe4zX1bJwt
         S4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633934; x=1752238734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNwZsoeqoXHoOATMYn/1BYK+BlrQW1PbbWtZf2zI9aI=;
        b=gUuFner9xoOfRnbQFrkOPA9zjR8pdkLOkqfgj54mw3cCVWd7NC3gCqu0/vKP5/PWB2
         UiKtU4RTYoEBFNHT7ul6rhCO5JCcEvfwZTcxK/Qxxzbkd54r5/lRIz3dZ7MPEf/2Ftzb
         0OsJ/cpyKUWuiJFwB9cpYOT/7+PrliLcmonBPHtj7TrfKE28m5Omko0MJ0TdX38OP5z8
         pTQs7rqEOCJAYaWdjxNxQJGsQAUE7Y7fztxeBK9Z6usZQbOl+Qx5oSQNYM5lcnE/OumH
         OaNw5vS9qQ1eV/JcT50wn2LW+DDpoBIotzoEUn199h9zThzxruqKD5nOrDYMOAHl4EGw
         34NA==
X-Gm-Message-State: AOJu0Yz2ge3nRJQS2yTAYMR8egx6mS6bBU/ncDRVvH9aQcdu6M1QKX/7
	SK6cd2eXNZduiOyoTc1PJyZVRykfib0phrSmlh8ZuSQ1btkgpTrxQW8pMOzmSJxUiVU=
X-Gm-Gg: ASbGnctEb9VRaXcPbVoX3od4RccPh6+x+JO1LGMaiLt4+uunVVIT4ddnAiLhH2LbHiG
	R0CpkFN2L6BZbTpqu64PWFefkY/KJFnvsRl3S10Zk1dO7rmR3V71vh/hpqB4qRyM9S1DD2nktir
	ImIwzwnCr8pZatUeARe4KgSErGjYz0tjbTOUzU7yVN2NgkCBHw9GKi3uPeteTNaBprI0TiFeNI2
	hj8pOPORezxKVhq5yZwK9zIKDRapK/bQqg5+Hn7kgMqIxq33RBHnHqAvR7mfqWMPNCguKcgCKz8
	oRlF63fTBALGIH7oJbBSHCbI13ePWKxGEizyGSG1tbwgC6clkGqOgig=
X-Google-Smtp-Source: AGHT+IHe/lJNXc9nNRY79mXyiujlUe0H7zilOOniFRHG+39Z/vT3I5AhFXNVDcu4Tz/rDh27MnylCQ==
X-Received: by 2002:a05:6000:2f82:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3b4964dc1aamr2028715f8f.28.1751633933718;
        Fri, 04 Jul 2025 05:58:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:58:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Date: Fri, 04 Jul 2025 14:58:47 +0200
Message-Id: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfQZ2gC/3XOSwqDMBCA4auUrJuSl8Z01XuULpIYdaCYkIgo4
 t0b7cZSXP4D880sKLkILqH7ZUHRjZDA9znE9YJsp/vWYahzI0ZYQQRhuA3gcZpTk7DtIGA3BR8
 HXAltBROmpLZAeTlE18C0w89X7g7S4OO83xnpNv2SJSVn5EgxwbqyUmshZGXo4w29jv7mY4s2c
 2QHh/FTh2WnLhSTijeVKsWfww8OP/+HZ8coJY1TRlIuf5x1XT84itdFTQEAAA==
X-Change-ID: 20250402-gpio-sysfs-chip-export-84ac424b61c5
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4611;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Rmy9NIDFrAI/XuTDCIDYfJtMLVfyZIHo91lbOs1rWw4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AKewKv6C6VrL9R1JVjL7cW6yhNMyEXb8lvj
 GQ6l5x8T1eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCgAKCRARpy6gFHHX
 clauEACmXk0XpP32Yb9TyGBOb9LYZ9L1yfm6W/PTOqbxp6jdW9qX6M5MYYRdgEZR9hjczh8o4ZC
 qj5YMhXEBSRk+60sI1dAiIXQNOSBu12Trg7gj3Ytu1aoy0t9LQBLb2wYrn+AraEaBFVmSzNkAa+
 tivFfQhX6VGNf4pV3TWQBliabJLPc9OVAergFBzLxzBrTUyu16JI4cQJYTPf0TYf42SmrYDA/h1
 9XwNrAGKjquaPKK7dcfvnAkKZi2f0yu+xGrObGeuRwJC6hHSsjvJ8Udg8z8U1Y5L2EaBHqVh8Gd
 swXcyHMapKoKkxSexgm/+hdQOifbR4JsgkG+qsQN+t15BfMgZptVArz1wW8zUERrs/sDWKocDye
 J7v72qShG35oevMYHru/OvPGcCTQnrhiiuXYBB4PAzNEhlCcIEL/7G8yGVo8r4RnnUiFXxE0tX7
 pOwgLX/2GIdcJoDGZwm5t5OMF0fcN2pVV35bZvLFYqKwxYKK2MBkEq+KCg/YzexcrQJvGxqm/Gl
 D0E9dslM5+5P/LScO3dhhkmDsXtp/i3dVLUaDPBglrEUiXFvaSTtipxaEy/qA3JBrXIc4ucyBZV
 wqcxaC+G0jCsugmolpQMyFSZsqpATGXDmSNMNW9AtP6gz86vR7hreWuX3rvEsEc/+0v32s24PcG
 339mgl5w6eauMaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Following our discussion[1], here's a proposal for extending the sysfs
interface with attributes not referring to GPIO lines by their global
numbers in a backward compatible way.

Long story short: there is now a new class device for each GPIO chip.
It's called chipX where X is the ID of the device as per the driver
model and it lives next to the old gpiochipABC where ABC is the GPIO
base. Each new chip class device has a pair of export/unexport
attributes which work similarly to the global ones under /sys/class/gpio
but take hardware offsets within the chip as input, instead of the
global numbers. Finally, each exported line appears at the same time as
the global /sys/class/gpio/gpioABC as well as per-chip
/sys/class/gpio/chipX/gpioY sysfs group except that the latter only
implements a minimal subset of the functionality of the former, namely:
only the 'direction' and 'value' attributes and it doesn't support event
polling.

The series contains the implementation of a parallel GPIO chip entry not
containing the base GPIO number in the name and the corresponding sysfs
attribute group for each exported line that lives under the new chip
class device as well as a way to allow to compile out the legacy parts
leaving only the new elements of the sysfs ABI.

This series passes the compatibility tests I wrote while working on the
user-space compatibility layer for sysfs[2].

[1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
[2] https://github.com/brgl/gpio-sysfs-compat-tests

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- make the chip-local, per-line attribute group only have a minimal subset
  of the functionality of the line class device that exists now: only
  expose the direction and value attributes and disable event polling
  for the latter
- subsequently allow to compile-out the code supporting interrupts and
  `edge` and `active_low` attributes
- only add the line to the list of exported lines at the very end of a
  successful gpiod_export()
- add a TODO task to track the removal of the legacy sysfs bits
- Link to v3: https://lore.kernel.org/r/20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org

Changes in v3:
- wrap a local variable in #ifdef's as it's only used if legacy sysfs
  ABI is enabled (Geert)
- fix an issue with jumping over a variable annotated with __free()
- use gpiod_is_equal() where applicable
- fix a use-after-free issue
- remove trailing commas from NULL array terminators
- improve commit messages
- change patch order for smaller diffstats and better readability
- put struct list_head at the beginning of structures for better
  performance
- reshuffle the contents of struct gpiodev_data: put all legacy fields
  at the end
- don't break lines too eagerly
- Link to v2: https://lore.kernel.org/r/20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org

Changes in v2:
- add missing call to sysfs_remove_groups() in gpiod_unexport()
- pick up review tags
- drop patches that were already applied
- add missing documentation for the chip-local line attributes
- correct the statement about chip's label uniqueness in docs
- Link to v1: https://lore.kernel.org/r/20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org

---
Bartosz Golaszewski (10):
      gpio: sysfs: use gpiod_is_equal() to compare GPIO descriptors
      gpio: sysfs: add a parallel class device for each GPIO chip using device IDs
      gpio: sysfs: only get the dirent reference for the value attr once
      gpio: sysfs: pass gpiod_data directly to internal GPIO sysfs functions
      gpio: sysfs: rename the data variable in gpiod_(un)export()
      gpio: sysfs: don't use driver data in sysfs callbacks for line attributes
      gpio: sysfs: don't look up exported lines as class devices
      gpio: sysfs: export the GPIO directory locally in the gpiochip<id> directory
      gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs interface
      gpio: TODO: remove the task for the sysfs rework

 Documentation/ABI/obsolete/sysfs-gpio |  10 +-
 drivers/gpio/Kconfig                  |   8 +
 drivers/gpio/TODO                     |  14 +-
 drivers/gpio/gpiolib-sysfs.c          | 522 +++++++++++++++++++++++++---------
 4 files changed, 412 insertions(+), 142 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250402-gpio-sysfs-chip-export-84ac424b61c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


