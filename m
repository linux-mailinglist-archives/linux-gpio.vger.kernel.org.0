Return-Path: <linux-gpio+bounces-11522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 620379A2122
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E481C1F27504
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE1A1DCB30;
	Thu, 17 Oct 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VS46pTYG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE5134A8;
	Thu, 17 Oct 2024 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165197; cv=none; b=TkPAtDT/qg5NzbyiGVsi8aHbxXKngZxTGkdZPcs29A5/oyoyJ25bOTNNBR1YdNuKRWTWEXWL1NOBbTdFW9S0gp58qYgJ1M+TGEWRn8lSDDhpXR32TFVvSszZukNA1FRqVyzzM6p3NneDtJ8qgLNifnRMKwJ/yZghpS1fAmUnFg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165197; c=relaxed/simple;
	bh=NgrUbuGxMUCQir3ypvqbxCVL5KW37UAxHm4s6P+OZHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNnkYBxboNRM+kFH5kl7EP8z89YUpytmPj5QaWUOXPk0VL75LJnTor7igm2U/zBfJsSgrRBoo9o1PTSJ/3SFV9N1X8BwwPv+k1boCLfkKAmo5d+2d9Ej2MoGQQ7DgpZL0wGONPGJpFiiybnYmmNJb36BNr/+o5cdKBtok3hLqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VS46pTYG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314a26002bso9559475e9.0;
        Thu, 17 Oct 2024 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165189; x=1729769989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhaVYKe/YjE6u9/kJDjwWebSV+WLMRSaluRLFAKTDlU=;
        b=VS46pTYGmJqpYbYI/SV4mjCheqI+BTbb7rdOKLvrpl9bx5LJyIzOZItvgoaeJHSWvX
         ZQzh7CHLEumKgTpVBuSTX8D6pVKgX/oL7bqMdV9kyqC8rJ7WsYFh9GH9AGemWwEI3umc
         emnKXR2eha1+Rw+bnyulelXUw8hwpoYOzf96KTwX+fxCizo8kqrs4fIKSYWNxFJY/Vsr
         KB3LGrkz+J+GdItNHsC2TpammSZHvQtb940zL4SI6CQQ0GOmQWhS+1FJTZxSeES3zlue
         Byf+750JalUJCEVAlQkAmy02YU9tslUJb1NsS4wJuz6D0ycMWMQXbf346S+NvILBf07l
         V0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165189; x=1729769989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhaVYKe/YjE6u9/kJDjwWebSV+WLMRSaluRLFAKTDlU=;
        b=j+SG0FoPCmexm1+PkDGxH9oQ1T9JEDrf31ARHONMyL3LXGU6z0tT8k4PeZR74mi/fl
         NtXGW7isbhHXGB/H5vjeMGByV9vgCIC2Q9Gw1NNERYTn18zlkXqmgd+wfeVe49hzb9br
         jzzlTnNohVj4RaaNcZbT6ADuYmE2ji2xLDK4cLD72Sqa7CGyDbl1kd5C5cylw1BbsuQD
         ZKuMJ4CgDG8OFRihRMbvbCYi6VO3KVa3uqfUu+o6MFXZBIY4bFzJYqbOdP2fUG+6EKIl
         WKF73XfB0DV5E6/62KLjHxyy5BCEaKH6WeNiam5oLHzS9gWGWNMbaQQIrgobLL7yCyJy
         SDOw==
X-Forwarded-Encrypted: i=1; AJvYcCVzjal3StMe4jejHN05rbjhwMhsMZIHPl0vmGKuTQxuKMZUH8WZIvsNH17gEwXFcf221qN8/FKevH3w@vger.kernel.org, AJvYcCWdpj2X48syz8fOxVn++8TEz9ITHmStISFaVD1fwtkp5oMG92ECYJOM0bSXUPTverEH38Sk5MeezBAN7s1CSBHdS/w=@vger.kernel.org, AJvYcCXoNwoo2JfJStDUtSknqfyP8NXc/iTX5/BFIr3fIIHuLIXaXotFRurKXJmxCrtGguRDiQn08D8XHJcKMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUbpVzIoIcgH1ruXK4b+ur9nYW9G4+Z88g7MwWYHUN2iuhe+p
	KAdrk0X/0NeDDwZ78gNNPZZgCT2nJvpS8vicGonjrbicsi/7QxCO
X-Google-Smtp-Source: AGHT+IGjlIibyUxtpKKRZkDs2CB7GWOgJwjXj8pKiw5qMu28wFHdwEhJfBKt0YuF9YM5InLOfwyuIw==
X-Received: by 2002:a05:600c:3ba4:b0:42e:93af:61c5 with SMTP id 5b1f17b1804b1-4314a2f2543mr59548025e9.14.1729165188978;
        Thu, 17 Oct 2024 04:39:48 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/7] pinctrl: rzg2l: Fix releasing of IRQ and status reported in pinmux-pins
Date: Thu, 17 Oct 2024 12:39:35 +0100
Message-ID: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
reported as `UNCLAIMED`, and after unloading the `gpio_keys` module, the IRQ
is not released, unlike `P41_0`, which was used via the `gpios` property.
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
  
Cheers,
Prabhakar

Lad Prabhakar (7):
  arm64: dts: renesas: rzg3s-smarc: Drop hogging of GPIO pins
  pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell
    helper
  pinctrl: renesas: rzg2l: Release all the virq's in free callback
  pinctrl: renesas: rzg2l: Reorder function call in rzg2l_gpio_free()
  pinctrl: renesas: rzg2l: Drop calling rzg2l_gpio_request()
  pinctrl: pinmux: Introduce API to check if a pin is requested
  pinctrl: renesas: pinctrl-rzg2l: Override
    irq_request/release_resources

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  21 ---
 drivers/pinctrl/pinmux.c                      |  14 ++
 drivers/pinctrl/pinmux.h                      |   5 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 128 ++++++++----------
 5 files changed, 79 insertions(+), 107 deletions(-)

-- 
2.43.0


