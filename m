Return-Path: <linux-gpio+bounces-38655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id djy3Bz+FM2p6DAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 07:42:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042669DB9A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 07:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=ZJU1b9W4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38655-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38655-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB8B0302F0D2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 05:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4682B313522;
	Thu, 18 Jun 2026 05:42:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E219DF55;
	Thu, 18 Jun 2026 05:42:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781761329; cv=none; b=u0jxNw2wSOGUSWGFsEQXk2+IXM0LLx/M+P1b0XnmJ6s/OLb0hUZJ5nEXsMxWPwcXxj5qlGD05fmzG3chVi1pmSqGh5wNCjIz3EQ6MxakBm594+BOBVIwcjJTKQaGvs/2iKdmW8EHKocyU1HQ3qK5OOb2NTQjHLx5AUrSEjj0o3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781761329; c=relaxed/simple;
	bh=5qOb9IWAaRBR5l+Va2I+ttKTJfL+J0FF/ljlGF0C384=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J0xnGgqp0XHubIRjXgU06jvsZ3YWYCzM8Q7M3dcYfRxjKriEk53w5sr09wyT4343KpUygwECCb6TC+uuEtf0G8HfEPvOnHLnaj2tTXUB0vm0/NNs/3AneNnsiYskGzjFNvoZOd7xpimY2dXoMHJiBk9nxrUc89irXIwHj5LHJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=ZJU1b9W4; arc=none smtp.client-ip=45.254.49.197
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42dcad3f6;
	Thu, 18 Jun 2026 13:36:53 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
Date: Thu, 18 Jun 2026 13:36:50 +0800
Message-Id: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed93b770303a1kunm888aadba902f5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1DVk1NTxkdHk9JS0hDHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZJU1b9W4Jh98QqUhr1aQzw8XNGLQ4YZLglW1cb3o2xMn/gzwQhTHfDJQ7OHctmOMGtnvoF9o0cnjREuuH6PYHzw1f9E5w0EY0vBQ2mKCGWNepb0uGRZyoU13fa5S0ltRw+W51IGzgwKuWGgRY0QrC0I7+f+BcqxaDQ1um9KACK8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=dri7msVJ02+jPQSBZnSYMVmIqcPBpOQbQ5XfzTRxPCY=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@kernel.org,m:ludovic.desroches@microchip.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:antonio.borneo@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38655-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	FREEMAIL_CC(0.00)[microchip.com,bootlin.com,tuxon.dev,foss.st.com,gmail.com,csie.org,sholland.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev,seu.edu.cn];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7042669DB9A

Hi,

While auditing pinctrl-backed GPIO chips, our static analysis tool
flagged several controllers that expose gpiochip_generic_config() while
still advertising a non-sleeping gpio_chip.  We then manually reviewed
the findings against the current tree.

The path we are concerned about is:

  gpiod_set_config()
    -> gpio_do_set_config()
       -> gpiochip_generic_config()
       -> pinctrl_gpio_set_config()
       -> pinctrl_get_device_gpio_range()
       -> mutex_lock(&pctldev->mutex)

If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
can choose an atomic carrier and call gpiod_set_config() while holding a
spinlock.  A minimal Lockdep reproducer preserving this carrier reports:

  BUG: sleeping function called from invalid context
  #0: ... (&global_shared_desc.spinlock) ...
  pinctrl_get_device_gpio_range
  gpiochip_generic_config
  [ BUG: Invalid wait context ]

This looks similar to the Meson fix that marked the GPIO controller as
sleeping when GPIO configuration is routed through the pinctrl-backed
generic config path.

The local draft I am considering marks only these controllers as
sleeping:

  pinctrl: at91-pio4: mark the GPIO controller as sleeping
  pinctrl: stm32: mark the GPIO controller as sleeping
  pinctrl: sunxi: mark the GPIO controller as sleeping

The reason is that all three expose gpiochip_generic_config() and can
therefore reach the pinctrl mutex from the GPIO set_config path, while
their current gpio_chip registration does not set can_sleep.

Two other candidates from the same audit, bcm2835 and keembay, are not
part of this draft.  They use gpio_irq_chip::parent_handler, and gpiolib
rejects chained interrupts on a GPIO chip that may sleep.  Setting
can_sleep there would therefore break registration instead of fixing the
contract; those cases need a separate irqchip design review.

Does setting gpio_chip::can_sleep for the at91-pio4, stm32 and sunxi
pinctrl-backed GPIO chips sound like the right fix for this set_config
contract mismatch?  Or would you prefer this to be handled elsewhere in
gpiolib/pinctrl so that set_config sleepability can be represented more
narrowly than the whole gpio_chip?

Thanks,
Runyu

