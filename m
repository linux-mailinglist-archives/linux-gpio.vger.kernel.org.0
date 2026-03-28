Return-Path: <linux-gpio+bounces-34348-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMRXOPf1x2lMfQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34348-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 16:38:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616E34EF04
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 16:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0667D303323F
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 15:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DB9358392;
	Sat, 28 Mar 2026 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sO60Ra7g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EAF34F257
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712305; cv=none; b=QRQf6aLgmbLtFH79u4MurFxeQdEAo2NgThcP+Sv9I+YX5ZY7GqzA42ooLIePazhAvXTjLjFJ2AfNz1DcNGazP4Q8YAW0ZhChmFwu/mpLJLj9PAY7agDsTwt02jASZS6CaE8W1r5QtO40KaiO1sL3ApbRXEX8FhAnUjeNmrPOn9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712305; c=relaxed/simple;
	bh=68GewvUfCv31rhe4M2RcK+06g5yeAnm/VAqTllavLtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p1j2wKhaqbm+4wEiCc/VB9K7sAxTCMYfbX/zBIX1zvWf289SNKf7jg4gzk70+aaWouCALNWmTQ+/41PCudNPMC17lkWc4ICMFwTbg/XJVAykl+MSPKbucx4oqDm2+FCwf9tSxXNt//shG2SbAAPlw2bkk7L/e0SbYGR4ubVerEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sO60Ra7g; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d7d4ebccf7so2645371a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774712303; x=1775317103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lWcGU67uURrGSl+z3clujeyvnZB9TzKSxtjWsgmFSHQ=;
        b=sO60Ra7gAtlQwnf0oGFopqWl03NPneS4/3s6DIuH0x/BsxLGExrDLShPEUr38d7Jte
         ABiWNP6d+/ueRBXKOOrdtudbMNzhawmkK19fqrK9QZ6lOqdCoIukfIh2y9gowdmFBPIs
         8pEw5/B49t5SJH9UitfsFXrORVGhS5bADnQ0J892IN0pTZrH8Bj8S8/lnXe3QPuXYs3F
         0WNg0Y7DoT5mgksNfyJPJmPJA2XGq+I1xbJHQZopqIHpEZXA1vzlQpFx4eqmSLKKiiuP
         mm+GelQB2wUpTQlhZ2cTXZupxOgBcLZGctfpu+7EGLhJ4Q8dHuIM3p9or4tsDsqn3lcR
         xxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712303; x=1775317103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWcGU67uURrGSl+z3clujeyvnZB9TzKSxtjWsgmFSHQ=;
        b=sWlA/GY28U++RdiD7UtTv4sZDGN1ChfXpnZ0yDwH+P/qcaVDKMahaHhFTp7n/ULjXW
         NXcfAshBD7rVCgyl9jwzjsUsULc6Ls1o1ae0q7tfRAgKIcDIdVguTT+LjDs8BloGpYmz
         o/jJvnaFjXPKdwqkaskCuEPuhLlzUGDs0sWvWp6RyualhvKKdJDEKUJ7NS6fiVm8cKxJ
         hpP3wfCyTXM0S6KC/6DHbmci9I6hKwt1YLjUBdPcra7NseKXHd+XbLahN5ji68mGBoN2
         hnNE0kn5x1yLvnAFVD8GqB9nnPcotG48GaSMUmnmwF5r0s/KqLabKzRRRKrnfvrfMbnj
         Y8HA==
X-Gm-Message-State: AOJu0Yy9aaXUoEIsX21J6LJdJkoCiKYPKL571L4XIlcW8EP4XNFdQvQT
	+Ion00id1e/dC6/XC/WmQwaO7pTl0Vhws4AHioIhwVoPe6CTpIFbrc7AMDZJuQ==
X-Gm-Gg: ATEYQzyi8TG5DmTf9jpD+fo+f0F66y3pl99hi8ZTJkHy2qQRLpNkaTx636S8F1csu02
	QV+JPljU6k+bKnAiJnPFMm+jBeWo+RjmqcXNUGeMQ4SsACATkVTxX6GMWlzpgiC7xfgJQVAidm1
	Fow2Ub2gWII3s9zO9lGcUqGwWWT7pEgvhGayZGXZ5jNaSvySQJ8zJWt0mxErTH40N4KnWcSSMl0
	fcpHgxUVDwUP/hb+H79stf+gg7r0DS3U6G8QlSY4kp81J8Y4IxsGS7MNQM0ar8q0MY11H7j6Bos
	VipNXQPMbl+qllaX6puySEuN/fJ+UILsn8CgCQ4ON1Cv3bBtRxcOQbSgGuh44X3eu4sIHIiC3iJ
	Q87wsGEqNJLD81dSA3bS9ai1YkP3gbD184S8msBQA+/XJ64e1kDD9A/aFLT3fozyjNZjcDjw8Kd
	ChxA0UPoi+Z+PPevY+pQLTFZddAeVqMAEFOfEPp4hkBiuBu7GHgeL6rqel0fIf/w==
X-Received: by 2002:a05:6830:3914:b0:7d7:d2e4:630a with SMTP id 46e09a7af769-7d9fad7d934mr3663612a34.14.1774712302880;
        Sat, 28 Mar 2026 08:38:22 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a0f2bf9sm1861836a34.0.2026.03.28.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:38:22 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: update .gitignore
Date: Sat, 28 Mar 2026 10:38:19 -0500
Message-ID: <20260328153819.57025-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34348-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bgdev.pl:email]
X-Rspamd-Queue-Id: 5616E34EF04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update gitignore to ignore common cache directories used by linters as
well as common virtual environment patterns.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/.gitignore | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bindings/python/.gitignore b/bindings/python/.gitignore
index fce31f5..eaa8c8a 100644
--- a/bindings/python/.gitignore
+++ b/bindings/python/.gitignore
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+.venv/
+venv/
+.mypy_cache/
+.ruff_cache/
 build/
 __pycache__/
 dist/
-- 
2.43.0


