Return-Path: <linux-gpio+bounces-31685-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDuoJHaRkGlxbQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31685-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 16:15:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC013C4AD
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 16:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 707AD300D684
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED082C21F2;
	Sat, 14 Feb 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe2dBOGv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9002D739B
	for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771082098; cv=none; b=XJvzf79P9qqzX/M1cmzGStvzCtkvnAIusnkMDV/OHZ3oy2jT9RxLxDdj4dnpx/6+XDz3FmseR8s0Kti2c4vjXBiI3DQ3xX7bTuw9p/TUaiTui6/dWi0GFw2nGWFyVTXz/pp9eQMHisCa3JoknkZznBzbuVyjuFZWAoi9GL96IHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771082098; c=relaxed/simple;
	bh=j7+0sOkT9WWGS00c8IXnQ4FGR8OFxtaf8shZQPdxsVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=knQo0m8h6bYQCOBU2cp0fskefdnGZVvTqVLy7f4zIMto9MyDewer5uVoR+0/5gZIdF6YuTEPLIFam1lJ09T22+pGlIHamNeHNhH/dXnXdTeD9W9aJ5rZladYA9HfkEMMEaKYpWBDLPR1MSoQce7+SrKoAlWorvWGogdveYWx8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe2dBOGv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso8731255ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 07:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771082096; x=1771686896; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFlCYjmJEx3H5F4EpZUy4IhKexss8YRZJlOCQ8/VG0c=;
        b=Xe2dBOGvNG3BJ4J+KVZuZiyB081/oAZ605Wt/wO4Re1MphX0znyxfawE20qiLp0mY/
         pkZp331Nv/l3Hio2/zYybcxtX9eNGrp1ZxKCfJ5LwCLN9ZXuEMTbg6ZBaj149VFIy1KJ
         pbu/2UatZDtJxIsq3ruVG5OlRFdDP9kR8o8AAUvvcQ5yumDXiM80MLGZgrqYUc9TyHK4
         7/qTR2sPTu1/0V/c0PBJwGDvkJTvZAsUd78uCQOmByMyQnfKeytHelJz/tAoX9tci0iU
         9njpaobRMnbXiom6ew1mz6GeEPrS/9bgnCO8DZBPNHv/htiAL6STGygGgM5Yk4z/Akg7
         ZU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771082096; x=1771686896;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFlCYjmJEx3H5F4EpZUy4IhKexss8YRZJlOCQ8/VG0c=;
        b=MkJkkC+73THOM1JJ9B4mUv93my5wCGYCofD3O8bwJb5icX+fItCTNEkrt0VPOIDhAA
         h+2PlGHG39y6AULtcNtKC0mE3sztAkHpuv66KqZORRmmZBaYSC4yIyKfUiEE+nNV0IWE
         aHPs/+DHBjrVbSGV8BK8sFI3gpUwLVDpqnngL3/0Mzmohh9tFtsILx3oEZwsdeLG8+Cf
         Xc2RGZpjoTdyQjH0lh1htB/C/ivRqkQhwcQiHUC4cFyl8L6qqhXancgUQIWYlGgudaXY
         YjRgSWuqJYnjsqU1eLIwrVbRP3AzwK+iUaQhamZhS6T9sFJy+30jKa5Vy4PaH7Kc5NQQ
         WS8g==
X-Gm-Message-State: AOJu0Yw4UsG+2DhF8+21GpDutDLpXntqc4wUOidGX2wUpV/ddwPECvWW
	gNZ0Y7wcz89KvqoMoy4IkfiYm4iYzunhGYDWrNRUVuU3ZHkRPao/Aj7P
X-Gm-Gg: AZuq6aLl0MmKztnZqixK1+DGO2c+TAQI+uAK1l7U38QqUfnFuanR36dMrN8aZlSXi9N
	fXErS9+Av2el6a2ZfBV3Otk7eJi1sdz4UId3BDE1/4uUZaqJoABfY5t6oq64VpK7oQqdxyzXErv
	T3vjjW0T/kZl3LEgjCeJ+BH8CK4i8B0Fc4mCaaVotxGM8q6WMH3qXr9jM+OyeT5BZ8fYiMT9Eiv
	swuUG0JTOGO10HfLZ4SmbvG51Ub+9hIm0kJWj6ik+AQBUmsgcxYhseYyhMIaR62+aGV6aaY5pXj
	RTDexOoLGF0tcjIGqWEwK5jTyiXuBVfzR991C0tpJwlV13IEVlFOAOAda5b2ZS+m4j1Hk7TNcr0
	guOLQJeLvuUZ+SpqVXQ9jWf/fwiRxtZ98kIcOVs8LnI65nLVbyRHljhR3RzdToM6V1fmY4PL8TG
	p14gdNWY8kv2xCSviTWFrPaO2ukt4wAIIDsm0d4l+zoyS+FAnI
X-Received: by 2002:a17:902:fc4c:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ab5053ea30mr61000825ad.27.1771082095968;
        Sat, 14 Feb 2026 07:14:55 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1d1a:b046:652e:68c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaeb759sm20078185ad.83.2026.02.14.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 07:14:55 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 14 Feb 2026 23:14:51 +0800
Subject: [PATCH] pinctrl: pinconf-generic: Fix memory leak in
 pinconf_generic_parse_dt_config()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-pinconf-v1-1-e515d35a153b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGqRkGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3YLMvOT8vDTd5KRkw1RjQwMLi7Q0JaDqgqLUtMwKsEnRsbW1AHY
 MC9pZAAAA
X-Change-ID: 20260214-pinconf-cbc1e31088ff
To: Linus Walleij <linusw@kernel.org>, 
 Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771082094; l=1365;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=j7+0sOkT9WWGS00c8IXnQ4FGR8OFxtaf8shZQPdxsVs=;
 b=mHOXFHQH1m2Q7FSfbOPl5Son79LDwW0mASK8a+ePQBtxvPeEUaBrsMReGRujtAL0G/JSPK1OK
 ySapet9eht/DWKK4Ybv8S05w5ydaFl8xSP97lYZppXuNmTQ0yDq6hUk
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31685-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 14FC013C4AD
X-Rspamd-Action: no action

In pinconf_generic_parse_dt_config(), if parse_dt_cfg() fails, it returns
directly. This bypasses the cleanup logic and results in a memory leak of
the cfg buffer.

Fix this by jumping to the out label on failure, ensuring kfree(cfg) is
called before returning.

Fixes: 90a18c512884 ("pinctrl: pinconf-generic: Handle string values for generic properties")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/pinconf-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 94b1d057197c..2b030bd0e6ad 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -351,13 +351,13 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 
 	ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
 	if (ret)
-		return ret;
+		goto out;
 	if (pctldev && pctldev->desc->num_custom_params &&
 		pctldev->desc->custom_params) {
 		ret = parse_dt_cfg(np, pctldev->desc->custom_params,
 				   pctldev->desc->num_custom_params, cfg, &ncfg);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	/* no configs found at all */

---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260214-pinconf-cbc1e31088ff

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


