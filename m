Return-Path: <linux-gpio+bounces-14679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A1A09D99
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB16E188ACFA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 22:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E2215F6C;
	Fri, 10 Jan 2025 22:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiZL9FbH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D224B254;
	Fri, 10 Jan 2025 22:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736547050; cv=none; b=JD72MFRuwY9899A63ILXq4rLu8pJRKPGftERoRekUyt1u7XrA5yDb8ZyDHah7Y+kWxWgXhlrx3Lji7IV57/TJEynwaA31aYj0LvgOAIqq8PKUfM+wnm2a9enI1R94yJNg3R1v5SsIaNqs+qR7VojZMOyxeTCrg7d8/5APrWbyho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736547050; c=relaxed/simple;
	bh=76QmwfjydKeKsUF2HZYtGuexeDa7zYJL0v4o+jWuYDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epk9yiFSN64CBN8Mhqkas95pA1HPWTgimcllGpO0Dzv5dBFiUnUHT45VAAY2Gx6m/uvTeKlosDr/TVQGr2xev36UA7ztu5nvDZC3WIVob+naKrmanE/ibtoljx9uEX6eyAENjaWakS8TpvUW3GJyt+mRLowz2bSe7NFLbZ/LUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiZL9FbH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363ae65100so27153475e9.0;
        Fri, 10 Jan 2025 14:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736547047; x=1737151847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSkTSR16lMSvjNrxkBkJcDjAf6TpK9sHGXsGQ+pJ3HA=;
        b=EiZL9FbH5DdTstmSDjwSWJjgTaj5QuioSwghr1h/dmP3mKX18+Ci+j3FikgaYHjx+P
         prhM7MiT8ldlQ3wlCZQ/gCyl9piDG3OBgWys667S/WgoFx+KM38mQkvkbSSkL5suBzSx
         rzDYIROx8/meJDSXB+P/eTstNEhlgfDZYTnhO63ATIA+CkNv4E0QP1UHwHbZpR4Q3wX6
         L5N5w1UgLXCY7qf+6EqVNh8Dm+iVU87LOaPMSoLA+qhgUNrSJMJnNPhg4BRRI4x82Bg+
         BKMzF4f3shvDnsYpGUC/MLU6rv7ISlgUI4vgooJXApofPJDfNCuoAqdRoRAEZe9UmB5q
         f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736547047; x=1737151847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSkTSR16lMSvjNrxkBkJcDjAf6TpK9sHGXsGQ+pJ3HA=;
        b=jY6qVWJEnUnjJlMgLIjFC3l3XNxXFyIb7HCHCEi7a0cTTr1FZRspuTeasbsyGucUP+
         bw7F1rTuWcabRGZYg94a1xLJTUXVF/p8JLYxRXK4Mmn3nWTbQ/8YOBd3Nk5rp8yWD6D2
         WQfjXhQOC0h0nvCQ156We9JjRURavXfIDK5gnJrykbfRHWeR5CxHCeZNwiG8GJjlCSaN
         TyqD3AqWONcw8eXjwaPzZo7RXeSP0PMyQcIlCuV4KWtIBafOt3NmTL00Epu1h4yBJZNM
         TUW9MiqJ6jjrCvU3pTfbMTrqiQd8kpo0UFbJ7Vw9VWD4jd2kmXTnCw3CqjxUOy+6rgY3
         mMZw==
X-Forwarded-Encrypted: i=1; AJvYcCULrhiGMcgYb+qemE2YeQ1E7SzzAX+OImPahGvG6i02gerpNO2aj0AXCz5fN9tPm1zQ4rrhlM1WkU2H@vger.kernel.org, AJvYcCW3rNkQUWXv5YcAMMzWJ3n4YkgS4LPjhaL/EVRWTVUn/EqvFyAMXyVi+THIjtFbUNPG5KrNMieH@vger.kernel.org, AJvYcCXbFWaxBBU3PP4e77gfDIp3mnu5fq+bpP+z4PhfvaW8GblejUo0Vv1HEhsm7nlQksICnrZ8gGJXaDVfJ/ub@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1oMJLcIi99tUjzwCoo5UQo5tcgSZv1pcZWn6Tx0rB8ikGZVn
	OMwLc+Kb8P3FHaIubmrEyxX4watsrelYsSJoitB4U2ZEM6/tfPfx
X-Gm-Gg: ASbGncsdovO6hzt5kH7fGArqUByzcqoPEC2bgOOEzxdwuCrurWVs6V3mmmfrI/PW0tV
	0f7foxqnyGGehQ253EQgZNWmMeCdZbt/ZCQCPrA+b4yNKIVLItqxAtiUMQaljao34Irs2uv+0wO
	y4NE9JCbbEOLSCCUumH5dpgitxYdu78ckGijHVuVQQFbFntUpzpuPycmrDrJBrP/tI9Gf3lIrnZ
	nVK4dZDFScYR2tO2lOyv9z/jdM5fpJoxDwRxg9F/XViVhSLncqJ72EPQKs7+7+10a1IWO9/R841
	4I+aDlng5g==
X-Google-Smtp-Source: AGHT+IFowxWYRmE0wSTZ/mAgaRQ74m+zBd2DXixcbZR80HzSHl9vptDSoGBDNsuI8QMwwc7NcSk4KA==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr6251095e9.0.1736547046913;
        Fri, 10 Jan 2025 14:10:46 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:34d1:a1e1:3f01:95a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6271sm98211555e9.9.2025.01.10.14.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:10:46 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Update PFC_MASK to align with RZ/V2H requirements
Date: Fri, 10 Jan 2025 22:10:45 +0000
Message-ID: <20250110221045.594596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The PFC_MASK value for the PFC_mx register was previously hardcoded as
`0x07`, which is correct for SoCs in the RZ/G2L family but insufficient
for RZ/V2H and RZ/G3E, where the mask value should be `0x0f`. This
discrepancy caused incorrect PFC register configurations on RZ/V2H and
RZ/G3E SoCs.

On the RZ/G2L, the PFC_mx bitfields are also 4 bits wide, with bit 4
marked as reserved. The reserved bits are documented to read as zero and
be ignored when written. Updating the PFC_MASK definition from `0x07` to
`0x0f` ensures compatibility with both SoC families while maintaining
correct behavior on RZ/G2L.

Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC")
Cc: stable@vger.kernel.org
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped SoC specific configuration
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ffcc5255724d..e33efd65670f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -159,7 +159,7 @@
 #define PWPR_REGWE_B		BIT(5)	/* OEN Register Write Enable, known only in RZ/V2H(P) */
 
 #define PM_MASK			0x03
-#define PFC_MASK		0x07
+#define PFC_MASK		0x0f
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
 #define SR_MASK			0x01
-- 
2.43.0


