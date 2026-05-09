Return-Path: <linux-gpio+bounces-36485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKj0Jqb6/mkN0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-36485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:13:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A914FEF2C
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA06301BC02
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE8B33D6ED;
	Sat,  9 May 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPitiYVR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6E394493
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317946; cv=none; b=k/zqbaCwS0uNlfTTzL/lr16e1OzHBgnyDcflqJLXF1FzgvtRNLRu30GSHTbBfhM45ZpBEu8bPVbnhts1zsztR5doMIX03R7uV59x4CwfrwcmfzVZFFMvAlTMwyomTp6IW0FBVy1sENLbAqrzQ34EEpcFu1YX2qlCiHm73a5fZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317946; c=relaxed/simple;
	bh=ULSxsA99WtOVeyQnnnWwi4Szn0714xC40QbXKSsl18o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbiPM2zUoru1lCyxhget6Chxf19EGTJdj0MDtWqP1fPj2olgj4OT8d2zGus4eacyJBJMFJEE/c8SUKsA+WrIwcx2zai2rziWfsX0CqoGX/xkwG3UdoUq7KoKlKhMi58pRiPDUZKMiZqF/ev8QU/E3dJJaH8uaBjwTCy+3H9lh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPitiYVR; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5107502a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 09 May 2026 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317942; x=1778922742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk/ryGv+w8weiU5QHQuVNcKF565C/DJ9GpiFb4c/EJM=;
        b=iPitiYVRebqxAaucnGOFAC/4+/M5h1gtxJo9Zx+fH0B2iq/v2+cLZfs1evCq1i8qS5
         yhn7JmpwZoWDPyAta8hueKBtiPDhq36zJrmPZEQ+cPtP5io6WcRZWGJWkubAGUZLK57a
         Nkn+CgGZQ1xakpHBWsSLCsqAkDOaklXKqbgyT+Mv6nVjWJKQRA45bxPifBGZA1y16u+6
         miCOEaAlUtDpF+K+uJ9+ruuMh7xXMe28Q/dK1iQi58vGE9aGZmoM6jeRL4N3O7dvIuj2
         4F/NypL3EQ36kIwR8I/30j98lqKUUxlkU+zvz8rLq8NUMDkM6aNc33M139eTR4ila214
         lq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317942; x=1778922742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk/ryGv+w8weiU5QHQuVNcKF565C/DJ9GpiFb4c/EJM=;
        b=G00bO+YkQdvl2BXwQQlsy6TZ2K01iphCTVuRL1SHPSt6/aEO4j0dYoQQpnRFQgLsR1
         rgeVX6nURdvMImdvvBgqc3WuC5/52fZWVKc4wxJ+1LZu1xTr7kk1s55ly09L6LgLkIx5
         KEQgtsqUxWdgyT2plGvu/Ghn2RCY3D0ibL0SP0APFZIc9xg07/ckOUJ6pzowlGRzqZe6
         nrdtwK9hDWFECOavsaO1Ltn54FixCu0CbtggY5Nl/ajDRnZTZ9ePis/iGofWmm1xaRLN
         gz4mqJHg5xABDPE3k3YK2d9wI4QAY44aDQPWe0ZJO9E02U/Er7nyTZd0k0oEL3VhLgTA
         zibw==
X-Forwarded-Encrypted: i=1; AFNElJ+KLrBfta8d0UHp9egkUHMT9veYRZ6CiFDciPmYENp1cyblNgP9jZMv719EJD0I6YpjAEcJ0YRje/xk@vger.kernel.org
X-Gm-Message-State: AOJu0YxiG958MenUsHJiXF7QdPicsAVvIXTZ3v73ln/W0souQwVpO/7L
	oxc1V//9mns2rXMXtLI2DuvBWALBLAUc2huEu+DE8LN4VTpDHs5OfFMRv8NpRQ==
X-Gm-Gg: Acq92OGTcmcXYXGzJY7X0yvqbVjMr184WZadgWam3lPtuHelUqmzDROQ1xJlesnPFVX
	oJTqTSWGP6o1txAExW48uysrMKUWCe9OPHDfCsHLvlPsW5/t+ohoEwuWbOI6GIEj//0/eqFOA27
	Hqzm6DZoXcRWhmfeY3/upXySbE8qX7TNwWWG0EKXmgGxuqYA5+EOKT540QH2s1+JFryajKYRuiZ
	R3x/4kQ1PcrIsAzgbMf8l6VRyMObtM8G4+2DhDtYm7PvXA9z8VJZqMyXaWTP5yqWIXsRxqmocBX
	bruw6lR6RJgGfsDHaWhYDj8tjyQ9cgrmmRU1Y7dLnUTQrJkHlM2OCwZjz+xiODTd8V7jw9Vd513
	YDVZy8K9g+7ICOddORhPmQWQUg81pD/+vrvgYNPefXGLuGeTCiC1BXJIUMhHWiwT3gyyH/xbluy
	K8tPUTrNe2vaYZY69sW+FLSmfd9LalZZwaCqlmlfwMsBK73g==
X-Received: by 2002:a17:907:9346:b0:bc3:b598:7f47 with SMTP id a640c23a62f3a-bcaad226929mr377767166b.42.1778317942195;
        Sat, 09 May 2026 02:12:22 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.248.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3f66cadsm203819866b.42.2026.05.09.02.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:12:21 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 2/2] i2c: core: support recovery for single-ended GPIOs
Date: Sat,  9 May 2026 11:12:08 +0200
Message-ID: <20260509091208.18346-3-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509091208.18346-1-jie.i.li@nokia.com>
References: <afiNrr4Llm0LWw-5@ninjato>
 <20260509091208.18346-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12A914FEF2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36485-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:email,nokia.com:mid,sang-engineering.com:email]
X-Rspamd-Action: no action

Currently, i2c_init_recovery() only assigns the set_sda/set_scl
hooks if gpiod_get_direction() returns GPIO_LINE_DIRECTION_OUT.

This logic fails on certain SoC controllers where open-drain lines
in a high-impedance state are physically reported as inputs. This
leads to a "deadlock" where the I2C core refuses to assign the
recovery hooks because it incorrectly assumes the pins are
input-only, even though they are fully capable of driving the bus
low for recovery.

Update the recovery initialization to use the new
gpiod_is_single_ended() helper. If a GPIO is configured as
open-drain or open-source in the firmware, it is safe to assume
it can be used for bus recovery, even if the current hardware
direction is reported as input.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c46147e3506..a3c33e804d47 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -445,8 +445,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		bri->set_scl = set_scl_gpio_value;
 		if (bri->sda_gpiod) {
 			bri->get_sda = get_sda_gpio_value;
-			/* FIXME: add proper flag instead of '0' once available */
-			if (gpiod_get_direction(bri->sda_gpiod) == 0)
+			if (gpiod_get_direction(bri->sda_gpiod) == GPIO_LINE_DIRECTION_OUT ||
+			    gpiod_is_single_ended(bri->sda_gpiod))
 				bri->set_sda = set_sda_gpio_value;
 		}
 	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
-- 
2.43.0


