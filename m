Return-Path: <linux-gpio+bounces-34669-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK+7Ln9g0WktIQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34669-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:03:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA439C2A3
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F5313011780
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C736F340A6F;
	Sat,  4 Apr 2026 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rj0gEgee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB5C33F5B6
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329389; cv=none; b=USR1q3h2e3C45dmArHbXadK4AMR5pAWCojpocHnBsEh92jt/hKgv3mXO6lj3fTRipj7M8tiO1qdBViQGTXblc6XkKD5LD83ZAGMfgoFCtk+evk9ghXQWotlGjyhFHro/9Vgj+49kqGkEWhod6VhQ0mT+enL8x1sF4idqCoTGMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329389; c=relaxed/simple;
	bh=RTfVtKNXx5zmywJ9cixUTx46BcfcprXVX7kUQs3bovk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eS/lNJKgRBuRSJfbbTL7cK9b5SqLlsx/gjNyGO2Z4gQB82GfniQlgWh+X7AoFTAK5TdYrRih9SUFcufirUxf9tSWyDqMlNRfdUhbc55BIhiUMYm54iG1knRqxpIOVKxwfIdQ+DP5Ob6WdwZ51d5qxqwIry4gBRGcSEeVblbKhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rj0gEgee; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8296d553142so1425212b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329388; x=1775934188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/TD5emaQXD2Niu4vdPmtn6tIKP1Xoue1OWXb/KmhNY=;
        b=rj0gEgeerUhDRMbZ+5mmtZS51BXGTzGGjuHn6Wo3K+jNkmmozefhoE5ZyzSGWZELZf
         WshZmhqlCyVQbzPegKwZQRfH/sHc/A5c+eipbNxrT1pkUENZLLvKyEBpKCI0rqdcyoeo
         If6Hk/zn9wlAft07RuZo9Ov+IzNSnpuc4xsRiFSXYGhZ3dE4TsTRlm0+F5SyyYDuOXL8
         5T3ElFYOLiVzgIhSZmLmc7ulRBo4XuzuH7e7xrdq3Wu0ky3dY/bTabvXozIItOcHiw4j
         cLFno5PXY4ndO57xhsMPnnEtIb2jCTsJwr3OYQQnr3Qi0YI64G8UMY/VVIdiBiK/s4xV
         6L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329388; x=1775934188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/TD5emaQXD2Niu4vdPmtn6tIKP1Xoue1OWXb/KmhNY=;
        b=euMoVJf/xLGNhiqtTcz6arrZ1p6V4uSnnPoHapRMTKxvVES0kunp5NNn4TB+N6vedT
         Gn4RE5U8yDZ1rvP+T7Z8DMa8PNO21Y4M9kZ/T924RvJH+4eVxclSHXuqqfw98ntT9qmb
         EjeRHRiI5i9dbvTW3Ajn9505+Kg4db3NxvzV02gR5/wxUxS6qLS1TgsHFFV/WK6OTGGb
         hdK+YVtQr4+0f3l6TPzUfNfXoTbdOB90sVst7mOMdxecnPyAoTmKi1p9HP+ecH0Vmw2u
         JuNgo02zcoGVq1mnFdDFxEA6mFbmTWotYx63wrJHr92CvSWq7sC0psG2p39PxWqICzR2
         fWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg8fQacll4/Bd29rNstdmtWHWKJedTI4mWTbe8JzN+sLJTEpIo5MFcfxQq4XjFXmbmiHRgo76Ak7YX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCh76630HolTw8WgqrMYvlHxDGRnrkh8hEiretl9C0HrrC0RP
	FOqAbxcFYaH5zaJogfHpuc1ukBEncIraGH8xT758XgVa0mB6Mx9/G5BZ
X-Gm-Gg: AeBDiesiRsvWfH2Hvtcz68jIP4ftqK7rvQ0u71Qup4LiISUw5NTcJnKcIdcuWqd2q4j
	f8C+q4sCH3kWIQhwlll00hEcsKOFLaV/M9JycEkHQoFUtu01L5pNGyDoCGLeyjqcq9qY8uY8U0U
	TNDp4TTGAO51oB/cHNQwqg5j0yIyDzdK8aEgUqdxL1PPTRE3w66I9sS7KlsCvt3P1ymPl07HpyH
	apTA/JfTJlBfYV39zbmBCaHZNYG+6e9uOmf6dk7xl8QobERGQZC8T8OrOfQQPPcxJ1B/f/UtBkl
	BWYhAAsIrtm+gYz0eunjXOysZ2HJboa3mylThY/deHM9exBc1Bf+2Q0fV8Jo5rt9PInoektla+0
	OX0lDTGEzmzJBpsmy/JhA4bK/vcTr6DcoT7+BsyAiRq3fLxNIJfsLCF8IJ4tdRHnMakzvMFOLKP
	DA/QRcK5rn8RhyesXrK338xA==
X-Received: by 2002:a05:6a00:3011:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82d0da9a08amr6636057b3a.18.1775329387767;
        Sat, 04 Apr 2026 12:03:07 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:a008:2f74:2272:2da9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261absm10968518b3a.7.2026.04.04.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:03:07 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 00:32:36 +0530
Message-ID: <20260404190236.5218-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404190236.5218-1-vasuhansalia05@gmail.com>
References: <20260404190236.5218-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34669-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasuhansalia05@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DDA439C2A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Intel Lunar Lake platforms (Core Ultra 200V series) use two GPIO types
in their INT3472 ACPI tables that are not handled by the discrete driver:

  - Type 0x02: Strobe GPIO, used for IR LED/flash control. Map to sensor.
  - Type 0x12: AVDD/sensor-supply GPIO, used on Lunar Lake to control
    sensor power. Treat like RESET/POWERDOWN and map to sensor.

Without these handlers the driver logs:

  int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor may not work
  int3472-discrete INT3472:00: GPIO type 0x12 unknown; the sensor may not work

Type 0x12 handling was confirmed by inspecting the OEM kernel module for
Ubuntu 24.04 (6.11.0-1016-oem) which handles this type by mapping it
directly to the sensor via skl_int3472_fill_gpiod_lookup().

Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
           (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem
           Camera confirmed working at 1280x720 30fps after fix.

Signed-off-by: Vasu Hansalia <vasuhansalia05@gmail.com>
---
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -239,6 +239,7 @@
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case 0x12: /* Lunar Lake AVDD/sensor-supply GPIO */
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
@@ -278,6 +279,12 @@
 			break;
 		}
 		break;
+	case 0x02:
+		/* Strobe GPIO - used for IR LED/flash, map to sensor */
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
+		if (ret)
+			err_msg = "Failed to map strobe GPIO to sensor\n";
+		break;
 	default:
 		dev_warn(int3472->dev,
 			 "GPIO type 0x%02x unknown; the sensor may not work\n",

