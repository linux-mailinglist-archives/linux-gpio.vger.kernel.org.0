Return-Path: <linux-gpio+bounces-38640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNCXA0vBMmqD5AUAu9opvQ
	(envelope-from <linux-gpio+bounces-38640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 17:46:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6D69B1D6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 17:46:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b="Gb/FqZ+I";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38640-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38640-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7C49302CD8B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4FB4A2E1A;
	Wed, 17 Jun 2026 15:46:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FF481226;
	Wed, 17 Jun 2026 15:45:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711171; cv=none; b=pFDdvAgHLmlhISwZhJCHeJPUWgD3uIEe0GFN1sdRMw/Djp02fggmVQU6hf9id++d8E2STTAG/RhOfJy98ET1f5XJPmy9GHzB0fHRmV+Qxryh0jpggItZzQJD4a+Jq8jClqv/GLn/DIGDOdLsMQCt9OhTayQhuek2UYjodzf/YgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711171; c=relaxed/simple;
	bh=/cUP8qiDwMFPXMJ07+t7pi0dWpyopD+eP2Yi5ET34pI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rUg84DByYCvXXiZI0STVf+SZ7UPc7Brm7jiXSmfsbAd330zGPhELw2lZBBJ4hrBLLwR4BL2AHwet7IYTuFrolePozQuFQn7y5JOEruDKxmlzKRAKNToOzjL1Yz6ECzbQvx2RmDNoOWdDU/tQPvn77Tlb0GUblvEzQPsv1IEjo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Gb/FqZ+I; arc=none smtp.client-ip=45.254.49.198
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42c786665;
	Wed, 17 Jun 2026 23:40:43 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: [PATCH 0/2] gpio: use raw spinlocks in irq startup paths
Date: Wed, 17 Jun 2026 23:40:33 +0800
Message-Id: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed63dec9403a1kunme39bd4ec7353b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEJPVhhPGhkeQ0oeGUMdHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Gb/FqZ+IjVPGhiGasMk5wIQKUqgwywBh4ygHk3qwhFjX1Zcuk8nYG+uCxDg3mGwGOxqnZv3gTfiDb0F6Zu2Ny63ZNjmxmlHhHId2IsZIBsmbvo9o76G+UcdLUEZcJx/h/7FlhgmQLPWUxuk7S1ScVnVHOFDo8NInP2XTZQmsD7I=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=0UJyhmAnyClFs0OH2R0752mdmhXxf0o0IrDtwIqU2zU=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38640-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.alibaba.com,kernel.org,linutronix.de,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92B6D69B1D6

This 2-patch series fixes two GPIO irqchip paths where IRQ startup or
unmask can update controller state under a regular spinlock.  On
PREEMPT_RT, that lock can sleep while irq_startup() is running in a
non-sleepable context.

Both issues were found by our static analysis tool and then manually
reviewed against the current tree.  The grounded PoCs kept the
request_threaded_irq() -> __setup_irq() -> irq_startup() carriers and
Lockdep reported "BUG: sleeping function called from invalid context" on
the corresponding driver update helpers.

Convert the affected register locks to raw_spinlock_t.  The locked
sections only serialize MMIO register access and irqchip state updates,
so they should remain non-sleeping.  The conversion does not move any
sleepable operation under a raw lock; it preserves the existing short
register-critical sections while making their non-sleeping requirement
explicit for PREEMPT_RT.

Runyu Xiao (2):
  gpio: sch: use raw_spinlock_t in the irq startup path
  gpio: eic-sprd: use raw_spinlock_t in the irq startup path

 drivers/gpio/gpio-eic-sprd.c |  8 ++++----
 drivers/gpio/gpio-sch.c      | 32 ++++++++++++++++----------------
 2 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.34.1

