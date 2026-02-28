Return-Path: <linux-gpio+bounces-32339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCZ1MJRNomn31gQAu9opvQ
	(envelope-from <linux-gpio+bounces-32339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 03:06:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B61BFDD3
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 03:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6BF33087512
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 02:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F87F3081CA;
	Sat, 28 Feb 2026 02:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvYd7uBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF748296BD7
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 02:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244360; cv=none; b=KJDutnAFPEOS98iFDm85kUk6HpYif+yXStxtgQd+mGkGyDUjg6nRWnuDUZvY7vguSLU9MPIRl4Hidn1uvT+fSA8w42IjqoFc14xNRuy3+kEmF38NYliRTgr7GUX0/Kdvsu98g1+zVakiO12tWl+gVaeFQQNO3nCtH3CZESiaJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244360; c=relaxed/simple;
	bh=3LvDRNYHC8JXb+ZOKSkWIpa1vNpa9gAMbwjQidcNlvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOQxss28lSppqOaq4LS8pCQf8ojSQ3GffUevACESfhlmVhKpewymukCk2CCZkX1HGGfdopmy2CJre6Oe9AXcPPffm9E6nv6epAr0+hajH2sWye3wVTgupOfiHQnLRgqsj10cEZ1MSx5BwzB001DXgjVd7lvu9Aa7MXNzHPy3H4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvYd7uBA; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79863ab8478so27507757b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 18:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772244358; x=1772849158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30Ehmo1WiVUDTgRj0dd3CAg6+LsMd6/ZP+6jbf9kFuk=;
        b=RvYd7uBAkg1uuzhHeih0eQ2Cmv3LZBg+BoTgBT0xlrtkphXF0pqOBv18RuUH7oJ22A
         eT5qK7W3m6vuQ+xruWDMce5wWY1rjB+mk74MJtgAEtuP2g4aMMJnUOwOwdfT//d7C38q
         yj1xjU3nDZ+hWs7nd+soNTtHxS6GYkulvxJkud8+Z8tPRURrhatS5nndhYomVFs1avBn
         VXzV+df3LIkfAdUsCXuJjHKrmUUH4Iz5tnRGY1q2Nu3JEpxe8MvAGg2PPgWEaEYrKMgE
         WWT48YIibWeHxGBJaTq1uqfuekrkZkz6Ui4RNQCmvC29C+epytDuGJY0SXQJL+HTQ0zz
         4aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772244358; x=1772849158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30Ehmo1WiVUDTgRj0dd3CAg6+LsMd6/ZP+6jbf9kFuk=;
        b=FOvaAjVvnyXV/taLI3Gqd++j4rejhnFdOov67JwL8vu6vRj/nZLiTKzI0703EIRTXQ
         257hgx1Sg8bJBN6OBU+2ZPTSoa4/0Pw8qiXU+198UsFcTiaIa/7yO81p6aF5ZREDQFip
         H8Xq/k5vd1xk6zkGWdWZloeYkvvpqbBvYDYmzUgG7IUzun+BNOyLR2iiCU0KEW/iVjNO
         TjPY5v+hnzT0vUJ+qG1oPI93HmhVj5B9ZAftNtDRrmuA20+mCV1HVMPGclw4NCU7t7Fz
         uUnR7Kzg4H5lxx0ukzZ9FBKXe8dVf9H1iFSNLes8fxmzPV9jWfgLFXG6bBb9mwOcknsp
         ug5w==
X-Gm-Message-State: AOJu0YzfYEkzSyw5wdYNx5W9k0PzDbSHYMGsUxCKWxCu6hqgm/tUC7dB
	r2E8+gz+slhniBXNP9IeLgPeqMuos9SGAShRpVYKzWKylSo+69HqXqmY
X-Gm-Gg: ATEYQzyW470Z7lcDtq1aiMqh0V0qpFV5qbPg1/LkDf4RKkoWchVN7D+C9mHWtujQXKc
	LoCIDSJ1OhykIrfQ+70hcW2k1wm6pEyV9E/A+f3QIV8sK5AGHAQh8gJOWb0ZoYsEZ6MnWr/mgra
	gU1eKk3CXIEtLbFjozbVP68EF/y1VCCWnxMxVK2Ax8KF/eSxLczxx5M/ufYHtxtcBTLhaVWXfUH
	SmF2KiL2ZJvNPsepinQ5GkXpdU0wytD15DJ5BJndX458/+E7Jcnr049g+OCYKrBRDQ1NGaNlqPY
	ZBhT5SyxuB6ElmwQMiJQN+Fd039pZYjrQ5Jbu3r0oCXKEq3A54RQqkgY8HbZzyVWuD/ptLj2XOJ
	Fp1lafB6KockcvJaUJzF8SM3DRxfTLWMxbs6KIaqZrFroSTKE0UZJ5Nu21tex3zX9URjMS36Unx
	zv1jMqd/ii5WHaq2TRi4I4zXzSg9/mYxYvWeS/RdJeGlG9l4NjWhR07woZi9wnjjZi5W8pt0qW1
	2mxTovWIhgTLYUFebAyGa7E
X-Received: by 2002:a05:690c:dd3:b0:794:22cf:6d27 with SMTP id 00721157ae682-7988546925fmr46505057b3.10.1772244357932;
        Fri, 27 Feb 2026 18:05:57 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c8e568sm27564827b3.48.2026.02.27.18.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 18:05:57 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] pinctrl: cy8c95x0: Use proper error code
Date: Fri, 27 Feb 2026 20:05:38 -0600
Message-ID: <20260228020538.1103307-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32339-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D0B61BFDD3
X-Rspamd-Action: no action

The function cy8c95x0_irq_pending() returns type bool not an error code.

Use error code -EIO if cy8c95x0_irq_pending() fails.

Detected by Smatch:
drivers/pinctrl/pinctrl-cy8c95x0.c:1303 cy8c95x0_irq_setup() warn:
passing positive error code '1' to 'dev_err_probe'

Fixes: 014884732095b ("pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0d295ebc33d1..5796ce516788 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1300,7 +1300,7 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 	/* Read IRQ status register to clear all pending interrupts */
 	ret = cy8c95x0_irq_pending(chip, pending_irqs);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to clear irq status register\n");
+		return dev_err_probe(dev, -EIO, "failed to clear irq status register\n");
 
 	/* Mask all interrupts */
 	bitmap_fill(chip->irq_mask, MAX_LINE);
-- 
2.53.0


