Return-Path: <linux-gpio+bounces-37736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNTSDnpgHGrJNQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 18:23:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8026171A9
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 18:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CCE830173AE
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB95A390CA6;
	Sun, 31 May 2026 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfLvrt53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973B3002D8
	for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780244590; cv=none; b=BrjQi9m/5ut7XvASoIlF1grX6B1NIFGcZtXwD2VCNlJhx1iu1u1iZxDwZqGFgUGPopElsgec0DXmmoGkbsgmOeNYUiA8QlwlrCh5QMslFLgydou2Kl/YTHsxSVnKDxXDw54R4ryYQ+Majo2boA+ICY1tI6BILn5vPTuc9bmp2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780244590; c=relaxed/simple;
	bh=rwKXAJG47++ekWwD3VEEBjR7kMbT/o+Ps0zByunOecQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kEL7AlTDtLE4EVT9jAeVFes1yCrYNnmYZ11VyXaK4ktnhNs6Sk2dPxiGltL4vdChuzQv4OAe0+LttNgnscm4+9ErCH0ligBhThnQUby1aajxcuiofXYU70t+ksqW4DGwHTcrjjob6oQCGt9q7SpT+RgnAfMjgkNzRssuRO/8QfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfLvrt53; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso5365425a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244587; x=1780849387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=rfLvrt53FcVyvLESmm31O0PkyzlLa2iZf08hFH16w5mqkpGnMmL5q0Wxh2zL8ZqDfm
         piCypHuoJrROYdQpKn2/VrO1dFqv1TD6QCfCPTFbRddQYrw38XWGzMjCpwhvZwFV11kG
         gF25U4knUV04Uz4mf3MiA/VNENJl8HigqqRQTUeb22nAyESfauTVizk3ZF6puVof0MiZ
         wtUUNO10g7GN8lVKE+/h+HGXnig8nVzfRGUeAExd7x3HI3h8V9VNDXi6HONvavqLniaD
         M7rfmUBBFImeOmQt3ZTeNFlt5HphNbNsLj8ZruyPC/KuXj9Gukyp0GUtJf7pYhz2ero6
         BbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244587; x=1780849387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=VaQqxJcVT+3zjSOmsCul3oLpktrnqUr4mvj7H6e7tP6GPLpeDxXeRAfMDnLXQiK1fc
         SX7Bdgd3wkWJXLsyESKf9jYxHQ0p9dDpu7G6Yhqt+mRQhfmFmOWnUI+U5v72SOU1JA/r
         hkv65mkxAB7hnWDcbcx7tMOoQlIWFEoCgLrpNj+nPeQntaU+zQ0FlHcG/f1KnBRbHdFp
         ++GxENhpE2PJzaReYi5TYEUTz7lnTXakUfIN7UVhE5vHw0T8AkhSfifnuGvnJhorvGSG
         QY9goTEQy4ry3wLHQ6Lan25H2PCXMW/syKkgIaMRBt2oBno6YbiAjap+3Mqht54tFKG4
         +41g==
X-Forwarded-Encrypted: i=1; AFNElJ9/XIJY3z6gJtr/G4sx7Dw+dZO6NNZaIWYZ8uUtX9QPFcWmJ+CjkK1/nHXik+NQlCTm4S5pQfitWCUh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4znFAt1SvmqBN/V7FcEWPqY+Gr9fszevoOIcJUppvY2me4eB
	lfVVG3ptmf7dlis6TBhNg+ZQhj0oi5b3Dh0KlI/AvScpjzayE1tDhSGA
X-Gm-Gg: Acq92OF1eE5Os/yaxPe0khsbgKDweuDHE1maM/obSOpl2RAuMt31vX3nhVUYV3LHTdI
	OmcMl3UzFRFKHlXDK19j0mHYh1/WcEafKQBpd26dZy26mHuRWEw1DglRqz1QZ0LdQP/t2WM6pIz
	OjfMBJlhEyiXG0KKVQJ9420SEZhYcEG9/FPMIzggW1z6kYGLgqhUn4+N0EcD3418SA4mkXDPODh
	B4CR/9kZVkvNgNngt3Z8+WuaGw2xZaXlSbmcegSyr0QQFCIkqzHoWzYiQYG11mOu2lxc2GzFuYb
	gTqJLY4/wB/L4rGLpzyrpuQ5rGo2Yqt2nQc2FHlyHyzOS/FjxaPTqV8Ov679GPcNlo+S+vjNkW2
	Fp7EfxtIf+HnCskpImKpWpj/UlqFS1psW/uBI64AscthT1tGb9DMmGGOYADfbRi7qB94gLF0aYV
	Ud2ePV61btuefyQLjQG29P5Vk9qo7Bf6vwc/OOKwvc31+5i83rt9oerPqi+A==
X-Received: by 2002:a17:906:31d3:b0:beb:cb43:f928 with SMTP id a640c23a62f3a-bebcb43fd4cmr125626366b.7.1780244586655;
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm29131566b.29.2026.05.31.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:22:30 +0100
Message-ID: <20260531162237.5290-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37736-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,baylibre.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AB8026171A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The correct Schmitt trigger register offset for pins 34-39 is 0xA00.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 264667112ef0 ("pinctrl: mediatek: Add MT8516 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8516.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index abda75d4354e..68d6638e7f4b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8516_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
 	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
 	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
 	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
 	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
 	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-- 
2.43.0


