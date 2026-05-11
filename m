Return-Path: <linux-gpio+bounces-36600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAT1Ff8hAmocoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:37:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 66906514873
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2F34302BD05
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308E3472784;
	Mon, 11 May 2026 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAIwRhV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ECF47D936
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524214; cv=none; b=D0DnwpldVln8JIqN/e+hiOx+O78ihuLQouJn1bLEsLbKajReKAFb48bllzEObTWM5Ewd6m+kPdmud5m4Kr59hoZXYsa+2KxluaCAHTWdnKx0xmk8Mtm9ulC4bzAZRsJc5D8xTDeF7xgB4ElhMe36wDYIOOGTlbtQxmQ6MkVPpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524214; c=relaxed/simple;
	bh=FJb2k54HWC6RFZRECpiePIMkJQi06n5ZXkGBytSRt28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CKH2MUcik0aneqfIhX9JvTOeogC6Lu2UCNeTcvTv3QBua0HNKXVGE20s7qiCeGPCCe6b1/PqFmsie1FDliW1fzgr+D94Dqzh49seg4xXPhcuG4A6+vDPn6MonJ9RpfK64rDBlqNEkmlZX23JiP3p/0aIeHj5sg35qgEv/rEsSwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAIwRhV7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso1838903a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524212; x=1779129012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OY+ypXJEiq1cE5wHUAR3o/Pxpxd3IRXNAos4tZp/uec=;
        b=RAIwRhV7/arOxs/9lrYUJGhy4psNgjkuoUZUIgM6fqqtLYjN6dLGoBQHwVu5pB30FA
         l1XOf1cf//rYmiW2wjyvfloABBpl23fDI8jfGvAGn/JMLQCfy73H33M/XE5JaqfHgeJg
         RvUlvHNON/UziysX8Y1Mf/drGx/bLj/uNTui3+vRcnDkxaVUiWzuUiGPvHQ1oZnyq2SX
         6NSEkdVOPpNGQqCHVxvQGQ+oMs06Eq2DS2bZ8MCrN72oncl8iFWlmprt1K730ZV5vXeC
         KazbsiZVdIC6mBHSqc3+hUlpzUAEUkWGMFsucoPwpYL1Hlr24aiU/hYg5ZKtekZPDUHM
         jVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524212; x=1779129012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY+ypXJEiq1cE5wHUAR3o/Pxpxd3IRXNAos4tZp/uec=;
        b=BDk62fneeSTnvyT24ivGOPx8JYQk8aT0vnBqALoXchEx/K7dDFg6iB3CKKcCCNqpWG
         4jfGzOV5xzYbyCfwGNruduwwlxwzztU1CsZAnhLAmn18Uh1pb6sMvhg/EjilFeTjK6X2
         +7njiNN62xXjy3tE2Ka83OxEAoRL3qPKukkr+63zzy3adP8czVseKMd5SGzPzEyGAUjv
         wNTCVOeNpmv3AMH3Q6Dd+sOvFhMhuzuV9adBxUOjmesQC9F66/lQD0G9JvTjUkXSJO2x
         ShZYfMeFZvjnMdVDAUbwaBfvDrXVBevzYyg/K3LViqck2l5ez7fuc+LeiZrEy0/mxAod
         ylmA==
X-Gm-Message-State: AOJu0YzCUKDN71iPluTaqJ31NArHax0DucREeczf3dTzQpiJ1aHIUAoD
	76+q/BvuTFB0hy29AbtBTGPw9Up7Iq+zpsIEtsvLKI3gJPC95IPkqVJF
X-Gm-Gg: Acq92OElmiQ262Q5pZ87w68rXtFJNPxzrc0lPuY8R2JEHS7h099gqHoCBF6/vJxQxpy
	VuFCFkaDHWsVnf9Ak69gOyvzZ+Ofstk8QG138Gvn6biGYTXFA16YbwdvOJubHOARJQDwbsBBGfK
	gbkmQWu1XfMwvmRWNbrfup5ZmdM68SjzsCAiSW+ZuldG/728vHvDzvsS57QFnWzvZQpgBQwL7oM
	uc9l2fz0HWbJ+S3kfmmthMAkoK/gJey2yIsCywTQWo3AiuqUSLg9pIJs7s8sBCuABk+tz6AvLYh
	CWYYAnchi5LLLkvIcqkbyPu+/ylQlrj0aICD2g/97DMVqBlk914CqOXNklljTvBND8owbHTXbc2
	+KAu2vV2DP4T57MERqs4kZbZWhdEVjfN1EEbSTsUPtvoft4zrznrYq9Zi13mLaGHInZpTTw31L3
	kRvXt1M3uYiHsI1JLMV2NV6pVCrh6oO8hJtBbgPs2ynHpAunA=
X-Received: by 2002:a05:6a20:e212:b0:398:7ca0:43a9 with SMTP id adf61e73a8af0-3aa5abe73dcmr27159496637.36.1778524212149;
        Mon, 11 May 2026 11:30:12 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267697d5asm9476220a12.14.2026.05.11.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:30:11 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: linusw@kernel.org,
	afaerber@suse.de,
	mani@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 2/3] pinctrl: actions: fix SPDX comment style in header
Date: Tue, 12 May 2026 00:00:02 +0530
Message-Id: <20260511183002.228520-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 66906514873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36600-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kmayur809@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-owl.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-owl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.h b/drivers/pinctrl/actions/pinctrl-owl.h
index dae2e8363fd..feee7ad7e27 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.h
+++ b/drivers/pinctrl/actions/pinctrl-owl.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * OWL SoC's Pinctrl definitions
  *
-- 
2.34.1


