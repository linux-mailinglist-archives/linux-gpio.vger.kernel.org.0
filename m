Return-Path: <linux-gpio+bounces-34180-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE5wG1JrxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34180-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:10:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C915532D453
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FA5D3115151
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D700397E89;
	Wed, 25 Mar 2026 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bC97txeu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC6396B78;
	Wed, 25 Mar 2026 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479892; cv=fail; b=l2Bv72PzNrB2HPuJtZ1YtgQSeC47a4h8+RdbpTCZd9/smg9eFBwwGb3vHvyGiFCxiheMuQTO7aAuon/WHWYrU/Oku98JoAb20F0rldcp4OhVM7/dljGFi0lop9o4ikSsBncIMTT4bEK2ujnS8QuFKbYg92N1/T4v+ZQ6w+PF38A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479892; c=relaxed/simple;
	bh=xqBJiEfvOH7Nl2xCbI4j+xB91+y2euFq8Sn6ZgSOdbg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eqzxTACP9mQ/iWYgCQoa5OSM+om/rX5+uqcBp6vEUca9rRbQ/WmOU1v+4NryNx5PEAV/DjMted930aogPOG8WBRr7GU0QEzb22XzKOZ7zLghaVRoJoc3xcVzPWz/ZicsLUGkx7JJsXEQ3Uo5KbMx5paYy+2SmcETqwlvnY6Ba9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bC97txeu; arc=fail smtp.client-ip=52.101.83.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T88bAum4bwRn4pBRxms+brwWlfqd5FW+n3ZSY+0vQjHrTrgqT51/+6Tki5C2uTjXbLrf5gp0ZqKxL3HW1HRMc99y60PB1p8PLtTwD+c+SGgrhgJFwF7oE5vwFMCquncK1/rffaN4levUHI/rR2lNIW1Pn9CN38dupbjATVb7x1aqbocgRDk3dCPVG13RTSevTV0Uc7/ji+JD7GVNdomfJoD/rI04IPc3V4DfVlzeGeIynqbkpr0Q6H5eKzkRhbmUlTgJu73P9+0lj7U3ojgkbodPUaWgy19ATiLgPDWczUUyPNzADovkTZ8urxshKKJfYhw5zSJpeiYePxES5wuL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMucjSSuJLQ3mLwi6d1B/lBooHKCgoMCMRWNm3Wh8Zs=;
 b=O+oUulbSDXJhOjld/3fL6XIvtrQRtJ/DzAsNedc9GkFUImCc/VjjOjhBArkQgZ2L8dIvIklueaTfcKbCPaTnsbRit0zu3xA71bSe9W0LkAX31TwTq/Q0ebCIzf4lBBiiw3qokMBzXHnfze1pDp9agGHZ67FShLdg8RuE0/ERRJPLWYQzzYVv6rhYlGKtHOJL3pFj40riWIkMfzJKH6qk3Bya4wBq9LCGGiRQ6Db5/CwhDiQXxVycD3ZqQBPgfSW/UfyjQC31Twj7IAazIsy1DY1L1vQpKAtsUhpVUWgXZfG7dieCCXTlpq/KH82OcMR71NNYyAi6VoiHEj83uyzZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMucjSSuJLQ3mLwi6d1B/lBooHKCgoMCMRWNm3Wh8Zs=;
 b=bC97txeuHQPJRegoJ5J959LShjw/F8WQJ8f3XApNHNeb/dFnsaBU1ox8pp4kYlufbtEJjyLJo0jBBmT2YYdF7Wzl4LvTUhogPM/ek+U6+tvyp9YdY9aLM0ErU8BW4UpjU/tjW4Er7ZXE94mbhKxkklbRENWH2nekL2SFeS6kwGoyfRhOZgQjqEb2zRC42qxq47c7sVeaheJmfGqR6qOhgK16UogdlN/vZinZ+TdxZ8BQfXRGDrCfyLxmizOO9wlYwL24JeJ/Q7947zyL7GWg1mLSHsQSL9aYr5jrd4l24oiClBGzxsBl79eJYdWIF5O+b3gAXrSbr0dXuEDXxHLVlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:47 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:14 -0400
Subject: [PATCH v4 5/7] pinctrl: add generic board-level pinctrl driver
 using mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-5-043c2c82e623@nxp.com>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
In-Reply-To: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=7998;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xqBJiEfvOH7Nl2xCbI4j+xB91+y2euFq8Sn6ZgSOdbg=;
 b=nPZkXfOA1P0baip/c2np4LQmAiQJuqHBEUphDHkFRpH8SK71V8+eL8ZpQCfX/C3fU+7KGEWRt
 xkVGE6l3WOeCHoFaKo+H9y8PrLL3ASMr1Vpfq+Z21CrEDhHh3HMCbot
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbd3c9d-37a1-432f-b771-08de8ac2e90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZsV7WoC6us0toeNjdKg81mdlEeomYcSfsTasQ2nKgaOm8X7QYbTZalOtFzXZgxdvpaBz6EkX11nKDLA5tmQJ2FXAKp0sqHvvTTywXvmeufmK59Xj6Xng7i3Cby+PPZsM+1xlVAx/2Zxe4DxcI3jJ8RgeGz//0a2Cf18Tk0Ez9E0TPAGp41jKczTChQNbbTxSxFBbjFZyDqhQaZ6xIpsraO841bx1kJv5NmSBxXUZcX5mdoiptnYPGHwamC81qjqTBE2tpZLYCrXD/ster5jEcM56uP4wVKJAKJfDaeWHRAdXf1/LppZhytUm0BV4zsdJo+gOxkIdDPrzIaLm/ZPLGjwaM6D2SV6FidpU0X9iSu1BVBM/vcoGZcw2iwGWylb7sAhmeJaqw+M2F3Tx2wtapZCpgk2UDyUB7ZngQ5eh3rPeSxhZBt8smrKvmHrha4Y4u/Rn0EMjy6arM8L8jXwMoEPL/OhPfsvRKrevtrV9N2MEYP2xoR7z0rDajaX+pSWrvBg2nRVetLy+76rsybOz9btgUp4WbW2VsfEray0l0fDYY8Zs9ESrNVdghGDXTWTJAoRHvJhJBeKQuf0fjheqsNFSDhI4hQZGoHqFfA/EeBRR1QYQgWkwJherxYq2HPz6ZKjoar6MLEvqKzq9UauQMvEvWJUnqOLzLg2dvygOXYiTt5hlgfjjABAv7gNZJiBIi6GhTWV6y3vev+4SVLUGKJmNSa3A0GC00FWBwfOye8eiSEUZNKER4oJYJWzT9MdS1QhQMiWFdmI0PcYZcyrI3ytbxrXydHp2EoPA7Adg0lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdxMHhRSjRCdGVLa2p3OHhZR0F1Z0hDNjJrYUNZRjJwMXRwdElWU3EvY1Z4?=
 =?utf-8?B?NUZaRHZuNzlXdWFhVDQ4VnJwQWdmWWtabFlnRStmZVpXQlBTd0w3aXV4U1lN?=
 =?utf-8?B?aWRzOU91ZjhHVi9NZFRMeTRvQXJBMU8rUURGblVFa3pFaVpsUVdQZjhxNXM2?=
 =?utf-8?B?b0VkVzkwZW56RDhqT3ZHRURBSHI4dTQrLzlBV1ZPRlk1anlOSHFUb2FOcnVp?=
 =?utf-8?B?VTlab2lzWXVyc0FpTS92Q1A2ejFsUWxOd3NwQ29sdThDdTgxSkl5UUJ0UktU?=
 =?utf-8?B?eDBYdWt5MGN5WDNoT2lvQ01hQmliK24wdFdLQkdoVllzWW5mcTlUd3J4QUl5?=
 =?utf-8?B?MkhGc0c3QXY4YitrblIrVzdJVk9UbEJVVTNPbjVTRVZubzF1RzNRRVlsNjIz?=
 =?utf-8?B?RjVZaGc3bEM2SFMyVVhrT2xlL3RPNWVzaU5xN2dDelAxT1lwZXlMWmVjM3pK?=
 =?utf-8?B?ZlpTa2M3RmIzK2lROUlFcC9XRjROY3lOSk1PZEMxOE5ENzVJcWFaQ3p3Ylh1?=
 =?utf-8?B?SjhhL1owbVZ4czlpQXgyLzY2RTdWZnRVOWRhdVVBSC8wSEJzY0xsZm1oSVFK?=
 =?utf-8?B?RjMwTzQ2ZHlzbFc5bEt3Y3dxaTNoZ1BDa1o3ZHV2clFJWktxMnRBa1pxYi9k?=
 =?utf-8?B?Q0ZNYlNHUkFJQnpVNWdXNDhFaG1aN2tPMlRGZXF6VVQ2RzBjSkZpeTAveWNW?=
 =?utf-8?B?NTVrTmNNTWNkSktMdkQxc016REdoK3lJZWRpMnZEckx6L3hDeTd6Q0FheThk?=
 =?utf-8?B?eDNYd213aFlFQmJ1Z2dObHpUYUhWVU51S0VqSEpGNmJNN2JUQnFCM1UrVlht?=
 =?utf-8?B?dTdaclNlQWpZMnc3cGFvT3dLSjUydERUV2RteC9YaEM1ZXcrMEczOUtxTU9P?=
 =?utf-8?B?QkNmMDZpQ2tkS1lTUk52Q0xaTGxZTm9rMzJmZVovMS93WXYzdzFwdmV4Q3RQ?=
 =?utf-8?B?N2lhdHZXL2hTQlBKcDE1aEVDV0lqZEVSQldhL0ZqSXJtRnRTMEtJMTNBNzZT?=
 =?utf-8?B?ZmczaXRqSkFDeXViODdHTVduSVNneVhGZ0FEaW1RL3J2OTV2aU1zYXhSMFls?=
 =?utf-8?B?cE1xUHlydzFPMyt2Yjd0b3RIdWoreDhXNnVyZGZ4c0Z4dWtiVm14Y21GdTVx?=
 =?utf-8?B?aFlLZjFheElSTEt6eWZaenpGTEwwWmxvZ1JsK2Y2OElFYlVkczQzd3o4RUFN?=
 =?utf-8?B?d1hRSGRTT3dHbUhNNUtrK3JhUERmQmloQlhNbVd2ci9xa0l4Tm9TVXVzYkhQ?=
 =?utf-8?B?S2hUb3hHU2FFSHlta3J0UExYQzRlSzQycUE5UVhRVVMxZytSVFkyOGZ3UThq?=
 =?utf-8?B?a1pKakl3Um9TUEN5UUQ4UlRmRzJsS3ZwNW1pcENxRUo0T3IxQngyYmpjWlAy?=
 =?utf-8?B?NzRsRkY2dzdCM2lqM1BpNk81VlR6djA3N2xablNtTUtwaVFMS0xER1Rpakw2?=
 =?utf-8?B?V1NBeDBLV3g1L0JMRVR6VkU5VXliMEpKeno4QVlSMmg2QzYvRHlrV3JWclQy?=
 =?utf-8?B?VGdTRkwrQ3gxekVGZW03SFA2OHBSVE43NjFUVFphbDZUZVJxZmpvR0REc0sz?=
 =?utf-8?B?Q1pEMVlQVDNrTUR1WHA4cnFTN3hYQ3BhWmwwcEFmbmM4SmRDcmEzVTFuMUJu?=
 =?utf-8?B?Ym1uV3BaWUFBbEpGWUFXdDZmd2dMM2RNV2ZCbXV3R2ZQSVhqUzczYUFsNzFy?=
 =?utf-8?B?dml5VWRhU2FjNUVwVDVjc3d1YndJaEd6MHJtdXdtS3h3ZDF1Kzl5Q21TUUhF?=
 =?utf-8?B?emV2VjZkVUY0NVdYem9yNFN2T2kwcjBqWEZ5alE3aThzWUY5SStTVmZ4TXdH?=
 =?utf-8?B?bEY0MnNzdEdVNXdJV2k1Z2djUC9jeUtMa2JsWDg3MmhKTUVGVzQ5WkpvaGVw?=
 =?utf-8?B?Qy9EdUlyMURjaXNvYUVMZUI5Y0kxdTlxdTJiWW8raVVYbUljWkxCOStKWXlK?=
 =?utf-8?B?bU1DcnBBcWFyMzJIaENGMGxSQ21PK1FyVEhGU3NqeVpwNjBxY0t1Q2NpUGdL?=
 =?utf-8?B?cnp1UmhVTklVaEhWbWdqZ3owTkxRZ1J6NldNNWRjRkp2SERnZ21jTTNUQTU5?=
 =?utf-8?B?VGg5aVlzZ2x6dm1adXFMNDNXYmV1MWhTeDUwdXF2WmJWUU1BYWJBUDRzczEr?=
 =?utf-8?B?aVpkVXFBdGZOYUdHUTk0dEo0MUxxMDZBdlNkQXl5MGdjZGppRFcveEVsTXVu?=
 =?utf-8?B?b2ViMlJMQjFYTldQb3d0ZGJwOCtlZDREdTJhV2U4VkRQdzZiSlRFb3hlK2Nk?=
 =?utf-8?B?WTlPWVlTOTBTamJvZlBySnlNSzZoVExZQndSZ0VLRGtJejJJREJCbTV4SGRT?=
 =?utf-8?Q?X1m61y0zCz/UTmZpxS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbd3c9d-37a1-432f-b771-08de8ac2e90f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:47.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMf7DXbHmP5YdsKZCAHiHJd1v1PLCsEr/Q/cvLlMSoCQ7VmVFJjcJ0qK/BKaohdfxFac9tsMPLM2iLGFRyojBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34180-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: C915532D453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many boards use on-board mux chips (often controlled by GPIOs from an I2C
expander) to switch shared signals between peripherals.

Add a generic pinctrl driver built on top of the mux framework to
centralize mux handling and avoid probe ordering issues. Keep board-level
routing out of individual drivers and supports boot-time only mux
selection.

Ensure correct probe ordering, especially when the GPIO expander is probed
later.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
chagne in v4:
- use new pinctrl_generic_pins_to_map()

change in v3:
- use pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_utils_free_map().

change in v2:
- fix copywrite by add nxp
- fix if (!*map) check
- add release_mux to call mux_state_deselect()
---
 drivers/pinctrl/Kconfig               |   9 ++
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-generic-mux.c | 197 ++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..b6d4755e67510786c34f890c5e7a3fcf0adf45e4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -274,6 +274,15 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_GENERIC_MUX
+	tristate "Generic Pinctrl driver by using multiplexer"
+	depends on MULTIPLEXER
+	select PINMUX
+	select GENERIC_PINCTRL
+	help
+          Generic pinctrl driver by MULTIPLEXER framework to control on
+          board pin selection.
+
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default MACH_INGENIC
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c8becc0aa1d77c68b6ced924ea264..fcd1703440d24579636e8ddb6cbd83a0a982dfb7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
 obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
+obj-$(CONFIG_PINCTRL_GENERIC_MUX) += pinctrl-generic-mux.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
 obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
new file mode 100644
index 0000000000000000000000000000000000000000..d1c1ff16a78dfd9ea66c51e9f70af1839844bcec
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic Pin Control Driver for Board-Level Mux Chips
+ * Copyright 2026 NXP
+ */
+
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+#include "pinctrl-utils.h"
+
+struct mux_pin_function {
+	struct mux_state *mux_state;
+};
+
+struct mux_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+
+	/* mutex protect [pinctrl|pinmux]_generic functions */
+	struct mutex lock;
+	int cur_select;
+};
+
+static int
+mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+			  struct device_node *np_config,
+			  struct pinctrl_map **maps, unsigned int *num_maps)
+{
+	unsigned int num_reserved_maps = 0;
+	struct mux_pin_function *function;
+	const char **group_names;
+	int ret;
+
+	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
+	if (!function)
+		return -ENOMEM;
+
+	group_names = devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
+	if (IS_ERR(function->mux_state))
+		return PTR_ERR(function->mux_state);
+
+	ret = pinctrl_generic_to_map(pctldev, np_config, np_config, maps,
+				     num_maps, &num_reserved_maps, group_names,
+				     0, &np_config->name, NULL);
+
+	if (ret)
+		return ret;
+
+	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
+					  1, function);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops mux_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = mux_pinmux_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int func_selector,
+			      unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+	int ret;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	if (mpctl->cur_select == func_selector)
+		return 0;
+
+	if (mpctl->cur_select >= 0 && mpctl->cur_select != func_selector)
+		return -EINVAL;
+
+	ret = mux_state_select(func->mux_state);
+	if (ret)
+		return ret;
+
+	mpctl->cur_select = func_selector;
+
+	return 0;
+}
+
+static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
+				   unsigned int func_selector,
+				   unsigned int group_selector)
+{
+	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *function;
+	struct mux_pin_function *func;
+
+	guard(mutex)(&mpctl->lock);
+
+	function = pinmux_generic_get_function(pctldev, func_selector);
+	func = function->data;
+
+	mux_state_deselect(func->mux_state);
+
+	mpctl->cur_select = -1;
+}
+
+static const struct pinmux_ops mux_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mux_pinmux_set_mux,
+	.release_mux = mux_pinmux_release_mux,
+};
+
+static int mux_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mux_pinctrl *mpctl;
+	struct pinctrl_desc *pctl_desc;
+	int ret;
+
+	mpctl = devm_kzalloc(dev, sizeof(*mpctl), GFP_KERNEL);
+	if (!mpctl)
+		return -ENOMEM;
+
+	mpctl->dev = dev;
+	mpctl->cur_select = -1;
+
+	platform_set_drvdata(pdev, mpctl);
+
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
+	if (!pctl_desc)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &mpctl->lock);
+	if (ret)
+		return ret;
+
+	pctl_desc->name = dev_name(dev);
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &mux_pinctrl_ops;
+	pctl_desc->pmxops = &mux_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, pctl_desc, mpctl,
+					     &mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
+
+	ret = pinctrl_enable(mpctl->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
+
+	return 0;
+}
+
+static const struct of_device_id mux_pinctrl_of_match[] = {
+	{ .compatible = "pinctrl-multiplexer" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mux_pinctrl_of_match);
+
+static struct platform_driver mux_pinctrl_driver = {
+	.driver = {
+		.name = "generic-pinctrl-mux",
+		.of_match_table = mux_pinctrl_of_match,
+	},
+	.probe = mux_pinctrl_probe,
+};
+module_platform_driver(mux_pinctrl_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("Generic Pin Control Driver for Board-Level Mux Chips");
+MODULE_LICENSE("GPL");
+

-- 
2.43.0


