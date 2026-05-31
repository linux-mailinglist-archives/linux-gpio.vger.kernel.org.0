Return-Path: <linux-gpio+bounces-37737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA5eDqJgHGrJNQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 18:24:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D46656171B2
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 18:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CFE13002897
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2026 16:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51531197B;
	Sun, 31 May 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFH2ute2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF725F7A5
	for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780244637; cv=none; b=iOWh+6SNCq+m/4eC3xKIz7/g30g4cGD3uWyro1wvRmRZ7nryD9ey0gBkd7dpCqNcFgasDm69U0Qk+LDS3tilNhg9kMue0mW6G2pU6Pt9VqKwd6h7dfon3Mal0E1YVXstm9VsW7EFBg9iUjvh3t+EgCxrEIcELtOTm3t2qiW5ZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780244637; c=relaxed/simple;
	bh=1ubltApWEfTejjDAKKi8fHq9p8uDyrbW3UFovPZAMtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmPAmMMcwS2B/EiVopLZd/5L1UMH4zbOdKI2rqfqIsqbw/mJ4no0bH5PqG+MZXs0BBXmaS/6c1DlfY5WOWfQbnV41sSrG+/F4/BmTKFJXh5NdxK5o+gSZIM8RmXiCzhRClIbrqEQ88Pl45/HkDmx9S0/BLW1ogALrN5Fa+l6v7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFH2ute2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-beabc001b0bso179096266b.1
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244635; x=1780849435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=LFH2ute2elgfdI/fz/o9vSwF7zP0UHSYUn4Sf9Zh6fNE12EWpXIzHtF9eWhggngnti
         rW15T5QQGIIuTICxqTxD6ispI+p3hCiF1NorpJGzRUOo8jDxkAQagaNe7SUkaebdrUvN
         bd3mkQGA9VrdtHc/dG3zULwmCphjyJQixH7G04HrhNs/IbvfYgRnJCmkUfLMstbgSPRM
         8o0OQgeEm4drGYTmBRTKy4ZeQNt6qPWLtDOV15VavL+8xAXJsbxPH3yvidaOoatxOi7i
         xr+EtIYODw+urKTAgoLWP3F5SErxKQez56voh97m5ZzoYsZewpRT+ja31/Lfa65Ktygk
         eOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244635; x=1780849435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=NLk9I+SScArLMpWyy19fuqcbN/hOpofF+FrqFTsoUrsHMuyvrK83toOjVwWWjftbpe
         cgBJKobT8IeSI0QQ5NMDTSHtXG2572g0ykjKrJL/rt+Unuc4Cv+bkPAGR7D/mVS+qY0O
         xUsgJaEzKfe2knwGaduDHLcU6vVk/tHqf4XdIJzVzHFVNibVnGxE5roL3/OPjF53Islu
         z8qyd5OuRaa48WyunRxPjjhgfTC8tc5T4+RTReM3/ITcUY8/isukQanBRiDG9z9Zzkfh
         I8Qih669wFu+dHtVZi/YAMbzNt95LFZyBtiNTedn1TT21jkevx+X8kLylFIiBy3eNvNK
         G3CQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BXJVbuzietBe7blRbvOKdUtdfgsXoj3KchH+LJHoBADAeA7j7oGhwQ0BYrdfcphN9JPqvzIdozkEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78sywerPpS6YbfwIC0VqxkYTQ9AwKM97Whqzjo5wreTgFQoh2
	JbBr6TFGpUNxWSRz75zRbuF5RSeC/zaiZjk9z151Cg7nin2e1j4IzIWe
X-Gm-Gg: Acq92OEGKymlMMgWydGZqTpXbKxTz8bAjFdcFy2I7BJasH0JlkBk2mugzJvph0Mqn53
	BhrwRtVPcJ8kJyj1D7mQI//YUeS9QRgw35d6tJNH1M9XZbUSDWTN0YsQuOcRYIJEiS2x00XnMG3
	qCTXihPB5v13UkjVWjfnvH2DzSxdJohiqC8XUj/pVMEqjxFbje5aSIwvfx6+8ZbywrR3Dtf9fv5
	zoQ/1FzWZ7g+ptvwnHDrTg+sDA7rJOYLtYC5hZAxbIcp2HqdEadvOBRWx47KXkHiF8ypw5gKy/y
	3CB31K+T0Bxp1gdMQbFrlogT3Si8BZEujDLM5kzpATyqvBgvHEHTj5uXml4cK12MVmDcUmyfbtu
	MURQX3dZiNHAncKh8pUJcaApVxg3k8SaLMMmaEo1gWU4WvHUfn0wUSU5RNzM+wbNCOKb/FimvoR
	YC9dofsgxpZCP1TpWprV7HNhJ6jgOAG5Tq8VC0o7n8T0xETOOoVerihku4xKxOOaP6XEqM
X-Received: by 2002:a17:907:d1e:b0:bc5:2352:555c with SMTP id a640c23a62f3a-beab2372384mr305413266b.14.1780244634733;
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de536dsm239985766b.15.2026.05.31.09.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
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
Subject: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:23:32 +0100
Message-ID: <20260531162340.5326-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37737-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D46656171B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Value
was verified with SoC data sheet.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8167.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index 143c26622272..c812d614e9d4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8167_smt_set[] = {
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


