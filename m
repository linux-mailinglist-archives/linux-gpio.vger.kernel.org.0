Return-Path: <linux-gpio+bounces-36179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDnkIWTM+WlHEQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:54:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF84CBEF9
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B724430C7F12
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4FE361DCB;
	Tue,  5 May 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GF7FcYDg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0D402BB1
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977664; cv=none; b=oNe8ViA+wGiqr8e0B4lhgRe95aSoIvf0opC/rNtEHDSrWe2Rcb0EQ0JRMAilV1PXFlDwMa/iTKH15z/LYzWPbQeqjo9gEGP8IGXIDVdjC7UZatTu879w+XZtmVspniEI7ZvPKPyCtD3Ef1lUAlmwdqRQBtz0i/WRtw/L0ZzRSZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977664; c=relaxed/simple;
	bh=HejP0PadiaBCwlq4NkMh3b6gnRbSP97LAOiJPTPXaUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0hdO8VcigTyQRF3NzxyLstwmtCvqjl/DiN+umHq/Q81didvA2zfo2FvB6PPHyb9zwctd3Zi46t3DeCZ7O+MM/XRqnxK3ZJ5627DA2ErZ7nKm9BccDQ2mdBlpNHdRt9iXA/AX9amNgIO1RsTDgQGuXF1+s0nP5MXZwZOYjlIYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GF7FcYDg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4650d5f5cso18373355ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977662; x=1778582462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=GF7FcYDgtZ7xoW30OWrlcwPB22Qh+DfatKSNtxn8iaiqK0TPZ7/B/BPw8dBbagB+S5
         mj1RiAUyDJfW9GZ4YxCSjy73GyajNM7dooQVyWEO7kia2HAN7Bp5Bp7m2GIkj33QQmsM
         NbbaGrohm0tF6PHZkxjZ6Kj8Jb0xc6VRdsmTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977662; x=1778582462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=pVM/elFWl48mnro3+7Ml45HoJSyTCHZQrcL4HIcdb45MB9GZ6noTVVcHOnuVmpo30v
         fMiT3SWoa0Yu+Ag4tv+N82L27Ddy8dgzzlxhSgAHMq3Ledun9Fh6JewTJuFHFywUO6Am
         DcC6rt7K/ZjPsAK4FF4uDRDsXgI3UhFVnd7AMBuKEgdeH5WlV0OvWuPiCf4nw5kYuq2q
         dMz9cCv+852fCRv+g+UUIm3mtjSJIdHxvkPyVnJwwzAOUy8iT7vwNTp0zUOqQiNv4o8m
         S+56aRTRUmnD3gPUsyqOPUKTXn7l6GXLcvzTpo/MXGfCQYINdClaNLCPLp7BLTcU71LK
         R6tQ==
X-Forwarded-Encrypted: i=1; AFNElJ89K9I6ItshG6JhgteaWbILFTD+QZ9efPhza0cdmH5GSWBfmJ7Z0EG5BYDrRCUBioLkwKVnoamz4NUk@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmKOCrq5pfYEhO+biayN0YcfZiIKC4cdDu5UNZ3QmrUFnWt8E
	ZrcMf+C9mISYZj4k1HVz/sgvgO0dZjjXlAavm0JQiHMGVmfgSh3a1iQ0qfJDNGJWoA==
X-Gm-Gg: AeBDievfu/MCzMExgtlkg/IO6YMxp5wRyk7mg4J0qPXmOPtYgz1ZGJRLzjLzQxnCKjm
	Wph+TL4Pv2tVKJrAP+AGSo15TDueh93ZQOgwz7YBUwjR++TWzqnHv5qFBiXjYxEBu/M6rVfClwt
	XYViQRoL51MuPTOa9IY/QAfAWkCSbrpoZIMPTPcHTF9RZUFYMyeU7uAeWfFvOsohDBsUTIpdmGo
	Lv6jVk/V0FXL1B6pRJn0waa70MJllaBb5a6nfXC3YZr79uhtIUSTNCgLgt5UzXbdD6kJtWYkbti
	xy3tlD06vmDXlqbUMpipEjeVEeQbhKlVsu3Q4c5X7IENUrb4b6OnJOJqP1HjH3D5N1hmDNsuRGw
	az9fLVfn9Hls7wq17CpzGTa9rNqFiyyo24ZlMIzvuVJk3uqRV4lnb044muQ+1K7BEUHV4oObsx7
	JP9pRSnOI9F17DOuGZktNFsMLJIT8IHGnEX4Eh2mcSZcQjWzcSuiFHgUSSBDpOQvUfq/HCQcxt3
	0+hsOobQFoigW6MWQo=
X-Received: by 2002:a17:903:3c66:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b9f260d87bmr130052675ad.20.1777977662215;
        Tue, 05 May 2026 03:41:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae3b8e6sm126670035ad.65.2026.05.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:41:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: common-v1: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:40:55 +0800
Message-ID: <20260505104056.1812343-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 07CF84CBEF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-36179-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Also, once the GPIO function is selected / muxed in, further GPIO
operations do not involve pinctrl operations or state. The GPIO direction
and level values do not require toggling the pinmux or any other pin config
options.

Switch to directly calling mtk_pmx_gpio_set_direction() in the GPIO set
direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmx_ops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c

This was

    pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmx_ops
- Fixed direction in mtk_gpio_direction_output()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427061720.2393355-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..dd2c8aa03938 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -802,20 +802,27 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pmx_gpio_set_direction,
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
+static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+}
+
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, offset, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, offset);
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +902,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.545.g6539524ca2-goog


