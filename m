Return-Path: <linux-gpio+bounces-26461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7BB91A9A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4AD97A3C8D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA7F1F8AC8;
	Mon, 22 Sep 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hEhPKAin"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D2A1EDA02;
	Mon, 22 Sep 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551087; cv=fail; b=Be8klAcmclAbdwBtgCgK70F8KcePl6hwfGSquJepWNKFuZdTdbqbYylLN0BgphzhcxEHtBdA/S76xeljTMnuMXNxPvZw55cPtcQWNEy9bUU4DGxARoq4J9rGMrpG9ZSqywbpBw8YMl08QankZtojMIwNBqKByZBgZz3aHFKHLFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551087; c=relaxed/simple;
	bh=AYrU7o62hI9uNtL/yWzTIx0l3y59taMjTNWnnuMU0r8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=c/sRngXoxZWbSMEJpJLIYRpOhKquH9quhaa/kY5aiGrADNbM2kS0HJ1SJSHSqo/Y+XUooVsoHJEPRt8Y0fxNin5BRNZ6mmh0d8ThpCUUwfsfTAJVtOnyftgGz9lUXYfaZtDIuRLJqhuUROq9/Zotme+b0K3CQnYQohNl+cKzwgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hEhPKAin; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNtBXpqRXttH2wqT1hxFn0HuQSvd97YOGp3Yv3akHcwPGIVzjXuByQz6YT2wrh16n/fVUdjE6zfRusPty79U4EmyI6TddM+iUQzesLf6jnETxIBbbeSkz+DE8BIMswCKGs8Uv639Eg5iJpHxkee9bV4zP2lplnITGSUUc1deliZ9/7NLvE42JFJpxoi0eEeavoBDJYqvuggxzfBpCsYySttX/88dp+YukE4eUvB+tfx5jR+mAyibxNLUJquZjSr6rz2htdpJ8j2quONJcRDKIxKk7D8RE220iieGI17p76jkmaq5IDDxo4HMqEHukjiD0eD8b9uAtTkNWh/IOwIb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2879qeqzAtMoJQtZb06IBVXdCARrkO4h7qxAavfdRA=;
 b=kJWYaJ3TkQXlQh0AzHiidsoUH9ZT1N95/XHcuwGJ+EgUapjK+/tYeAHTcsgTfLNv9jaBXJprviXlx2gWhx93qrcdXi8RxBjZvaC6ThcPWK8auKuvR1FQi3dtf1u/PXVJIQbbEE6P2E3IUgax5f5wRWo6lb3eqbS0wpGrKdcG7taS5H62Udm3uFSKecnNy2nXv4ZBiSeiL57GsHNHlFGBpJk+i2V8xD7HHuRxRjh7wtu43YPgpfEjhhlFOgY+Xrg8YiGF6ORCa00CiW/lJ/WDniAoIRfAc0dWrxeVhwcHjEFFpiIoTFeDIEq2yuqHy1HM3vmfnn801iazZOt0izFCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2879qeqzAtMoJQtZb06IBVXdCARrkO4h7qxAavfdRA=;
 b=hEhPKAinaPWzoKJu5adub9cwJrz+awleRngvCl9RWzPf9Uh4MHRZmUh4UsjS+PW6s0qOT69ROX2i/NjngehR1WVFwsUi3FCiPIxLq5FITyBCIAx0q7ayr9kmXSy0RnPuBtVR/Gew6OE2Cr6BZZqWX7tkN5RLu5fCHxrpmW4SG9fVLSAm3BQXrakXKMm00HywFY4jii3Uam4+uNSZfMvZyVpHnBl5UrmmmWkiUVz9zT2s6cabl9KQE/eai82YroTbV/6dcD76p9gUKlC2JTx0OYcF9HydPkjCj0BK7RqQhj6NuZlHXhBtJEqym3BicNWg9Snj4cFUxtmPIgv1wcCRrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:41 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:41 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 00/12] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Mon, 22 Sep 2025 17:24:15 +0300
Message-Id: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0035.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee37858-cb4e-45ed-04c9-08ddf9e3c4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fecppE+yfyH9MtXUdjD7450TVcBPF72ptJbu4X0qArLBrZaPuEqRCdAuQJsE?=
 =?us-ascii?Q?Vis71fqxEc3UGwsS+z9IWqIALB4sDpdZRnimU8NhUiMOmTXu8W1Z3OkkUDT0?=
 =?us-ascii?Q?IRynzjYQUzLRk/On1yWqjWJIb6u6eCBcuptdEbRMPVmGFnaz7Y5A8N9JOm/C?=
 =?us-ascii?Q?ILfIVbSoutQoOo8+qN5we4n+1SX+/5EGB/eVPGKvc30wLQVvt60Z3C4ysaKM?=
 =?us-ascii?Q?tcEg99qKF88EsYf9r2pn45R6QgD+embIYMNtqZ27r7b3a1cr4/bFYr9fSfBD?=
 =?us-ascii?Q?CT/PYrHZ4r8ntbwF7JU9yBhklrvQWpXaCw8G1SfBS8UW6HVSIb7eEweaWPsK?=
 =?us-ascii?Q?GmgADqyRqhBSVtM173cur8Wgvagi4tEvLLLvyEh7FHEoNsOZ9DHsg+nTYEyV?=
 =?us-ascii?Q?uv2FAsK1fjflObrBFicpW6PfaVGtFy/q8COnGklCg17OMzls189gwxmKh9X5?=
 =?us-ascii?Q?UqsTUL+7C694CxSp8NHiUNZ4M3P7pYbRdaJ3Kd/bppMcm4qESJI6wU0t4IA2?=
 =?us-ascii?Q?Rrw/GFKu3DkB934iib4YWbo596d8OVVG5XOOuIOnsMT08924F/0F7BXe2yuh?=
 =?us-ascii?Q?OXrqb4UtLEANcNJTd6psH6348kuR23o4PC6/kmyY/WTAZb7LC4VV9RhGy1+p?=
 =?us-ascii?Q?bBiSwmFzv4VaEQyIvSr/nRUnSVahkuCIBO4+EqscSn5kFN+1Xl7jR4C8w4Ot?=
 =?us-ascii?Q?XvLoZCGzThZjPCtYhbI3NwsQVy3/BQ2+arNc8BmGRdl28Y5pAIxeAh0XBZby?=
 =?us-ascii?Q?qVJSGkmf3VsL07uwlvl6jfRWJFBx4VyQwS3zMDlLEiQvq7Meb14NbrjtH1NY?=
 =?us-ascii?Q?PptPaD8GeBRbUlyE04qI4mqCiCk3yJGcca8hZEWGrLJbDsjOdSlwliVCWnKK?=
 =?us-ascii?Q?409hFBg/DlhY9AgZ7ad0L5DAAbwjwnbj/gPdfzRPxSSxYgvw2RZ+iaqp/off?=
 =?us-ascii?Q?2y8vUQ0YTTgCZ11pO0NBzlhccQ9uGWF4AyIVlb5h39eyZUatXCs4RCLOhpJD?=
 =?us-ascii?Q?p+g4sAs6xzDCspSwzXHaWgwLXybx7kzmXqEZaNOf40lei7t/kfAkdWLijryX?=
 =?us-ascii?Q?ZOMYjv2g20FJzaJfM41yLqv9jFUlVUz18CcsH3xSilD3SkJ2qloPaf8WbM72?=
 =?us-ascii?Q?rAJAaOS/IakHGv/MctwG4jePfqJKunRB+v3+uEMNu0QHEfcddEA9lPv8ANvD?=
 =?us-ascii?Q?AJE50UloJCMMMOwVANOemD48FjTAMOVMZVPUm15en0H8OmFFFSfBanlbbNIh?=
 =?us-ascii?Q?c9S3FUXOV13eXrExK8rTlmlvg4VcpObFTSCFTDtu154odjo2rltQFegMrY6a?=
 =?us-ascii?Q?232GDHP3WFXp+/zz470LgWTOTp0ORP58z/ADWdo4ddU/l04RCt/vqJhcjbqV?=
 =?us-ascii?Q?1nNQNzBoLgS9gNhweK/45Y7l0G0YNhKfttcWCojvRIatlGDCyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TVdocpHS9MN2/aH2cjzwlA0nG10i5cWcNAekcOFCePg/cDOdULyRiDgmY/OB?=
 =?us-ascii?Q?gIb53FIrhaSU2x/B+Dhk3TEZ9Et+vJC9t3Ki2i5VPCk8c4PFC8Gdl8U8K8A2?=
 =?us-ascii?Q?Zd0t9iqYEb9e1gDUq4tr1bFvdmdNOlgKeDXc63/Wwcudr0Ou6XWziVmDlJSi?=
 =?us-ascii?Q?a8TuHZLee1WSZvE2R1+8xh1HDm24KH1QsznoEqiYmVq4Ex+saxBbCA3w5tbi?=
 =?us-ascii?Q?l5jver/qHnFkOXtmVrpm03I0DhXCGNH6AjAwkbJCmX7xHlEasWff4A6OargK?=
 =?us-ascii?Q?LntTdeIlmjA1RqQxnAioWNq3D/wF8gtHyEq6Kgi9hG7GpmklkxVdXmUMUDnV?=
 =?us-ascii?Q?KC+8I33AzD/xS2BhDdyGyDzi2EVQt/QZlLFr86x7Hb96MwEcHCs5q/Md4j7H?=
 =?us-ascii?Q?JmXSHrUUg4tzqzFdEPhwJAPF3vGtwM0HZs/BkLWYbaUghatF7GzKkHpyskKv?=
 =?us-ascii?Q?wji8Wxutv8xpoO9ZOKJieSynDgXYdN/pnZBi48yqBgRQfMfqHbEfomyce3pG?=
 =?us-ascii?Q?PZgrZers3Nt+jDrBt5O6g7YhQlEGEr+If7lW3DvDRrhuZ3Bk0PwldUJm+z/R?=
 =?us-ascii?Q?oME+JcC8iT3bj0sb5M1GJj1LYPgTv3u7yOMvjzrsLpqhFs13ddvU3bnJMSGY?=
 =?us-ascii?Q?PnCpLRhLALLSf4o2ZEowI+NgYaBxnrVumeKdqZN0InBvB6fsWUvmseBZTzsI?=
 =?us-ascii?Q?eZ1l+Vnmroqjt2YRjdpLAvfjILunsXWb/Q5fr68wD/Ym4VcyGsVOOAWkycNN?=
 =?us-ascii?Q?rMbSUU6SeexndY1rtvMy/zU3P2eRSR6oYnfNNfyXfMpmQw50ytSUaFLVg3Tf?=
 =?us-ascii?Q?xBQaDGCTVZx6cCT1Cb2IOn6cOKEKmW2pIydUreEyY0FjwlNt1nDDmYdmutJc?=
 =?us-ascii?Q?OhlGq91SnSCCGdA4zeo1Fz33c8gyvUSfvwRN21wznEr+gjiA+LHmXQqskNIp?=
 =?us-ascii?Q?gWVsAUsKA3yxT3/lNpiqxglhRaAL/baR68eLUhZXq9UyV2dQAUAZZaRw2lBs?=
 =?us-ascii?Q?j5d48kedncgyuz3uO9/MaOBWJIhJ9XqQG53n16qGzrjzKIoDDJmG4lO1iMsW?=
 =?us-ascii?Q?bzdPu2HwsSYY2Ky3YF8K96cHUCm/t3EpMXbdhOajmknnFo6dJAgeBUNT8LGr?=
 =?us-ascii?Q?q3hLUsnOq9n7+aOQiw6JKMbJ5fyl29LQJnvNND9C5ETPhs6gVjGuFBwNTpa4?=
 =?us-ascii?Q?bGpYnCe/Zki2YWR/AmgCaPyTJOKdCjqhiCgPxsHI3HAVoeDoAMHezz3LX4zp?=
 =?us-ascii?Q?jnKxNRayzG0J9gkD3fjdpRCZ5yMrJCniE8/rBZpMtac4/SE/DcFRyUlMxyKi?=
 =?us-ascii?Q?jEFoL12bVlLeqO9hpxKor/V2ffhYItqAZnWzvYeFhtUR8UrE6+IwePoFtJVo?=
 =?us-ascii?Q?+qUlWjDvuyM0CxDjlsj3CNtnrasVUHNRvJl+C2cujgb/gMBWqPkwfb0eo8d1?=
 =?us-ascii?Q?ac1SIhZK5hEaeTOPRC2mtgI2Q0XZzSkBw/8t69HVvHNNUliKw5Y7u6BzrviH?=
 =?us-ascii?Q?dIbo0oywv+oBG6nB6ulpb2ZjyPW0NthQALju3+Y471l2FCh9NSsyoj67xU1/?=
 =?us-ascii?Q?MM6v6gwMmdGurcyOo5tg6UwxDr3ZOdzxh78xtBcJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee37858-cb4e-45ed-04c9-08ddf9e3c4c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:41.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IhBgzY2qPkQmCMQ+P7j5JFijGPy0jiv/P15FpM7xwpH9zBwvj0bXyV/Lr8wgPxQoip+yPre1Dr3+I8IeSfCXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

This patch set adds support for the GPIO controllers on the QIXIS FPGAs
found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
the same time it describes the SFP+ cages found on these boards, which
are the users of those GPIO lines.

Before actually adding the GPIO driver, patches #2 and #3 add and
describe a new compatible string - fsl,lx2160ardb-fpga - which would be
used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
will be used in the next patches when the gpio controller node will
define its unit address as the address of its underlying register offset
inside the FPGA. This requirement is described in the yaml file and it
only affects the newly added compatible.

Moving on to the GPIO subsystem, patch #4 is extending the gpio-regmap
with the fixed_direction_output bitmap which could be used by user
drivers to transmit directly the fixed direction of all the GPIO lines.

Even though this patch set touches multiple subsytems, each with their
own tree, I submit everything at once so that we can have a clear
picture on the overall intention. The hope is that each subsystem can
pick up the related patches since there is no compile time dependency
between them.

Please note that CHECK_DTBS will fail without the following fixup patch.
https://lore.kernel.org/all/20250912165916.3098215-1-ioana.ciornei@nxp.com/

Changes in v2:
- 1/9: Used the newly added trivial-gpio.yaml file
- 1/9: Removed redundant "bindings" from commit title
- 1/9: Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
- 2/9: Enforce a unit address on the child gpios nodes (remove the ?)
- 2/9: Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
- 4/9: Add the fixed_direction_output bitmap to the gpio_regmap_config
- 5/9: Use the newly added .fixed_direction_output bitmap
  representing the fixed direction of the GPIO lines.
- 6/9: Use the same compatible string for both GPIO controller nodes.

Changes in v3:
- 2/10: Replace the trivial-gpio reference with an explicit mention of
  the accepted child gpio compatible.
- 2/10: Reword the commit message.
- 2/10: Add the 'else' case to the if statement.
- 3/10: New patch
- 5/10: Make a deep copy of the new bitmap.
- 5/10: Remove the offset check against the ngpio.
- 5/10: Added documentation for the new config field.
- 6/10: Remove 'drivers' from the commit title.
- 6/10: Remove the qixis_cpld_gpio_type enum since its not needed.
- 6/10: Remove the NULL check for device_get_match_data().
- 6/10: Use a bitmap declared on the stack as the config field passed to
  gpio-regmap.
- 9,10/10: Moved the reg property before address/cells-size.

Changes in v4:
- 2/11: Add an extra paragraph in the commit message to better explain
  the context.
- 4/11: New patch.
- 5/11: Insert the compatible so that the alphabetical order is kept.
- 6/11: Replace devres bitmap allocation with bitmap_alloc() and
  bitmap_free().

Changes in v5:
- 6/12: New patch. Fix a memory leak.
- 7/12: Rebased on top of latest linux-next, change the extra goto
  statement.

Ioana Ciornei (12):
  dt-bindings: gpio: add QIXIS FPGA based GPIO controller
  dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
  dt-bindings: fsl,fpga-qixis: describe the gpio child node found on
    LS1046AQDS
  mfd: simple-mfd-i2c: keep compatible strings in alphabetical order
  mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
  gpio: regmap: fix memory leak of gpio_regmap structure
  gpio: regmap: add the .fixed_direction_output configuration parameter
  gpio: add QIXIS FPGA GPIO controller
  arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO
    controllers
  arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
  arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
  arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    |  58 ++++++++++
 .../bindings/board/fsl,fpga-qixis.yaml        |  10 ++
 .../bindings/gpio/trivial-gpio.yaml           |   2 +
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  52 +++++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |  78 +++++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-qixis-fpga.c                | 107 ++++++++++++++++++
 drivers/gpio/gpio-regmap.c                    |  28 ++++-
 drivers/mfd/simple-mfd-i2c.c                  |   7 +-
 include/linux/gpio/regmap.h                   |   5 +
 11 files changed, 351 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


