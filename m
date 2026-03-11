Return-Path: <linux-gpio+bounces-33171-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VfBuFMC9sWkwFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33171-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6E2690C3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39654306A929
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D472134753B;
	Wed, 11 Mar 2026 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L4GagXF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B53101C0;
	Wed, 11 Mar 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256112; cv=fail; b=Iiw7bJ1ux9oX9b8UwBcRwx0vpaFieOM3R5b9mWnJd/KMS03+/ied5JAMiBNg/KDQcp3dg7l8yTDbFa5AIh5uN5bipgbqHRuYA6jo/FhzK4TZp57BElkJAeiefm5PRbKvBXMdF8iCZ+6ifh7GsVWa/t7wcNRcAfSSyntNeDbmIWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256112; c=relaxed/simple;
	bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cuB+sNvtLceyaiIUzFQdzPJlVXwGfxCDva7Wcm5NLT7ahp1S0jV0rmMdyP91GKnO3N9vVkuOb32PZj/rrRnv/a0zrmiS2xriSBwzIdgC043TiCt6p/oh7K1cbERJBuW91x7EJoyDVqJVTi9AMgkAjk0sNKXFbnETP3ptT4ucZ78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L4GagXF2; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StHuEL6BTAJkjUIBXas8lzl7FSQvCK/vLBf4wJjm9usKv52ERafoVJqv9iuf+vCqrRDh3EX5GnWR6Ecap27/Qg2W/gU8jmd5Bx0wx1pChGpKWy2Yo7V3+hwD67wGJ3WnKV+wfrlxJhirZBXQ1Pau6iShNclMJoh1CDNN92J2ot1wcdSJayCgJY+i6EVDX/Qg07A30jXYemx19u5a9T+b8aYIqjVCwG0QdkIWbmcPl4SvLW3dRRk7zs6ByMHjoMTikMGnEypH2l4Kzd2vRwC6nvneYUBZGMN4aWyhcKGGGXq/m9TWrxB5iRRcguSL7c4z6u0ZUK/+wUbypaEGN5spDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=FxhVNa+3GCIEaVUWzG3zNzbQusCa5KEFgtXAzOGFLNt5RnZU6TkMz1nVYWpaCu5yqhXaUtdvPWl4+vyY1DptX/CfgoY83bAxKSPqsimxCHczS5kSYdu5UsLXzmpiblwp0rd9vXCd9Nj0qZ/PEfPG4UpETgVhOe6eVqCG+Y3A7HZaY3p99bY4qpp/AnQcdQOULcBRWA/CjUsE1skmvJ5vVvFdVSkKXfKT5d+vdeUwzno2Er/L5aNnk/jvjF1jWMQzy789k4S4lQ2viokv7bUp+1yy9R2MJrd6+km/8yfzJKg35a3E4jhMKN7mG8zlk9/EVk2CrWUYR5thLm3tds8xeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+scYNF5xd6xXB+7r0j5hCGjS868yaJZfaEBtEEMZbKg=;
 b=L4GagXF2QTBvapVNqKHZOD3EJybYlJZzca5FhaXf8Ff9Hy2SsQwiMwMx5e2PIWTPT7hynksZbu5ESKJ9q0jDxXrR8Ovsr4ePqNz6FhUmHXKiN+9enzGabdByFhulwx5LvoNCyZ9Fh5U1qc8KdYFhi2IhGTmQ5A2PKyB9e8EwzoHYcd0oa5Au8+I7BnQafpljwhRIoj9x3OBU87EsHtln8gJbtK5znapOwQlFa3qxFTCkqpE+dE5LckoVQSUvBj9LaC1183ica7gLzst09vx10DLtYKFF2SmR95KH2GNrUvkvdfBGNTNY1zWqbqdPdoQlu8v/3jPAY89haeHHN2/Yqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:08:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:08:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Mar 2026 15:08:10 -0400
Subject: [PATCH v3 1/7] mux: add devm_mux_control_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-pinctrl-mux-v3-1-236b1c17bf9b@nxp.com>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773256100; l=6437;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=R+sFjmiU24arthVzr8KSPc7GoQZUvHpvfgrliX83zYY=;
 b=a5wgw1LbIuW2Ja/DcDMqasHCmWaLn6x1/7t73smSA14/L4ST7VZqzhz9a0F228WfwLPuf5tbt
 X7sfd+x3R+iDus7PVojGtBqQFe0xnizTINw4cD/NTLBijItzezlQkeo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: e54e4c3c-3539-48e3-a793-08de7fa19309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6NT9qbskdkimanjzgKdYwfXiY6NGrm+k/aaSBoPMU5YUCJaUKLn14GPXsXMyOl8bwBJ3VvdKwOEVXTbI2Vg851T3B/s5M5dKNlXZaTu+FN/ncM1OaHjGioGBQz9VF1AAyvFpke32c0ALkUgY7XKmA2s4oPDsNzT4dqAqqRn2FCuU+jFz9vF9zBGpUGDJo1yi9xI0Wz4uERtpB7d8OAmR7UxY/zrP4rmel9n9mbmh0oEaWDKjF4noGZMPqlyFPFmve8Id/+y/4ObFM3K0AdtQTwpEwppAkIPGnthu69Hx8ki8c3Tb499RryM9iHXpQ5dBiYwM9NyHbUmAw7aVgJPUJre7q28+hwBPTL1CV8pFpvwvKDUlijbTioBAgywFbY9i/sctrdaUHOdGHlg1MeCcgvpN/MPGOx2pNI8/yA7py/5XphCu+yAwHxShS324JygcaXd4EiYpjqXwIxGOH3NSyHP4lcB7xNuN4Qymma1dHrHwryCVKAK0qyXo82+kMfChWfjwx+cU9Wgi0G1aa6nMI5bRYd1fD/RQR57pYowBU/21P7LVfeSw4NsUhCd9T/wzuzg6cuLwtQ3tBIoF8ZpgzuMu/z59x2wtBdPr9tjKJeKnwu9XrdTx11wnmu254xyBsrX9KhuhLS6KY0svDBqf8nrcMkvMTVIiJYKZJvyJPULUIYNjFF6za5uzLpV4JLMaAFCyUCH0YBrF5nX/6julKgS9GOHX2unk5JuF2FJnpLDkH/cowhdW8E1MmJCivp8EW/dk8B5KeOCkX/i5WCH5hK3+Y7JHRHyukSPCp4jb0ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhlNjFqUlA2MXFwZHp1Y29PM3Q2OFNvdDV5bXNibU9KcDFBQUxiNmxpR2M2?=
 =?utf-8?B?cVdMUXZNakRKK2U3eUJ6d3NJb1BZKzlkeHB4WUVwMW4weUxudHNoWXkybU1a?=
 =?utf-8?B?eVp2akh3czh5R3NTQWdSaGk2SFc2aUkrcGUzdkIzK1BDS3l1VHhkbUFYM1cx?=
 =?utf-8?B?Z0lTOHBURXpPcUpVdzR3MUlYdExKQ0JQcmRNOEcySDFGdVFZMFRod2Q0cjJm?=
 =?utf-8?B?ZUN3elNVREdsL1FvUklYc3dKS2pLbTY5Lzc5ZDlGVHB5THEzMHoyQzByaTU3?=
 =?utf-8?B?YTY3NDZHMCs2SU5MeDAwRDJoWktmd3BXYUwwQURIZWFvRTRrVjdSWlQ4ZjRT?=
 =?utf-8?B?VUpvTGs4aVl4eEdTSis3NlhGU05VcVkyRmc1aWVGY1VYZ2NNSktnVWQ4NEFM?=
 =?utf-8?B?UjMyMXhDa29rc1R5YzNieDhyczIyUHVlaG1PZVFNQVB2cFBsNFJ0QkFNelNY?=
 =?utf-8?B?MHVrWEJkRHZYaXFCZTNBUXRxMFgrbXAycktia2lhUVVDekl6QlB2NlpvR3E4?=
 =?utf-8?B?RHJ4WndqMUlxeWZtOHhIeG5lZWt2K3llNEljTnJiTTVQanNBZ2phcmErd1BL?=
 =?utf-8?B?N0tBSjZSNEFJdFF0UFZJeGNSZ3F3MzRqQjd0bWtpSVp6ZUYvbkg0d2EzRnIy?=
 =?utf-8?B?bG44NnBWeWFJbVV4a0d4N3ZNa3I1U3FWeXd4SVNWRzZ5YW5IcnkzeG5RS3h2?=
 =?utf-8?B?QTJYTytVelRCUldXUDIxSEtiZEdaZHFWcWpGQVhqQlVBMlEwZ25xRWlCTXg3?=
 =?utf-8?B?LzZXVENYeGt4VnVLK3JYMmJ5RHVpQlNrV25YSXU5d3JxY3psUlY0V3FOTndG?=
 =?utf-8?B?S2lpNVpjaGxtYlZLdWJpNCs2eHl1WVF5cEZQV21YeEQ3ZTk0ZUNOSUE1SkQx?=
 =?utf-8?B?NXE2OVV1dm9PVHU5QUdzdWpWdnlQRkU2VzlkSkQxcW9LZTY3RXJ4SWozSDU4?=
 =?utf-8?B?MFhvNCt4RjdBU1JCbFBRRWJydzdyVU9FSFVKWUUrd1dNZk8vem5qYUJkbFlD?=
 =?utf-8?B?Y2RCRGhvWUlrbk9MSlFQVkdmcVdmR1YxOTFnL24vWmdIdnphNzdWc29HQ0tK?=
 =?utf-8?B?bTB2Tmlxc0pGWXE4K2w4TXo4QWt0cVJQeWl0andXZDZmZzBET1RsS0hUSnBh?=
 =?utf-8?B?YWZvV0k5N2dnUmp2M2xxK1A0ZVRySWUrUHE1Z25tNmEwcXBRbi9oUzJWeEoy?=
 =?utf-8?B?QUNacW4yTEpUSVhYNm5rNzVib2JpbEsrTTFrYXhIZFlsbDUzOTdQSTBpbEpW?=
 =?utf-8?B?SmQwL3hlRWRPQU5lWVBVK0lKeFdRZ3hOdUFHWUlEcHM3Njl4bVNpWWRpM2Vu?=
 =?utf-8?B?ZmpqWCtZVlRmK0l1Y3BoL1RJVFhGS3lnR2Z1MVE0czEzb094cSsvWFJKK1Yy?=
 =?utf-8?B?MkJTRGpOTVBNUGR4cGtzWDVuR1RpNXFHZTdGUnlzZ2M4ZVNLczY4MkJZUDBX?=
 =?utf-8?B?ZCtRM1lrSUNxcklVTFBMZVlYNkFVbEcyczZUVDZzdTl6OGJ4bFJXbUpoMmNa?=
 =?utf-8?B?NXpsK0FGRE1tcmdUelRRaThPZ0Qyd01JcjczMlY2eWVoKzAwdG5lV2hJV0Jk?=
 =?utf-8?B?ZTZhZnRVbGJSVThrVkE3Mmo2ZWRnakt0dXhLV0tvcGt5V2Yxa2Zxa2JRajh5?=
 =?utf-8?B?Zk9Kc1EvZkwralgrQi9Sd29Yd0duK2ZHMmV6MklrdWk2RlhqRzJjclZVVW80?=
 =?utf-8?B?cU0xZGtLSHM5akloeXo0dFRuK3I0TDZqMStVUEZVdFF5TWdqTXc1UVRMUExB?=
 =?utf-8?B?Q1Z0b1JBdHRyclZWbmlOU1Fma1hnM3RVMzJtdFJyRS9YaXlETU9ocGV3THFi?=
 =?utf-8?B?V2xlcm5Mak56blQvVVppektqSEY0dDN1QXJDRDMydnRCQ0FLdGZVT21JbU5E?=
 =?utf-8?B?Z0ZtMUwrU3dWVGhORzlmWldzalNueTN1L2J5YnhwNDUrcDBCYkdTRXJNL3Ev?=
 =?utf-8?B?MTZTOW5NMTNMSlRFb0YyZzcrTzNBNTRhMzQ4MU9JaktxRE5nbEo3MXNDbFkv?=
 =?utf-8?B?S3FGdEozcGIzL0VVWUduTzlnN3hiSXV1YWJiZlE2d2lNNWR2dGxCVXhtSW9T?=
 =?utf-8?B?bzdJcEZoTW1KbTNETWZxSEoxeWtRRTkvbWdIS2ZBcXpjUjBGVG5PYkcvRkx0?=
 =?utf-8?B?Wld5b3VXTUI5d3JZVjdTZW1JTGdwL3hLcHhyZXFEWVFyem9KYkp3Nms4M05G?=
 =?utf-8?B?YmFRV1dmWk4vcHdGSm8zRGZCVjNwanRGQ2wyZ0RIZWJGSlVjLzdQOUNtV00x?=
 =?utf-8?B?TWVkTS9hWXU2TXExcUQ5V21zWVlkRkZLMmhGbERIa0Mva1dBVVAwYjJoNHpL?=
 =?utf-8?B?b05TM3JwSldQVHlpUUN1Mjc1UHpNVTlVZUErcjNrTTVSdVA3NXVHZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54e4c3c-3539-48e3-a793-08de7fa19309
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:08:26.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6nHklTVyz0WIGFvM50lYxhwI6i6AA2SD0w9lDNZDSCiXsb4aU6G4Af0E6FvZt9IYIqQ+37ZmEUehUS/wyWYow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33171-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: E3E6E2690C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new API devm_mux_control_get_from_np() to retrieve a mux control from
a specified child device node.

Make devm_mux_control_get() call devm_mux_control_get_from_np() with a NULL
node parameter, which defaults to using the device's own of_node.

Support the following DT schema:

pinctrl@0 {
    uart-func {
            mux-state = <&mux_chip 0>;
    };

    spi-func {
            mux-state = <&mux_chip 1>;
    };
};

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mux/core.c           | 40 ++++++++++++++++++++++++----------------
 include/linux/mux/consumer.h | 16 ++++++++++++----
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995fe0125432d34edd8ab0f2cd1a6e9a..bdd959389b4ee1b0b8a7367fadf2c148c8f2f0b1 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -522,13 +522,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @mux_name: The name identifying the mux-control.
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
+ * @node: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state)
+				   unsigned int *state,
+				   struct device_node *node)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = node ? node : dev->of_node;
 	struct of_phandle_args args;
 	struct mux_chip *mux_chip;
 	unsigned int controller;
@@ -617,7 +619,7 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL);
+	return mux_get(dev, mux_name, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
@@ -641,15 +643,17 @@ static void devm_mux_control_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_control_get() - Get the mux-control for a device, with resource
- *			    management.
+ * devm_mux_control_get_from_np() - Get the mux-control for a device, with
+ *				    resource management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name)
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np)
 {
 	struct mux_control **ptr, *mux;
 
@@ -668,16 +672,18 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 
 	return mux;
 }
-EXPORT_SYMBOL_GPL(devm_mux_control_get);
+EXPORT_SYMBOL_GPL(devm_mux_control_get_from_np);
 
 /*
  * mux_state_get() - Get the mux-state for a device.
  * @dev: The device that needs a mux-state.
  * @mux_name: The name identifying the mux-state.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
+static struct mux_state *
+mux_state_get(struct device *dev, const char *mux_name, struct device_node *np)
 {
 	struct mux_state *mstate;
 
@@ -685,7 +691,7 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state);
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, np);
 	if (IS_ERR(mstate->mux)) {
 		int err = PTR_ERR(mstate->mux);
 
@@ -716,15 +722,17 @@ static void devm_mux_state_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
+ * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
+ *				  management.
  * @dev: The device that needs a mux-control.
  * @mux_name: The name identifying the mux-control.
+ * @np: the device nodes, use dev->of_node if it is NULL.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name)
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np)
 {
 	struct mux_state **ptr, *mstate;
 
@@ -732,7 +740,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mstate = mux_state_get(dev, mux_name);
+	mstate = mux_state_get(dev, mux_name, np);
 	if (IS_ERR(mstate)) {
 		devres_free(ptr);
 		return mstate;
@@ -743,7 +751,7 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 
 	return mstate;
 }
-EXPORT_SYMBOL_GPL(devm_mux_state_get);
+EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
 
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f8312532040441ee618424b76378aad7..6300e091035323dd6158d52a55a109d43ef120aa 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -56,9 +56,17 @@ int mux_state_deselect(struct mux_state *mstate);
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name);
+struct mux_control *
+devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
+			     struct device_node *np);
+
+#define devm_mux_control_get(dev, mux_name)		\
+	devm_mux_control_get_from_np(dev, mux_name, NULL)
+
+struct mux_state *
+devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
+			   struct device_node *np);
+#define devm_mux_state_get(dev, mux_name)		\
+	devm_mux_state_get_from_np(dev, mux_name, NULL)
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.43.0


