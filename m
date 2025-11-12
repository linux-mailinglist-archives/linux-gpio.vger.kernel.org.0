Return-Path: <linux-gpio+bounces-28416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BBFC54BDE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 23:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F9C3AC464
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 22:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEAE2DC338;
	Wed, 12 Nov 2025 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoFZrAcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0623ED6A;
	Wed, 12 Nov 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762987776; cv=none; b=HLuB1apjKgVFt7FpJ7PzRXTjkAPmNnFeNnV3aCFDKTcgOxT/u59glsqNMrYtQCbyu9VS+YQTqmukJEnSlkwAExuxQySTiak/vxi26dcH8G3Xnpei51xKWYHYZw69WAvodgWAQqqK+GJ+jyHDPF6Bdiq2Qk1i0tq9xafv1K3OIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762987776; c=relaxed/simple;
	bh=yjfmSfviqyFYfR/m+bCzhtUMNCnhLMIBoyynxN5MlG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MFBf0+Tl+Bcn/cpALXoxeyL/F/mFL7ZU2CgQneYoDG5xHtxU7pFL9wY4ambXE1kl7g1I8+0UTsx4nb8nE5HAZ/Oi4omd8REJZBLbNE5JmpYiCAinS/bbcs4F22onKWg5CBxMyIUxHdeWsw3lpSH445GqQ7TKsPXS7MlzYMd5BYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoFZrAcQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762987774; x=1794523774;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yjfmSfviqyFYfR/m+bCzhtUMNCnhLMIBoyynxN5MlG4=;
  b=EoFZrAcQIkgPLmfJruxAVA9fXUYozHsWYk30UfSlkF4w/pmHqh5fJK1h
   aqGM7TBfSNYNd53atsBxmKxEXQQiiwSHx9sAG9x/66k/AFK77thuCwDY8
   AMemH6jdrt0ZZxSHC3qJKIH9JUsn3O2PZc5ckxBwQYOLhqupE3i2LUslW
   zIz9yX4oHCBKSaZOTJAnuBcCBgVhHVKBOQmqPIQDfpyql1cAQCkQDGNfb
   POagCGJdRusV1S3oMMo5En0cUNf4SQisU51tVGjTyT3MX4CA2vp3nBUUz
   ZceTCH8iLeCQ57SUJA2GV1u/Tw0hztLZAVbLJfBz2Vc8Rv0qDb9Eh+uhA
   g==;
X-CSE-ConnectionGUID: NwuGlETWSlqgfqJ5HOZORQ==
X-CSE-MsgGUID: 42cStaKwQ8mF2PPCBfPc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75743678"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="75743678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 14:49:33 -0800
X-CSE-ConnectionGUID: s+/NVN8hSoCcayhlYMRRKQ==
X-CSE-MsgGUID: i0ZhnGZZSTOuEovJVPdOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="188624817"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2025 14:49:31 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3C52C95; Wed, 12 Nov 2025 23:49:29 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and feature list for PCA953x
Date: Wed, 12 Nov 2025 23:48:20 +0100
Message-ID: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Levente Révész <levente.revesz@eilabs.com>

I went through all the datasheets and created this note listing
chip functions and register layouts.

Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

inline reply --> v1: made a formal patch, converted to reST format

 Documentation/driver-api/gpio/index.rst   |   1 +
 Documentation/driver-api/gpio/pca953x.rst | 552 ++++++++++++++++++++++
 2 files changed, 553 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/pca953x.rst

diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 87929840e85a..bee58f709b9a 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -15,6 +15,7 @@ Contents:
    legacy-boards
    drivers-on-gpio
    bt8xxgpio
+   pca953x
 
 Core
 ====
diff --git a/Documentation/driver-api/gpio/pca953x.rst b/Documentation/driver-api/gpio/pca953x.rst
new file mode 100644
index 000000000000..4bd7cf1120cb
--- /dev/null
+++ b/Documentation/driver-api/gpio/pca953x.rst
@@ -0,0 +1,552 @@
+============================================
+PCA953x I²C GPIO expander compatibility list
+============================================
+
+:Author: Levente Révész <levente.revesz@eilabs.com>
+
+I went through all the datasheets and created this note listing
+chip functions and register layouts.
+
+Overview of chips
+=================
+
+Chips with the basic 4 registers
+--------------------------------
+
+These chips have 4 register banks: input, output, invert and direction.
+Each of these banks contains (lines/8) registers, one for each GPIO port.
+
+Banks offset is always a power of 2:
+
+- 4 lines  -> bank offset is 1
+- 8 lines  -> bank offset is 1
+- 16 lines -> bank offset is 2
+- 24 lines -> bank offset is 4
+- 32 lines -> bank offset is 4
+- 40 lines -> bank offset is 8
+
+For example, register layout of GPIO expander with 24 lines:
+
++------+-----------------+--------+
+| addr | function        | bank   |
++======+=================+========+
+|  00  | input port0     |        |
++------+-----------------+        |
+|  01  | input port1     | bank 0 |
++------+-----------------+        |
+|  02  | input port2     |        |
++------+-----------------+--------+
+|  03  | n/a             |        |
++------+-----------------+--------+
+|  04  | output port0    |        |
++------+-----------------+        |
+|  05  | output port1    | bank 1 |
++------+-----------------+        |
+|  06  | output port2    |        |
++------+-----------------+--------+
+|  07  | n/a             |        |
++------+-----------------+--------+
+|  08  | invert port0    |        |
++------+-----------------+        |
+|  09  | invert port1    | bank 2 |
++------+-----------------+        |
+|  0A  | invert port2    |        |
++------+-----------------+--------+
+|  0B  | n/a             |        |
++------+-----------------+--------+
+|  0C  | direction port0 |        |
++------+-----------------+        |
+|  0D  | direction port1 | bank 3 |
++------+-----------------+        |
+|  0E  | direction port2 |        |
++------+-----------------+--------+
+|  0F  | n/a             |        |
++------+-----------------+--------+
+
+.. note::
+     This is followed by all supported chips, except by pcal6534.
+
+The table below shows the offsets for each of the compatible chips:
+
+========== ===== ========= ===== ====== ====== =========
+compatible lines interrupt input output invert direction
+========== ===== ========= ===== ====== ====== =========
+pca9536        4        no    00     01     02        03
+pca9537        4       yes    00     01     02        03
+pca6408        8       yes    00     01     02        03
+tca6408        8       yes    00     01     02        03
+pca9534        8       yes    00     01     02        03
+pca9538        8       yes    00     01     02        03
+pca9554        8       yes    00     01     02        03
+tca9554        8       yes    00     01     02        03
+pca9556        8        no    00     01     02        03
+pca9557        8        no    00     01     02        03
+pca6107        8       yes    00     01     02        03
+pca6416       16       yes    00     02     04        06
+tca6416       16       yes    00     02     04        06
+pca9535       16       yes    00     02     04        06
+pca9539       16       yes    00     02     04        06
+tca9539       16       yes    00     02     04        06
+pca9555       16       yes    00     02     04        06
+max7318       16       yes    00     02     04        06
+tca6424       24       yes    00     04     08        0C
+========== ===== ========= ===== ====== ====== =========
+
+Chips with additional timeout_en register
+-----------------------------------------
+
+These Maxim chips have a bus timeout function which can be enabled in
+the timeout_en register. This is present in only two chips. Defaults to
+timeout disabled.
+
+========== ===== ========= ===== ====== ====== ========= ==========
+compatible lines interrupt input output invert direction timeout_en
+========== ===== ========= ===== ====== ====== ========= ==========
+max7310        8        no    00     01     02        03         04
+max7312       16       yes    00     02     04        06         08
+========== ===== ========= ===== ====== ====== ========= ==========
+
+Chips with additional int_mask register
+---------------------------------------
+
+These chips have an interrupt mask register in addition to the 4 basic
+registers. The interrupt masks default to all interrupts disabled. To
+use interrupts with these chips, the driver has to set the int_mask
+register.
+
+========== ===== ========= ===== ====== ====== ========= ========
+compatible lines interrupt input output invert direction int_mask
+========== ===== ========= ===== ====== ====== ========= ========
+pca9505       40       yes    00     08     10        18       20
+pca9506       40       yes    00     08     10        18       20
+========== ===== ========= ===== ====== ====== ========= ========
+
+Chips with additional int_mask and out_conf registers
+-----------------------------------------------------
+
+This chip has an interrupt mask register, and an output port
+configuration register, which can select between push-pull and
+open-drain modes. Each bit controls two lines. Both of these registers
+are present in PCAL chips as well, albeit the out_conf works
+differently.
+
+========== ===== ========= ===== ====== ====== ========= ======== ========
+compatible lines interrupt input output invert direction int_mask out_conf
+========== ===== ========= ===== ====== ====== ========= ======== ========
+pca9698       40       yes    00     08     10        18       20       28
+========== ===== ========= ===== ====== ====== ========= ======== ========
+
+pca9698 also has a "master output" register for setting all outputs per
+port to the same value simultaneously, and a chip specific mode register
+for various additional chip settings.
+
+========== ============= ====
+compatible master_output mode
+========== ============= ====
+pca9698               29   2A
+========== ============= ====
+
+Chips with LED blink and intensity control
+------------------------------------------
+
+These Maxim chips have no invert register.
+
+They have two sets of output registers (output0 and output1). An internal
+timer alternates the effective output between the values set in these
+registers, if blink mode is enabled in the blink register. The
+master_intensity register and the intensity registers together define
+the PWM intensity value for each pair of outputs.
+
+These chips can be used as simple GPIO expanders if the driver handles the
+input, output0 and direction registers.
+
+========== ===== ========= ===== ======= ========= ======= ================ ===== =========
+compatible lines interrupt input output0 direction output1 master_intensity blink intensity
+========== ===== ========= ===== ======= ========= ======= ================ ===== =========
+max7315        8       yes    00      01        03      09               0E    0F        10
+max7313       16       yes    00      02        06      0A               0E    0F        10
+========== ===== ========= ===== ======= ========= ======= ================ ===== =========
+
+Basic PCAL chips
+----------------
+
+========== ===== ========= ===== ====== ====== =========
+compatible lines interrupt input output invert direction
+========== ===== ========= ===== ====== ====== =========
+pcal6408       8       yes    00     01     02        03
+pcal9554b      8       yes    00     01     02        03
+pcal6416      16       yes    00     02     04        06
+pcal9535      16       yes    00     02     04        06
+pcal9555a     16       yes    00     02     04        06
+========== ===== ========= ===== ====== ====== =========
+
+These chips have several additional features:
+
+    1. output drive strength setting (out_strength)
+    2. input latch (in_latch)
+    3. pull-up/pull-down (pull_in, pull_sel)
+    4. push-pull/open-drain outputs (out_conf)
+    5. interrupt mask and interrupt status (int_mask, int_status)
+
+========== ============ ======== ======= ======== ======== ========== ========
+compatible out_strength in_latch pull_en pull_sel int_mask int_status out_conf
+========== ============ ======== ======= ======== ======== ========== ========
+pcal6408             40       42      43       44       45         46       4F
+pcal9554b            40       42      43       44       45         46       4F
+pcal6416             40       44      46       48       4A         4C       4F
+pcal9535             40       44      46       48       4A         4C       4F
+pcal9555a            40       44      46       48       4A         4C       4F
+========== ============ ======== ======= ======== ======== ========== ========
+
+Currently the driver has support for the input latch, pull-up/pull-down
+and uses int_mask and int_status for interrupts.
+
+PCAL chips with extended interrupt and output configuration functions
+---------------------------------------------------------------------
+
+========== ===== ========= ===== ====== ====== =========
+compatible lines interrupt input output invert direction
+========== ===== ========= ===== ====== ====== =========
+pcal6524      24       yes    00     04     08        0C
+pcal6534      34       yes    00     05     0A        0F
+========== ===== ========= ===== ====== ====== =========
+
+These chips have the full PCAL register set, plus the following functions:
+
+    1. interrupt event selection: level, rising, falling, any edge
+    2. clear interrupt status per line
+    3. read input without clearing interrupt status
+    4. individual output config (push-pull/open-drain) per output line
+    5. debounce inputs
+
+========== ============ ======== ======= ======== ======== ========== ========
+compatible out_strength in_latch pull_en pull_sel int_mask int_status out_conf
+========== ============ ======== ======= ======== ======== ========== ========
+pcal6524             40       48      4C       50       54       58         5C
+pcal6534             30       3A      3F       44       49       4E         53
+========== ============ ======== ======= ======== ======== ========== ========
+
+========== ======== ========= ============ ============== ======== ==============
+compatible int_edge int_clear input_status indiv_out_conf debounce debounce_count
+========== ======== ========= ============ ============== ======== ==============
+pcal6524         60        68           6C             70       74             76
+pcal6534         54        5E           63             68       6D             6F
+========== ======== ========= ============ ============== ======== ==============
+
+As can be seen in the table above, pcal6534 does not follow the usual
+bank spacing rule. Its banks are closely packed instead.
+
+PCA957X chips with a completely different register layout
+---------------------------------------------------------
+
+These chips have the basic 4 registers, but at unusual addresses.
+
+Additionally, they have:
+
+    1. pull-up/pull-down (pull_sel)
+    2. a global pull enable, defaults to disabled (config)
+    3. interrupt mask, interrupt status (int_mask, int_status)
+
+========== ===== ========= ===== ====== ====== ======== ========= ====== ======== ==========
+compatible lines interrupt input invert config pull_sel direction output int_mask int_status
+========== ===== ========= ===== ====== ====== ======== ========= ====== ======== ==========
+pca9574        8       yes    00     01     02       03        04     05       06         07
+pca9575       16       yes    00     02     04       06        08     0A       0C         0E
+========== ===== ========= ===== ====== ====== ======== ========= ====== ======== ==========
+
+Currently the driver supports none of the advanced features.
+
+XRA1202
+-------
+
+Basic 4 registers, plus advanced features:
+
+    1. interrupt mask, defaults to interrupts disabled
+    2. interrupt status
+    3. interrupt event selection, level, rising, falling, any edge
+       (int_mask, rising_mask, falling_mask)
+    4. pull-up (no pull-down)
+    5. tri-state
+    6. debounce
+
+========== ===== ========= ===== ====== ====== ========= =========
+compatible lines interrupt input output invert direction pullup_en
+========== ===== ========= ===== ====== ====== ========= =========
+xra1202        8       yes    00     01     02        03        04
+========== ===== ========= ===== ====== ====== ========= =========
+
+========== ======== ======== ========== =========== ============ ========
+compatible int_mask tristate int_status rising_mask falling_mask debounce
+========== ======== ======== ========== =========== ============ ========
+xra1202          05       06         07          08           09       0A
+========== ======== ======== ========== =========== ============ ========
+
+Overview of functions
+=====================
+
+This section lists chip functions that are supported by the driver
+already, or are at least common in multiple chips.
+
+Input, Output, Invert, Direction
+--------------------------------
+
+The basic 4 GPIO functions are present in all but one chip category, i.e.
+`Chips with LED blink and intensity control`_ are missing the invert
+register.
+
+3 different layouts are used for these registers:
+
+    1. banks 0, 1, 2, 3 with bank offsets of 2^n
+        - all other chips
+
+    2. banks 0, 1, 2, 3 with closely packed banks
+        - pcal6534
+
+    3. banks 0, 5, 1, 4 with bank offsets of 2^n
+        - pca9574
+        - pca9575
+
+Interrupts
+----------
+
+Only an interrupt mask register
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+The same layout is used for all of these:
+
+    1. bank 5 with bank offsets of 2^n
+        - pca9505
+        - pca9506
+        - pca9698
+
+Interrupt mask and interrupt status registers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+These work the same way in all of the chips: mask and status have
+one bit per line, 1 in the mask means interrupt enabled.
+
+Layouts:
+
+    1. base offset 0x40, bank 5 and bank 6, bank offsets of 2^n
+        - pcal6408
+        - pcal6416
+        - pcal9535
+        - pcal9554b
+        - pcal9555a
+        - pcal6524
+
+    2. base offset 0x30, bank 5 and 6, closely packed banks
+        - pcal6534
+
+    3. bank 6 and 7, bank offsets of 2^n
+        - pca9574
+        - pca9575
+
+    4. bank 5 and 7, bank offsets of 2^n
+        - xra1202
+
+Interrupt on specific edges
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+`PCAL chips with extended interrupt and output configuration functions`_
+have an int_edge register. This contains 2 bits per line, one of 4 events
+can be selected for each line:
+
+    0: level, 1: rising edge, 2: falling edge, 3: any edge
+
+Layouts:
+
+    1. base offset 0x40, bank 7, bank offsets of 2^n
+
+        - pcal6524
+
+    2. base offset 0x30, bank 7 + offset 0x01, closely packed banks
+       (out_conf is 1 byte, not (lines/8) bytes, hence the 0x01 offset)
+
+        - pcal6534
+
+`XRA1202`_ chips have a different mechanism for the same thing: they have
+a rising mask and a falling mask, with one bit per line.
+
+Layout:
+
+    1. bank 5, bank offsets of 2^n
+
+Input latch
+-----------
+
+Only `Basic PCAL chips`_ and
+`PCAL chips with extended interrupt and output configuration functions`_
+have this function. When the latch is enabled, the interrupt is not cleared
+until the input port is read. When the latch is disabled, the interrupt
+is cleared even if the input register is not read, if the input pin returns
+to the logic value it had before generating the interrupt. Defaults to latch
+disabled.
+
+Currently the driver enables the latch for each line with interrupt
+enabled.
+
+    1. base offset 0x40, bank 2, bank offsets of 2^n
+        - pcal6408
+        - pcal6416
+        - pcal9535
+        - pcal9554b
+        - pcal9555a
+        - pcal6524
+
+    2. base offset 0x30, bank 2, closely packed banks
+        - pcal6534
+
+Pull-up and pull-down
+---------------------
+
+`Basic PCAL chips`_ and
+`PCAL chips with extended interrupt and output configuration functions`_
+use the same mechanism: their pull_en register enables the pull-up or pull-down
+function, and their pull_sel register chooses the direction. They all use one
+bit per line.
+
+    0: pull-down, 1: pull-up
+
+Layouts:
+
+    1. base offset 0x40, bank 3 (en) and 4 (sel), bank offsets of 2^n
+        - pcal6408
+        - pcal6416
+        - pcal9535
+        - pcal9554b
+        - pcal9555a
+        - pcal6524
+
+    2. base offset 0x30, bank 3 (en) and 4 (sel), closely packed banks
+        - pcal6534
+
+`PCA957X chips with a completely different register layout`_ have a pull_sel
+register with one bit per line, and a global pull_en bit in their config
+register.
+
+Layout:
+
+    1. bank 2 (config), bank 3 (sel), bank offsets of 2^n
+        - pca9574
+        - pca9575
+
+`XRA1202`_ chips can only pull-up. They have a pullup_en register.
+
+Layout:
+
+    1. bank 4, bank offsets of 2^n
+        - xra1202
+
+Push-pull and open-drain
+------------------------
+
+`Chips with additional int_mask and out_conf registers`_ have this function,
+but only for select IO ports. Register has 1 bit per 2 lines. In pca9698,
+only port0 and port1 have this function.
+
+    0: open-drain, 1: push-pull
+
+Layout:
+
+    1. base offset 5*bankoffset
+        - pca9698
+
+`Basic PCAL chips`_ have 1 bit per port in one single out_conf register.
+Only whole ports can be configured.
+
+    0: push-pull, 1: open-drain
+
+Layout:
+
+    1. base offset 0x4F
+        - pcal6408
+        - pcal6416
+        - pcal9535
+        - pcal9554b
+        - pcal9555a
+
+`PCAL chips with extended interrupt and output configuration functions`_
+can set this for each line individually. They have the same per-port out_conf
+register as `Basic PCAL chips`_, but they also have an indiv_out_conf register
+with one bit per line, which inverts the effect of the port-wise setting.
+
+    0: push-pull, 1: open-drain
+
+Layouts:
+
+    1. base offset 0x40 + 7*bankoffset (out_conf),
+       base offset 0x60, bank 4 (indiv_out_conf) with bank offset of 2^n
+
+        - pcal6524
+
+    2. base offset 0x30 + 7*banksize (out_conf),
+       base offset 0x54, bank 4 (indiv_out_conf), closely packed banks
+
+        - pcal6534
+
+This function is currently not supported by the driver.
+
+Output drive strength
+---------------------
+
+Only PCAL chips have this function. 2 bits per line.
+
+==== ==============
+bits drive strength
+==== ==============
+  00          0.25x
+  01          0.50x
+  10          0.75x
+  11          1.00x
+==== ==============
+
+    1. base offset 0x40, bank 0 and 1, bank offsets of 2^n
+        - pcal6408
+        - pcal6416
+        - pcal9535
+        - pcal9554b
+        - pcal9555a
+        - pcal6524
+
+    2. base offset 0x30, bank 0 and 1, closely packed banks
+        - pcal6534
+
+Currently not supported by the driver.
+
+Datasheets
+==========
+
+- MAX7310: https://datasheets.maximintegrated.com/en/ds/MAX7310.pdf
+- MAX7312: https://datasheets.maximintegrated.com/en/ds/MAX7312.pdf
+- MAX7313: https://datasheets.maximintegrated.com/en/ds/MAX7313.pdf
+- MAX7315: https://datasheets.maximintegrated.com/en/ds/MAX7315.pdf
+- MAX7318: https://datasheets.maximintegrated.com/en/ds/MAX7318.pdf
+- PCA6107: https://pdf1.alldatasheet.com/datasheet-pdf/view/161780/TI/PCA6107.html
+- PCA6408A: https://www.nxp.com/docs/en/data-sheet/PCA6408A.pdf
+- PCA6416A: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
+- PCA9505: https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
+- PCA9505: https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
+- PCA9534: https://www.nxp.com/docs/en/data-sheet/PCA9534.pdf
+- PCA9535: https://www.nxp.com/docs/en/data-sheet/PCA9535_PCA9535C.pdf
+- PCA9536: https://www.nxp.com/docs/en/data-sheet/PCA9536.pdf
+- PCA9537: https://www.nxp.com/docs/en/data-sheet/PCA9537.pdf
+- PCA9538: https://www.nxp.com/docs/en/data-sheet/PCA9538.pdf
+- PCA9539: https://www.nxp.com/docs/en/data-sheet/PCA9539_PCA9539R.pdf
+- PCA9554: https://www.nxp.com/docs/en/data-sheet/PCA9554_9554A.pdf
+- PCA9555: https://www.nxp.com/docs/en/data-sheet/PCA9555.pdf
+- PCA9556: https://www.nxp.com/docs/en/data-sheet/PCA9556.pdf
+- PCA9557: https://www.nxp.com/docs/en/data-sheet/PCA9557.pdf
+- PCA9574: https://www.nxp.com/docs/en/data-sheet/PCA9574.pdf
+- PCA9575: https://www.nxp.com/docs/en/data-sheet/PCA9575.pdf
+- PCA9698: https://www.nxp.com/docs/en/data-sheet/PCA9698.pdf
+- PCAL6408A: https://www.nxp.com/docs/en/data-sheet/PCAL6408A.pdf
+- PCAL6416A: https://www.nxp.com/docs/en/data-sheet/PCAL6416A.pdf
+- PCAL6524: https://www.nxp.com/docs/en/data-sheet/PCAL6524.pdf
+- PCAL6534: https://www.nxp.com/docs/en/data-sheet/PCAL6534.pdf
+- PCAL9535A: https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf
+- PCAL9554B: https://www.nxp.com/docs/en/data-sheet/PCAL9554B_PCAL9554C.pdf
+- PCAL9555A: https://www.nxp.com/docs/en/data-sheet/PCAL9555A.pdf
+- TCA6408A: https://www.ti.com/lit/gpn/tca6408a
+- TCA6416: https://www.ti.com/lit/gpn/tca6416
+- TCA6424: https://www.ti.com/lit/gpn/tca6424
+- TCA9539: https://www.ti.com/lit/gpn/tca9539
+- TCA9554: https://www.ti.com/lit/gpn/tca9554
+- XRA1202: https://assets.maxlinear.com/web/documents/xra1202_1202p_101_042213.pdf
-- 
2.50.1


