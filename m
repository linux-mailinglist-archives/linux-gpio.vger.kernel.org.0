Return-Path: <linux-gpio+bounces-33218-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMn8C00+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33218-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7426D01A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D266C303E375
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B53B39B955;
	Thu, 12 Mar 2026 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4/EeDgD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A01396B85
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288990; cv=none; b=ZI/vkj6zk2NMvrhMmUMwnTxP+5Ofm6u9qcCoMSKQBjHkaobLgtgAKT5J9TgZDXkVYWoXmUhSA5GcTP/L39bhCQ20VuifkAmdQDMzU5iI7yvXlYfr09xrtpWK4hf9wABXx+4qe0gevmcaNzuuUrBxnVApoI9vT09CbFG+HZdHhB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288990; c=relaxed/simple;
	bh=kIIc2WESkLTGQoHntr8x0eaRUYNrBOeXLKaC39KUeiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syOjQg4rPNP/ogja4kJIauQA/O71SHt9o52uFdevT+jxTZwo3b1pScqDX2wWyDDGryZd/MOFvlsd1gAi0JLElWBO+iLB88eJBGO80d+n1triWV4rn0hQMmjbVTxcMjxOM0bQU98mydt8bm05bpyoVHQ+zqI3m1B2FKsPyqNvJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4/EeDgD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso214974a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288988; x=1773893788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=N4/EeDgDuHzELGhqzoiPLcBGbZ68BMILDKGsZe2pAtQXmC8LiH6oW9eopxRjj1zqnh
         V/Sta9EPzAOLoClCk4LPsGblsS16hGdBMtvjYvlJzbbVphek6tSXFCBI4eGRRTx5XKih
         CXAbnlFkxGO/OGAlOT8DAR0qGXEA463RY/x3Mx0NI/VWiz+zXuoMw0/kNj1qi2x7xUwv
         nk2lKD3ofkju8smsa/bl+/0y5voYAM7AhcTesFNmJLReL8n0fsxTgikbcsD4MzRtAgcS
         9KBrEO5y1TaHsjSr1iZmjncTbK/XuwAdkkiIPZVH8NKNweMYvCZvXR2rQ2oToXAM9u9l
         qpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288988; x=1773893788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=jx0hLcvmvbug2Vf+qMm0g/ZFS+AYQbN35WJ4ljMNyBMtyBFVtftObtD/39chlQ8bgo
         40g3MqnK0Sq2U5woI8fjOR/RfD1h9fSSp7Mo7HAu7GLky+E4D5G0heZWsl85ZHOMlxhh
         xrByi5MN6TsfRE4pmqLVM9YD8MapPxQ/gVsOxzKIYjcJJl6Se3Y5fOCp4/I57RxBefPV
         AB+ion9znA3bK+JZLp+B67DGEEqyJvgnskQEEYE65zOFpDp3RgYSk7KhfJ31Yq4DApzd
         WiIhFk1JyswO5zjh8kD1BHBE23IW/s6Z7BhcoidpEnIzcv7qW2ZFN9xSPANe2Mu6detP
         0mNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR6q5Lx7JQxeqt5LDH0nna8IzSK151YMrP3sEYAuhXnsJfeCnR7iQ6g0z3r7Po9xKHV/pIL5DCjMLb@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3NHt9Z8keMin7Z2rD5X7NW5sfAKkDITAlLBcxKH8VQj+OQtd
	HoxXv56CLrAhUOpERXqwaiJCHNuky/P/d/yEvBLwQXLtvdonGY4arHXA
X-Gm-Gg: ATEYQzyL1GbR2FPYoKqMP4XXXEN/rSESiErFqKMrAscjScAzXKwOLDZ2ZQVs53SZ1nd
	PPcE9Q4L7MS13NqvLMwssz39DP4QuTZzxsjm5987+rajDRstxt0oKC/9Pa5XNuv8i1g5XJyuYfu
	2Luwi0oGfiWB9ceqOKNW3UHCqiFX/eBeGIkedfpzM8YVbLorZiMXoKhM0Xi9A1pYW6WyYMwSIeY
	qEcdNdypb6E1NAcGwMWyFqsY94qosttjLn9mokyi8kIUPUw1kGFlZBLK2xTjBlDdINUZ+QMt/zi
	NpMVV5ZL/urXWZLAhTbnao+xAHhhcrrakqC2Wr8mNG4nHI+Nb+WvVQnDnnYMcOJrTg+VZ/GxpFB
	DuqXOv7lLnUyOFHKdQU81gXUmXPntyQvs6HHLzRGkaYFITgZ1D422Wd/EfW0o/xlmW6CC+nLAi7
	J29WMzsg9bnNF+28jBkuzGtn4t/NXUQnSVLdypgcfJxaIjsxVImyUu2N4OAHzH0FKIIPStlF8GX
	LM25Zk=
X-Received: by 2002:a17:90b:37ce:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-35a01201dd9mr4941745a91.14.1773288988147;
        Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:27 -0700 (PDT)
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
Subject: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment
Date: Thu, 12 Mar 2026 13:15:33 +0900
Message-ID: <20260312041533.187553-7-akkun11.open@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33218-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17B7426D01A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the mismatched macro name in the #endif comment.

Fixes: 9f1bdd7e8221 ("dt-bindings: pinctrl: mediatek: add support for mt8188")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
index 2688da2f621f..66a451953838 100644
--- a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
@@ -1277,4 +1277,4 @@
 #define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
 #define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
 
-#endif /* __MEDIATEK_MT8188-PINFUNC_H */
+#endif /* __MEDIATEK_MT8188_PINFUNC_H */
-- 
2.53.0


