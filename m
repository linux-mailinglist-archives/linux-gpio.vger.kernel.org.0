Return-Path: <linux-gpio+bounces-32708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOa7KZOVq2k5egEAu9opvQ
	(envelope-from <linux-gpio+bounces-32708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:03:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41936229B84
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70DD43020A54
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 03:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECF7284883;
	Sat,  7 Mar 2026 03:03:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4D8287E;
	Sat,  7 Mar 2026 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772852623; cv=none; b=lYt8tqZje0qCxE9MlDXlVt62LjfEHzLwUHntF+8neJbUvZWPUJohUtLYGu5F1uXOApe05T/B8Mvk7vR4qP+pBK8qA1K6bt9KWD//j11zKIvfUDc4J2K44LUHACchcyNiQR4SoVc8Ad+AQVq0uejUX/1AmgZhNKg1oJXxDqVkQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772852623; c=relaxed/simple;
	bh=2qEMoPU7Y7jQU/igu5k94abz0JxdmOk//rFiMzdngS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PemMceqb7aAi2en3r84EL7IWlYqsadhWyQSEEzJjc9hznIP5kr0tTyZlJfk/UbDl2lYdBJXgzVXJUYetuGH0zSMJdOnEcI9camMo/+DXZGSk8Hzx6xYzX0+1GHdJs2PcnasTQ/HJyHqiEhz9Dbj4j5GbI02K9ofbZiHFBod/K70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz3t1772852593tad37748f
X-QQ-Originating-IP: rCnVVLaFxZUPhKrsw8HeluFr67JBPivdf/UyOL1eGq0=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Mar 2026 11:03:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14700551489280560095
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: xujialu@vimux.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 0/3] Remove <linux/of_gpio.h>
Date: Sat,  7 Mar 2026 11:00:56 +0800
Message-ID: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N5QgOzgsHQHe3MC7jJhuMq/jhHayaqTar+WE+1QHdQTo4LTrw2Qc7S+Z
	oHuaus9lKCNSBq6grexYvoMP4+B+vZCPFX46mpLEAvCpSRzBQou8GCNp7w3+IQgKBhM9sOc
	84qzYuvmg5BXxiqmalj99SKZSphdlm1D1OICpmrGpwdF7HprRcQibki3N2pKYdl6jAknSFs
	z+fEYBHCqtUAmt8zaMEDvdcYhg6osxpwxr57aEauIaz2oO05XbF4BCYV5vDNKSjdaPoE0Ix
	W2soR2ygS82+R4MyWkUsznqONssOlgqO+kvmi3+9eJJ0HNRJ+66ya0dQlUEI09aaxN8k1qR
	NbQ8yQiPC0Igg1tCD6zj3X0hm9o8LW2BU8hwNarmiiwQWxiMAtbbUnivUQRH65xwLX24028
	BTgro9JN4C3ULmcKFUgIBblvpT+JtLMyCm/NzrFktKcS2nd2TKEQ/pLVFwRr1iAPVTybKok
	a9jpphKhdas/jwDH53U8BKKrVk+m0VMEz9OuqwhdQRvKm3i1bBPtwZXFr/px/er9Z5RFtXL
	1nJolkMQwEJwtVkUpC2Bj8qiZa6xlcSpA6G4wj2rZsGF0iQpOMqlNJgOIvXnPj9N5NmDZtd
	aA9EAs7+aPz6lgs1Icx5oHHrMe/4CeCVgKvr0j2IclSGVBitHAj/5Fmzdaf47pEb8h7gGIG
	S5NPX4eLV3UK45nw02qB1/MWGi+Qiz6OSYtv+Fz2ThKGkgDh7iPZ15lzQpCaHTppM1GoBdk
	sGM550YR7W2FO4XbQACIY6Jm/Ub1qwZpGSyYuV00LklsbPi2VL8uwOf18cGiKHJmHEaP+xk
	jm7E2QIxEHoZ/hVcJ0rbWcm6fPqR4rSf+rIrttU3FlPCvM2RVOEgnx3o0SYxKgqbjtNmKBK
	dlFQlltTqsaHRCcfoodVTRnZ6ro5Vxa3OBGr7iqs/r+XE272kf3BkRj2Sp6UIqOmkukULjh
	E/hxsV0AcwLAzJMVfaMqybl+iwXZ0g1GvE8W/UYJrnY5FPcoyWzuyi9Ic
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 41936229B84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32708-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.405];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Convert the last three NFC consumers of <linux/of_gpio.h> to the
GPIO descriptor API, then remove the deprecated header entirely.

Changes in v4:
- Fix uninitialized reset_gpio in I2C/SPI paths by initializing it
  to NULL in nfcmrvl_parse_dt(). (Jakub Kicinski)
- Fix GPIO polarity for nfcmrvl: use GPIOD_OUT_HIGH and invert
  gpiod_set_value() arguments to match active-low reset line
  documented in marvell,nci.yaml. (Jakub Kicinski)
- Fix continuation line alignment in s3fwrn5. (Jakub Kicinski)

Changes in v3:
- Expand commit messages with more detail. (Linus Walleij)
- Add missing Signed-off-by. (Linus Walleij)
- Remove include/linux/of_gpio.h entry from MAINTAINERS. (Linus Walleij)

Changes in v2:
- Add rename quirks in gpiolib-of.c for s3fwrn5 legacy DT properties
  (s3fwrn5,en-gpios -> en, s3fwrn5,fw-gpios -> wake) to preserve
  backward compatibility with old device trees. (Linus Walleij)

[PATCH v4 1/3] nfc: s3fwrn5: convert to gpio descriptors
[PATCH v4 2/3] nfc: nfcmrvl: convert to gpio descriptors
[PATCH v4 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>

 MAINTAINERS                      |  1 -
 drivers/gpio/TODO                | 28 ----------------------------
 drivers/gpio/gpiolib-of.c        | 31 ++++---------------------------
 drivers/nfc/nfcmrvl/main.c       | 47 ++++++++++++++++-------------------------------
 drivers/nfc/nfcmrvl/nfcmrvl.h    |  4 +++-
 drivers/nfc/nfcmrvl/uart.c       | 23 ++++++++++++++++-------
 drivers/nfc/nfcmrvl/usb.c        |  2 +-
 drivers/nfc/s3fwrn5/i2c.c        | 54 +++++++-----------------------------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++++------
 drivers/nfc/s3fwrn5/phy_common.h |  5 +++--
 drivers/nfc/s3fwrn5/uart.c       | 43 ++++++++++---------------------------------
 include/linux/of_gpio.h          | 38 --------------------------------------
 12 files changed, 65 insertions(+), 222 deletions(-)

