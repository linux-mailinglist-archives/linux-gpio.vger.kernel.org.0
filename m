Return-Path: <linux-gpio+bounces-33217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIFQBXs+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:18:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BA26D066
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3400F30848DE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4883839A05C;
	Thu, 12 Mar 2026 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdiJQaAT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A6398917
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288986; cv=none; b=pHDZiWz0V0GaMGdR91TxQiAk/gApLv46bKUJvbYG7lFcfK2RJi8/06sW/8lLoxGTmWkfZzZ/9St+GTCNWydWjBybBL36wNCRAco25vfSsb/hoIvboRGAGig5gWlYbFXtawX/vUs2RINTYU+K/olmtvTTbqJNCVyD7TI9Gy809ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288986; c=relaxed/simple;
	bh=td9gdFoFDD8r+MyCLNYBIDmebiBT0mY2mWDgHf8nbI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwoPB4sYu66O+w19LA1X9ESlD7L/+d+vG20a0FonBUa0bcfuufqn9f89U+qni2v7idr+VyXHNdV5ON8qakQ6+tP4iSlyWs+XvTUxBcMLbe/Xleut5QufBZ1bwPKtidRK1J2k/0UW24qsyFoUZcUWT8Z/3GKeEtf0QA2tBiHK01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdiJQaAT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso214960a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288984; x=1773893784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=DdiJQaATd2s/hsJ406U3FxDOj0IrybYNHK8AkOZqfgj2vR/SbCUydCBDCCfctxf7Ag
         h5oP4xHTMNhh9T3tZmYE+nMb71JuV1rLQ+mkdxWBB4oIdVuBkVH1I1AjS1O4pRV3uvId
         mX4dR83zV+JB3Au6VSn2htafvhdZeMqWHF2INFYTUbL2M6ctZUpYcBOYHYAzLz/UXqRC
         3C4NeSUZjxKpI9RgPPvrFBvqrtFTqJw+gZ/2/lKe7DvH2Z0LRf+hh4/rsPZBs+T+v1eo
         EMRW95TPake8EXCUnnJknfYrQZ+x1ClMPFYTEdBHEqEH41T3f3pnltYPAfcSVmKVAPvY
         9Cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288984; x=1773893784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=XTy7qPfgI9qx7+Q4CP58TVpnEFFI75mKutoHV9Irk1oOMfLcu/NEeRCzbVYutZzSVb
         fb0CzRtnyWpiQar0XVFfgoEkD/0pH61hBByI/qgyKBRpET51xpdSVPz5wohu2MbLkhnV
         u6uSPPSe3SdG5QX6u8Lv8aNnta6xF9g+SD06gcwDVMFnhcAa7eLwuFy0B+nc6SEekIQH
         bdFkB7sUVyJvU+ZcNAgaXhSg7HBPuNzTqge9e/mlW6XOj2E/myomlwaNSb86HETktc6H
         h55FbTo51ISdp2dbPEDiyMOGS1ZlvBlMPpc5Gy7ISpbILtnXrS05s+EfcbYqrZTX7qO+
         jZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJXHiDNWOD084UyuUF2N/0Nj33vl+/cJCM+eKYjODkQg+8nIW6EcIvIRDq6khdRZLLijxjVZpQmUvq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYCVuoI1+qaj5a1h1nHFiMYBXELD8JDBrgyE/+WMbN7eHmyK8
	PFlawQ7z9KTRTY0Mh0YlPgKnQkAWUiYbYxg1kC1V/sZLZynG6nAsAoUQ
X-Gm-Gg: ATEYQzws7ceAN0BZl4LOK0D/SH/7vwb+rVaOX9lOBg0wHZUpcuB/Xmqkz9va5yoIbRV
	GCKZL8zvI+YRaK3Jl8ueU5oTxwoO4qt+dhpC25BWdJb73KCjpECoWmYmTQKefCkXNDe+dsnIpi5
	bj2SubazqsaYxAI984FS6/xjABcKHaobUpp2zoEhSI+FNI4KfDPVRlVexi/3C9znNFQHsNiHhB1
	lNQvN0UlZQV194ZGOSeZiKyUPoFlUG82zYO/EofnSt5Kkv5hJS5zqF8BzI27wqAn6WYsIktGejO
	jLJwt9qX9DB2LHU+mL2IW7Dgm9E7ALG7dLiCBZUsk/KvmqmHuB5xFI9G7oFCLHUNiaxi/ANcKTm
	5xyFGSjxxiYrn641awNjtJ3zPZFcSs8/fXV4+0jY2NqMWIvEmpd/HpVb/rruJ6p7++EHkxrpNFX
	Iq1cWss3NcNQJIxyQxNj3FG+iO0ucDzI5PWNfJ2OOpyqYKE/Lysc3pQtW4Ae7lZiAselVSG/P0y
	EJTpo4=
X-Received: by 2002:a17:90a:e7d2:b0:359:f43d:4a78 with SMTP id 98e67ed59e1d1-35a01284a88mr4254615a91.20.1773288984290;
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
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
Subject: [PATCH 5/6] pinctrl: mediatek: mt8188: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:32 +0900
Message-ID: <20260312041533.187553-6-akkun11.open@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-33217-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: A61BA26D066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the mismatched macro name in the #endif comment.

Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
index a487323748e2..a688e919b32c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
@@ -2256,4 +2256,4 @@ static const struct mtk_pin_desc mtk_pins_mt8188[] = {
 	)
 };
 
-#endif /* __PINCTRL__MTK_MT8188_H */
+#endif /* __PINCTRL_MTK_MT8188_H */
-- 
2.53.0


