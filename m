Return-Path: <linux-gpio+bounces-33810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pd5NqLXu2k6pAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 12:01:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D82C9EA8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 12:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33CD93150B0B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA833C457B;
	Thu, 19 Mar 2026 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PcDkGLK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAA3C345D
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918003; cv=none; b=UNETrPk0autNnYLbuPPIito/jv2Of2m3JHI3TTPbXTfqe5opoTGWqHkj7zznp/RcD/B6lHG6AB6X5WtIMJO+6wLJx0SH1FdNwNz8PseT8YBH6HXN6k0sDHnKxqBMV80GqNB93ozz02DI4Pfs9DnuxuuVVfgMht6UuFrlTW28URU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918003; c=relaxed/simple;
	bh=lDsTKKOW0M02gxeWI5CUcjsdvvgs0U6RXB5vNRUgEMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVL4A7gzFig25gyzTPN/fUp3HRSIOL9LKe5+e3hpoN0c9AAfTorEmA+Y1gaBSHVdpXvazQMSkGcl9IvNdo0zNYHtUm1aRquCMvNp/LUFMlh0eNOlSwVboedMsfFVFqPmilre+FdMVaFyco/Q+ts3GWKIfg3xz+at7o8/CXU8i/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PcDkGLK+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=KB81XvoxVzxPeO
	i/26wCRtiORDc5p8n0JHh4CTp/OTA=; b=PcDkGLK+SGUtnsfgW6hOFscnOGL+BT
	dKa1bQM2q3f+KMWLx51FbKecyKl3CTTGMdyGB6dqrwuL5JkEEudobAqxgeU6ZFMr
	Q/egIiyx6OHRYc21xA0Sg6RHS9duWIff1CFbEaPP2CfF36ozg9i4SuaRZ7MV6c5H
	eCWWVJZ5KtG2AIocqV87rCfe50t4kw5N3wmJEAYynvgH2nsxCmP0QR9PCNreuRFf
	mKmqzGl/3S3bTfYmXZSe0hhxeuBYswfqzt+swtd5l3aIkB5Df3owLfa84N3Fk1B2
	xEr2d5idm1V67Pg0LjLzpw4DgNEnINr8JKle2ffApkdPHx/l3cXj3/1g==
Received: (qmail 1099341 invoked from network); 19 Mar 2026 11:59:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:51 +0100
X-UD-Smtp-Session: l3s3148p1@AI+1d15Nvt0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 00/15] hwspinlock: move device alloc into core and refactor includes
Date: Thu, 19 Mar 2026 11:59:22 +0100
Message-ID: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33810-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,lists.linux.dev,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,analog.com,infradead.org,sholland.org,posteo.net];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D4D82C9EA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v4:

* update Documentation, too, when ABI gets changed (Thanks Antonio!)
* rebased to 7.0-rc4
* added more tags (Thanks!)

My ultimate goal is to allow hwspinlock provider drivers outside of the
subsystem directory. It turned out that a simple split of the headers
files into a public provider and a public consumer header file is not
enough because core internal structures need to stay hidden. Even more,
their opaqueness could and should even be increased. That would also
allow the core to handle the de-/allocation of the hwspinlock device
itself.

This series does all that. Patches 1-2 remove the meanwhile unused
platform_data to ease further refactoring. Patches 3-9 abstract access
to internal structures away using helpers. Patch 10 then moves
hwspinlock device handling to the core, simplifying drivers. The
remaining patches refactor the headers until the internal one is gone
and the public ones are divided into provider and consumer parts. More
details are given in the patch descriptions.

One note about using a callback to initialize hwspinlock priv: I also
experimented with a dedicated 'set_priv' helper function. It felt a bit
clumsy to me. Drivers would need to save the 'bank' pointer again and
iterate over it. Because most drivers will only have a simple callback
anyhow, it looked leaner to me.

This series has been tested on a Renesas SparrowHawk board (R-Car V4H)
with a yet-to-be-upstreamed hwspinlock driver for the MFIS IP core. A
branch can be found here (without the MFIS driver currently):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest

Build bots reported success.

Happy hacking,

   Wolfram

Wolfram Sang (15):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file
  hwspinlock: add helpers to retrieve core data
  hwspinlock: add callback to fill private data of a hwspinlock
  hwspinlock: omap: use new callback to initialize hwspinlock priv
  hwspinlock: qcom: use new callback to initialize hwspinlock priv
  hwspinlock: sprd: use new callback to initialize hwspinlock priv
  hwspinlock: stm32: use new callback to initialize hwspinlock priv
  hwspinlock: sun6i: use new callback to initialize hwspinlock priv
  hwspinlock: handle hwspinlock device allocation in the core
  hwspinlock: move entries from internal to public header
  hwspinlock: remove internal header
  hwspinlock: sort include and update copyright
  hwspinlock: refactor provider.h from public header
  hwspinlock/treewide: refactor consumer.h from public header

 Documentation/locking/hwspinlock.rst          |   7 +-
 MAINTAINERS                                   |   3 +-
 drivers/base/regmap/regmap.c                  |   2 +-
 drivers/hwspinlock/Kconfig                    |  10 --
 drivers/hwspinlock/Makefile                   |   1 -
 drivers/hwspinlock/hwspinlock_core.c          | 129 +++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h      |  72 --------
 drivers/hwspinlock/omap_hwspinlock.c          |  27 ++-
 drivers/hwspinlock/qcom_hwspinlock.c          |  69 ++++----
 drivers/hwspinlock/sprd_hwspinlock.c          |  39 ++---
 drivers/hwspinlock/stm32_hwspinlock.c         |  26 +--
 drivers/hwspinlock/sun6i_hwspinlock.c         |  36 ++--
 drivers/hwspinlock/u8500_hsem.c               | 155 ------------------
 drivers/iio/adc/sc27xx_adc.c                  |   2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   2 +-
 drivers/mfd/syscon.c                          |   2 +-
 drivers/nvmem/sc27xx-efuse.c                  |   2 +-
 drivers/nvmem/sprd-efuse.c                    |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/soc/qcom/smem.c                       |   2 +-
 drivers/spi/spi-sprd-adi.c                    |   2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   |  57 +------
 include/linux/hwspinlock/provider.h           |  60 +++++++
 23 files changed, 263 insertions(+), 446 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (87%)
 create mode 100644 include/linux/hwspinlock/provider.h

-- 
2.51.0


