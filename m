Return-Path: <linux-gpio+bounces-33282-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPK6D+AKs2kMRwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33282-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3B277536
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB2D030234E2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567173FE664;
	Thu, 12 Mar 2026 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pHsOLvov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6531D381;
	Thu, 12 Mar 2026 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341358; cv=fail; b=kRNqY2FTeETTKHelqVenR4OGKlju5spvtX1aw7IhfPTc9GoU+uz+plaHk2KBY2PKWhhM1cQKXXr/zEjd1ljfZOb1Ux7lqxrUgEfrglBiS2cjrSxULt1CL7E8Xlo8ARM1j/4+7Ek88BXYMaRCMWITqpDbJ0v4+QAWAfFIweMPEtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341358; c=relaxed/simple;
	bh=Br/Mal61I4ooVoYbIEsOvOA6nA9uxlSByiiACKlJi9U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ErTi2tTXL7EDsRC3cZK4oBPAumNSNiMGWNvD1v5Vy+ydwf8OBe4L1JvyP0ZQUJj4nAPtWsOVKHdhzJC3rexcU6Vhpj3FOAMwpDrzfxD5iYsgmPM7vpPYM4AYYrOnbj2bYhIWulfE0Eogy6UilKnmvK5Ydog5YHocupD+Z9Fj4+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pHsOLvov; arc=fail smtp.client-ip=40.93.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU1pBZpwSwkjBd83Fc4ArpY/6OJdKMXGdiMgQWs5rW9aPph8YHkwsJWR+8B2U6OP5kC/k7q4r4Mne2u8QxSGsgz32zpEWRwiTvRbvi3gq4wKPhiBaLjXic20hsXe+4t+OxdZ03am+jIFYL9Hmxs8UnGxTk53OIx17g3p4dovqPDbbTse0vo331c3pghhjwbnjbmQR5K4rnVLKN3kRVXLkg/T1KkT1OZo2JKvog0uUWHxsfB9C0FXv/Da8gy1irfBLdcqaMk3cNBALcBGnpdpyLc3OLaHiBpTCfbg2UtgYcu6lLx+/ee0FygKCxkKV8GZ0YmcQpmDfbvwkcpz4LhAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X81ii1+5Zjn9fK2LSuzT1CBU+SJI3gNKQm0HZBvQuQ=;
 b=WzpMhZjN97WJJy8IkALJN5yv4XLWScM2NBT8FoWHqyIGIB8KkBFAl3C5sT/P3dNWqHG1ptGs92PbZ22f3eUyhsZne3nmGtdiPgUWkM0Dv19tyMDo9gvJjlYzG7XMn0Q5yvmwW92RF9ux8TDc1GPhiFgRP1Z2EhDvK+XzJpU6a7//56U2laJvX7EtdxlMTMN/E18S5ipOkaxbzeVI8IqciB9V8YIkAD30V9303njGjPBi0i7rwi32/VvxUoMgv9kcmjHJcWrbenOqYkygMXBsfX7eMasgkfC3UWO5yohDxMhXgd6uc2be91UfvRZGfy9Udp9hu6tHLY9gon+f2Bglxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X81ii1+5Zjn9fK2LSuzT1CBU+SJI3gNKQm0HZBvQuQ=;
 b=pHsOLvoviapO0qAjw8c0eqWgysBUADob0gJoUUo7DxJPzlKVT6rVSNr44UFgtv6DpkGamt5DpF21C+nIQr8BQSyiOUsYS43w2PyNZYe5s89qsJX1hOeh3Xhasx5mKsI2lY3GUVVWPYtDb7lWAlVg98PvSlj6PTZX3nzVDK2KSuU=
Received: from SJ0PR13CA0096.namprd13.prod.outlook.com (2603:10b6:a03:2c5::11)
 by CY5PR10MB6167.namprd10.prod.outlook.com (2603:10b6:930:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 18:49:14 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::1d) by SJ0PR13CA0096.outlook.office365.com
 (2603:10b6:a03:2c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Thu,
 12 Mar 2026 18:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:11 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:11 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54k2829533;
	Thu, 12 Mar 2026 13:49:06 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 0/8] ASoC: support TI's TAC5x1x audio codec family
Date: Fri, 13 Mar 2026 00:18:25 +0530
Message-ID: <20260312184833.263-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|CY5PR10MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: d7bb34f3-fbe1-4883-c685-08de80680e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Yo5dsv7aX9Th0tTO5cVCEYud/QlExgBrzMhj6Z5ZQVzccQFBcaqtrq0M8d1j+tthg2tjRklpedAbNICut2OoESRawP/X34ERLayvmGZI2WsGe84AO5iJY4whBsiI+3tjgkyC4C6yZ7En18sOy8O8AXMdRcbKkHHhyjz6Rv+ce5HoBveY+IXZMo4W0IfvOYahyCl16xkWvJtGZHczJL3DQOcnUWXr45nQWe52lrjTJgt6Tcm465N33/e2+rdmWSKMH3DSREGr36LJX34IWIzpZd7JJgLk2MS+S7jedbNapSA+qULGHKQ5X/djoYUjvPjL61zjFfyiVx6MhTNieSToS0S7FnXsA46Vyd40qDpebxC/MQxn4+bes49wAQil4uABKC0L7nFLJ27wo1RqAtc/dtwcdUV+bpHgyKZTYSjr65fIPo4X3RuLYrhlNaYUrmkPEiZU2eIbZfrbsQA+QWSej3kt1uDUjgaHfILfb8PckoxH/plaCxDnGYWsG6gRFVhi5X6DmjdEDXYfqb4LZDpEEMaGtNZKfuoGlvR+u7BssZP4tMOUxjdd1IanrEjIa/Y2/nadYAm03wg12W9fMelQtIAjFYCpykbIwuElRdps4vof5+mMPqSdq8PpRM4YPmMQsnfyWADX7jjeiIPqa93UH7r8YOqn3OYUOd9kNcHnyQOJGfuigjm39D0TgXGVLLtVeNgPxWPxrb5Vhwd/wLM4gGq6MK+7HOHbK5qlWltn+87INNuIG24KELIQO5LQp9WViBQj/ZVzy9VsrlAu8hIUFw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/BPD0bfjI9yaoi+/6Zoz3ftVqWGHcd+HA3nbBYbHUqR9r+poldhy66Vj+g4v1hH2NJ5fZ0W0z0of5Q0LMjvHoxIILHPnwVVAG/TebUrDyMAALltl9qxAwjUs1ASnfPJmf769/JZwcDag3+PHM6hKgZkwTLJJy9HFZp49wwqMxEBhU2KKs4gmXmB2xcVptNxmOxzh/8WvqaEmiSTEWA0OumZpZAW0qaDwox2gIm/tcVADtDaH1vbqCaVNvQfsXXPExfcuUJqb77EVF7rkyFNYu4QFqAaggFJIjIRM8ttv6IVNUJxcUm7sR/xYGSl9nX1hgMQM1ebgsxGLyVAREwIyP+/vcjdAoMlzlPo9Pxn5VXE+fTeFyaS/EGBrTlm8dNmqtqii2lvvR0KN5p9Lwp5Enf4w5PMxU8TuuqLn6vD1tHI51V34oQoQ4Bo/NYAeogNQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:13.9021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bb34f3-fbe1-4883-c685-08de80680e6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6167
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33282-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F0C3B277536
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for the Texas Instruments TAC5x1x family of
audio codecs. These devices are low-power, high-performance mono/stereo
audio codecs with integrated GPIO functionality.

The TAC5x1x family includes various configurations:
- ADC-only devices (TAA5212, TAA5412)
- DAC-only devices (TAD5112, TAD5212)
- Codec solutions (TAC5111, TAC5112, TAC5211,
                   TAC5212 TAC5301, TAC5311, TAC5312,
                   TAC5411, TAC5412)

The implementation follows the Multi-Function Device (MFD) approach with
three main components:
1. MFD core driver: Handles device initialization, power management, and
   common resources
2. Pinctrl driver: Manages up to 5 configurable pins that can function as
   GPIO, PDM clock/data, or interrupt outputs
3. ASoC codec driver: Provides audio capture and playback functionality
   with support for various formats and sample rates

The series also removes duplicate support for these devices from the
pcm6240 driver, as they are now properly supported by dedicated drivers.

Link to previous standalone implementation attempt:
* https://lore.kernel.org/all/20250626181334.1200-2-niranjan.hy@ti.com/

Changes since previous submissions:
- Restructured the driver to follow the MFD (Multi-Function Device) approach,
  separating core functionality from pinctrl and codec components
- Reorganized device tree bindings into separate files for MFD core,
  pinctrl, and codec to align with the driver architecture
- Reordered patches to define DT bindings before driver implementation
- Improved documentation for device tree bindings.

Niranjan H Y (8):
  dt-bindings: mfd: Add bindings for TI TAC5x1x MFD core
  dt-bindings: pinctrl: Add bindings for TI TAC5x1x pinctrl
  dt-bindings: sound: Add bindings for TI TAC5x1x codec
  dt-bindings: sound: Update ti,pcm6240.yaml to remove TAC5x1x family
  mfd: tac5x1x: Add TI TAC5x1x MFD core driver
  pinctrl: pinctrl-tac5x1x: Add TI TAC5x1x pinctrl driver
  ASoC: tac5x1x: Add TI TAC5x1x codec driver
  ASoC: pcm6240: remove support for taac5x1x family

 .../devicetree/bindings/mfd/ti,tac5x1x.yaml   |  247 ++
 .../bindings/pinctrl/ti,tac5x1x-pinctrl.yaml  |  163 ++
 .../devicetree/bindings/sound/ti,pcm6240.yaml |   15 +-
 .../devicetree/bindings/sound/ti,tac5x1x.yaml |   49 +
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    4 +
 drivers/mfd/tac5x1x-core.c                    |  684 ++++++
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-tac5x1x.c             |  889 +++++++
 include/dt-bindings/pinctrl/tac5x1x.h         |   44 +
 include/linux/mfd/tac5x1x/core.h              |   69 +
 include/linux/mfd/tac5x1x/registers.h         |  291 +++
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/pcm6240.c                    |  126 +-
 sound/soc/codecs/pcm6240.h                    |    4 -
 sound/soc/codecs/tac5x1x.c                    | 2082 +++++++++++++++++
 sound/soc/codecs/tac5x1x.h                    |   35 +
 19 files changed, 4598 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
 create mode 100644 drivers/mfd/tac5x1x-core.c
 create mode 100644 drivers/pinctrl/pinctrl-tac5x1x.c
 create mode 100644 include/dt-bindings/pinctrl/tac5x1x.h
 create mode 100644 include/linux/mfd/tac5x1x/core.h
 create mode 100644 include/linux/mfd/tac5x1x/registers.h
 create mode 100644 sound/soc/codecs/tac5x1x.c
 create mode 100644 sound/soc/codecs/tac5x1x.h

-- 
2.34.1


