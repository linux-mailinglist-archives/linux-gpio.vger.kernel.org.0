Return-Path: <linux-gpio+bounces-33213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG0BOhg+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73D26CFD7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0195B3011515
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB3239656A;
	Thu, 12 Mar 2026 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juJB3t64"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A6395D8E
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288970; cv=none; b=oCZOCKmqqJ2VHxvixOdc+3BEAkBd0F87dtFP5jT2iF23GP2/YYlTOPbqqLJ+fNFf66KzcH2q5X2gHowVOnc6j8HO/RZ6MkETd8C9xhzD4dviAwxvy23K0tgZvNd03ZVD2ssi14p9/gwCZJxu+KY5qmrffP/o+Q/bgvq1G5P7qyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288970; c=relaxed/simple;
	bh=AHXg6HruFbieHArn7t6fTB9MRosgoYU7UzCl4Y+pnWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGJqTZW4SUsD8isNwYgwQTU/7ThB4+tbVx9+3bEOcufhvDfU2OZX7tn0tl5VEuMipFh425CCmwg7dCSBydsU/y8chlrKLjrn/fLcjQmBz3Ear2EiBdSBi6t9glJIdNzQ7UC9GQMoPnrnOisDTHf6yZqXDICFAm+RP0zFE+/XSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juJB3t64; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35a08ce49dcso502269a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288969; x=1773893769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=juJB3t64VwHZ/U0T3USMqVWH5K7Fa1uZ7wyzfuy+m2/IIaXAxU/iZgmBeUG7XdqltG
         qTULoSLHZVfCQ+3PPexaftwJ+dms2aLZPVFMCihkgL2+5wb0gKOVFsJncP2tEhjC0dCY
         bN56RHTfPvw7+aBZjogylIDT/JYsX2KrqS7uOKobCS/ZiO1TW/iLnbFKijkIkzuqNFkF
         kuvWgwZEsNCCelGRfPwp8hqUn5Aw4FXjgc+anxQ2hl7A8KVo9UFu7TVf5C043lpO4yIA
         2XnHaGd20D3qmZGDWG8e1g2FTyl7+6kPpcNkEpNDDKjW9pfyJQ65+8yMK3wCldCkKz31
         fZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288969; x=1773893769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=DACbKoEoM33ZG7vkVc/fi1+utORIUlQtvtBFjRYfGxA4gjlQTspKdmRq/k+vT7IPNI
         pSO+XCNYZ53+a09PY1OIW/ubBaPpiquyRanscFSTZfImglEAaNpvJg157wCzV1jXbtUT
         T2pul79R0JgHNzILvwR3S2cIzG6YG2TlQl7/NlK5rIehe/uR5eKYwK4PTk8Tz7+nGUFV
         yI6XpQBaMbIPq9jjepdGvGMpbO3OAPqKmbic9OEhPHoAn7FsiXh5G05Ecu3GgRKyJfKD
         qazK6X42lmTxpEp620REAWxQrLNAyhuzP4p7eRDGfkO/zJNjcS5hiUPJ0dc48WuzYeoC
         ZKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgIpbxXhvpRfnudjmRvBzne85isNaJBfLDpKD1JvPxkFqj+v41L30A4ChdhsmTcPQw7n9TBkigPVZi@vger.kernel.org
X-Gm-Message-State: AOJu0YwCar7h7smmGhVBJfuL5M/Yc3Exll6MLtu114Y8D4xnh7IbhB8v
	3QW7A6Cjn+/KJW+NNor9SPdU5oBm7y8IoQOBlArSsAmn1cRbduJD3hQS
X-Gm-Gg: ATEYQzwxkjA9r7Rkv8xWnQmg2Q5G++Ea8y8gOrxqFZnT3aKufHOsLiPOUlq99Ib/AZI
	9JljS/l5f89IajAFDu1ot+LuCR90cllzpTQjj9httXOKOOsgufjLsY/B8VAVTust2KWWIgmsiZp
	y88q8/noujXHaAXBpU/Y0vctPH6kC7EmgvZsFn0xQYfFYYpKK9bAIOwUpJXz2A2YvRXmfD+YUT9
	6D9XahmjE+EsG2R0d9PJe/RzIEGzdcAFuZOzGC0V6TRazl6YzWPP7yqhnlUmpmkhDZpxmk/zmyT
	P2730gzNm/c7ghAYq8FuwElQKRoZ+fW860TShQ4BjWbQARz5jl0J+pgv0936RBRkXQgYLssrh2O
	FQhUtY5Ha9igR3XNGsq/rXPe4a8Tju364aI5czegCusIQp/Lm0St2Qvsgna2ZzFRIVBqWJI90z9
	YzvCvrMuBqxrrHS0GFa3tk46bH5i1NtjKkJMAJiv3/mD6rPJmQW8sZhLYx9Rpimmg2RG6YXX5VI
	gHVCPk=
X-Received: by 2002:a17:90a:ec85:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-35a012cbadfmr4484568a91.28.1773288968665;
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:28 +0900
Message-ID: <20260312041533.187553-2-akkun11.open@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33213-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.152.170.8:email]
X-Rspamd-Queue-Id: EC73D26CFD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio-ranges in the MT6795 pinctrl node were incorrectly defined,
therefore, GPIO196 cannot be used.
Correct the range count to match the driver.

Fixes: b888886a4536 ("arm64: dts: mediatek: mt6795: Add pinctrl controller node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index ae2aaa51c9ad..134cfa77e3b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -371,7 +371,7 @@ pio: pinctrl@10005000 {
 				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 196>;
+			gpio-ranges = <&pio 0 0 197>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-- 
2.53.0


