Return-Path: <linux-gpio+bounces-38683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rq3ZB/8LNGp1MAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 17:17:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1A6A12B5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 17:17:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=BaDpc84z;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38683-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38683-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56C830C0994
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B43F3EBF37;
	Thu, 18 Jun 2026 15:13:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9635B12B;
	Thu, 18 Jun 2026 15:13:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795603; cv=none; b=at6KDCv/sE9nshwoVfMgGt7uW3aVNBimX2FkE9o4cTmanuxKZPhipnITHgrz6YygZv2Qhbc7NTMN8vAIZPvtsjYHWI1eYXXS0IwnZlBitxtZU+99lr44d/PbZQIhKjaUaGlKEQCYx1KfgM53+befKAnQFMtOBnX5hH4HQzKggLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795603; c=relaxed/simple;
	bh=y+mYC+JiZKOg3sWA1xkfUPDNgNA3JItr41GLGsQzk/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOeCes0gL7PUYAXV705zxbM7Hj6QLzZlfcuSeFxhO9TE7Sp1y7GGy/7HaldJ1IgxLDDveHV+Y1Qc+84F4L2cwLgZWstPq9oukD37KWh/OFoNjjGAaRghz+MBt+uomST5GzmQEtNwvEC9KSaShpVO9P9/TpE+BtRk2RarB1yMm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=BaDpc84z; arc=none smtp.client-ip=45.254.49.198
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee94ad;
	Thu, 18 Jun 2026 23:08:07 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic paths
Date: Thu, 18 Jun 2026 23:08:00 +0800
Message-Id: <20260618150800.3930930-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
References: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb4670a303a1kunmc4843ab0a7086
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRhLVhhLSB0ZSkxLGR8YSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BaDpc84zHnuTmAVyzWMm3jpttyXtERUVd3qygkLQ7bBbrWehDC6m4RUfzcjxzo4jpwV8tLZhco/5Utmkb1EcJSGHKrpHIIIxEREFb18SLS3CdDq4CBbHcGjy6rfjYKihJxMKLn3U7oKDgJfIoum3gSnv+jyRpaqhs+PBs7cGB7Y=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=r0ciEGtJ+ZM9r+cvn8Not9IkSBfHrREwC7EUYq8DykI=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38683-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,nvidia.com,free.fr,vger.kernel.org,seu.edu.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:robert.jarzmik@free.fr,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90A1A6A12B5

Hi,

Thanks for checking.

Thierry, thanks for confirming that Tegra does not currently provide a
gpio_set_direction callback.  I agree with your concern: even if removing
the call is technically safe for the current Tegra pinctrl implementation,
it may be conceptually cleaner for the GPIO driver to keep delegating the
direction request to pinctrl.

Linus, yes, the mutex I am hitting is the pinctrl device list mutex taken
while resolving the GPIO range.  If that lock can be made non-sleeping as
you suggested in the other thread, then this class of direction-path
warnings should be better handled in the pinctrl core instead of by
removing pinctrl_gpio_direction_*() calls from individual GPIO drivers.

I will hold back the PXA/Tegra driver-local patches for now and first
look at whether the pinctrl core locking change covers this direction
callback case as well.

Thanks,
Runyu

