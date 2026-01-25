Return-Path: <linux-gpio+bounces-31041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQLA1hmdmkmQQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:52:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D481CFA
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C09BB300566A
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 18:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC1E2EF67A;
	Sun, 25 Jan 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GUb3b+DY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8523EAB3
	for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367120; cv=none; b=TEh0HQDKCAmLMvAvhpzH2MS0Kr//FnDroLV8p3Hss9w9yHqSjpUbl7hl0ZaWyBUl3ZQzAlQuKWrlawTCULvQ/+4UazdhIQA39wfD4pxEqd/loqLGP6NV7SNCp/D4oJPM+RG55dEoeoTIsJ5E/lAzsqS6rbKUc+F1mkblyNu9EQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367120; c=relaxed/simple;
	bh=zMaEvU68BWlhZpxDtfLltxRySkbC44HvvmZ1IlohbuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piW3uFq3suTZJxKoTUbKQ8bu3XWmvTeq3HDCjw3wjtwWNQB3UHhoSPyjOlKVyTqe9f5aH8BxPwgVcDZL5/QsYizsOTVrDKMb++qd/YkJJRUZMlip4N9wZXl+wsFXLBmN4Q8beTES+t2qHHDo/8A3o3vmr7jcI79DL8bSFa43ygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GUb3b+DY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=1cYkOR6p+28OeK
	pILTeDYy1YUmgndRIsJrSEImzjWWs=; b=GUb3b+DY+9mJpJ7B3Rk9AyWsPIlsID
	gYiUHWLfH4MhylfpJpW6wK1EEp4qmRvMXufRAsUMyjw3n6a7jZTjlMDlAiAJeytr
	PDYusfLDkbrdpScgSILsNpYpTv9wxWk3n8sIRRm98T1X5yszKvRP0oq5bX6qilP5
	LjHLu7d1lAZJzkgT7s2l3Qa9JZdRes785y0OH4j4PHwtTrndA/aCfpLOjcH1lb4z
	BtZ0JoJOhdKJB5uQXdN4teK3yDzq+Q8ww2MIjkXg7v93zhNt8uES1joQCXP5zbLl
	u9kPE+ySeVYAst58JG+Fjj7CLKQTVDUGyLh4C9GbhtN1nhxaNB2QPgsw==
Received: (qmail 2369426 invoked from network); 25 Jan 2026 19:51:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:47 +0100
X-UD-Smtp-Session: l3s3148p1@Xefl4TpJKhBtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [RFC PATCH 0/4] hwspinlock: refactor headers into public provider/consumer pair
Date: Sun, 25 Jan 2026 19:46:51 +0100
Message-ID: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31041-lists,linux-gpio=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6C3D481CFA
X-Rspamd-Action: no action

TLDR: I want to create a hwspinlock provider outside of the hwspinlock
directory. So, I refactored the headers into a provider/consumer pair.
Which seems to me like a reasonable seperation anyhow. No functional
changes. My build tests went fine and buildbots are happy, too.

Longer explanation:

There is a device (MFIS) in newer Renesas SoCs which combines various
things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
strictly separated. Registers are kind of mixed and its register
unprotection scheme will need one of its own locks. I tried various
paths to handle this device (MFD, auxiliary bus) but I concluded that
the sub-device dependencies give enough reasons for a single driver in
drivers/soc/. So, this series will allow me to instantiate a hwspinlock
provider from the other directory.

Patches 1+2 do the actual refactoring with a fallback being in place. I
used '-B' with git-format-patch in this RFC, so the actual changes are
more visible when the headers are moved.

Patch 3 converts all the users. There are not many. We could try to get
all the acks for this single patch. Or I can break it into single
patches and send them to subsystems. I don't mind.

Patch 4 simply removes the fallback.

Looking forward to comments on this approach. If the hwspinlock
maintainers like it as is, I would kindly propose to apply patches 1+2
after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
avoid chasing a moving target and b) this would remove one dependency of
the hwspinlock driver I originally intend to upstream, of course.

I would take care of patches 3+4 as needed.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes

Patches are based on linux-next as of 2026-01-21.

Opinions?

Thanks and happy hacking,

   Wolfram


Wolfram Sang (4):
  hwspinlock: refactor existing headers into provider.h
  hwspinlock: refactor existing headers into consumer.h
  treewide: convert hwspinlock users to the new consumer header file
  hwspinlock: remove old header file

 Documentation/locking/hwspinlock.rst          |  2 +-
 MAINTAINERS                                   |  2 +-
 drivers/base/regmap/regmap.c                  |  2 +-
 drivers/hwspinlock/hwspinlock_core.c          |  5 +--
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +-
 drivers/hwspinlock/qcom_hwspinlock.c          |  4 +-
 drivers/hwspinlock/sprd_hwspinlock.c          |  4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |  4 +-
 drivers/hwspinlock/sun6i_hwspinlock.c         |  4 +-
 drivers/hwspinlock/u8500_hsem.c               |  5 +--
 drivers/iio/adc/sc27xx_adc.c                  |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |  2 +-
 drivers/mfd/syscon.c                          |  2 +-
 drivers/nvmem/sc27xx-efuse.c                  |  2 +-
 drivers/nvmem/sprd-efuse.c                    |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  2 +-
 drivers/soc/qcom/smem.c                       |  2 +-
 drivers/spi/spi-sprd-adi.c                    |  2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   | 22 ++--------
 .../linux/hwspinlock/provider.h               | 40 ++++++++++++-------
 20 files changed, 49 insertions(+), 65 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (94%)
 rename drivers/hwspinlock/hwspinlock_internal.h => include/linux/hwspinlock/provider.h (78%)

-- 
2.47.3


