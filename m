Return-Path: <linux-gpio+bounces-34179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FW0OjFrxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:09:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91932D43C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB95D30F6942
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB4395DAA;
	Wed, 25 Mar 2026 23:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YsC8h3Uh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA13359A87;
	Wed, 25 Mar 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479888; cv=fail; b=DKhtDEE4AT63zg4c37YybLZoajob8G1S38FdXW0zN4yKOY+hCKJHoq9ne+EL80sdNgzHu/RUWbbow55h4GBAjTVNRVH+EZJ3nXjvHKM4vPnejj9vR8mGxOWXVJ2imtTfMhbTOtq1y6jyFXx52qF25WgF9H7W5fukjzj/Rje/ans=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479888; c=relaxed/simple;
	bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=P/b+bXPCdNVsEH7leB9x14PwxaEPgBf1OASxFwL0C892gHN8+cMIAQ7AeoPDfzG24Tq+5oGDsyIKoFhUNL3GYaIjFbHNJI2F3av6BBC+2ASnabaPNDrGR3YrVUJvPdVD2XZdnzpF2B6cxh071T5U4mPraTovJFj5/7KpIi07j4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YsC8h3Uh; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKI5ywTA7aqgcwEmqr0af7HhwiSpzUZs02350TNDaI1CpEEyh33FTYEQZC/sQChoxcKKIb8RRyjuuxj51+HurZxgX9ASFC5dzlDsyhNPCH4YP/OLtmmWwpAmI+8oPYXRwgxi9CygHh8c5rCh1mJ6S98D0JL9ya+Iio+gXgZvMe/rwjcvT/VwtjWeMj2F3e8i/OOw+EkGEDEzdazXT+goPl6+6gmNAIZLzALCb1aOa0nfEVQxhYAt931GYI38z4/vMTJnN3awCkZ4JwtZoPQLq7tWAdCt0qNyiXT7flu4be/Q/6dJy0iNABLOJ7D7IhSwxQZp0epzv85tgAsoM2Ozfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=mkZo479iprxW5QL1Q9Kvbaqw/Ox+cPQ/+RKet1TITSs4h9zFJ7T2g55w8pkg85Kjx/cRUXA4SDWulhaRHOcFfo63EwLkwN+TPf9JeCUz+SmPJM22FwEbf9gIdsypbfq+5T8cZ3zSpWOQ05/G8p5GIEB868016kVl+y5E3bJ7BPVBMWAlV98UibsDQx37VkGQffcnJEKO5CDK81mQ15JWgNgEqg/ZPPmi0FNIfrrNZbuSK6LbLe/+0eeOzg9543lIezyOxkpQmOmS2/IKb6VpRHSbk+1B+/LmppRAeUQZMPKsHBsGf9W7wa50do6km3rUlX95JmHWI5dBhr/Mq60T/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=YsC8h3UhJn1YgG17trjjWjKsiDDWesMcJwrmoqRU3XE5kMqMd3XAaXWdULVsW7ulVBer8DmW2BYImk+PA8fWBoN7lHwWQhE985WcfnUJsW1kSHY+/Pgbv1juWYTXu3znS7/M8uCA5gpY7DjBbpv/7balMX8iHn2/XkYG8Q2aHp3P5fHBOVeCeeKT2jFTKsciNIGlmdSwsHMlndN8uj+kLM+SECZHjA3ZHR8PrcNwe5FLCD68TpYa8bO6vQC2FsSoW6OcbVVqOxuaUdKiflgE+193Dpff8nJiW5BP0g+IALn1zr9jYoquEO9ewmoFcHKBXv/wmHS9CHzFLGj7DEKU9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:43 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:43 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:13 -0400
Subject: [PATCH v4 4/7] pinctrl: add optional .release_mux() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-4-043c2c82e623@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=3409;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
 b=pe/Y/nw1RowVhaTJvsdHbK0tUTSfQfQ4Papz/3xqHXCnzuUHmdtsre/LgJnOsq+fAsNuFkjoY
 VncGNPofarZC/j2b2xaqXyo36rBKmoctX3EDkVz+73BnQwR1X0Xxc72
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
X-MS-Office365-Filtering-Correlation-Id: 57040b2c-3c8b-49e0-44b0-08de8ac2e6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	s3T0efTDW1hqf/TXYQyC4EhVtnFOdc3HDPvXm0kUfoTXwoe/cMypINBy6HIlqIyr/Sg3SS7PPwoQaHVkQgtUYyoshDA+FhbJJSmhpnBIrhPBTgIfqrHtES6P10RC3i5C3MvKFpMsq2B9kJ8lgZpjUvUOJDFatNhfyZM+5SR7ELDb9JgdSDWRvweQDBdmFpgbVpMUsl87rnYvt21I128svjHXkTeulKYCqMI38F98u4XtIRiDgAb0sCxqqCpMkjpyeILIj78JN6BSYoTvZ+9wNzqT/tmJ3LVamz4Mp/RnRnKPYqjLxWKRy5yUHLY6rViV4YmpSZDrxxusiy6+cpHZtUr4AUkIZe3OYg4rOOk/WUJqrizzb9rBSMyPDOJ8qVN9wRJxbiWDLiS1fttuxrJKlJ/9jQ2nY9Yy37onf/TIhYlS3qL9fSI7VIZX85YxXExUBfgLmmOVdxW2JqNru9sEIObDf4x16vebrytvPuDbrwBBeuR+3fz6kzqFRnvrJjjKBjqwIAKksJKIia38wPU7H0MlTtqm2ctFlDREti8uTcvOpzbk6s3bKzc////v0B8YTAWdvwf/mNv7wA/v9veikgVZkyDwO38qAjND7pgYyDs+Pg3c7qcthcomIvny2McPmqlPk90wmCAgu8N83llBWDqRUlaMF2ULmHV+R4QGSRlTyiDPS0Az++5N6vci9NXyVFV45bUIcSdID2JjTj18uBqPJeL76/BWr0v7EB8xHbiYCU6G9VoxCinMxQpiC/B7NhpSi0U1UWuHO1ARPZJHsvibhYepphmeAVpxu2ZWhaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFlBWDMwM0NxejhmZFA4Rno1bVJnSjBVcVRxc254M1ZMd0NaTzBWdW1tdXA5?=
 =?utf-8?B?bklzbkxqaUlMbzBvaGdXUEQ2OXRYVmt4TFgydVlYdXlkekRxbmkrYW1ya0JV?=
 =?utf-8?B?dkxzZWNsVDJGOXdPNmV5dERrWjJPKzZFUzhVWjdOaXJoblRCVUZEMXdMTWtP?=
 =?utf-8?B?SGRha20zV1FMU3Q1a3NIZU1KcTdsNGF1ZnYrRTV3bU1wOEFROGVOUFVENnVp?=
 =?utf-8?B?NWpCTndjSDhJd0NTUThVUG9PaGRqTGZMMXpBcUJHOHc1OU80bndGdi9jc3lt?=
 =?utf-8?B?R0ltdW9DdFFUZTlWczc3cHBvMVZqRCttSlFVclVCbk9EVTBLYXNXSXFXVmVr?=
 =?utf-8?B?cVNEWUV3UTUrWTMrNWx3c1VVb1FHKzcwOUphV1BKdDUxL3lBSW9TMHQvT2xG?=
 =?utf-8?B?aGlnSG41TCtRR1htbUhUbUtFZ1diL3NyRG4rWk9UMWQ5OVdSUlhlUFNEOG9k?=
 =?utf-8?B?OXpWK1pVNHZCU1VNWlF4eVJMYklFZ2xjSzV2QWVzY2JsTmtKSkg5ZFZGUlVo?=
 =?utf-8?B?eW43eGNyQ3l3VlBnUnlqZmpXekRVcFFDSUs5angzVnpybm9PN3lvQm82RlZx?=
 =?utf-8?B?RDV2UGUvUER6bDJYTm1tNjhPak0rRnIyUHkrMzl4UUpYQXNUQWxlUUZmNlhG?=
 =?utf-8?B?ZHJ4L0dJU3YyUGhQMVhZSnZtSlFib25jTEQxUVFpRXd6ZXh5dk1SMmFIdzlp?=
 =?utf-8?B?K3NyQXVWSnZVc2h3bGlPS2ZDc0hMdnFKNTBiZFFJeWV2MWJQWTNmUzZsQW95?=
 =?utf-8?B?Wmpnd0hmL0ZxZFc1TjJKS2d0MENjMGFUOXZJUWlsRE1TR21XQzJhVXhqN1Yv?=
 =?utf-8?B?TU53Y25CTi9lZjhPSnVXcHBuNFpNVDg4dURiQ082VnRKMUU0Sk1oc253SzB6?=
 =?utf-8?B?OC9wLzhVZ3pwb1h6eGE2dElCR1c4VHFJMjdCS2gzWGxLdU1OaEVOdElLNjYz?=
 =?utf-8?B?UVdQWm1tZWVseTRhTklXMkkwWU02Z0QzQm8wZ3g4bGtES3RlOFNwU09lQkxn?=
 =?utf-8?B?R0JWSWovQTdJbzJjL1BKUmNHVFR0amRmcWV3V09nUXByaHdRVisyWVlDNWE5?=
 =?utf-8?B?SWp2cys4d1RXdEN1MjZGUXRlUW9tbUIzL1NSYlUrNlVQTTdYMjJpQjNjcHJX?=
 =?utf-8?B?YkZwUXJiTk1oVFF4WlB3QUZyRzI3VW1ibVNCUUFpQ0ZMbXEwN1pOdkxHUmlu?=
 =?utf-8?B?ZDVDa0xqWHkxWDFGOVlqOWpxMWxEenZQK3hINjlEWit4R3VsWGZ3eWtOb3ZR?=
 =?utf-8?B?dzNVTWdnYjR6ZDRzaG1uM09ueEg2enZwSS9vbC9SL3hNT1JlZi9HMGVNdTl6?=
 =?utf-8?B?czVKeVJiQXk0YTAramlGVWtNR2RXREtKU0RXOEE5YkpKQVpoZ2w3alZuMWVr?=
 =?utf-8?B?SldRMzF6QlBUQzE2bVVjUVhGNXlGV0dzL0pWVER6Wm9CWTNkZDA5S0FOK3M0?=
 =?utf-8?B?VW9saHh1WVU5TnZXS3dMY2gzOU9RdVhDOG8vZzBGWUxEWWdmYS9STHg3SEhm?=
 =?utf-8?B?QklSY3lFZHUrdTF6bjkxQ0tISTlicGFPd2ZESFROM1liaUhOT3RPRE5YVXZK?=
 =?utf-8?B?SUZ4VlBwaVRoWVEyNmFVd2hCbVhoOTcxUWF1cWdDQ2Rna2lJZ0RqOTI0WFls?=
 =?utf-8?B?TW9BSkNhRDg1T3huRXp6UWJTTFhIZEl1c1B2RnI1dnJ5MGdSam5WZnBIYksw?=
 =?utf-8?B?R3hMUjVvZVNidG1JV1dmdmdobWh4elV6NEhvVldHY0k3NVFFMnQ3QW5sTU1y?=
 =?utf-8?B?bEF2TjFmR3ErOHRjK0FwZGppWWhNckNOMzFjR3dIYTFqSmpaVTU0K1NQTEM2?=
 =?utf-8?B?aE53Rndrc1NWa3JEUFpaUDVHMEV1S1VXN1FUMnZVenB5aXJFZk1BdHJtcEtj?=
 =?utf-8?B?V0dyaDlteFhBeEpRWHFTTVplM0pMV0V3TzlzZGd5WTRQWm16c1BMbWpzcVJh?=
 =?utf-8?B?U3pqaThPeDMySStOY2pqYXhYZ1QzcGdjMmtOWWdxRzRReTU0MlRCZngyb2xQ?=
 =?utf-8?B?K003UlBQOUJkVlA5Y3lvbkJpMi9jQkI3azZaUjRNK2dxVERjeHZmREtNRk9h?=
 =?utf-8?B?R0NuRC8rN1p0c1NGTDZCWWcrZU1zMVZNTGpQNEdOMUFUaGhMYXJjc2JpSTNw?=
 =?utf-8?B?TXo2YktzNDVGWmRJVFdkSnlSdU5CNGIrbjFJZ0RZcTZxNXN0WFdkMUxiQzd4?=
 =?utf-8?B?V1pZVWdtM1N4dmdXVGNpYnduYWhyMHlJNzZYRWhDSm81KzAyUWFPNWhXVnNJ?=
 =?utf-8?B?MW5iQ1VvazBNdWZ3NnV6MHh0Z0hya1kzSVRoUHNWbzdCU0c2anNGVS92a3hK?=
 =?utf-8?Q?aztlQWPpTN7eOIlkwR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57040b2c-3c8b-49e0-44b0-08de8ac2e6ce
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:43.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUPt0bhIQ4nae/+CnqauNcJF5BvYoC+RY+sZ7zUiGiXACQU8a7iCUfZb7vemCKIGdoFrnLAgdSOyMiYGV39Gjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34179-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 2E91932D43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an optional .release_mux() callback to struct pinmux_ops.

Some drivers acquire additional resources in .set_mux(), such as software
locks. These resources may need to be released when the mux function is no
longer active. Introducing a dedicated .release_mux() callback allows
drivers to clean up such resources.

The callback is optional and does not affect existing drivers.

Commit 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") removed the .disable() callback
to resolve two issues:

  1. desc->mux_usecount increasing monotonically
  2. Hardware glitches caused by repeated .disable()/.enable() calls

Adding .release_mux() does not reintroduce those problems. The callback is
intended only for releasing driver-side resources (e.g. locks) and must not
modify hardware registers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- none

change in v3
- Add judgement about 2243a87d90b42 ("pinctrl: avoid duplicated calling
enable_pinmux_setting for a pin") in commit message.
---
 drivers/pinctrl/pinmux.c       | 5 +++++
 include/linux/pinctrl/pinmux.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 3a8dd184ba3d670e01a890427e19af59b65eb813..c705bc182266c596c4e6c820f5e3ffcadbbb2838 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -517,6 +517,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 	int ret = 0;
 	const unsigned int *pins = NULL;
 	unsigned int num_pins = 0;
@@ -563,6 +564,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i], desc->name, gname);
 		}
 	}
+
+	if (ops->release_mux)
+		ops->release_mux(pctldev, setting->data.mux.func,
+				 setting->data.mux.group);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 094bbe2fd6fd5ea3c5fdf5b6d6d9a7639700b50b..77664937eeb273eef440988c4cf833dbc6f10758 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -51,6 +51,8 @@ struct pinctrl_gpio_range;
  *	are handled by the pinmux subsystem. The @func_selector selects a
  *	certain function whereas @group_selector selects a certain set of pins
  *	to be used. On simple controllers the latter argument may be ignored
+ * @release_mux: Release software resources acquired by @set_mux. This callback
+ *	must not change hardware state to avoid glitches when switching mux.
  * @gpio_request_enable: requests and enables GPIO on a certain pin.
  *	Implement this only if you can mux every pin individually as GPIO. The
  *	affected GPIO range is passed along with an offset(pin number) into that
@@ -80,6 +82,9 @@ struct pinmux_ops {
 				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
+	void (*release_mux) (struct pinctrl_dev *pctldev,
+			     unsigned int func_selector,
+			     unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
 				    struct pinctrl_gpio_range *range,
 				    unsigned int offset);

-- 
2.43.0


