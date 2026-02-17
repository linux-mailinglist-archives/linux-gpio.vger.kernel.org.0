Return-Path: <linux-gpio+bounces-31732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI8VHwe8k2lK8AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 01:53:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCD148548
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 01:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FC73012C44
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 00:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CC61531C1;
	Tue, 17 Feb 2026 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ+xbSLw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4E3EBF2F
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 00:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771289603; cv=none; b=UztO0wUHInYc1x3o3J+wPqHZJcvH7IpB25un1zBUr2XjEfJmVy0xRIrhe49S9MamNKvLLbG6/iEBTQd4uOcIKZId1dtD27+CSIaJ2f0TDSm0B/2CcusijmnzyJInm1RAUzSp0LE+xWXyOam1kYCJuEWmW5ISjIig4wi2rn9QoR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771289603; c=relaxed/simple;
	bh=E+/vHBMdij8+KNe2j5x6ygN8hM2J/2Pt62Ca3N7aB84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su0pnf+UrNbpT40T2ytLBvpKBYL/etz+5kVWhJOOfCGlMysKt8I7YZQ+/QMk/uTC1UZKTkIU0hWPlLIZfAwErRSiL0WwounI7UMJIlg3MTeHwa6lmoN8ypvo4cj46bGENoq4IvMg/r4qZpC7yrFHZv2CP+GH2V9bFIHV5hpBVbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ+xbSLw; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4d8712b40so790429a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 16:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771289600; x=1771894400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4eGRSRRVnO60TX0kA2gF8EBK63nQ1H/J4YWnXtns3Y=;
        b=YQ+xbSLwK2qOSi8EeOW6EenOncLUu9AmMAilQ2m+Xhx9CaoosaBhIefVoTl7/yr8Rz
         zqUCeQ6m7D5qwqxA3jfKRz7GBBAJTOHpCjQaW5B+vYBZJaAUVXD/ETXNI24ibzncgtbS
         QjP6VO6LLh9Kr38OE60ovBUlj6ZJR3Q/Q/Smgv7hhla7NMsyL9bLT24JvpFOnVHHtd4r
         CqGwo//RR+ReXxnIzLtT/2xUEoVv1IzUYyW9WsnTjTazkDYyv2RMs6NVebLq0POxYp/6
         GU9/x5QKQ8Ej1iU4da3q4CCkaKotAvu3oIqUUx0iAL1vRHbvC/wDnkSAh1u81zQdRz1T
         fXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771289600; x=1771894400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4eGRSRRVnO60TX0kA2gF8EBK63nQ1H/J4YWnXtns3Y=;
        b=fGHF+uwxTvwZoKk9WISSNTTlQbD2wtPhH7T+69EZ3treeK44A6gf+z1cEWZ71HDg8V
         yF5PbizvWULCbfEEjRJ2YvBCNAT3VyfektSE7SLqHxFIWBfrfV+T5ANiMYJWx4dijc2X
         vYMCR8icmYmJWInN1B+I6TmJsC110IKvII4ZWOJOMMhRKVXlsN7tmPDiazhevyyULgCL
         llXtU6fANPn5vBAr1Frqvqqabs6muxeOpxppwvdZukiKZl5r0gNLOwv0qeiBH8gF1EQE
         dxCI8kp6Z1RcDGf3oW0fUiHjIm/EnNUFUBxwLVW0BzFVVTvr6vCN05MPHqe11DVGtfFY
         xMjQ==
X-Gm-Message-State: AOJu0YzQJ+6ahQpZhUO6oh4wxHH/7K4XGqeQccvhghqQbpHLvUJTvnEt
	LDWGhj+tEaLg02WZSvbFhYXd+o2510s0DIdSLaUGVioJ764bS+dYkiafy7Nfkg==
X-Gm-Gg: AZuq6aIxvkUqQNmZotUIEhsTs7IEkGyzEIc9Gnx54e1pRR6KgkbcpOYfO7iKvf+EaAX
	skak/VPbQe4+LFQAoQwZERxRaj9mNJ6aNJiEYGGy0/hBprHyEenPe9wN1sqnAYJD9wssyfZyIix
	qGweFOwGP0PKF6Uve3SlVeREOHWz4SjTIBAhi3a1T88xpBMA8PiuM9Gclon2XCn4aHwexwLsgb6
	kl/vrfnSU9caNxmVA0FCcDDBeW2D+qrSVA4oKuhblnJQmoGVIf0cWTPrvpV/fuZnGbHSAH59UeO
	P86C1vPnoQLlUrS1u27WIE5ofgDlG2gYZpXhQcS68BM6CKjSP7cxLV2CMsF3Z2Qo/O+8y356qwv
	ntI4D1o2ueffsYMBYQpenRlrNXj+AgeWwNk4CPp9LLDM457Pi3Zb1/TYHI8JWq7gSVivUQVf/Zt
	JZDKcXVPquqiBAv84/iIas13mJe4omtthIjeEhyYakqaEntTZKfXYXadAMs0W/NQ==
X-Received: by 2002:a05:6830:6603:b0:7c7:53bc:54ac with SMTP id 46e09a7af769-7d4d0ae738fmr5260550a34.13.1771289600599;
        Mon, 16 Feb 2026 16:53:20 -0800 (PST)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4b99c978csm10816330a34.28.2026.02.16.16.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:53:20 -0800 (PST)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: require newer setuptools
Date: Mon, 16 Feb 2026 18:53:14 -0600
Message-ID: <20260217005314.31016-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31732-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pypa.io:url]
X-Rspamd-Queue-Id: C0CCD148548
X-Rspamd-Action: no action

When commit d9b156ecc2ec updated pyproject.toml to conform to PEP 639
we failed to make sure the build dependencies were updated to support
the new structure.

Support for PEP 639 was added to setuptools in v77.0.0 [0] so minimally
require that version in `build-system.requires` to avoid failures.

[0]: https://setuptools.pypa.io/en/latest/history.html#v77-0-0
Fixes: d9b156ecc2ec ("bindings: python: make licensing information conform with PEP 639")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 45d50ae..1c3549c 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
 
 [build-system]
-requires = ["setuptools>=69.0.0", "wheel", "packaging"]
+requires = ["setuptools>=77.0.0", "wheel", "packaging"]
 build-backend = "setuptools.build_meta"
 
 [project]
-- 
2.43.0


