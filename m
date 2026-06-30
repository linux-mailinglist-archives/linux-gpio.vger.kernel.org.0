Return-Path: <linux-gpio+bounces-39176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IlA6K32bQ2rldAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:33:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F866E2E8D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b="jC5ljsv/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39176-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39176-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0AFC3075C97
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A212E6CCD;
	Tue, 30 Jun 2026 10:16:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB143EFFD5;
	Tue, 30 Jun 2026 10:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814593; cv=none; b=I2tI4+fIxzHwDztvpT85xcUkrT1Og6sPXT0hEdgJeQp0eW1vh6lpVyZgUf8pwC7/lpe30sGTy5p/tKl3i4iKDEkCXzlvt6tnkIYgPZE55esIZDgsrugIIhspWanAy/+2FjB+LTUcFWYg4mMTf7SWi3yE3thwvA0osJP2BJOCBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814593; c=relaxed/simple;
	bh=zi1xEpvM1ZjiGj+ROwM/4ktLOPRCEThBMSmgtwizAFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ojdumP4tpbyy62dJc2IcSj6bsQL1sZWvAXS+kXjMh1ZbBaxg17+Fvnhb8CE6GqzoSlB0iLcMAFwZ62CLt+OlVMP947MxyCHb4a39ucPuAmzhMXZ7svJURIGe5VlrK5HKkAqilrMFVfRFarXsmamiget/4blPpBCldEqZqcfwEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=jC5ljsv/ reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DC1D1CD0CC;
	Tue, 30 Jun 2026 13:16:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782814585; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wN+EcU0gGHH33bhyn/gHbeG7JZHnwpKvV3LKnR2eWeM=;
	b=jC5ljsv/fRpC1AtIMayTHfeg0yZ0qKe3UHL+ssTZe5GiIleQX+Myb6i/5wARIpwukmdGOf
	QJFTuIGKV2MQA1M310phV3qVyA9mZj4j+mkUfT+Lk2N2zJFDQ33btXi9eLN9nKLrjsuI2h
	Vpp9lVjL/GB8xT7JYAQCPHwIC+p2HgwuMxU9fm51+i5RZ/59eWzCwm5pkFD7KpLYKIbVBB
	lDdzflPJ1asiQxq3co7fi2OEu6pYO6S4941wKqhNEVy3amf5Ugu7qy/33HiTr54wp3mTSC
	xtoSlGgBlLk6G/ebVuEnv+A4NnxvrXG6JL9zAQSkPYBPDwuDbU73oPWgzDHgVA==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Tue, 30 Jun 2026 13:15:43 +0300
Message-ID: <20260630101545.800625-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_FROM(0.00)[bounces-39176-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,baodeep.com:mid,baodeep.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[baodeep.com:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11F866E2E8D

gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
the underlying chip's can_sleep, but under that lock it calls config and
direction ops that reach sleeping pinctrl paths. On a controller with
non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
runs from atomic context:

  BUG: sleeping function called from invalid context
    ... pinctrl_gpio_set_config <- gpiochip_generic_config
    <- gpio_shared_proxy_set_config (voting spinlock held)
    <- ... <- mmc_pwrseq_simple_probe

This was reported on Khadas VIM3 and worked around for Amlogic by
commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
sleeping"), which marked the whole meson controller sleeping. That
workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
no longer detects devices, because its IRQ-disabled read slot calls the
non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.

Patch 1 fixes the proxy locking generically (always a sleeping mutex).
Patch 2 then restores meson can_sleep=false, fixing 1-Wire.

Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
gating on gpiod_cansleep() change behaviour. No current device needs
atomic (non-cansleep) value access on a shared GPIO -- every report
(Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
(eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
which is what the proxy exists to vote on; bit-banging that needs atomic
access cannot work through voting anyway. An alternative that keeps
atomic value access (split locking) is possible but adds a second lock
and new race windows, so this series takes the simpler mutex-only
approach.

The two are a unit: patch 2 must not be applied without patch 1,
otherwise the original VIM3 splat returns on boards that share a meson
GPIO -- please keep the order. I have not Cc'd stable; I will request
stable backports separately once both patches have landed.

Changes since v2:
- gpio: shared-proxy: drop the set_func callback from
  gpio_shared_proxy_set_unlocked() and call gpiod_set_value_cansleep()
  directly. The shared direction_output path drives the already-output
  line through the value setter instead of re-issuing
  gpiod_direction_output() (equivalent, minus a redundant per-edge
  re-assert of drive config/bias). No change to the voting/value
  behaviour.

Changes since v1:
- gpio: shared-proxy: open-code the descriptor mutex; drop the
  gpio_shared_desc_lock guard and the gpio_shared_lockdep_assert()
  helper, move the mutex rationale to the can_sleep assignment.

v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-1-v@baodeep.com/
v2: https://lore.kernel.org/linux-gpio/20260625115718.1678991-1-v@baodeep.com/

Viacheslav Bocharov (2):
  gpio: shared-proxy: always serialize with a sleeping mutex
  pinctrl: meson: restore non-sleeping GPIO access

 drivers/gpio/gpio-shared-proxy.c      | 76 ++++++++++-----------------
 drivers/gpio/gpiolib-shared.c         |  9 +---
 drivers/gpio/gpiolib-shared.h         | 28 +---------
 drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
 4 files changed, 33 insertions(+), 82 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

