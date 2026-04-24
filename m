Return-Path: <linux-gpio+bounces-35499-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCzcKAJo62m2MgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35499-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:54:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D032745EB41
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 14:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E66030157D6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4E03BED10;
	Fri, 24 Apr 2026 12:48:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2110.outbound.protection.partner.outlook.cn [139.219.17.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000B218E91;
	Fri, 24 Apr 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034889; cv=fail; b=eDtTtpqSQA9PwdcVtCgdqJhfg5VN2MkvOKXS93V9aT+uNjR4VuKL/4HG696ykjJHKc3eeIwKPna72VJ6zX326FxgcOcFXVftImp8SbsASW2o2ah3dGSBp+/zWLClWAR2X2bCXkAtagyzv2f7h8/rRVw7kGJPEMgew47ohf1lgGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034889; c=relaxed/simple;
	bh=4KnnCXtoez61Wm9uIN/+gOjrDhubC7t+3SBbAVwFTZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irZLLRDM71manUBPTufrX6GKRhoyp1TbUdfssjJGmFLv8/+4UIvEJ4N/HcMVsWTOcjTQoRn2MIQl0copQlKM+P0zNvzHCTeQvUidEWNGm0/hT90cf0ne1Yyf2TATjfpMZCbx0FfJQFWLz02c78llp74M1BQq3/8qm7mUVXRp1SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDl+kyqNHE5DKwiz2GL/MIbp9YskBSikn746mOOYRC+UzlQ5pNCbuEeC0S0j4/a+BOS49PY60XM5y9B8tHuG3ZNKnyRH/gLIKk68carGvTAcpun4XjGudaFU4egGFdgIQWJlqovNqRtPuPZfthMzQkDVl0oIpBNKEZYOYXwn8vjrn2CHlyEtAe/nzgyblUpGFhQ9rwL4XuNOpTJIO6HWR6xDxkfjPBgBcUYG4+DbxA+YUCsz8FoFcbJPePYwndrXK3DLZZ+hDVPmBXbZuXp8RtPHHd8eUnjsZ+qKy227t0argeAo7lQLTkrNRpb782aRlbsGwNGfbAEEiwpZRQBGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmyAqbLBFLgZjakgmotRvVeN8iSLt8KJ5aJAdXjdaVk=;
 b=bY0C2N42VdKv1RNFyJoZ59dEPiyeLHJH4Zz3CzUtu3vXh/qZ2R/8YsbZAEn7GSiXi312Grco4eOlfch+M/w0PtbNPHr9LcSP4mt25W4sjOdcXDxzJ+2RhiRhCfjvxheJdwEqimTEfpN3l2KHYJbY3fy66r/63M7ailTKU7KZhOuAQkMWQv1UfrYpMzK5gRW07dkh5VlsEJZbtp74zzEwwCIIU07oCormJ/TvMihBftFTGEZqDwQJXrBN13qfPaGkldOeubNmE1Gac3G16EvVYLLMEdGuLQ6zIYzfiVa/unJXxCEBwfnzZjNpK/djnKNjaQNK3nhvAnT/zzZbY1d5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1299.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
Date: Fri, 24 Apr 2026 04:13:12 -0700
Message-Id: <20260424111330.702272-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a923eb-93af-4751-7f85-08dea1f28a56
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ei4u1OstfNR2GNijHscpijiSsdcUMQN3h7UMfYy8dAtvRRb8heXrG8aWKe0SzNh14mtAahNfWAYA4CjvswkwoG3r+SMR0K9lOk16oDykjctut5V0n5EahUlzR25Y+B5Qm+LBdbJkP6fRbNZo1dMUT5KlwJGf0RbUQm1Gtc4VC82SYzruCDAo7MQV3835PaGCv/MSbhKEumsNKbNCrj5EDm308L/NOw0tgDilsJFqzpWtbTFFOdOrzX0tx2VLBWFJMu6yUO5PSzsGi0T5tHpsFUebFBOnltD0M9WtgzoRJG1mm8mKdrxzIubGqHRSKkrAfNy2dQ7Y18gORN69my0cDnZ+0vlau6J+u1k7EG3BdC4u4ByoMzFbVoPheNrnD4cDvkVaL+G9EiM95gVIRDja+YLdOcO7o7SkMbjaT1LJdJgw0BC5cuxlJ0sJ9vC4uk2t9JVWzPJag5xItJG2sgKvAS14uRlbIBxyX3PYvaQUYAyVEkWxfwFQtzFZXUlHnuP7PXB+gPWoby2DeozgQdEzB0qpT4yoqtyvykCDoD3SH9qmYBmOmFmXMLsN4QilbwbwIoSk0KU9r4zEKG9B0B85Q72ZzgAKNqqtXVeNJD3MRHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C8NMNxiOpWJ/gQJkzFR4taPaQjDoped7r9PxzfkWeTJ0K+obfMw0V23Jfy9p?=
 =?us-ascii?Q?PlWUHRntbk2QIop5JOBurKlUi70Qvv5+AnVpCgJ223IADpQJyQs1A1vzAH1R?=
 =?us-ascii?Q?NpJfp9evvpzQNmZ7gjYgJcQPYG7ZzQKCynDkjX6uNeck2vI4ONIuQJyQaRi4?=
 =?us-ascii?Q?0Anzaj7PSZEisoTIduQGUlDTbu7nhte1NQYOO/+7yMPEYzHuSdlFRUVPPK6B?=
 =?us-ascii?Q?5QHmKYtx1whTT4gFTkU/WJlrdweqYWbl4RFOSvMthcVSl6orbU18OzJDZWyM?=
 =?us-ascii?Q?HdjpLC90NGK6oExn+aiazSfhKkuA1oesHr5P9uKdlBfIk0yhC7L07Z4gKIHj?=
 =?us-ascii?Q?X30Xk4nt+MhK89nmhW4ku4Rec+YBOSe12CBc7e95EFqIeBEzaFjYn4Pom3gz?=
 =?us-ascii?Q?yWo/seLaNGAHQPqYzMRDCTYBUfXgUjnK0eWNhwyl+9WPZ2PSugzosA5qgyxT?=
 =?us-ascii?Q?fa45QjKSp0fG2o1Jm/M482yIjJP9GAGh212u0HQNAMHxbyXfg9lc7qyRo9wq?=
 =?us-ascii?Q?POoJNs0aibxjFtzxGdT7DReexEldK41ze+oMgmn/qqEX3xvIyYaL409mXx14?=
 =?us-ascii?Q?NaJH+ta7ed3pHOdBS1mB5qx9mIVinOp0lBRITsW+gtyat5rIY7kpPLAYJXkM?=
 =?us-ascii?Q?8CJ6q9e+PJb/8Nn9Moc2hNrOT55GGfBgKsLijzlWmM5o1zs2615tHYfW4OsX?=
 =?us-ascii?Q?ZVhU6wX5l51N40nMIjLj8JAz1KnYMN5O0CdzP2GdvgpQM3i8TDkY+XkrjAKq?=
 =?us-ascii?Q?z3oo52jJceaDfeFuOGHQ44Yehizpryfe5G7Cfyl8Xa1p16/YuFi34FoqmKBa?=
 =?us-ascii?Q?fhzZyAKx+2kRHKuVl4ndirAM3GlaamTjwh7IJt8K7vFGqGFwRSqgTNYhnBjh?=
 =?us-ascii?Q?+RkO+DGGEimYr/3H2279UquCUJ1CHByxhJEEcFJqq4DTF3Cv9z6vZCEogHqc?=
 =?us-ascii?Q?ihnl3UEt8Mw7e6WY1ZfJVl+RxK1bKCKAwrwf/qg5pAdpOm0u8kc/6oG0UnKl?=
 =?us-ascii?Q?qYqwsQ13d/TvXQAr6woDCNQhythU5nm7h/lLuRZQ+SIjE2OO0Bhje0AaLh7I?=
 =?us-ascii?Q?7bnWfAF1JIMrI7Y1VzZhhA40hhN6bJSkguuOQbbTcBdY+AGx0hPXWksHDuzb?=
 =?us-ascii?Q?AS8BocvyBc2X1kAr5ioByK8QR4ElAOHHqOfxdlHlmgB3GhtF7zRL3JORG1nO?=
 =?us-ascii?Q?VHhH9FxBZMRLMkRIS42llHd2kZzj+q74kp841LECBCd73ezdg1sW0IJ86lKU?=
 =?us-ascii?Q?0KFBjtBPX644wbjJ6OluIXsEckTptiB9EXuk147Nx2a/5jfdt/EPaKey+0j9?=
 =?us-ascii?Q?Re234bzPzNNVq+qPV3sAiruL0F3K2EaPmo+KvGk4zs3BLh25jH0+Fr6eP8SV?=
 =?us-ascii?Q?IyYxAjXmvalbNJAYU7TSmlgyhLaSghObGmJfjGLgEGrfqYCGnUzw3f0Sv1Xb?=
 =?us-ascii?Q?hWaJeVmkBh/OaIGVdlnw9o/4i25xFEjQlLC7McydKrLHqQ+G5sYdl6CF8/2E?=
 =?us-ascii?Q?y1TLcn61QePiCf7HSbRXIYIwZRSosxzDRfh+jsG/JSrt0n4+YcMUJBhWhnfy?=
 =?us-ascii?Q?TIZDFVFkBfb/nDy6UiEDoQVuYwhLATLXZUws6i1hU0ri1AGTcU7j75oY8pxj?=
 =?us-ascii?Q?t7i/gzI+qRkF3F4yiC4Efi3MY0B0crKr9aT62TUBcd8832OKCxhA0OYKGUN0?=
 =?us-ascii?Q?DbI+2Ie975kRBMD/fC/vtDahn+vi4pVh4eYNQqNCdWX/E6v4Q0QVEmc5nBCL?=
 =?us-ascii?Q?9OkD/uoeg8eWbP6JdQNYzsuQu34/QpWm2c1tWfyTGkpwPGP3xHA3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a923eb-93af-4751-7f85-08dea1f28a56
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:41.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VtEf9pK3F5/qP/jXF9ojP904TUu9DnqKKquGPMMaMSYUeDFOhRsdcjTBMe1oRQM0i1mApF40RFQbWET16FbJjCRxGSLs+oUxiXGuauBQ7jCyo4CBKPZxXWOH9DM4Fwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1299
X-Rspamd-Queue-Id: D032745EB41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35499-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |    8 +
 drivers/pinctrl/starfive/Kconfig              |   21 +
 drivers/pinctrl/starfive/Makefile             |    3 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  111 +
 .../starfive/pinctrl-starfive-jhb100.c        | 1821 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  191 ++
 6 files changed, 2155 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ddf8ba2e60d..b3ad0dee7307 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25319,6 +25319,14 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	arch/riscv/boot/dts/starfive/jhb100*
 
+STARFIVE JHB100 PINCTRL DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
+F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
+
 STARFIVE JHB100 RESET CONTROLLER DRIVERS
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 8192ac2087fc..dc53070ee2c8 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -49,3 +49,24 @@ config PINCTRL_STARFIVE_JH7110_AON
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100
+	bool
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select OF_GPIO
+
+config PINCTRL_STARFIVE_JHB100_SYS0
+	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support system-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index ee0d32d085cb..c0d368f413bc 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -5,3 +5,6 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)		+= pinctrl-starfive-jh7110.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
+
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..1ee3e9a617da
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 3, .name = "gpio", .gpio_func_sel = 0, },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "bmcpcierp_pe2rst_out", .gpio_func_sel = 1, },
+	{ .pin_start = 4, .pin_cnt = 1, .name = "testen", .gpio_func_sel = -1, },
+	{ .pin_start = 5, .pin_cnt = 1, .name = "syspok_in", .gpio_func_sel = -1, },
+	{ .pin_start = 6, .pin_cnt = 1, .name = "sysrstn_in", .gpio_func_sel = -1, },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "perstn0_in", .gpio_func_sel = -1, },
+	{ .pin_start = 8, .pin_cnt = 1, .name = "perstn1_in", .gpio_func_sel = -1, },
+	{ .pin_start = 9, .pin_cnt = 1, .name = "aprstn_out", .gpio_func_sel = -1, },
+	{ .pin_start = 10, .pin_cnt = 1, .name = "pcierp_wake", .gpio_func_sel = -1, },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0_pinctrl_crl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 4,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 4,
+		.pin_cnt			= 5,
+		.schmitt_trigger_select		= { .shift = 0, .width = 1 },
+		.reserved			= { .shift = 1, .width = 31 },
+	},
+	{
+		.pin_start			= 9,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.slew_rate			= { .shift = 2, .width = 1 },
+		.reserved			= { .shift = 3, .width = 29 },
+	},
+	{
+		.pin_start			= 10,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 25 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_sys0_pinctrl_regs = {
+	.config			= { .reg = 0x0c, .width_per_pin = 1 },
+	.output			= { .reg = 0x38, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x3c, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x40, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x44, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x48, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x4c, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x50, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x54, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x58, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x5c, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x60, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys0_pinctrl_info = {
+	.name			= "jhb100-sys0",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_sys0_pl_desc,
+	.crl_desc		= jhb100_sys0_pinctrl_crl_desc,
+	.regs			= &jhb100_sys0_pinctrl_regs,
+};
+
+static const struct of_device_id jhb100_sys0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0-pinctrl",
+		.data = &jhb100_sys0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0-pinctrl",
+		.of_match_table = jhb100_sys0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
new file mode 100644
index 000000000000..3e4c60d17bb8
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -0,0 +1,1821 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/sort.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+#define GPOUT_LOW			0
+#define GPOUT_HIGH			1
+
+#define GPOEN_ENABLE			0
+#define GPOEN_DISABLE			1
+
+#define MAX_DEBOUNCE_WIDTH_STAGES	0x1FFFF
+
+/* Custom pinconf parameters */
+#define STARFIVE_PIN_CONFIG_GMAC_VSEL		(PIN_CONFIG_END + 1)
+#define STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH	(PIN_CONFIG_END + 2)
+#define STARFIVE_PIN_DRIVE_I2C_FAST_MODE	(PIN_CONFIG_END + 3)
+#define STARFIVE_PIN_DRIVE_I2C_FAST_MODE_PLUS	(PIN_CONFIG_END + 4)
+#define STARFIVE_PIN_OPEN_DRAIN_PULLUP_SELECT	(PIN_CONFIG_END + 5)
+#define STARFIVE_PIN_VGA_RTE_SELECT		(PIN_CONFIG_END + 6)
+
+struct field_info {
+	const char *name;
+	unsigned int shift;
+	unsigned int width;
+	unsigned int end;
+};
+
+static const struct pinconf_generic_params jhb100_custom_bindings[] = {
+	{ "starfive,gmac-vsel", STARFIVE_PIN_CONFIG_GMAC_VSEL, 0 },
+	{ "starfive,debounce-width", STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH, 0 },
+	{ "starfive,drive-i2c-fast-mode", STARFIVE_PIN_DRIVE_I2C_FAST_MODE, 0 },
+	{ "starfive,drive-i2c-fast-mode-plus", STARFIVE_PIN_DRIVE_I2C_FAST_MODE_PLUS, 0 },
+	{ "starfive,i2c-open-drain-pull-up-ohm", STARFIVE_PIN_OPEN_DRAIN_PULLUP_SELECT, 0 },
+	{ "starfive,vga-rte", STARFIVE_PIN_VGA_RTE_SELECT, 0 },
+};
+
+static unsigned int jhb100_pinmux_pin(u32 v)
+{
+	return FIELD_GET(GENMASK(7, 0), v);
+}
+
+static u32 jhb100_pinmux_function(u32 v)
+{
+	return FIELD_GET(GENMASK(9, 8), v);
+}
+
+static u32 jhb100_get_func_sel(struct jhb100_pinctrl *sfp, unsigned int pin)
+{
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int offset = 4 * (pin / 16);
+	unsigned int shift = pinctrl_regs->func_sel.width_per_pin * (pin % 16);
+	u32 func_sel_mask;
+	u32 func_sel;
+	void __iomem *reg_gpio_func_sel;
+	unsigned long flags;
+
+	reg_gpio_func_sel = sfp->base + pinctrl_regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	func_sel = readl_relaxed(reg_gpio_func_sel);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return (func_sel & func_sel_mask) >> shift;
+}
+
+static struct config_reg_layout_desc *get_crl_desc_by_pin(struct jhb100_pinctrl *sfp,
+							  unsigned int pin)
+{
+	struct config_reg_layout_desc *crl_desc = sfp->info->crl_desc;
+	unsigned int i = 0;
+
+	do {
+		if (pin >= crl_desc[i].pin_start &&
+		    pin < crl_desc[i].pin_start + crl_desc[i].pin_cnt)
+			return &crl_desc[i];
+	} while (crl_desc[i++].pin_start != 0xff);
+
+	return NULL;
+}
+
+static struct jhb100_pinctrl *jhb100_from_irq_data(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	return container_of(gc, struct jhb100_pinctrl, gc);
+}
+
+static struct jhb100_pinctrl *jhb100_from_irq_desc(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+
+	return container_of(gc, struct jhb100_pinctrl, gc);
+}
+
+static int jhb100_dt_node_to_map(struct pinctrl_dev *pctldev,
+				 struct device_node *np,
+				 struct pinctrl_map **maps,
+				 unsigned int *num_maps)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int old_num_funs, new_num_funs;
+	struct device *dev = sfp->gc.parent;
+	struct device_node *child;
+	struct pinctrl_map *map;
+	struct property *pinmux_p;
+	const char **pgnames;
+	const char *mux_grpname = NULL;
+	const char *grpname = NULL;
+	int ngroups;
+	int nmaps;
+	int ret;
+
+	ngroups = 0;
+	for_each_child_of_node(np, child)
+		ngroups += 1;
+	nmaps = 2 * ngroups;
+
+	pgnames = devm_kcalloc(dev, ngroups, sizeof(*pgnames), GFP_KERNEL);
+	if (!pgnames)
+		return -ENOMEM;
+
+	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	nmaps = 0;
+	ngroups = 0;
+	mutex_lock(&sfp->mutex);
+	for_each_child_of_node(np, child) {
+		unsigned int old_num_groups, new_num_groups;
+		const char *pin_grpname;
+		int nmux;
+		int *mpins;
+		u32 *pinmux;
+		int i;
+
+		pinmux_p = of_find_property(child, "pinmux", NULL);
+		if (!pinmux_p) {
+			dev_err(dev,
+				"%pOFn.%pOFn: no muxing or pin config is specified\n",
+				np, child);
+			ret = -EINVAL;
+			goto put_child;
+		} else {
+			nmux = of_property_count_u32_elems(child, "pinmux");
+			if (nmux < 1) {
+				dev_err(dev,
+					"invalid pinctrl group %pOFn.%pOFn: no pinmux is set\n",
+					np, child);
+				ret = -EINVAL;
+				goto put_child;
+			}
+		}
+
+		grpname = kasprintf(GFP_KERNEL, "%pOFn.%pOFn", np, child);
+		if (!grpname) {
+			ret = -ENOMEM;
+			goto put_child;
+		}
+
+		pgnames[ngroups] = devm_kstrdup(dev, grpname, GFP_KERNEL);
+		if (!pgnames[ngroups]) {
+			ret = -ENOMEM;
+			goto free_grpname;
+		}
+		ngroups++;
+
+		pin_grpname = devm_kstrdup(dev, grpname, GFP_KERNEL);
+		if (!pin_grpname) {
+			ret = -ENOMEM;
+			goto free_grpname;
+		}
+
+		mux_grpname = kstrdup(grpname, GFP_KERNEL);
+		if (!mux_grpname) {
+			ret = -ENOMEM;
+			goto free_grpname;
+		}
+
+		mpins = devm_kcalloc(dev, nmux, sizeof(*mpins), GFP_KERNEL);
+		if (!mpins) {
+			ret = -ENOMEM;
+			goto free_mux_grpname;
+		}
+
+		pinmux = devm_kcalloc(dev, nmux, sizeof(*pinmux), GFP_KERNEL);
+		if (!pinmux) {
+			ret = -ENOMEM;
+			goto free_mux_grpname;
+		}
+
+		ret = of_property_read_u32_array(child, "pinmux", pinmux, nmux);
+		if (ret)
+			goto free_mux_grpname;
+
+		for (i = 0; i < nmux; i++)
+			mpins[i] = jhb100_pinmux_pin(pinmux[i]);
+
+		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+		map[nmaps].data.mux.function = np->name;
+		map[nmaps].data.mux.group = mux_grpname;
+		nmaps += 1;
+
+		old_num_groups = pctldev->num_groups;
+
+		ret = pinctrl_generic_add_group(pctldev, pin_grpname,
+						mpins, nmux, pinmux);
+		if (ret < 0) {
+			dev_err(dev, "error adding group %s: %d\n", pin_grpname, ret);
+			goto free_mux_grpname;
+		}
+
+		new_num_groups = pctldev->num_groups;
+		if (new_num_groups == old_num_groups) {
+			devm_kfree(dev, mpins);
+			devm_kfree(dev, pinmux);
+			devm_kfree(dev, pin_grpname);
+		}
+
+		ret = pinconf_generic_parse_dt_config(child, pctldev,
+						      &map[nmaps].data.configs.configs,
+						      &map[nmaps].data.configs.num_configs);
+		if (ret) {
+			dev_err(dev, "error parsing pin config of group %s: %d\n",
+				grpname, ret);
+			goto free_mux_grpname;
+		}
+
+		/* don't create a map if there are no pinconf settings */
+		if (map[nmaps].data.configs.num_configs == 0) {
+			kfree(grpname);
+			continue;
+		}
+
+		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		map[nmaps].data.configs.group_or_pin = grpname;
+		nmaps += 1;
+	}
+
+	old_num_funs = pctldev->num_functions;
+	ret = pinmux_generic_add_function(pctldev, np->name,
+					  pgnames, ngroups, NULL);
+	if (ret < 0) {
+		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
+		goto free_mux_grpname;
+	}
+
+	new_num_funs = pctldev->num_functions;
+	if (new_num_funs == old_num_funs) {
+		int i;
+
+		for (i = 0; i < ngroups; i++)
+			devm_kfree(dev, pgnames[i]);
+
+		devm_kfree(dev, pgnames);
+	}
+
+	mutex_unlock(&sfp->mutex);
+
+	*maps = map;
+	*num_maps = nmaps;
+	return 0;
+
+free_mux_grpname:
+	kfree(mux_grpname);
+
+free_grpname:
+	kfree(grpname);
+
+put_child:
+	of_node_put(child);
+	mutex_unlock(&sfp->mutex);
+	kfree(map);
+	return ret;
+}
+
+static void jhb100_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+			       unsigned int num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; i++) {
+		switch (map[i].type) {
+		case PIN_MAP_TYPE_MUX_GROUP:
+			kfree(map[i].data.mux.group);
+			break;
+		case PIN_MAP_TYPE_CONFIGS_GROUP:
+			kfree(map[i].data.configs.group_or_pin);
+		default:
+			break;
+		}
+	}
+
+	pinctrl_utils_free_map(pctldev, map, num_maps);
+}
+
+static const struct pinctrl_ops jhb100_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	  = pinctrl_generic_get_group_name,
+	.get_group_pins   = pinctrl_generic_get_group_pins,
+	.dt_node_to_map	  = jhb100_dt_node_to_map,
+	.dt_free_map	  = jhb100_dt_free_map,
+};
+
+static void jhb100_set_gpioval(struct jhb100_pinctrl *sfp, unsigned int pin,
+			       unsigned int val)
+{
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (pin / 32);
+	unsigned int shift = 1 * (pin % 32);
+	unsigned int fs_offset = 4 * (pin / 16);
+	unsigned int fs_shift = 2 * (pin % 16);
+	u32 gpio_o_mask;
+	u32 gpio_oen_mask;
+	u32 func_sel_mask;
+	u32 dout, doen, fs;
+	void __iomem *reg_gpio_o;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg_gpio_func_sel;
+	unsigned long flags;
+
+	reg_gpio_o = sfp->base + info->regs->output.reg + offset;
+	reg_gpio_oen = sfp->base + info->regs->output_en.reg + offset;
+	reg_gpio_func_sel = sfp->base + info->regs->func_sel.reg + fs_offset;
+
+	gpio_o_mask = GENMASK(info->regs->output.width_per_pin - 1, 0) << shift;
+	gpio_oen_mask = GENMASK(info->regs->output_en.width_per_pin - 1, 0) << shift;
+	func_sel_mask = GENMASK(info->regs->func_sel.width_per_pin - 1, 0) << fs_shift;
+	dout = val << shift;
+	doen = 0;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	fs = readl_relaxed(reg_gpio_func_sel);
+	if (fs & func_sel_mask) {
+		fs &= ~func_sel_mask;
+		writel_relaxed(fs, reg_gpio_func_sel);
+	}
+	dout |= readl_relaxed(reg_gpio_o) & ~gpio_o_mask;
+	writel_relaxed(dout, reg_gpio_o);
+	doen |= readl_relaxed(reg_gpio_oen) & ~gpio_oen_mask;
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_set_function(struct jhb100_pinctrl *sfp,
+				unsigned int pin, u32 func)
+{
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	void __iomem *func_sel_reg;
+	unsigned long flags;
+	u32 func_sel_mask;
+	u32 func_sel_val;
+	unsigned int offset = 4 * (pin / (32 / pinctrl_regs->func_sel.width_per_pin));
+	unsigned int shift = pinctrl_regs->func_sel.width_per_pin *
+			     (pin % (32 / pinctrl_regs->func_sel.width_per_pin));
+
+	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
+		return;
+
+	func_sel_reg = sfp->base + pinctrl_regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
+	func_sel_val = func << shift;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	func_sel_val |= readl_relaxed(func_sel_reg) & ~func_sel_mask;
+	writel_relaxed(func_sel_val, func_sel_reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_set_one_pin_mux(struct jhb100_pinctrl *sfp,
+				  unsigned int pin,
+				  u32 func,
+				  int val)
+{
+	const struct pinctrl_pin_desc *desc = &sfp->pins[pin];
+	struct device *dev = sfp->gc.parent;
+	int gpio_func_sel =  sfp->gpio_func_sel_arr[pin];
+
+	jhb100_set_function(sfp, pin, func);
+
+	if (pin < sfp->gc.ngpio && (val == 0 || val == 1)) {
+		if (func == gpio_func_sel)
+			jhb100_set_gpioval(sfp, pin, val);
+		else
+			dev_err(dev, "pin (%s) is not a GPIO. func=%d/%d\n",
+				desc->name, func, gpio_func_sel);
+	}
+
+	return 0;
+}
+
+static int jhb100_set_mux(struct pinctrl_dev *pctldev,
+			  unsigned int fsel, unsigned int gsel)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const u32 *pinmux;
+	unsigned int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	pinmux = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		u32 v = pinmux[i];
+
+		jhb100_set_one_pin_mux(sfp,
+				       jhb100_pinmux_pin(v),
+				       jhb100_pinmux_function(v),
+				       -1);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops jhb100_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name   = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux             = jhb100_set_mux,
+};
+
+static const u8 jhb100_drive_strength_ma[4] = { 2, 4, 8, 12 };
+
+static const u8 jhb100_drive_strength_ma_3bit[8] = { 2, 5, 8, 10, 14, 16, 18, 20 };
+
+static u32 jhb100_padcfg_ds_to_mA(u32 padcfg)
+{
+	return jhb100_drive_strength_ma[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_mA_3bit(u32 padcfg)
+{
+	return jhb100_drive_strength_ma_3bit[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_uA(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_to_uA_3bit(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma_3bit[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_from_mA(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma); i++) {
+		if (v <= jhb100_drive_strength_ma[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_mA_3bit(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma_3bit); i++) {
+		if (v <= jhb100_drive_strength_ma_3bit[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_uA(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA(v);
+}
+
+static u32 jhb100_padcfg_ds_from_uA_3bit(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA_3bit(v);
+}
+
+static void jhb100_padcfg_rmw(struct jhb100_pinctrl *sfp,
+			      unsigned int pin, u32 mask, u32 value)
+{
+	void __iomem *reg;
+	unsigned int offset;
+	unsigned long flags;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config.reg;
+
+	offset = 4 * pin;
+
+	reg = sfp->base + padcfg_base + offset;
+
+	value &= mask;
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_pinconf_get(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *config)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	struct device *dev = sfp->gc.parent;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int offset;
+	u32 padcfg, arg;
+	bool enabled;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config.reg;
+
+	offset = 4 * pin;
+
+	if (pin <= sfp->npins)
+		padcfg = readl_relaxed(sfp->base + padcfg_base + offset);
+	else
+		return -EINVAL;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = 0;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+		    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+			return -EOPNOTSUPP;
+
+		enabled = !(padcfg & (RL_DESC_GENMASK(crl_desc, pull_down) |
+				      RL_DESC_GENMASK(crl_desc, pull_up)));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, pull_down))
+			  >> RL_DESC_SHIFT(crl_desc, pull_down);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_up))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, pull_up))
+			  >> RL_DESC_SHIFT(crl_desc, pull_up);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit))
+			arg = jhb100_padcfg_ds_to_mA(padcfg <<
+						     RL_DESC_SHIFT(crl_desc,
+								   drive_strength_2bit));
+		else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit))
+			arg = jhb100_padcfg_ds_to_mA_3bit(padcfg <<
+							  RL_DESC_SHIFT(crl_desc,
+									drive_strength_3bit));
+		else
+			return -EOPNOTSUPP;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit))
+			arg = jhb100_padcfg_ds_to_uA(padcfg
+				<< RL_DESC_SHIFT(crl_desc, drive_strength_2bit));
+		else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit))
+			arg = jhb100_padcfg_ds_to_uA_3bit(padcfg
+				<< RL_DESC_SHIFT(crl_desc, drive_strength_3bit));
+		else
+			return -EOPNOTSUPP;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, input_enable))
+			   >> RL_DESC_SHIFT(crl_desc, input_enable);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+			   >> RL_DESC_SHIFT(crl_desc, schmitt_trigger_select);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		enabled = true;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, slew_rate))
+			return -EOPNOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, slew_rate))
+		      >> RL_DESC_SHIFT(crl_desc, slew_rate);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int jhb100_pinconf_set(struct pinctrl_dev *pctldev,
+			      unsigned int gpio, unsigned long *config,
+			      unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = sfp->gc.parent;
+	struct config_reg_layout_desc *crl_desc;
+	u32 param;
+	u32 arg;
+	u32 value;
+	u32 mask;
+	int i;
+
+	crl_desc = get_crl_desc_by_pin(sfp, gpio);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", gpio);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(config[i]);
+		arg = pinconf_to_config_argument(config[i]);
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = 0;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = RL_DESC_GENMASK(crl_desc, pull_down);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = RL_DESC_GENMASK(crl_desc, pull_up);
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			return 0;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, input_enable);
+			value = arg ? RL_DESC_GENMASK(crl_desc, input_enable) : 0;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, schmitt_trigger_select);
+			value = arg ? RL_DESC_GENMASK(crl_desc, schmitt_trigger_select) : 0;
+			break;
+		case STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH:
+			if (arg > MAX_DEBOUNCE_WIDTH_STAGES)
+				arg = MAX_DEBOUNCE_WIDTH_STAGES;
+
+			if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, debounce_width);
+			value = arg ? (arg << RL_DESC_SHIFT(crl_desc, debounce_width)) : 0;
+			break;
+		case STARFIVE_PIN_CONFIG_GMAC_VSEL:
+			if (!RL_DESC_SUPPORTED_FUNC(crl_desc, vsel,
+						    BIT(jhb100_get_func_sel(sfp, gpio))))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, vsel);
+			value = arg ? arg << RL_DESC_SHIFT(crl_desc, vsel) : 0;
+			break;
+		case STARFIVE_PIN_VGA_RTE_SELECT:
+			if (!RL_DESC_SUPPORTED(crl_desc, retention_signal_bus))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, retention_signal_bus);
+			value = arg ? RL_DESC_GENMASK(crl_desc, retention_signal_bus) : 0;
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+
+		jhb100_padcfg_rmw(sfp, gpio, mask, value);
+	}
+
+	return 0;
+}
+
+static int jhb100_pinconf_group_get(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *config)
+{
+	const struct group_desc *group;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	return jhb100_pinconf_get(pctldev, group->grp.pins[0], config);
+}
+
+static int jhb100_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *configs,
+				    unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = sfp->gc.parent;
+	struct config_reg_layout_desc *crl_desc;
+	const struct group_desc *group;
+	u32 mask, value;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	mask = 0;
+	value = 0;
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		crl_desc = get_crl_desc_by_pin(sfp, group->grp.pins[0]);
+		if (!crl_desc) {
+			dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+				group->grp.pins[i]);
+			return -EINVAL;
+		}
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			value |= RL_DESC_GENMASK(crl_desc, pull_down);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			value |= RL_DESC_GENMASK(crl_desc, pull_up);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_mA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_mA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -EOPNOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_uA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_uA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -EOPNOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, input_enable);
+			value = arg ? (value | RL_DESC_GENMASK(crl_desc, input_enable))
+				: value;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, schmitt_trigger_select);
+			value = arg
+				? (value | RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+				: value;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (!RL_DESC_SUPPORTED(crl_desc, slew_rate))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, slew_rate);
+			value = arg ? (value | RL_DESC_GENMASK(crl_desc, slew_rate)) : value;
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_PUSH_PULL <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_OPEN_DRAIN <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case STARFIVE_PIN_DRIVE_I2C_FAST_MODE:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_LEGACY_FAST_MODE <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case STARFIVE_PIN_DRIVE_I2C_FAST_MODE_PLUS:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_LEGACY_FAST_MODE_PLUS <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case STARFIVE_PIN_OPEN_DRAIN_PULLUP_SELECT:
+			if (!RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+			value &= ~RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+			switch (arg) {
+			case 600:
+				value |= JHB100_I2C_OPEN_DRAIN_PU_600_OHMS <<
+					 RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+				break;
+			case 900:
+				value |= JHB100_I2C_OPEN_DRAIN_PU_900_OHMS <<
+					 RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+				break;
+			case 1200:
+				value |= JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS <<
+					 RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+				break;
+			case 2000:
+				value |= JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS <<
+					 RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+				break;
+			default:
+				return -EOPNOTSUPP;
+			}
+			break;
+		case STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH:
+			if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, debounce_width);
+			value &= ~RL_DESC_GENMASK(crl_desc, debounce_width);
+			value = arg
+				? (value | (arg << RL_DESC_SHIFT(crl_desc, debounce_width)))
+				: value;
+			break;
+		case STARFIVE_PIN_CONFIG_GMAC_VSEL:
+			if (!RL_DESC_SUPPORTED(crl_desc, vsel))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, vsel);
+			value &= ~RL_DESC_GENMASK(crl_desc, vsel);
+			value = arg
+				? (value | (arg << RL_DESC_SHIFT(crl_desc, vsel)))
+				: value;
+			break;
+		case STARFIVE_PIN_VGA_RTE_SELECT:
+			if (!RL_DESC_SUPPORTED(crl_desc, retention_signal_bus))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, retention_signal_bus);
+			value &= ~RL_DESC_GENMASK(crl_desc, retention_signal_bus);
+			value = arg
+				? (value | (arg << RL_DESC_SHIFT(crl_desc, retention_signal_bus)))
+				: value;
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	for (i = 0; i < group->grp.npins; i++)
+		jhb100_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
+
+	return 0;
+}
+
+static const struct pinconf_ops jhb100_pinconf_ops = {
+	.pin_config_get		= jhb100_pinconf_get,
+	.pin_config_set		= jhb100_pinconf_set,
+	.pin_config_group_get	= jhb100_pinconf_group_get,
+	.pin_config_group_set	= jhb100_pinconf_group_set,
+	.is_generic		= true,
+};
+
+static int jhb100_gpio_get_direction(struct gpio_chip *gc,
+				     unsigned int gpio)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (gpio / 32);
+	unsigned int shift = 1 * (gpio % 32);
+	u32 gpio_oen_mask;
+	u32 doen;
+	void __iomem *reg_gpio_oen;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en.reg + offset;
+	gpio_oen_mask = GENMASK(info->regs->output_en.width_per_pin - 1, 0) << shift;
+
+	doen = (readl_relaxed(reg_gpio_oen) & gpio_oen_mask) >> shift;
+
+	return doen == GPOEN_ENABLE ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int jhb100_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int gpio)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	struct device *dev = sfp->gc.parent;
+	struct config_reg_layout_desc *crl_desc;
+
+	crl_desc = get_crl_desc_by_pin(sfp, gpio);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			gpio);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, gpio,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select),
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select));
+
+	jhb100_set_one_pin_mux(sfp, gpio, 0, -1);
+
+	return 0;
+}
+
+static int jhb100_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int value)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	struct device *dev = sfp->gc.parent;
+	struct config_reg_layout_desc *crl_desc;
+
+	jhb100_set_one_pin_mux(sfp, gpio, 0,
+			       value ? GPOUT_HIGH : GPOUT_LOW);
+
+	crl_desc = get_crl_desc_by_pin(sfp, gpio);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			gpio);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, gpio,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select) |
+			  RL_DESC_GENMASK(crl_desc, pull_down) |
+			  RL_DESC_GENMASK(crl_desc, pull_up),
+			  0);
+
+	return 0;
+}
+
+static int jhb100_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (gpio / 32);
+	unsigned int shift  = 1 * (gpio % 32);
+	u32 gpio_oen_mask = GENMASK(info->regs->output_en.width_per_pin - 1, 0) << shift;
+	u32 doen = 0;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg;
+	unsigned long flags;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en.reg + offset;
+	reg = sfp->base + info->regs->gpio_status.reg + offset;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	doen = readl_relaxed(reg_gpio_oen) | gpio_oen_mask;
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return !!(readl_relaxed(reg) & BIT(gpio % 32));
+}
+
+static int jhb100_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (gpio / 32);
+	unsigned int shift = 1 * (gpio % 32);
+	void __iomem *reg_dout;
+	u32 dout;
+	u32 mask;
+	unsigned long flags;
+
+	reg_dout = sfp->base + info->regs->output.reg + offset;
+	dout = (value ? GPOUT_HIGH : GPOUT_LOW) << shift;
+	mask = GENMASK(info->regs->output.width_per_pin - 1, 0) << shift;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	dout |= readl_relaxed(reg_dout) & ~mask;
+	writel_relaxed(dout, reg_dout);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return 0;
+}
+
+static void jhb100_irq_ack(struct irq_data *d)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *ic;
+	u32 mask;
+	unsigned long flags;
+	u32 value;
+
+	ic = sfp->base + pinctrl_regs->irq_clr.reg + 4 * (gpio / 32);
+	mask = BIT(gpio % 32);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_mask(struct irq_data *d)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *ien;
+	u32 mask;
+	unsigned long flags;
+	u32 value;
+
+	ien = sfp->base + pinctrl_regs->irq_en.reg + 4 * (gpio / 32);
+	mask = BIT(gpio % 32);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	gpiochip_disable_irq(&sfp->gc, d->hwirq);
+}
+
+static void jhb100_irq_mask_ack(struct irq_data *d)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *ien;
+	void __iomem *ic;
+	u32 mask = BIT(gpio % 32);
+	unsigned long flags;
+	u32 value;
+
+	ien = sfp->base + pinctrl_regs->irq_en.reg + 4 * (gpio / 32);
+	ic = sfp->base + pinctrl_regs->irq_clr.reg + 4 * (gpio / 32);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_unmask(struct irq_data *d)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *ien;
+	u32 mask;
+	unsigned long flags;
+	u32 value;
+
+	ien = sfp->base + pinctrl_regs->irq_en.reg + 4 * (gpio / 32);
+	mask = BIT(gpio % 32);
+
+	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) | mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *base;
+	u32 mask;
+	u32 irq_type, edge_both, polarity;
+	unsigned long flags;
+
+	base = sfp->base + 4 * (gpio / 32);
+	mask = BIT(gpio % 32);
+
+	switch (trigger) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = mask; /* 1: rising edge */
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = 0;    /* 0: falling edge */
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = mask; /* 1: both edges */
+		polarity  = 0;    /* 0: ignored */
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = mask; /* 1: high level */
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = 0;    /* 0: low level */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (trigger & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	irq_type |= readl_relaxed(base + pinctrl_regs->irq_trigger.reg) & ~mask;
+	writel_relaxed(irq_type, base + pinctrl_regs->irq_trigger.reg);
+
+	edge_both |= readl_relaxed(base + pinctrl_regs->irq_both_edge.reg) & ~mask;
+	writel_relaxed(edge_both, base + pinctrl_regs->irq_both_edge.reg);
+
+	if (irq_type & mask) { /* edge polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_edge.reg) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_edge.reg);
+	} else if (irq_type == 0) { /* level polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_level.reg) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_level.reg);
+	}
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+	return 0;
+}
+
+static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+	int ret = 0;
+
+	if (enable)
+		ret = enable_irq_wake(sfp->wakeup_irq);
+	else
+		ret = disable_irq_wake(sfp->wakeup_irq);
+	if (ret)
+		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
+			enable ? "enable" : "disable");
+
+	return ret;
+}
+
+static void jhb100_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_data(d);
+
+	seq_printf(p, sfp->gc.label);
+}
+
+static const struct irq_chip jhb100_irq_chip = {
+	.irq_ack        = jhb100_irq_ack,
+	.irq_mask       = jhb100_irq_mask,
+	.irq_mask_ack   = jhb100_irq_mask_ack,
+	.irq_unmask     = jhb100_irq_unmask,
+	.irq_set_type   = jhb100_irq_set_type,
+	.irq_set_wake   = jhb100_irq_set_wake,
+	.irq_print_chip = jhb100_irq_print_chip,
+	.flags          = IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_IMMUTABLE |
+			  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+			  IRQCHIP_MASK_ON_SUSPEND |
+			  IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void jhb100_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct jhb100_pinctrl *sfp = jhb100_from_irq_desc(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct gpio_irq_chip *girq = &sfp->gc.irq;
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned long is;
+	unsigned int pin;
+	unsigned int total, size, remain = sfp->npins;
+
+	chained_irq_enter(chip, desc);
+
+	for (total = 0, size = 0; total < sfp->npins; total += 32, remain -= size) {
+		is = readl_relaxed(sfp->base + pinctrl_regs->irq_status.reg +
+				   (total >> 3));
+		size = umin(remain, 32);
+
+		for_each_set_bit(pin, &is, size) {
+			if (sfp->gpio_func_sel_arr[pin] >= 0)
+				generic_handle_domain_irq(girq->domain, pin);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int jhb100_gpio_init_hw(struct gpio_chip *gc)
+{
+	struct jhb100_pinctrl *sfp = container_of(gc, struct jhb100_pinctrl, gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int i;
+
+	for (i = 0; i < sfp->npins; i += 32) {
+		/* mask all GPIO interrupts */
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_en.reg + (i >> 3));
+		/* clear all interrupts */
+		writel_relaxed(~0U, sfp->base + pinctrl_regs->irq_clr.reg + (i >> 3));
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_clr.reg + (i >> 3));
+	}
+
+	return 0;
+}
+
+static int field_compare(const void *a, const void *b)
+{
+	const struct field_info *fa = (const struct field_info *)a;
+	const struct field_info *fb = (const struct field_info *)b;
+
+	if (fa->shift < fb->shift)
+		return -1;
+
+	if (fa->shift > fb->shift)
+		return 1;
+
+	return 0;
+}
+
+static int check_crl_desc(struct jhb100_pinctrl *sfp, unsigned int index,
+			  const struct config_reg_layout_desc *desc)
+{
+	struct device *dev = sfp->gc.parent;
+	struct field_info *fields;
+	int field_cnt = 0;
+	int num, i;
+
+	num = sizeof(struct config_reg_layout_desc) / sizeof(struct reg_layout_field);
+
+	fields = kcalloc(num, sizeof(struct field_info), GFP_KERNEL);
+	if (!fields)
+		return -ENOMEM;
+
+	#define COLLECT_FIELD(field) \
+		do { \
+			if (desc->field.width > 0) { \
+				fields[field_cnt].name = #field; \
+				fields[field_cnt].shift = desc->field.shift; \
+				fields[field_cnt].width = desc->field.width; \
+				fields[field_cnt].end = desc->field.shift + desc->field.width; \
+				field_cnt++; \
+			} \
+		} while (0)
+
+	/* same as struct config_reg_layout_desc filed except for pin_start and pin_cnt */
+	COLLECT_FIELD(debounce_width);
+	COLLECT_FIELD(drive_strength_2bit);
+	COLLECT_FIELD(drive_strength_3bit);
+	COLLECT_FIELD(function);
+	COLLECT_FIELD(input_enable);
+	COLLECT_FIELD(vsel);
+	COLLECT_FIELD(mode_select);
+	COLLECT_FIELD(open_drain_pull_up_sel);
+	COLLECT_FIELD(pull_down);
+	COLLECT_FIELD(pull_up);
+	COLLECT_FIELD(reserved);
+	COLLECT_FIELD(retention_signal_bus);
+	COLLECT_FIELD(schmitt_trigger_select);
+	COLLECT_FIELD(slew_rate);
+
+	#undef COLLECT_FIELD
+
+	sort(fields, field_cnt, sizeof(struct field_info), field_compare, NULL);
+
+	for (i = 0; i < field_cnt; i++) {
+		if (fields[i].end > 32) {
+			dev_err(dev,
+				"layout %d: field %s exceeds 32bit [shift=%u, width=%u, end=%u]\n",
+				index, fields[i].name,
+				fields[i].shift, fields[i].width, fields[i].end);
+			goto failed;
+		}
+
+		if (i < field_cnt - 1) {
+			if (fields[i].end > fields[i + 1].shift) {
+				dev_err(dev,
+					"layout %d: field overlap: %s[%u:%u] with %s[%u:%u]\n",
+					index, fields[i].name, fields[i].end - 1,
+					fields[i].shift, fields[i + 1].name,
+					fields[i + 1].end - 1, fields[i + 1].shift);
+				goto failed;
+			}
+		}
+	}
+
+	if (desc->reserved.width > 0) {
+		unsigned int used_mask = 0;
+		unsigned int reserved_mask = 0;
+
+		for (i = 0; i < field_cnt; i++) {
+			if (strcmp(fields[i].name, "reserved"))
+				used_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+			else
+				reserved_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+		}
+
+		if ((used_mask | reserved_mask) != 0xFFFFFFFF) {
+			dev_err(dev,
+				"layout %d: reserved field not cover all unused bits\n",
+				index);
+			dev_err(dev,
+				"used mask: 0x%08X, reserved mask: 0x%08X, combined: 0x%08X\n",
+				used_mask, reserved_mask, used_mask | reserved_mask);
+		}
+	}
+
+	kfree(fields);
+	return 0;
+
+failed:
+	kfree(fields);
+	return -EINVAL;
+}
+
+static int check_layout_pin_range(struct jhb100_pinctrl *sfp,
+				  const struct config_reg_layout_desc *descs,
+				  unsigned int num_desc)
+{
+	struct device *dev = sfp->gc.parent;
+
+	if (descs[num_desc - 1].pin_start + descs[num_desc - 1].pin_cnt > sfp->npins) {
+		dev_err(dev, "layout %u pin_start[%u] + pin_cnt[%u] exceeds pin number[%u]\n",
+			num_desc - 1, descs[num_desc - 1].pin_start,
+			descs[num_desc - 1].pin_cnt, sfp->npins);
+		return -EINVAL;
+	}
+
+	for (int i = 0; i < num_desc; i++) {
+		if (descs[i].pin_start == 0xff)
+			break;
+
+		if (i < num_desc - 1) {
+			if (descs[i].pin_start + descs[i].pin_cnt > descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] overlaps with [%u-%u]\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+
+			if (descs[i].pin_start + descs[i].pin_cnt < descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] -> [%u-%u] has gap\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int check_pinctrl_layouts(struct jhb100_pinctrl *sfp,
+				 const struct config_reg_layout_desc *layouts)
+{
+	struct device *dev = sfp->gc.parent;
+	int i = 0, err_cnt = 0, ret;
+
+	if (!layouts) {
+		dev_err(dev, "layout pointer is NULL\n");
+		return -EINVAL;
+	}
+
+	while (layouts[i].pin_start != 0xff) {
+		ret = check_crl_desc(sfp, i, &layouts[i]);
+		if (ret) {
+			dev_err(dev, "layout %d check failed\n", i);
+			err_cnt++;
+		}
+
+		if (++i > 100) {
+			dev_err(dev, "too many layouts or missing 0xff for end\n");
+			return -EINVAL;
+		}
+	}
+
+	if (!err_cnt) {
+		ret = check_layout_pin_range(sfp, layouts, i);
+		if (ret)
+			err_cnt++;
+	}
+
+	if (err_cnt) {
+		dev_err(dev, "pinctrl layout check finish with %d error(s)\n", err_cnt);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "pinctrl layout check completed!\n");
+	return 0;
+}
+
+static
+struct pinctrl_pin_desc *devm_create_pins_from_pld(struct device *dev,
+						   const struct jhb100_pin_layout_desc *desc,
+						   const char *prefix,
+						   unsigned int *total_pins,
+						   unsigned int *total_gpios,
+						   int **gpio_func_sel_arr)
+{
+	struct pinctrl_pin_desc *pins = NULL;
+	unsigned int i, j, ngpios = 0, npins = 0, pin_index = 0;
+	unsigned int same_name_found = 0;
+	int *arr;
+
+	if (!dev || !desc || !prefix) {
+		dev_err(dev, "Invalid parameters: desc=%p, prefix=%s\n",
+			desc, prefix);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		if (!desc[i].pin_cnt) {
+			dev_err(dev, "Invalid pin cnt\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		npins += desc[i].pin_cnt;
+	}
+
+	if (npins == 0) {
+		dev_err(dev, "No pins defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(dev, "Total pins to create: %d\n", npins);
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return ERR_PTR(-ENOMEM);
+
+	arr = devm_kzalloc(dev, npins, GFP_KERNEL);
+	if (!arr)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		same_name_found = 0;
+
+		for (j = 0; j < i; j++) {
+			if (!strcmp(desc[j].name, desc[i].name)) {
+				same_name_found = 1;
+				break;
+			}
+		}
+
+		for (j = 0; j < desc[i].pin_cnt; j++) {
+			char *name = NULL;
+			int pin_num = desc[i].pin_start + j;
+
+			pins[pin_index].number = pin_num;
+			if (same_name_found) {
+				name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+						      prefix, desc[i].name,
+						      desc[i].pin_start + j);
+			} else {
+				if (desc[i].pin_cnt > 1)
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+							      prefix, desc[i].name, j);
+				else
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
+							      prefix, desc[i].name);
+			}
+
+			if (!name) {
+				dev_err(dev, "Failed to allocate pin name for pin %d\n",
+					pin_num);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (!strcmp(desc[i].name, "gpio") || desc[i].gpio_func_sel != -1)
+				ngpios++;
+
+			pins[pin_index].name = name;
+			arr[pin_index] = desc[i].gpio_func_sel;
+			pin_index++;
+		}
+	}
+
+	*total_pins = npins;
+	*total_gpios = ngpios;
+	*gpio_func_sel_arr = arr;
+
+	return pins;
+}
+
+static int of_pinvref_get(struct device *dev, const struct pinvref_desc *pv_desc, u32 *val)
+{
+	char prop_name[32];
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	snprintf(prop_name, sizeof(prop_name), "%s-vref", pv_desc->name);
+	dev_dbg(dev, "Looking up %s from node %pOF\n", prop_name, np);
+
+	ret = of_property_read_u32(np, prop_name, val);
+	if (ret) {
+		dev_err(dev, "Looking up %s in node %pOF failed: %d\n", prop_name, np, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int starfive_pinvref_set(struct device *dev, void __iomem *reg,
+				unsigned int val, const struct pinvref_desc *pv_desc)
+{
+	if (!pv_desc->range)
+		return 0;
+
+	if (pv_desc->range & BIT(val)) {
+		writel(val, reg);
+	} else {
+		dev_err(dev, "pin vref range is unsupported(%lx/%x)\n", BIT(val), pv_desc->range);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int starfive_pinvref_init(struct device *dev, void __iomem *base,
+				 struct starfive_pinctrl_regs *pinctrl_regs)
+{
+	int ret = 0;
+	unsigned int val, i = 0;
+	struct pinvref_reg *vref;
+
+	vref = &pinctrl_regs->vref;
+	if (!vref->pv_desc)
+		return ret;
+
+	while (vref->pv_desc[i].name) {
+		ret = of_pinvref_get(dev, &vref->pv_desc[i], &val);
+		if (!ret)
+			ret = starfive_pinvref_set(dev, base + vref->reg + i * 4,
+						   val, &vref->pv_desc[i]);
+		i++;
+	}
+
+	return ret;
+}
+
+int jhb100_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	const struct jhb100_pinctrl_domain_info *info;
+	struct jhb100_pinctrl *sfp;
+	struct pinctrl_desc *jhb100_pinctrl_desc;
+	struct reset_control *rst;
+	struct clk *clk;
+	int ret;
+
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
+	if (!sfp)
+		return -ENOMEM;
+
+	sfp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfp->base))
+		return PTR_ERR(sfp->base);
+
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\n");
+
+	rst = devm_reset_control_array_get_optional_shared(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n");
+
+	/*
+	 * we don't want to assert reset and risk undoing pin muxing for the
+	 * early boot serial console, but let's make sure the reset line is
+	 * deasserted in case someone runs a really minimal bootloader.
+	 */
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not deassert reset\n");
+
+	sfp->pins = devm_create_pins_from_pld(dev, info->pl_desc, info->name,
+					      &sfp->npins, &sfp->ngpios,
+					      &sfp->gpio_func_sel_arr);
+	if (IS_ERR(sfp->pins))
+		return PTR_ERR(sfp->pins);
+
+	jhb100_pinctrl_desc = devm_kzalloc(&pdev->dev,
+					   sizeof(*jhb100_pinctrl_desc),
+					   GFP_KERNEL);
+	if (!jhb100_pinctrl_desc)
+		return -ENOMEM;
+
+	jhb100_pinctrl_desc->name = dev_name(dev);
+	jhb100_pinctrl_desc->num_custom_params = ARRAY_SIZE(jhb100_custom_bindings);
+	jhb100_pinctrl_desc->custom_params = jhb100_custom_bindings;
+	jhb100_pinctrl_desc->pctlops = &jhb100_pinctrl_ops;
+	jhb100_pinctrl_desc->pmxops = &jhb100_pinmux_ops;
+	jhb100_pinctrl_desc->confops = &jhb100_pinconf_ops;
+	jhb100_pinctrl_desc->owner = THIS_MODULE;
+	jhb100_pinctrl_desc->pins = sfp->pins;
+	jhb100_pinctrl_desc->npins = sfp->npins;
+
+	sfp->info = info;
+	sfp->dev = dev;
+	platform_set_drvdata(pdev, sfp);
+	sfp->gc.parent = dev;
+	raw_spin_lock_init(&sfp->lock);
+	mutex_init(&sfp->mutex);
+
+	ret = devm_pinctrl_register_and_init(dev, jhb100_pinctrl_desc,
+					     sfp, &sfp->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not register pinctrl driver\n");
+
+	sfp->gc.label = dev_name(dev);
+	sfp->gc.owner = THIS_MODULE;
+	sfp->gc.request = pinctrl_gpio_request;
+	sfp->gc.free = pinctrl_gpio_free;
+	sfp->gc.get_direction = jhb100_gpio_get_direction;
+	sfp->gc.direction_input = jhb100_gpio_direction_input;
+	sfp->gc.direction_output = jhb100_gpio_direction_output;
+	sfp->gc.get = jhb100_gpio_get;
+	sfp->gc.set = jhb100_gpio_set;
+	sfp->gc.set_config = gpiochip_generic_config;
+	sfp->gc.base = info->gc_base;
+	sfp->gc.ngpio = sfp->ngpios;
+
+	girq = &sfp->gc.irq;
+
+	if (info->regs->irq_edge.reg) {
+		gpio_irq_chip_set_chip(girq, &jhb100_irq_chip);
+		girq->parent_handler = jhb100_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->init_hw = jhb100_gpio_init_hw;
+
+		ret = platform_get_irq(pdev, 0);
+		if (ret < 0)
+			return ret;
+
+		girq->parents[0] = ret;
+	}
+
+	ret = pinctrl_enable(sfp->pctl);
+	if (ret)
+		return ret;
+
+	if (sfp->gc.ngpio > 0) {
+		ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
+		if (ret)
+			return dev_err_probe(dev, ret, "could not register gpiochip\n");
+
+		dev_info(dev, "StarFive JHB100 GPIO chip registered %d GPIOs\n",
+			 sfp->gc.ngpio);
+	}
+
+	ret = check_pinctrl_layouts(sfp, info->crl_desc);
+	if (ret)
+		return ret;
+
+	ret = starfive_pinvref_init(dev, sfp->base, info->regs);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jhb100_pinctrl_probe);
+
+MODULE_DESCRIPTION("Pinctrl driver for the StarFive JHB100 SoC");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
new file mode 100644
index 000000000000..a5e7c788ba13
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#ifndef __PINCTRL_STARFIVE_JHB100_H__
+#define __PINCTRL_STARFIVE_JHB100_H__
+
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+
+#define PER2_GMAC_RGMII_FUNC			1
+#define PER2_GMAC_RMII_FUNC			2
+#define PER3_GMAC_RMII_FUNC			1
+
+/* mode select */
+#define JHB100_PUSH_PULL			0
+#define JHB100_OPEN_DRAIN			1
+#define JHB100_LEGACY_FAST_MODE_PLUS		2
+#define JHB100_LEGACY_FAST_MODE			3
+
+/* i2c open-drain pull-up select */
+#define JHB100_I2C_OPEN_DRAIN_PU_600_OHMS	0
+#define JHB100_I2C_OPEN_DRAIN_PU_900_OHMS	1
+#define JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS	2
+#define JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS	3
+
+struct jhb100_pin_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	const char *name;
+	int gpio_func_sel;
+};
+
+struct jhb100_pinctrl {
+	struct device *dev;
+	struct gpio_chip gc;
+	struct pinctrl_gpio_range gpios;
+	raw_spinlock_t lock;
+	const char *iodomain_name;
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+	/* register read/write mutex */
+	struct mutex mutex;
+	const struct jhb100_pinctrl_domain_info *info;
+	/* wakeup */
+	int wakeup_gpio;
+	int wakeup_irq;
+	struct irq_domain *irq_domain;
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	unsigned int ngpios;
+	int *gpio_func_sel_arr;
+};
+
+/* pinref voltage range */
+#define JHB100_PINVREF_3_3V	0
+#define JHB100_PINVREF_2_5V	1
+#define JHB100_PINVREF_1_8V	2
+
+struct pinvref_desc {
+	const char *name;
+	unsigned int range;
+};
+
+struct pinvref_reg {
+	unsigned int reg;
+	const struct pinvref_desc *pv_desc;
+};
+
+struct gpio_irq_reg {
+	unsigned int reg;
+	unsigned int width_per_pin;
+};
+
+struct starfive_pinctrl_regs {
+	struct pinvref_reg vref;
+	struct gpio_irq_reg config;
+	struct gpio_irq_reg output;
+	struct gpio_irq_reg output_en;
+	struct gpio_irq_reg func_sel;
+	struct gpio_irq_reg gpio_status;
+	struct gpio_irq_reg irq_en;
+	struct gpio_irq_reg irq_status;
+	struct gpio_irq_reg irq_clr;
+	struct gpio_irq_reg irq_trigger;
+	struct gpio_irq_reg irq_level;
+	struct gpio_irq_reg irq_both_edge;
+	struct gpio_irq_reg irq_edge;
+};
+
+struct reg_layout_field {
+	unsigned char shift;
+	unsigned char width;
+	unsigned int func;
+};
+
+#define RL_DESC_SUPPORTED(crl_desc, field) ({ \
+	typeof(crl_desc) _desc = (crl_desc); \
+	(_desc && _desc->field.width > 0); \
+})
+
+#define RL_DESC_SHIFT(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	__desc->field.shift; \
+})
+
+#define RL_DESC_GENMASK(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	RL_DESC_SUPPORTED(__desc, field) ? \
+	GENMASK(__desc->field.shift + __desc->field.width - 1, __desc->field.shift) : 0; \
+})
+
+#define RL_DESC_SUPPORTED_FUNC(crl_desc, field, pinfunc) ({ \
+	typeof(crl_desc) _desc = (crl_desc); \
+	(_desc && _desc->field.width > 0 && \
+		(!_desc->field.func || (_desc->field.func & pinfunc))); \
+})
+
+struct config_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+
+	struct reg_layout_field debounce_width;
+	struct reg_layout_field drive_strength_2bit;
+	struct reg_layout_field drive_strength_3bit;
+	struct reg_layout_field function;
+	struct reg_layout_field input_enable;
+	struct reg_layout_field vsel;
+	struct reg_layout_field mode_select;
+	struct reg_layout_field open_drain_pull_up_sel;
+	struct reg_layout_field pull_down;
+	struct reg_layout_field pull_up;
+	struct reg_layout_field reserved;
+	struct reg_layout_field retention_signal_bus;
+	struct reg_layout_field schmitt_trigger_select;
+	struct reg_layout_field slew_rate;
+};
+
+struct funcsel_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	unsigned int width;
+};
+
+struct jhb100_pinctrl_domain_info {
+	const char *name;
+	unsigned int gc_base;
+	const struct pinctrl_pin_desc *pins;
+	const struct jhb100_pin_layout_desc *pl_desc;
+	struct config_reg_layout_desc *crl_desc;
+	struct starfive_pinctrl_regs *regs;
+};
+
+static inline irq_hw_number_t pin_to_hwirq(struct jhb100_pinctrl *sfp)
+{
+	return sfp->wakeup_gpio - sfp->info->gc_base;
+}
+
+int jhb100_pinctrl_probe(struct platform_device *pdev);
+
+void pinctrl_utils_free_map(struct pinctrl_dev *pctldev,
+			    struct pinctrl_map *map, unsigned int num_maps);
+int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
+const char *pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
+					     unsigned int selector);
+int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       const char * const **groups,
+				       unsigned int * const num_groups);
+int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
+				const char *name,
+				const char * const *groups,
+				unsigned int const num_groups,
+				void *data);
+
+#if defined(CONFIG_GENERIC_PINCONF) && defined(CONFIG_OF)
+int pinconf_generic_parse_dt_config(struct device_node *np,
+				    struct pinctrl_dev *pctldev,
+				    unsigned long **configs,
+				    unsigned int *nconfigs);
+#endif
+
+#endif /* __PINCTRL_STARFIVE_JHB100_H__ */
-- 
2.25.1


