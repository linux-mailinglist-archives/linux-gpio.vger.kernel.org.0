Return-Path: <linux-gpio+bounces-31045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA52HIJ0dmmvQwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:52:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C629E8245A
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C46653013ABB
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4CE2FF16C;
	Sun, 25 Jan 2026 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av0Hlmsx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A62FF154
	for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769370707; cv=none; b=urtEgO3gGtgPBp/3Lb7u3L/e3R6XbAG0NVKTOuop/YtKowNjwBmEaSzRWJqjXWzG8mlbBiXqphYra02py0WxBQqO/IyKX7FwzIHzdUJd2oOHSykydyCzHRDNXYBBwL3fqc4rEpyYkovL2D6a364JwoQIteo1xSrEJ2HRMM3XFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769370707; c=relaxed/simple;
	bh=yOJ54pYpL2f9TTcF6tyIQse6Pob6FYPNHJ3RzR+Wm5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHFg8hbB8mY6RkVNwUQtyMWxxQJSc5bIslOzjI1qhO7s6oNFDGoZarXy372UFTpDLYGIs7pvUz7EEtEWZNOIb9r2WTu9xEp4JOCKq3xnTWyuYHlwZSWMYKeydiEcnsb/KPB3vL6zF4VQXUbyoQ4pwakcbX7cLhUCjjCQrCNr28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av0Hlmsx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso6147408a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 11:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769370704; x=1769975504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1NkWW5tAbnDHrUHLuon+4jkp7FZIlzNu5NjUea5Lk8=;
        b=Av0HlmsxmAQXgP6vapbuxYcC4Wm4OtQoveFCE3TEGHbei/JKjzp3nq7fNiEA21DTxf
         HaSajvsn/ZgT8Zw3eM1G0NLvrdafqxKSadRI489sWFNGHSpPfh/KIO78RYEGjgG+zhK4
         s/mZ5G/gDIKfKe3CeSwPFeQY9koON+y6C1Xf6VcCTvhpOJjFRcuhF+2IHPutRaCUbLqx
         g4t2dJTqwQ2w7+0YzGIx+KG/EFURZJfgeN9XxL+UZ6OZFLmVRiKOWhDIS/U6z3/k5Y8p
         1YyUvVRbJYbZdMpl5+ruKSC4kuIiKNpX8hEbXfSdrYD56Q8IwstNN/GWLrjzID0d6zCb
         yMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769370704; x=1769975504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1NkWW5tAbnDHrUHLuon+4jkp7FZIlzNu5NjUea5Lk8=;
        b=jaQOhx3zGjJCNAKmQWuNHrNgnxFTGAaplyhYGOo0+yKuFKK7a64AKlzSjPCd7iwG81
         EpsaXURY5qx7TugCix7hcJcCrsn4BhuyhfT3icvMz86J5gkw+wQ1iJ/VQUTr31jsN1SX
         FI4IV7ocy4Wd/kFtmLOP1C7PW90s5oyDPL0TxzAixuGnYHJzxftVKW+at4HIa49mtlvz
         LyPndysIgJbgC2KiuyETWOpDmjDMapze17t22HPta+4egx26En0f7qTnZGoV0ynyigGf
         4S+BcgSo2Ew0ae7Sy7rdYuX/SJKk7kCeyqR/pD/gBWulzhPhHYTlU/Es60os41qKfkTW
         cMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUihjzrkMf6uItcsVUxruOtME4pame2Od5kIDxuOZR7vvobaSoBKwHrDeYGTGEbiB1GvoguRoaT3ovz@vger.kernel.org
X-Gm-Message-State: AOJu0YycUNPoJ4eED6hTmzzC00DPKGhoQAZT4g96t+P2XYZ8ZOdlrlz9
	MBZfHbxb8u51GkT+/F9aL5IHa3X93jpFxa0bX9ueQ3F0qSSSxlilBIv7
X-Gm-Gg: AZuq6aIfUhdc4WpduqCHVnuwdQfq4KAknDUj8NhJj+MmDvT+VZ4vqt2H8D7PBuXB4Bf
	iUwMb6a6YdcDpH5RK6XJ4sIKeeFG7hnXOjDGCWj7pwdMeyOk+O4Vg0QtKRqM3CD10qlFP4eeBsl
	OzDxj0qv7PtekkXEai+hiaGFaMTTcy2mx/aCDFe/ByMt7o8P2zzp72MSo9J5khL9WH+vAwBRy6g
	J3LBShWvFgOiWJxF7qKmvmPFEoz7Wcd3oJ3lyRFvrK4LEVniCV9PDq03GOadMl8qEu935yLGDOB
	hMKI9xEkTBbDySaYhWXDvLbSGEJNUlT/pZU9vlWpFpCk/ckkoKr8bJxeoStW4O5+9COO2T/yT/c
	W0qcdW2BbxtajOo21pOL8pGvxuqt1LB31BL6B1WZf4kxEPPLrhZl5Cxn7TP7MeKDyJty6fEmdOv
	H+GMQg06zROCFfHkiKERZuglc=
X-Received: by 2002:a05:6402:26c7:b0:658:1b1b:15a2 with SMTP id 4fb4d7f45d1cf-658706aa73emr1572957a12.7.1769370703967;
        Sun, 25 Jan 2026 11:51:43 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965df4sm4010232a12.31.2026.01.25.11.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:51:43 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linus.walleij@linaro.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v2 2/2] i2c: core: support recovery for single-ended GPIOs
Date: Sun, 25 Jan 2026 20:51:23 +0100
Message-ID: <20260125195123.248798-3-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125195123.248798-1-jie.i.li@nokia.com>
References: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
 <20260125195123.248798-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31045-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:mid,nokia.com:email]
X-Rspamd-Queue-Id: C629E8245A
X-Rspamd-Action: no action

Currently, i2c_init_recovery() only assigns the set_sda/set_scl
hooks if gpiod_get_direction() returns 0 (output).

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
---
 drivers/i2c/i2c-core-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..11bd801418e8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -446,7 +446,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		if (bri->sda_gpiod) {
 			bri->get_sda = get_sda_gpio_value;
 			/* FIXME: add proper flag instead of '0' once available */
-			if (gpiod_get_direction(bri->sda_gpiod) == 0)
+			if (gpiod_get_direction(bri->sda_gpiod) == 0 ||
+				gpiod_is_single_ended(bri->sda_gpiod))
 				bri->set_sda = set_sda_gpio_value;
 		}
 	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
-- 
2.43.0


