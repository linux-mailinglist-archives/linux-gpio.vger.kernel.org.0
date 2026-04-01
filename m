Return-Path: <linux-gpio+bounces-34520-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEmtArpozGlXSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34520-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:37:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9C737328F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DA84302632C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5D41DD0D4;
	Wed,  1 Apr 2026 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaDxGbax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376841C84A2
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003785; cv=none; b=ZpYIi9B6jot/DLC/dlqd0MaYMZOSMFTSZxDNdDkymu0iRNbIiN+bZ+1uFLAqf8CJFT+gbXHM4rL7q8bGp6KzYRVhIQqGK39CUXd6jS/bSIc7VNCLuFIPttohQyBwQ6/bhUmI229SPeZuBTqMPYhQCRhpwR5LfY3sK9uA6hbI3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003785; c=relaxed/simple;
	bh=rlOwvtt6f3Z1BcZUx9uEMq0VrEm/GZdnwYd1pS7N/9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmBWSnjst2SXov4Q07nqgGFAIjUgilVb0c7DAb5dEj6TRzo/wg22lsEGO/Irpj4DzLZwruhDb1/4GPcBDyFNqwb5MzwVthbaG8sIra+25uE99SkNJZzOB424pga5+x+1yg6MEiJlkWQCCbenDYCm8WOe+5pB6IVQe8l9l8LjdR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaDxGbax; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab077e3f32so26603055ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003783; x=1775608583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47uua8HSMbLz1yUa2gyHVcotrdKJh4LwpMJOOpPOG6k=;
        b=qaDxGbaxxG6SP4cPpASMtoAxdTcCIWRtZh9uhCj381l6PMgMa2Nh69zBisZTOoZI+s
         jg2C4J5l7J23JTo0EYbSThihs5nFJ6NgSj4aH3FYfBmHXrwJqXRjR/a7nPEks5JAjVVp
         458KFXtHqEZDi36xxnjtUWz2lbeITXHPsltB+z9PpIAa3Hv/2sFkT7rSVl4xjwCRsszN
         WxqX6dVl0s+ET/n2HICaXIc6Jk4UIjU+Lp8rOxLfeCK2WTKHlvc0gTOxfj7Xl8K0Vxb1
         TD1Q6Nw0cE5I44jFSD+YDP4ElJj+JyqjIcRgoBqjGgZbs9tF52OBWu099GLImp5zK/Es
         vNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003783; x=1775608583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47uua8HSMbLz1yUa2gyHVcotrdKJh4LwpMJOOpPOG6k=;
        b=qTEIVIkoq25Ef4eIlAZQNXGBy0uPx/qiycWD15pDU7sN5Fzo9F3xMtOMg1Tb0Mf9H0
         B3aMvfTeFNJWJLo1xGvpX45z/jfJlNba+U/I96zMk3SY2NEDAL+q+X3IDwGLop37AyhE
         9plOwpgMAAbLXvgF+Yo+M33VK/Jsd+mZxIsF3MUcVBTRsjnixAaOA+j6kUfKxVx/YgOP
         eY0ONQwxZtEvYe/Nm+f3h28FEODcVwEcqbuca64buMMZTRmbXXrlRwESprVhSW6mtCMK
         lgnrbl/ayqATPhk0soasI/6iOXPFH8t3/8BqJ9LiE4rj1JmwbQQzuPm6Nyhm2KxAQ05O
         6GbA==
X-Gm-Message-State: AOJu0YxnhvAsC5taMwpwSLC1xSGiS2ri3kUvIr3MHWq2OiRjlVMhLLgI
	aMnSIPo3zFCQKrhm+EdfhNIEd5Uw3QWCDVEByIbRBPM/zjfs0zGXrIGc
X-Gm-Gg: ATEYQzyW1vB8YqoUMzk2OwIgZUrwJ2r+YNZsPo2syT1e6uDZBOYdxTXbTv1J6Zehkbq
	0grwEaEJ7Y8By8TZGlCXXPvfeGx5z9OCvpeYhKAc1LUODlPA0r73C4PY7Gczfma3kD2SDaoSEja
	BNoHgeriesJSacfbDX3nfkmbWGk5lbzJWJVVNsBssuffopojC42X0so4fjJeZdbWcMl4DR3woo0
	LawU8BhvHv97qwuohAjviqZtD4dxFbR1+fJ0c6mJ+LXQCzerOs+QxE/I9zgLbbSc/KWmGgbfNw1
	RaLjw3J7j7+R2rMkoHchjWCDebacx1zNQspTCz0Z1C0SEryzmuot5UJHlPZqB7zUEAMdwVMHAy+
	uqtV/k/JSh9rcsiySexI+SPlZQLr/OWIMiOVI2RpLDHd5ZkVyn1KDM0EAA/eoS2DDOa6vjXFN9w
	oyPsD/uPOqteN4nL87/c3yaNM=
X-Received: by 2002:a17:903:906:b0:2b0:775f:febf with SMTP id d9443c01a7336-2b269cdd077mr11500025ad.40.1775003783502;
        Tue, 31 Mar 2026 17:36:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm130207665ad.59.2026.03.31.17.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:36:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
Date: Wed,  1 Apr 2026 08:35:49 +0800
Message-ID: <20260401003552.363205-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401003552.363205-1-inochiama@gmail.com>
References: <20260401003552.363205-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gentoo.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34520-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E9C737328F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the SoC model in module description string, it should be
sg2042 instead of sg2002.

Fixes: 1e67465d3b74 ("pinctrl: sophgo: add support for SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-sg2042.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
index 185305ac897d..8dba12e122a4 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
@@ -651,5 +651,5 @@ static struct platform_driver sg2042_pinctrl_driver = {
 };
 module_platform_driver(sg2042_pinctrl_driver);
 
-MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_DESCRIPTION("Pinctrl driver for the SG2042 series SoC");
 MODULE_LICENSE("GPL");
-- 
2.53.0


