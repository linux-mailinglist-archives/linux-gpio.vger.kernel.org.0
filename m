Return-Path: <linux-gpio+bounces-31694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AvyNNtOkmlvswEAu9opvQ
	(envelope-from <linux-gpio+bounces-31694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 23:55:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0213FF1A
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 23:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB33D3019829
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 22:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579D830BF52;
	Sun, 15 Feb 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Khem6T/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7E30B52A
	for <linux-gpio@vger.kernel.org>; Sun, 15 Feb 2026 22:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196118; cv=none; b=VXnQXcFG1NoR9pjhyj4b+o/HcWHKTvVEuHJpt8npltEKVItX7sVVlFJJqdomHteR1rnnIR4Pv6P4tA7FUm/9ipq1GGrj9bDeUS1VqDlqJ0jnLs1+56ejX7KXG3xNQkVS6g8OhmdpNathe7+WKaktPhM2p3Jp1xg/dyls4SWkqlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196118; c=relaxed/simple;
	bh=TNyRzSBr/AtNCce67q749OZFUSphAmrWNkHgydf587w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pugB8OQTiyO4HNQhVnv4qw314ZAVN9a4y/7FwFLPXPd8NtIelrk1mOzhrSzDma42gEcS71akiQbCOPiCDY9N8TrSYrfbMOAty2CR5pNhcold81mFcdj4BgcyygLplKJtugNLinv95qFpx88x6V46W6QpcwV2FmUmtQGjMKHWx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Khem6T/L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=fjqK1CnmMLnynK
	mUkq2NGNXQxQWHiqDXRDV1cxXQMFc=; b=Khem6T/LPXw9DcbGo2IAw6sOzSG6U5
	H+3X7IjRDdV59N8cB8IV56DQabVc5sY0EGs7isNQKWgzIcrflS0xfTsyWykrOCIN
	uXqpNDup5wRHcdl/ovjJEz4Kph6I3yNxxllxraRzP/cLNeSBfT24ixK4hIpVTbFu
	KPhRq0XDDSGz0w/xy9Jv1AYH2A9nrni1JQ2Z+U+GiSqkbGNbWo9dEOvx68PTFusm
	BA+a4Gt8A7K2lky5w3aEzE14WxR8ylMT5G5nh+AxRcgKht+aPrFfq2KQigyR28W+
	r4SDphAActIw7+YT8hOnwMb1RpfMPbwjCPddRcsyeOy0MBMvVqYD3Zag==
Received: (qmail 3011230 invoked from network); 15 Feb 2026 23:55:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:04 +0100
X-UD-Smtp-Session: l3s3148p1@reycuuRKXIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
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
Subject: [RFC v2 PATCH 00/13] hwspinlock: move device alloc into core and refactor includes
Date: Sun, 15 Feb 2026 23:54:40 +0100
Message-ID: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31694-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,lists.infradead.org,sang-engineering.com,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,lists.linux.dev,linuxfoundation.org,redhat.com,lwn.net,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,infradead.org,sholland.org,posteo.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 65A0213FF1A
X-Rspamd-Action: no action

My ultimate goal is to allow hwspinlock provider drivers outside of the
subsystem directory. It turned out that a simple split of the headers
files into a public provider and a public consumer header file is not
enough because core internal structure need to stay hidden. Even more,
their opaqueness could and should even be increased. That would also
allow the core to handle the de-/allocation of the hwspinlock device
itself.

This series does all that. Patches 1-7 abstract access to internal
structures away using helpers. Patch 8 then move hwspinlock device
handling to the core, simplifying drivers. The remaining patches
refactor the headers until the internal one is gone and the public ones
are divided into provider and consumer parts. More details are given in
the patch descriptions.

One note about using a callback to initialize hwspinlock priv: I also
experimented with a dedicated 'set_priv' helper function. It felt a bit
clumsy to me. Drivers would need to save the 'bank' pointer again and
iterate over it. Because most drivers will only have a simple callback
anyhow, it looked leaner to me.

This series is based on the cleanup series "hwspinlock: remove
platform_data from subsystem" and has been tested on a Renesas
SparrowHawk board (R-Car V4H) with a yet-to-be-upstreamed hwspinlock
driver for the MFIS IP core. A branch can be found here (the MFIS driver
is still WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest

Buildbots seem to be happy, too.

Looking forward to comments. I especially wonder if the last patch
should stay as-is or if it should be broken out, so individual
subsystems can pick up their part (with a fallback in place, of course,
until the last user is converted).

Happy hacking,

   Wolfram


Wolfram Sang (13):
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
  hwspinlock: refactor consumer.h from public header

 Documentation/locking/hwspinlock.rst          |   2 +-
 MAINTAINERS                                   |   2 +-
 drivers/base/regmap/regmap.c                  |   2 +-
 drivers/hwspinlock/hwspinlock_core.c          | 129 +++++++++++++-----
 drivers/hwspinlock/hwspinlock_internal.h      |  72 ----------
 drivers/hwspinlock/omap_hwspinlock.c          |  29 ++--
 drivers/hwspinlock/qcom_hwspinlock.c          |  69 +++++-----
 drivers/hwspinlock/sprd_hwspinlock.c          |  41 +++---
 drivers/hwspinlock/stm32_hwspinlock.c         |  28 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c         |  38 ++----
 drivers/iio/adc/sc27xx_adc.c                  |   2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   2 +-
 drivers/mfd/syscon.c                          |   2 +-
 drivers/nvmem/sc27xx-efuse.c                  |   2 +-
 drivers/nvmem/sprd-efuse.c                    |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/soc/qcom/smem.c                       |   2 +-
 drivers/spi/spi-sprd-adi.c                    |   2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   |  29 +---
 include/linux/hwspinlock/provider.h           |  60 ++++++++
 20 files changed, 268 insertions(+), 249 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (93%)
 create mode 100644 include/linux/hwspinlock/provider.h

-- 
2.51.0


