Return-Path: <linux-gpio+bounces-38466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2z2TByG5L2p/FAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:34:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED968491A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:34:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=XqJoLJhD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38466-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38466-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65FB63010268
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA533CF025;
	Mon, 15 Jun 2026 08:34:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E837CD52
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512462; cv=none; b=D6/ymu1ERI5ZXbDW9jNN5hV8Xrha8GxjkRxCNF96Kktk7x5JVhJ7n1Cq73zAsdKIDaLxKlvBaVbUkDMLdG4BC06FPLxPrFfzAJ9myBmtwSqMNmUlMxgC8Bm30G6WiVx/eO4aqqPm5fVKtyoxV8FRTYNft6Jv9dNO9SCEIzwTDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512462; c=relaxed/simple;
	bh=B85cMPOr49iZ1u4+mhMX5r28Vr9uQa+N5lyLQI6PLjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=tEuf5N6rA18Q6pSD3d+R0tUeDPZN2wfY6gLUH/oGIarh9a7efAL2H9kxpIqck3AF8U/QKA8tRLI2Q5azPoNYMVlUw8wV2UFNPUrHCrlVUc7i9T0fgmTmVeus+2uWjvOsdaFfrJffy+HJFnj32OvZ+naCoOJV+twmrqd0OuSp3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XqJoLJhD; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615083412epoutp011e1a6ed3eba90f4bf6df0b2e990a04e1~5NCMD4Iyz2578525785epoutp01I
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615083412epoutp011e1a6ed3eba90f4bf6df0b2e990a04e1~5NCMD4Iyz2578525785epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512452;
	bh=KhuMmUqphIgaaYpgdXDk7UgsJLLox2AR9vG8/O3XcIo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XqJoLJhDknqHNRQoxcO4cBtnqVX0xue4seMl7LGkXlPCuJp1bX6D00CZjvZRik4Ei
	 KJOOWRof5OVoAYspgPycdwJ93TE0SdZZQqoJXQbfF6mRVK5RNhtCEAPJfXgcvEJxjl
	 nwkwXeRE5nMto5ODNUeLTP1Lp9Xerxr0nY+9YD8g=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260615083411epcas5p134cd104d32ea19b3d8fdc1c46732225c~5NCLeco3l2849128491epcas5p1W;
	Mon, 15 Jun 2026 08:34:11 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3Lp731sz6B9m7; Mon, 15 Jun
	2026 08:34:10 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688~5NCKJndSz1417414174epcas5p18;
	Mon, 15 Jun 2026 08:34:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083408epsmtip17cc8b873406b8d5dd19aaedf37ea0d44~5NCIjrR770235602356epsmtip1c;
	Mon, 15 Jun 2026 08:34:08 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 0/5] Add minimal Exynos8855 SoC support
Date: Mon, 15 Jun 2026 14:22:47 +0530
Message-Id: <20260615085252.1964423-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688
References: <CGME20260615083410epcas5p162d288f0bb2431bdd3653011d7a72688@epcas5p1.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38466-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,samsung.com:dkim,samsung.com:mid,samsung.com:from_mime];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AED968491A

This series adds initial support for the Exynos8855 SoC and also
initial SMDK board support. 

Exynos8855 is octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
arranged in 3 clusters. And other peripheral for mobile application.

This initial support consists of CPUs, pinctrl and related nodes
needed for initial kernel boot.

With these patches, kernel can boot using initramfs till file system mounts.

More platform support will be added in near future, clock driver to go next.

Chanegs since v1:
* Fixed some of the review comments by Sashiko [1]
* Dropped serial node, will be added once clock support is available
* Dropped wkup interrupt for CMGP block, will be added later

Link of v1:
https://lore.kernel.org/linux-samsung-soc/20260612163020.411761-1-alim.akhtar@samsung.com/

[1] https://sashiko.dev/#/patchset/20260612163020.411761-1-alim.akhtar@samsung.com?part=4

Alim Akhtar (5):
  dt-binding: ARM: samsung: Add Samsung Exynos8855
  dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible
  pinctrl: samsung: Add Exynos8855 pinctrl configuration
  arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
  MAINTAINERS: Add entry for Samsung Exynos8855 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 581 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 199 ++++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 123 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 10 files changed, 953 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi


base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
-- 
2.34.1


