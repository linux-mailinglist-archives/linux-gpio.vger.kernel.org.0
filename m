Return-Path: <linux-gpio+bounces-32376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ3rNsBdpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADD1D5C6A
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1587C3017FA8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0FA38E106;
	Mon,  2 Mar 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="z1Zd40nD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA411329395;
	Mon,  2 Mar 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445115; cv=none; b=KglCHBRrASqM28hHZDq5YNlS2ZA3E0GyjOkTX/+lKAKClYTX15UqibX5bVDP9brj2C4FFjzxUC+r8moixxxF/roY2JXTDcQZ7ii987gpcSguBR1oa03lpAAG78omI2kJH69FNuWInLbh9lnp/c1c3rsv2rhIY6go169JspZcKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445115; c=relaxed/simple;
	bh=/cXOPYRUcTpiWHkeUSIypoq2Hu8lBbuxlolVjwl0+YQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=fb4pGgFo6cmFDRYNrMMV5me0Mlvf7UuayziJ1UKFlqUkKBlKpMElAoBHCnaLw0PjicC+EYQgMCoCvgWqC0jooiGeHj8gFzy0Xybf0yZAKppMe8hDcgOBw+1LOjph26QJ842lxKcNDxg49LiRDJdqgoA+cFqT7iH2SED2t8w+RZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=z1Zd40nD; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772445110; bh=xi2deOfZt/swWj3qsJMpYC60TcICAMXm3VhDmFksI3M=;
	h=From:To:Cc:Subject:Date;
	b=z1Zd40nD1cbpuY3ahuLlaW1VG9g6GCo1AwcrJ+rMc0OYz6spBOOHyft2RsnCTcwx8
	 5qfdYhWnSuejNTr8sCYVkhKZ1SGwTE1JNuLSs/uL5O9mNE76YY0VuMiiF9hSqfXddn
	 mIgEOn66w4uCQ9A9yzoniS2ChgHuakZg4p/muafg=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id CEF2F43C; Mon, 02 Mar 2026 17:51:47 +0800
X-QQ-mid: xmsmtpt1772445107tnvnoiqvf
Message-ID: <tencent_3D2D916753B073166B6392D71A1F4B371908@qq.com>
X-QQ-XMAILINFO: NQGwiM8jnhn4PkaKrd25jmeyhSX09hpzY3sEQ5tV6/38ZMC3z+tSHt4yYCFtsQ
	 R0jRWbGgMLGd1thTZ/SldGuQqH5MZht7vaTgAjPxaBWic3g4PnTzBWdGDanQC0k2+tllXcs9xTSQ
	 f29gngbf0qHwR9G+JNC16Wx6XEXMrOKit1TM8GA5jyjyFn+Fl+dXiAU9BSLpSWWWXDoWr1YdhUnB
	 Cblqfva4CqIbV8C+1RL3oUo1WoST55+TMtKXMcCaB6EDsKUhgKtjwqWzpPWIstPX5ir+zDYifjP7
	 4qJhgSa/lFFYpcCWh8oiO6Suap20hs9b42R/noT6bD1TdvDD3K67XSeSpM6t2IBIXXgVKl8jteGT
	 yaJ+CQRKFDk0/u+AGeW/1CH3ZKC1j7phFsXjtnDW7zgVhcS8r5ElfHw6m9NNQfQ9Tw+Mw3a8421X
	 fytF2yzTThk3i6o963qnsJyojFelloMTOGW8T764enbplXpXWUM/ARNDH7ZB23o0eSo+gKTn6JC1
	 RegrdVHORgb2OkZWuGziiDXyaRgbFoUi9hWbKI0j+0W1ITTYr4JDrSh/xmuV+BLJxAacEOz8Z4xf
	 WJnbD1PMyq2STX2jIyT2nJjXJMd7ofOPP9tWUdD5mK5RI8/1RTE7QUZW2TjV0beRhVBnf7zodoMz
	 cMJkP2IbAoh2W4OlgERqE6MIn0W+76dSaduqHXpMTjOqTJ+cjNU2F9k3MvzXebD4vSs2YN18m4+o
	 +RwX6RKng/otndIZesx5OGpnHXcf1cdNN7JSKJb1ClcmeNUY91syhMz7ywBDxN/ZHtxUb3tGLFZ0
	 DmArSF81qOzdk8hzonrc7bJZKQC/fddCMRuSQoicE3cUfhm+unzijzYbaMfJWFxydnO9WPg2XiXS
	 d43j5It1SqDRFyapeb1di2fJseWdbt3hTqlNtJ7db98AxjgRxxR7jeR2K5iSLaVE7v2/d/iyUaJQ
	 +BleRpKaBiaaF1I6IsEGHO8CQ4kGlyzG9QogqqFCdx4P9QtNJZBjTs2kJNrfWI/e/XLFWHJxJDNT
	 Z9AP3mZjccwyMvQ7HQsXRNppDLDOrQgvr1MXkUbg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 0/3] gpio: Add Phytium platform GPIO controller support
Date: Mon,  2 Mar 2026 17:51:44 +0800
X-OQ-MSGID: <20260302095147.2483-1-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32376-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,bgdev.pl,kernel.org,phytium.com.cn,qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:mid,qq.com:dkim]
X-Rspamd-Queue-Id: A1ADD1D5C6A
X-Rspamd-Action: no action

This series adds support for the Phytium platform GPIO controller.

It includes:
- devicetree binding for "phytium,gpio" and vendor prefix registration
- core and platform GPIO driver support
- MAINTAINERS entry

This submission intentionally covers only the platform GPIO path.
Phytium PCI GPIO and SGPIO support are not included in this series.

Validation:
- dt_binding_check passed for Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
- build tested with ARCH=arm64 cross compile
- runtime tested on a Phytium arm64 board with DT boot

Zhu Ling (3):
  dt-bindings: gpio: add Phytium GPIO controller
  gpio: add support for Phytium platform GPIO controller
  MAINTAINERS: add entry for Phytium platform GPIO driver

 .../bindings/gpio/phytium,gpio.yaml           | 134 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  10 +
 drivers/gpio/Kconfig                          |  16 +
 drivers/gpio/Makefile                         |   2 +
 drivers/gpio/gpio-phytium-core.c              | 444 ++++++++++++++++++
 drivers/gpio/gpio-phytium-core.h              |  90 ++++
 drivers/gpio/gpio-phytium-platform.c          | 226 +++++++++
 8 files changed, 924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
 create mode 100644 drivers/gpio/gpio-phytium-core.c
 create mode 100644 drivers/gpio/gpio-phytium-core.h
 create mode 100644 drivers/gpio/gpio-phytium-platform.c

-- 
2.34.1


