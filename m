Return-Path: <linux-gpio+bounces-35946-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P0RILWL82md4wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35946-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 19:04:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54814A62BC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 19:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01DDC305DA4E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8174942980A;
	Thu, 30 Apr 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pEu3ZEMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C846AF06;
	Thu, 30 Apr 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568498; cv=none; b=OVcH7nrOXcJ1O+fKbKuIis3afG5sBPLN6oXWmOB1HKD5+riLH2AmrD+G+dVOaurRA6cwpoB93AZkdFTV3adlQIfQ+3z9FZ503FZd3A8zhBor1DPLFNRm3QreYEMfaxCu5ICtMc4CPHS6HYmO8/ygX+kqsAFDCKtxh//h5vEKz6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568498; c=relaxed/simple;
	bh=tEHqUKd7SeWSVNvwZnO6UJxbtIX1mCyDdZ8zE13AGWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAQzkfPls71BwXa7x26Nluk+0JyvUBxVqpxQvFPNZek6D0OAfuaSRVmrxT6y1J8Eu0THIBYoPpkGMnFfPVQQu3lfFJINJvpIie7Gge+Yu3vAa0xL3FWkRPV0CiffCKdI+mRedJCIWXTxYNaN++/oPUrIfrtpu+N6vuuNozo9pYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pEu3ZEMX; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zJ
	+iSnk5S6nknL6mOvlsg+cA2m3dwlua2JfYjdZqjdc=; b=pEu3ZEMX/k0SXE7khq
	0mZprogHP4LDw/WWvfPpoBkG2btxT3sbKJHdJFs4XfrE46aDt4veS/eZ6FEpf6NM
	WfL0ScVLXcxYvm+ZjgcRZbOZxx0iFi6ChLHRi8HqPTOuGmaEtKeR/PHTD0iLZ4Fg
	RlpBKTxCd1R6/YLBqgEyvErOM=
Received: from zhb.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHlazWivNpMZwfCA--.7765S4;
	Fri, 01 May 2026 01:01:13 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: linusw@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	dlan@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/2] pinctrl: spacemit: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 01:01:04 +0800
Message-Id: <20260430170104.53854-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430170104.53854-1-18255117159@163.com>
References: <20260430170104.53854-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgAHlazWivNpMZwfCA--.7765S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw45KFy5XF17WF45Jrb_yoW3urg_CF
	97GayxAryYka4I9ry5K3WfXFZa9ayUXr4FvwnIqa45C34xXw1rWFykur1UKayrWF4fAFZ5
	K3yDXryrCF9rAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRG38nUUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBkw02nzitmLzgAA3y
X-Rspamd-Queue-Id: C54814A62BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-35946-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index b0be62b1c816..54674f55ed81 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -777,9 +777,8 @@ static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
 				return -EINVAL;
 			}
 		} else {
-			v &= ~PAD_SLEW_RATE;
 			slew_rate = slew_rate > 1 ? (slew_rate - 2) : 0;
-			v |= FIELD_PREP(PAD_SLEW_RATE, slew_rate);
+			FIELD_MODIFY(PAD_SLEW_RATE, &v, slew_rate);
 		}
 	}
 
-- 
2.34.1


