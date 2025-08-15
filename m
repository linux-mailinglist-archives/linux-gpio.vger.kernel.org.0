Return-Path: <linux-gpio+bounces-24437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197EB28262
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 16:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA935E53DA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 14:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A69283695;
	Fri, 15 Aug 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byPPES1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27F2264AA;
	Fri, 15 Aug 2025 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269275; cv=none; b=A7YcMY1mZBtVquZeKHmYj5AhNFOTQrD/9DykTHerrYwpEz4rSCH+JPMsXrQ2x/80YHDbr7/Iwg/tFrhfu4Kh/+IEHHCP46S5c6V1U7n20oXJlKX9ji60eI3X8sHE6HsQn3U7dPjChJsLzDs/gVEF8+4dRd7ugnIMTXmnlcyQhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269275; c=relaxed/simple;
	bh=AZ9XEafPLDiedO+Dvx8dRa/6SA5wWq6AiEq/bCNCg5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcQpv13hNVb8UrlG/ShI8wLmCIyNUJk5QX8Xptzn/iNrm5oypNzDIAN2+zV6tL/8oH1+z+K10IY2vUIfxcPEUQJmCLQO5nKYSvZ/jcG+duZjzh5JD6VzOn5ByAU9RZmoyuznGzwxjpBiBnpxmnHLsUOhvOccmAvgnrdjrSR9f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byPPES1U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so8828335e9.0;
        Fri, 15 Aug 2025 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755269271; x=1755874071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcDCIEnfFESSkYdRV2Z3z2fXfhMyaNpAlNNZ8v/jx9A=;
        b=byPPES1Uhoz5r36F4vwswM8ZJ46JI3UM4rFwb27vhOyDZzpPSoKF4+kvLLoqQaETal
         uPXYlcAF2DUywIcd5oYdw7qRop3nxnh7UfxX0BsZV4djvOArE/x12fjH4hIhRyYFWVgp
         4OkBxJ98heSBtxQP5+8cdKEYBs0jc+RCOw78Pw4RryUBE9aILxBCP3Gn02S85wYD/c1j
         oCQmXEEgjJLsYL/ALWzPwMENXuApyXwSL8gXAbyiu8PckfCLYBXsBpGHbz3hkTsRT7qg
         JP1GHt4e8dnW+Eghy8Wd1+zmkErjazjtMv0WWcXaOWyHaUyWmzdCdjxuzQFF8El4ueEQ
         hw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755269271; x=1755874071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcDCIEnfFESSkYdRV2Z3z2fXfhMyaNpAlNNZ8v/jx9A=;
        b=oTA7rz+IxETprsH7b2S1zqIduPXMSK0413bi8gN14+x03vnsn38JUxMTYMXgRNT55l
         pHdNYkGsDs2QJHBerHA+JBQX1lfpyHtLGepGw8P4GnuJ4oHgest3oJZV3ynvOYFoUFdj
         Fr3u7jb3uBeMUiNKyoV+lZftSMnJQ2kOdKl9tIAa9sYnFNtdMo3esvqj0mpkpvfFS9Y2
         9zEmauE8084QHMkRd9BxRRwDmwlZoqfmh5+66A1EvJl5cDK7hOC5hxufqqBi3obVuqtt
         kE2m2CLB28a3kO3LqpAC/TjXYy5qdmzm5L303eiyBeWEtmrSAo9pPkPu2Z7Zy0wyatj8
         9WAw==
X-Forwarded-Encrypted: i=1; AJvYcCUb34CCtAJ4/a2z/wEJFI6P5xIBM8VVOfI2IOZ2dxSP2jINNfnx3QhcxP2blgg57yy3vAXYOYOsNnGB@vger.kernel.org, AJvYcCVA9J7Cl69ern8L0w6k6VHXh4fybQLO2T5aFJL7QW70nBqgfFilHvmhGG2HJPrM/xducHp+4ceyHmCe14w/@vger.kernel.org, AJvYcCWy1/SEvNrB/ordP1MiWiKHOLyVvaRC+IOreKpSRoYrCkIXwy7yI2bRRvAjkFFJP5n34TpvjgWJ1jCRKJDWvmN0Qas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNqhmI3HyVKg7vXwaSvpF+KZGeK4ap/fI/I+SlcfTjmQbYjdA
	Wh3KVhXgovtCkNSPS8tv4O9bEKbnWGNEw97ZcQP1VtkrFyNjJx5N26sD5AUPSHIl
X-Gm-Gg: ASbGncsoFGcEoWJjUnqWXyIOJUW4YF4ObqWqK1DPKnTCPQ3+wuf3hC0wLxxvL3RRSkY
	SJajCJ2N62rVGPFK8LeRsNovJorCVJqYtyPkG2Z9RsCPjK00oxsmHC4OSDxLeQLPktD4JcngGd5
	e2EGM/Sz/azVQhS1tUMvHtct8zgeRV4ulVn6oV+hxMQCOkby8ndK9sHorOj0rv+eC9OQ7ydo4nY
	cWgcOAecBDTK/CcWs2G4MFzcYQMXUUYImEIlT6/0jicNaQROwUZMpxXObpU0OAygeVQEDjBrHui
	7tjYpB31Z04gYYKupffqBefkk2B7VrU4Fs/NMYipPU/ZlDzU11xlRz7N0X3i/K2+eCIGMzAl+NZ
	JlKfmayZShodi/9SAWQsD+JI2wNT0fUT0lS/Cjq83XkIwioKsd0msEs8uXyT+zY9JqY7SYwa3ZQ
	==
X-Google-Smtp-Source: AGHT+IHVAecPzWjOypy2BlI6xI0agsl8rGBJLaWb51RtQf4qazCUwAexT9foeLeJX79s+OAlVsBsIA==
X-Received: by 2002:a05:600c:4710:b0:458:bb0e:4181 with SMTP id 5b1f17b1804b1-45a217f5054mr25842225e9.10.1755269270956;
        Fri, 15 Aug 2025 07:47:50 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6c324fsm59523755e9.1.2025.08.15.07.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:47:50 -0700 (PDT)
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
Subject: [PATCH 0/2] RZ/G2L pinctrl improvements
Date: Fri, 15 Aug 2025 15:47:43 +0100
Message-ID: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
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

Also don't reconfigure the pin if the pin's configuration values are same
as reset values during resume() to avoid spurious IRQ.

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
  pinctrl: renesas: rzg2l: Don't reconfigure the pin if it is same as
    reset values

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 +++++++++++++++++--------
 1 file changed, 31 insertions(+), 13 deletions(-)

-- 
2.43.0


