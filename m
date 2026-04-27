Return-Path: <linux-gpio+bounces-35534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFx5DIv/7mnO3AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:17:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17946D7F9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C83E53006959
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 06:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A7436F418;
	Mon, 27 Apr 2026 06:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nxZB7ckQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699935E93C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270652; cv=none; b=clS1Iud1QzYgsbuYTBjujnaqdbfYTftIQAXXoK8XEUWCbYp2U6fQ8tEfBptb1ucGQZVN0K4c6us8qNNl+ZT9dNLKS20vSCEtnUrsPJzCRku3kVSwbajapnpoUuWfSiAKSBoDYKhF+n+MlQHyJuFJ58yIMcn68NHeXzwy6kefHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270652; c=relaxed/simple;
	bh=WweyAjXhQsKYxr9GHwNadiW4OuHH3zASgkTPnK6u2k8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyzsTXFLVXGqfhRSxBVg9I2fqpzRSYbIK3lDVirqV9Nsiia85KooFkRusV8jJfXspCaSLDMD00v+1wmo+s5EqRtRaVgJh0Gw9gYbj/tFKoueAeO/7CU+qPencrOQpbKGb+uFBEN+1JKFIZq0CPpHpuiNCbUZwSOjlDeaNG+zJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nxZB7ckQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so6027154b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777270649; x=1777875449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=nxZB7ckQF2rOwDvG2zQOqxtku5VS/v7SblP3O6UV4mZGDOgv9QeV8ZRV/a8R+P4l+a
         MGPRN7yzlJVu2nLHzXjTKm6fOMje5duDy7ZCnfSGmz8rb/cUFLAPbOfAziupIOOX55CW
         T2u6ev5uc3/5Kk3DXTxaW4HpmtKulcJVVd6+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270649; x=1777875449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=Adpg0/kz3jrpBiasUglmH24lcAAt9K/qf3eg8GIjkxbEDXkesYnshAfM5pSxGIaMzb
         nnVj5U5VimgUjxzGpdbLjaszIczvkic2bq7yrV/WgNzUnon639/09hGhqwiyby/s/JXx
         c20bh0qqxou+UU7bzNma/rcunBgAfPFhmX9q8jGXZsto/38G1EvJd8iALFuFswJ1VxCd
         0BVmLEkASmeS9LI4NOQepHZhoM1I2hurA/xzbFZMZm1G6aoKwGRjbvnTBcQJX0aPvy0i
         ExOCED3sSvGMWvzYMuTa2NMBrnpOsKDR10nfiI+UTJebh+qVNjdjSy6vthGJfceR+lyJ
         juyg==
X-Forwarded-Encrypted: i=1; AFNElJ8+vaebq2jKr6vqZDrMYk0GVRtAmk++f38rv3agnz1AQIPkCQxPIM/sExEAumUZW9I5iW/5/CsjyMW9@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkhteX6SeGBdTPJOWLudIto/Ls26eY5+4dBV3pZ8uvPXA28n5
	3ZFccqqZ8cehJGR6VI3SX5GLVyctx7H0VRR4P/ix+W30xphHqCCnjg2gnOl+eh6sXQ==
X-Gm-Gg: AeBDiesbkeAQ/W/T+Dc5/yFu9uKV2QCOO0qDa4FOvD5j9nbFqldXHcpiO2jJoD8pmyY
	X4uu5NSUd1gbRHJ7r4zspDKenPpx4U1jfEW7LBtAc+yh1Sx3GLkTSKMuWEBsR/VnxVadOdSQ4zd
	aiSc1ZFwkeA+hw0LMgEj3jAqJCDKLbLScIdDiBnazquBAC6l6KSOBs7Mwj7pk2pvstNB0QzC0bS
	iIrP+mR6sXrZ44WEME+b/9Km3zuFmxNrVii6ufC7hQPkxi97qxDJNkBbwIXypRZ3D5R9eVPMK5c
	KBZv7HYGoh2dyuDD0K1ahG1CL1TZcqHlRQP7ZxTniBuwFb7F3VFnULAELbKl4Lza2/LD+lrEREm
	JPPrD1SzLrlOvT76hQ3KyHarJAtGytSXkFEUjUpUf2br+gdnL22AIiUzOP0pgne5g4iqSzLGzfs
	x6vKTbBL5j/H0U9ufnq6LvvzL8OpiR9Sp9+7Krmrn+NZzmV6On/3XquKFJ3T+Ms+Kf/Jb1HKD8y
	wf1dvYZ30vIQPE6EMLkHnWuaULypw==
X-Received: by 2002:a05:6a00:4b4d:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f8c93a983mr44134092b3a.48.1777270649269;
        Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm28824635b3a.25.2026.04.26.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:17:28 -0700 (PDT)
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
Subject: [PATCH] pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 14:17:17 +0800
Message-ID: <20260427061720.2393355-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8D17946D7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-35534-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..9c258e205e39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -806,16 +806,24 @@ static const struct pinmux_ops mtk_pmx_ops = {
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
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +903,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


