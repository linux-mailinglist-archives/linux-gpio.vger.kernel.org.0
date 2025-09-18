Return-Path: <linux-gpio+bounces-26346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86184B866D9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 20:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524AB189C69F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4782D248C;
	Thu, 18 Sep 2025 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQMvyfT+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935F29A9CD
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758220532; cv=none; b=ggTGWfqUHQ/u6bd7tK0VQy/mHg31HsBFOjFU5/RVMIyIYTrYhA2WsBKUM1RoyU6VPsaLqFskHhNjqI/kdi69nSZEvE2v6zY+2YwASwzFcI1QxzwtolQ6F/SM4ob9Wk6j/5flpxpYNdP2e2PL9Nc+7CIQMcHJQD+2jjOHusio1cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758220532; c=relaxed/simple;
	bh=7JWrZqhhxtwxsKzUS484cYA9BE4S3MG4+Hm4TzvixgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIkp4nBKWjIGRidFBABpf5sn9eqWR24HogLUOmSNhO1Ykym0/rPTloHR6jKhJTDhMxSwBKDUCz6bFSw+i6FQbOUrCri16lIi/VAr4Qvpzlk2+Fa4oBuR9fl//b8uz4d5d4EYV2lT2cLRr0bK4OF1aoAwnLSw9wDkIklZ5sHK1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQMvyfT+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07883a5feeso244489966b.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758220529; x=1758825329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DF8mdGy7rQ30a9eWz48AP7z4kPvyfSZCRABtJwRlC0=;
        b=MQMvyfT+31xh4GtjqMt6G0oQ4ieG03Yk0cpxXjIjDvGJMKGZMBbbLVPxdW7CSIqHSa
         Ti/I3Wo9KvSoXCQLxKvYr2HsKFdd4tyCFAJ56N6p6FTYjqOwyCV5FF6Ofpf2jhdXHCbS
         gXWSghAewwgM6v34qLIRwCycGspdyrDlXWEONuSiiIVCLnRa+h+160ZXSh43cgJggUXy
         1YwaOS5d9nf43A0e3gvjp6VXkoIkIZ5klNja3Hos/Kq+CROhxiiQezRidbE/M907dT3L
         qCMlwl1nAoNJ4W/cQiJswbsT7VW6wPOffpwxFh4HVZfxjt30QjHSErSrVxufrsoK/d+1
         v55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220529; x=1758825329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DF8mdGy7rQ30a9eWz48AP7z4kPvyfSZCRABtJwRlC0=;
        b=WarSBvH+pUW708KhtwyASXy/faW0EdlvYEA/pxE9hhzStZ3qcKjZn+4rpd7nNCEfKv
         culh0shr9yr3LoZkUXIZV6wMXD0QONFondspXaO3sOZvOXWQfGRdmqCZx60+xoZJ6WKI
         S/C1qk+0NDxckdAk4yMZKDLbO9kcDM8Bzfe3O1tRJ53IzTvGg555f/H+B3FBSmI89lIZ
         z5qsdZYX6PoXC7m+6VbMUdXCxj2pmmp2tUq2WNoxKItJwKtYReWvOxZQnTHTUVtumUUM
         qvtgXX/9yHqL/718aRZMf1+X7r3dpZenQ5DJ7F3C5IGwqmeI1sfBNagP5X+yy/rhkB80
         Hgbg==
X-Forwarded-Encrypted: i=1; AJvYcCWytdukMeTIVJQKq9Pplt3sgdSR0UglqbOBUKrqIxL6NGoxeD02/tZf0sQvQXA4uz6qUrMY+Y3D1ffd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyg9DyC7Jt5gWMfuuPUYApk3kxA3X+RpSYm26qj7jalyI2OdFL
	HfCRTtTKi+SRxyUfPBoqViNxTJbchh68z0ymWCLJLGB3xAUsU20Q1hCx
X-Gm-Gg: ASbGnctHhlvRA/S8U8n1UzPw3ThhBq8ugWbUlo8xBvgJL7WxNJVrzQsvTDcCcdYR6v/
	WtKdR29N4sygT4rhNnsraLKrEiW949C80FL7OsBNrbz1qThABYUYSoPvP9uxQBoOehj5U3c89Pw
	S86dCCtwkKxcYxGR3UgQ4I3MGFRfpm1355aPh1Oelm+JX46H2oGAsAmKeq725Qe6MkVWRX9PcFe
	oqTIFvDr0uRHhqueZHb1F5v9kwB2Zxu8iVSm31d9fpK4lA/ZgehdsiPJEW+NoByI2XDQdoge1l5
	bIxECPETSXmT6xSVLGbhircKk7SEP3+kaQO1MoLeDxcD8iVl1/8bPeweQgA18dpt+O/SHYl3tVM
	0h0gfBfUeGeNSjFVokCdJ8JL8atxFbAxQZCNnKtk=
X-Google-Smtp-Source: AGHT+IG+2F9Tdqn75yCUehgh0hWjS/B3B6NaTXRMxweuRMKUwCI/DRvlIaiDT/f+5WUUCMePXP8wBQ==
X-Received: by 2002:a17:907:728f:b0:b04:9468:4a21 with SMTP id a640c23a62f3a-b24ee6ef486mr25159666b.14.1758220528565;
        Thu, 18 Sep 2025 11:35:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fcfe88d97sm245887466b.58.2025.09.18.11.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:35:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	safinaskar@zohomail.com,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Thu, 18 Sep 2025 21:33:36 +0300
Message-ID: <20250918183336.5633-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
References: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko:
> In other words we need to enable debug of the pin control subsystem and see
> what it will print in dmesg.

You mean I should enable CONFIG_DEBUG_PINCTRL? Okay, I did this.

So, today I tested everything on fresh kernel, 6.17.0-rc6, without any
patches.

My config is: https://zerobin.net/?ebecc538f6caa22b#88c2k08G8+cZoMjgU9N/WYy28qQjyBW+/H78ygujZxY=
It was generated from Debian config using localmodconfig.
I added few tweaks, in particular I enabled CONFIG_DEBUG_PINCTRL.

# cat /proc/cmdline 
BOOT_IMAGE=/@rootfs/boot/vmlinuz-6.17.0-rc6 root=UUID=015793d4-ad51-4da7-844b-fcc3bcb13a0b ro rootflags=subvol=@rootfs log_buf_len=4M ignore_loglevel

I run this script:
https://zerobin.net/?327f3aa3ef7ce845#Ycu017J9YbRga8uGaCKRzsH7J/lB8D4RudpwTll5lbo=

This script runs "rtcwake -s 6 -m mem" multiple times. Sometimes my laptop wakes on timer (because of rtcwake),
and sometimes it wakes up too early on its own (and this is a bug).

My script did suspend 7 times:

# dmesg | grep s2idle
[  117.934504] PM: suspend entry (s2idle)
[  127.141741] PM: suspend entry (s2idle)
[  131.299554] PM: suspend entry (s2idle)
[  140.034802] PM: suspend entry (s2idle)
[  144.592260] PM: suspend entry (s2idle)
[  154.038621] PM: suspend entry (s2idle)
[  163.034299] PM: suspend entry (s2idle)

Out of them my laptop woke up on timer 4 times and on its own (i. e. due to bug) 3 times:

# dmesg | grep 'woke up'
[  126.087936] will-wake: attempt 0: woke up in time
[  130.248820] will-wake: attempt 1: woke up early
[  138.988770] will-wake: attempt 2: woke up in time
[  143.545973] will-wake: attempt 3: woke up early
[  152.993654] will-wake: attempt 4: woke up in time
[  161.988956] will-wake: attempt 5: woke up in time
[  166.329080] will-wake: attempt 6: woke up early

Here is full output of "dmesg --level=debug+":
https://zerobin.net/?f704a2d56603f4ec#SRrzc2mt2FNNqcltx/ULmtLZRdRH9frdgoODU03AXwE=

/proc/interrupts:
https://zerobin.net/?b7ba5047ca84ab29#TjMUjkAdhpIuKbnvPpuYyNWa/ilA/ciGKwwSbx6KRFc=

# head -n 1000 /sys/class/dmi/id/*
==> /sys/class/dmi/id/bios_date <==
07/15/2025

==> /sys/class/dmi/id/bios_release <==
1.23

==> /sys/class/dmi/id/bios_vendor <==
Dell Inc.

==> /sys/class/dmi/id/bios_version <==
1.23.6

==> /sys/class/dmi/id/board_asset_tag <==


==> /sys/class/dmi/id/board_name <==
0C6JVW

==> /sys/class/dmi/id/board_serial <==
/JNLHW44/VNCMV0046P029A/

==> /sys/class/dmi/id/board_vendor <==
Dell Inc.

==> /sys/class/dmi/id/board_version <==
A00

==> /sys/class/dmi/id/chassis_asset_tag <==


==> /sys/class/dmi/id/chassis_serial <==
JNLHW44

==> /sys/class/dmi/id/chassis_type <==
10

==> /sys/class/dmi/id/chassis_vendor <==
Dell Inc.

==> /sys/class/dmi/id/chassis_version <==


==> /sys/class/dmi/id/ec_firmware_release <==
1.18

==> /sys/class/dmi/id/modalias <==
dmi:bvnDellInc.:bvr1.23.6:bd07/15/2025:br1.23:efr1.18:svnDellInc.:pnPrecision7780:pvr:rvnDellInc.:rn0C6JVW:rvrA00:cvnDellInc.:ct10:cvr:sku0C42:

==> /sys/class/dmi/id/power <==
head: error reading '/sys/class/dmi/id/power': Is a directory

==> /sys/class/dmi/id/product_family <==
Precision

==> /sys/class/dmi/id/product_name <==
Precision 7780

==> /sys/class/dmi/id/product_serial <==
JNLHW44

==> /sys/class/dmi/id/product_sku <==
0C42

==> /sys/class/dmi/id/product_uuid <==
4c4c4544-004e-4c10-8048-cac04f573434

==> /sys/class/dmi/id/product_version <==


==> /sys/class/dmi/id/subsystem <==
head: error reading '/sys/class/dmi/id/subsystem': Is a directory

==> /sys/class/dmi/id/sys_vendor <==
Dell Inc.

==> /sys/class/dmi/id/uevent <==
MODALIAS=dmi:bvnDellInc.:bvr1.23.6:bd07/15/2025:br1.23:efr1.18:svnDellInc.:pnPrecision7780:pvr:rvnDellInc.:rn0C6JVW:rvrA00:cvnDellInc.:ct10:cvr:sku0C42:


Output of dmidecode:
https://zerobin.net/?e7783ba3bd93c895#EAVgKSZQrn0aGC6t9a/RKeZpp1/9TAYlDhHMh2lcpfQ=

-- 
Askar Safin

