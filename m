Return-Path: <linux-gpio+bounces-12082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181A9B019C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE29A1F23916
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3CE201114;
	Fri, 25 Oct 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jifi16ij"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC911E1308;
	Fri, 25 Oct 2024 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856970; cv=none; b=Kf/PmnpxPElpaHIe0v0IPkf5xHqYzqvJSq2G0xFJvPodQUa7xFQo2ZGQqiHJTqdB2yfjZV8vM/Syxr5nzFiuYjvA/mJpI52T2DcBlbRfOFBTi7U6ZSpku5yrdX1fEngdFLpOoozTQtjyCpS2KGmNYg7sMxXzFG4s55JZ2gdMwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856970; c=relaxed/simple;
	bh=gAprTFK9+Tmj2YO6m7G+00ZIVA2pIo8sWYL5jWrfpRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYQxvrUj+wPHAiGmTD7nD03jJvxtD4tm6ybQrpJprA/22JiRqAvkHMoAFIQ9zsUWybW1WYbwrM8LuUGD6lwX2OVJqa28nrW9kaXgOvqhoks/V4U71KEuX0ZeaA9V2k9gtzHtrCmQ/b7RosC5uVPeMtAjr0s8VbOrpKAXgB4SLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jifi16ij; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso20159515e9.0;
        Fri, 25 Oct 2024 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856966; x=1730461766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/+0cq1AmfD29vJ6pg6sn+jqBOLIF+yOLxRj2vex8NU=;
        b=Jifi16ijD9bUDrFpNtxu34E0QSpZj3BKXL1m/3DyafYUNIYxGbP4jQ/N2e6BEUoTuM
         FPxxWnnvlIrIx0ZdKAUFeX7nu8vmzwF2l06l83wGB6UsKQpfH4gb6OnqZEmV+GscWsEu
         2LW5kNm/yuDqIkzH/zqzOvYx2BiV6Xag9dApSGm7Un62J2NBvWWz9NdMKwSkk206GsP/
         nmHdAosSQAe86+oJ/knSrarP4AYAYRInRsxs3pUgNJNKzc7JdU5V9hsWIBQzVaWzg4Rt
         nVO3VzD0wE3ZuexoXn0xCZBPIhPYo8vsTzBkVdu5Awoi5+23Cx+t2L2I/S2t96wPEC5D
         6VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856966; x=1730461766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/+0cq1AmfD29vJ6pg6sn+jqBOLIF+yOLxRj2vex8NU=;
        b=OEM6gu6Dcm6cj9USB5V4Nk2WMKE7OUGuBOmkB0vRJJdk+iZ7EMnijNOvmByaS6U+bo
         Mkv1A3lM7LyOTrSvTie7S+lgvfF6B6kmtMWgNW5GHKi/EX8GWO8jrrYa9WJKNdVgN3jx
         oD4MqdRQpwNA4NSkdIQF27GTUAMX0HzSDXTjN7KyI1fqJu98L+psXd4fl7kMCBcyrtby
         ULjOcJ9xDUD8xTwHVBGJKS1vV1GbW42ydCFDcSuKYU0HrnwlaUG5nD+yERwn+dphyYQV
         MXCQ/JLPk9HXnGsaRHSf6Sa0d5Pimih7ne4y+ggey5C8QKt3xI6BWs7qLAdnuilivvgK
         rATQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC27kcr2GA4f+69loRrx1Ak1gKMNmZTnbWzoHVNvHeZWSc2imJZQt4AphMh5EIBRFZoagjOw+YyCCZDQ==@vger.kernel.org, AJvYcCVS6DXLY7AlY5eeMg3X0X5UP0jtF2ptJaZiFzVYiRGBjJQcyKg3XoIx/r3F/zbu3PV69PZ/2QsXKy01TqKa@vger.kernel.org, AJvYcCWV/jPmAM6xOsyZRJ53qmQWvGubaveLR4VLr503no6ycvB+Yf9WgZu5pVqbvONfR/Zfcri05clH7R0p@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgd9Uv9Zu8rvTE6o6Vy9/AIswBBb493v52ihGP7KRXvReTg0H
	WVf7JpH9uSQxnaCiElSSGz3JmS6JzH47el/bqUYJ3yKQNMLS1Fog
X-Google-Smtp-Source: AGHT+IHTqq7YnSl+xRbzFqKq5+7jqo3OlcXKW/J0CunlfduDkl9WcVSM8Ust//QixapZHkQkx4ZkAg==
X-Received: by 2002:a05:600c:1c01:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-4318c715cc0mr46948345e9.21.1729856965704;
        Fri, 25 Oct 2024 04:49:25 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56741fsm45109785e9.22.2024.10.25.04.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:49:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/6] pinctrl: rzg2l: Fix releasing of IRQ and status reported in pinmux-pins
Date: Fri, 25 Oct 2024 12:49:08 +0100
Message-ID: <20241025114914.714597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to fix the reporting of pin status in the
`pinmux-pins` file and properly free up the IRQ line when using a GPIO
pin as an interrupt via the `interrupts`/`interrupts-extended` property.

Testing on SMARC RZ/G2L:
------------------------
	keys {
		compatible = "gpio-keys";

		key-1 {
			interrupt-parent = <&pinctrl>;
			gpios = <&pinctrl RZG2L_GPIO(41, 0) GPIO_ACTIVE_HIGH>;
			linux,code = <KEY_1>;
			label = "USER_SW1";
			wakeup-source;
			debounce-interval = <20>;
		};

		key-3 {
			interrupts-extended = <&pinctrl RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_RISING>;
			linux,code = <KEY_3>;
			label = "USER_SW3";
			wakeup-source;
			debounce-interval = <20>;
		};
	};

Before this patch series, the pin status was incorrectly reported in the
`pinmux-pins` file, and the IRQ was not released. As seen below, `P43_1` is
reported as `UNCLAIMED`, and after unloading the `gpio_keys` module, the
IRQ is not released, unlike `P41_0`, which was used via the `gpios` property.
---------------------------------------------------------------------------------
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 78:          1          0 11030000.pinctrl  17 Edge      1-003d
 91:          0          0 11030000.pinctrl 345 Edge      USER_SW3
 92:          0          0 11030000.pinctrl 328 Edge      USER_SW1
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 41_0
 gpio-840 (P41_0               |USER_SW1            ) in  lo IRQ
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 43_1
 gpio-857 (P43_1               |interrupt           ) in  lo IRQ
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep 43_1
pin 345 (P43_1): UNCLAIMED
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep 41_0
pin 328 (P41_0): GPIO 11030000.pinctrl:840
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/91
/sys/kernel/debug/irq/irqs/91
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/92
/sys/kernel/debug/irq/irqs/92
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# lsmod
Module                  Size  Used by
gpio_keys              20480  0
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# modprobe -r gpio_keys
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 78:          1          0 11030000.pinctrl  17 Edge      1-003d
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 41_0
 gpio-840 (P41_0               )
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 43_1
 gpio-857 (P43_1               )
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep 41_0
pin 328 (P41_0): UNCLAIMED
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep 43_1
pin 345 (P43_1): UNCLAIMED
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/91
/sys/kernel/debug/irq/irqs/91
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/92
ls: /sys/kernel/debug/irq/irqs/92: No such file or directory
root@smarc-rzg2l:~#
root@smarc-rzg2l:~#


After applying this patch series, the pin status is correctly reported in
the `pinmux-pins` file, and the IRQ is properly released. As shown below,
the status for pin `P43_1` is now reported correctly, and the IRQ is now
released, unlike in the previous logs above.
---------------------------------------------------------------------------
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 78:          1          0 11030000.pinctrl  17 Edge      1-003d
 91:          0          0 11030000.pinctrl 345 Edge      USER_SW3
 92:          0          0 11030000.pinctrl 328 Edge      USER_SW1
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 41_0
 gpio-840 (P41_0               |USER_SW1            ) in  lo IRQ
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep 43_1
 gpio-857 (P43_1               |interrupt           ) in  lo IRQ
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P43_1
pin 345 (P43_1): GPIO 11030000.pinctrl:857
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P41_0
pin 328 (P41_0): GPIO 11030000.pinctrl:840
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/91
/sys/kernel/debug/irq/irqs/91
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/92
/sys/kernel/debug/irq/irqs/92
root@smarc-rzg2l:~# lsmod
Module                  Size  Used by
gpio_keys              20480  0
root@smarc-rzg2l:~# modprobe -r gpio_keys
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 78:          1          0 11030000.pinctrl  17 Edge      1-003d
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep P43_1
 gpio-857 (P43_1               )
root@smarc-rzg2l:~# cat /sys/kernel/debug/gpio | grep P41_0
 gpio-840 (P41_0               )
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P43_1
pin 345 (P43_1): UNCLAIMED
root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-pins | grep P41_0
pin 328 (P41_0): UNCLAIMED
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/91
ls: /sys/kernel/debug/irq/irqs/91: No such file or directory
root@smarc-rzg2l:~# ls /sys/kernel/debug/irq/irqs/92
ls: /sys/kernel/debug/irq/irqs/92: No such file or directory
root@smarc-rzg2l:~#

Note:
- On RZ/G3S SMARC, prior to this patch series, we hogged the GPIO pins as
  inputs before using them as GPIO interrupts via the
  `interrupts`/`interrupts-extended` property. These patches do not break
  older DTBs, i.e., functionality remains the same. However, after
  unloading the `gpio_keys` module, the `pinmux-pins` file in sysfs
  reports the pin as UNCLAIMED.

v1->v2
- Fixed build warning
- Collected RB tag from Linus fr patch 5/6
- Dropped patch 2/7 from v1 series

v1: https://lore.kernel.org/all/20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: rzg3s-smarc: Drop hogging of GPIO pins
  pinctrl: renesas: rzg2l: Release all the virq's in free callback
  pinctrl: renesas: rzg2l: Reorder function call in rzg2l_gpio_free()
  pinctrl: renesas: rzg2l: Drop calling rzg2l_gpio_request()
  pinctrl: pinmux: Introduce API to check if a pin is requested
  pinctrl: renesas: pinctrl-rzg2l: Override
    irq_request/release_resources

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  21 ----
 drivers/pinctrl/pinmux.c                      |  14 +++
 drivers/pinctrl/pinmux.h                      |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 111 ++++++++++--------
 5 files changed, 79 insertions(+), 91 deletions(-)

-- 
2.43.0


