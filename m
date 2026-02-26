Return-Path: <linux-gpio+bounces-32210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFoDtIgoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:30:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC481A4420
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41D50300D76A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE5D39E6DF;
	Thu, 26 Feb 2026 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lD8a1Ul/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51432692B;
	Thu, 26 Feb 2026 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101836; cv=fail; b=n9mPezB9i7cp8j2MQH1+Me14V4nxgRAYoCGJynXNOG9wLBSTlhlKtykLglsfFeDqvVbwGaPRH7hoBHas0fbf5iAiDypThxHkLnKcHAkGDucSKp/xMr7oLS3mXin2if2TK147SysFvMq5RdTb3Y2pWA+WJBE9o/6MNyHVkJgC64s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101836; c=relaxed/simple;
	bh=lfZCboXj4yquAHIl8Gt8JTbzO3jm7dwY2ZqinvwIMsc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CrRPDVNwBlgM9xH/tRMS2/yJNkPs44VIAbcdAKdn+JaTv8310lYNZoWIbMaKIcbj/bu4zMezrUXacp+sJZN3c58eywDdhuss/0y83zSdos0TMDkP0odHkIPpsoZNNaWkPQ15PtUN6qJFn/JHsHQMwwmsUcyTCk5JE/EKzBjnfhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lD8a1Ul/; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onVXLhonROGlrX03F24fiTI60CLLiAA6Pn0d8GI4DFlYUtQrgqX5sq2bQ8HDMUIyVKv9Cj4r/e1pkZ65mFFCRRlSoTj3nkPYgQKjugivSwGqNneRwzNBpZ9Vlx5A/TmO0Mqtls6Eq9xmXJyfMrlTLwoJMiL/Rpl3kq15LqvHhVTOQRs2D6UGRTFOd/FFR/9kK+rTKBrTcRQ9d7n9yLZBKTwQrLEXOv0GK2mETv/eGqksyNxdYlEAtqirJKjzi6vHn+VPd30tYEV+oDu+8X6IOSnxEfHYXPStuyzJywB5k05ctwpBmVUYGHIlOv1h7I5jk+uE/uZy0PUweWwvsyz3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tza4UQgr4YhFQbobmaQnc11CunDaMzhUd1CFyY7bc20=;
 b=F2syKOqu049oTfEJWiRCwRAXOyUnl7VS+xBdalfv4rcgcgDfc6yauEP1pGvhvc2SgjDeem4Kx4LUX4Cpnu3dZ1cZ/G1HBZ3vq967+jJ7wHZsQuZ+3nOmcbJqwHP9sXuspsmw1W59jjHvDEI2bMwRIO84345k1wtIuvkYG/3/AkM/BiadY2iBnisOzTq7KxhnOO+u/sH4qEUBcVPIRwj8R6ziPv/Z75P2moBeM+KTHYMo4q2KcR1XclYHyYzHxRb60Ld1Fi9sY4E0kd0uqSYYjkSA+qfQSR23dbgwT52EAc/4AFFr1WOqDFLHBBC7hM7Lm/CtC0HaaUOtN6ZX+wqF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tza4UQgr4YhFQbobmaQnc11CunDaMzhUd1CFyY7bc20=;
 b=lD8a1Ul/U008TGgz+Aykrjpl2NvGh3qP0E1fQtN5JL0g8tAxUDGejO6xm2qTgu/R+ci4iFqzJHj8LhEt/d0QycfFJXMwvjcw4dg1jm7UzPi4NOb+c0nwocCRVF18PZS7wQCfInWLfCqCTybtQzLHeLFpUDb0PD9mqyHOuxPju0TyPq+jizAnJ9jea99J2tBjdYY5m/ZS4A8FMPhSr/hVAZJXw5koeMcwE9o5qn3h/vz1Zl4BjoFS1xQ593kJA8YK7VNwTYoD8Zp9HRLZc9v4Hz6atd9dM8/J8BTDtFrFvP7XsVNDTcCjE8P43ypkpQM+0q9xL279VqLQieVuO+lUSA==
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by VI1PR10MB7879.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:1bf::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 10:30:23 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::37) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 10:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:39 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:21 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v6 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
Date: Thu, 26 Feb 2026 11:30:15 +0100
Message-ID: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcgoGkC/2XM3YrCMBCG4VuRHG9kZjL5qUfexyJLmiaag7XSa
 FmR3vtGQYj08BvmeR+ixCnHInabh5jinEsez3WYr40IJ38+RpmHugUBGUBwcoj97fjT34pUHRl
 jgvXKe1H/L1NM+e/V+j7UfcrlOk73V3rG5/Vd6ZrKjBKkS4RMvfZWuX0aS9mW6zaMv+LZmamxy
 K2lajVbHaxj1KZbW9VYwtaqanlQxBrRwQBry62l1nK15BIk8qQThbXVrVWt1dV20BsLjpkYP+2
 yLP/tesbTlAEAAA==
X-Change-ID: 20260108-debug_bus-392666c7a3aa
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|VI1PR10MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1cdd5e-24fb-4e8f-aec5-08de75220c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	Usv0Fm4soCfDJmAuSO6T/BEk2rKTHiyevwRMbMfsny9aR79qU65NkwtdL0LDCKoRU7ispcSd1i55OgI2YyzI5+GnwsnGNwglLkIVO4Ck9uSE69cQtqoymRWKHCZVlXGp2uE348yyHz5oh7Ok4BeS4Zd6SvgCLeOPY5J3eiNF+qm43ezlmZG43bQdCHFqNN1DHXosvbGCCJF8PwWvanw+p1lL1z5I310RZ2BUtyRn7435MmzL2DenZy75hVYjm2bS+SelAOuelNDrCbftwuNKn+qVY0B8Upd9WdJsXHVCuz02QSkO8CKlKl6M+HpzD201EWTwk6D51haCWXoqxiXQGIxuNHWJZifV5BFxF68zF8e8pOg/s/rcvpf4PGeFRS22iGtmotHRJWD8afVk27mgZFjpQ8/Axgw7QUKvkbJow2NWb/b2kI0POTwhvb9Mcg2+OEKNCmwLQfrExWLK1mG09zH3sfpf7D9/6vZP6XWkw0Dfv9lB3u/wthpKQq87Fu4vo648+XktTXfIaMslEhEfOd3L8PHFkp3/1gfvVYdqI8V7RIZLFC12Un0VSM3VTi1+mqKPZs+ABuAi2QrPcP+pKzuRkhh7p7KSHBmk+yGkLC6wprZp3TPB1ZA+8qRLRscv+Y+5EkZZ4+jh3OMmjfm+2vjpPtQ+odUKzHlCRiYdWJ0hF78A9pI1Wcnwb0rfnsI002Lk2Fr4Hq40lT2oHQU0G8yWv07MIZzvZrtM9hWWcv0xoB+/LTfjZgAa6y+8d9Z8J8ZCyT5FiwELWh+afDUqeOB3ZTT62vsE0k50UhktC5wKZ3cDLRuTbgQlZymer1jo
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/He+KEDeQSp3CX4wnr3hg89j+tESsJane/Px0Dfl97srUjFB0FldXGH6dIgjtvTKIYOyECCKF36tlg6BeI94oYOslix87lWGT+0FN75RfxuVkMtOqfULLDxL7n3H+MGbu3qKvrLix3JFcUht9xC0+OVfWJ94WSglAwg3nkjNdKobyp6Q6yce6XbXqDkucAhKxw6Vx5ajxDnHKE+BI06KpJdyj6YPYG5oXrXo/MywqxETZ/NFl/NmT88MPF2T8VgKoMC+NVB9pyxBx14zINeBwxCqckzQzQy/4cIA1/mvJFBVbwvAhqipxDuU2dp+af+RebO7qgFm20k0dBXl31KnCs+6h55iAyoceYZnEXeojAzZwoYMvnoU2l36nPfCfKhhgtOj4NSE8EAZZXKLu4ge25WjiW0PxZyLsNSoZfirx5zake3PZqbK4uu7ADFNnKm8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:23.1931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1cdd5e-24fb-4e8f-aec5-08de75220c8e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7879
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32210-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CDC481A4420
X-Rspamd-Action: no action

Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

[1]: https://github.com/OP-TEE/optee_os/pull/7673

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v6:
- Fix use of platform_driver_register() in probe of the stm32 debug bus
  (unusable since dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()"))
- Added all review tags
- Link to v5: https://lore.kernel.org/r/20260123-debug_bus-v5-0-90b670844241@foss.st.com

Changes in v5:
- Take into account Rob's comments for the debug bus documentation
- Link to v4: https://lore.kernel.org/r/20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com

Changes in v4:
- Remove reg property from the debug bus and use ranges.
- Link to v3: https://lore.kernel.org/r/20260121-debug_bus-v3-0-4d32451180d0@foss.st.com

Changes in v3:
- Collect Rob's review tags
- Add stm32_firewall_get_grant_all_access() API and use it in the HDP
  driver.
- Link to v2: https://lore.kernel.org/r/20260114-debug_bus-v2-0-5475c7841569@foss.st.com

Changes in v2:
- Fix kernel robot error by documenting the access-controllers property
  in the missing coresight peripheral binding files.
- List the access controller items for HDP
- Various minor fixes in the debug bus binding file.
- Remove clock documentation and its presence in the DT node and driver.
  Bus clock will be handled by the child nodes' drivers.
- stm32 debug bus driver:
	- Depopulate the bus when .remove() is called
	- Remove trace when error on devm_kzalloc() as the trace
	function does nothing in case of ENOMEM.
	- Remove use of of_match_ptr()
	- Use tee bus callbacks
- Link to v1: https://lore.kernel.org/r/20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com

---
Gatien Chevallier (12):
      dt-bindings: document access-controllers property for coresight peripherals
      dt-bindings: pinctrl: document access-controllers property for stm32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
      drivers: bus: add the stm32 debug bus driver
      arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
      arm: dts: stm32: enable the debug bus on stm32mp1x boards
      arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
      arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
      arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
      pinctrl: stm32: add firewall checks before probing the HDP driver

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-stm.yaml |   3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  76 +++++++
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   6 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               | 117 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 172 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 ++++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_dbg_bus.c                        | 251 +++++++++++++++++++++
 drivers/bus/stm32_firewall.c                       |  44 +++-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  14 ++
 include/linux/bus/stm32_firewall_device.h          |  26 +++
 21 files changed, 907 insertions(+), 1 deletion(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260108-debug_bus-392666c7a3aa

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


