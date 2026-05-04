Return-Path: <linux-gpio+bounces-36103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGTQDYUy+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A705F4C508C
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8F4305EAB9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440353FFAA3;
	Mon,  4 May 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D+hmFR4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336413E639C;
	Mon,  4 May 2026 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938915; cv=fail; b=IEKQWYqMo8MprNx2sZ2uUDEdFeG7RsQ6vYKHUg62GUpldpU2pyFcezyUEsPlTf66xYDspf7adhMJS9Bndym5v5Vy4BEuF6hache/Dt1CgHTC/ZWmew1sMoAVd3pTXJi4gbu6/sl1Lx8ktG86s2cVBkmO/nbR3KtkdVnKH5ezIzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938915; c=relaxed/simple;
	bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O/0caMwDeVM6JL1iBkKBNvN4LqujDD78xzLnM57D/Ojf/YVu7FXnXyGEI3nD3SPyMeSyPGo9noMx9Zb+VKQCvHcPIwjwMR9LWC1xk64ON7RVGC4ZdMk8IO1eszXi+RIaGAuMXP8lRrojMqc3HAs5UG09c5ZKpW01DyfiP/HLW1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D+hmFR4m; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+Zt8ebFxgFhDbbMH/wvGXq+27irTTM/+EY3bmOd5OscCEUrq78O/3P5X3cGWHaPbXBXg2dPZy6yTk30Uq6vEUo0Hhlw/OB/phKjO7yUt76/bD3on4kt7YvzeHIQKGfsvPosBVIoo6O2QgLxJk9Xhb3brxYyVMN1qGlk+mPO2fZLddHWyPPD69pooII1guY21WZdrxlg9HjZ010Qnqg0FXY6aRFZmddh7EqT6mHDiN5Zs1IGpU9qEofBX9SE8UP9MGnTwq7Kt7mmTyZ1OMpkQoQ6X4LyxxyLt+RljN/uyNSY+2hyYFkgaCztflNRUajs++q3Gb4zWYwn1yRK6Jqg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=gV7vYx2ivoI+McftI0kZqDu3i6arhKAUowo0pDu9hNBQVOMjowWeO5lVSBGtpm5GTSKdq7jlRgF9PmOZwM8EoCrvdD1IgEsWwX0nAx8ovJuGHa/iTsDIJQ8DZbrsW1Ruv5aIY4dMPUkYBN4zO2IlmF6EM9ri6uVY10BTOs8dQ0lu8CnYbY1ER/r57IbeDtEH0ANDEc9bjybOxE1NCwNEyN0xDUMR5oxnHEH0EObOZe5UuAmew7WExXKugW0sBfgRGgKD7JJ6o3o56A9IgdvWdz9KWozvWsanv6NEodGEfT1Wfy1t0dBvdth30hQpwc6Oysc64eoTbJHpdYvoLppZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EomKscOACz2EiMfHyFMhDh5ukwxhM8VLlPUnGrNoojg=;
 b=D+hmFR4m3SFR51UJYtjtseOfU3+ol8LqXT7Qp27kxbwT+gs4vfb1Q/jVLAglSPVII92rJtANjw6ZBaAEtRqBe+wxZhVdQIhP1jMA1AyCANGI+yID8q8N1acW02xPP7IkH92PJqQGpu2sdL5QKCku9emJTFo9vae+68tHrtdhNtldrjKy/rbIvMto1DQUwsC1WJV7oxWDPGy07MNd/5YLE8Py0nYR6F9pXHfa8WwffmLnWgrRhX6AKmyaFVikn5oly8uozcGXm5z8EGGiJ3TVL1MEoDV1BU/CknGO+7YZtNSCyY8SKHzeoftf7hSlB0cERgOsWqk7pnE4eLkwoXqnbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:38 -0400
Subject: [PATCH v6 4/7] pinctrl: add optional .release_mux() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-4-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=3409;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=84YFQG/s33y4aWmdQnO4NG1npAXRpP23tH3HW7BHAtc=;
 b=ZNif8LYzw6sfNjrLUp6HxjV4wEkvA53n9bWZZ015/e7YJK6cQlbsmdauFqYJeNovkEjOkA/QU
 1xZ1kul197/DKEzSGEz99UadUgMbd722CUSPxHmqn1m8zb+K3UEyWrH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: c38a308e-47ed-4ddc-c98b-08deaa3893f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	VetczPRITw7sCSirumw2TbQL7IjkI+H0agylI+6YgPHPDCQMOkWSK6ifyHaxl6kAGKRU84zRe1uPhXOsp5zzXIsJg7oXeWusx8yz8FJvfJL8mvQ+rktl1+kEuCWNLWuBe4B+9FeQLJK/5INN1N6W4yzyHPOqMFgq2PMhmwMZV7jCHfbsw7yxjQ8rW4/cRe9uyIebOOJVD9ShpZlbDprDgcVrqVWe/ltfXghTFGbE0D34bbHEUQDgAmDffMimOhvuXxMQ4YKhXq3a9vzPhGUWbsbReC3r9EqTkrwz/qVXV7r+LDMu95yQzWSAa34H0K6l6BlwDirvH4rkwf4AJJCwU34STkjXHmnk0nI5lS/du1JPnLmt3IOlaA4VlWg51aL21tJlUyRxpZeFgdkT1VUaql/qT44t17qOQiTqY9QlBGrEaB4WBqgc3GE7zvffBC5POmkiprmQUzUwhW4pIfdvftzuoYbukcB46UWfkvPXmWhGZrj8ITfRrxIHwF8jQkzLToAgehhsykjGESDz4JkP9Q7mNZbeK3TI5ynNsM50UQVfb2NmCtbqQbxS0V5sliyC1+wQXD9+VkbioGjiIOVi4p1VCyckDsTPIP9TDzgWlv0omJyOCn1XHBjcuSXahEjxMpLk70BZGdJtx3+0IaurhGHL8++4GsA3u75SUufBe40pYtRlekFnKvR+nyobfBkwoOfC+8LWzn0Gr+k4GAraN4mu+V2/kw0GKQXMJ6B2AjMIUgallM48GdczGEowb8JT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFKdlFUekJUWW5Hb1VuYWx0dXVaalhibkg3aDNidnZqSWpSeFhOSk9CdVJh?=
 =?utf-8?B?aVpWQzdBd0haU2poV3FFR1hBbFJlekt2N2RNTnI2MkZ1MUl5N2pIcmZycU4y?=
 =?utf-8?B?Uko2NWpHaEd6ZW82UlZnbG1GTk1yR2dnVjhlR2JCSnFJNjJpaGsxRzI2KzFs?=
 =?utf-8?B?U1h2VHRSM0FYN1hJVjJDakRsN1hvbnBoVE0vc1N0N0o3OFBReDBST3lpV1RO?=
 =?utf-8?B?ZUR0MEprSGJvRTNQNFJSWGN0bytTREdqWHNPUmJMckpUQUdRcGdYZnZRR0Vk?=
 =?utf-8?B?YW85ZHJ6bGtlUjBOWWVVS2hmOENTVVRqSU1XZHZ5M0hsMG85d3BQUm56Mkx5?=
 =?utf-8?B?UHZwTnhueUtlR20zeFhzVE10d0w1TnFRMG5OeW1MbkIraHBxejVCd2djc1FR?=
 =?utf-8?B?Y25FMm9tQkVkbUtxc2hETGRLRUJCSXVFV29UdDljTGdEQmdRKzJZVUI4ZWZN?=
 =?utf-8?B?ZThpWXdaWitwT2N2MW9OMU8yMnY1QnBXUVNXTmFSbmoxd05vWWxjaXR5WjdO?=
 =?utf-8?B?VzZ4eDlYZGVPTVd3SUJLTDZVQnAvT1h0dFVyMWFIZllmUVhoSXN0WFhmZFd4?=
 =?utf-8?B?YmVZNjRlWXB3a1pYQmV0a0tjTmFxZVNSbGRHVUpiWXJhMjZjREpvazlhUjcz?=
 =?utf-8?B?L01ZalJkbG1NRGdiL3ZlVEZzT3dTNUhkU1ZPUEN3MDJtLzdja2VoUldwWkZh?=
 =?utf-8?B?TlhGMXhEb3hUOWZaWG1MSmJGOXh2eFJKSTRabGN0UWx6RTZsNmYxYkhtQTl3?=
 =?utf-8?B?dTJ6YWVMa2tmOXJQM1ZQdGdKKzZxLzd5aGpidm5VMEJXV2hwZFBwK09zR1g4?=
 =?utf-8?B?RFVMOHJNeExIQWY0NWpQc0dRc1BxcDR1a0UzVm5HQmZzaHluTHBFanB6VTVT?=
 =?utf-8?B?QUpnbCt3V3AxdVVucVpuMWt6UHRQQzVybS9lTWdUVGMzLzVwVDlQSDBPZjE3?=
 =?utf-8?B?Z3FtTXFUY3Q5QzUzdVlYT1A2c0R2TFkrREFuOXN4MjVjZjNWblhjK0svOEFn?=
 =?utf-8?B?QjhrQ2t3NnVrMVVIS2FhcFVhZTNZVHRnbDVZdjNSWUFlTTRJNmppVVBuV3JE?=
 =?utf-8?B?V1BuSnJHUlp0OVJpTTgxaGhjcGMvNG91WXN0eTg3aWI5alNHVmp2a3pmeUNw?=
 =?utf-8?B?RWdoV3NEc1Bva09aYU8rZk5tcXF0ZUxVdmVnOUJQQ2U0WndiUmk1UUhvTUtq?=
 =?utf-8?B?Yy9XN0xIaFlwTXRSRnVITzZSSWZ1N2MzOGFhTTVyaXp2OVg3UXlqc1FaWnI4?=
 =?utf-8?B?dTlSUEhVZ1Y3VS9rdTVTZS9kb2lqamhqRzB1R2taUlpURUliaDRlRS9iSE1z?=
 =?utf-8?B?bUNWZy9jN3B4ZGZtRVBGZEpLSlcxVkN2Q3UzWDFPR015aUpaby84UUcxMGUz?=
 =?utf-8?B?ekVMbEREbEVIaGVmTENYV1BJUlN2V0oxdVZ5Tk81eVlNRXhBRnozL3kydEFL?=
 =?utf-8?B?bzFnWStOUWpWbkZiQnVDdHNSeHhMdm9WdUQxZUdXSXZDVFRoWW11OUlnaGMx?=
 =?utf-8?B?d1NLQ3YyMWJ1eXRKNjh4aVoxSHc0ZjhCcFQyZ0Vkd0g0WFd6czIyNXBrN3Nl?=
 =?utf-8?B?RG5Uclhpd1c0ekRPQkNkMTBpeWlPOFdnNkZTWkRQVHlmb1kzRVZYbGxUQzJF?=
 =?utf-8?B?M3BjMFg0dDV5bm5Vc3g2ZW9taUJQaHExdmdwajZMZDVFVTJLVmcvZ1RHdVVj?=
 =?utf-8?B?RXZvUStWbHlzRVZ5L2oya2t5akZuZDZBb1J3VCtTTWR6VGlaQ2VpVUd2Z244?=
 =?utf-8?B?NkM4U0d4MWNrNEJsSW8yQlc3UlR5Slg5cHlNcVlRNnRTWTI5dXpkdDJSaCtq?=
 =?utf-8?B?OFZjT24vUG14cVVHZWtjaXl1c2VlcDhkZXAzYzBoL05Ib0hPRHN3RVU0eU41?=
 =?utf-8?B?MldseWJ6cE04Q3ZMSW5zbGZndzVCay9UcnNnOVJpaXI2R3hPeUtGMVlDQnc5?=
 =?utf-8?B?akhxYmh4Vm0zV2hQUG1hK2M0NG5jeFVKL3FhUVpMYjZvMUxCdW5JUW5UNWlT?=
 =?utf-8?B?ODZudG1YRCtNSlIzeGl1UlgraUxOMGdVN2N6M2lVSUNFNW4xbGEwUUVUUWFz?=
 =?utf-8?B?OHIvZm1xY0VtR2tFQVdRS0REVGZ5SitieEpITFVmY1NXVnFtL2FMQmFlMDdv?=
 =?utf-8?B?UkhNRWNHWmk5ZDBHSk1CVmQ4VVdocFNZeU1qYnl5WWN2eUZlUHBDQTZVWWhV?=
 =?utf-8?B?REJLc3hQcFZUNThQY3FnMlVEYTBOc0JFenJYb3ZaZ09GWHNNMnB2Zk9HZ3Z2?=
 =?utf-8?B?RWFlL2dhcTJiL3ViT25OZlk5QWhSaWhLdkhEREVnUFdDYzlqRDNxSzZOZGVR?=
 =?utf-8?Q?X4SRtMtprMuKvP0Gx7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38a308e-47ed-4ddc-c98b-08deaa3893f4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:11.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFT28zyvSvGMIhyfY5fd/1BU8OcQrhWNygtVtqDN57hpogv2GW4LI/D2gJhEPRDBPhrkxgU4lYot7Qo8ZR6s9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: A705F4C508C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36103-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

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


