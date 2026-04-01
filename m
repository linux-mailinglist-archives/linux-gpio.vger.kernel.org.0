Return-Path: <linux-gpio+bounces-34517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GMEK/xkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAA37314A
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05E6A3095D5B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44DF191F98;
	Wed,  1 Apr 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha1JDEKR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232918FDBE
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002692; cv=none; b=rAGL1ivT67ytuJZaIRH48Vkg/8W2Fs9e3c6+l9p8Re1IOdW1cCSJp3JhWLei8oYzaJl520kSG7ot4sU6n1LlK62VPdnV4jiv2dRdb6P8WztyoZuiZuczc8BO94BvsNab9vkkot3C/NdF/rhuV/bPp+1SvcQSLZXWIIxn4hhjXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002692; c=relaxed/simple;
	bh=jU2I4IDsW/iXaE6JtlKi3yq1FX55/FlZF+POX2UkflY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AR1BA2ccL8p+PSnofcNeG2fDEtYg5lyBIvmpvH4oP3T4GK8wj8LECg5de10MdDt3EeQX1kps/Iyn4yIO4vGfp9BS9D7qHB/ysmLeLt7kkbpN0XWAcido9lVaqNAKQSHCTN5H8dBqlGgLS5oXRy82/oSAFMJCucXWifOmGgIW+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha1JDEKR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d7e5e8c907so4038976a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002690; x=1775607490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AO9Facv5e2syws+D9c3Vyu7qA/Dpq9fbNKfI+/7CRY=;
        b=ha1JDEKRXaZWLUSd7vajD2JCDeaeJvqWPtuqygiWu0c0OBzVbYWnKSCKI0+A9VAQCv
         NsWVMYylKKJ7iXHHc916JTO21HouqrEnefLBqnsvCwHE/3iEI0I+ffnUetCx0pfE9zj2
         PwXcPp9D9ZLy2x/n7NfnkN7m16zBu/oHGvDWwzASdVoRgsZzkr/MMoI6rSQA3MRcnX03
         h4MU09qWeTx9n2tgv7Pes6G0ySSgekwog37lng8uwc4k0Oxpi9kC2la1YvemUbE4hk+8
         egEk2iQWt/4BYcJZBvzBn5QZp4T8RBnp/5Bc6anYTRnLFesPhi75azcV64rDI8lC34SE
         Jt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002690; x=1775607490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/AO9Facv5e2syws+D9c3Vyu7qA/Dpq9fbNKfI+/7CRY=;
        b=YPdNghzE0TWmWpmk2Xmo8SblQ3LRn1nHRsVMynUgRPsB9zlpTiJ/vz9B8pl9/FZpIQ
         HqB7IbjsSr+ZoVQRfuRYjJe+pVJ4RG6r9oDSOpw5BVCCIVc8VVb4zf+Pm5E6tI+55+G1
         d8iPIUCSD9PIresXbPZy1Ssw9h3A97z2ZDJYxw/pFd4B9its0zn8J+6f3yphJCzRYgG2
         Pl0TgiFjr+Gp2bXFSwmrhZqlIU6PxRS7rQrQcCG8/sb2LSBS8D+2W9aE2cBhLWAMAoa6
         nfXJ8lP/Gng0B4NA+hC+RcXw1om6sMS+dE701Fi/Rzgf0t+agcw+oi1IW/fp6XDxr+35
         J96A==
X-Gm-Message-State: AOJu0YxDaJaC3nZVnG6QYxZY8LYPgFxQFcwpIJ+YBAqEv49KgK9OW1bb
	qH0zCaq2e1riPvxQKIfaVcK3dmhA/WJ9FWlOIpt1G96uQDcD7eLtTUZ0kUT47g==
X-Gm-Gg: ATEYQzzvk5/U0pJmn8mRzzwgdtrzksfqgP8rb/MA/IK6AUYwSU8Q+tgPudoBYeWmr1m
	MikDI6q+KNg9Rc1DIMmDW1BZ8mor4/Q022Xz9pbKC9MT1tjoizobF7TmLwjCMp9LzwFWcpSpQh6
	EnoSXLJrDHj4E+Nh5YGq0U4jFAO9PPfZoXkCFMv3k9MZBzve4Gbw8Ip1eIVAy0dnNjOO9AJ9UwJ
	2eZjAkKoDqJ3z9mo8nEDh9TAn/ga9uUGGyK5AfnHS/2ywyB1GzFa+c4emyxzegUcl7r3/UIj5t1
	CZtcq+Y8el3nrEEHqjhtQQ9Lm6dlLjrPAA9dioUUXkBYX2UbXozphVmIohUktnSyVzAkHH4nXGr
	S5x5a1ESCflAeKMLoaqf3Ew9DUFXiCwSx7MwwwUfWOmtnicUTTEx1NVPrc3Wm3bqDT5H451TlxM
	513bTyJu3+BzuvMDJyVPt+E5itJIrcOg9CpxZDH2wqbA83uZ9jiwagRNlPZ619/Q==
X-Received: by 2002:a05:6830:81ca:b0:7d7:f59f:3d18 with SMTP id 46e09a7af769-7db991dd421mr1091258a34.2.1775002690052;
        Tue, 31 Mar 2026 17:18:10 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:09 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 8/9] bindings: python: add a lint dependency group
Date: Tue, 31 Mar 2026 19:14:57 -0500
Message-ID: <20260401001459.19159-8-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401001459.19159-1-vfazio@gmail.com>
References: <20260401001459.19159-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34517-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DAAA37314A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Specify useful dependencies for linting the bindings and related code.

The group can be installed with `pip install --group lint`.

As part of this group, specify version ranges for mypy and ruff to keep
linting consistent until new minimal versions of Python are targeted or
until the new annual style introduced by ruff is chosen.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/README.md      | 4 +++-
 bindings/python/pyproject.toml | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index 89c824c..70428c0 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -120,10 +120,12 @@ When making changes, ensure type checks and linting still pass:
 ```
 python3 -m venv venv
 . venv/bin/activate
-pip install mypy ruff
+pip install --group lint
 mypy; ruff format; ruff check
 ```
 
+Note that pip >=25.1 is necessary for `--group` support.
+
 Ideally the gpiod library will continue to pass strict checks:
 
 ```
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 9961f3c..3255e89 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -33,6 +33,9 @@ classifiers = [
 Homepage = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 Issues = "https://github.com/brgl/libgpiod/issues/"
 
+[dependency-groups]
+lint = ["mypy>=1.18.1", "ruff~=0.15.0", "types-setuptools", "packaging"]
+
 [tool.setuptools]
 platforms = ["linux"]
 include-package-data = false
-- 
2.43.0


