Return-Path: <linux-gpio+bounces-37380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDOrIZa3EGqFcwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:07:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BA5B9E65
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B02283011C50
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211F035CB6F;
	Fri, 22 May 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORPAvh7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F662F7EF3
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480270; cv=none; b=BCSme5r11Eijb5wlKFELd81/qk7wgy+A2Y8huWS6laz03Lzs65ZzJAZjoAqSnh0IRL0F3IzGkiluWOIcfbDl3z10+3YYnvUJe8C0tg9OGfqiQcG+ilcXnyJfgwUgI37KXLc3k7vlsQppYmWFkVY91UOIuKAP5oG6Sd914xMJ/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480270; c=relaxed/simple;
	bh=bhgIFuVvt7LEeOavYuxkDDXFPg2w5sl2KoIqjCPyp+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYEg5oqSytid7GGRMRuR8h8PqS8z59F/fWBqAFbgOEewZGm1kiLEzWWoo6WYEBMFL6my2nxVZHNc/ImhG94qMA0of3IloojvS74cr0z3K7EguaBzAtTY7lir3Au6mCJijvDegfcJccEJzDxywLNraeTIGe5p/j/B82A6aPetbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORPAvh7I; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-485462d9290so1134491b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779480268; x=1780085068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRFJjfgWthNGqhIuHVW39mLwoejRtUxkd0avFGwcx6M=;
        b=ORPAvh7Ie/ooL8yLS5kV/dbRHIu4juOpon/QzOPFIDidB+KxNbkXK7A4vjhApuHcF8
         XHZs7FzB0GFz42YLKX5avGuVGsI31oXU2A57L7Aopf5Svx9378yRV4fJlhOGNiwQJ0Tx
         F1GcTbkS5krgXSq1Pp9L74SQK5WGp9xS8CUNKq59/ksToFquHr8Mt3IDZuibebKcX4sJ
         y4fezAnp8sQHsq2Px6mRxtbppyy8nq7XBuojGCBH6o2rUcXblMVuNYh39YpMkutk92ze
         mFnJC55da72cSIIJ9ICmG9Wvk6CxWg1SwXrbp07u4RKu61gnv84NNTipClTzTcjKIjGm
         3VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480268; x=1780085068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRFJjfgWthNGqhIuHVW39mLwoejRtUxkd0avFGwcx6M=;
        b=OKw+gor13CAog5/6+p2lHfj9WFaHlbnoEB/WRAwVMM3RK1gYcVqVDoRdzp4HiAsvrN
         lrAPo4sK01IN0/DTAbNkOHq8BUFGClxPlD10uV5MMKb06sHRtbufCy8xKkj+E0XeMZ1S
         +ISCY6rM3rXNkpEcvR0/YuySarChniCc6I7OG/E//T1wuaYExLvYVmTt6ZoLKfTXAGcY
         Car0Jh7VPaZHmd/XIPBUX2jjV0xO+Xo5scgIhJViMs8F6hJJugkVsQZ1K50svmphFkVx
         bUDGhRKipeEaa6bH7OVWZQ/tCK3XKcKAoxcQoIFNdpG/NSo6gCTb7Xdmgz3GXz4Zn1kT
         9wog==
X-Gm-Message-State: AOJu0Ywz45PLzx4pIKwnr/cGjYDh2OvEbku2CvzrU+5Wp3LkZ8rHmvHL
	e+bJsILk3D0Cniwy1rwlPOgJoAN3gGgT9bzERo6whrR3cWaIFoyQZfRf6MEO9Q==
X-Gm-Gg: Acq92OHPZmtc+/blcUv1p1FnEamwOdz9uZYkNkbRrfXC18BQ32FDXP5lBzkHhfcSq00
	BA/uxECxDX/xB3FQrEFxw9R+u7oaRY3CxhVV4lfhLXEIJGWeMAQX/LcFhx45Gu5sAcj5rUt9IVZ
	ufGRd3BM4AWKmWm5gwlQyQFvOi46f9M9+31oArDTb0Zdoese+t1IQjSMfKhhO4QZBJ9FfsClmEm
	NrZGWC5O+vjyDTQ4Sa4tTZY4zY+yiM94HJda3KzoMC/4pBLoZzsj41wJ1KKLxqV8A2uaqk2ZJV9
	HgQSL5/2UlG1/SNtx1y1pvGQXiAD4iwydijIHzWFb84PYAJPvWZJKTJfc0BDihs0c6bT/a253eP
	eS1T4U2fcTvCiDytdGTP7kjB7cawx8ve257Wd8Bt6bOBTeXF7njv4AGgXPgXmC2MwVd0Qods4q8
	Qm0un3s3wXHJlADCs8DvUbejFo//+T20w2Y4Ag9jbydVdMe7zZgoBH+upCIxPHpw==
X-Received: by 2002:a05:6808:1383:b0:45f:103c:2483 with SMTP id 5614622812f47-4854af52780mr2780539b6e.23.1779480268490;
        Fri, 22 May 2026 13:04:28 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485544e320csm1054591b6e.5.2026.05.22.13.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:04:27 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 0/3] bindings: python: add support for free-threaded Python
Date: Fri, 22 May 2026 15:04:15 -0500
Message-ID: <20260522200419.105496-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37380-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E47BA5B9E65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This short series adds support for free-threaded Python and adds a new
test suite to provide some confidence in the suitability of the bindings
being used within a multi-threaded context.

A changelog is also added to keep track of changes between releases.

Note:
The new threaded test suite was run on multiple machines in excess of
1M+ iterations in an attempt to make sure they were bug free but due
to the nature of the problem, they may not be absolutely error free.

Vincent Fazio (3):
  bindings: python: tests: add multi-threaded tests
  bindings: python: support free-threaded CPython
  bindings: python: add a changelog

 bindings/python/CHANGELOG.md             |  44 ++
 bindings/python/MANIFEST.in              |   1 +
 bindings/python/README.md                |   8 +-
 bindings/python/gpiod/ext/module.c       |   5 +-
 bindings/python/pyproject.toml           |   3 +-
 bindings/python/tests/__main__.py        |   1 +
 bindings/python/tests/gpiosim/ext.c      |   3 +
 bindings/python/tests/helpers.py         |   5 +
 bindings/python/tests/meson.build        |   1 +
 bindings/python/tests/system/ext.c       |   3 +
 bindings/python/tests/tests_threading.py | 742 +++++++++++++++++++++++
 docs/python_api.rst                      |   6 +
 12 files changed, 819 insertions(+), 3 deletions(-)
 create mode 100644 bindings/python/CHANGELOG.md
 create mode 100644 bindings/python/tests/tests_threading.py

-- 
2.43.0


