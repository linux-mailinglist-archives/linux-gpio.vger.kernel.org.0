Return-Path: <linux-gpio+bounces-38444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kKZAg6eL2p9DQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:39:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF4683E0C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:39:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vaisala.com header.s=selector1 header.b=2qHMdqxx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38444-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38444-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=vaisala.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E14D30028EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AED93B27DB;
	Mon, 15 Jun 2026 06:39:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023085.outbound.protection.outlook.com [40.107.162.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1783A0E80;
	Mon, 15 Jun 2026 06:38:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505541; cv=fail; b=ZQte8PBc6zkN0mtcx/2sNd8yiasoieR4d7tyXYNHXNgjD8MezBA9j/WrLY7D8OvBqwGoekCcBJr5G1oRGAeUUJB8HEjnYCqOatdnZ5nJFA7RZOxhyzqz0vHBo1hUYUDFsCxWXIjTrfkDxS35w28YNp1C0+uK3Mpe5CODAY+lf3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505541; c=relaxed/simple;
	bh=KZnniEw5tU6ZusKFxe0aX7n6qMkVkA54ZAHGH2QpH6Y=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=owPB2LEoFAyf+s7xlH9OH7ongAK3wo4I5ZG+SZPsp6ld9nOGvN9A2lFSSGsBKwT8mPR8vy8v9sSWPzgX2kHcC4ejUMXPklT+0q1TSddFeBEjSVPFythiEv9j4nYka4cywVgxAbZzhZqVw8Ppxjqhdc0kq74engC5gpXG8XuhoAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=2qHMdqxx; arc=fail smtp.client-ip=40.107.162.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj9Zs5gtB9I8RWjrZMNJANshDVraEKdX/gjCvbRRQ1eNK+VhtxP93mGh75To5QlMLUWQiCnIpn09TTRrXu7vIlxgZusA12mh+jBX17KlFsx8/8eVg3ICcfMjWRnaVTtBnxDEgtDrm3Fm39Xu8Ewb4Ti4kWw6nD1Z+FCsnBXe5ACQ0e7DPciuW5Yx6Cmv3l9xGy2tiW6LA+FmJUWv9t/aKyZo+zN4Uy+hHT15ZXVe2Gm/yqtZgNjZztwwrSNLtoCxnredewM/WD5ao/EmyhYc/xJeuaYqrynJljZApHWRMnHhtipjPX1qlHvhMPg8QYHu0uH1s2K+wMP+AgCjdiXd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9u9jUjvi/bZENBAtebeuiy0HtZfS3AlJqFYiUN8n6U=;
 b=cZxZMsT4sdeZ3P8n+YktObJawxUqrqPV50X7LTLORhx84ducMEKNaOD/FSpqP7mGlFdVtjKqcG0PMFvUDyuOcuKVuBBmWPUilBT9rurv0Gi6vaX4WpiYp89s6xntsm9TtgQBHe1jMjlNVVxj8fbXwAAal8FOP+JhxIh+ChehtBpLxaron/3VhT3IThAf6vOuvKvlcjnvaolIJB5iWxJJ+2TvR1Que1aKjPxMwUEeQh5yz3jbLwj+bS9B5hEMkZDEXq9BV5RqF+tMlpQrIsNXr//nnTP/gPjZFSpXWzDXZ/LhJutY7AXqNBWXojf4NNjImXSIesEluuMMKU4EjAp7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9u9jUjvi/bZENBAtebeuiy0HtZfS3AlJqFYiUN8n6U=;
 b=2qHMdqxxbdx2rhyuMOSn+9+sjFOuQA+PP0zg1vvJoY+w63bl0NnFwdW7aQcBKVNcWQpY96PUghDSphfyyxLpVsgsm94+uq0evFUTjzBYMAptkgWzeBIG43RMSbTOL9r8aorFMQZ3TV39EUKPkVMoqyTp+wqzMHNjQBXaVDfafatEpDt07nFwpbLWD+7BJFEbPipY9FdSVMok+6s2HqGii0XIKcLYVV0T/55C0UAqhDPbvEA3tkDxwJn3SmUpb/VcQW08SSyu2mkHYU+IF4veytTCdzctiNJXlfpe4xGjo+2DV1PSKcjD5ueORJgTqDy1M3dB6EwQlmVv73snUvUD7g==
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com (2603:10a6:20b:676::22)
 by DB9PR06MB11064.eurprd06.prod.outlook.com (2603:10a6:10:614::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:38:49 +0000
Received: from AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69]) by AS5PR06MB9040.eurprd06.prod.outlook.com
 ([fe80::923e:d30b:98c0:c69%7]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:38:49 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Mon, 15 Jun 2026 06:38:40 +0000
Subject: [PATCH v2] serial: max310x: implement gpio_chip::get_direction()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
X-B4-Tracking: v=1; b=H4sIAO+dL2oC/5WNQQqDMBBFryKz7pQkpiJd9R7iItFRB9RIEoJFv
 HujN+jyffjvHRDIMwV4Fwd4ShzYrRnUo4BuMutIyH1mUEJVohIKrcbrYmZczF5KseO4scORIvb
 sqYtZgFYKopclPSgNWbV5Gni/M02beeIQnf/e1SSv9c9AkihRlXaoNdVEUn+S4WBm8+zcAu15n
 j+liIVp2gAAAA==
X-Change-ID: 20260602-b4-serial-max310x-gpio-get-direction-b10ee5be4f24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781505528; l=2751;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=KZnniEw5tU6ZusKFxe0aX7n6qMkVkA54ZAHGH2QpH6Y=;
 b=OTqSu+BCvhioUtSXiR0WDRtLAm3yPgxDMh0p860PadPzkR4zRLpI1DVtNsFCfQi5iZmHyz0AO
 IHyWvA2n+/aBGbVDMPsXULZ8EaDBclUeZLblui7NJsi1UMbVDDhvUKL
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DBC4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6a8) To AS5PR06MB9040.eurprd06.prod.outlook.com
 (2603:10a6:20b:676::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR06MB9040:EE_|DB9PR06MB11064:EE_
X-MS-Office365-Filtering-Correlation-Id: c99d11cc-3109-49ea-1f6c-08decaa8c22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|56012099006|11063799006|18002099003|3023799007|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SHwWwHznAW4nK6U/PRpVEr5dkrzy9sLmoOA9vc7y4d012a1zBqmWLSwBLmnlRL+AruOKPCSpXyKBvGkmO2OdMKBlouvC1gMorGH/Q/jrsRXu3X7mO+zTZUWgP90beOut6uSfr0haz14mLc3D/pUbvCU9sq4jYVjtN/cVTVod0TOqbv7/6s3OocGHB5T9Y6bEL4g/C4Zbu/lznLD3HHeuZOpUe+IpFSSSK1sKoZOXmeN5DtlNwtush0geMWMVux1jRGiJiNsM5FQWJYRCjJiCWmH7PaEf1nYggsw8S8LNYng2Jpzg5Hs/2vSH8PM/U7daZ03YnW4bPJEGp3BEEyV/MryVQkWxr5cWjPYltxJ8JlwoPYxTXm2rrMlxJJbHU5mHBvoBnzHOCYkhWKXRArWu2pdNi1NCfuDc9vFapQktzExu3WcevfHVt2K4X5GSPGUYp4KDlgteaWgc7tM1VK05GYCvNmnJ+ryVcV9NK11MA08aE9+SmotVOiOp2H8y+OVilgISBWWg+t1ZpnWO8rs3LLMDxoh1uKZe0sVN/bQhtSh6QIBRvHfjBSrnSQU/zczuhKNKEAkIdioStcEgIsDNrjMudKdU4ZZZapfPDQx3fI0jlZgg2jLi83XDTc3EiwABQh94nbsCrzCqcI2D1YbhzUdqfTnZ/NprTAh3mhJ3+PNIFwjmtN43CWfuZ2yQxvxkkH2Nsg8Ybt/JNjXMivtNDM0AHAfcUPqg5v++B+XxVQr/x/0SWhgxoeXR22J2nVXY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR06MB9040.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(3023799007)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDd4N3UwV2xRVnlOQUovbWpnT2YrS2plbkh3WFlPZmthVnhsQXVEakh5YXJY?=
 =?utf-8?B?MG5qYmxnRE9sZ0ZnZFovTXI4RFY0ZWFtV0NadUIxUnVId2RVeXh4MkRoMjNp?=
 =?utf-8?B?NEN1dVA2S3JIN2lGbjJHM0lPU1oyanhQT2NVUVJmY0tvSEpaZ0FHdkxjU1g0?=
 =?utf-8?B?blFlK2NINkNrZDBERVVyZldCMitLRkJzSVlmcVM4R3RFdVg1T0pnWkNXcFpy?=
 =?utf-8?B?dUI1ZUErdk5oTFVRTnVFVXFTMmpweldYQWNMWWt5ay9WMHJEZy9KMXMydDJw?=
 =?utf-8?B?eEhndyt1TXdFdlBZNWxvUkpjRGJWdjRzOG1laXh2eWFDTjVNWGI3aUZaZE9a?=
 =?utf-8?B?QS8wbUtKenh0U256enJnU2ZCajdOcjJTZWhuRnhzR20zdCtYNnYyRlZKUXJE?=
 =?utf-8?B?Ymd3aEcxNjRXbUhLVnJIc2ltZTlvWnZpZkxGS1JEaUdmWk9OVHJuNU93VDFY?=
 =?utf-8?B?Mk5seHUwTjVURENrc0dOaHVySzNyblZuSGwwRk1oOE5zaGl3Z0huODNkMThU?=
 =?utf-8?B?TWJNTk9nTW9iQ1lteDdCMUpNbWFOWmlZa0IvYjZwVUhVMExGc0MvZWw2b2p4?=
 =?utf-8?B?T0duTm9LSHJ3KzRsUGRHUktjKzU5UmhhejNZL09XbVJUcjN1eU9FbUlpcFNN?=
 =?utf-8?B?VEtHaUhNYnBJU1FKT3RMMDRkQUowT3hydkVwWmdJYUVBVkNmNnRUZ2JPQmpy?=
 =?utf-8?B?YzRlNUdwbU5NbXRZSGpmd203WEJRUVBSeUlsWTZCdzRrZFJnYkFDQnZ2T2Y2?=
 =?utf-8?B?ZnZpZE13M2lObVFhNjk2Szc3RStDdk02MWtwNjlrV3RmOGluWlV1NXpXMzkw?=
 =?utf-8?B?d0YwZkNLaktmWWt6bXJGSHkvV09tZHYwODNxdzhXdVdGN2gwQVg0eFRrdG9I?=
 =?utf-8?B?Vmk0TVZoZDVXaUprZG9iWXd5eTZPdWozNHBsMk9Ick1FeHpQSHU2SS84OExl?=
 =?utf-8?B?VkdMamp0dUFlZkhhQ29YSVRkQTcrMTJJMkhEelZGMmFUbG1iTXJWVWhEMHE4?=
 =?utf-8?B?VGtaazYrMGM4dVBqS2FWTW9BYU9hUXU5aDB1dTM3Z0J5Zk1OZmZwcmpqSkZW?=
 =?utf-8?B?dmhlZ3M0dS9ycmpzTW5HR3NmdWlWYXhKR2RjRUJHWFA0djcyUVpVUk5PTDBN?=
 =?utf-8?B?L0I4OGpTb0tUazNNOXFzTHFrbDRVcmsxZjFWRUZpeTlnbjJkL2dPUTcxOHZ3?=
 =?utf-8?B?VmNRM0tJSTdlQzh3dkJYZWxhWmwrNVFSM3RKOVhaM3pseXNJT1ZSUU1xNFox?=
 =?utf-8?B?V0pBY1VNa1I2cnBxM0RXVkdtSnp2WjZzN3NSdTVmUm5OcDQzLzJKQUZsbG1Q?=
 =?utf-8?B?QWxHRjVtS29BazhtWUhSK0dzbWRXay93dVljODdkSkQvWFZzNWxTR0x1S3dW?=
 =?utf-8?B?OHdKMzlRWnhMN1ZPOFN1RzE4QTNaUUZ3R1VuVzN5eGxVdnowVm5KYzdnRjgw?=
 =?utf-8?B?TmFkcVdmT1FEeEEwemlKeDhtQSs4U1RzU0EzWHk0NzBLckxMNjRTR1lna0xQ?=
 =?utf-8?B?V0tMRTlrQXd2OGJETDJDV1ZjMUFqcGtoVGhML1pNQmZPWkcya0lkWjZIV0Ux?=
 =?utf-8?B?TFcyazNiREhwYkZFKy9KdWFEdGMvUUp4a3U1L0hMUU9Ub2JQRG5nYmQ5b2pa?=
 =?utf-8?B?dFJiNjZJNjJvUXF5WU1VVTRDaFRzWlZxV0hZNXFEbExpZ2Z1dW0rc2UvcVZX?=
 =?utf-8?B?cmpvMDdML3ZPdWxkeXFzeDI5czZ5MlBudWtMdnF0ZVkvM0ZpT3FPellkSlQ1?=
 =?utf-8?B?ZmY3czIxRmwwcC9DNk01Y1V1SlkxekRvTTNFbWdSS2IxSDQ2YUcxRkdTWEFr?=
 =?utf-8?B?eVpMV0g3ZlJPanRxWkhMcHJuS0taVTI3RDJpVUZqenpVRWxnb0dsV2ZXRWw1?=
 =?utf-8?B?VlJOM0l3ZzVHWUtsKzhlUy9MS29PT2psV1BuTjk5RXVQT3BNZjVKZkdOREU0?=
 =?utf-8?B?UVhJcmMza0N6OGFORkRxdkJSUWx4Qkc0SVRKVjFnYUsvSTltTGhYNDNrejla?=
 =?utf-8?B?d3FaV0ZLbmpRaFU1cmQ4SXJjYVhvUnFYZlltZVlHcUpYYy9oT3MvOElpQVov?=
 =?utf-8?B?TVBpK0N0dWxndHpNcGlsS0hYeGF3TlRKU2ZINmx0dmJsNmVKUUlTQzdzd216?=
 =?utf-8?B?dUxYYWhvUUIzUld0UGtrU3BoSmxWRjVLK3pvYm45YXJXN2wvdVdTSEtNY0Ji?=
 =?utf-8?B?QjAvMURjV3U5VlArdmoyQnV1M3ZDWFdIRVJNazZ0Tkh3Zi85NWhTQmwzU1R6?=
 =?utf-8?B?L2FsMUw4RmllUXB5TDMydHZsZUpnOEhBL2o4S21xbis0YUdXUlpkRkkzY1Bs?=
 =?utf-8?B?Ri9GVU9NZWhZS3ZMYUduRzNuRi9QUXlMMmZoWU5CZzNIbEVhWVZFUVhQcE4x?=
 =?utf-8?Q?dpV0O1SG8BteBRLY=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99d11cc-3109-49ea-1f6c-08decaa8c22d
X-MS-Exchange-CrossTenant-AuthSource: AS5PR06MB9040.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:38:49.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga0cHMpAmu2uXhBFQg5fhIs9vflUyZFG4u4NshMiEtZrB24tyTEv/BTQeovj9JqP6POJldPfMtCNjL9n/27DXywGjfgV/t2NhjAintEyMao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB11064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vaisala.com,reject];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38444-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shc_work@mail.ru,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:tapio.reijonen@vaisala.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tapio.reijonen@vaisala.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,mail.ru];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vaisala.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tapio.reijonen@vaisala.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEFF4683E0C

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
Changes in v2:
- Address Hugo Villeneuve's review: use BIT(offset % 4) and put the
  return statement on a single line.
- Rebase onto v7.1-rc7.
- Link to v1: https://lore.kernel.org/r/20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com
---
 drivers/tty/serial/max310x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index ac7d3f197c3a5ce3531d5607f48e21a807314021..09b9ab57d2b4479da90fba178b093008f4b57bb9 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1212,6 +1212,17 @@ static int max310x_gpio_set(struct gpio_chip *chip, unsigned int offset,
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
+	return val & BIT(offset % 4) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int max310x_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max310x_port *s = gpiochip_get_data(chip);
@@ -1421,6 +1432,7 @@ static int max310x_probe(struct device *dev, const struct max310x_devtype *devty
 	s->gpio.owner		= THIS_MODULE;
 	s->gpio.parent		= dev;
 	s->gpio.label		= devtype->name;
+	s->gpio.get_direction	= max310x_gpio_get_direction;
 	s->gpio.direction_input	= max310x_gpio_direction_input;
 	s->gpio.get		= max310x_gpio_get;
 	s->gpio.direction_output= max310x_gpio_direction_output;

---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260602-b4-serial-max310x-gpio-get-direction-b10ee5be4f24

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>


