Return-Path: <linux-gpio+bounces-38369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxcNIDswLGrtNAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:13:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBA67AC43
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:13:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=ptBKKfSx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38369-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38369-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9500326080D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 16:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C1390C88;
	Fri, 12 Jun 2026 16:11:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99A2BE7D1
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280701; cv=none; b=bTIz0f39gzfQNUhzx29l2KWsyIbwY0OA1J+tjQ9CZ/dpN7Dk9M60nCYYnpqrezYPMY2QSjYm4cPd7+A2vhHmPTRNq4wlq8jB3Ol6JSLf09yrBkgOSUVBx7NeIDb7EoTgZESECl7R4nPSDTqsGLFwk0cOh1e5Rh0yWRf7FRrLENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280701; c=relaxed/simple;
	bh=C4h9EdJZYlADWuf36oAoqn7TGOV0koyiTZfT0PDJDNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=geP5poAHcm62ep4CWf7kfprde4HtLUmW0Uj6j7szUBBY36uGCLspPqXeaOFjR4+FieliKvpOR6pqD4qUMTCUgNjNSgRjPo0/NkxPDOCYlvPt7C/Fkaqvz/6s6PyOGeUey3QUfb8eZgIHM7AHtCGTPO6hK4an6MSnMwVieyXPT+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ptBKKfSx; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260612161130epoutp04c722c77d09f560904e338ddb58d6ab22~4YVmtZfh42674626746epoutp04Y
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260612161130epoutp04c722c77d09f560904e338ddb58d6ab22~4YVmtZfh42674626746epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280690;
	bh=ZSlvOETrwTn2jxfzGFRxLhh+UJTgzZUXiHMZq9fMGA8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ptBKKfSxUycgJ5M07OQHuV24JKqNuo891BpbY7ia707o9x4HGPxEWZAC+DsEDd6Fw
	 livBDHhP9/yJo82uSXMGTJimGRQkzaRdQXEhGm3ZOoEbIZ3wgf9OMNQoJcyLbEULOV
	 bgLOe5rhSbDarTlsL1Fu4OVEDHv3twjk7F3fePtE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260612161129epcas5p3e7ede89e23bee40f35bdaacb9cfbb384~4YVl4WjcP1858918589epcas5p3H;
	Fri, 12 Jun 2026 16:11:29 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gcPdr5x8Yz6B9m6; Fri, 12 Jun
	2026 16:11:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd~4YVkfHhST0551705517epcas5p2F;
	Fri, 12 Jun 2026 16:11:28 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161125epsmtip17a32a09a1f76610c7c663861c61459eb~4YVifqoaT2559525595epsmtip1b;
	Fri, 12 Jun 2026 16:11:25 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/5] Add minimal Exynos8855 SoC support
Date: Fri, 12 Jun 2026 22:00:15 +0530
Message-Id: <20260612163020.411761-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd
References: <CGME20260612161128epcas5p2fe6ebf4b1a7b3ad1794804768180cbdd@epcas5p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38369-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,samsung.com:dkim,samsung.com:mid,samsung.com:from_mime];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E9BBA67AC43

This series adds initial support for the Exynos8855 SoC and also
initial SMDK board support. 

Exynos8855 has octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
arranged in 3 clusters. And other peripheral for mobile application.

This initial support consists of CPUs, pinctrl and related nodes
needed for initial kernel boot.

With these patches, kernel can boot using initramfs till file system mounts.

More platform support will be added in near future, clock driver to go next.

Known issue: uart driver probe fails because of clk being not available yet.

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
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  37 ++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 214 +++++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 124 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 10 files changed, 974 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi


base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
-- 
2.34.1


