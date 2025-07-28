Return-Path: <linux-gpio+bounces-23861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C8B138B5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 12:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D587E188BC41
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C06625485F;
	Mon, 28 Jul 2025 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="If5Y2D0+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDF1DDF7
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697831; cv=none; b=AADuIihxeBc+0t/R5M2Mx1UyjjuHeX3Xh8O/g9ivInHdWaNhvw8hQdWYzjm5WFW+kKVyTqtVDmu1u/QyiwtTH96RD6RfJ9o/I90N48VsTCU4Md/6bukFsvR/B2XQLdJmAVszxkAxuoC4MnZIlDOc+6ldVoN0NTAvQdmhXhKCxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697831; c=relaxed/simple;
	bh=kTYkVDLSHj6pge0v5/0ipLyfqWsyO3cAEt7+GG14SMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kiOGbaH3PSHgM7mTvXi7aYgwut2Ytbl35moF48iKh75X3gFUz7sDcyOSXsjbMnBNK8GBRR+K1Bnkv7X29S/x2cNI8i0PKDe9BT4e25sahdeJ85EUQwziH1XZVUA9fZCA1XVYeIGoF7ZO+aUSOWAX/xD6sz/QTLX5dCFaKhwAsJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=If5Y2D0+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b77b8750acso1277856f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753697826; x=1754302626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qExrKmSAH5oN13GpZr054KnGd0xxgaKyksXvxTaP1dU=;
        b=If5Y2D0+juJdXzbiXqqV/vLvZCnCqCRZT1kXAE0vPk41Wajfde3xyEVbYZudGe8v/G
         GfzYMlFOCE+vOKEobV1nzVBII/dRFZq+k29v6/jpAaU+PkS9idp/YbjjbVlFaGC/kcOJ
         i5n5ZRY8trQ7aZVNSksNAyz9YzkV9VWsfGHwUJCKY6AD3DwZJZ2F/bElVn73S0TZOyiz
         lf4HrW2ahu11dSh+hobuu5HpIMPCGd+HrT8tRCRrFg0m00oAmQR1FGr52d+w9E9yj5gF
         its3BQttkl8m8u2mu4LxjNz4u3SmUiXTQzO8ymNncAmd0G9UdrJEicPphFpcLhJpMD2f
         dhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753697826; x=1754302626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qExrKmSAH5oN13GpZr054KnGd0xxgaKyksXvxTaP1dU=;
        b=Vn8doY9xqdBxFtSQJxET//bjULilIWREwZyJzuObCjFePt/7s+KKMTetihek43j4r9
         +Z54lRgxDwoSlc8CUqdJb/fv+m8P/RzyLcOZC1VDO4AE1AjIsxM09ZZvGyNj7Zo6a59L
         FeP8BF23n2Y4l4keM/zdKGTDGjy3N6kp2Xdoq5p8g4OZsGfPvPi+vlyL5V/yYG4g7mEv
         OjVAPulBcy04juPwSypj4LLf0cTmFvWd5dDr/pQ+YKKybUPvDyfms5Ct6LuU3kSQriME
         D+gy0yoBcH9cGANIWX70bRtbFDcUgbhPKtGsN+GFF4MjooaXCTg0xiZJavLvUD09WxQ6
         V0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVnGNClVp2Av7al0MYTpwPVfOhnAmrzdnDlKtsMwtxu0QPapoTIK3wwP9KIlf8vLCak0R47cDeTp4hy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZmGuSLV3sLFpVnrS/xOka5t3feFXIPkjCWpGQf4U3mbYwqF13
	y6aaB4jK2syzzMY//CfOOeG/r3007ujLJF8/cyCcsUtL3im2i8J+y5lzTTgDA891w1I=
X-Gm-Gg: ASbGncswJC8Jr/CocEyqC2NeqAzzO6M/juXiH1Lsh8qbCAJWhyybXu9KT2UYDxo5Hv7
	MJd8BCGIrnnWL2wnR/2C7C9hS8i6Ejyaka4VNYB1gogBPbWsVvAalu7tAIv5J5fLdh8mvfGX1wD
	aMuKpTQlDIChkkIbNFT2XHM6qe2g+QIOcXydUKgJTh//nzgie3KbF0GigguLBiiTeH8LtTxJsz3
	W1Qv65Ee11KDOOX+KN4qiQzMsbDFjgxljoeGFkD2T3f25XbZ2c5F710LNGZAzLbptTe+1P3G1gI
	d46CiUAj65LolK/WguNVU3fal2sn8NhXvuIcnsSz53M19s1W4Ak7+iFZnZwyTTWy7P6Q9/MeTC5
	hOWg/WXQEztrFJPiRyJzH6g==
X-Google-Smtp-Source: AGHT+IGAL1dDE9FCcKlpxpT9s84157iAxR+Mk29V7J90zikm8tkhX+C9A1hAIENMI7x8ZN7syRxOGg==
X-Received: by 2002:a05:6000:2401:b0:3b7:885d:d2ec with SMTP id ffacd0b85a97d-3b7885dd3a9mr1917823f8f.18.1753697825303;
        Mon, 28 Jul 2025 03:17:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:53d4:51a:4d68:dac1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b77db8a944sm7167723f8f.52.2025.07.28.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 03:17:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.17-rc1
Date: Mon, 28 Jul 2025 12:16:56 +0200
Message-ID: <20250728101658.44311-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here is the big pull-request for the GPIO subsystem for v6.17-rc1. There
will be at least one more later into the merge window, I'll talk about it
in a minute.

There's one new driver (Apple SMC) and extensions to existing drivers for
supporting new HW models. A lot of different impovements across drivers
and in core GPIO code. Details on that are in the signed tag as usual.

We managed to remove some of the legacy APIs. Arnd Bergmann started to
work on making the legacy bits optional so that we may compile them only
for older platforms that still really need them.

Rob Herring has done a lot of work to convert legacy .txt dt-bindings for
GPIO controllers to YAML. There are only a few left now in the GPIO tree.

A big part of the commits in this PR concern the conversion of GPIO
drivers to using the new line value setter callbacks. This conversion
is now complete treewide (unless I've missed something) and once all the
changes from different trees land in mainline, I'll send you another PR
containing a commit dropping the legacy callbacks from the tree.

On that note: the commit I mentioned above is already on the list[1]. I
have a second one that also renames the new callbacks back to their
original name[2]. This is a result of a simple sed over all source files
and a skim over the changes to make sure everything looks ok and to
adjust the formatting. I don't think it makes sense to send 4300+ lines
of diff to the mailing list, Cc'ing 200+ maintainers if all it does is
a simple treewide rename, so would you be willing to accept this commit
too as part of my second PR in order to avoid hundreds of small renaming
patches over the course of the next releases? FYI: it's not in next yet
but it passed all the regular autobuilder tests in my devel branch.

As the quest to pay back technical dept never really ends, we're starting
another set of interface conversions, this time it's about moving fields
specific to only a handful of drivers using the gpio-mmio helper out of
the core gpio_chip structure that every controller implements and uses.
This cycle we introduce a new set of APIs and convert a few drivers under
drivers/gpio/, next cycle we'll convert remaining modules treewide (in
gpio, pinctrl and mfd trees) and finally remove the old interfaces and
move the gpio-mmio fields into their own structure wrapping gpio_chip.

One last change I should mention here is the rework of the sysfs
interface. In 2016, we introduced the GPIO character device as the
preferred alternative to the sysfs class under /sys/class/gpio. While it
has seen a wide adoption with the help of its user-space counterpart -
libgpiod - there are still users who prefer the simplicity of sysfs. As
far as the GPIO subsystem is concerned, the problem is not the existince
of the GPIO class as such but rather the fact that it exposes the global
GPIO numbers to the user-space, stopping us from ever being able to
remove the numberspace from the kernel. To that end, this release we
introduced a parallel, limited sysfs interface that doesn't expose these
numbers and only implements a subset of features that are relevant to the
existing users. This is a result of several discussions over the course
of last year and should allow us to remove the legacy part some time in
the future.

Please consider pulling.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20250725074651.14002-1-brgl@bgdev.pl/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?h=gpio/devel&id=d95cc7b82e0d2bf79102f0a1b4263b2e6d299e17

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.17-rc1

for you to fetch changes up to 6b94bf976f9f9e6d4a6bf3218968a506c049702e:

  MIPS: alchemy: gpio: use new GPIO line value setter callbacks for the remaining chips (2025-07-28 08:03:08 +0200)

----------------------------------------------------------------
gpio updates for v6.17-rc1

GPIOLIB core:
- introduce a parallel, limited sysfs user ABI that doesn't expose the
  global GPIO numbers to user-space while maintaining backward
  compatibility with the end goal of it completely replacing the existing
  interface, allowing us to remove it
- remove the legacy devm_gpio_request() routine which has no more users
- start the process of allowing to compile-out the legacy parts of the
  GPIO core for users who don't need it by introducing a new Kconfig
  option: GPIOLIB_LEGACY
- don't use global GPIO numbers in debugfs output from the core code
  (drivers still do it, the work is ongoing)
- start the process of moving the fields specific to the gpio-mmio helper
  out of the core struct gpio_chip into their own structure that wraps
  it: create a new header with modern interfaces and convert several
  drivers to using it
- remove the platform data structure associated with the gpio-mmio helper
  from the kernel after having converted all remaining users to generic
  device properties
- remove legacy struct gpio definition as it has no more users

New drivers:
- add the GPIO driver for the Apple System Management Controller

Driver improvements:
- add support for new models to gpio-adp5585, gpio-tps65219 and
  gpio-pca953x
- extend the interrupt support in gpio-loongson-64bit
- allow to mark the simulated GPIO lines as invalid in gpio-sim
- convert all remaining GPIO drivers to using the new GPIO value setter
  callbacks
- convert gpio-rcar to using simple device power management ops callbacks
- don't check if current direction of a line is output before setting
  the value in gpio-pisosr and ti-fpc202: the GPIO core already handles
  that
- also drop unneeded GPIO range checks in drivers, the core already makes
  sure we're within bounds when calling driver callbacks
- use dev_fwnode() where applicable across GPIO drivers
- set line value in gpio-zynqmp-modepin and gpio-twl6040 when the user
  wants to change direction of the pin to output even though these
  drivers don't need to do anything else to actually set the direction,
  otherwise a call like gpiod_direction_output(d, 1) will not result in
  the line driver high
- remove the reduntant call to pm_runtime_mark_last_busy() from
  gpio-arizona
- use lock guards in gpio-cadence and gpio-mxc
- check the return values of regmap functions in gpio-wcd934x and
  gpio-tps65912
- use better regmap interfaces in gpio-wcove and gpio-pca953x
- remove dummy GPIO chip callbacks from several drivers in cases where
  the GPIO core can already handle their absence
- allow building gpio-palmas as a module

Fixes:
- use correct bit widths (according to the documentation) in gpio-virtio

Device-tree bindings:
- convert several of the legacy .txt documents for many different devices
  to YAML, improving automatic validation
- create a "trivial" GPIO DT schema that covers a wide range of simple
  hardware that share a set of basic GPIO properties
- document new HW: Apple MAC SMC GPIO block and adp5589 I/O expander
- document a new model for pca95xx
- add and/or remove properties in YAML documents for gpio-rockchip,
  fsl,qoriq-gpio, arm,pl061 and gpio-xilinx

Misc:
- some minor refactoring in several places, adding/removing forward
  declarations, moving defines to better places, constify the arguments
  in some functions, remove duplicate includes, etc.
- documentation updates

----------------------------------------------------------------
Aaron Kling (1):
      gpio: palmas: Allow building as a module

Andrei Lalaev (1):
      gpiolib: of: add forward declaration for struct device_node

Andy Shevchenko (4):
      usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      gpiolib: Remove unused devm_gpio_request()
      gpio: Remove unused 'struct gpio' definition
      gpiolib: Move GPIO_DYNAMIC_* constants to its only user

Antonio Quartulli (1):
      gpio: sysfs: fix use-after-free in error path

Arnd Bergmann (2):
      gpiolib: make legacy interfaces optional
      gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB

Bartosz Golaszewski (129):
      gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks
      Merge tag 'gpio-mmio-bgpiof-no-input-flag-for-v6.17' into gpio/for-next
      gpio: npcm-sgpio: don't use legacy GPIO chip setters
      gpio: mmio: don't use legacy GPIO chip setters
      platform: cznic: use new GPIO line value setter callbacks
      Documentation: gpio: undocument removed behavior
      Documentation: gpio: document the active_low field in the sysfs ABI
      gpio: sysfs: call mutex_destroy() in gpiod_unexport()
      gpio: sysfs: refactor the coding style
      gpio: sysfs: remove unneeded headers
      gpio: sysfs: remove the mockdev pointer from struct gpio_device
      gpio: pca9570: use new GPIO line value setter callbacks
      gpio: pcf857x: use new GPIO line value setter callbacks
      gpio: pch: use new GPIO line value setter callbacks
      gpio: pl061: use new GPIO line value setter callbacks
      gpio: pmic-eic-sprd: drop unneeded .set() callback
      gpio: pxa: use new GPIO line value setter callbacks
      gpio: rc5t583: use new GPIO line value setter callbacks
      gpio: rdc321x: use new GPIO line value setter callbacks
      gpio: rockchip: use new GPIO line value setter callbacks
      gpio: rtd: use new GPIO line value setter callbacks
      gpio: sa1100: use new GPIO line value setter callbacks
      gpio: clps711x: drop unneeded platform_set_drvdata()
      gpio: constify arguments of gpiod_is_equal()
      gpio: make gpiod_is_equal() arguments stricter
      gpio: pisosr: remove unneeded direction_output() callback
      gpio: sama5d2-piobu: use new GPIO line value setter callbacks
      gpio: sch311x: use new GPIO line value setter callbacks
      gpio: sch: use new GPIO line value setter callbacks
      gpio: siox: use new GPIO line value setter callbacks
      gpio: spear-spics: remove unneeded callbacks
      gpio: spear-spics: use new GPIO line value setter callbacks
      gpio: sprd: use new GPIO line value setter callbacks
      gpio: stmpe: use new GPIO line value setter callbacks
      gpio: stp-xway: use new GPIO line value setter callbacks
      gpio: syscon: use new GPIO line value setter callbacks
      gpio: tangier: use new GPIO line value setter callbacks
      gpio: tc3589x: use new GPIO line value setter callbacks
      Merge tag 'ib-mfd-gpio-input-pwm-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      gpio: reg: use new GPIO line value setter callbacks
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata
      Merge tag 'gpio-mmio-remove-bgpio-pdata-for-v6.17-rc1' into gpio/for-next
      gpio: generic: add new generic GPIO chip API
      gpio: mxc: use lock guards for the generic GPIO chip lock
      gpio: mxc: use new generic GPIO chip API
      gpio: clps711x: use new generic GPIO chip API
      gpio: cadence: use lock guards
      gpio: cadence: use new generic GPIO chip API
      gpio: 74xx-mmio: use new generic GPIO chip API
      gpio: en7523: use new generic GPIO chip API
      gpio: tegra186: don't call the set() callback directly
      gpio: tegra186: use new GPIO line value setter callbacks
      gpio: tegra: use new GPIO line value setter callbacks
      gpio: thunderx: use new GPIO line value setter callbacks
      gpio: timberdale: use new GPIO line value setter callbacks
      gpio: tpic2810: remove unneeded callbacks
      gpio: tpic2810: use new GPIO line value setter callbacks
      gpio: tps65086: use new GPIO line value setter callbacks
      gpio: tps65218: remove unneeded callbacks
      gpio: tps65218: use new GPIO line value setter callbacks
      gpio: tps65219: use new GPIO line value setter callbacks
      gpio: tps6586x: use new GPIO line value setter callbacks
      Merge tag 'pm-runtime-6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm into gpio/for-next
      gpio: sim: allow to mark simulated lines as invalid
      gpiolib: don't use GPIO global numbers in debugfs output
      gpio: tps65910: use new GPIO line value setter callbacks
      gpio: tps65912: check the return value of regmap_update_bits()
      gpio: tps65912: use new GPIO line value setter callbacks
      gpio: tps68470: use new GPIO line value setter callbacks
      gpio: tqmx86: use new GPIO line value setter callbacks
      gpio: ts4900: use new GPIO line value setter callbacks
      gpio: twl4030: use new GPIO line value setter callbacks
      gpio: twl6040: use new GPIO line value setter callbacks
      gpio: twl6040: set line value in .direction_out()
      gpio: uniphier: use new GPIO line value setter callbacks
      gpio: viperboard: use new GPIO line value setter callbacks
      gpio: virtio: use new GPIO line value setter callbacks
      gpio: vx855: use new GPIO line value setter callbacks
      gpio: wcd934x: check the return value of regmap_update_bits()
      gpio: wcd934x: use new GPIO line value setter callbacks
      gpio: winbond: use new GPIO line value setter callbacks
      gpio: wm831x: use new GPIO line value setter callbacks
      gpio: wm8350: use new GPIO line value setter callbacks
      gpio: wm8994: use new GPIO line value setter callbacks
      gpio: xgene: use new GPIO line value setter callbacks
      gpio: xilinx: use new GPIO line value setter callbacks
      gpio: xlp: drop unneeded ngpio checks
      gpio: xlp: use new GPIO line value setter callbacks
      gpio: xra1403: use new GPIO line value setter callbacks
      gpio: xtensa: remove unneeded .set() callback
      gpio: xtensa: use new GPIO line value setter callbacks
      gpio: zevio: use new GPIO line value setter callbacks
      gpio: zynq: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: set line value in .direction_output()
      gpio: wcove: use regmap_assign_bits() in .set()
      gpio: wcove: use new GPIO line value setter callbacks
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
      misc: ti-fpc202: remove unneeded direction check
      misc: ti-fpc202: use new GPIO line value setter callbacks
      gpio: xilinx: convert set_multiple() to the new API as well
      Merge tag 'ib-mfd-gpio-power-soc-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      MIPS: alchemy: gpio: use new GPIO line value setter callbacks for the remaining chips

Binbin Zhou (1):
      gpio: loongson-64bit: Extend GPIO irq support

Clément Le Goffic (1):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

Dan Carpenter (2):
      gpio: viperboard: Unlock on error in vprbrd_gpiob_direction_output()
      gpio: sysfs: Fix an end of loop test in gpiod_unexport()

Daniel Sullivan (1):
      gpio: ts5500: use new GPIO line value setter callbacks

David Lechner (1):
      gpio: virtuser: use gpiod_multi_set_value_cansleep()

Frank Li (3):
      dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
      dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
      dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format

Geert Uytterhoeven (3):
      gpio: rcar: Remove checks for empty bankmasks
      gpio: rcar: Use new line value setter callbacks
      gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Harald Mommer (1):
      gpio: virtio: Fix config space reading.

Hector Martin (2):
      gpio: Add new gpio-macsmc driver for Apple Macs
      power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC

Hugo Villeneuve (1):
      gpio: pca953x: use regmap_update_bits() to improve performance

Jiri Slaby (SUSE) (1):
      gpio: Use dev_fwnode() where applicable across drivers

Jonas Karlman (1):
      dt-bindings: gpio: rockchip: Allow use of a power-domain

Krzysztof Kozlowski (1):
      gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping

Maria Garcia (2):
      dt-bindings: gpio: pca95xx: add TI TCA6418
      gpio: pca953x: Add support for TI TCA6418

Michal Simek (1):
      dt-bindings: gpio: gpio-xilinx: Mark clocks as required property

Nuno Sá (20):
      dt-bindings: mfd: adp5585: ease on the required properties
      mfd: adp5585: Only add devices given in FW
      mfd: adp5585: Enable oscillator during probe
      mfd: adp5585: Make use of MFD_CELL_NAME()
      dt-bindings: mfd: adp5585: document adp5589 I/O expander
      mfd: adp5585: Refactor how regmap defaults are handled
      mfd: adp5585: Add support for adp5589
      mfd: adp5585: Add a per chip reg struture
      gpio: adp5585: add support for the adp5589 expander
      pwm: adp5585: add support for adp5589
      dt-bindings: mfd: adp5585: add properties for input events
      mfd: adp5585: Add support for event handling
      mfd: adp5585: Support reset and unlock events
      mfd: adp5585: Add support for input devices
      gpio: adp5585: support gpi events
      Input: adp5585: Add Analog Devices ADP5585/89 support
      Input: adp5589: remove the driver
      mfd: adp5585: Support getting vdd regulator
      dt-bindings: mfd: adp5585: document reset gpio
      mfd: adp5585: Add support for a reset pin

Rob Herring (Arm) (17):
      dt-bindings: gpio: arm,pl061: Drop interrupt properties as required
      dt-bindings: gpio: Convert lacie,netxbig-gpio-ext to DT schema
      dt-bindings: gpio: Convert microchip,pic32mzda-gpio to DT schema
      dt-bindings: gpio: Convert exar,xra1403 to DT schema
      dt-bindings: gpio: Convert cavium,octeon-3860-gpio to DT schema
      dt-bindings: gpio: Convert cirrus,clps711x-mctrl-gpio to DT schema
      dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
      dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema
      dt-bindings: gpio: Convert lantiq,gpio-mm-lantiq to DT schema
      dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
      dt-bindings: gpio: Convert apm,xgene-gpio-sb to DT schema
      dt-bindings: gpio: Convert abilis,tb10x-gpio to DT schema
      dt-bindings: gpio: Convert st,spear-spics-gpio to DT schema
      dt-bindings: gpio: Create a trivial GPIO schema
      dt-bindings: gpio: fsl,qoriq-gpio: Add missing mpc8xxx compatibles
      dt-bindings: gpio: Convert maxim,max3191x to DT schema
      dt-bindings: gpio: Convert qca,ar7100-gpio to DT schema

Russell King (Oracle) (2):
      dt-bindings: gpio: Add Apple Mac SMC GPIO block
      dt-bindings: mfd: Add Apple Mac System Management Controller

Sakari Ailus (7):
      PM: runtime: Document return values of suspend-related API functions
      PM: runtime: Mark last busy stamp in pm_runtime_put_autosuspend()
      PM: runtime: Mark last busy stamp in pm_runtime_put_sync_autosuspend()
      PM: runtime: Mark last busy stamp in pm_runtime_autosuspend()
      PM: runtime: Mark last busy stamp in pm_request_autosuspend()
      Documentation: PM: *_autosuspend() functions update last busy time
      gpio: arizona: Remove redundant pm_runtime_mark_last_busy() calls

Shree Ramamoorthy (2):
      gpio: tps65219: Update _IDX & _OFFSET macro prefix
      gpio: tps65219: Add support for TI TPS65214 PMIC

Stefan Wahren (1):
      gpio: raspberrypi-exp: use new GPIO line value setter callbacks

Sven Peter (3):
      dt-bindings: power: reboot: Add Apple Mac SMC Reboot Controller
      soc: apple: rtkit: Make shmem_destroy optional
      mfd: Add Apple Silicon System Management Controller

Yang Li (1):
      gpio: cadence: Remove duplicated include in gpio-cadence.c

 Documentation/ABI/obsolete/sysfs-gpio              |   12 +-
 Documentation/admin-guide/gpio/gpio-sim.rst        |    7 +-
 .../devicetree/bindings/fpga/fpga-region.yaml      |    1 +
 .../devicetree/bindings/gpio/8xxx_gpio.txt         |   72 --
 .../devicetree/bindings/gpio/abilis,tb10x-gpio.txt |   35 -
 .../bindings/gpio/abilis,tb10x-gpio.yaml           |   63 ++
 .../devicetree/bindings/gpio/altr-pio-1.0.yaml     |   75 ++
 .../bindings/gpio/apm,xgene-gpio-sb.yaml           |   94 ++
 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |   29 +
 .../bindings/gpio/cavium,octeon-3860-gpio.yaml     |   62 ++
 .../bindings/gpio/cavium-octeon-gpio.txt           |   49 -
 .../bindings/gpio/cirrus,clps711x-mctrl-gpio.txt   |   17 -
 .../bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml  |   49 +
 .../devicetree/bindings/gpio/exar,xra1403.yaml     |   75 ++
 .../devicetree/bindings/gpio/fcs,fxl6408.yaml      |   59 --
 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |    7 +
 .../bindings/gpio/gateworks,pld-gpio.txt           |   19 -
 .../devicetree/bindings/gpio/gpio-74xx-mmio.txt    |   30 -
 .../devicetree/bindings/gpio/gpio-altera.txt       |   44 -
 .../devicetree/bindings/gpio/gpio-ath79.txt        |   37 -
 .../devicetree/bindings/gpio/gpio-clps711x.txt     |   28 -
 .../devicetree/bindings/gpio/gpio-dsp-keystone.txt |   39 -
 .../devicetree/bindings/gpio/gpio-lp3943.txt       |   37 -
 .../devicetree/bindings/gpio/gpio-max3191x.txt     |   59 --
 .../devicetree/bindings/gpio/gpio-max77620.txt     |   25 -
 .../devicetree/bindings/gpio/gpio-mm-lantiq.txt    |   38 -
 .../devicetree/bindings/gpio/gpio-moxtet.txt       |   18 -
 .../devicetree/bindings/gpio/gpio-palmas.txt       |   27 -
 .../devicetree/bindings/gpio/gpio-pca9570.yaml     |   56 -
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |    1 +
 .../devicetree/bindings/gpio/gpio-pisosr.txt       |   34 -
 .../devicetree/bindings/gpio/gpio-tpic2810.yaml    |   51 -
 .../devicetree/bindings/gpio/gpio-ts4800.txt       |   20 -
 .../devicetree/bindings/gpio/gpio-ts4900.txt       |   30 -
 .../devicetree/bindings/gpio/gpio-twl4030.txt      |   29 -
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |   64 --
 .../devicetree/bindings/gpio/gpio-xgene.txt        |   22 -
 .../devicetree/bindings/gpio/gpio-xra1403.txt      |   46 -
 .../devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt   |   24 -
 .../bindings/gpio/lacie,netxbig-gpio-ext.yaml      |   60 ++
 .../bindings/gpio/lantiq,gpio-mm-lantiq.yaml       |   54 +
 .../bindings/gpio/loongson,ls1x-gpio.yaml          |   49 -
 .../devicetree/bindings/gpio/maxim,max31910.yaml   |  104 ++
 .../bindings/gpio/microchip,pic32-gpio.txt         |   49 -
 .../bindings/gpio/microchip,pic32mzda-gpio.yaml    |   71 ++
 .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |   22 -
 .../bindings/gpio/nintendo,hollywood-gpio.txt      |   26 -
 .../devicetree/bindings/gpio/nxp,lpc1850-gpio.txt  |   59 --
 .../devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml |   78 ++
 .../devicetree/bindings/gpio/pisosr-gpio.yaml      |   67 ++
 .../devicetree/bindings/gpio/pl061-gpio.yaml       |    3 -
 .../devicetree/bindings/gpio/qca,ar7100-gpio.yaml  |   60 ++
 .../bindings/gpio/rockchip,gpio-bank.yaml          |    3 +
 .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    |   50 -
 .../devicetree/bindings/gpio/snps,creg-gpio.txt    |   21 -
 .../devicetree/bindings/gpio/spear_spics.txt       |   49 -
 .../bindings/gpio/st,spear-spics-gpio.yaml         |   82 ++
 .../bindings/gpio/ti,keystone-dsp-gpio.yaml        |   65 ++
 .../devicetree/bindings/gpio/ti,twl4030-gpio.yaml  |   61 ++
 .../devicetree/bindings/gpio/trivial-gpio.yaml     |  110 ++
 .../devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml |    1 +
 .../devicetree/bindings/mfd/adi,adp5585.yaml       |  240 ++++-
 .../devicetree/bindings/mfd/apple,smc.yaml         |   79 ++
 Documentation/devicetree/bindings/mfd/lp3943.txt   |    2 +-
 .../bindings/power/reset/apple,smc-reboot.yaml     |   40 +
 .../devicetree/bindings/powerpc/nintendo/wii.txt   |    4 -
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    8 +-
 .../devicetree/bindings/trivial-devices.yaml       |    2 -
 Documentation/driver-api/driver-model/devres.rst   |    1 -
 Documentation/power/runtime_pm.rst                 |   50 +-
 MAINTAINERS                                        |   13 +-
 arch/arm/mach-omap1/board-ams-delta.c              |   42 +-
 arch/arm/mach-s3c/mach-crag6410.c                  |   17 +-
 arch/arm/mach-sa1100/assabet.c                     |    2 +-
 arch/arm/mach-sa1100/neponset.c                    |    2 +-
 arch/mips/alchemy/common/gpiolib.c                 |   12 +-
 drivers/gpio/Kconfig                               |   24 +-
 drivers/gpio/Makefile                              |    3 +-
 drivers/gpio/TODO                                  |   19 +-
 drivers/gpio/gpio-74xx-mmio.c                      |   32 +-
 drivers/gpio/gpio-adp5585.c                        |  364 ++++++-
 drivers/gpio/gpio-arizona.c                        |    2 -
 drivers/gpio/gpio-brcmstb.c                        |    6 +-
 drivers/gpio/gpio-cadence.c                        |   59 +-
 drivers/gpio/gpio-clps711x.c                       |   28 +-
 drivers/gpio/gpio-davinci.c                        |    2 +-
 drivers/gpio/gpio-em.c                             |    3 +-
 drivers/gpio/gpio-en7523.c                         |   36 +-
 drivers/gpio/gpio-grgpio.c                         |    5 +-
 drivers/gpio/gpio-loongson-64bit.c                 |    6 +
 drivers/gpio/gpio-lpc18xx.c                        |    4 +-
 drivers/gpio/gpio-macsmc.c                         |  292 ++++++
 drivers/gpio/gpio-mm-lantiq.c                      |   12 +-
 drivers/gpio/gpio-mmio.c                           |  131 ++-
 drivers/gpio/gpio-moxtet.c                         |   16 +-
 drivers/gpio/gpio-mpc5200.c                        |   12 +-
 drivers/gpio/gpio-mpfs.c                           |   11 +-
 drivers/gpio/gpio-mpsse.c                          |   22 +-
 drivers/gpio/gpio-msc313.c                         |    6 +-
 drivers/gpio/gpio-mvebu.c                          |    4 +-
 drivers/gpio/gpio-mxc.c                            |   91 +-
 drivers/gpio/gpio-mxs.c                            |    2 +-
 drivers/gpio/gpio-nomadik.c                        |    8 +-
 drivers/gpio/gpio-npcm-sgpio.c                     |   10 +-
 drivers/gpio/gpio-octeon.c                         |    7 +-
 drivers/gpio/gpio-omap.c                           |   14 +-
 drivers/gpio/gpio-palmas.c                         |   26 +-
 drivers/gpio/gpio-pca953x.c                        |  169 +++-
 drivers/gpio/gpio-pca9570.c                        |    5 +-
 drivers/gpio/gpio-pcf857x.c                        |   17 +-
 drivers/gpio/gpio-pch.c                            |    6 +-
 drivers/gpio/gpio-pisosr.c                         |    8 -
 drivers/gpio/gpio-pl061.c                          |    6 +-
 drivers/gpio/gpio-pmic-eic-sprd.c                  |    7 -
 drivers/gpio/gpio-pxa.c                            |   11 +-
 drivers/gpio/gpio-raspberrypi-exp.c                |   10 +-
 drivers/gpio/gpio-rc5t583.c                        |   19 +-
 drivers/gpio/gpio-rcar.c                           |   35 +-
 drivers/gpio/gpio-rdc321x.c                        |    8 +-
 drivers/gpio/gpio-reg.c                            |   16 +-
 drivers/gpio/gpio-rockchip.c                       |   12 +-
 drivers/gpio/gpio-rtd.c                            |    6 +-
 drivers/gpio/gpio-sa1100.c                         |    7 +-
 drivers/gpio/gpio-sama5d2-piobu.c                  |    8 +-
 drivers/gpio/gpio-sch.c                            |    9 +-
 drivers/gpio/gpio-sch311x.c                        |    8 +-
 drivers/gpio/gpio-sim.c                            |   83 +-
 drivers/gpio/gpio-siox.c                           |   11 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |    2 +-
 drivers/gpio/gpio-sodaville.c                      |    4 +-
 drivers/gpio/gpio-spear-spics.c                    |   21 +-
 drivers/gpio/gpio-sprd.c                           |    8 +-
 drivers/gpio/gpio-stmpe.c                          |   15 +-
 drivers/gpio/gpio-stp-xway.c                       |   10 +-
 drivers/gpio/gpio-syscon.c                         |   33 +-
 drivers/gpio/gpio-tangier.c                        |    6 +-
 drivers/gpio/gpio-tb10x.c                          |    5 +-
 drivers/gpio/gpio-tc3589x.c                        |   11 +-
 drivers/gpio/gpio-tegra.c                          |    8 +-
 drivers/gpio/gpio-tegra186.c                       |   49 +-
 drivers/gpio/gpio-thunderx.c                       |   18 +-
 drivers/gpio/gpio-timberdale.c                     |    7 +-
 drivers/gpio/gpio-tpic2810.c                       |   27 +-
 drivers/gpio/gpio-tps65086.c                       |   16 +-
 drivers/gpio/gpio-tps65218.c                       |   31 +-
 drivers/gpio/gpio-tps65219.c                       |  124 ++-
 drivers/gpio/gpio-tps6586x.c                       |   15 +-
 drivers/gpio/gpio-tps65910.c                       |   21 +-
 drivers/gpio/gpio-tps65912.c                       |   17 +-
 drivers/gpio/gpio-tps68470.c                       |   14 +-
 drivers/gpio/gpio-tqmx86.c                         |    8 +-
 drivers/gpio/gpio-ts4900.c                         |   14 +-
 drivers/gpio/gpio-ts5500.c                         |    6 +-
 drivers/gpio/gpio-twl4030.c                        |   25 +-
 drivers/gpio/gpio-twl6040.c                        |   23 +-
 drivers/gpio/gpio-uniphier.c                       |   16 +-
 drivers/gpio/gpio-viperboard.c                     |  120 ++-
 drivers/gpio/gpio-virtio.c                         |   16 +-
 drivers/gpio/gpio-virtuser.c                       |    4 +-
 drivers/gpio/gpio-vx855.c                          |    9 +-
 drivers/gpio/gpio-wcd934x.c                        |   16 +-
 drivers/gpio/gpio-wcove.c                          |   11 +-
 drivers/gpio/gpio-winbond.c                        |   16 +-
 drivers/gpio/gpio-wm831x.c                         |   13 +-
 drivers/gpio/gpio-wm8350.c                         |   15 +-
 drivers/gpio/gpio-wm8994.c                         |    8 +-
 drivers/gpio/gpio-xgene.c                          |    6 +-
 drivers/gpio/gpio-xilinx.c                         |   14 +-
 drivers/gpio/gpio-xlp.c                            |   10 +-
 drivers/gpio/gpio-xra1403.c                        |   13 +-
 drivers/gpio/gpio-xtensa.c                         |   13 +-
 drivers/gpio/gpio-zevio.c                          |    6 +-
 drivers/gpio/gpio-zynq.c                           |    8 +-
 drivers/gpio/gpio-zynqmp-modepin.c                 |   10 +-
 drivers/gpio/gpiolib-legacy.c                      |   38 -
 drivers/gpio/gpiolib-of.h                          |    2 +-
 drivers/gpio/gpiolib-sysfs.c                       |  676 +++++++++----
 drivers/gpio/gpiolib.c                             |   47 +-
 drivers/gpio/gpiolib.h                             |    3 -
 drivers/input/keyboard/Kconfig                     |   21 +-
 drivers/input/keyboard/Makefile                    |    2 +-
 drivers/input/keyboard/adp5585-keys.c              |  371 +++++++
 drivers/input/keyboard/adp5589-keys.c              | 1066 --------------------
 drivers/mfd/Kconfig                                |   18 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/adp5585.c                              |  741 +++++++++++++-
 drivers/mfd/macsmc.c                               |  498 +++++++++
 drivers/mfd/vexpress-sysreg.c                      |   46 +-
 drivers/misc/ti_fpc202.c                           |   13 +-
 drivers/platform/cznic/turris-omnia-mcu-gpio.c     |   35 +-
 drivers/power/reset/Kconfig                        |    9 +
 drivers/power/reset/Makefile                       |    1 +
 drivers/power/reset/macsmc-reboot.c                |  290 ++++++
 drivers/pwm/pwm-adp5585.c                          |   78 +-
 drivers/soc/apple/rtkit.c                          |    3 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |    5 +-
 include/linux/gpio.h                               |   43 +-
 include/linux/gpio/consumer.h                      |    5 +-
 include/linux/gpio/driver.h                        |    7 +-
 include/linux/gpio/generic.h                       |  120 +++
 include/linux/mfd/adp5585.h                        |  118 ++-
 include/linux/mfd/macsmc.h                         |  279 +++++
 include/linux/pm_runtime.h                         |  187 +++-
 203 files changed, 6685 insertions(+), 3760 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/altr-pio-1.0.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/apm,xgene-gpio-sb.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/cavium,octeon-3860-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/exar,xra1403.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ath79.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mm-lantiq.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-palmas.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-twl4030.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lacie,netxbig-gpio-ext.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/lantiq,gpio-mm-lantiq.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,pic32mzda-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/spear_spics.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/st,spear-spics-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
 create mode 100644 Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c
 create mode 100644 drivers/input/keyboard/adp5585-keys.c
 delete mode 100644 drivers/input/keyboard/adp5589-keys.c
 create mode 100644 drivers/mfd/macsmc.c
 create mode 100644 drivers/power/reset/macsmc-reboot.c
 create mode 100644 include/linux/gpio/generic.h
 create mode 100644 include/linux/mfd/macsmc.h

