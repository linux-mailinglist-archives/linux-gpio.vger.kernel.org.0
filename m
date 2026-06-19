Return-Path: <linux-gpio+bounces-38711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbouG0xiNWrcugYAu9opvQ
	(envelope-from <linux-gpio+bounces-38711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:37:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00866A6BF1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:37:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=WybuJjcV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38711-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38711-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7FB73022578
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CB83A9DA9;
	Fri, 19 Jun 2026 15:37:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3A140E5F;
	Fri, 19 Jun 2026 15:37:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883465; cv=none; b=ogccFUPQLP1X+oUpkA3tVtbZ0LjHhZnjBJyYv2cKuW4d7m9qVvSlxeUyDEZSDDUDfLlk5HAa5LkiOC0U9XVAHTBeiziqop/tEIGQsE+8ajUt4mT88v3Wz9/L0Mk/my4oabgDkJEiPX1tRU6LrRZ0BoTsamPr2d1jwlTIiTu+WdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883465; c=relaxed/simple;
	bh=FJkKS4V1O1bdiGBNCve3cEqDXU6ZSWjP9NtbLXKKmFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FBC9Bs5W4F/bRyy73ej+5+CM+TOjd9wvzlFnjgxoCEz2Yp6LHK1wD9h6/3TMW/G9bDAt6oVHva7vytsdyLODpBC6kfiYWx6/ygYma4NJSAE0xvSeOFc6dmtLW3SbchZMDIcDehhv2ag8PNvcmYVwdgJXIdnk6ZWrSCNvrgzgoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=WybuJjcV; arc=none smtp.client-ip=101.71.155.101
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 430a44e58;
	Fri, 19 Jun 2026 23:32:30 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Question: pxa GPIO direction callbacks and pinctrl_gpio_direction_*()
Date: Fri, 19 Jun 2026 23:32:20 +0800
Message-Id: <20260619153220.1351480-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ee0831ec903a1kunm037ca621d2e78
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEgaVkxCH0sYTx1ITBpCSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WybuJjcVNj9iFdLVX0/pH7pGC2lyK1D1hPR+ftdqaM5KWmVvxM8baC57b6rwLGLTyGXeRcC1oa6I6NCreEt2hLQxgj0aeB8CsQp5W1nlDMQEpI5q6k1QsGl5xDhTniFCJAadx8BrWvgIfkbSiT0y5u0PFf8KfD7RK/7MpGvy8f8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=FJkKS4V1O1bdiGBNCve3cEqDXU6ZSWjP9NtbLXKKmFM=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38711-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robert.jarzmik@free.fr,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:runyu.xiao@seu.edu.cn,m:jianhao.xu@seu.edu.cn,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,linaro.org,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D00866A6BF1

Hi,

I found a possible sleep-in-atomic problem in the PXA GPIO direction
callbacks and would like to check the intended driver contract before
sending a patch.

The driver registers a normal MMIO gpio_chip without setting can_sleep.
On PXA variants where pxa_gpio_has_pinctrl() is true,
pxa_gpio_direction_input() and pxa_gpio_direction_output() first call
pinctrl_gpio_direction_input/output(). That path can reach the pinctrl
core and take pctldev->mutex.

This was found by our static analysis tool and then confirmed by manual
review of pxa_init_gpio_chip(), pxa_gpio_has_pinctrl(), and the direction
callbacks. I also used a directed runtime validation that preserves the
non-sleeping gpio_chip registration and drives the direction callback
through the pinctrl direction helper. Lockdep reports a sleep-in-atomic
warning with pxa_gpio_direction_output(), pinctrl_gpio_direction_output()
and pinctrl_get_device_gpio_range() on the stack.

The part I would like to confirm is the intended fix. Commit a770d946371e
("gpio: pxa: add pin control gpio direction and request") says that when a
pinctrl driver is available, pinctrl should control the GPIO direction so
that only one driver controls the direction. Because of that, simply
removing the pinctrl_gpio_direction_*() calls from the GPIO direction
callbacks may be too broad even though the GPIO driver also updates GPDR
itself.

Would the preferred fix be to keep the pinctrl direction path and mark the
chip as sleeping, or is it acceptable to keep direction changes on the
existing GPDR path and remove the pinctrl direction round-trip? If there is
another preferred way to preserve the PXA pinctrl contract without
advertising the direction callbacks as atomic-safe, I can prepare a patch
in that direction.

Thanks,
Runyu

