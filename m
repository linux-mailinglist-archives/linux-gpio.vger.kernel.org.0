Return-Path: <linux-gpio+bounces-38554-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xYjeIubyMGorZQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38554-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:53:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0368CA81
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 08:53:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=a8e3PpbJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38554-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38554-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 057F83014258
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 06:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58333115A2;
	Tue, 16 Jun 2026 06:53:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DE1FC7FB;
	Tue, 16 Jun 2026 06:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592802; cv=none; b=tgfXH3x7e8b4gv9O7uU9istRkuL7I0/nqj8a+Jv+bwX8BtGM+DKE4v8GfO9pFxkGkOQ6M2gU2aATGk10wD0QpSzsgYRFq7kxl8odAAsUINkhkMi3/M9mNAomvJeihzNhki0+xFOioO7ElIAkZ+7UN3KuuvBoXyFCP5OwZCRBKaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592802; c=relaxed/simple;
	bh=1RCHFrL0xFs3LvN+GZi8uDUe9fuZD2VFuKuLZX4E/KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nm7DQEJAY/zQ0EeAYatydh/6tKKRRIPA4X25C8PkzlTlPbKoi3EYTO60tX2D18P+4RPoReeGGFOimXWZRDPZqg9jJ5xeWneCfSyfCKJKSCURzZKj4547HD+HXVd2MDjILhqE5ZqimStnz0baQl82A0oPXxqKTT1yDY1tan0HF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a8e3PpbJ; arc=none smtp.client-ip=220.197.31.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Wn
	lNdu4Q/Vx9A/ATFwOA2xY6C+LCXc0557Vy6ZMSjDc=; b=a8e3PpbJRxlJ49GEmj
	yQdYhsEqMRdW3pmJoh7v6SmcA0cokQCfUB8R9TcKW+AQzx5VE1WaLTGpQFoxbj4n
	uKF04snrMivYT+EkfsM44HTUNYLFpw/eVMoC+rlHF09V3tN0JKy1qfPC/aECMTO7
	XK33phTHmSA1LDvpGGwHT0qJw=
Received: from haiyue-pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnL1+98jBqq30ZDg--.29032S2;
	Tue, 16 Jun 2026 14:52:46 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-gpio@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] pinctrl: Kconfig: fix unmet direct dependencies detected for MFD_STMFX
Date: Tue, 16 Jun 2026 14:52:37 +0800
Message-ID: <20260616065241.7478-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL1+98jBqq30ZDg--.29032S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUCF4UWFy3tF48Gr1ftFb_yoWkKrcE9a
	ykGFZ3Jr1Uu34UKF1xXF4fXryjya13Wr1Sva92v343ury3Ww1xt34kWa15Cwn7Wa97Gry0
	9ryFv3WfCrWjyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNwZ2JUUUUU==
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzR6S-Wow8r4LhQAA3k
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[haiyuewa@163.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:haiyuewa@163.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38554-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haiyuewa@163.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[163.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89E0368CA81

The commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
on OF_GPIO") will cause:

WARNING: unmet direct dependencies detected for MFD_STMFX
  Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
  Selected by [m]:
  - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

PINCTRL_STMFX selects MFD_STMFX, which depends on OF. Previously this
was gated transitively by OF_GPIO, which is dropped. So PINCTRL_STMFX
can be enabled on non-OF systems and select MFD_STMFX in violation of
its OF requirement. Add the missing "depends on OF".

Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..08218ef140e0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -549,6 +549,7 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
+	depends on OF
 	depends on HAS_IOMEM
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-- 
2.54.0


