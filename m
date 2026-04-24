Return-Path: <linux-gpio+bounces-35450-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAVLIjzK6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35450-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C131458D83
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0F4E3020FE3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70F12773DA;
	Fri, 24 Apr 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xdVtIpRn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1F1277C96;
	Fri, 24 Apr 2026 01:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994808; cv=fail; b=Wiw1BnBY9BflVY2cZki6+1WB1exWA/cuKKurrMkKNF7ljPDzZzYY/7K1d1aGJupcIpToRJDmtN/9I8MrJ0Q6rtA5gkUjOX390z691YLTNCzmO2C+WG5eO+Q2hkdkUWzWNLahoLzglLbM6xi/LFFsyU76ClQNFOQEV2a6nVPKeZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994808; c=relaxed/simple;
	bh=BYLUvPpfzaIBNeRQovwvRJKp2H9g8OyEni8+ktXRgvs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OShKb0TNwL2vOUfyWJb6BhgainWZ0xc8RsL26ZQrN3ebuEyZSCAvRu7SjhKnbHB/skAEnRb+tkHtQw5Xm+dVLsh1GapP0K96KktEZbEJSojeMZJZYD7yAclAzx3F6Gb4wgy49Pf8qTGeTDl27Pvg3QXkzp/TxI0FMn5rit9hMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xdVtIpRn; arc=fail smtp.client-ip=52.101.72.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn1Ci4ukIUrW0Dm3gp5EykA/Q/6HxaLBXpeNjSLP91kqmmAu+GWJ7Lg8XQSCVrLAj+AB6VvhGzKC6RivKwytv6xKhXYD6hFr/8TTZHMRLbRY8We911laf38xJJA+SpbSR7s7ywT+SUZvvPJmoYaaNVUvZS0UnxJmBFObnqUyUVT7UbbphqxefqdSxcLuQr+g4yDuEA6ABpwT1gKfOGd/CAYeEBIRTw2WqIVRM0nQhte2gk1Qaa7Gks6ZV2yY7hK7DopZ1OFJxNosmr4vyjyG39gjVgfj0AqJu0UkKXarRgiiPrHknTa0m+upLYYYnwC3E4IGYpR02CjYwdFJ3tHW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62f+Qx0wlmDEkQvxsskjpFYSF7HYxHmyfReCsejF4Rc=;
 b=YwoBqixEz/6QL9GTjwKBp+ZzwKwEPvGVfXg60nTEjWc+nPiPWppFhqA0r34YkOx/0VKYIXqj0HxdpKcwI2wPUDE8cpASpHZCuI1xDZUfjo4/99miCksrHgG5w9fxVfeN1gikh3ef5oMRttM6CrT4J0CJ2MXuUij8hHJgIjU33TRoW4H8vzVjwX7IPlVLxQB+Edr/K4F+Ok49tw/T4RuLrlz+Vh2YB9AU8mItZx+SlYZOtI6Bb6XoOyDwMnwnh1eISYodSLPd94F5dUF52oootBTnKa5yft/EWU1GoywLV2wLWXy8ljaPttAjWoVhH8cYIY1/XGWC5Fyjm18AenG4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62f+Qx0wlmDEkQvxsskjpFYSF7HYxHmyfReCsejF4Rc=;
 b=xdVtIpRnCQmD7yJdbk+L+nq7eENdHD7FQbZvQBYpRNliNPod0y77f4vFUt4ZoeN4zTLs4H48kGdXg+0YTno3AulAvT1GAarDyHGzB5+MBxY4YIQYKTnYX3Ro/kBnmnVzugUOLLQpSxPA0HrG4nfIlVKVGkUpy/5lt1B/eKkU7N4mlVypJLI5R4bRznvxBkJDOoWjS2jrnctGSpQt2Jwrp6AuIck+8VI/gLXrYWXJAHDibk00MMVneflcFYZnpt8PPw8DZQ5AlAM16E7wutIgRcfYrrp274qvQWdqRvYag5TqEp06rlpXzYKtKvwxKY8nRZ7pt76oft1vwMznypqncw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:40:03 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:40:03 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 09:42:25 +0800
Subject: [PATCH v6 2/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ds90ub953-v6-2-7a84efbab316@oss.nxp.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994953; l=3804;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=gje9vH51hA/z/uPiO/U0Y8u7/GSL19gAMVItmcpKXyk=;
 b=q43dFBgNL4z/+VXHauQ9fUK8YnfNzkB9mxBz9RpCxdOv7i+f6tGklJiSgUT4AKbqjG+Ahf+V4
 WsyiVBodJJ0AGUVp7SjS7ueWGhty8eFzescrFZw6Okm6v3MVuNtxol+
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: bab77a13-dd2c-46d9-e6e0-08dea1a267d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	YoJI5KE5RITuPs+mO9YhtZlRw6zc/D7kUppwBUhqgBR87zxfgDJZY3V4Mxz7bQY6HV7KxVL3epBZJNgHWNH1x3df4HHZDcmmPBtlWE2iTchdWvgOa1D3+epSyoiyaCOJUE8M0ERtLXpO9m5D1SbXPLVwah/4x5A0DL7h+ZX0lJGrHSKcnCMxkkSKIUfprTHuD7uqFmVmLHb10V9rk0c0H3jAaJbF2A8L1Y7lq/Tzda7PnO6QylTI9FeDUrAFYjX16oh4oo49S9eccXpMjHTGtG/XA6MZpWSmADpIYsuLAxYht8P8kE4Wl3wwqAEfyW6tDb69/LT+uSEhzfyGR7SZeg942hRjKXic6pYvagm4J4CoIHXEM71SVZChPZVpoe5hkWOTME8N89M1ScaY9EAT9Pt8GG8W0GXw8xmVv6klHGUzDh5P2UcV7lcqKVBhcHJMkYgoSo4p/B+O7+Tb/ao4lU+7vFofAWJsW5cg6CRBPQODXOgcI3TgbrWApzsJfxE+uL1V41qPgpb/V5nZHLwogtw+r30N7kY3QyyoPgiWtOIkwgGvFy0nRPHEmwYVNJY74ZbxXh7hVJPY7FvBsun2AkAwLnTg24uIKZbW4jFH3un93NgOet4QEmMl7Scfp2HEbtWPlf3ZKRQg9xjaz2+iYfLcEnxrt5dKlUO8XT36wYSxmysx9HOIKleYV/b3PAjPdKNlaSN+sdJwUg2Cv0t0T9xfhfUXLXL2ajvDXNa2j/WbU0q5u9fqKULKnuiYtzNocxFKzfrka6IzkkMnJaFScmfWFWZoFKQNL8VQZS/7gz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STYrK2NtazhSVjl1ZzRIMS9CcHVVRU9ySTM4RU9tbEF5bG5FNmM5TDhZT3Vz?=
 =?utf-8?B?R0ZzeEU3Q3RSQ0orTTBYRzRWMGVVNUxJbVlFay9TRG80OTJocGRBQlFTTDRR?=
 =?utf-8?B?MmdOSWhxWWFSV0wwYjdlYzFHbDBYTTh1bkRrM2VwNFBFYXdpUUhwdGRnUTV0?=
 =?utf-8?B?TSt6bEduUGgyZmtVdHJWNjFQbkpXeTFQWm43Y3JtUlpGcEFsLy9OWnpqOGMw?=
 =?utf-8?B?ZEJjdUxlQmREN3luNDg0U2prdzFNS3pPdHovd0IxRUg1eG5UTGNuQmx1NmE5?=
 =?utf-8?B?MmlESXhoalVzZm1ITWJveDZJa1JCRUt6TUZCYnkzc0NSZ0tCNFR2K1h0R3kz?=
 =?utf-8?B?VkdCeHNWbUhoTTArQlFoa1dRYlk5eUJMUmpzYmZwRTE4TVRjcmltYjRPOWt6?=
 =?utf-8?B?a3VVd3lOWEdGZnlNMnZodllOTFV0ZGxPbEQ5cnJITWE3T242QmNxN3ZhZEEw?=
 =?utf-8?B?cVBJN3ZmcE83bWI1Znp4dlpDTWl4UHF0c2daVDA1ZVowZEdkMXJ6UjZOVnhw?=
 =?utf-8?B?ek1zMm5aZ21DY3crV05ZcTV5RzUxMGZrL3FHMFZNYVFvaUhqWi85b3ZLYWV3?=
 =?utf-8?B?ODFFUVhBN0tldllMRU9yaW95T3BBYjR3a2pMNHNGWHpNVTdLTW5SNDk2QTFF?=
 =?utf-8?B?UEcwNEtFb3Z0ODY3Qys3ZVIzcHNvek9OSEt2a3B4cmFySGJjcklEUnBBMUtW?=
 =?utf-8?B?NitPVGU0dmdXYlhCY1BSb1k0RGxLRjdxUHpyMjdyKzhRMjF1VTlSTmJ3d21l?=
 =?utf-8?B?eCtGanhwQlVYSWlndDEzWVZZTjVUTGJFQWhvRHNBMkJrdnB5eFpCcEdLUHJY?=
 =?utf-8?B?NjBqK2R0Rjd3dnhrM3VxTEVVa0NHK2NtcUdIMnJpWjVLR3hqS0phQzRILzRX?=
 =?utf-8?B?OHZuUGNDTloxR3U4QWN1RFAwUDkzSStpMmNqTzBac1ZDN2w4Z0NpM2U0Rktm?=
 =?utf-8?B?L2FTQzRJN2lrVk1NcU1uQkRmQjBBQ3lheWJ5Z1V6WkVDUzFQOGFUN3VSRTVQ?=
 =?utf-8?B?MmsrVm5KZlB1TlBZYzIvUmVHY2RFSUNNYURxZGRSYUw2dFBLeE1FUTVPaHdi?=
 =?utf-8?B?ckNpR1VqWEwyc21YckdhWUpWQnNRMlVOOW9kVTZrd3JYWGlJZmxEVFZjaFdj?=
 =?utf-8?B?WjVXdUxUemRpU25DNFVaQ1E5Nm5lcGRQendjemNMakNBUW1KeVlYcnAweVlT?=
 =?utf-8?B?VmZ2QTVMcGg2V0dZcTlYcXNqVXo2K3hLYlozc1VqcXc4SnNoOFlYZitIdHNI?=
 =?utf-8?B?OGdrSC9ZN2Q0YWtTQzVsVW1aOXkwMWwyc081Q2RhVXYxVHloejR4WHFzTDBa?=
 =?utf-8?B?dmVQYXdzTmNEY09naGRjaGYzWDIySFJXb0dQTENQTlVMTWNWUDA4cVI3Z3Zi?=
 =?utf-8?B?cW90RWNYMGNodnA0M3RDenFTRTFXcWZHVkhDK1VsaTNJUVJjb3pLbUJCakJ3?=
 =?utf-8?B?Mmpka1pCbEhRZ09lYXVtUDhsVmFGdUZOa2F1RDRiYW40NERCV1lDeXZsSVMx?=
 =?utf-8?B?eWVLcThZa0hSMDNoYmhGcmZqcGczNTZlaFY4M2dlTG4xRkRlNzRpV2RCWkZx?=
 =?utf-8?B?ekgreUhFcit6Qkt0R09teDE3VVAzNlJxUnBzME0zWS9Za0NuK2RUYzVyWVF5?=
 =?utf-8?B?NFRGZzB0czJIWTVoTXp5THA0bU1jQnZCZzI3N0N1Q0cweFFYQjJuZkNJNzZE?=
 =?utf-8?B?WHptRmVsRE0vMjh6dy9mNkFTWVdBaFdoVjJCZFRXbDExTldMdXZkaGlsbTdt?=
 =?utf-8?B?aWxwU1cybVVWMHY3a3ZXNmp0L01WTS81L1kyOSsrMElCYURFT2ZLb1ljRkI0?=
 =?utf-8?B?eExWV2dGQTg4M3JYaE1rRTMwSXdpUkJWWVdFa3h2QUY0WGthWFh1TUpwSGJw?=
 =?utf-8?B?Y1NSNkdDNVEwcDFCTk9OR3ZOazBKQlJjei9jeXFVZDl0VFdJQUFNbFZYMEJk?=
 =?utf-8?B?bmlVMzQrSmRWczczK3lxRTN2dE44Umd0WlQ0SFlHN0doWGJ3K1ltSU9BaXEr?=
 =?utf-8?B?VDZLL1BrYTQ0a205bDZuV25HMGhCNi8wVFpXcnRoaGtaTzFyVVBLb2tUMFNz?=
 =?utf-8?B?TzhubThNRGJQd0FVbHptamcwYzZoOUc5cWIwZzUvT1FHNytPM3FWTitLaGwr?=
 =?utf-8?B?UldSK1A2Z1ZSY3poSUdJZnZtelh4YXBJRTd6QTAreUcrakFlTW5SQTlaVVpu?=
 =?utf-8?B?UzFZeks5aVNVNHdvd1NiZ3V2ZkEreVRYTThRTmltRU13UHRhWHlrb1BtMkdk?=
 =?utf-8?B?Z0RJeXp1bFVENmlKRlAvSXY3eHdLQmxLZHpxRko5aTZWaDlLWUwvUldpM3Jx?=
 =?utf-8?B?S05GNjVielYvVFo3UFQ1SWxFcnVuTVdNUVF6c2FGMFo3dm53Rjd6Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab77a13-dd2c-46d9-e6e0-08dea1a267d2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:40:03.3080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmIhQoQ4WuKgMIk4JK4Cwm4T6A3rLYlZOLdWp43aiEQ7KI/Sq+bX8veuy6f2F0t9yBsDfjwiDOHenlyJJtw4jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: 4C131458D83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35450-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Add back channel GPIO support by parsing flags from device tree.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Changed approach from extending GPIO range (v5) to using a custom GPIO
  flag (GPIO_DATA_SOURCE_REMOTE) as suggested by the driver maintainer

Changes in v4:
- Only log GPIO 0-3 stats since remote GPIO 4-7 reuse GPIO 0-3 pins.

Changes in v3:
- Update driver to expand GPIO range.

Changes in v2:
- Parse gpio third cell to select which GPIO pin the data from remote
  compatible deserializer.
---
 drivers/media/i2c/ds90ub953.c | 51 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a8ab67f4137f..da63dcfbbbc3 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -27,6 +27,8 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "ds90ub953.h"
 
 #define UB953_PAD_SINK			0
@@ -71,6 +73,7 @@ struct ub953_data {
 	bool			non_continous_clk;
 
 	struct gpio_chip	gpio_chip;
+	u32			gpio_flags[UB953_NUM_GPIOS];
 
 	struct v4l2_subdev	sd;
 	struct media_pad	pads[2];
@@ -258,6 +261,12 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 /*
  * GPIO chip
  */
+
+static inline bool ub953_gpio_is_remote(unsigned int flag)
+{
+	return !!(flag & GPIO_DATA_SOURCE_REMOTE);
+}
+
 static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
@@ -288,13 +297,23 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	bool is_remote = ub953_gpio_is_remote(priv->gpio_flags[offset]);
+	unsigned int mask, val;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-					 0);
+	mask = UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) |
+	       UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset);
 
+	if (is_remote) {
+		/* Enable remote deserializer GPIO data on local GPIO */
+		val = UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset);
+	} else {
+		/* Set output value on local GPIO and disable remote mode */
+		val = value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0;
+	}
+
+	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				 mask, val);
 	if (ret)
 		return ret;
 
@@ -330,10 +349,30 @@ static int ub953_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
+	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+	u32 pin;
+
+	if (WARN_ON(gc->of_gpio_n_cells < 2))
+		return -EINVAL;
+
+	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
+		return -EINVAL;
+
+	pin = gpiospec->args[0];
+	if (pin >= UB953_NUM_GPIOS) {
+		dev_err(dev, "Invalid GPIO pin number: %u\n", pin);
+		return -EINVAL;
+	}
+
+	/* Store GPIO flags for each pin */
+	priv->gpio_flags[pin] = gpiospec->args[1];
+
+	/* Return standard flags to GPIO core */
 	if (flags)
-		*flags = gpiospec->args[1];
+		*flags = gpiospec->args[1] & ~GPIO_DATA_SOURCE_REMOTE;
 
-	return gpiospec->args[0];
+	return pin;
 }
 
 static int ub953_gpiochip_probe(struct ub953_data *priv)

-- 
2.34.1


