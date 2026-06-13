Return-Path: <linux-gpio+bounces-38409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D8XBB163LWruiwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 22:02:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E767F874
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 22:02:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l6KVPK4c;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38409-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38409-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 241873014BE2
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 20:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420932D739C;
	Sat, 13 Jun 2026 20:02:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2923621CC71
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 20:02:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781380955; cv=none; b=bF7+NkzabFHVfAJ2a6+FznE9W429+G/tqv9BWbzFy3hznIYUAIPh/Udd2tdOmI/FUdBUlVCphRJ4uxyDYTeTIL9J0RkVDBYCjCKs2Y0nPBsikzEsYNPx6McJDPq2k8qOo5R/DXuNCe4xvNUDvSN7iLygXsXBP5UPNGkF6wVhynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781380955; c=relaxed/simple;
	bh=XrYrTPF4bW5tWYU9DwRf8itWM6erEdBIXXI3hnXLo54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MmtpdDYHckTPJUpRKdgRKBhzy+Z54z+OOS7pZYUOPEmV34Dup1W2B2zlCrl/6BLKyDa2/2EOoeJDgzCrLtT+62CztDEYEZSFkGm61xC+06Z/S7PDsNQu7oGNwnjyErmxQhcQHS7n3h+1JHbOsn7Bra+N9WQ7ld4wudLykuDvjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6KVPK4c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FBA1F000E9;
	Sat, 13 Jun 2026 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781380953;
	bh=8vjVflIdDqmtlgDcS+oT01doDcLhSernarQ3/338xT8=;
	h=From:Date:Subject:To:Cc;
	b=l6KVPK4cmFCHDq6+YCgIh1f7ZB9pXGfBh2uCAKrS3yxY9joQ6fSNDWoH0QR24QoI0
	 UOEE9zPsKK18nodk6oQ0MXNSCF90Db7//+O457oeqCqG8zNVA1fho+AQ89h2LoESZ5
	 hQeOgGc/Zq18ZJrvBSNTTSaKk7+lHDucayi3Amu3+64DdyvpWR9d8lrWMa8cTLg1Xt
	 EqSdif9nF60Syb4/6ECoQ8Duz3t2jig4gFMgCu7JfBnUIjfenDYf+uTvKSpINh6g4/
	 JdsC76JuxpnGco4lT8JaPfjky8eanwsJDY4xLjz7yxnvsVjD9v8NFSkAyRDCCCxoMr
	 zZNpb1gZQhVOQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 22:02:30 +0200
Subject: [PATCH] pinctrl: Export pinctrl_get_group_selector()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7EA2q0H9ingwmzaOSHaZSSQQ8
 ndHPfShoKtWMqjA6FytpHiLSR4dwq6i9LiNA1h6Z2rqpq3bEBlLyTrxAJ/mubDhhTRl5X4fuhT
 jIZ7Skdwvirssv/bl+mebu6efv0Hatg9AWCGnfQAAAA==
X-Change-ID: 20260613-export-get-group-selector-d41bc33539c8
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Jia Wang <wangjia@ultrarisc.com>
Cc: linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:wangjia@ultrarisc.com,m:linux-gpio@vger.kernel.org,m:nathan@kernel.org,m:lkp@intel.com,m:linusw@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38409-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A2E767F874

The recently added UltraRISC DP1000 is using this symbol, and in
a reasonable way as well, so export it.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp@intel.com/
Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3fcb7e584a93..1675dd36bd5c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -772,6 +772,7 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(pinctrl_get_group_selector);
 
 bool pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 {

---
base-commit: e3d967e6ef2f9605b132eabac64e984d884c81cf
change-id: 20260613-export-get-group-selector-d41bc33539c8

Best regards,
--  
Linus Walleij <linusw@kernel.org>


