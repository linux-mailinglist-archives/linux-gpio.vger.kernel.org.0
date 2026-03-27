Return-Path: <linux-gpio+bounces-34333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BIqEQv4xmlwQwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3734BBE7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 22:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BF81305F242
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 21:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B443A16A2;
	Fri, 27 Mar 2026 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibnfU2yj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813AC39F181;
	Fri, 27 Mar 2026 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647276; cv=fail; b=ELl6hw5rHDCFIaomS+mqWjuSvHMk8O++5VaSU2lPCYRZpi74Bf+cf3fZt3Bw722ybP4Je3nJ42koaHRapZ7fBEmXF9QJXppDUss5bcfSv9QGWVK9WQb5WAF7Dd+2ICFzWTP5uMWKSD9+5vdksh8GdOruG3hJy5IcDqOwJPzGhYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647276; c=relaxed/simple;
	bh=1UX6p1C0kT4kF5hCfTKLF4LKgaOM5Xl6++ZwO5kKYIM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LoLHbpN+iqR40RZPJNSXoe4gS8z0/5IIuLNRq+00qNEAxyzZ/g5UZtT3P5vRWCLMvurGQK6OXpEWXv7SBCCyAxKZBnHIQiAdNcKL9D+h9uPhLBhLg2la2vnDN1oJTY+Sgm2shn/FCvUXcXqpjXFl1pb7NhhYWn+Fh6UVtL93LT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibnfU2yj; arc=fail smtp.client-ip=40.107.162.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwb6EamUKAZw8I1Y/tEzVO7nWYRZw1Isfcoig8L2q2Bu+whFa7r+kJCeK3O3P1k6AK+N7+Soxks9eW94iozz7unY6ira4vGkCWK13GFqev0HGgbApDW/CLYhzYGQaMUMvpuMP7e7vJ8AvavdpWOi7Z7BmciryaOYmOP+/9a7hJJTvwFoI8dtuMFky078TLu+egtAfzfDQ2hyWHUXjgVrJsBStdXtOKSC5N4InHEkNgRd9RnE6ED2PYoeRf4R4GX6Vh7o9VrYjCDtckeitSdbui0KT/up2zh/qa9ZBENI5DZmocP7H2hZoKSX81Me8CSFv6QiUEnGf36QKX6dWjKu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj9e6SKLGiBn4BvTY+vV7gAKxTFz16kmEmbNs2EUfZg=;
 b=WhHfdeV7GtNbLratDPMPyGg9JPFd3WI/WU1uFP//0gF1d3ckf0firZOGSyJFusuGo4fMeVs1GhtyD4XmkW0QDZHDBFGfr9F9VMhoY401U41wNi42p4sb2YrW/ZQJJHUrZskIV5596aqDzG+3ofSxJAfmN1czmNsHnCge8V+qeBdcDedpW2/S+RdocUTS2DbjVjytjn/KuBn8jyWobaZ1TJEYjK4ET6G8YgYUY98oOHXljld7ySZPJ+XbBKiVhu/TPLMHX+tpq8Z6QeglBefc+aztTq+tk32n/7bpr7qR1HShYlBqR7bPDDC+grrkaCmy+ZyET+sNbjXVUczJUKUOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj9e6SKLGiBn4BvTY+vV7gAKxTFz16kmEmbNs2EUfZg=;
 b=ibnfU2yjoMpgD6W87viydzvcux6r+t8x04b07u2CzwIPK1q0O0ybXuvgdnQW8N6sY4zo+/IaDGWHkCbP6t3VdIznQPs7vPOO0u+w97TqjswTr0S20coIivQ/uRqUUlcWAJHvC6u9I+0sQLJjNlabWVr/t5dtBJjjcoXY3jmHkeNS7dwSGcK6pTSSRJSn0uoLsnPw4uhB7Jwa535zp5rSS9hR2qKaz4cMHR7xGQgDAVFpXuc2Kwhbw8ZaE9YHUh93q0rzzUTkz61j+2CkMAhGWjOJIICadcy/pVmN5RFuNxKxlMdy7knGnr7ud1J/H+tz+CHvsghGb3Y47ur/rwyR+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 21:34:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 21:34:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 27 Mar 2026 17:34:03 -0400
Subject: [PATCH v5 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-pinctrl-mux-v5-6-d4aec9d62c62@nxp.com>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774647254; l=2170;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1UX6p1C0kT4kF5hCfTKLF4LKgaOM5Xl6++ZwO5kKYIM=;
 b=Pq4zSNms13/vDNrJ+W3moLCnthDdrdgh1Jb2WWOYEXvl0HppzT075A9zIXBN7GtJzWvdjokyk
 JGEGRHDRp7CAYZpMErjAC9kIGrNjJaBL/ehzOL9vjAuK+mwvKhSqGln
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 84431c5d-bedd-4990-fcc0-08de8c48a33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3cNN7jsa+pAo8RPKiR/H8TxfmEznWiOiTREExvy+HNdmM54aVX0tNqJWQ6yWJSg9tex6MFhJrxS8TGyZdur3jdmfa1w7xFkhCAQkyYlnyhn0/N8K4uNlPEyqFNQhvVFPlCOU0OHYvHmQbJx1QeSURH+T5PRuBGnpykeE724rMiw5NBmbYOrBp+jGxrHuYIK6+0oj6g9LscHo6Rl7Va1jUW0com3TOBbUsdrJtQTj9vgdvCRtRCos+6vNkwQ5HwtYYngAl1qJmv4lw9zwh1xGAYcq1sAf5I/Mr94Gn7rPtRx2JsjFfzjcT6QFMpAI7iwRGtn6aDLpX8+UEkhw6AOJ5U3ElLXCPYXljnHDV4veG2myjZDIWDDICUDXfPPe0Y9HGKQXcSnHYKQhK6Fcgv75s4PZG2jVeA2DlDZQvnnLrUgYSZw8X73xc/2v7yaAvFNy5iGkHk1D0Hp7Xq5KNvv9+gKfLj3mA7grt5pYugj7UUBePnLPfThr8Hvrj7lXA0vCg6pzI4prmuiMrwrxV214s0Ac1e8Bzp4YI8I4nbljTubPbKSs7/xGlu0kJLupFqaQmrm0OIiGYJzHd2Le+NJA7RWwHy5GWyhzopazX+vCvfsplkkw8PqIEgr2rq9n0C81wsVBQuswW7WnHP8z+Da2/WSzpe/L2YWI608SyDGpbwS4D8PTApbVd4x5vVm+ChnnM64pTPCHdps16eOrqFxhmqvxZHouaBeizr68fzpwySU3Ys8mJR9OhuHoDnCqjlFH10i55KwhX1nK+tQxfXTzqH2dvP6NDm30mfj+5JvNgDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZUOFBKeE5QWTlHMUVIcHd2bzJMSmxaWjNYczZaMnlub2NCMDhUcThTQVh4?=
 =?utf-8?B?UU83OEJzWWFUaU1LTTRzT0Q1UDAxVjV5S1ltcUJRTVVnbGJadnZnTTEzb3JN?=
 =?utf-8?B?MGNmbHp5aWVZRjBOYTZnYzhBdHBRNDQ5dHlPd0ZDRVY4RTJwM0pGY1ZsUFlV?=
 =?utf-8?B?bUVYT0hXR2ozdHNVbjIrektucG0zRUMvNklJSmpUTjAzWkQ5eXpKdTdyRkZy?=
 =?utf-8?B?cVRWdlcybnVmQ1lzU0h6Z3FCaUs0cjFmRlc4ZUVQeXJPbU5seVU1MTRCVURV?=
 =?utf-8?B?QUE5TEloaFBpNnFVZ1BEOVRUaU10aitycUs3QVZMT1ZINEtUTXZDdWtBLzVw?=
 =?utf-8?B?SVdQU3VlUDNEOEY3RDVKYnBWeGpOUERLR2dNV3JtR3VONnIrQzZSLzJEOXA5?=
 =?utf-8?B?RENYa2JYaWhYR1NmdHdxQzVKN0JIN2Nid1E4Si9aK3ZzQS9FUFBGYVZwWVkr?=
 =?utf-8?B?VEhCZXhrNU5qUnU4NDNuTXZPZGRqTVBHKzJka1N5TDJvb0EwRjVMLzZubG9G?=
 =?utf-8?B?cndIYjRhNUlpUWwxdVlmZUxxSmt3ZVptdWxpTmZIUys0R2VhWDh2RkJTSGR0?=
 =?utf-8?B?T3IwbmE0aUhOOVJXUm5aL04vOWVTZjhFWlhESGN4djVCelhxSkFZT1JDMFFj?=
 =?utf-8?B?R0xXN0htb2pUSlNNamFkbnpCeXk1RDc5a1BwSjdUUVRJWS9wQWM5UEl1d1Zo?=
 =?utf-8?B?akpmYXQzamNzNUVLbWl1Zyt2OXZmTDN6UXJxa1lQS29YcFRaV2RhVk1uYjd4?=
 =?utf-8?B?SWp6ZmpQeVRodDdTUS9mR3RxSWpKc3FCSjhlRGl1WUhoOFhTWUNvNUNRRVpD?=
 =?utf-8?B?eWd6Ky9IemVGNDMrdm94VUJxbXpUaW02M2d5S2JQYjFhVUhIdkxvc00xWEg0?=
 =?utf-8?B?NTdPNnZrUGVjTFF1OWxTTGJCa0xjQ3NsRnBpNVhLMVJjR3NqZmNvYjRyMnFi?=
 =?utf-8?B?WlpueXZ0Q2J3bFhneUMzRkRqU2d1Z3cyL2YxbDA1bFdxcFVDcGhsVmNMbkxN?=
 =?utf-8?B?VGZsTzV4UFdsdU5seGdqNUs1UTNYQ216MzdFV0VKNzNLem9pZ0pMMUJyZnc1?=
 =?utf-8?B?NlQ0TXRzbmt6ZTdMaEMvdjhGQ3JJamJUNm9TcWFvZS85MVF6eTV4VTlGWUEx?=
 =?utf-8?B?SGZmU3Y3NmxDN0lxUjhXSFMxOTB3Z2dEc2tNYzFNZWk4WkZtREpXV1ltbU1w?=
 =?utf-8?B?V2JYWVFiYzRKSXg5bFE5RE1uUTRWZzZkZVRTUlRzR3hGRmp5a21Zb2M3UW91?=
 =?utf-8?B?T2M2ZHc1T0NZMWpHU1YvbTFIUm5BMENPZU1jQVovMDB2QmpIc2lld3RXd3dt?=
 =?utf-8?B?bUVzY2tFLzhOSkR6SmNzd09zOVhlUFpFOExzcGJ2Umo0bG9KQmVseTBRVVp1?=
 =?utf-8?B?R2E3QUZKVHpqSmV5eVlBYW1nOGRNMHIxcHUzRFJvc2pSYlYwUjNYS0FQd3ZJ?=
 =?utf-8?B?MVQ1SlRuM05wM1dmLzZmblliZXBIM0Rva29UY2doWWkwcnNLUGhsUGZOSmRG?=
 =?utf-8?B?bVg3ekNCT2ZnWW90eGtXZGdzVzRudWdhNytoNTZjVjVPRG9jM2FMVjVKWDlZ?=
 =?utf-8?B?SitMTmQzRWtjU3NLRFJOY3U4Ly85Nk83NGtjMHgvMC80TjlCdWZTdnFldmRu?=
 =?utf-8?B?dlhpdXJPdGZsbmkrMUUzNGpod2pWNzFFZUZlUmxXQ2YvMUExQTFwUGg2SjU4?=
 =?utf-8?B?U2dFZEc2RW1JdXp3SEJCTmZ2WFo0NFNaWnJacTlnOUtERytURG1CdkpNVS9P?=
 =?utf-8?B?YzUvSDN5OTRqem9VMmtES0xnalBLWC9FbW1kS0JFdzljUy9rSmdjQ002MEpu?=
 =?utf-8?B?bG04MkFVK0lDdlA0VXJGczFQWks1UDZ6Z1cvT0djdDl5SWQrWHJxVndsYTBY?=
 =?utf-8?B?UlhER2ZaVUJMRXkzc09ibGxaL3ROWnpKL3AyNzFpWjhzeE1zTm90Z0oraXBk?=
 =?utf-8?B?ODRDbjR1YmJkZEtIVm9jRldXTS9zdndTa0g5dTA4VDYvSTVSejdxZWF6Z0Nr?=
 =?utf-8?B?aVdpRDc5TUpvdXVBTmdQMXY3WWhrQytLMlp2RVd5SnZsQjU0QjFhVFR4ZEkw?=
 =?utf-8?B?SXBEcFp5M3RZWHh3a2FoK2RWS1ZIMTNxUG1RRVROaFJnNG8xN2JOdVNOdFYx?=
 =?utf-8?B?SzV1aVlLSmszWjloWWdHaFpQMkwwTFlMU0V4eVNvOVRkUk12NDlqenBwRVho?=
 =?utf-8?B?ZDg2Q1lYSUFoamppSGRudXkrWFZDeHliTzg5ejRnMVovY1hQY3lXUjh6eWhu?=
 =?utf-8?B?TmJOSG5NU0dVU0U3Z3U2V0ZZbjUrTG5yUVlQMUJGejQ5WDlZa1llblVRdVp6?=
 =?utf-8?Q?wDVwPjB7kNqDb+XE5S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84431c5d-bedd-4990-fcc0-08de8c48a33c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:34:33.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BPQYVyrgZ+AiRrkYLUZqtBH1rsNi2xBW+ths59cmpzzglEhk8IEYJtZ4dNGdUr8tWiUjIut8qaEfWnSU0Momg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34333-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,2.98.90.0:email]
X-Rspamd-Queue-Id: 2CC3734BBE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Previously, MICFIL operation implicitly depended on the default level of
PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
explicit.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3 - v4
- none
change in v2
- update commit message to show why need update PDM MICIFL.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..1341ee27239fd41a26117adc9023524ce50420a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -50,6 +50,25 @@ status {
 		};
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -446,7 +465,7 @@ &flexcan1 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
 	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
@@ -712,7 +731,7 @@ &lcdif3 {
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <196608000>;

-- 
2.43.0


