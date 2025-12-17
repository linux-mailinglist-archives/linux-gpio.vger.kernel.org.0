Return-Path: <linux-gpio+bounces-29658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F4041CC5CA0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 03:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 034363012748
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 02:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D6E275AE1;
	Wed, 17 Dec 2025 02:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YfnqR/HA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6F7262B;
	Wed, 17 Dec 2025 02:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939277; cv=fail; b=CWU61d5WlKV/ZN8BccaoKQGmQv5/kZDnxyXba+QjpujVPLJn7pXindoniXPx/XL/9O9ttr1Y6CChQlndUEZ++aR5n6dbQ/oz0hglKQuTOR8iEoib6cciqpAKwtsN7FLZRMxqOb66/1SJSQcrDSJjnDwmRPeDXLcAE5QtEMxVr2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939277; c=relaxed/simple;
	bh=xEwqdMhP54Lu12IIb7R4fJJUu0M1F/5lWXvtVC0pKYQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=APWcUoWL/lgy3nRhWWwI/sVWWRKHQ53G1FnNnLtVb8D3RzflFp7S+biVVC25OiIPiMSaaOtNJjbjI0utuFBbGHqlylY1ZniGHYilg1iluMrG3ClxMbNzi0l4YZT0ofwECfsjsqM8FpiOhhitBX1Zx+wraNBdXabSKj2Db04gA80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YfnqR/HA; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+TVWrX0izeGZD7E9zTjFudsU+K+gIZntwFj/6mluUdQaIWgsLEop1gm2pfIegj8GkvsB4WHk8/FWQI4bJlM0lxrmUMuleEfjW15FBExdJefC0AyWtcV1lrsdOTI73WHPDP0Sz7Rc3Dq1EFXi0BhKO8Oqut9vKaBP7rk3VL5G9d7q8vHVeFR+gtIlUp8f1rpte2ncHNfHDUV2y2DUzMcbs/7kziWuc+gKQj2crGXl4s9w4mtDHB0DanZ+bjwoeDf16dTkhf2gzaYon4qQM7nxdkkhrBo06ubAW5zJs6B1CqoX0ItBwsl/hYxK1L+x9r7c6T4D58WTa4yfmoCLx+9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7Vb7jx/gJGfCi5qtLUElrgq4iNUAywIDv4D6aSgPBg=;
 b=sD3xwvluKiClc44u0yPBPMNkzdYBfxvpvfnj075JBe6rZ+po4Wewyb2MjTZnLz2WhaB8pIQT06WtuNlAJGF9uhqPkloSn9hcrfpCNqhZwHTb2nSACV9UZwcS1EEs66DpkpHttldi2oCwyRxiGXukuupPyTiJPc+VU4uWCHeY7gObtgGTvvHFR+t4tavfbkPoqtNMHWeQeTkrgaKXKLM7alpd0Cwr1AD+2PNKcq5VWt3948gHUtKbTyvw06l5hrjHlwu8wvH/Vn1ojRVqv+nLJhhZhYDG7VzKQnK7Ll7XHVwXxEc10tyDauVMjxkzIRE0JF55vAG1WZYMNa/NtcWEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7Vb7jx/gJGfCi5qtLUElrgq4iNUAywIDv4D6aSgPBg=;
 b=YfnqR/HADEtrhJEyAoZ2xW/1Mgwv603CO6BBXdI3o8fYs4txuxuArc5ySYxC4LIaVklHa7gIxAuWsnyr8TOQB3FFESi3PON/le9Jl7ZwIN4CHfwfF75grTC7uYlRPhW6C5iqWZuIkv67Cw9gVU2fas3iNyBdjR3DJPrKawZyJmZTUUR/BwrrM7ZiYPT7+pK6CznPGfDQlyqh0pxRAGfoVWC5t2FA/8fKfoyb+4ytBErOuqtVE+JBi2t0qRQ5mZsZv3/eofaVEAkq64ne4hda+EXOPXj3URe+HiE1f0paHDivEV+e+I0Ch6gV3zwYXbmElQ9FsPZ7p/NCmVzl+a5qCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:41:10 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:41:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] pinctrl: imx: Support i.MX952 and update for i.MX94
Date: Wed, 17 Dec 2025 10:40:44 +0800
Message-Id: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwYQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3czcCktTI92CzDxdI3NjwxTL5CSzRENTJaCGgqLUtMwKsGHRsbW
 1AImVw8NcAAAA
X-Change-ID: 20251217-imx952-pin-2731d9cb6a15
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d002895-0e67-4f8a-3c52-08de3d15bc86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDhYT3dCNHNKNC9JbVRLdjBvTlhDdkFIdVZXdURBNnl4UktYV2owUENlcmRt?=
 =?utf-8?B?RDdqUStMc20wREZRSldEaWlSV0UrRzRTM0wrbDhyMFVvVyszZVJOcTA5cGNM?=
 =?utf-8?B?b1lrNXgwQ01OSXprYUxNUEFMV3hINnh4N2dFR0pOOUxGNEpWNjJFakFWU1I1?=
 =?utf-8?B?bm5WemxZbDhqNDY3bkFxdDlCdlF6a3RQWWd1TXhrSnJteUhkUE1nMEpKTEkv?=
 =?utf-8?B?UytlOXAxYmtsWnIyZGNmcHpRdUp4RzAyTHlaeHBXRUQyUm1NVlpXMmdBc21n?=
 =?utf-8?B?cnF0YUw2OFZrU0tXNnBSbjVNWEluOVJ2UW9WWjRBR2FTTjBySzEyV0s0Wm92?=
 =?utf-8?B?UkhmYURWVDNMRTBoMEtPcXI4dlliUnN6dWtybmVPZEV1SjlUSzRTWndOUEFt?=
 =?utf-8?B?OW54T2lpV1haalRGdXhqK09relp0Y1pXVnE1NVMyQkQ1TS9Da3BqU0I4M1h2?=
 =?utf-8?B?TmRXWGxZN1FzSVQ1dFFURFlWSmNXZXNjdU1rZ0dZSEJsRUxsZTl1NVQrYWtC?=
 =?utf-8?B?LzJNUGxoYmo3TW81QUFSNjNUSW8xc2sxalZGR1B2MVo2L1Z4Q0tjNXZXQkJP?=
 =?utf-8?B?VGg3Mld3c2JmUE4zVTFWc0tZSXowd0p3U25wUkNIZUNJd3NhVFppZXNsSHF0?=
 =?utf-8?B?cEZxOGE1VS9XNFE4cTdrSk5jbW96TkphN3VLYTd3cUdVTVg5d2tEZzZKSmNu?=
 =?utf-8?B?WGtHY282dDd1REdaUTlnR0hqTWFIRUtyQXc1M3liYUtEb2NSeW5zK3gzTzJY?=
 =?utf-8?B?WUQrYkFkOFBicVRrdllRMUtvSk42YTZPUSs1YVRYTWYxZHZyK05va3h2MGRV?=
 =?utf-8?B?NWJVcHFEdGgxcWQ3UnVjWUtyU0x2Znh0aDRTSWpPUFVZYVBVakZzZmRxMURk?=
 =?utf-8?B?U2pvZ1lCMS9UUDJZT0lOTHpISjFtYkNxQjNtZVFGeVZCb01jbjB1T1huQnVW?=
 =?utf-8?B?TzZ5UFlMbGh3cFFERDBFQ081THZtdnQrZnNCWnlBaHBSczF1dGFReTlneE01?=
 =?utf-8?B?c2hXRjV2UFNVQ1o1WGcvYmVhZXlSc0ZBV0U0bXA4cnZrZFpGVHJWelhHaXdO?=
 =?utf-8?B?Rm0xdUN5Sm94c013NURJK2czeXBWdjJBZWY5V3YxcU9PaTRlVDJRVXUxam03?=
 =?utf-8?B?eHRxN29Vc21INE1HNVB6REl4ZTZTWXZaVHFLNGk2djBHaHU0c2hLM1IwZ3dj?=
 =?utf-8?B?ZXRBTU53Q3ViRXNpZGR5RURzckRsSFdvSklPZDdEUWZEd0xUUGtzODMxY0Zr?=
 =?utf-8?B?K1hzS3FxZGpKY3lkTkI1cWtLbnpBNVZqVDZCcW5YaUZ0MTFCWEViVnJYK04y?=
 =?utf-8?B?YzFHT3RUd29CYlAwOW9aN0VBTENUOGZrbjZwNzNIdTJDL21HYm00SlNqVlZO?=
 =?utf-8?B?TDBISzZ3aDNOb25tYU5kUkh1Q3JseDY3NjQwendjaWVHekRlcjFJTFBOcE90?=
 =?utf-8?B?S1hpSTQ1cG9wNDFrbnMxdjJ4V2hiTk9acGpKNmFOQm9jWHN5RFhZK0RmclVX?=
 =?utf-8?B?Ui9XTUQ5MjZNdlF6Wk9vNVVnd1RVZkZQNW44ZmJhOXgyYTFidDU5QmQwc0pC?=
 =?utf-8?B?TFkzV3FXWGY2UFR4aHVQTFpSVjZPZko2c0MzVGc4MkdDSDNjN21yQm5kZU9E?=
 =?utf-8?B?eTlTNEN5eWdUT1BidVFLS2NVd0p4bUgxdTMvdmltT1VUd1l0MXNqOHBuUWlB?=
 =?utf-8?B?dG1OTnFXU29RMVFNdkg5dFBYNUI4NklxNVFud3UvSzRFWC9GTVlMazVDMHVP?=
 =?utf-8?B?SHVBRzJyZWpOMGQ1cG1jUzF3SlorVUZncWlGaW4wQTVTUm44KzUwUXVBR24y?=
 =?utf-8?B?UlVkaDZKS1dRZE44QzNnK2dwWXFKc1ZQSTJpRUNxTUdUSlZzamlTWGlvbkxN?=
 =?utf-8?B?NjZ1UUFJWGZwVGN1eTk4MDk1RG55ejBRNFU2bFZxbkllSVFzaUU3RHJpVVV0?=
 =?utf-8?B?bG82Q2lzQSsvWWVIRGswaEYyRDdqYUZjNkZka3JKcHVnR2tScmprOUEzT0Jl?=
 =?utf-8?B?NDh2emc2ZUZySG9VN21ESGE3M01Cc1JSOStrOWpPRVlmcjh1Y2ZLNURnREdO?=
 =?utf-8?B?WThkNm0yRjZIaUFLV1NGSEV5dkpKc2FRK2UwZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0tocG5WSXBabWN3T0hKMWMxQkptYndPcnRuZkg4bXpPUWJpQXh3enZON1Ni?=
 =?utf-8?B?Q2VvUFg3MXh2NU5kSjJRZzc0bVk0SXB4T2ZGZEVnbHpqZ2twS1N1bFB3QjE1?=
 =?utf-8?B?ZmJ1L3EzN1cvN2IweW5QUjkraHRoWmt0NllnK0xvQ1NUcmRCN3EweHZWMk9Z?=
 =?utf-8?B?c0UweDRnaVFhTnB1UFVJalIvay94R0JaVEpUR3crQ1hiaHRDaWZ3dTZsVC9z?=
 =?utf-8?B?aG5vZXZ0Q0pROVRob1I4RlJsS0VNQU5CWFV3aHZ5VXlCZllTOUQ2d0lWRWRw?=
 =?utf-8?B?bDVZekV5NkxWb001MWpRL1RPWWk3eUN4bHZHRjdNUDViLzB4Tjd0NHB3WmJm?=
 =?utf-8?B?bjJvVnRYbXZpNjdQQndIWVNPSDIvdlVMcU1KbzhaTmlHUkNpcFdWSE50K0JB?=
 =?utf-8?B?TmQ2NlB5UWxEUjk1ZC9YWDdPbVpMdDluSHRhWDYrdkwxUGh5K01XZURqckp6?=
 =?utf-8?B?cU05eHF3VHZpYWxEbnR0enpnZzNTSEZDZ1VKeXJjZ2pzUk5MOEFOMnI5UjlQ?=
 =?utf-8?B?TzgwWFVxencyQ1M0ZlVpWldRSXhyRE9DcHZzZ3ZRRDhrT29mKytuTWNXbi9F?=
 =?utf-8?B?Mm8xOWVVZWwwaHdaU3BENHluMzVsTUNIbysvbG5ZZDZieTFza3BkZWdJRlVV?=
 =?utf-8?B?UDF1NmUyWmhkUHdSZlhycjEyZURnQ0xvalZpK000ajlic25yVCtmcTJ5TDNr?=
 =?utf-8?B?NkhEYXg0UjBXTkpPU2Y2WDBRZ1ZkN3U3Y1drRmwwQytQK0JsUURtbXFhTVRZ?=
 =?utf-8?B?ZU4xS04xRkRGYk1GNTRzWU1HTnQ4M2NXbW0rTmVldEdTenhhcklzRnc5c0Ev?=
 =?utf-8?B?MGJRamtSUEJGVTQyOTU1ZVlHVjNacSsvZGV2a0lrUlA2RHRVNUVBeTFWdko3?=
 =?utf-8?B?dnBXT01qTll5S3BIRkhmNEkwMW1XVXRQaTRrU3FHak5HbjFKN05hRm1jb3Jy?=
 =?utf-8?B?M3hTbm8rU2NSUEhoVTE0YnNDeHBEYVBXaU5OMnc2UUthb24wU2MwMTdVenVX?=
 =?utf-8?B?aTFQQTB0QjZlU0RqbDVRUnUzdENZa0F2UG9vSGVLRVJHMjAzUy9FUzIvbHIw?=
 =?utf-8?B?Z1Izc1laYk1TSTNrQ3hXMW9QaXdUaWNtWGFpam5ydytTM01kdTVyNktsVHo3?=
 =?utf-8?B?VEtERzQ0dWY0UGgyQ0NyYkM3cE1ybDZMRHh1dFptb29YV0p0eEloM00zdGN1?=
 =?utf-8?B?aUxNb244d2puVWlQTlA5NmltZ1ZMSnFLaSsybE9meGtic1dRNFlhMVN4UjZl?=
 =?utf-8?B?L0YvTWxyamtCYzBZSUFlbjk2ems1UktUWUtMREwvZHA2eSswc1UrbHpSK2xK?=
 =?utf-8?B?N1d6bktRd3A3eHp5cE9Ea2hneUhDaDdETU1wR0VCVW43bUZjVTd4UnNMeHhL?=
 =?utf-8?B?TEZMSk5JZHhNVXNlRE0yMnZEYmM5UTQ5M1F2QktvVFV0OC9hazZTelRjYm5B?=
 =?utf-8?B?aXEvblQwaStHd0NYSU1uZXFPMVY5THRyelBjQTNaV1lEUnhSaHIvSEs2RlYv?=
 =?utf-8?B?aVhGWTJjbUp5cVVsREpkWmU5MDJRNVZGclZDOXh6UnRwZXdna3Iwa0lEZUM1?=
 =?utf-8?B?UnhwdDhlNjI1UW45Wng0NDNsbWprUkRBMmdEczlZSkpiMnZkYklVNXlDM2dL?=
 =?utf-8?B?TXJYZTNwSVRESjZyQklJSC82VUlkWWZvbHovdmxUaGdrcVp6Z1FqSTJ3OTVG?=
 =?utf-8?B?V0p4YTV0TjdHZ2ZmWXh3ajArOEpid3VRSmpVMlhxcURYTU52M21qZUhjMzJM?=
 =?utf-8?B?aFJSMUh2RzZCQVR4OXpxOXlsV2ZKVlN1NHAxNVJpQlBYYlNsdlhodXJCc3gv?=
 =?utf-8?B?dlBVYzVobXZpbU11Uk5VTGlyQm1zTXhiQktqTUdBcjlRVDAwT0gwUFVLZnli?=
 =?utf-8?B?RmZ4d3k5Vm90MG9nbS8yTkdYa0JpcWxUQlYxWGlVdHpGa2w0bDdxZUs4UHBO?=
 =?utf-8?B?QWFNckh1QTg0dWNWMEoxaXFPZXhLYVFPeDBTZDFGZ2ZXYmpYMjh6TUUwNHdC?=
 =?utf-8?B?TlNpeWhQaExqb3VjT2xlWGRmL25oTlA2OW82Q0NNYlYrM3Q3MWlIcnFiaTJV?=
 =?utf-8?B?dWE4b1Y4aU1hd2F6WXlXbmRUdDc1QjBVRTFuZmJqaEgzRjRhSHpXdW1SL29y?=
 =?utf-8?Q?b8lmb47SfWfvfrkEVayTFfyjo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d002895-0e67-4f8a-3c52-08de3d15bc86
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:41:10.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fcLDjuRsKcMatlw43/wctZLvXgMNAm6zJZZDpqprCZ6BqxWGQXhkTWU2q51c3anSjIPzmVowvP+ZNr7gpNeRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

Patch 1:
For the changes to i.MX94, some pins' mux options are not controlled by
IOMUXC, they are controlled in WAKUPMIX BLK CTRL. SM extends the pinctrl
protocol, by adding a new cfg option.

Patch 2:
Similar as i.MX95 and i.MX94, i.MX952 IOMUXC is also managed by System
Manager(SM) and exposed to Linux through SCMI pinctrl protocol.

i.MX952's select input register offset is different, so need to update
driver to include it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (1):
      pinctrl: imx: Add support for NXP i.MX952

Ranjani Vaidyanathan (1):
      pinctrl: imx: Support NXP scmi extended mux config

 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 20 ++++++++++++++++----
 drivers/pinctrl/pinctrl-scmi.c               |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251217-imx952-pin-2731d9cb6a15

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


