Return-Path: <linux-gpio+bounces-34622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAwmMML1zmnTsAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 01:03:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF638EF5B
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 01:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73F6F303323E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 23:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E2331AAB8;
	Thu,  2 Apr 2026 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+1qBQTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D81A6825
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 23:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171007; cv=none; b=en+l7R1tatrG25qderP4SyL0v8WbM0fzGJ5ajcrBxKi4896h5hMssr85ydVL7IzcQQ9/z3R61YnSknjQl0qO9ske4zuO273+7N9G3O+YBlm9WphGPDE4t/nwb8DYQuhoelrHXwqENrrVvMKVySY4pKNpGX3D/aAibfq3TxKR+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171007; c=relaxed/simple;
	bh=4YZC+ZhUY1w4CHuLM14NQiOb8XVy+NqmRkTcKjVHliw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghqJMvTnWTKet/j4VOdjlmVtmzw7nrg9O3V03+aG1BlXzpHiXj2zSb45nWJ+VKCK6kbMi/eUx9eGjta8HkhkaXY1CGv82Dyw/JiBwCTkRI7bL0GmXbkGshjDdViqDUw2PAVyGooDtvohBOVjVmTi9JhMUTUoswZ2cG2SLpYxetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+1qBQTP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d7e9b97a73so1577374a34.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775171004; x=1775775804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zF4qWgvIJqyrtB/QUzZ1hx7/GrHawUzBem7h+zGp1pY=;
        b=I+1qBQTP1lhJGnW1jh4Nnxm891pTwLHey5cPnIdBeiC8yEaNw0G/H5DL2a69E+fvla
         Sec38/yealA0a2/7d1xyM56F6da19ed28Juxdu791qTt1RlYc1DTejaAzYhHqhA9WcFk
         kOwKk1kS3hTA0OC8GuUhL914b3bOqIkWDwqaleaDdlYCsarI9sM7qW7jtbLZYVOgyWJU
         JGI3/PHCoXg5plrpdmjXdosOgAMVjU+nlMIqcmzF7fewdVShT4EYaBL9XA1SSrGyWfsD
         iyBMN8DEcf2GgSsmsjLnIqSjPfxxqF8WH09JOqexRfnyv8NIbHYqma884efQeFjWhpQl
         Sudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775171004; x=1775775804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF4qWgvIJqyrtB/QUzZ1hx7/GrHawUzBem7h+zGp1pY=;
        b=Zg1zjon2cba+6jsKxvdDlpZbA0ePUELsG8QF2Sw8swiSqVNuflOJWnXI2a7v81ahFs
         0uRja6bcFyIsz78yuB1/i2JGtdfmLeWWLKdQD1/Yzr1t+Xf1nE5bdFMy458MbEdUHeEi
         +kVmvmwSxfSFd/noe992AWUpx3xupM/Rz33bxdGQSniVYx74dHMuZfJxfx/yS7ZHwR9y
         mvzOZFLhT7KcPqPkzeyEpaqYcT+0G+5/I2oyfUu2eZF+c3rGkqz5nN+SFWrNH1N+dUgK
         7BhmdNUZ/IKz3b149rQjoi0j2FMu9xEOx6VUa9Dkgcdn5YzKqt/xcnc2Xe9AMHgkWkO0
         ZLDA==
X-Gm-Message-State: AOJu0Yyzyeqha8EBuDPGhXRga9LID5VcMzoDbd/jjVFI4CxaJ9Jis653
	AdRayEgIEVcv11r/NFKndDdkWVP1TZs5KBMmc5ThmmXpTNPeoNLTF0uUdaLLtw==
X-Gm-Gg: ATEYQzzUHczzkBRecalhD5Nd/+rCfYb3KnXmQBaLd0AbO3BLcBbeBmKHEU9P1mi/idc
	Cp92uCFygNGdvZXLJkaFM/A+LFmfM3ajsjxMDcnqbBfr8uhEs7YknK+2o2ASHj3fsUYHck+5CKn
	tBSjQWf6ZwUnJjNT1hbaqzsCv/7c5dmLqtky+rwvuHqFWk9D2iqUHjE+t5afhnVepw3TtO5y5e+
	sMKBBhacKk1vaTJqst6t3/LDQWB3RYlKI1OJRQ4+bXerBpJutzcMO3d8f8O3DoaxOhZCv9dbW69
	rTzBLADewwA4NbYfBtTyAtFiHEN2UlwfX8hsqD2JUOYvfy9MZFJxjV2dksGScDkYK4unbLAqMW+
	g8U0UXy6KomH7j5EwDF9KlrJDS/9fW23j/jjXzFyUn1Kdg4Ab1ONsueRwwJhDrUG4rBdr7xwqyv
	++e2ohb+5/STWCONgE8BQ0JYA5YzED+wLk4HcwH+9SZehM73jXRr/uXEiwEF0lBQ==
X-Received: by 2002:a05:6820:5389:b0:67e:963:d733 with SMTP id 006d021491bc7-680fa7d2151mr1414220eaf.35.1775171004383;
        Thu, 02 Apr 2026 16:03:24 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eaed47easm3559910fac.4.2026.04.02.16.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:03:23 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: allow releasing LineRequest multiple times
Date: Thu,  2 Apr 2026 18:03:21 -0500
Message-ID: <20260402230321.6579-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34622-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83AF638EF5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow releasing a LineRequest mulitple times without throwing a
RequestReleasedError to adhere to common Python semantics.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line_request.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 0287791..a271080 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -75,9 +75,9 @@ class LineRequest:
         Release this request and free all associated resources. The object must
         not be used after a call to this method.
         """
-        self._check_released()
-        cast("_ext.Request", self._req).release()
-        self._req = None
+        if self._req is not None:
+            self._req.release()
+            self._req = None
 
     def get_value(self, line: int | str) -> Value:
         """
-- 
2.43.0


