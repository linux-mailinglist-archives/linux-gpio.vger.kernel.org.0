Return-Path: <linux-gpio+bounces-34176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNymOs1qxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:07:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4B32D3FF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81156309BE99
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FB9391E54;
	Wed, 25 Mar 2026 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KAebUBXW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA638F635;
	Wed, 25 Mar 2026 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479876; cv=fail; b=IJzMzUNWOx7tsHPueM5apfZ3IXsmNRBzpUDyf5tpOze/u35itI+Kb2KyNM1Hx+weScClWXV9Vn8tAx6Rd/+7Nap4jMoTuuB6Mk5z70HHbPjO0F4GxU5n7k6TN61f/ecMDEHd7gaqOs7x8vPGKhH4QqYvJhWQOQDcdbnUITo6M3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479876; c=relaxed/simple;
	bh=6lZaJD3A/F1rIGObW9t+4MUqh2HqQaormMVYGkjpB44=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ljxRHrfB46u9mX9Vuj7RtnPjDeoyq76OVNc2C9mIt2VUAvA0+4sDGDypH9WkGwi+oHNzZtOUpmlf+1limDc+8Kk1YRg7AzRGDR9t4TiiOUYGeRmL21a+bDLB8w+7gUZl/9ayWiMwqenVw6B37coyB42wqMxMwZmyG1DNrIBlCU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KAebUBXW; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QE0tPlY/b66STBVDbH7lHiUxePD/3Tzl6RrMOF3WbmjPsbQLjrpjbltyX0qZaRgNaPjMVSeaVSLqdgGRjSzWNrEyG5Dvc/2xrB1BcdcNRGUQOfydveQAL0+knI3BdBkKt/4Xq1Xi8n+EWx9Mx1fnMavD7Y1iJ415BhnfgfopwWMJ29qOLeNeDtUpbJvep9jE5uCl57aiXG5vK2H+hFCjcULWd2B549a87bAQYUWYmKDAB7mX10gbr7K91bgUo5z1G/9wm08I5/mbKlJmq600QaH9IkJ9MJ4umMiEWTPneI7ZMrUZfmCmqj9oeX5HL8GPfua4uhhoGNZmd4Cu7FPikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQlN2xveg+I0NatlzXlXz5x8nuvILqmuLkLNQrT9Y5E=;
 b=g6U8xdYMvdG+kD1RKRxRv3kXwP86sMxyyjpjOihSRuIADZYtj/RXxJefrkJGNIeIQUZ9AMkReL+TPq+EeEgaBK+WBGnYfIWEyvjDIhQ0LvtKg4kd1wA8Lk6htfvZpum+mMVwr4o+7YQQdNaJpyK1vHuxH+zcAOo1yACtp/G1pNJzCwl9z6I8cgHAWW1BrtTi2PSuR0baWY3ELAEQwoGpNKGnRbx5jflywP8GBD7XQP4IGErz+6gqhR2X4Ckldnd7/D74JGKzzbMgcscKfWxtuc9/YExoG7j4OAxdZTIfAU3T4X2XcZgmptxx8IuHBGX6AH6liTEx9+1UKl0zd6MO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQlN2xveg+I0NatlzXlXz5x8nuvILqmuLkLNQrT9Y5E=;
 b=KAebUBXW1PyS1+izfTKeL74+hk5mV19IyWAPsV7fGCKN8QJiZPj2wj5aErtuJ0PGyMp4ZZBQ06AT3g88s2NPiaEOSmtO83fHx430CVamn25fpvifMst342rBxMgeK7kv3uISyxiDvdQULVOIrFAIAc0MthvImrgGuBuvJJ9zEdHKwjlfFZ4FYL00V6pnAOVFsvoPn/iL0RFMKByqGlicisuQ/QTas2rlcq99EFCyGJbY9LuQEFAs8bUS+/CNOa+wx2EnxV2eXOK5Qdjf2Hzi4aSABas4F7/9WAobyl7t4nqBg3YZra8BDmVDgQ+27iutrOofKTTZLhR/QApzxWEkfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:32 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:10 -0400
Subject: [PATCH v4 1/7] mux: add devm_mux_control_get_from_np() to get mux
 from child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-1-043c2c82e623@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=6472;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6lZaJD3A/F1rIGObW9t+4MUqh2HqQaormMVYGkjpB44=;
 b=UBwCBPDWkndu2tYnjhVObUsVHIenFN/OKIa0n+I0qQoML1V4/VX8S6rQ42TGGHC77t5wQvhVS
 20q028gBT3pA35SHcllpK391y0ctbIN6ONiolUWqwlR7aijlQ5w5S4B
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
X-MS-Office365-Filtering-Correlation-Id: cca445d5-ab94-4413-b770-08de8ac2dfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	WDLZoV7gAyBXLTgP1wR4rizxN+O/iLpYl18ZtBRRpgtvy4hU5V4CWg0FBRXGDsyW/BuLamwJGzYbfIycGWVAUiXQakKcVmv9sdjnty/YmUXKUpyWZI7Wq36n3b/rtjuE/mmg0aycXLzJIN9xMuZDsQn+gu7rPsJBZNYXRScw1aM4CsKAC705HIdUDuWpdlkmaf3sYs1lzx36hJM44OQjjoGiMVTAKg6mcE4xXTRNj55XbrhzGWRBXuVGWTQ9fYJLGuNdTVp6XC4GljT1yyuY0p/aoptXGkxM3w4q4NWqJiDRZT035Ttt64yJwl1rcumvBI1lEwxSGnLEfEoIBLdlBzexYLeIDmS19YDE4FdXVKMzlCOp+6cnLBrPICXDdNBZZYxywaeomesrYu5t7HynnZlmUX1yiXCBEBdWd2XzTrt+iyJeCBJx57BauwZu2nTpT3Rd3lN19s6fHAfvXDysV17398bYiqrKSpWY/gsfKud73sGGxR6mTFc0UFgD/A11YbQHig0Uscf4AdcNFDV1Gf4R8zuLv9PL+SClpnSSxWbtRAeaL2cMgFqx8vSBmwbq5r/3rSsioYNSZiXbt7Gzu2tIr+nPbXemUM/sZhYoLar60ck+kp+PEZBgRZYrPCnL4TTmWQ5uX31bORPzxoyYGD6JlP6JFlGZEnU++i6YPMRFcjE5AwEHS7MSO1XxveDVqn9SThCOP/BMMA7/P74CYOwWA07lQFtnw0KzhORCoUkpqmMqKv2qXQ4tthDNW4ZvfkltnX/79Nexw2MNYHHvKiF3niFxak92sYJg7gk9pNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVoSlFHZXh5dmtLckZPWHBnTjlDWlhUdmxOOXB0ZVZ4QVh6L3h5dmFpTS9J?=
 =?utf-8?B?eVFwYUs1TFUvSjZobW11ZnYvSlF1NmN6SmQwTXdyclRXN3d1VFFSdlNNM2tI?=
 =?utf-8?B?SmEyZWZ4dTlST0xDdkFhK05IeFF5K0xubEpaWjFEUGttUlUyS3ZrdVB4cyt5?=
 =?utf-8?B?eGVuTlVZSU5BaTVabFppZ1FxcGtzcHordmNzMk5vTzRRZ2RUUmU1RlpZRWpu?=
 =?utf-8?B?blp0OGdnR3BqN3BEb2hUWnNVcjkyNGowWUw5QjRZNmV6Q3orK1hZQnZ4YUg3?=
 =?utf-8?B?aFJTZkdkTlZFNVdkQ01MVHlQMFVjK0w2eUhHZG1BR3lRSDRvTTl0R3lVVjhM?=
 =?utf-8?B?RCtWWGloM1lYTUt1ZEd2NlgzRnkxblNJYU9kQkxkREpHUzRPMHB0TFI5bS90?=
 =?utf-8?B?cTkzeVhjQ2tzOHduZDlYZ3krRVYxZ2hLN1N4eVFkWGhNRVg1VWVack9NN3B1?=
 =?utf-8?B?Tmh6RWhweGltMkJhVmpCSkhPT1dHdnlFOXBYU0tBUXovMXdDYmdLejdKa2FB?=
 =?utf-8?B?bFcwMXpzVlBtcGp1UUhaTlhLZUpJdEczS1BxSkc3ZHYxUCtxbitURUNlaWEr?=
 =?utf-8?B?Z2t5bFY1Uk9nNkhiK3BBRzlQb0ZhNVA3VzJQUEhNeXQyY0lGdWZvdUp4VlJp?=
 =?utf-8?B?Zi8rZ3c3MkF6YUc3cUZwYkRaV1RxSSt0cnRZbE1FaHoxZnl5SEM2Z0ZFWkNw?=
 =?utf-8?B?NDFkSDRaQVhEeis1ZmRlcEJDRHpwLytDKzJlY2RQK013MmgxUGZUM29zZzg1?=
 =?utf-8?B?a29QUUZzdUIweXpyVlU2bU5jdndJUmM1WWlqU3ZuTk92aUdlT1BvUFNwZnpK?=
 =?utf-8?B?WHpVa3RQdWNoSE5XdU5jY2ZVRGFtTE9DVHF2QVZ1UGN4ejlnZjdZdW8yTHNY?=
 =?utf-8?B?ZVE5MUNJVXpOa3BrYis2WllGNmJsMi9vZmxEQkFScWZGRzIwK0VVWStqNHdw?=
 =?utf-8?B?WU9Ldk5CRTBMUzJDSjRKSGMydlFuQVRqM01ZL2R1T1VjQUU4OEJIMFdTZkMr?=
 =?utf-8?B?cmtCdDJBdjhmVkRCdkxRYkpyYm54YzZldWt1eHVVYWhvQkJYb0xCbnBhN3Jr?=
 =?utf-8?B?dkFjc2doQUtIQ3FkeEI4cGxFZHc1WDdaNU1IaHhMUmQzaXJXam9aZWxnNm5O?=
 =?utf-8?B?MmdSTTRocWJhampTNEdIVmhJcEFwWjVrUEQwU1VId0dGM1RRWC9FZ1lDUkVT?=
 =?utf-8?B?aWdBSGliT2R2N1JrWWVGREF6Zm1nMGplVlJYMWduVGZzcEJLWFdCeStyVlYv?=
 =?utf-8?B?NCtybGdybUErT3ZORlNTVTJGQ05DYXRod2xrMXByN3NhYm90Nnl6UUNDd3NQ?=
 =?utf-8?B?SW1jeFJRWk9MNFFTSG11VVZhWW5qdzlsNGo2WFVVYkdySW44Q2JLK0dNTFc5?=
 =?utf-8?B?UmEzK3VxNUV0MEtLYWZaNmJRSTh3aE04VE9qT0tKWElqQnBiUy9iZ1RGNVpr?=
 =?utf-8?B?L0Rab2FGaWZZMmdNTmFQcFJvM0N6OFk3TzZPRys3b3VHc1ZRdDBaWjUwbGFm?=
 =?utf-8?B?SWlZall5ZGZiajM3dTJ3cTB3a3BTNVZMSzl3cVBoOHBNc0hpdmJieWxXUmIr?=
 =?utf-8?B?RHgxUVBsZGt0ZU1zNDdHdlZRYk5vMkVyUHdPWWtEWkJiYVpMZVorUkNNd0lN?=
 =?utf-8?B?VjB5clUzeVZxZ0pyM2lzNXo3d3ZmQXI4dE9JZ1ZGcHoxRm5qMlBsaDlsbFhK?=
 =?utf-8?B?QlNSdlAzQ2xSS1YwTFRyYlJzQUFlaEU3eHQvd1A3dE0rRVZRSzVjT0NyZldK?=
 =?utf-8?B?OWJ0RkpDWkJoQTBkT3pNa3ZNYUVkb3hWck5xOXBQb2VNclVFa25HQWhqTmtN?=
 =?utf-8?B?cGxlZjR2ZDhTZG16WG41WFYyMWxNaGhBcStrSVI5UXFJKzdIUVYvcmRGVUhB?=
 =?utf-8?B?K2J5Z3ozRDVJM2xLUEZQKzRvR2JSYXZ3MzIzV2pLODZPdWlORHVHSDV0UHdX?=
 =?utf-8?B?cjRCMElrSFdjNEFUcFI0NzA4QVk4ZjVZaEVLQmhmQnI3SU83bzlucjZmV29y?=
 =?utf-8?B?NDRoemFJMjI1NFdndzExd1NWNzJHeDZkRENrb1puQkdzSWM0bDZHR1RzR09q?=
 =?utf-8?B?Wk9PN1kxeTVrVkJHb0J4cnNqbm8rdWUvOG52K2NscXZqTk5pbFBsUHJmd3VP?=
 =?utf-8?B?K0gwaUFtd29BZEV5R2dUdXdYV0lKOXVWQTBJOWFWczVUcDdOY1dPMmttMUlG?=
 =?utf-8?B?dmpqbW5ob1phWHhXTW81VmdKdWVsWlNxWGJhU3BxWjU2VkhVT05kVmVCREZl?=
 =?utf-8?B?ZXhJbVlzaC9KRzNwT2JsN3pHMDBHSkR2OURYbkkvRGlyZnFTRWVVa1lzMlZN?=
 =?utf-8?Q?JWylTvgyfB9+8CJFBM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca445d5-ab94-4413-b770-08de8ac2dfeb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:32.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiEBePJ3jKMsTGSlJ1tRAhJSCjxiRcYMkysqohx7OR/vyPbCf0AIsd9bAiYRopn3JiM/IFsbixNivvUX9Ur/7Q==
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
	TAGGED_FROM(0.00)[bounces-34176-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 55E4B32D3FF
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
change from v1 to v4
- none
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


