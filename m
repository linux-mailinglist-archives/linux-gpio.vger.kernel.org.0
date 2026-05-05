Return-Path: <linux-gpio+bounces-36178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKhpMeTL+Wn3EAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:52:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD34CBE12
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B95A308E9AA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45640B6C2;
	Tue,  5 May 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YMXXEW5v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D142402BA7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977621; cv=none; b=VPOZFKoI6h5BdlXnca/9L5CAykV7xXgQyzf142DDwk4B5DqfFqR+/+CfBk3ahNxqTBPjVL7zh2JetnR+2LmLZETDcq8H5wikz4bb8e53AXjeDW9SQprVPewHuEbPv7jmuemeVVfQfRDXvJmbOppru4mu77n1v8nzItSlndEIsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977621; c=relaxed/simple;
	bh=YgX6zDqwgAjF1wfOfkqJgvIaxwi+YUqagxblfy0AVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqF39D8NImfuC+ojKuHW1qr6qoqqq1YBEsZ7OqzvCOwcZb3gmTVRBUXGX6iDwp6PQ0fWzVM2PkLKSfcdPj8AF7Dufc0wcQlRAnHtuT1mZPCRmaztWfQDD/jdk3LfclIIkeuOFq2YWnRfZGVjf3hTcv5Ssk4X95kzrGYqyeLKCX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YMXXEW5v; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab077e3f32so19038115ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977619; x=1778582419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=YMXXEW5vflEtT79Z9Z8LrNLQ72feAa6PICfVUsxd1vvp79RG84V3UHcWDm7Vmiu8fr
         ZGg9fPz2ldQIP7djYZvR8xsK7kyyW85pcZq/Xr7ttP70AJrcoQBTziSJqDwSu0jSr8M0
         loWzbP11oymC4/IF6XEttAPA4rlITRngSAV2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977619; x=1778582419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=LsGt5mPdzBLkLVulql0UcAjFpnetvnNt5P2bvlJ0AQtYom20MnO7Acq6QVjxXULS9G
         AaP+oIdrfAAz5ntAoIM8hRgYhHOmAVO+AIBee/G0o6R+E+YrJVqhSSFPfaJ3qoudmR9h
         mHk5xITFOXq8+QrOS7lOVVT9IF6RBpkk7msHL4De7x3egayCcU64xwsRRT9Hvikr7g0J
         xWd98bNDNfxw4eMUGZ1tZwj0nE2+lkdoeLnGwL1Lq8HQwZbnnD5y7Wm5ej20JFQs6elh
         G8M1t0cGAqMLEArtH6Q1Jj6HHZSgnDHVcm59ZRv27RECgFt7SPmGK/V4s2iXIJoJOGzi
         1BnA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z7EN3eokeRCPdePaTT1se4NqtVlQ9BbumGiphCdstyAur3z4tfM/Nzo2bEEct4x7+s+Qq9l/CX2hI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Xc+o7S9gEWov+5xbQKW+JZqpvuIlBquSNCtNx1lhz0BsmrE+
	hiSfaqlZp/SQTwpcKwW5EhHcie+SP/cHtwmM96QaBttheqhHM4a4jLq9v4BSYLHPXQ==
X-Gm-Gg: AeBDietk54zCzQBcKQpaZCrC9GnOd0yYgz++22HIxw4X3H9ym8NA4s9LVIeS5819OfV
	LItNTNYG/ydT7SvDr3gOpP9im3LcwqJ68nA4Maz90f/xmMEO0i9O1cXlXuCZ5tdtm06ah302uoO
	gaQEEhZGPUREpRoaRVYQnmizZEz0F7X4bPQHPhVK+2s5u15eRtnEmNgQR6zlVajLMlE+hAxBQ3p
	OywuJn3Vt0Vmx+3At/JOGsTAty6AJZKd/zWSEk2AbIzbPYARiyo+xPSqjGuGYdIpDwRLicih26W
	speTpksLgD9iKsU9Sk7/fFXulKPphTSeD+Y/a6Lwn54vm625caOj4cC/tXeStZhFxgkqafgbk9a
	5PjeYC3ffM8eDNk68HOvN9IqKAVLFQYKsjKxRZgl33/y94AXWzXUl1G8RfSg81OrmzBAhSpGtKF
	qy7k7+p4zmQiO4Mq9o5U8C9Bm/hEle9hBcVqZq4YOboqRElznQBkL7qyI30fWnhCYsyCZllJ1iP
	A4VxXPhQH9KeezgQh0=
X-Received: by 2002:a17:902:d585:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba535db45fmr22307405ad.10.1777977619585;
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm141015395ad.45.2026.05.05.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:39:57 +0800
Message-ID: <20260505104003.1811841-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D2CD34CBE12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-36178-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done. Also, once the GPIO function is
selected / muxed in, further GPIO operations do not involve pinctrl
operations or state. The GPIO direction and level values do not require
toggling the pinmux or any other pin config options.

Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
set direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmxops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was

    pinctrl: mediatek: paris: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmxops
- Call mtk_pinmux_gpio_set_direction() from
  mtk_gpio_direction_(output|input)()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427021021.2049015-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..23f04b24fd65 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -771,7 +771,6 @@ static const struct pinmux_ops mtk_pmxops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pinmux_gpio_set_direction,
 	.gpio_request_enable	= mtk_pinmux_gpio_request_enable,
 };
 
@@ -886,19 +885,22 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, true);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, false);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.545.g6539524ca2-goog


