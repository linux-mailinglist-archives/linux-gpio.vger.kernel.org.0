Return-Path: <linux-gpio+bounces-33216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNcbHlc+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA20726D029
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C648A3070EE0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C163976A8;
	Thu, 12 Mar 2026 04:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHu5Zr+1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2439769E
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288982; cv=none; b=rY5Zt5ahSEHh3wSLwr4PQLmcJS3QGAUk/on5Gmn1PSWTNMVsUwew1jIHbDN/LZo3/AlMqwOIxfGLoOdj39yKvbgfPMzRZhVf8AvIzRQka9Rr2ABQ0/XDmZruBeJIgtYHfdd7yTuV5T61ivuv3nvQIHEWCUy8yd0KPfw3KgTg054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288982; c=relaxed/simple;
	bh=51ki8Jz6kreuFXzwCafh/1IS/D4CLIjxbKU84GMKd2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWxksaPUOJxa3RZTQWmVtmfMN+x/6csj0fKc/TSNPgbQxDSqcgJXmdVy72gwji7m6YXc2o10hho1q1DnxZn22HBSEObntz9DcGJemDYkh2y6u9Vuvsh0nIawCOM/1Xf34CXyXweoEd5NFgzfSmiNGzwyhwqEWwCc5Fr4/7JU5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHu5Zr+1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so255454a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288980; x=1773893780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=GHu5Zr+1o3TC4xozbTnzzbr/S39PrEBZwr83NSjiKuLWsgXWM7iNnhOi+nbJ6YmC8Q
         tYmBRmjgBINN+fCCP3T83EyH2eKnD0QKOZvdWzTfQUjzpbKujcbXmL8qoFVxTteUmwuD
         7y7p/U9sU9yerUDs8s9V0GjwMBVnwkqcP06Jt//SrObnbFGfH8bBb+rquRtCFPMbD3H2
         k8N8u5buXMMHs/NycZv1uoWB3zC7ESTsgxnayBdit7weziiN3KKnXAi5rQFhEPH4OuOb
         QlSFXY6nQMHsSNPOTsEUXE28BlmI4FI2wWVoMO3v/NdSgZ7CANNgPhROoxi8nX4HEHHY
         Acnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288980; x=1773893780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=c7iWH0TPrfOSsBVEh12BWI+i8lmpRjKPmWssuxOasMD6W2cooosJxr3uzKDFL+K82L
         YfBEA8ypkwAAuuADoM7oKvDcW15CZvr7HjyNbkPZEAgOlb1yGaK/FMkpvXJ4q4h2K/EW
         jJaR5bQdVnh+qDJmaughJHD2RveKOffhHU6q/Uwso4uH6zVbAJmKEfWh8QPBzNzNtP7R
         l4O5qvLfezwg7m6SRxZ0oFsdfhtr2f8bAjqcbXmWtLlf2fn6Davlv72EtQesmAwwuon9
         Pp9Yqn59QRA4OHIGG3Zo8cxb629N4oVs4JLnR5SO3zpRMX6Y3EbsTvKDfNLg2Z8GOhKk
         ewJg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDOveezSGLVRi3+SCNww5Eb84CjcNxw/l6mH52vW/w3lZZ0/MxXhp3jQcjz3Sv4Kn3DqLaz0nJnPw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zDpgOC/NblpwMyQKdDRRTrrMIhsMNd3JX9woYAEkkdC9YcOB
	LJmAyH0alsII9cQ3lhJ2zb+kNlo12EqrAbo/X0a1nvDcT+2kD4zFP6j2
X-Gm-Gg: ATEYQzwnSTujOLgnRH1fs9ECYufN89M03fgwwYHNeWOWl+mO11DD4u8yaaq7UWLZZww
	TkwdCSC9iFUL/l0VeLtUVi0uoNAKNVNTciBByMwnF/bXguE0CEv8FdSCfaVjgB6zaAI6Tk3SbBM
	vojH9JIO0dVfYAl1qOhNvVtPYYflRXLWif3ypslviLTKH+euo1XLLmdysLYgvYTjGAK+nrzCEv5
	gLq56jNGFK3vR+UW8x4GD2+Y4Vn78Shfd2OnqiMepTwd7u74w+M6uq2eetQOQDYKKcxoMLAQB3E
	ykmSU3tC0I/SBvYJWtEcQOZJ5c9iGgmHR/BxEBfMJGPVdL4iw/7H9WqPc0jMsiMgrTv+DZezv4K
	RtSCJkNaAs7V10Uir6hz+ncsonJGIxnWFZitj3W69P+B49R6YDaETsWZmKogxbQd/i8SHdnopBL
	SNxslHpAtNgD0+CYQBCOkzqaQglBzGz74O/4My05mAh4dAMUvibjv6Yp0boUVUMyXfo4+PvzgS7
	0U9fuE=
X-Received: by 2002:a17:90a:d60e:b0:359:f4de:8084 with SMTP id 98e67ed59e1d1-35a01323af3mr4560816a91.23.1773288980433;
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 4/6] pinctrl: mediatek: mt6779: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:31 +0900
Message-ID: <20260312041533.187553-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33216-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA20726D029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the mismatched macro name in the #endif comment.

Fixes: 920e469e15c8 ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
index 0a48d6686ebb..d9404c9f6479 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
@@ -2082,4 +2082,4 @@ static const struct mtk_pin_desc mtk_pins_mt6779[] = {
 	),
 };
 
-#endif /* __PINCTRL-MTK-MT6779_H */
+#endif /* __PINCTRL_MTK_MT6779_H */
-- 
2.53.0


