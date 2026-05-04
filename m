Return-Path: <linux-gpio+bounces-36104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F7XNa8y+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:58:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E14C50A2
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 894F33077DC6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632593FFAA3;
	Mon,  4 May 2026 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lChYoBLx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3533FF887;
	Mon,  4 May 2026 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938920; cv=fail; b=o9mNvVBNfE6336sYP+RdtXzlW5LFguDNQVMLViGGA0rDQ05ZV4IxccLmPu5gEqPef91ScoG9W2PNp6GFZKZMFY4eMQf2bZq74Wy3xX5hIiR7bFUAFBdBjkGn4SftxLvQJU9KsYT4LAE+KgttfNn11j57US3Q8MwzyrhbKmHFzBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938920; c=relaxed/simple;
	bh=VL6/kmWeEtW96MQmyGitZ241rYwjGSOVQuOcZ2acEg8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hYikOGwpyPLmDpTUlk3NGgXvjQdRVPR/QTuVTw8C40pa+Y2dYYcpKjyKQjClIBJTR5gV1FnSNUb5S62rMN1F046BMqot1yJrFUd1H7hOtUWgDOtVJUSaGOEFZQYoa7p8NDAo7AZ9ZtMofbm3XRO1i/zKdseF21fHuDjQFnak2io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lChYoBLx; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSVL+tkhYDP5NHeVS0qHSNYD7Tgm/m7W3O+j/KfJUy+BKwd+UGX2eQIbx1PR+aWAp8N8LI7aQ27VL9i8j5C0QW9uDXCKOQNqQjffg5k/lgooB5/7FzebiQaIr6RSfs8i36azBpV4CzrgIVt4RRM2iyvv6Q6KH8SBvUDHvfuAQywJBX3DaYWix1McOyQmM/rpEzR7kkApbejvYCk1DAU9ONhsmbDBXxvGlHhy86IX/uK++UJJ2c3inGSqqX84hYAGR6KMxlGAxSsMZUqWewnOhJH6yuxj5nI3+JraJfeJpfoVteR4Am8oSVUuIskL7eNbfUdDKAXESBs+Lh0qx8yF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNotApPQ2FXiZxPL8UejgUa1BnAJ0S9X9VPjuI0cLLM=;
 b=kG0GXnOHFDaLbhYdXVEMSHYEZ9A1S8ZrKlnGQfeUt5zTA7IbfCEJgvfSwIo6Xy01tOk8O9VIPvjIJoE7N9c2+NtTYPJ1K1yZj9Lpf2RYxCAPXqwvu6Drwp6nDHVgh28bYJ6dAdGbUQR3uFCRfmkpqHlwHXYP56MkVHqYy4Ey3ddyfLvBAZg4LC4sALd+Xm0wn5vBGPVOFwMg7pbxiHInZTpoiYJxf9X8e/J/KAnDY3NAdAUREeSZRwLbtlv7mUgvJLobcybJfaAyGNt/pbHcItCgm/DXfAvozaJvzmoyg4POhvEvo/T+9jFeRtgzVcUXw1DdINo2AMuO7gwUuVshpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNotApPQ2FXiZxPL8UejgUa1BnAJ0S9X9VPjuI0cLLM=;
 b=lChYoBLxJ6edKj2asJ+FyCiaArt8/Bzv0JE9ShOa+AfhQW87fSBjDKBRe/vnTo0Ucz2TwRDPODMK149aFpSdFw+Q/mgl0bDjcI1dVaNCr+wYiv+RD07atJt5GyEiuFxGYyscV+V70YiwP5p/pDsoMdsNoGRICtSiSqvTnIy3nzrA1mRJ5P2xkSolTzVyODXIwbYVzu1nB8wvtZIWrVc5jtnPzFEjKy9Zzv6nGCEOIwbiQq3tqxe70U3vxxrN0ERpo+slS0oXpPcGIKUXcsA2tgS8mZFP+7WzHNK2v9inQj2KrCbSLND8klOke7upHSfXjgOnGYa9vaYMU+wXcb8enQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:39 -0400
Subject: [PATCH v6 5/7] pinctrl: add generic board-level pinctrl driver
 using mux framework
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-5-8ea858ba3a5b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=7919;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VL6/kmWeEtW96MQmyGitZ241rYwjGSOVQuOcZ2acEg8=;
 b=Kbl6rotXLfosVgzEEZOn2Jj38Z0PQgUCY1UmZiYY6XIYhnHAYqtnIgNQxpQJgSIN1HYSB+gok
 75BtecFRCtoBXYI6PH03vTeR+0W8U9qwyzS3XBHjYCyqygradymt3rJ
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
X-MS-Office365-Filtering-Correlation-Id: 013bc0de-ddb1-4cd8-ad54-08deaa38964a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2vsl7fj4Pq6KRo+QbL/yn452+X0DPhoDoOertMiUPiz3VZsJq6z25q6dWeFd8tNyLrsi36C3ViA9zEX8Mq5SFF0+HJ8zpm0wuIpoCAZyLcr3+JypMjBV3aBb8XG1IN31e50BAKQPCvKFsmkxwzv/rFUcQoCy49KR91mkNfZk73t05fXPJhgqstFchrUDLdqpjuhBD8T1aU8QyBU9RHqvKwiXsbUTEJBGI+HMkuhsihqv7ppziyR+TzHad2kTRndmbMrBa8zenRWzE+sb1rZosr45R2AyuJrLZzarT2rDjeHc7DSbIZuqPDmhGjumBy3WoQMFKrHYFgeQEfW8sYhiJ8bt2N65xdYg8S6Kb41blo9Sl7giUMR+d4aa3g5U3zY+SCAhjKjTYklgP13LB3oUW9DX3ndsg+ti/Ac3E2mgtkZC+V/SLCbScmxXZ8mon3wBtq/4Xhq76geX75wL7suWhRrtsmCJbLUMeOSwtPEeJzYBV3nZx0lyHcc6CEVslE6ETshe0hKHM/OaYuoGDirDYI4PhbUo1Gtkxdi+mK5HPXrrMdKxA2lgaMdzw6htZewzTCrN/1cFV6ZX7vBBvVz+51k8J0HVIfxKwuIBnxza5EHB2B4Gso29O/g7WKApJFSzbYqPyVyAuMXjTxhrQpzRpTA8kE5cvVXflHpVikOSk4V3poAP8LzLceIJFaNJjC1t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUhuSDZ2UEtFTjQ3VDF1WlJtdW5WZmFXUWdzNStDdzZvcklMNnM0Qklva05C?=
 =?utf-8?B?MG4xYWhIaUhnVUFUbXM5amlsQTFaSlJmekdjRThDeVVldjZROG9CUXVCaW1S?=
 =?utf-8?B?ZDVoTnFNbVY0dWNBTHNKQ1lvdkhBVjhTVzlZR3RGelhQVlBYRDhta2Fpc3My?=
 =?utf-8?B?Nmt5amQ1Q3FZZlpmaUhvK1dwQUQ3enV0czFWaVFoOGdnV3crKzRLWDE5UkYr?=
 =?utf-8?B?MHNxQUZIQnF6R0U5dUlYQjdCb3k4TTdtV2t4VXVtMkpGV2J2TjkxWTBaL1I5?=
 =?utf-8?B?ZVlNNE5uNm5TWEZQU3oxcWttTyt1ZzhIbUZEZWpQUmIzREthdGo3MXNzNjZK?=
 =?utf-8?B?dDM1NldTY3FqZWx6RDhzbDdYbHFrMUZ0L2JTb2U2TjVtZzdaUjlTd21KQXlC?=
 =?utf-8?B?N3hFQnBYd1gyZkhzUVZ6SGJiWVFpVklpendJcTVjMG5uZ0RZbWlvV2d3eVNs?=
 =?utf-8?B?Q3NIUEMyZUVCeThFWnpqQi81ZCs2NmpXa3dkcTR5N1ZrVytCZnFWZjZ1OWp0?=
 =?utf-8?B?ZjFYMkpDVnZVWWljNFVrekxtTGNUVWJRRXlXRWgzeFRaN1FFeDlSTVhpcjRF?=
 =?utf-8?B?NTV1Z25VMW96Z3RXVitRQTM1ZDBEMzVzOXgrNXJEdVBpUThIWjVNbEtaYTZ3?=
 =?utf-8?B?WlN0N1RmMjBiQm9LZUx6REwrTTBGNVVVZVVFS3AyM21pZUNLQXlkcGFRQW4v?=
 =?utf-8?B?aDU3SUxETVdKdjV0c3NHOTJ1NmI5YlRTU1BJelhxWFZnajNEQnIrWDBYTkVi?=
 =?utf-8?B?M1lNL2RYd20wa1AvTzJZcUsrV1cxc0ZFMXIwZmsyR2NjN3ZXb0s4aFMyZk9i?=
 =?utf-8?B?UnlKdjZNNFU2MnFBdDU4S1ZOLzBKT1dCWDRBYzE4QjdoeG1vc0t4SC92TG5P?=
 =?utf-8?B?dmFJL1ZNanFYWktHMmMrdFBicXNHemxjRmZwMGlPSWlzZnRPZG8rNldhQTJn?=
 =?utf-8?B?ckkwbU9GZExBTzN3Q1ZFaFVtaUViYVhMN2VjRGxFMFoxVldXL0QwMzltR2RV?=
 =?utf-8?B?cVBjbWxQVXhUMzZzdngyNVRROEZNVXRESVRXTzhlckdBRzRDeG5kWWljcVcw?=
 =?utf-8?B?UFAwN1BtY1UzRnBYVHN3SmdiRjBwcGRqKy9HSHQ1S2cxaTdiTzZkRFQ1clZr?=
 =?utf-8?B?bG1PWnllZnpPWkFvME5PbVJEVUhoVk8rMEZqeHlxT0RmNzFKUDl3Smg0RjFi?=
 =?utf-8?B?UzJwdjJZSytXZVZpTStsRm9qV1VkWTh2ejFOVmxmNDY3ZTRidnFLNG1pcTUx?=
 =?utf-8?B?LzFTbHVvSG41YTdzQ2tJM3lmMitSOEVqK3JBY2dSaklJY2tlcnBoOHJjMW9P?=
 =?utf-8?B?THJSaGdBQmtzNTAwYkJOWitjWnh6aFdhTjQ2Um1WQmk0U3lLTUhPZmgzYnh6?=
 =?utf-8?B?ZjdGbzNNTXJWbTI2V1lJR2xYSnUvQllzRVlFV3AzV1dxelFBaVErR1VoTG9F?=
 =?utf-8?B?M2o3alVOS0hWem9uaE95WVRpNzRqeXQ3S3JtZE9xWUtlYWtJWFdSdFJGUFI4?=
 =?utf-8?B?ZERCNlRTVGNWY2xjYWQzMHd0aWkvTEF3UCtTUlIyYXR4ODByUm5RRlVseWF5?=
 =?utf-8?B?M1djSkJjWWQ3ZmpWcUt4NEJoWHlUZlZtajR6bWVoTi9hQzR3SmZ4QjhicW9Y?=
 =?utf-8?B?d2ZFZ0IzWGt1YldsK1pYeExHRjRaNjdvRjdNT2loc01hM3Ara20wRTh3Wisw?=
 =?utf-8?B?V05rRUMyQ3RFYzBVMXQ3V3FyeEN6SlBnTUk3THdESlMzdDI3SUgycWlkQnhm?=
 =?utf-8?B?ZlNXTUZqWnk3TzIyUEVxbVF2dVhIMFdweVZTL2RnTjF3ZXdGM0swTG1zQ0c5?=
 =?utf-8?B?UXlwelFCK3FDS1ZadEJiY2VBYW9wRlVBbi8wdGk0WHVlV25TTzR3ZEJvQ0Yw?=
 =?utf-8?B?OFZqNDNicVFLWWpyeDA3M0hMdDdQS3Rjemc0K0x0c1IxdUFXT3B3ZWd2U3M4?=
 =?utf-8?B?amV5amJ2YmZYdzh6d2FWQWdFZG9PRDRuaWlwV3JYc21MZ1RaMk5xQWpoMnZX?=
 =?utf-8?B?LzJFeGY5QUl4SU4zQVF0TUdNblMrbXVpQnIzVTVCckxldTd0YXNGeVVON2ln?=
 =?utf-8?B?Wm11V2RKcm01dDJMdnBEckJldFJzY0xJVE9YV3FqYTdOemRTc2xUaGJDWHpr?=
 =?utf-8?B?VFA4Z3B1T3A5QjZXN1o2RExGdVNGdjlXeUcwWWpyclZTK1ZvdHVxbkdnZ2Nt?=
 =?utf-8?B?bFQ1TnBOTnRodTRGejQrcHI0cWRBYWl1NjFDZHdxOG96NlNuY1UyVm9pMGNo?=
 =?utf-8?B?UlFvQTlXYjBTbWZWZTlRZUdxZjlNaGg0NXhQRU1ITlFhbU1qU0REdkxndTBC?=
 =?utf-8?Q?E6fSOk2flslQD2qI63?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013bc0de-ddb1-4cd8-ad54-08deaa38964a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:15.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjMNlGawlrMApZhsDcDgfBwdHYm/HLDVUt/ALYde9zZb6FHz36DaKvT8oKE3ZObugacxQq0IXXDe5hFe4HPyWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: 7F8E14C50A2
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
	TAGGED_FROM(0.00)[bounces-36104-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]

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
change in v6:
- remove cur sel logic and depend on mux_state_select() since AI review
find a problem
https://sashiko.dev/#/patchset/20260327-pinctrl-mux-v5-0-d4aec9d62c62%40nxp.com

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
 drivers/pinctrl/pinctrl-generic-mux.c | 185 ++++++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f4268dbd2f94a0ffecbbc4d89df20..31d698fbaa01d5fd20b4ba7c352df7c5f8b3c686 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -272,6 +272,15 @@ config PINCTRL_GEMINI
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
index 0000000000000000000000000000000000000000..c706468289fa179d28eca854a8818b3bf1bc5b0a
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -0,0 +1,185 @@
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
+				     0, &np_config->name, NULL, 0);
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
+	ret = mux_state_select(func->mux_state);
+	if (ret)
+		return ret;
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


