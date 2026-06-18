Return-Path: <linux-gpio+bounces-38681-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m6zOFsIGNGrELQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38681-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:54:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B66366A10A0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:54:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=cmFculJQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38681-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38681-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AC8B30309CB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1B2F1FC7;
	Thu, 18 Jun 2026 14:54:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8953311954;
	Thu, 18 Jun 2026 14:54:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794495; cv=none; b=G78Hvvldm0vsLLJN/cdD8gzU1KmDyEe0gnbSbVrn8oVQvV23l0aYUSor3/0yI6JG8EdEJgA1SezgevVv3drkrK9+/TZsHouAb1GqR4mDm42FuX1Z1IDSRqWEPpygIqQE4wz3eX3InqFeJ4XWKKpPXHAiIMqVnCN7iBFLUrDaOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794495; c=relaxed/simple;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1Fmm0aVlQzEbqqjGTppfgND7Zu/XAiJ1c35QcgjrHofZ2ARJCoQhlWXpl7zBr9+qYP94IXKoNpW+6W2A5Kj9D65puu5kzmE6kAowlDhsb/O4vMjojRNSdFc8slvd70WfBgnOPfv2zLE+Nc9hkVZbRiPingtiYCf2Nj0ig7ulLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=cmFculJQ; arc=none smtp.client-ip=101.71.155.101
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9309;
	Thu, 18 Jun 2026 22:49:31 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap updates
Date: Thu, 18 Jun 2026 22:49:26 +0800
Message-Id: <20260618144926.3551915-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618081554.zifCwv4I@linutronix.de>
References: <20260618081554.zifCwv4I@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb356b4b03a1kunm8568d9c4a672e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1NVhgfQ0NDT0JMGRlCSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cmFculJQF7D37En2zbn82en138LkdfjCBj0yBmO4+GRPq8Ied/pBxVpckJujr6a3F+UBUHVVRDpauSvNFc8NamAaS3Xlnb2HLNMtND++JsY0OJaUsXAz274oOSJiiNBlae1riz0w8FoBQBNGSrNYZQ+vZhKWGptxTPDJq1xhgDk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38681-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:broonie@kernel.org,m:herve.codina@bootlin.com,m:vireshk@kernel.org,m:viresh.kumar@linaro.org,m:linus.walleij@linaro.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-arm-kernel@lists.infradead.org,m:soc@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B66366A10A0

Hi,

Thanks everyone for the feedback.

I will not send the irq_bus_sync_unlock/shadow-state patch for now. From
Sebastian's comments, it sounds like the more important question is
whether this should be handled at the regmap locking/cache level, or by
using a raw lock only where the regmap path is known to be safe.

Herve, your point about other GPIO controllers is fair. I should not
treat PLGPIO as special without checking the wider pattern. I will look
at other irq_enable/irq_disable users that combine irqchip callbacks,
driver spinlocks and regmap_update_bits(), and compare whether they are
using MMIO/flat cache/raw regmap locking or a sleepable regmap path.

For the current PLGPIO draft, I will hold it back until I can answer
whether the right fix belongs in this driver or in the common regmap/GPIO
pattern.

Thanks,
Runyu

