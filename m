Return-Path: <linux-gpio+bounces-38451-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YuJ3BnqnL2qOEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38451-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:19:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 739816841E7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:19:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Inrh4Zf4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38451-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38451-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB5FD301226F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D608D3BBA1A;
	Mon, 15 Jun 2026 07:19:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F583054EF
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:19:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507956; cv=none; b=BY5hgdWXSTzMnNb5ELnvjSYvtQEHCZNnG5nJuY9L3XV7kbVPX1VH4h30YRofyxVarcoNdDbgIKiqM9VBq8N3LED5x2QIQdUrmNqBv9XOhTjpCDxCwYa8iL6THBovd6zn/dVN/tS9TYInJSn0rP2yqCqYLZzDTehiQW9UQnXzIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507956; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaCP8QyJmLUra7mQhkBdTH5XzX7Ntd6z1DkNFrEl6tvicLI1xMTNIGhzA9+kICql2Cyue7kAzv1s3NlrLDEIji/pTcLfJqggviIlpC5at8FCiA25oLX7Aq29nbJ+ClXIwZEiBalWt9YAPAXH9Lypus2D4IZt5GhfGUdPGr0oytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inrh4Zf4; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b64c8311so30503625e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507954; x=1782112754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=Inrh4Zf4y7O+QAIdZpvX0SiwfgcLdYfay8y6BlBidsFHvweIT3uzAk+iZ7rfrRnVOv
         xW+rRlt4ReycdKZMu8ZA7YdssVDNxALttd0OOrdDg/tvm+iS2aa0VKLQputsp6v/bjwh
         ymRKhPUeBBFd5FV566zYj0/or0s3mkzDBQpzB865uyg5oYB8k0IQa7aRDUpbBnU1ocaV
         NPYisbUfO+5RoLIyVJlFjdSw6fSuhBwvVfpHjS/hN0McnqX2+NqHqZswy6LYujuindkg
         f1cpD2odieixsU9XwkZgKwj8zza9dfr+XL1wk927FbSgwDBjMbw3YcJpRaIknBuVjnPk
         wvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507954; x=1782112754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=RW/ZbBxRE2J7wVesPHGyekQEQ5klbDgxe4rdfkdcWoU4euwHqAmKo4FFOMaHW/F/fS
         KijAtMdRRJcnUcrMoI3sXh6PvtguzRki9/B8FeoBnEyGuc65JDRnbTCBGmEI4frZhfiG
         JZULNqLR9kA/4sve1b1cgLYykNnQCcrKSpcJmglcr1z0URHvrJ723KJpV4IDK7Csh8eY
         JnYBK5G4OrOPFWyJtd7U9IXmHbZgaKTpJxaeYJHt+ON4alTCybVH9zzjekFW4Ltqih4y
         jKM7pdB5WWDYTvvKeeYWWoUAuDjsxDwPrm6NpiPGnqc13H9eEkHPJiropEm0UcmKFMvZ
         +Rfg==
X-Forwarded-Encrypted: i=1; AFNElJ/YQVAbyJjPAhOt/naunryxXk6pIpKMpnEqKS3ruaX41A7xY0iC7jZkAV3qhX7GePdL906+7O7PP/xm@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrTFo6pV5msOH1kdDHpJ3U9jvkOttO8ofm6+hVjAKH8tGj374
	rTjE3ouaEIMnIncxiutHt1S2rgL5xtpiZ78LTMFo5zc6sIcwOgnUxHEb
X-Gm-Gg: Acq92OESDAJbUmkSXqRGCjUxqz8WmE3gXsV+ONR1EaPW3dWoAlXSecPRCiIdvx/qToi
	F1p5fOl9KnbV6qqTpPddGUaquz2E0B0Jk2huf/WpdBGTTM8ETZXhbMESl/PFS9kKIJKr4NOl+cP
	bFIm4aHlgvWhliV9Chdv2ygdQPr6iMC9xaKSd6s7TBkjxY9Y14aaPB2dZRc2XfEiLFZgiS78Zvc
	1n+Vzgr5iQ3aZQw8slmxN03/bdGmLQbek/IhtY369BNWMxPl4WWXcmGSxwYksIKqD8q45SF8nSX
	YDNtDabmm/XllNA4fEQK4h9xVNwD8hAt+Wj+7h9qtJ4rqLYk/ID4Y13/bkQQjWscdUSrRZzZIgQ
	6SGsHJb8GJQAmz490v6+n2kHDMOrELbDN6faEQlElf4bjoOBqHkr2VvZcrJDUY1WI7T8SxL9BlB
	FId89WCC69No70Ns8O
X-Received: by 2002:a05:600d:8486:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490ec4fc0c4mr117642565e9.25.1781507953725;
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 15 Jun 2026 09:16:08 +0200
Message-ID: <20260615071836.362883-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38451-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:parent.f@gmail.com,m:val@packett.cool,m:l.scorcia@gmail.com,m:angelogioacchino.delregno@collabora.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:parentf@gmail.com,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 739816841E7

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


