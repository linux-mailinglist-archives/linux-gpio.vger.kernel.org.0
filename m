Return-Path: <linux-gpio+bounces-39049-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /7XTID0AQGp5bAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39049-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:54:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0E6D256E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=dXZoiVc0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39049-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39049-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93D553007AF7
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 16:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B2C329C60;
	Sat, 27 Jun 2026 16:54:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA131D367
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579255; cv=none; b=IGGLG1AqIUA+aEYRhAhWBRk9TaNcWrP9WKcktkaZqwNNzeQgN5TEJEIrnPZtCJmSpxmgZLIcHQnMzEiU8ZSktLQiwE81O0iYO+mqc+cPJHObsXJAAM052F/tiFtIo1yMkwlIFDq/c4YowG96C1bPKnoZSD4hW0zO7KjMZiL+8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579255; c=relaxed/simple;
	bh=rzCb1447y/zm5tdTXc3sG9OJHE2N4vNmxHUPt962Ess=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=qThzI3NbSLmgyHH3fvtXJ0vxGvfrJCvmJkHdd0A7jiiV3zKV6KbS00K97+ssPTBoiM6L41LL9qJf1rk+Km/VMx4SIEKgCW2WnPaFjCPFxClqKwT8Ly1oSbqcfeavAuPOGUc8FTVVwaxIv9aZqI74FMYHrPXbRn14rV2yru9durM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dXZoiVc0; arc=none smtp.client-ip=203.254.224.33
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260627165405epoutp034a542d8d64b3f63a5587414baa0d0a98~8-mEF-cCe2703227032epoutp034
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260627165405epoutp034a542d8d64b3f63a5587414baa0d0a98~8-mEF-cCe2703227032epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579245;
	bh=OHvnddbhZoVh1ad3OJgY9WBYfNy7pqTB8Qj+hO8+Nks=;
	h=From:To:Cc:Subject:Date:References:From;
	b=dXZoiVc0Dgr8x28UMYixrFZICAksCAHL/iiABhD1tL36N06nhkCvycF4t8OVnPTan
	 FNaSoA7aVfqkProLRen1gd0cLgH5mSoBI/AIy7cM+cuMK103TJr2ELA9HXub77FRq7
	 mcLm7RUsjHHXxSegwqdRtRkUIr8wyEyo3PaWbSlQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260627165403epcas5p34817f474da749448ea078d0533476115~8-mCvxxI00994709947epcas5p3w;
	Sat, 27 Jun 2026 16:54:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gndt25nkSz6B9m4; Sat, 27 Jun
	2026 16:54:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260627165402epcas5p4481839961bdedebfa4d96a3517edaf2b~8-mBT6jXt1269212692epcas5p4c;
	Sat, 27 Jun 2026 16:54:02 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165400epsmtip1a4d5dc983183cb1bbd6cc6bfe3339b6a~8-l-xhaTK2007020070epsmtip1P;
	Sat, 27 Jun 2026 16:54:00 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 0/6]  Add minimal Exynos8855 SoC support
Date: Sat, 27 Jun 2026 22:42:22 +0530
Message-Id: <20260627171228.2687857-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165402epcas5p4481839961bdedebfa4d96a3517edaf2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165402epcas5p4481839961bdedebfa4d96a3517edaf2b
References: <CGME20260627165402epcas5p4481839961bdedebfa4d96a3517edaf2b@epcas5p4.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39049-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,samsung.com:dkim,samsung.com:mid,samsung.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 75D0E6D256E

This series adds initial support for the Exynos8855 SoC and also
initial SMDK board support. 

Exynos8855 is octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
arranged in 3 clusters. And other peripheral for mobile application.

This initial support consists of CPUs, pinctrl and related nodes
needed for initial kernel boot.

With these patches, kernel can boot using initramfs till file system mounts.

More platform support will be added in near future, clock driver to go next.

Changes since v2:
* Addressed review comments from Peter Griffin and Krzysztof.
* Updated uses of GS101 MACROS for pinctrl driver
* Documented  wakeup interrupt binding
* Rebased on latest Linux-next
 
Chanegs since v1:
* Fixed some of the review comments by Sashiko [1]
* Dropped serial node, will be added once clock support is available
* Dropped wkup interrupt for CMGP block, will be added later

Link of v2:
https://lore.kernel.org/all/20260615085252.1964423-1-alim.akhtar@samsung.com/

Link of v1:
https://lore.kernel.org/linux-samsung-soc/20260612163020.411761-1-alim.akhtar@samsung.com/

[1] https://sashiko.dev/#/patchset/20260612163020.411761-1-alim.akhtar@samsung.com?part=4


Alim Akhtar (6):
  dt-binding: ARM: samsung: Add Samsung Exynos8855
  dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible
  pinctrl: samsung: Add Exynos8855 pinctrl configuration
  dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
  arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
  MAINTAINERS: Add entry for Samsung Exynos8855 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 132 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 11 files changed, 961 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.34.1


