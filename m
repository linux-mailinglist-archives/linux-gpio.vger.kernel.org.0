Return-Path: <linux-gpio+bounces-31692-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ONgAVjzkWn6oQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31692-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 17:24:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823713F17C
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 17:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A60DB3008E0C
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 16:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E464A23D7C2;
	Sun, 15 Feb 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="D2yqtwdK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858821257F;
	Sun, 15 Feb 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771172690; cv=fail; b=UPAbesKsfJFBlV1x/ovYCg47GxkMBRKl7RUSgGdt6vw4F/iVsrVtIo19SwLjbNFg4TUbuPtERKvfkQoWgATI4Fi+6Jc0wpAdo5dJqqtG5PGeK9kSfbqLNDdRewjZPWwODJ9l0QyB4m3Bxh7bz9oKGSJkxZ6OxYRrSdTn6biaows=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771172690; c=relaxed/simple;
	bh=yf6pOc6VPM6FoE+LbkOiJ+NR2MFvwHDS01aEaaSgpP4=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=haN3+NgET8+BLlXgmtrHLj3NxGSaUSUWHkxfVKGSls7TM+NWJYlbecyHQSCTW5BLbAyWMCtBUhCo0fblRhUyCHuUXhtcxkBlGdcuDB1TJ6T87I4pbaGyXo1Xn517uxTwx+qLTU/yVKO2zocRMsMlIj7Lw4i39i7qTmBHCUQmrVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D2yqtwdK; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONEIe3p1nJdV11CQ4Vv6noHJX3e4qNxIByalJ+f+QvWoOlZ8clbCIGYuhncFiMqozITQiB8bD+9wp4f+LtKr5nPqpAjZa3f3+opOyrlRH3/404aHoKClz01ctGBM4Y44BZkEeuZkVkQ81OYQmVe1ZNzYVCJ6WNJomXE04yCEfJan34gPZo7vGT8aNo/JdZc0l8VS+c+c6qbG4If/cCBLffpwYA37C0WZv9c9g0hmId7wiTgK/Wfcu/k+5QTUnQ7Kr5K+PXED18V0Piub9zHL/MPSY0DMD+xvIDFX08IPgXCASbcTIfDmPYLWgwwQmbZ0FjoOi4QnJOF34MaZxxFyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf6pOc6VPM6FoE+LbkOiJ+NR2MFvwHDS01aEaaSgpP4=;
 b=Z/Vxgk9sVBB/1lmlWrxixE6I1ByZv/U7KrxuwUgUh2zZWCtq4n1E8LgTKWqTXWIyUfj3EyHGUYFfotT7q+ovR75rf6JP3SKUOvlq39hOanleZgFRY+CNjXW7D3KZqREog10SDMFxXItsGk/QeNfmput9Sw/vDw9dsEtH5pKB/DXZ24VA5GCvDtVMifs2tz4pKlXwD4zGWd0uaF2r5w+IKQ0wrZQ/Rm0IBr0Ewfy4ROCYlowTYU2d3jxQsZWVBVTEzmBJqMkwioeXm1eCA9nBnkq7mk6TfD7h5TaIJBHdtbHo3x+EnIfvGtQApJ1EZR9ue1vlUwEpS2gqSrcqBelaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf6pOc6VPM6FoE+LbkOiJ+NR2MFvwHDS01aEaaSgpP4=;
 b=D2yqtwdKaSsSAqsDCGMPwpitFDVYD8gV0a72WK/FodqriJfR2iSIE10uHxdlzQ+SmCYu0oI9l+dgAQiOTIp9L0Q7Nt3OHMD9pY7exvpViWNTJU1/wseEfcOqgpD6zxMFH26q0cPks3aJhNv5uYXAfLQljrKLtlWy0YY3ogN/uxbkbSRULQa8rQnN+s/KLHqvlSM1i97mV9PczC116Wb1xX0t5EeK5mCLnhBS4iGmgPE2d+nO1ewgdUsXUGCWavIHsIsI3lJ6M5D38a8Mn9gPHAtAVor+RLQqEds0Vc3HoSWiWJjT0lEDT03eb+WZRuCI/KuJpOCEr94GO8bSnD3pfg==
Received: from DU2PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:10:2b0::28)
 by DU0PR10MB5749.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sun, 15 Feb
 2026 16:24:45 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::4f) by DU2PR04CA0173.outlook.office365.com
 (2603:10a6:10:2b0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.15 via Frontend Transport; Sun,
 15 Feb 2026 16:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sun, 15 Feb 2026 16:24:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sun, 15 Feb
 2026 17:26:28 +0100
Received: from [192.168.8.15] (10.252.3.215) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sun, 15 Feb
 2026 17:24:43 +0100
Message-ID: <57cdc887db63f34c7058836c4d806bba6068a2ee.camel@foss.st.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Fix memory leak in
 pinconf_generic_parse_dt_config()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Felix Gu <ustc.gu@gmail.com>, Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Sun, 15 Feb 2026 17:24:39 +0100
In-Reply-To: <20260214-pinconf-v1-1-e515d35a153b@gmail.com>
References: <20260214-pinconf-v1-1-e515d35a153b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DU0PR10MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: ce793154-0a34-4328-c47b-08de6caebad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3d3VlMzd1BXU0dQQ3gyb1JpRENuaElza0ZZTTBWbWtCbVNaRGEyNWxYTGlT?=
 =?utf-8?B?eEN4NkFHSkFIbW1tWWFwWVlYbGYzamRDNjJXcG5wN2d2UlN3TE9NQ0c2WVNS?=
 =?utf-8?B?ZDlmZE8wajVlZEdqeVRkNW92aUVFUVZnY3RYTEtWU0NtL29TVDRjRlFiWFZ6?=
 =?utf-8?B?VnlPWDRYTzRPdmlOTEQ0TU9oNXdvbldxaFNaN3RpSHJOd3k3clR5bWd6dmsv?=
 =?utf-8?B?eU5SekZNRmY3ZDNNUHd1cWRZZEpxa1JlVnR1WTRjL1pGYjRTa3NJaVk5cUwz?=
 =?utf-8?B?ZTd1MURINFQxTE11VUxxNVFUZmcveWhTc2x4M0hQOUpVcG5uaUlNS3pGQys2?=
 =?utf-8?B?NE5VSktGYmlVdXZmY2xpYk5VUWdvM3d6U3ZKUys3TGVOdkEvSkpCT2dTUmEw?=
 =?utf-8?B?OUdYV0lRMURoZFNCY3lGcW1yNEZuTjBKQjRwQTRPMC9FMlpPRmhwTHdWN0Rt?=
 =?utf-8?B?VUR5VkR1R0xuZ09FczFLUUdyVUNBVTVJREJHT3A4aVU2RTRnVE0vU2REWEMr?=
 =?utf-8?B?bmtIcHQwNFo2WUhtc01SLzduRzZEL1pYUHFWeFZHaGR4dkxFNVJZUi9jN1dE?=
 =?utf-8?B?WmhRYnQ0bXRIZWgvNXNMeHE1UEV6TGJ1ZUFCM0drbjlucEU0MTJCOU1KM3lu?=
 =?utf-8?B?NTZoS2RWUnJNbCtzY2VEbmc1TXFlWkg5cEtxNHhFRGpab213STdjaGl4eFNO?=
 =?utf-8?B?NUttSkRUM3ZnbmsxNW9abEZWTzZiWkV0bHZiUUQ0bHd2NVNjci8xYTh4QnY5?=
 =?utf-8?B?YVFYY3pyc3VZWExOYnZCc3gvTlJGSm1CTjZncithQUZYVEdNUlZFMGhJUDZG?=
 =?utf-8?B?bTVKZTJlTS92TXUwaE1qZC9Fck5XdjNwRXVsVEVjb2w5bXRRczBJU0dkcC9r?=
 =?utf-8?B?WXdKcXRvZjVsOTd3UUdYTVROR05UckJoUXpPNzdRV2FHSUZWaDh1bi9IN1N5?=
 =?utf-8?B?ZWZvazZLTE9hbTNBL2dRM2kySThzM1g4YndJaUF3Z25RR3ljYmlnVGN4c29H?=
 =?utf-8?B?dlZuTjRpVVdseGFrL2FaOFFwd1hoMUVUOHBXb2J1MDV4UENBMk9yWm1NMEhk?=
 =?utf-8?B?a0pLdnpUSjBPMU9sK25hQ3FEQjgzNEFDVnFiQzJoWEpobjdsaS9nZzh3WitP?=
 =?utf-8?B?ckpIejhKSnFPenlLUE5XaDMyMXk0S1dhWjZCNy9zUng4NWNBT1FDMDJxK2JS?=
 =?utf-8?B?UzNBRzVDazNoRWxSRlN0WThxYnNiNVZFWkFQdEkxRDNLZ3E1TTFhY29tOUU2?=
 =?utf-8?B?ejdrV2J2b1NhTWt1VFpFSkxVTytKR0VSOEpTbEdVV3ZSd1o2TVlxcUVNRDNo?=
 =?utf-8?B?TnIzeDFGbWp3VHJ6Mk5UemVqL3ZqeDJ0czBjWDRmWUkvaFlRd2NFVnZ2Tkg3?=
 =?utf-8?B?VWpheno5YSsrQUkxajJnc2lQSUUwYzZNdmdKbGNEN2xuUkdxcFc2S09hTnpj?=
 =?utf-8?B?WjdlNWNQK1FJWTRXdnhsVERUTE5mYjVYQUdVcEVVcEUrQmtLMjBEVzBnSzdN?=
 =?utf-8?B?RlRyd1JSS2dGOWtyZElFbXFLSHkrUGJoTzd1eVpHVG9VMFFMZW9sOFBsWHFU?=
 =?utf-8?B?aTlkV1ltZDNSck1zU05uRjlUckdKUVJYdjF1cHQ2RU14OGpxZGUwMDNiMjZv?=
 =?utf-8?B?Y1lXaEpMQkttTy9LeTdUZWZxS2pHbW94NmRBT3RRSkplWkVTVXM2bEVtTkRS?=
 =?utf-8?B?dUVnQ0t4TUQ0U0JFNDA4NkdEdno4cklBU3YybUVKanJZUGRIbzVoY1dQc0VL?=
 =?utf-8?B?WXl5b2U0Z1BFWDFqUjNyQWtvc3FlSnVpVThwc1VNZ25zYmMrK1cxOXY1RmtH?=
 =?utf-8?B?N28ySXkxVVk2NCtBbm5yNEwxU1NZbEUvOWI0K3l6bzQycmlNWDlMMGk1eFRy?=
 =?utf-8?B?S2FFb1hOeG9MdDlNMFM1VVZjLzdIbklLdTVVSS90YmMwYXd3cU1tN3o3RmQ4?=
 =?utf-8?B?ZENkZnlhbGxjR2s2MXIwUUt6R3NoYnlTeVhRekNjZmVrQk0xOXZ2a250WEpn?=
 =?utf-8?B?Ylp3VlBMNkNvZ1dOSWo5Y2hnQ3lDS3lJbUNWR0FyaFQ4Z1NubHA4cjFUWmFG?=
 =?utf-8?B?bGM4RWkyeGFRTFV2L2pKZ0haeVU0UVl5WWRNQTFOR2lXWkhGSW02K1JDcXph?=
 =?utf-8?B?OXI4bEE2aUR1clJUK0d5Ri9sbmtINVNMck5OQVJxQm1Ea2xrcXlVM1p6Y0JW?=
 =?utf-8?B?bXNiclUxdG9QcU5KdGpNd1VORWpFTVNDZTFDYzh2OVBZWlZSVU1kbGxHZmJY?=
 =?utf-8?B?SDNmSjM4QWJ0T21Fb0tTdU9BVGtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TMBoG0nun6yLdjjxE3TX8GJJQht+qULq/HFsAILRsD5OWzKdXYwX5x17RDEmKKQnbv1HvMX2KiJJyjN38RdLVTOy0q4B1zQBfY6wSgp8RCGwggo8U1U2Fp0S5liQX9c8S6RIYxO53ef3f0NZthy3vc3XSgOqAqi9RmOV6Q2Rj0VqWDepq27uRjfI8bfzdoix5B6VwVu+C0BKH78AdEKnmy4xS9KEsUvr1Zk5HZPkUf3YI24jXqB7B1bc589smjnHQBpR22AeXirmOAAhL2qwDvNQuNo6otl8gT9pYmGtjjz7Slj0kdWFbjQM/rSuf1C6dxPLLgWbRuQF4xtxBwLYPNs4vhHyBueflzd8YxCF4EjhBBiT0HJQcFKEPJzW126j3JjxWjHht1D5VP3t5neBduzBZUmwHqP9OEVQn6nIgukvBgX9X/kee18GVTb7K2u9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 16:24:44.6940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce793154-0a34-4328-c47b-08de6caebad9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31692-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4823713F17C
X-Rspamd-Action: no action

T24gU2F0LCAyMDI2LTAyLTE0IGF0IDIzOjE0ICswODAwLCBGZWxpeCBHdSB3cm90ZToKPiBJbiBw
aW5jb25mX2dlbmVyaWNfcGFyc2VfZHRfY29uZmlnKCksIGlmIHBhcnNlX2R0X2NmZygpIGZhaWxz
LCBpdCByZXR1cm5zCj4gZGlyZWN0bHkuIFRoaXMgYnlwYXNzZXMgdGhlIGNsZWFudXAgbG9naWMg
YW5kIHJlc3VsdHMgaW4gYSBtZW1vcnkgbGVhayBvZgo+IHRoZSBjZmcgYnVmZmVyLgo+IAo+IEZp
eCB0aGlzIGJ5IGp1bXBpbmcgdG8gdGhlIG91dCBsYWJlbCBvbiBmYWlsdXJlLCBlbnN1cmluZyBr
ZnJlZShjZmcpIGlzCj4gY2FsbGVkIGJlZm9yZSByZXR1cm5pbmcuCj4gCj4gRml4ZXM6IDkwYTE4
YzUxMjg4NCAoInBpbmN0cmw6IHBpbmNvbmYtZ2VuZXJpYzogSGFuZGxlIHN0cmluZyB2YWx1ZXMg
Zm9yIGdlbmVyaWMgcHJvcGVydGllcyIpCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggR3UgPHVzdGMu
Z3VAZ21haWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9waW5jdHJsL3BpbmNvbmYtZ2VuZXJpYy5j
IHwgNCArKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmMg
Yi9kcml2ZXJzL3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmMKPiBpbmRleCA5NGIxZDA1NzE5N2Mu
LjJiMDMwYmQwZTZhZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcGluY29uZi1nZW5l
cmljLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmMKPiBAQCAtMzUx
LDEzICszNTEsMTMgQEAgaW50IHBpbmNvbmZfZ2VuZXJpY19wYXJzZV9kdF9jb25maWcoc3RydWN0
IGRldmljZV9ub2RlICpucCwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwYXJzZV9kdF9j
ZmcobnAsIGR0X3BhcmFtcywgQVJSQVlfU0laRShkdF9wYXJhbXMpLCBjZmcsICZuY2ZnKTsKPiDC
oMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIHJldDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChwY3RsZGV2ICYmIHBjdGxkZXYtPmRlc2MtPm51bV9jdXN0b21f
cGFyYW1zICYmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY3RsZGV2LT5kZXNj
LT5jdXN0b21fcGFyYW1zKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQg
PSBwYXJzZV9kdF9jZmcobnAsIHBjdGxkZXYtPmRlc2MtPmN1c3RvbV9wYXJhbXMsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGN0bGRldi0+ZGVzYy0+bnVtX2N1c3RvbV9wYXJhbXMsIGNmZywgJm5jZmcpOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qIG5vIGNvbmZpZ3MgZm91bmQgYXQgYWxs
ICovCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IDYzNWM0NjdjYzE0ZWJkZmZhYjNmNzc2MTAyMTdj
MWRhY2FmODhlOGMKPiBjaGFuZ2UtaWQ6IDIwMjYwMjE0LXBpbmNvbmYtY2JjMWUzMTA4OGZmCj4g
Cj4gQmVzdCByZWdhcmRzLAoKUmV2aWV3ZWQtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJv
cm5lb0Bmb3NzLnN0LmNvbT4KClRoYW5rcyEKQW50b25pbwoK


