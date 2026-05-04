Return-Path: <linux-gpio+bounces-36106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN87AeQy+WkG6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:59:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9C4C50BD
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 01:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B0EA308F720
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 23:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDA63FFAD8;
	Mon,  4 May 2026 23:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lEDLAIij"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECEB3FFAD1;
	Mon,  4 May 2026 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938927; cv=fail; b=C+TsOoXbKH9pqyF/YelYpL6/0lfhqWnoi5U8+C1jZlzI1jXUw0IL5Hlk79nn993/8pt8N6JTI7kGdHpcQ/FRIe5LYuCmizEAYsQCz00CqROQFqtjCvCs8048fXiGjlg2Ymj9gxNPaxM3fxY0cpzvuNKTi/xaLhGQYpsEDz8/MaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938927; c=relaxed/simple;
	bh=/kyklcSI+gOd/Hh7lXY0LYceKPsLYQDEebCDow7nXsQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ia6Bm3xW5iQAeyEdrq3bDZEme9+zT7zh4i+OtT4WQ+CYsxxUwtrVSi0CufJYiyXi4YuJnndQgI04ARnV6lJW2ScqfVQEgKk77xgZ7TACHS+gJ9yBnFQ1UvbxTCFdcV9x1ZEls8sgaNJEul4PG/CeMbNTCbFk2IPnxyCXoRWgDvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lEDLAIij; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6FBSmHTV0fIbKQQOafGFum2c97tuAqmOZWIpcVssiomgJqeIZ5PYm1/jgHvacQOWsKP9vEfFhZ79K/t7d01MQrqFNKaekKAQ9otC6+6tmVlBtJbVXh9nAZVZuYTDf7M1UlRHf1pLQGS1se2zCEf02VlntvFK80ysNCtmWfUd0rEBakxpkSaxy5ufl6t4ci6iaN2VY8OpczV0fvEcw7jDN9+PiVs3sY5cXbjcxQmUwtJPgTfodx9fghrTwx9AushZsX4d8p0b7E6HNP7oY6CizWZGz/VVZSGDZzmZ1lz5V9W7RUjqfBQ+As72UhYgZ+Vlw25QQbxN3sEuPtdn2NrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSt5qJDUDUls7ETfnAHXOm8F053HWeBTgn0KAKJtvzo=;
 b=PuF9iIhwGK1AmXgVtpNlyd5nexiyp6oMJ5OzrOdwdygDCFJWVMw1ZFgGgt8JaODrJRq80mVv49gXlys1X6pKrUe3E5+a0yzoh12WOmeFNogmuwpK5yb/1u93fPs2y2Au984vfejub72fCQVpGFdk8Xg+4PGOxeD3mLvG8KZPosYXh+R2w8Ss+UeVeCON1g2Q6hdH+0+7e9E7aEZLPsICGX3tYCNp1i0yIScI10V541A8xQL7aIleJ9JVvsgg1dlEaitRMpeOV+AbnxCktYtkgtONfgDzmJFJBZJo7nNe2suzA0RnF8qCcyVAchzmtcQcaTAXFXsKXJoG9Pc4Yk9Kzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSt5qJDUDUls7ETfnAHXOm8F053HWeBTgn0KAKJtvzo=;
 b=lEDLAIij88zJF/ZipsWC+f2B/+HmaRxnM9g9DRrvkCXL/qgJjNy4hL92LgV1LhRAuCdTPXp+vLzFCCiyA7AFFYFMTVesgALejS5JNqfYa/E/Pvcncpjm7mTplv63f2YyjuiMihw4UDgeM0tKkeKV0qyuktGujjHJ8+wI1CAA5VwO/e8Xg1gz2QO45/LW5fugP2zdCOfQaYOLVWnnA1HE7e0G+AA5ZpEvpa2GwA/xXLDEWiyiriMCgk0IYeX/fe6+33hkkwGH7H3gQKp5vaTZjPmoiz+Q1R3Kex43dpwsfpzA9paM65kc5YxBm5ohu6cmAJobze2hjYL2Gh/58V1qEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:41 -0400
Subject: [PATCH v6 7/7] arm64: dts: imx8mp-evk: add flexcan2 overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-7-8ea858ba3a5b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=1705;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/kyklcSI+gOd/Hh7lXY0LYceKPsLYQDEebCDow7nXsQ=;
 b=Eh5Xfx33d94GFVscUIpIsGUT4C6n+KbPDifaHTsWyJv4wYmEWUyulgfKRuEgWv01qpZ/h55vO
 ETd6YWUa4MmCDwwRXgBsMTZ7YDsvbNXLuKVJe/RpzChuTEg9REobYAA
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
X-MS-Office365-Filtering-Correlation-Id: 54095ce2-1f36-4bfe-d94d-08deaa389b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Im/9yG3D+3eQQWq+CKkNvkdK6I+3Y28nobmi0bNKbrkEPEdDruQgQTnyP1JWX9D6UHYlulnqPNCKtTz50kIqU7VZZ/cPtcGtIHI80J5LaJcTtykdzphiurCdr1eb8/X+o5WQBki+Gtx0fQdW4oBKTAaqwu2CQxJWc8B5gibQbkZhnGT6IS38V7SZjQ8pjW2Qd9FTOIXzM+xlVrZ48RA/RQApGs3jcFPx3Nok2jHksxLecScV2xlTxlZPtxNFs2DhHydYRAzK3+nJ1YrzW3pSXnvmeURmJQegtVKaOKZP4HPw19U9YXJPm7hZPgPqEw/LntR0BubS/xm+J/ICbzMVS+5Ru0taKi1b2SesJ7K3l6caJQ9AXV5gVRZw32Dh2VNKs7J1bsGLM5ldnJfsUK2pf3TJtPUEdEPh0XVnI1nIuj4gOVWDSdnXijx8bSFuB7b1ZDnKU9E3GFDYHhN2plYq3bpP2+3wiUwT+jBNv0ZxecYE4N8vYII8Gy+FgS5vch3ZIX8AnGr35vQO04Rn1XXn7Xhrmko0sx+CdQK3eizpxaJpvywCS0Llcwrac/6hYcyuGkViHGHxyHu/3YU4sP1qLri3gx/kWnkPTqjmK9Dnwi9zI5ADt5W/Ie5SPUE2Uv8zz2+vgS398ru9vkkvTXETNkMFZto/bc578soOoNxZUIDx9oQ+xHXUUO3hgJB3o8GC3ufqk9kooTs0bmsls+NXAbhLsTejxK75AAwHHhEg01Tcar4Ctm5/1QEYyUin60pq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWIyVzB1VjZhazFmV0dEZ3VQeXc0Rkw1WlF3WU9PcjdXbjJuZDNWOElYK2p4?=
 =?utf-8?B?M3JzZW5TVitrY1RCSXVzUitUTDNoTkVQa0Q1TUt1M0g1V3VUOXd2dW1BVHM2?=
 =?utf-8?B?S3V2VU80c1JMVm5qTlkySDhGaDZ4djJxalRlYTlzNHhXbVI1aWpwMWhHTXRK?=
 =?utf-8?B?STBIMFE4cGdIWUpOekZreGJ5d2lkVDRNU0hVUHJXZmJwY3JjUWxnVWRJWUN1?=
 =?utf-8?B?T2FLc2t6WWpqOFFpMDluY2FYVHB0UnFleEgrTkxNai9mVWlPVkU5c1dmUGN2?=
 =?utf-8?B?L1pSTWVIWEo4OHBxRGRld2NiSFdjTmdsMEw5QjU2dHBMYmZXUEVSUmlKdm5R?=
 =?utf-8?B?V0xoLzVrdTZSWTd4SkgyNDBmQmZWSngwczlndytROG9GaXpUMkkvaHJYOHky?=
 =?utf-8?B?K2huREsybEVPWDVFL09GSmVlR2dhWEZmV0pRQW04S2REeDdQZ1NOQ0IzaFNq?=
 =?utf-8?B?L0FMaW01VVhtOEVsaWVVUHZqdzlOMDRDc3l2RkYzek9aRktlUUJrU2NOdFdV?=
 =?utf-8?B?WXNjeFVLRVJaOThHN3FLS1VTcDg4SVFvL2pqSXpTbmV4bTc0VytBNTFTUFJ1?=
 =?utf-8?B?bVhvVWU3VzRGUy9TeTZTcUN4UWVQRGh1aVhBaGNFYW8wcWdORk5zdHU5K1JR?=
 =?utf-8?B?c1JRWkg4VDJYT1JteFdsM3luQmJHcVRPWVVYSUhSQUdJcU9mSkZveHVFb05N?=
 =?utf-8?B?L2padm9lV0xYemtlNEdYMFZMYjRCVVR6OFcxT2VrUVA5V3NmeE1Pd1IycUhq?=
 =?utf-8?B?enh0LzFRZjRkdFBkMmtBb3pKakFJa0dtNjdwQmsvZXJTMVFuTmVkT2lscXlu?=
 =?utf-8?B?YXZKOVV0a0xPUHVudUJPUEh0TE1LY1UvMHd5Ui9EQlVoaEYxWFlyV2V5N04z?=
 =?utf-8?B?TnpYWFZtQk45dGkvREtrZ1BSaHVCRmdMSUdraEwzdWRNLytVMjRUYjE0dmhh?=
 =?utf-8?B?eVFWRDlncjN4Rk5vRTVZVWJsazNKM1pMb3BndUpHY2M2aEdTVzBZaUlWdG9E?=
 =?utf-8?B?MUcvODZzTUg0YU45RVZDSzZRMWF5RTFtSVBtbHdXRHFaMEhicTlITXlUY1R6?=
 =?utf-8?B?OSt3Q29uRG9CSE9Pb2ZVbmNoYk1RbDlGdTc4OHhPb3Nwd0o0RFFYOGI5RkU0?=
 =?utf-8?B?bE1SY1ZoQ1o2UU05NzdWcnd1aTlMNjFSbTFVUndCWXdWanM3Q01YbzJUMlNX?=
 =?utf-8?B?ZVZJd2dqa2I3MWNxdSt0NDRkVWxFN25FS0ZOYm5oZnkrMnpTbVk3U2dQeVhH?=
 =?utf-8?B?eUIzVVVEQ0o2Y3lkZi8xOTltQ1d5anQxeW5ucU1vckJ6VE5VeE5MRTdaYnhN?=
 =?utf-8?B?TG4wN0hZd3FadG8yVHdGcXFHejJDTEJ0dnVKV3hIaTJmQWdDOGJ0SUM3a2xq?=
 =?utf-8?B?WE10VDhQRDJkbVRReTN2N05tbzA2V2ZHRTg0R1FNUDVpNmppK1YzN0N6UWdK?=
 =?utf-8?B?NHZreXFEdmZxckppc054SHowNXN1UmlieWUzTlovT1FuVVFwNk40NjA3Z2ow?=
 =?utf-8?B?cmZJeGtRdHI4WGNYSFEzdlg5ZVpnY2k4ODNDT3o1S2ZSS0tPbVQ3ZitRS1di?=
 =?utf-8?B?UWIvaG9wWHprUjE1UFFVdjhaY2FDcGtsbVNMQ1ZQZGNUWTJMVVBzNlhkUnZq?=
 =?utf-8?B?OG1Jbkd5WU5XNFJ4dytWRWo5UytBNTZQeld0K1hRMHo1YWVrK0Z1MDdEUnRE?=
 =?utf-8?B?SFJRb1gybkp6NFFzSVpheVZOSmJNREIyVW5ZTEVNM2I4bS9CQUlpbGRBVElP?=
 =?utf-8?B?NTNnSFdoMGNQSDk0b2tqY0pGTmxVY0RvcTBjVVJ5bHRiYnk0ZENyT1FnLzR2?=
 =?utf-8?B?NXExME5TSnNvRUZYeDczYnozSXRhdkN0ZXg2bW5hcGYyRlpmQS9TOUJ6aHB2?=
 =?utf-8?B?SklrekJHTmVxWTlwV1VJT3pNUkVCZ1pVd3NlOXk4UTM3Ni9td0huZjF3WTMy?=
 =?utf-8?B?TkErREZYdlg1YU0rUlFOY1UzdUlMVGlPaWw2MVJYeGIzcXVFYlNxejhLaXNv?=
 =?utf-8?B?MjN3MnNiLzQ4SmtzYmxRVUZMbm5zb1NBS3p4M1hvSFgvZW5RNnJWVHlhRE1W?=
 =?utf-8?B?d1hRTzdXOHFsNW9HT01sQ0xkd0N1emVlMlYvYnYyQ3R3UkltSTRQN1ZQL2FP?=
 =?utf-8?B?TUpTZS9Fa3F5S3JPcXc3Nm1YK2NkMW1wU1pLYWZ2V2tLMHgwNFZtaWIyUlBq?=
 =?utf-8?B?K3N6aWlWYzdTOW56UERMN3FYOVMxSVRJRE1TMFRDYTJWeHZSU0F5eW1jYjFT?=
 =?utf-8?B?RjJvNExES3RERmtmbkM2UlpoNXVBeTlnWFMrVWVFaWE5SVphSlhUL28vdHhZ?=
 =?utf-8?Q?iyV5z/k0pQblsXihLi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54095ce2-1f36-4bfe-d94d-08deaa389b18
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:23.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZngALoAsluBfGYkv/CXcl5higfRc44tEVgJEYbvhDTGnHOeYGc/tFE+Mh5yqO/cxZ/SkeH8B2cH1qvU3yuTCzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-Rspamd-Queue-Id: 64E9C4C50BD
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
	TAGGED_FROM(0.00)[bounces-36106-lists,linux-gpio=lfdr.de];
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

Add flexcan2 overlay file, which enable flexcan2 node and disable micfil
node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3-v4
- none
---
 arch/arm64/boot/dts/freescale/Makefile                 |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990317130e0d691fac619ee03d8482..76173db184f5593153591bd5d427cbac91e4ab75 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -246,6 +246,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+
+imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f7d2674c45f72353a20300300e98c8a1eba4a2a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&flexcan2 {
+        status = "okay"; /* can2 pin conflict with pdm */
+};
+
+&micfil {
+        status = "disabled";
+};

-- 
2.43.0


