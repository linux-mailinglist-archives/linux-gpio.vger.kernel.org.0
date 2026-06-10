Return-Path: <linux-gpio+bounces-38237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EfSnNJI7KWrwSgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:25:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634526683CF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BvJtK8uD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38237-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38237-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7A3312E1C7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA133368B6;
	Wed, 10 Jun 2026 10:20:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF13B38B1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:20:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086844; cv=none; b=b/eyn1/rrmbW/hh/gyE5Z1GAMrfghNBB3OmYZwDVPmjlf2J/zh8xS+Zl3n6kP4gBcApsBgOik+v4j2YtAu1VDQ19TILXbvW9LCBSXugPjeCJmHi70nV7Vvlr4gjDyIXcgGQ3ruWb74sQGNz5bTYAxITvZY44k2oBo7bBknF+Shc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086844; c=relaxed/simple;
	bh=k6r2KGx9VPLGPcD+NY3o4A7mZFjO7jK4Y+7LRvu/zoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RU47HCsVMI7jEPMP+3rZbp0xP+Wqjbk7l/F9DNw963yLBidmM6vVVlOBEn9snUrBufE6Tjif5O+hQxUSN+apKutEDRsh6C4OgaBkUPhJjs9VVcYOZVtJVa+udLgDOk6l4iGrHwx7lbPAsbBJvbJmqpRCYrv/u4104DND6M6akA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvJtK8uD; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36baec934b6so4282851a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086843; x=1781691643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=BvJtK8uDorMhhwNj+p2taFv+em2FAaVu/h5NFccQuc+fdTJ1wktYOYxqPYb/94vnQQ
         2wKwRYAyLh7HyuvP4abXZzGd6/B1rNVUR4vKgQEvLpqJeSK1RdZkt/5HypAPxDFeNhae
         J2J7GIhT8vKzpzSiBjCRJVYe19Ufxq+ZDuNbeDxhOLzlnhB+RA6H6Oi68pq0CRowGC2D
         lvxsGye6ArRKuURnG5C0xYAsTqjmuAmG2A0cf/Z0aQSHtILk1bjDwy4Xd9oFiDZSXqlN
         vDWBjMu7Q0FEj5B+UC0xY5mn/2NfInqOisfeeJpzmYZ5D/ZQO4RqbxdlJ+vEnqk7BU5G
         Im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086843; x=1781691643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=lPzCmDAPxPlUCZDpc6DSASQkE3DbOv9E9fzYgmgYzx6zrKEgmG7Ukz9X7LMuqdn+0W
         4fG7VsYGvGzvvh6XFw3z9N85cHyOGkGUBQ1yilp75T4NjXCpCjFo02LdlBQ1cIWtiApb
         bFMPYh7i7HJTzHSeSfrPhoSkdUxYbfgFpw5DmKZLDvdJ29EWJVdT0MBVJOTDVeZUd30e
         9axMNv+m92gsr34FWgwoSli4k5VtK4kVsUMuslMPMj/5KpliKPri5RjKqxOGggNoqmgs
         G3jr3S1GQTlJEzZcyY0fVloSvdcypIPmWNbCJxW77SHN9Pxtgw/0115OGAjELzB6dEPu
         8CXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Z7EU5wXFzjrhqyYISE3uVmU+z6FpTOOuh92I1bs9v+t0NHblJRoZzHBtFR73qqwjqLOvqSYsHRX/d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7BatqvABGbfPs6ltbYyIaqJDZQMca1UelhPbV5T78JHq4XiZT
	v87BWnK0i8vvmqdOAbsHqi6ksxN3x9fXlvXxf3OrXzGWzo5pd+xk4FIp
X-Gm-Gg: Acq92OHpfaErXWqDf2cXeJjblLKiO3+aNALdftpSybLphM+5wDOKUS0w4+5euS9f0nH
	l6nGGGh6dlSeNHNdTghsZ3j0KN1H5HJMgv4DAKcfoccpmetk4uyw9MwtPHckv3HNZ4Cls8VP2uI
	dq1GAsjm9uo7RxTODIZhQX2/85tZ2CJFS4ZdbCSU8rHCnSF7WPSTHFvjzKINAL5v78zvTJAGyi5
	ubusIskQgH3OP/nt2ttbSGhYcgkpjKfnteQEcxOdJbixZDPfipt0x5Icx9xj9CHd5DrvfVHaZq1
	Wk7EjJXAuIs08AkoXwxhgKkgbW3P6slveWNI2imYTmD9mM87Pww2tp11tdxjRK5quTCZ+HUpEFA
	cFxVB5Wkf4UBw6h/VTx7nON2VPzHmnheBbrDZnve6eqKsnYSZxi1n/hAxaU7dMLR0Kng8UJmisU
	37/D7poHRktGTJCaI51sHm343x7RafGfSN44pCw359WVLOsd9XXMS6qiPneU9Z8eJzVUQy
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr220303605ad.7.1781086842787;
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:12 +0700
Message-ID: <20260610102021.83273-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38237-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 634526683CF

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..2a20fa5dba49 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -292,28 +292,24 @@ int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe)
 {
 	int i;
 
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	for (i = 0; i < afe->irqs_size; ++i) {
 		if (afe->irqs[i].irq_occupyed == 0) {
 			afe->irqs[i].irq_occupyed = 1;
-			mutex_unlock(&afe->irq_alloc_lock);
 			return i;
 		}
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return afe->irqs_size;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_acquire);
 
 int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id)
 {
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	if (irq_id >= 0 && irq_id < afe->irqs_size) {
 		afe->irqs[irq_id].irq_occupyed = 0;
-		mutex_unlock(&afe->irq_alloc_lock);
 		return 0;
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_release);
-- 
2.43.0


