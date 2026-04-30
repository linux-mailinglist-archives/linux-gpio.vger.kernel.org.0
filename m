Return-Path: <linux-gpio+bounces-35945-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BAaCIuL82md4wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35945-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 19:04:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F404A62A6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 19:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DDE33006B51
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 17:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC32429837;
	Thu, 30 Apr 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nDbDdK0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39923D6465;
	Thu, 30 Apr 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568494; cv=none; b=LuWQC+MSnJ/ixg72zw7dprPYme/Jmf5r9u1KUzFYau05sTP7TSXhWO9A9kaiuLLFY9iOXmj/FgnjLFLofl89FK/hlmTSWxmh0hXuHBpakeBQNB7cIsm65UxuuzzgbidgQ9F68SI64Ivkg4ysW5Q3SyrlicciTE0dp41ePkWoaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568494; c=relaxed/simple;
	bh=AYIQJmfHREOr6o+YKT18OA/2GtkNBQT1y9H3yi+b2VY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YuFJc376Pa9frdG6z/09gPcxsROSTFSrOrX3UKGT9yRMahk/wpYcceQ8tlDUaDbJQU5Rn/GZsPKHjhsdumWPan7w/Ez/oIAxNJDe4JglK9tOJFg8qMPkKqc1fr4wYUkFfD6wsWJ9hmwnXh8HglXe+QNbdHWqYMhZWMJqA3GDWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nDbDdK0R; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=NK
	SZEXSZEC4HZ7s/BOLIe0e4/u/2nyoEbCqf//ZYSuc=; b=nDbDdK0R7QRTdz9CVw
	ZRTqfbyMK2GlWTb7Os4oEO6o3QVVcjrmBtUajJlcfZPNvCCJKnnkQUzERYDtxxpZ
	GKWw+Dm/LDYcN3KNWulCS2+SNeDUCZSUm6MFTYwfDKiB8PVOZNAtbguwqJKdY6HH
	n7LVY5htwLzNUpa/kZJL1tlxY=
Received: from zhb.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHlazWivNpMZwfCA--.7765S2;
	Fri, 01 May 2026 01:01:12 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: linusw@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	dlan@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] pinctrl: Use FIELD_MODIFY() to simplify bit manipulation
Date: Fri,  1 May 2026 01:01:02 +0800
Message-Id: <20260430170104.53854-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgAHlazWivNpMZwfCA--.7765S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWrtw45uFW8uw13uF4fGrg_yoWxKrc_Ca
	y8Zas7Jrs8WF17ZF15GrnrXFZakayUXr1vvrn0qr43K34xXr1DWr1DurWkW3Wfurs8Crs5
	Kryjgw1rCFWIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRC_M3UUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxgw02nzith+vQAA3z
X-Rspamd-Queue-Id: 74F404A62A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-35945-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series replaces open-coded bitfield clear-and-set sequences with the
FIELD_MODIFY() macro in two pinctrl drivers. No functional change is
intended. The resulting code is shorter and easier to read, and it avoids
potential mistakes when adjusting bitmask definitions in the future.

---
Hi, If the Maintainers think it's not necessary, please ignore it.
---

Hans Zhang (2):
  pinctrl: sophgo: Use FIELD_MODIFY()
  pinctrl: spacemit: Use FIELD_MODIFY()

 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 18 ++++++------------
 drivers/pinctrl/spacemit/pinctrl-k1.c   |  3 +--
 2 files changed, 7 insertions(+), 14 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


