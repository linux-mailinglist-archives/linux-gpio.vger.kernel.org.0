Return-Path: <linux-gpio+bounces-33446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DCcpCWE8t2leOgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 00:10:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D094292F58
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 00:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EFB30166E4
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2026 23:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F03E289E06;
	Sun, 15 Mar 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y65crVlR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6ED26738C
	for <linux-gpio@vger.kernel.org>; Sun, 15 Mar 2026 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773616219; cv=none; b=RcZZ5B9aKdGtr9lz7PaiSM6l1PNrXWKvoD9ngsmCT2A3WFlxtKLDuxyo3cm2cQ5ap0qeJaLEcqE6tIrYvW74oqCVfjGtTJziwDUpvwSHurm/Uk4/dC2XoywS8RDF4pAdV7sFnOzx/9Vr+iwGk0j8Rw1bfYsdVfoD9zy550klvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773616219; c=relaxed/simple;
	bh=fLloq4+x8At7hQovZLrmBNB1XxjUka1iComkdFuv2dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezMQwgL9Cmm4/Nisem1B4r//iPYsczFDd2GpySoAGwvWJM7v8lTdeBXyxRhoEl0j0wJB/vFEqe0m84OWZLRxw28B3s352Htu/Mku63XGd4urgnrb1LCNHVK87jke45iHi9D3EBYT+aRpexmGaQTaiVrXii0PKU/wowa7xyXjNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y65crVlR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2534398a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Mar 2026 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773616218; x=1774221018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEWsD2Q8KtTGsEAWmFS/iNWR9RG+AhbQpSE8inJiSCs=;
        b=Y65crVlR74PkKRkO8mL4eeqPXhF782C26loL0teMr+PV7x/KxM9veSRd4A/9JLYNfe
         PY8IjmzJUDAx+nDk5krQVFaYqZCtxJ85cIyI7eVuLXQV1mR7wtqp0+EYxgFTs4MRgMmz
         bQoELgCedf0pews2p8+Srzggs5OO/UAk/wpRAMBr5XYXO/xzsf6peOhBKbxGpvV5girZ
         ATu8+/9gXuvtpkQn0J/Vdj+S9tnwZr0XyTfnkOAJNtZytlUwF9ymDAdhzyF2ublQR9PZ
         Ds7mMvctffhKb6RZqbK73noFjqDtCQm1tEB3TERpt2L3hqaP+2X1ssPaWh1YK28Jeilv
         KDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773616218; x=1774221018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEWsD2Q8KtTGsEAWmFS/iNWR9RG+AhbQpSE8inJiSCs=;
        b=qO7vZhZ4mSMDiVeSJWEVwC/xUBwdTVETnmwwpgAc7assLv28h3HY7BaVorBf1EISri
         wIWlp4CNyPjgNsutpX+7kNaxi9mYBjTWcjXa52I3bW3j0/0mHwkHY5S3OYKvhr43bZ3r
         Q2E9nfYTBkrkSbi1evRT3ShzxjLBtyQASgmNf3Yr4nmiMqJTL6zvEM6khm/alrg82Rm9
         tDPwsBMxJa1sTsB+tbC2Z7KNrZTZgO3EfSrc+snyeVBNFjYXXkyVk5AX7wr52Q9gtnXj
         CnX8DMLZzoypNwDYkPDxZ2sT//4x/dGADFzqIWg6Q1i0k5+ijmgkn0+SqW519fFr3x7w
         ni2g==
X-Forwarded-Encrypted: i=1; AJvYcCVBaROSOV8188htHkZ+ravG+8zdOtiUVhxay495wftA2Ryt+ZKDdfl8henv1HZPwGJ0PT4wMVDyVzCd@vger.kernel.org
X-Gm-Message-State: AOJu0YxSW81dJRZQ+gd0Zty6u47AZgtk8HVvy3gQxqUTt18+XGBM/SuM
	R3BljrdQhsVA5pl4s5F/4PxO/zIZR7lWDmZQY2ZRqzi4sRWL2MsYr2+l
X-Gm-Gg: ATEYQzzeSqwiuJho2uGQTUdBMt7GNYucUHVPsHzoyPtDiSk8StBfn86Pnl0JuTfPEaw
	dRFC3FPwy0gYA6zfnltxVtGbwx49bU33AH5ZFE01svkETqxVcxfShR6ql/T0VuYKq2zUiFFYdxm
	R9C4+L2ut8EbB3jBNGQTmc4VP/5GmsuW725tDDN7K890OYJHUVvhe8+mMMhQJkYTgdUtR8iERyt
	9HGjxc/ZDvlwviPbquNGVl3UC/pILW9p1nB4fzPZr4WkXfcONTxai+06pDTslYtJMJIe+R9jwsp
	63ZJTZb0CM1ll2+xXHm57W5uQWFBqXu6IyUOvHORCG0+ml4jGsgbCTEeXUWBRc4A/mzpVuAlEuh
	QpFzUGJ2K+ZOsqTEvzH/jOwhPFSWIetBKDRr87mb7Cz3fh3ng5HsfOarLPJ8SUsQMlBaux25ksJ
	5A0kvLBK/t3P9gnG6OgcKXCpped6h+4lmeUuK3r3tm+6T3wYAYN+4JjM4=
X-Received: by 2002:a17:90a:da90:b0:35b:91e1:e110 with SMTP id 98e67ed59e1d1-35b91e1e214mr3925378a91.20.1773616218024;
        Sun, 15 Mar 2026 16:10:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm1399177a91.8.2026.03.15.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:10:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: tegra: use flexible array member for array
Date: Sun, 15 Mar 2026 16:10:00 -0700
Message-ID: <20260315231000.50543-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33446-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D094292F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocation slightly by removing a kcalloc call and using
struct_size.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 9 ++-------
 drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 11ecbd6a9b2a..b09d7675a33a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -832,19 +832,14 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int fn, gn, gfn;
 	unsigned long backup_regs_size = 0;
 
-	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
+	pmx = devm_kzalloc(&pdev->dev,
+			struct_size(pmx, pingroup_configs, soc_data->ngroups), GFP_KERNEL);
 	if (!pmx)
 		return -ENOMEM;
 
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
 
-	pmx->pingroup_configs = devm_kcalloc(&pdev->dev,
-					     pmx->soc->ngroups, sizeof(*pmx->pingroup_configs),
-					     GFP_KERNEL);
-	if (!pmx->pingroup_configs)
-		return -ENOMEM;
-
 	/*
 	 * Each mux group will appear in 4 functions' list of groups.
 	 * This over-allocates slightly, since not all groups are mux groups.
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index bc7b70913b89..c74272c82828 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -26,7 +26,7 @@ struct tegra_pmx {
 	void __iomem **regs;
 	u32 *backup_regs;
 	/* Array of size soc->ngroups */
-	struct tegra_pingroup_config *pingroup_configs;
+	struct tegra_pingroup_config pingroup_configs[];
 };
 
 enum tegra_pinconf_param {
-- 
2.53.0


