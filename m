Return-Path: <linux-gpio+bounces-24466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65EB29374
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 16:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288D52A2649
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 14:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C0D29E103;
	Sun, 17 Aug 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlQ65HXr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793A17A30F;
	Sun, 17 Aug 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755441030; cv=none; b=gz/4CLu7HcUVLB8X0lMiffaHQF2GKLccn6tw2Q8RHzV17NxlXvedlU6UAk/GC5HgXR+yDSn/lU2pfWzOJej51SihFEIsylxW6IUUcS58oEbuenqiUMybr6jhLn1W5+HfmCP855+kKplV/0Xzad2HpwN2u/r8pQKI/CoxUOlkhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755441030; c=relaxed/simple;
	bh=yyL+H0dsloXKazlsaVm9/CD3K1VYBupg7Oo7jh9Jkz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rcv8rf8kSMJE/7qxYJZ6zCB4cd2eTfTHQI4jL/eOshSYqB/gB40ha1AxSkL0P2WG3/qCYuxQMRbMsiGu5wpywzr/leNsWY2iLs9/Ga/IlioO06NT4TvDnHIV2OFHxp011Cjx4mrDv/rKhMRilmspGKXnAzxJJn+iBMfEYL8Xa/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlQ65HXr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so14524065e9.2;
        Sun, 17 Aug 2025 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755441027; x=1756045827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWZAyJ0poja9NuGESj2BVQie59PBMjBq9MMyHHpd5cg=;
        b=DlQ65HXr4dMW0L4M0CJA6Vir55TeskF51kMVmYfW+9+bdBF4DLy2fvS6sQoM+jU9Eh
         oESZZfVV/X1TI/BPZwQnladsYU58FWwK0kZPqWUwglqSzJBX1ZRAzCiPrVkFmzvrar4k
         sQtbvB2rcsryYyPTbQ3fXjPTEb7FwI29f/4e+1SaRcAkkSV/4ngMx0uM7DM/ZrXjD4yf
         udZwG7/lAdFEtlyUUHE36Po73pDfvvI+177xpMY2++d/XunwfuZ1e1jmvRsWdcf8y3/c
         2womgRttkPNbsDsZXNEu9TB78IdPCODaB02onssXzVZmiZxeZGvEUdMGPmf6Qm063u1h
         qfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755441027; x=1756045827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWZAyJ0poja9NuGESj2BVQie59PBMjBq9MMyHHpd5cg=;
        b=N4k/7h0JvqHBX/ZVneY8RKGxd4oiE1NivpQEmR0qRva/yaN82RNcIm+ngUbB+E0Bdi
         YPRqeLF/PtvpfSVw3QF2E5rtL9aLYPNa8MvPwqZkxUXRLMCwRTOtNYhyg64mWXdyUT8m
         FU9xnoqm2zgotZQhe/sCfDJSLOXTxodd+ZPNUfA61CQnoX3lbNGJYelypB59HOryTrlZ
         YOi5veY0uz3T3TAYhRZY46ALN6wu+5p03tH/V+ypjZvteH0C4t5n25EA+AUtOWvf9B1m
         kdtqNXznzNG6hLrlWTs29bU0y4pOFVELYH++xyVdd/tMLiP5MZnxxi5hPPbN6F5rUaR5
         niDA==
X-Forwarded-Encrypted: i=1; AJvYcCUMtDaoR3vLY8NjYHZTTBeAj0OMhV5gCuV6QnQqiO2RucZ7kaYQxHFT+nbmjK3d7X4fHhAn92ab9BZK@vger.kernel.org, AJvYcCW/hw3Qkkma0GdxH7RWWXKiQ5yJG65fkCm5gQ0J4Wv/e0StY+VaWCVU6H2FWW3lmyP1sYER+i09bV9y3L7RLAYnuJU=@vger.kernel.org, AJvYcCXlIproCeOUi8EqxujsGvPgIUGT4TmGQWDOtuEJisWYN4fYCYy5Gs6GErMMarpTmG1T21TtT+ir6FHZy0jW@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuxKPhwEsw0bwt+OTtPhpAKxXW2xn3R6+T4Cpbc/rQrO2MntV
	BQZpD4mil5KtG84aiuX6rP+hnuedvdQdtI9WoABHMgD5DSZHWDocNZwf
X-Gm-Gg: ASbGnctUlphSZRRf/rI+rX2NUOyrvlGbS068O0ZpslLHO+yaBYKb47C0XqKBv2Bb7ME
	dDscv6cknRAEfYUr2oHy+JWQKzPQ+wT1F6gVSVnKJEAQ36JK5+hYhatblF/ZFJBfuXzqnJq5EVU
	gN9C1NWSiYmK2D+T1fI7lfHwjb6SWzUPuyUi+jDr/4p73FQHi34P8iQb/+Zz1QiiTQYmWYM727r
	vxcJAB3zkgvvNJWMQ9pmw8ePU3Tsjcgp84TV+sab69HxpxroETVxWuqqKBfKFO7R149IGR67cvr
	0UYS+Rjn4Fus6IBh27nKQmwVhCcr4Sc5B2Egx/7+ttRtHzgWWZcPp0zksIXMjg/GEC6EutNXf3W
	BpycAeg9VkWl0LNqx2Zzv78hEIuPNDLiwReXVQZcUj8olJcyVh2ZE3g+WPu3SnHMXXCADXQaeVA
	==
X-Google-Smtp-Source: AGHT+IEqvwzuCOtPLfr9txiXXR3uHX74MKd3lv1nqPy5iqhko0tUuyafF6VNtZuysYeBJOlFtd+wbw==
X-Received: by 2002:a05:600c:154d:b0:458:b7d1:99f9 with SMTP id 5b1f17b1804b1-45a217fd4e8mr70777275e9.11.1755441026392;
        Sun, 17 Aug 2025 07:30:26 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cfed5sm129938485e9.7.2025.08.17.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:30:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] RZ/G2L pinctrl improvements
Date: Sun, 17 Aug 2025 15:30:18 +0100
Message-ID: <20250817143024.165471-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The write to PFC_OEN register is controlled by the write protect register
(PWPR). Currently we are setting OEN register in resume() without enabling
the write access in PWPR leading to incorrect operation.

Also drop unnecessary configuration of the pin function if the pin's
configuration values are same as reset values.

v1->v2:
 * Updated cover letter description.
 * Updated commit description for patch#1 and #2.
 * Updated commit header for patch#2.
 * Added check in rzg2l_pinctrl_set_pfc_mode() to avoid unnecessary
   configuration
 * Updated rzg2l_pinctrl_pm_setup_pfc() to make changes minimal.

Logs:
root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
127:          0          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~# [   68.710624] PM: suspend entry (deep)
[   68.714523] Filesystems sync: 0.000 seconds
[   68.720402] Freezing user space processes
[   68.726527] Freezing user space processes completed (elapsed 0.001 seconds)
[   68.733563] OOM killer disabled.
[   68.736839] Freezing remaining freezable tasks
[   68.742749] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   68.750233] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   68.800343] renesas-gbeth 15c30000.ethernet end0: Link is Down
[   68.812953] Disabling non-boot CPUs ...
[   68.817380] psci: CPU3 killed (polled 0 ms)
[   68.823030] psci: CPU2 killed (polled 4 ms)
[   68.829144] psci: CPU1 killed (polled 0 ms)
[   68.833581] Enabling non-boot CPUs ...
[   68.833789] Detected VIPT I-cache on CPU1
[   68.833836] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[   68.833875] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   68.834651] CPU1 is up
[   68.834748] Detected VIPT I-cache on CPU2
[   68.834770] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[   68.834790] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   68.835438] CPU2 is up
[   68.835533] Detected VIPT I-cache on CPU3
[   68.835555] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[   68.835576] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   68.836210] CPU3 is up
[   68.862815] dwmac4: Master AXI performs fixed burst length
[   68.863715] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[   68.863736] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[   68.867251] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[   68.882826] dwmac4: Master AXI performs fixed burst length
[   68.883716] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[   68.883731] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[   68.887264] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[   69.083883] OOM killer enabled.
[   69.087021] Restarting tasks: Starting
[   69.091764] Restarting tasks: Done
[   69.095229] random: crng reseeded on system resumption
[   69.100457] PM: suspend exit
[   71.436765] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
[   72.868712] Process accounting resumed

root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
127:          1          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~#

Biju Das (2):
  pinctrl: renesas: rzg2l: Fix OEN resume
  pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 32 ++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.43.0


