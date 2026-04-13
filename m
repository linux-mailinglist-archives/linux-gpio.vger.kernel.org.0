Return-Path: <linux-gpio+bounces-35081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APKzE3LG3GmcWQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:33:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D59983EAB2A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F36A630523CD
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838753B389B;
	Mon, 13 Apr 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="X+UH+B+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020117.outbound.protection.outlook.com [52.101.186.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6543935AC0A;
	Mon, 13 Apr 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075864; cv=fail; b=mmJMp4FsxX8b74RGQ9rSBlXHtiJPWgbVZXjdscdQO0D2k3ku2WZiPRLN9vjKjCn4ihsLs0cvpCwNofE3op0D1njq0GVW8eZTxyjgQAL4Ji7h+y7do/ETf0bicvE5EtRDKL1GGSNKc+t2QmH0xR5vfIaLzn6KSSSt/Omv85DMWpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075864; c=relaxed/simple;
	bh=HvoUMFmJjtYA3nJFEKNbu9JIOfPidYRSxDxiMCsF6BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kx3e1i72Rj9dTMa7dT2i5XJj7UHXXXFvmXDMb80GLtgY4x6D/gFgwqw2xQQIJBOGQDH++N6/R5iB8dRzBuvhgfMe3ewVHadr4i5UTA330sikY0OA3922J7ljL5vGD8ftXFYdErS6VkORzAtop40AAhvGvHrGdA/3dUnY+KQcJUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=X+UH+B+X; arc=fail smtp.client-ip=52.101.186.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ2atrLyXCYbgu6zxpm4yckKIFJ6iKNlJddqGy2ldhBdmejcDecK6Yq3WRo4FbufdUUThoZEpACHIOjZ5l4R49fUm5rytBCqBUxC+6SPwLwR9hV8+jqOne5KKqyZNXVvKgTgJhn0jgBTWjnXmG+gDfV54m87aZ5pBIqI88twOTxdHmFeWy8oLnsBSDq24gSeq04sDPkSdY/RvWgE3teqgmK1yiYInJl1cp/H+atXpqLd2/+buY75eEDdU5l01F1HDUHPviQKvlD71d47eOGGRrILoKGO2PlAsN/MqW4dKYmQyPMx+91K/phwoCGfxIhBA6aHaJaiRovKvRFiZilhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhZPRp9moicTtG6DO5LKsSOtyYbW3nWb86FQkpl0WVw=;
 b=VEhWWGoT6eYOnN3hlAU+5SLJB9gI3Oh6uvyTIfDl35soshc5iR1axil8kU5CAXyEJ1uMv54cQZ+hbri1HFtp50yWFrF4BFSTpDDrrwFZH5oy0iBSb/LBkLaZ0Q1gCvyzJ9NNXbFsm72+mL9R1as7GvNLn7PVCaZwfWu4r3k4ITiEt6dUOjHmv9ahvxgphpY2Fb25u/EsTyladwywof468yutwKosBPb0hasWGTaOYrNethiBDHKcVy3CZrvUfCjO58vACFpwV7V4Nqxwl9J1o5AFscRQJmNNtXJ54JNxwF/y4NRr1r9zQ/JMbhuo44pCqTc1xflsyMlV3uVeaXjBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.31) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhZPRp9moicTtG6DO5LKsSOtyYbW3nWb86FQkpl0WVw=;
 b=X+UH+B+Xr8PJhPCLhe81U5820/Npd7H0aigmfVX/lz4Yla7v7WxBPwDvBzISc/KcUutaDMnTeLuw/o35tHL6/ODWAd0UcFmMK0PWXLg26++YyWR1tRRX66b843b8QFSeUmaunB7G/9ffPLkR3Lx8q8xiwW4cGfbnLHLiU0EVwRs=
Received: from DUZPR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::12) by ZR0P278MB1416.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:92::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:24:17 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::61) by DUZPR01CA0038.outlook.office365.com
 (2603:10a6:10:468::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.31)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.31 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.31; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (2603:10a6:18:3::10a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 13 Apr 2026 10:24:17 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmw6Dgbz4x3H;
	Mon, 13 Apr 2026 12:24:16 +0200 (CEST)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.5])
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTP id 4fvNmw5vNBz1yh3;
	Mon, 13 Apr 2026 12:24:16 +0200 (CEST)
X-SEPP-Suspect: 9bf4815551b845e9a48fb38db1a7921a
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmw5Md3z1x8H;
	Mon, 13 Apr 2026 12:24:16 +0200 (CEST)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4fvNmw4qkgzmZT;
	Mon, 13 Apr 2026 12:24:16 +0200 (CEST)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 13 Apr 2026 12:24:16 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com [40.93.85.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmv0XQCz1yyv;
	Mon, 13 Apr 2026 12:24:14 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR4P278MB1787.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Mon, 13 Apr 2026 10:24:11 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:24:11 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	wbg@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH v2 3/3] gpio: mmio: add port-mapped support for gpio_generic_chip
Date: Mon, 13 Apr 2026 12:23:26 +0200
Message-ID: <20260413102326.59343-4-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR4P278MB1787:EE_|DU2PEPF0001E9C5:EE_|ZR0P278MB1416:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e455efd-4ba0-4f90-b922-08de9946d161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 FQ4V7xjpgooO0tpDFQWrV3mGBpMM5I6mumandapziXvKkpSS4JBRveKOZtDPRmsFEnwb+dkqDty5WoT8FTxvvKGqvb85NdlvzuPHC3AcQLe8VXpJ9HTf3ifn7RgGebbQoAjbMAHZfEZAXboa/PtY9S703nizj3YQe8Imw+LP0oXMp92RpXwcy+JPFpN1qSeRKtAtmRhe0gcfMPh0SVCCzqqpp3/5snni9Lb/iEeYYSl9DW0cF4ZMn6zEjn84VRL3bjd/N53waK0HqqrZZF5DFPofKhuBFqZwB34g3ZbAVbBf5CNsiJehT8DtfJvNLkDO9gZ36SySpKCzUfuEHPMC2Wez4f08DZjZMDg56mohw3ylIaTdhzuYXu+FhN8Z9siZca6C6JPCPLXe7PFEwbFb4XaGgmXMcKJJjXD4l83NmiO5WbMbPIf9d3125kadUK6ySRPx0+W7TuzLX9Kd8KWQS4WYYtKzAFF2tiArGH0D1Yg/k2bztmOT+55p2zR4r+EuoyX3+i3t+Erozq175i3w9gG13sHMqYIzVGiQW2Rwv0pkqZ1ZOrR6gSJv2yYwbBILyVXZwD4LwRfVC8NZIlvMsaF3XAdhQQbSxD9IMAVWfLCqrez/c4VZNbhI1GbXbua/0XSCJatL7VX+GruYPwNNw1cHFmFXNxf/wAVxibIG1vafUlolgAPKMB3rw1YfBZzZIqpU/qYuumDi7FinDdT9Ik8fNrr+GNLmIny9Ks8pq/e5FBxHE1VTD40WOn1AoVWv1VYKppeQZ9CE/bgZ7vxDnxTuZPZDWyNNIxr6mkNpC4o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 MTcJ5TX76ow4Td6VUMdo/k/mpkMUw/mpt3SHKh2/xuoJ3b5gTjh/BQVM3PPGdJYi1pHwBamSBR7N8mGEPbWSJtLLO7xePuWv9tUpXNivxYNojbYFNoT1qTmDwbu0nFjQ5KbkgfZ4zt6GYLQVHT3n7PPTbuFsuy3XF8Gg9kbUQf/E9QNI4ndIr5D64tsayG342MOAe7xz3lSwhe1JGTcfZdVoO18pdMICQIxIQET+ea+E1bcl6Zon/N5wMa0KZGtFUH4qCWEZ35eZfJFypjUDIeBBSi3SSHv9ymGcQMVm3/1v+NtXnoSprOY/0O/FUgQcRNH2aLJ8wEbeeOi1WgonqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1787
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08100412-8abb-4e14-3dd3-08de9946cd8e
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|10070799003|35042699022|14060799003|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2XTrPo63yG1+5eUNX0yErVzZGIydiCcQIPOjnkGyWjUZbbUM7hBAN00hAREA?=
 =?us-ascii?Q?vtyxaP+MFci52BHwTysm5ImmCHWkpvX3D4KnyuXHLAKTpNWu1CrXBZiMQTJL?=
 =?us-ascii?Q?wWPZK8iDgsSFk9bOHJYAGyIj8cBVucp58eyuLSm/E5R/e4xbe7hHbsCL5y1G?=
 =?us-ascii?Q?3jkN+g850PQHaLmoR7k9KX5wm02xv0qolqyr5WOvQYTa6JGpKh69GU5Lt8bV?=
 =?us-ascii?Q?hA/bjdjasNfMozPomAUD5+Nmy67L1NT/F3iXGO3vI3klqpGJpvPhC0VatjB3?=
 =?us-ascii?Q?6VCL0/7G/4ZuTq17eOQjvR4ZLnqZnW1iOJccJrqghKNQxPqzppoz7JZC34D9?=
 =?us-ascii?Q?CNrOBHKXf086nqxkgtysJ3gylkoumDcrK2LF3hORQJkppbZCXSulR5F55cnh?=
 =?us-ascii?Q?T4Ev6u8hJCZI4vqnUAriNXxkVN3a6YEhnh5JLEisZvm/WFOqbtnkPMfjkUAh?=
 =?us-ascii?Q?hXTMWviZoQKsgfOIOVSR54+b6Uam+vjI5oSC/Eg2JP4eq/N95zYbEMXjzTqx?=
 =?us-ascii?Q?WUKkKTGK09gJWh5zZEICUwrGaw4tYKbvOyK/VQOzVXbeX0PgJxq0SSpxIB1Z?=
 =?us-ascii?Q?IaXjjTWT5uCkmF1nTNVtBhKhkn3wmfw7IBS9QFc60JEDpLz9RW6jAiNbOpeB?=
 =?us-ascii?Q?mdbd5VrQT3cMZPtX52odR9YdpcuoeYB4bu67Nt+W7lN1A1BYK2ldzNWoXnlM?=
 =?us-ascii?Q?uBYn0KjswkPdpaTVyNydvl1S9DPR0dQPsjKZCjQ1JI4S9pq65okLpWGnGp0/?=
 =?us-ascii?Q?vzJvwVsOEjdmdda9yhIEghIi3sq+VsynGHybs+npWvUM+8QhmdGXUNW/hxhr?=
 =?us-ascii?Q?ZuGexqDJ3j5YcTiN0/QGSIrSWqehtnk7nI0cgt7ow9k7kQakBtnNnUZj29Fk?=
 =?us-ascii?Q?Sn3E8LWTWKiyAeKhrRLJ+strCjYRiUcysL7jz487V1h8chqXAZsGKy8bUr2j?=
 =?us-ascii?Q?67LMMcvdZSmvN0Lg1/JiuOH5jiNGJzKf4wAF4sSVdihwEuLBswkZEzE1pcBY?=
 =?us-ascii?Q?eOYFAN+FrPoTgJ8kO2o9k913vhIlUdOlux4PqUKW3AJDMr4RHComcyFqYeFo?=
 =?us-ascii?Q?zzqLtPYoheSn72hT9bydj9SNyeQsIxRmFUPqRKhS+RbLJ1qdv4EIEQNqXhav?=
 =?us-ascii?Q?/utv9c8aotTiSVbIc+A891du2Lc570FkZiYyJfZVoAnwqCWxOMaxkb2eRES9?=
 =?us-ascii?Q?essnabSOADB38gyT146srQosFs7qjwKUlJ4LCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(10070799003)(35042699022)(14060799003)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cE7USBsK3974eMOCvPx1px6egPHc+J8AOKpvOa6D7+QXD0LVLdoCFNF/m9N/njcqaJrrbDJVLl/2rHZYo5dRpDV5NZuQCHZi9MYro4Lv3hZ+bkieTuyh4qIgSRbq3AFpPJseLhBy/4NFjPcO0yDLmfA19U/GlTQQqY3TmU2Pg/i8uEpk+sX9SzMptJwoX3MbXPjZD+UWY7m1u3LwSy5cgDcwBT6RBvd+iII0DmFwK7fLVNepSmA1PtUsKaP44eB9MKv7e7u0nUI2TPXARJ5SY+r/ZnJ31o+0DVh75ubj3IrTVAt6jo7yVwRy3FtYxdi85B9P1rlFbZGevrbbq7B2Jcx15cW9O7VC+tMTqcUSwW5fEVkcbyQcmB1CzjhNqJTBpSJEhTOHx/G/8e6HrvZ9IVPojYaFI1LxOZhHyY8Rq7PPtfn67V1Uc7tBtKgfRN1D
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:24:17.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e455efd-4ba0-4f90-b922-08de9946d161
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1416
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35081-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[duagon.com:dkim,duagon.com:email,duagon.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D59983EAB2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new structure gpio_generic_chip_port_config for configuring
PMIO chips. A new function gpio_generic_chip_port_init() allows to
configure them.

Add an io_port field to struct gpio_generic_chip to distinguish PMIO
from MMIO chips during initialization and select the proper register
accessors.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c     | 30 ++++++++++++++++++++++++--
 include/linux/gpio/generic.h | 41 ++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d23c5d275e6b..01e2afd8d6f1 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -740,8 +740,12 @@ static int gpio_generic_chip_init_common(struct gpio_generic_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = gpio_mmio_setup_accessors(dev, chip,
-				flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
+	if (chip->io_port)
+		ret = gpio_port_setup_accessors(dev, chip,
+					flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
+	else
+		ret = gpio_mmio_setup_accessors(dev, chip,
+					flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
@@ -801,11 +805,33 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	chip->reg_clr.mmio = cfg->clr;
 	chip->reg_dir_in.mmio = cfg->dirin;
 	chip->reg_dir_out.mmio = cfg->dirout;
+	chip->io_port = true;
 
 	return gpio_generic_chip_init_common(chip, cfg->sz, cfg->flags, cfg->dev);
 }
 EXPORT_SYMBOL_GPL(gpio_generic_chip_init);
 
+/**
+ * gpio_generic_chip_port_init() - Initialize a generic GPIO chip for I/O port devices
+ * @chip: Generic GPIO chip to set up.
+ * @cfg: Generic GPIO chip configuration.
+ *
+ * Returns 0 on success, negative error number on failure.
+ */
+int gpio_generic_chip_port_init(struct gpio_generic_chip *chip,
+			   const struct gpio_generic_chip_port_config *cfg)
+{
+	chip->reg_dat.port = cfg->dat;
+	chip->reg_set.port = cfg->set;
+	chip->reg_clr.port = cfg->clr;
+	chip->reg_dir_in.port = cfg->dirin;
+	chip->reg_dir_out.port = cfg->dirout;
+	chip->io_port = true;
+
+	return gpio_generic_chip_init_common(chip, cfg->sz, cfg->flags, cfg->dev);
+}
+EXPORT_SYMBOL_GPL(gpio_generic_chip_port_init);
+
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
 static void __iomem *gpio_mmio_map(struct platform_device *pdev,
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 30f0d87422e9..93ce5f09c0d3 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -56,6 +56,43 @@ struct gpio_generic_chip_config {
 	unsigned long flags;
 };
 
+/**
+ * struct gpio_generic_chip_port_config - Generic GPIO chip configuration data for I/O port devices
+ * @dev: Parent device of the new GPIO chip (compulsory).
+ * @sz: Size (width) of the PMIO registers in bytes, typically 1, 2 or 4.
+ * @dat: PMIO address for the register to READ the value of the GPIO lines, it
+ *       is expected that a 1 in the corresponding bit in this register means
+ *       the line is asserted.
+ * @set: PMIO address for the register to SET the value of the GPIO lines, it
+ *       is expected that we write the line with 1 in this register to drive
+ *       the GPIO line high.
+ * @clr: PMIO address for the register to CLEAR the value of the GPIO lines,
+ *       it is expected that we write the line with 1 in this register to
+ *       drive the GPIO line low. It is allowed to leave this address as NULL,
+ *       in that case the SET register will be assumed to also clear the GPIO
+ *       lines, by actively writing the line with 0.
+ * @dirout: PMIO address for the register to set the line as OUTPUT. It is
+ *          assumed that setting a line to 1 in this register will turn that
+ *          line into an output line. Conversely, setting the line to 0 will
+ *          turn that line into an input.
+ * @dirin: PMIO address for the register to set this line as INPUT. It is
+ *         assumed that setting a line to 1 in this register will turn that
+ *         line into an input line. Conversely, setting the line to 0 will
+ *         turn that line into an output.
+ * @flags: Different flags that will affect the behaviour of the device, such
+ *         as endianness etc.
+ */
+struct gpio_generic_chip_port_config {
+	struct device *dev;
+	unsigned long sz;
+	unsigned long dat;
+	unsigned long set;
+	unsigned long clr;
+	unsigned long dirout;
+	unsigned long dirin;
+	unsigned long flags;
+};
+
 /**
  * union gpio_chip_reg - Generic GPIO chip register descriptor for MMIO or port-mapped I/O
  * @mmio: MMIO register address.
@@ -79,6 +116,7 @@ union gpio_chip_reg {
  *           representing line 0, bit 30 is line 1 ... bit 0 is line 31) this
  *           is set to true by the generic GPIO core. It is for internal
  *           housekeeping only.
+ * @io_port: indicates that the device is I/O port-mapped
  * @reg_dat: data (in) register for generic GPIO
  * @reg_set: output set register (out=high) for generic GPIO
  * @reg_clr: output clear register (out=low) for generic GPIO
@@ -100,6 +138,7 @@ struct gpio_generic_chip {
 	unsigned long (*read_reg)(union gpio_chip_reg *reg);
 	void (*write_reg)(union gpio_chip_reg *reg, unsigned long data);
 	bool be_bits;
+	bool io_port;
 	union gpio_chip_reg reg_dat;
 	union gpio_chip_reg reg_set;
 	union gpio_chip_reg reg_clr;
@@ -122,6 +161,8 @@ to_gpio_generic_chip(struct gpio_chip *gc)
 int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 			   const struct gpio_generic_chip_config *cfg);
 
+int gpio_generic_chip_port_init(struct gpio_generic_chip *chip,
+				const struct gpio_generic_chip_port_config *cfg);
 /**
  * gpio_generic_chip_set() - Set the GPIO line value of the generic GPIO chip.
  * @chip: Generic GPIO chip to use.
-- 
2.53.0

