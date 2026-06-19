Return-Path: <linux-gpio+bounces-38712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qV22LIxjNWpxuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:43:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FD6A6C86
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=j8k23FN9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38712-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38712-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12C5A306F9C2
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F573B27FB;
	Fri, 19 Jun 2026 15:38:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0E3A7F51;
	Fri, 19 Jun 2026 15:38:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883517; cv=none; b=h4XtVpEH6RbC8K1PjYAeBQ7RAGZstAI8CqA4JmvS6qt9AGKzAciCvG73fz5NLrMvJ9rLPtsmUgtPlVg4Pc06oOru0bO/22ZO+zBf0snFj6Tu97NHIqX0X7Ldwe4nZThhWSgTGSsybgBtyfVu+Dh2pEh3cmZptlwUtciTNvta6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883517; c=relaxed/simple;
	bh=489liCLgEEuHE6CcO9Jekc2c1nt+/xWDmrZtEhSA278=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kGqRaIIQWjHrm4ivH9KpehdV3XpTCryEgRIBujxUwM9uYv7jL3sTumBQeKO7AQ0JOVKHo5a/dkYL1oviv8PwFerT9VKTiFl6dyRb5spDWJA6CWRcIDfsOJbCL/Khp+sg9e+ESvx1t6bm5fwt2cJZ9fy6jieMtmetAF6p1cPqQpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=j8k23FN9; arc=none smtp.client-ip=45.254.49.198
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 430a44e5e;
	Fri, 19 Jun 2026 23:33:22 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Uwe Kleine-Konig <ukleinek@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Question: mvebu GPIO can_sleep and pinctrl direction helpers
Date: Fri, 19 Jun 2026 23:33:18 +0800
Message-Id: <20260619153318.1366604-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ee083eb3003a1kunmdab15f0fd2ed3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0JCVksdGU4eQk9CGE8dH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=j8k23FN9gGTQ+GEBu2cTqzZZBGB7z3GFrcv5ch/m1r8KmEu9iyP6HaUvHHbWvqH+lh7m8TbIYTXo6J5EUMWMDWe0zj8h+GqlSjZHRGfd3mUYh8Ao1D0ampC8AIUbMHlIPXXv2whD4EFWiXfVbfsyaUv7WBTuwBZ+rS3eRFTywJI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=489liCLgEEuHE6CcO9Jekc2c1nt+/xWDmrZtEhSA278=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38712-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:runyu.xiao@seu.edu.cn,m:jianhao.xu@seu.edu.cn,m:arnd@arndb.de,m:thomas.petazzoni@free-electrons.com,m:jason@lakedaemon.net,m:linux-pwm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 050FD6A6C86

Hi,

I found a possible sleep-in-atomic problem in the MVEBU GPIO direction
callbacks and would like to check the intended gpio_chip contract before
sending a patch.

mvebu_gpio_probe() currently registers the GPIO controller with
mvchip->chip.can_sleep = false. At the same time,
mvebu_gpio_direction_input() and mvebu_gpio_direction_output() call
pinctrl_gpio_direction_input/output(), and that helper path can reach the
pinctrl core and take pctldev->mutex.

This was found by our static analysis tool and then confirmed by manual
review of mvebu_gpio_probe() and the direction callbacks. I also used a
directed runtime validation that preserves the non-sleeping gpio_chip
registration and drives the direction callback through the pinctrl
direction helper. Lockdep reports a sleep-in-atomic warning with
mvebu_gpio_direction_output(), pinctrl_gpio_direction_output() and
pinctrl_get_device_gpio_range() on the stack.

Before sending a fix, I would like to confirm which contract is preferred
for this driver. Should the controller be marked can_sleep because its
direction callbacks may sleep, or would that be too broad for an otherwise
MMIO-backed GPIO controller whose get/set paths are fast register accesses?

If marking the whole chip as sleeping is too broad, would it be preferable
to avoid or restructure the pinctrl direction round-trip instead?

Thanks,
Runyu

