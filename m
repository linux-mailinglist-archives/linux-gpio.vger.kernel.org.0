Return-Path: <linux-gpio+bounces-37808-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLmXLHaqHmq3IwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37808-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 12:03:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02062C131
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 12:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94206301840A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 10:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E261D366060;
	Tue,  2 Jun 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="ZGvq/cnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023121.outbound.protection.outlook.com [52.101.72.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB867366831;
	Tue,  2 Jun 2026 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394576; cv=fail; b=XW+6Fgk1kY1dISNob9kp7P/x5L/wr9aQe27N8xVTrXybe9T/e8PmTOXYfh6+kMjJwcrIqj1jKptN6xj+ZA4+/kbvlwy3sk2oJLVrWn/2Yj1K8w7wy5yxn7jR76vNHosl2VVZsrQxltv66dXygl6f2bABQTu4/mxfyp5cx34Kc8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394576; c=relaxed/simple;
	bh=SfokXHTQ+tD6NPsEKIdZf+UApwyv/PghP8ZmxYLvvsc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Nf4niLxY+Y+NCzzXXWWW9H2IZWe0AGG0kxBHRWzUKxcJRd5Qq1mMx7wL4ixQTjAuwVjy5njcKaBx2481XyeI+70bPKKTnLGwNxHmrx2pm/ELO4NJuoZu3nhOltHifrB4lhrRdf2BTUNeXXhECqEvrQOtkmlB4vxT6cZ4gEqB208=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=ZGvq/cnM; arc=fail smtp.client-ip=52.101.72.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSp5JZIwNBYPPvAJkBXmPtnduHknQKlWzTsFAgy6DiYBNJ9oVvx3ee2PIwHq2cQo/R3oOX6xVgJ25xpxMyfEWGc06Su4LFD8+hEb3SCAx04G6LhOF3+apdjzFVE+XLI1DS+RWMurdZstmKkELRDz0iSYlUihvmwR/DPfRKGxO9iEnpUtubV9sScral5iPg5+gJEFO0xdqsy9kv6P2D9n1M1Rnqop7XEtxekpLgZtQDKoxldDTtOCHr2CQ4vkwyMYrKxLz4+Y+RZTv9D2oZTTxIyFIamvtFH+IiwJq/7XEHP9vC944HmacHAxgBMKhigL/0TdcMKJgm4QmJKvkYFMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1mWYNEhdWt91c01crR2drCFoLOFMBR7gf6DJjxSUB0=;
 b=Ht6KaRCi+iKrF2tEKtjVUCHHPHf+Sd5+9906DVVsOON6tzv8DJ8leLpsn4r7xCYdlzzsDxhxsVaO9roJEDsazkJi424eYRvOedGEW/gJB9Yt/KLIeDaGVqyP5+exwL9n+nbw5OikKFO14zvuJyGWWaHFCQ4/SADMgPmOn56ahFoSbSoIK/Czm+1O8Jflew6znsx2Q+KpfAN0s+arot7Sg6oKsEd2ZpNzWp8ykguzZCpuPN2R7trLDfdh5RB28LtmRC+L/lkwk9H5rPEflHApCE0UuJfNJV9tFOeslyH9dJDi61UjyRMX0xueCMQryOSJpGtCHAEAf5RFsx+5Y8gQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1mWYNEhdWt91c01crR2drCFoLOFMBR7gf6DJjxSUB0=;
 b=ZGvq/cnMnbqHKpGAh31O9PJRh4KugTqDSfWfl7ZMFCmVdExiEREhUf4P/X/y1EflwhBNjWVCRl6VuOGwJq54Cs6uA1n+1D0L5/nJtLfJQaWF3D38RorgREJq0ShKr3tJjrhpTQCvswPXwZ3Ko+cF2Esrveze4+q7xaNZ8XLJkwnfA01UTkfCwOMG/W7iSNS+bTsu+SCFp0BUCDgqk7fQCnZ/J25Rhi7YlhrZx37zzkZ8+mdFC+53wHV9tnzO4Ey3worm08P3S5OXbu8WSDOD43un8Ugj8mrkBD704Xle4h2+f6WaE9aHTSC5+Xr7QeRcWxOagFoaK+yfHaaD7jMgtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com (2603:10a6:20b:676::22)
 by AS8PR06MB7480.eurprd06.prod.outlook.com (2603:10a6:20b:332::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 10:02:44 +0000
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69]) by AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69%7]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 10:02:44 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Tue, 02 Jun 2026 10:02:35 +0000
Subject: [PATCH] serial: max310x: implement gpio_chip::get_direction()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com>
X-B4-Tracking: v=1; b=H4sIADqqHmoC/x2NwQqDMBAFf0X27MImTT34K+Ih0We60KokIgHx3
 5v2OIeZuSgjKTL1zUUJp2bd1gqmbWh6+TWCda5MVmwnnVgOjn+Kf/PHl4eRwnHXjSMOnjVhOmq
 AgxHgGeAW66im9oRFy38zjPf9BVTKTCt2AAAA
X-Change-ID: 20260602-b4-serial-max310x-gpio-get-direction-b10ee5be4f24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780394563; l=2498;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=SfokXHTQ+tD6NPsEKIdZf+UApwyv/PghP8ZmxYLvvsc=;
 b=+Zif7m+9657dCBcJ8lMJJ5sFME+bUU+vgHxNSR+hpZKWbeXS7iV7jZMnLxJcTjlF38YbQ+WOn
 pdpiLuwyz3SBPceymUMY8PIlzVKNF7gL6chz1cL71+b4NPQBIOnF58q
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVYP280CA0023.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::26) To AS5PR06MB9040.eurprd06.prod.outlook.com
 (2603:10a6:20b:676::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR06MB9040:EE_|AS8PR06MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 128093ae-ca03-42dc-1e2b-08dec08e1786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|6133799003|3023799007|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	8ZIylF2F4HhoGTXWiQlp0VaI95ul7DiUEdQG4n93ECSZnSuFC2MIV0LsSExQuiRMGrfxuR+/3KFuQ/BPGjvM7nVP9V0LfG0I6rNAknuPH7vPnhIOQt84ljJSq/OVD/9rlGrDEx2KZgvnRM6dZBrWGFgfMBzY8470RgAwcZBP7boDAHunNjj1ivyCFU6bM0U/O+jfxyfkSbEguovWfJywQ2EJTxIF8VJc9tG0DNE2OQzu1nHHvAOXnu8oC9osiVdrWJHqhIzjIQx3aacI3YrGhR2TsTkIyK6w3EJ2sFCLZJZ1oEIuXEygUHZqsP8O7/Q1eX71geb8tybslAEthedApfJqgR4BlGhPKK9TzvJuDiBS+gGrHEaay1yLQpx6ug4zrA7J473OGQH8Pea5VDapgfWQsgFrHNds1rbs9iFJqelon8TbJJ3cJX8uiKdeFYscZVQm1xoJySL+b0NEeVFGSj84ZbAtqyNZqHUg0thbdeyRXY9+HatUNvhKOmzqBJpUDKFkr/x+bbQsbug/Zd+gMTIbJED5h6xrMHCCADVN1/snUjrioOMSWnXKDx/ZN6zWDloi/+xdeOzKxzM1OelHiabA/9oGiU/REczeGfbiese0QE9+m9zzu41n5XY0cgR6GQjwAjwr9NykvsoQwTUAL4YZDk/AfFDyZaDMU0eR3vy1Ujam/48mFmnh5r3eznoFQByapIDbapcpS8gf+04Z3XXgqqYxqDJlBjatxyT1BtpXlZH9kjoWNDLIGbu0XMHD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR06MB9040.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0xQblRiYlR2RmxIbklCWlpoWWo2V0oyVnJBczlxeU9SSlI3d3pxUmpIVkdI?=
 =?utf-8?B?bkl4cGFwSnRIMEpJUWZLV1A2S2tPNnIrN0pyLzEwR1JDU1hZVDZqZE1tNWxD?=
 =?utf-8?B?cCtsY2RLdmNNS0x6K3ZYZkNtVWRQZHUxMlhQbVdPOEFzWHZvalAxVGJId2VG?=
 =?utf-8?B?QWxJNFJ1cktDYnJqTmZpeS9LSXp3akJON2U0ZUZpY1VKR29qdFc1Mys2b0s0?=
 =?utf-8?B?N0ZGN1JTMWpMeE9ERmRZQkJSMlZlczl2Y3BVMTVqMno4bFRkcDVTZ0xxVXdB?=
 =?utf-8?B?MjhSbVRmVEhIWms0eGY0bU04TFVrUzVVSXBtcnY0T3dLd0hBRGlkekZuRi8y?=
 =?utf-8?B?U0hQcnQzbkxSTWFoM0tVOXdaTUg2cFRXT0FIUklXeTNvc0xlQ3ZCdGtLc3ZO?=
 =?utf-8?B?VE5rK0lSRUFKdWtLNzQyMnl1NE5hYUU0bEo1MVBOTVNYL3NiVGlzMmYrN2xF?=
 =?utf-8?B?YzQrRDlYbzFTa0FYZEJNTnN6WDJ0UVFiMHdkNWlLVzRuTGNBVEJlb1dFcjVG?=
 =?utf-8?B?SUhkQktCeDFZRjNLWDgwWWRIUktRSzZtT3pmOGpIRG9aQ0pUdHNpWSs5Mjh6?=
 =?utf-8?B?YWJPWXBobTlDRHViRzlTZWZ4RjhxRnQ0WFVZQmVRMUNNZ0hDRno2Y1BPalhi?=
 =?utf-8?B?RnpKUnlucC9KbHhXeTYyVmcxN1I1bVh3alR5Q3NXeEdFTjhHN2YvamxQaDh3?=
 =?utf-8?B?UlFpcUhYMDhEN3dRNlAxcy9EZ0xyUEI1Q2Rsb3lFYzZ0Y3g0RERiK2huNTJ2?=
 =?utf-8?B?dC9IOE1xcmp2bnUrYTRKZFNxYzFDRDQ0bFNqaitpUzJ1Y2l6U0tPcDdxbGZV?=
 =?utf-8?B?RUlJUFQ1NFpJOHU2Y3hvemgyb00yYzFKSm1BM3dGMWRBMDNvZ1JSWk1pMHd4?=
 =?utf-8?B?UGVPQWY4ekpzVEZ2aTRFRkZIUU1YeVNqSThkd01MZ2p3WFExVHE2UHdYcUJp?=
 =?utf-8?B?bU9Cdk1KbUJONElJSkE2WG9oTmpJNnNVMUtPb2Y5SVJRLzZCenZpRGZjZ1Bn?=
 =?utf-8?B?eU5keSttREJTeGEzdWoxNWwzSzNmM3U2eWhqQnFNeVpvZzhUZ0tMT3k3Y0d2?=
 =?utf-8?B?U1dnQnp4SGZhL3BMVk5qWUpzdHlIeFl5NWhJakVZbFVTd2JEWFo1M09PUGdp?=
 =?utf-8?B?ZUg2aE9hSmhYS2JFbGJRb2VXZnAvSEpkK0hLV25INHJkZkt0T085MTRablY1?=
 =?utf-8?B?M2Z2UWN5Y3FIcVdZejh2MFBtUUtZQzd6NDYraGVBRXIzSFEvSXhNcjd4WDEy?=
 =?utf-8?B?ZDhBSmFFTDNwdGdybTFaTmM0TVZpbGZoZ1dFQ2kweFMwbDUyVjExZkwvcE5u?=
 =?utf-8?B?OVpqcEJ3dytsdm1MQkpmMlJpd0pLcHFlZ0w4R2FNSHpIOGQ0dFVwS1MyNEU2?=
 =?utf-8?B?SnQ5RmYvUnBGdGNoV2pMTjdNcE1wS0tSSURWOFZWelh1MGhZMFFxOVJDcjF1?=
 =?utf-8?B?YWVQbVVPOERCK3h3cmVJQXg5T2RXK0k0bDlqL2lvTzBRQ0t6Y1ZsRVpSZS9k?=
 =?utf-8?B?R1B3Rll4WFk2dGJydjFEU3JOcTgvQ2tMRmxIRjRXQ2MzZHJXTkNFWDdEQ3Zi?=
 =?utf-8?B?NnB5UG5UOEp0WmY3OTRhVDJzNU1HOHMyR01IWGVRR3B4YlJGcVFlQ1d6bnE5?=
 =?utf-8?B?UW41K2g4TnhrTU5rY3JtSGtGODVpTFNZd2RoNDR6OFVvYTJVMjNySFp5OFNs?=
 =?utf-8?B?ayt3U204bUl5Z3JUOCtleFg2TFdSWW4wc1ZhUjVNOTZPL0t0U0hwbG5vNDFK?=
 =?utf-8?B?cnpQUnYvMmlMUEN2SGo1MWl4MnlVcXN3bWJqLzhBQU4rQ054TmgyVjZJUUdF?=
 =?utf-8?B?aURHcitnS25DMUVoc1RrRGg2NTYrTDA1eUJSaDJjZFJ0Rzl0SkkrZEc2K3Y3?=
 =?utf-8?B?Mlc4K2FrdUZGVlRhZWs3M2RKa2dNalh2UEFPYUlzckFvQnNWVmdiOTdFbDBG?=
 =?utf-8?B?OXF2bnljaHZVYy9CMTQxRWlQelJqdUlla2RjS2pPY0x3eUNjWXpsMU9kaUxY?=
 =?utf-8?B?Q1Q3MTJWdHN6clIrUmRzdG84Wk8vYUlad1JsSU9IN3Q4dktXR0c4bFpqNm81?=
 =?utf-8?B?MUFoMVhEWTJKVlE2Yy9obTlpdTZSTHBFYVdqNHU2Z3laZzA3U3o0T21GK0lp?=
 =?utf-8?B?aTJMTDBOMVord1RYZW9KSWZMRTNIZUFSbW9GV2t2Y1k2YkVvVHBjRjdKcjdO?=
 =?utf-8?B?MFpIT1RLNExZckZEejFQdFQ2a3JVVEZVYUJaVHhMY3VyWDJXemFjRXpDY1hr?=
 =?utf-8?B?M3VST21QcS9pS2lWZzB4TjE4NFpFTlRSbHRsL281S1RFNEZ3WGZzMmM0WnpC?=
 =?utf-8?B?OFd4RXlTRHROYmI1UktpNWxaVHZxSzQ4NVJwdUljYUVKcDM4R2k5Y0I3QzVh?=
 =?utf-8?Q?li4mFNLB7vyyO5oU=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128093ae-ca03-42dc-1e2b-08dec08e1786
X-MS-Exchange-CrossTenant-AuthSource: AS5PR06MB9040.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:02:44.6809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgWmuf0iqiXDD3u0SX78Gu2x7jnctOEUipzILlulYoNk8TCAZXCFwb+TiD2f5oSE9BZ+gmwcgaQOErxbI0OrUTw9rmvT4EsumgVHYkKzzsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7480
X-Rspamd-Queue-Id: 2E02062C131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vaisala.com,reject];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37808-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,mail.ru];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[vaisala.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tapio.reijonen@vaisala.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

It's strongly recommended for GPIO drivers to always implement the
.get_direction() callback - even when the direction is tracked in
software. The GPIO core emits a warning when the callback is missing
and a user reads the direction of a line, e.g. via
/sys/kernel/debug/gpio.

The MAX310X keeps the GPIO direction in the GPIOCFG register (a set bit
selects output), which the existing direction_input/output callbacks
already program, so the current direction can be read back directly.

Fixes: f65444187a66 ("serial: New serial driver MAX310X")
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Found and HW-tested on an i.MX6 SoloX board with a MAX14830 over SPI:
without this, "cat /sys/kernel/debug/gpio" triggers the gpiolib.c:429
WARNING (tainting the kernel W) on each queried MAX14830 line; with it
applied the lines report their in/out direction and the WARNING is gone.
---
 drivers/tty/serial/max310x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index ac7d3f197c3a5ce3531d5607f48e21a807314021..96df54a90b009d1b547f7a639b0b9a4281daf073 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1212,6 +1212,18 @@ static int max310x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static int max310x_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct max310x_port *s = gpiochip_get_data(chip);
+	struct uart_port *port = &s->p[offset / 4].port;
+	unsigned int val;
+
+	val = max310x_port_read(port, MAX310X_GPIOCFG_REG);
+
+	return (val & (1 << (offset % 4))) ? GPIO_LINE_DIRECTION_OUT
+					   : GPIO_LINE_DIRECTION_IN;
+}
+
 static int max310x_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max310x_port *s = gpiochip_get_data(chip);
@@ -1421,6 +1433,7 @@ static int max310x_probe(struct device *dev, const struct max310x_devtype *devty
 	s->gpio.owner		= THIS_MODULE;
 	s->gpio.parent		= dev;
 	s->gpio.label		= devtype->name;
+	s->gpio.get_direction	= max310x_gpio_get_direction;
 	s->gpio.direction_input	= max310x_gpio_direction_input;
 	s->gpio.get		= max310x_gpio_get;
 	s->gpio.direction_output= max310x_gpio_direction_output;

---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260602-b4-serial-max310x-gpio-get-direction-b10ee5be4f24

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>


