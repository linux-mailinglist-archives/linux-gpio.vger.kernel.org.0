Return-Path: <linux-gpio+bounces-34327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLsTKfr3xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:34:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC534BBD2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78A69301CC4B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6182739A04C;
	Fri, 27 Mar 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHI2wv8Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF32F396B84;
	Fri, 27 Mar 2026 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647262; cv=fail; b=XAwoDQxKis1GkwsUdbPeQUWX6O7jxtnt+Na4Uc9LUwLZSf6dgpAkMkmMfZgRrx/E5H7fclYqwtuGZ6lFrgLUKlKxncVBeBGlMOQGloXGKTHSv5T6lQho4g4XLcOb/Asz1S2ekLDaoVtWO4MLHdVfSmS1GVEBASyUxZyds+Nhl+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647262; c=relaxed/simple;
	bh=ZqOXyMEZKpdtfOYJo0Y5lTjFMlx4fpv8p24JFyICfg8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=aQ/XlLJQe7IvbKh1b+0Y03ZGc8nRyA/yjUJ7GPymGP8PPBkyakkkAaXF4gct/MNF+6P8mipwAena2SruSoSITYC1/OSSFeF3nCyv70cGA1HxwceIUteJpjhqSd+vRzujXCpVmbXIx504ZfrgCMO2Lb2wzrHVieoxSGIjU/yhy64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHI2wv8Y; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUFatZvWJF6Hxhf+KbUFQBxsPQM7K3BPQvpUXAVm0km1pyLZR9JobBeR4njrImm739JDLPd5Sv+a3r23gaoMCoW+XG75PiveHmTg3mjJCFLgrUcHGDfHjFD5ShJt/+GbJwcn1+/G+KW7OY9RovhiiaZMKj1N+kzly52CLYXsLVFK0QT+I07wu1ivYlhnqI7tKb4gqBK171FJgLpVpuNnYyZiXaqM/L0zGqhUDA7fLzTJcCK1q3iLuFO9+hqElaOTe9POo5QH2kLPsGy/7jLEnvJwBsr0PdkeleSu2+YHsXqM4zOM+L9oDRncce72HVksCcbhIkQ2JMzNdi3fI7hNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N02sqjYI3iwug+a3LJdYvpxwjSTdj4Djem3qcoSxaU8=;
 b=ektvaMoeq/W9j8dc6KIC3T5OCuTm1bUN4GvFhkZP2myB8P3wTb/djZaD1j1QQJeShmoZB41EHN1tPvEjX4d23KRvhVyqhNbrjkwaW9WQ0uCPBu2cJ1T8vYYuxKMQopsA833WGsbqzVgY3C3GoHyxwSsMDBTSpR5MbwKfgObl7VpcU/fsZSS1aHROQYOKbjpZHgJquStQjwvDaj/+Wsm/Dx4x2/RS8xglv+9mMTqaL7AH9cZl0DRznl6x8W8f5tSoNGJrH4GsV635/0Bdtxn55ssnnZkFNfUvZW9kTKkr/U3mWZufEP77PMZGGrzcz2iGzgUZDqWwJvs5b8lr7eChfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N02sqjYI3iwug+a3LJdYvpxwjSTdj4Djem3qcoSxaU8=;
 b=iHI2wv8YHJY+8FOfqf3uoyc9pXqYKth9kD7rPc2fs3O2PQfqhBEwuYudBTJTIzbhdil8IvPljbYnvg/2Fp/cw6h6tfZSHkobisqb+tzciiKfalgr9QdPM/3L7KYP0MwJxGZBdZI49HwvNQBkITJynRunRCgUOAribVLWpd9W08TN4ss4WgEhA7lcpyTnT+3VzhYA4m/YppW9fgq/CY6C/F3K/yWIJKKVaiDBKRybR3Wfnr22fV8XXqaCdEoyv7sFkaKkcsKVfc0zPGT0tSicQJ3kVQIaRGG+klXHVGG/hqLj44SQdzBZO/m6Nu+Obd5u8fGEFv8DjI9cGHrfebzIyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Date: Fri, 27 Mar 2026 17:33:57 -0400
Message-Id: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMX3xmkC/13NQQ6CMBCF4auYrq3pzLQFXHkP4wJK0SYKpEWCI
 dzdQmK0Lt8k3z8zC9Y7G9hxNzNvRxdc18ah9jtmbmV7tdzVcTMUqAUC8d61ZvB3/nhOvG4Koyq
 tQUnBoui9bdy01c6XuG8uDJ1/bfER1uunUySdEbjgOstrBE1ZluenduoPpnuwtTLij0SVSowSJ
 OkSVVNKJVNJX0kAqaQokXQFBrKqKapUyh/5/1NGKSQZNDlajfSVy7K8AZflPHdSAQAA
X-Change-ID: 20260213-pinctrl-mux-df9c5b661540
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=4918;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZqOXyMEZKpdtfOYJo0Y5lTjFMlx4fpv8p24JFyICfg8=;
 b=vcBgIHw+s4TVVN/MOk0cT83EjvMhk0f20WPAPS46Ea7LJNM4OEKSAy0SDERY2Gla6yv819jOz
 6EsDH406O/EDjuaupbmLOq1yI6f3qFTRXD03EulFwfPZiGTgKGN894C
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 728b2321-abbf-48e9-576b-08de8c48994b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	c0eEFGMeEIOSP/KA4aOBJobAGlT3xxe8iOUm2Ybs3+RZWnnTL1Pn3FfD4yBJ2nuwaaGejC7a26DnLzjZQgLoNPVNkrHQ1hYzBY7jtzpcoMoa3WzWksA6apOZJpJTTeDhhWaikBaIUuiq0PYu13WTLH+A0YnSckWLwM3DzzizIrEXxCz08ii+SIFrjcFryIOHJrp8cJMyC/Ph7JNMquEOLhHlNi8e1+FXIAE0AHryD34GRjwiJW41tPeyTnEYu7+KU5qR1tQSuqljYjUJltzWkKEylIxJQGT/BLHuuna9QN8+TpN4So58z4gSQuP4c5ubrDom7lsqamycA280A6DR4u+ROuFhnTPlOoEUiJZ8qDbeZIrq4//TtowFvUZbpaQ1lcqzjZGomkH6jGYOnTtLopVSp1o0J95Pu08BRO3YNRV22Nw9DqUa2XHkdiH3cLym6PkXtyx0gXnvYRhSgC+zZnZZVPsUOfwnXBSLavmo8MSCqdCFtmlDEMPqhnV8dRZFIKAiRTnb2+X9cr2XuMCCh0hxSG84L2M0ZnLnqczIGbL6nUKHp9Qt/sY/tBgut1YxHHO6NihQR3FT5WoSIQsm+PJDHB+quNJC/GzJ1gnGxC+6eEguMojSprKObttPdwAN9yzczusE+G1Z9EeX9lsP9fS0ee4q1a08YxWtK6bs/RyYIH0wMDx4XDrQlwcFIwRbHRAcibAeMYSetj1+YEUJs9HK/+KZ2zhs7bXcfaqTc9WeHAYdP1GW3XeFJ2N3gsRB73OhVvvqJguIC3rZyPZ5cw+ydyTjhkfVlIQ8aYsmOwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FEcGtCakxJRGpNbkltdkpodkU5cmRFMGpQaHdzT2l2cWRhL29iUmw3Tkdj?=
 =?utf-8?B?QWhvdCtBUENYSTlKdzIzR2g1d09qd2RPMVoyU3U0UXEveit6YkFlazhZTjhP?=
 =?utf-8?B?T093TEFITlYrYTltclQ5UmloeDdXaDA2Q205NzBxTXVvUHM3a245RjVCUmNl?=
 =?utf-8?B?TzhPWU5iaG5saW9QV2tTcnJ6UzY5RHJ2cVhlOEp4TjIxOHYvSDJibW5YVTFj?=
 =?utf-8?B?OHA4SXdYLy96bHROMEgvdVpSaU5OdEZmWUI4RHpRTVpDNlF1ZEs1aHVxcUVO?=
 =?utf-8?B?cTQ3UFRwUng4NzZNQ3hoZ2h5MFl1L3ZrWHErWHBXYWJrcFBiWkNmVXhvaHJP?=
 =?utf-8?B?TU1QSkNsY2dxS2ZMZG1zRXdJdkgxVm4rVzJZbGZ6bXl0Y2hpbzRZVXRVVWZX?=
 =?utf-8?B?TTNWNDhOdkJHUndZbEJPWmVVejJrczd1M1B5R0JSdDFIL2p2WGhoMUxaMDAy?=
 =?utf-8?B?WUFqSmFiR09yVzRXdjBlTWpsT20vWStwMDR4LzNiRStib3g1akdWeUJhTmVW?=
 =?utf-8?B?QlZqQ3pOTHJmeDFKcnVQVDUwMU45WnE5VzVqeVRYanM3QWM4RklKNkQ5c0xp?=
 =?utf-8?B?VjFuVkFMVjdqQ2J1akZtWWVCbFRJYXpiM0FXbVNXYTg3WVRtcGdjRkp3MFVO?=
 =?utf-8?B?SjlUR1d5anQvRlVSL04zcFVzZlpPRklTSkVxNHlCWWJmcExQZTgvZ1dIbVB2?=
 =?utf-8?B?WVowbmlFdHh1ejJtWTNld05kNFFNeXlmM1JnQ09XRHhvSnRmZGdRSFZMSC9p?=
 =?utf-8?B?cDhJSVBobStSR1RjaWVmOUpEL1RoWTNOcTczV01QMDY0STBuMEhNQTFPSXFi?=
 =?utf-8?B?VGZJRC9zKzZxTTZYY1BMalVMR1d2c1pvNFhuMkhkUldzRjZWdmg0Y0pIQncr?=
 =?utf-8?B?ZFNPWjhNUUYzTUM2cXE3aVlGMzVMU0k5TWE1V1h1OWo5NTN0TkV3Y2ZVK3RH?=
 =?utf-8?B?ZGdXTkNjR2djZVlyeWVUZzIrYXErNmhmUjM1ZmFuWjdmY3dVbEhHVWNmR2dk?=
 =?utf-8?B?Y2V0VXhKYndBcWhDbWpCNWlnS09JOHg4QXlvNlBNNUxSQmJIclU4eUgwSTRz?=
 =?utf-8?B?S2U1ejRmd3k4WFg4eDFEKzhoVTRJWTUvaGhNak1DYkhNVE5TNnNnRnoyMFNz?=
 =?utf-8?B?aVQycSsraHZsejdndjUwUGZhRjRONGJBcUw2VWQ0cWNRTFNsSmpQYlp3L25o?=
 =?utf-8?B?WmJ2TkRWenduVUlYalNwTUhJL01SS3BLVTAxVy9nRmcxQUMvWE9lQ3FWd1JU?=
 =?utf-8?B?M3BCL1VpYkU1dVdvek53MHZGT1BuTXFOU0cvNkVMS3AvbC9Cd0FzbWxkenIw?=
 =?utf-8?B?c25aa2NxSFlOMVhlMEdPSnUyUGlCTXRVR3k3RWZvWmdNYUx5c0Z2MEliMS80?=
 =?utf-8?B?MVg2VlNrU05DRFRHSy9GN3hocTZPK2I1VzdManVueDI1b3VoclowVERIS2Rj?=
 =?utf-8?B?REU3OWR5Z0lIQW1COUJEc3RxcmE2a2pMVVZVc3dCZFNaSW53dUxjNVF6ZnUx?=
 =?utf-8?B?VzFIUHBIRTVpb0ZidFhabi9GT3ExMENmYzJnanh5VVZDUTB3WjFnVG1xby96?=
 =?utf-8?B?aFdwSndDQisraTJTL0ZSRzhPdmhkOFlCejR1TUlUUDREYThNSldDUlNoV2po?=
 =?utf-8?B?RjZJcWVDV1dYVDNyc2VXS2ZEUUdHaXFxY284SzFZV0xvNzg1REx0TUx6d0VO?=
 =?utf-8?B?MjVIeTMrSmZabTQ5bnY1anNHblpQZUlsVTI0QmF6UW5peGFQTkt5eW1keVQ2?=
 =?utf-8?B?UDlGQUhDRjFiaS9sT1pkWFE5SDdiN3c4Ym1QRXdLQ2RJMXo0cXJ6QW9qczcz?=
 =?utf-8?B?bWYramw5UXFBTUtWQlhMcXc4RVNiUlFGblpVRGlpQXYrcENsZU9iN3Q4NkJZ?=
 =?utf-8?B?R0ZqMzdzcE1QaXhyTW9RZG4zVDVOdmNobFZkZDRNVkV1RllkOURhSU9iT1VC?=
 =?utf-8?B?UGoyZFZPdGF0SUFWS2RUQmZZOTlJcHR3S0ZsZGV5Y1pCMGpIVk42VXc2Z1E4?=
 =?utf-8?B?cjZaSjNhRE1hbWQrZzNUdnhSQVhRTXQvZjFUa3NXdXBUYVlyZk9qbDUzNW91?=
 =?utf-8?B?eEFNNFI0dDIyYlMyYlUySmplbGhUVjd5aVM3ZS9EVlREZGhyRXRzRHdZQ3RV?=
 =?utf-8?B?TzRWYUc5L091bCsrS1BGWkJld2RIVjJiZ0dZVlBuYVN1Z2o3TGZVa3F2clAv?=
 =?utf-8?B?Wld4YXYxc0ZCVERYVk53Y1UzNUVvamJ6MWZXelE2bHBiampHZ0cwUUFUZ0pO?=
 =?utf-8?B?ZWtDM3RXN0dGMVlDVUxDOW5OZlhCZGFrWmwrc08wQjFPanFlRlBndmdJU0U4?=
 =?utf-8?Q?i/aVxc7CPdJ2mr8vNR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728b2321-abbf-48e9-576b-08de8c48994b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:17.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5gcjzLFnJa1WpQSv2Ng7M0jqmU+8whpkCXU0ZI99sgMrogmh46xEIogsG/iJ1zkhHrD1+ukzMLl4rgwqnEmhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34327-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EBC534BBD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

        ┌──────┐      ┌─────┐
        │ SOC  │      │     │    ┌───────┐
        │      │      │     │───►│ MMC   │
        │      │      │ MUX │    └───────┘
        │      ├─────►│     │    ┌───────┐
        │      │      │     │───►│ UART  │
        │      │      └─────┘    └───────┘
        │      │         ▲
        │      │    ┌────┴──────────────┐
        │ I2C  ├───►│ GPIO Expander     │
        └──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v5:
- add npins to pinctrl_generic_to_map()
- remove pins = kmalloc() in pinctrl_generic_to_map().
- Link to v4: https://lore.kernel.org/r/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com

Changes in v4:
- use Conor Dooley suggest to extract funciton pinctrl_generic_pins_to_map()
- Link to v3: https://lore.kernel.org/r/20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com

Changes in v3:
- collect rob's review tag for binding
- extend and use pinctrl_generic_pins_function_dt_node_to_map()
- add judgement about
commit 2243a87d90b42eb38bc281957df3e57c712b5e56
"pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"

which call pinmux_disable_setting() before pinmux_enable_setting() when
switch state. It is actually what wanted. Previous remove .disable() to
avoid hardware glitch when switch state.

New .release_mux() call intent just release software resource, like lock,
don't touch hardware register. No glitch involve. Comments already added

Linus Walleij:
  I hope this answer all of your questions. If I missed, let me know

- Link to v2: https://lore.kernel.org/r/20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com

Changes in v2:
- Add release_mux callback,
  test insmod/rmmod, mux_state_(de)select() called.
- Link to v1: https://lore.kernel.org/r/20260219-pinctrl-mux-v1-0-678d21637788@nxp.com

---
Frank Li (7):
      mux: add devm_mux_control_get_from_np() to get mux from child node
      dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
      pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()
      pinctrl: add optional .release_mux() callback
      pinctrl: add generic board-level pinctrl driver using mux framework
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file

 .../bindings/pinctrl/pinctrl-multiplexer.yaml      |  57 ++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |   2 +-
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |  15 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  23 ++-
 drivers/mux/core.c                                 |  40 +++--
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinconf.h                          |  18 ++
 drivers/pinctrl/pinctrl-generic-mux.c              | 197 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-generic.c                  |  94 ++++++----
 drivers/pinctrl/pinmux.c                           |   5 +
 include/linux/mux/consumer.h                       |  16 +-
 include/linux/pinctrl/pinmux.h                     |   5 +
 14 files changed, 424 insertions(+), 62 deletions(-)
---
base-commit: ff76d257e86235eb07ef33db8644a517c48d1c3f
change-id: 20260213-pinctrl-mux-df9c5b661540

Best regards,
--
Frank Li <Frank.Li@nxp.com>


