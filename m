Return-Path: <linux-gpio+bounces-10051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2E977B10
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 10:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58FC0289E33
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 08:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D831D79A3;
	Fri, 13 Sep 2024 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iIs0TzH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B61D6DD5;
	Fri, 13 Sep 2024 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216241; cv=fail; b=l683YCVehHPai/ew6pZXR0bw6AUZkOn781LON1ufULdMUKOisI3RvzHf33Pd0L1H6SLy2be6sYCFfMSBuo3IE3JvP/Nxn4IM3ixWkFnQBV1Ibg7m5DeTMFMqLZQrYg5HT3xISG4EIwc7qL55RvVYmRcDR4pkxUmW1iAawSNxbms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216241; c=relaxed/simple;
	bh=30wtJJ7kOFYriOJWYVSJoPQZUthCTzHwyvuCYNlL+3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aSRD7SGvP/xNL7DHvyvse+wgxodqAtQGpB9CJ9YjFfnDSuCSPHxmMVoKyo0AJkPpKgM99tHink+0ejsa8GsVb9QXs64LPGbkAdTkURJU/0Z4H+bELoLDE35f/eK9TJr7sPrgdlDaQaROUfdqb8MaGKCnFR+Lli3Z5lamQceel5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iIs0TzH9; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H26lUhUpEjAcT+SNbfm5CZxgOVV9OdMX0wJBzB1rUT6iWUG+5dkF6yaFxMG3m7WEox+OKluUP+ITKgHXDqsh+ztZLHsm4z7ZPQnsdBrISlRTaTf8sAZJva0xKl9xlXwNi3H1daaCDZhrZ5PoVflu5S/TK0+3HzBkEU1NzwBlDAB8MeTqmQufsk4YKT9oWzc8tozC0rl0hwVJLeU6mZOnHoS96hoV+6bAWEOb0mCiwjzG8atsFThOl4DBXj8N5Yt1ZLxjzba+rfBbp0E4vfiH9+gdMDur5kOJqGUC9pb8tMDr/vt0gcsKr3cvM4TtqzZKg4gxTYu6wYxU+3oBdrZqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T1rLla+D6DfujtTtzBu7C0IpGMDpAsMtcKH5kh9sUw=;
 b=mJSsncikqNzTc5XMyhzV6S8BJZ1WrKuc+MrW8Rcbr4KEo8dcqqKlK9NIk5sGWDQeHRxnAOID6NMqFAhm+2hoadGZeoJ5OIqL+jmyhiX8iWLWHRqNdyT2x6pdpYavyHjttwWQQeqMln/Dyx3WtmpeNFpLgZSy7Dp3XAxFyLDulDqj+uJ1eSx4rMC+VNFMScj3Fa0quNIgprOgpBsLC0D0FnXrzcykr+Wg5Acv+NToXIC4HQsmBYjVymcGF23mL2xW331sem9ALJ+nfb251m1nhxUud8lDMrRDAFRPNsAMeVRKtbCF3c85/M8nPVjBXve2nAdNEGCSTfaFquqwsAWFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T1rLla+D6DfujtTtzBu7C0IpGMDpAsMtcKH5kh9sUw=;
 b=iIs0TzH9SPUcMeofEUlzkIojbFcALGu8s++5J6ce1xyFHfqGO/ghbtspD228DSBEkT/RHDK4/WarisXVxSxAw7ZNYUM2rDhdP7JpTsVT5oW/YSDKv5s3OTs2qEB6DVe7hd4BeJrOqz6eJWl/JYGl23qLnmIbmc8T5StaBTgoYfLP78JkoECKxX3fsgr4YL9eKq42lQ7fTvSqPR+DDdSfHPgdEMphRkHaWzxuFun602iqR2Dde6fRvOoDWJczWDIRVJxUUNZm7Npzlv6wgfzX0dFr2ox8sDPXszcwYSPfVPOoMLQxWp4knMfco2iMxvY+FbT3qguG4gwTDbLvRBheQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 08:30:35 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 08:30:35 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
Date: Fri, 13 Sep 2024 11:29:34 +0300
Message-ID: <20240913082937.444367-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f6c686-1b68-4887-60e2-08dcd3ce56f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alhqVVN6L3BENEVFRHhrcm9LRmZEMmJWRVg0Y1FQT2ZLUEl0aFpVL1hPWDJU?=
 =?utf-8?B?WHkyZ0Rqckl2MDM5akRFNTNNdi80L29PdnBnbW1qVzRxMUlqZnFSS2RCb2Z5?=
 =?utf-8?B?cEtrVGpPS0FKbDhmKzlnMUEvMHpWS1lJNW9uNXFiaDh6cUNFSThpT0hGU2V6?=
 =?utf-8?B?SmRzajcxQ2FicHhDRjZOZWh0MEtpOEtBR1JHck1YUFh6TG9JMWZXdlFIdHBq?=
 =?utf-8?B?aU1taENLaThVTTRRTG9MT2wwTnFXZHJZS2ZCOXlMZFkweFZldmRzZFMrblNw?=
 =?utf-8?B?Q3VMM1hXQktWeHVVUHlwbVFDUU9aS3lwemJFRnErcHNsNHpLL0xiSXlaaTBN?=
 =?utf-8?B?UExCS3E5bWc3WUxzU3VFeTduM3Z1bXZsTXN0Unp4VXhZU0dmZDRVMnpPRWQ1?=
 =?utf-8?B?RzMrNWVWZ05GeVVzZ1NsYmRsMHR1REF6UnV5Uy9KZ2psWmVKNVpiYnczU1Iw?=
 =?utf-8?B?Z3g5cjU1ZkNNUW5PZ2hzbGpCU2VhTlR1UUx3YVBtb0FxcDJQSTFoU1ljaDdl?=
 =?utf-8?B?SzROSnVNM0daclRPeXJjY3hDNXAvZmNyenFkNWlmNDhzeTlTcEN3ajZPNlVi?=
 =?utf-8?B?ZzJJMEg4SHpuZi93TkhQWnpab29wdElTY1o2YmV4NVRvUk9rbG5kR3FEMjhw?=
 =?utf-8?B?Uk9qb1dpaDUxeFJCWGdHYmxNWGFoTFVYRmZlUzdhL3RNNkhBeG94di9XT2Zs?=
 =?utf-8?B?cENVdkhFbjgzR3puZ1lBaWZTSFJocW1nMDFnYlQ2Q2pnYWdGSFQyVEM3OVdp?=
 =?utf-8?B?b3Vwa014V2tQZWVMM2JhSHFCRjh3VUNLYWJ5MmJxeStOSUFXVzhsVjNJbjJH?=
 =?utf-8?B?RXZYNzZZWUtieFh5a2ZVdy9iM0srNUUyaEUzVkorcmU0M0R4MlN0WGtQTFY4?=
 =?utf-8?B?aHFrZVYvMG1kRHNsMW9NSzlZRXZnMG1YMExRcCtQbTBwc09xWVJqMHNrUit6?=
 =?utf-8?B?RFVjZWIrdTRqazBaeUVwOXhRMi9ZRkNDdStPczZYRjRKL1hlWVBTT3VtcWpG?=
 =?utf-8?B?RVMvcGJrNXFzNk1hRTZmY3ppV0Y4Z3BiZzNzd1dsWGkwOU9sc2FyT3NEazB6?=
 =?utf-8?B?NjVaMEhVd3BvRjJvY3NsOUdDZVJUcVpDdTlNOUhFc0M4VDNqWHRIZHdjMHp5?=
 =?utf-8?B?THpTRGNqOThRQ0Zrd2gySnl0MnhUdVZ3L1kxekx1V1Q5MmJ5ZTZYTEpPYk8w?=
 =?utf-8?B?dlVqNDlkTFBtMnpUclBWb1FYanl5UnQ4TXBWK2FNZndHNGhNMlRXb1RPcGE5?=
 =?utf-8?B?WmliYWZLRURVN2tnd3dQMXJhSlF1TFVqSVg3T0dhTDRLOUlUcE5sYmV5Q3NC?=
 =?utf-8?B?VS9BMm9EUElXUjJzTGRZY1U0b3pHMjhGc0VsVDRicWc2Tm5sdFNzeTBzNW9G?=
 =?utf-8?B?UytxSzM5clE0VTNXdDkvUWkvYXNmMU94ZTBaMFc1cDN6MzNieUhuVTU1b1lp?=
 =?utf-8?B?M2IyYnB2NlhzOEVJMURmS08yTXMzd2J6bjVZaFFHRXkxV3JWTllLSmw2dGp0?=
 =?utf-8?B?ZFkvbDM0eURXdG4yTmlzUThxMU13UkpxOUo2ckxtN0pobkFQM3hPSXlrWTUy?=
 =?utf-8?B?SUFQQk9vdDQ2TU9yYkxvZXZHLzl2eGdYcWpHYk1xMXJPU29mamhEMTk4WGNI?=
 =?utf-8?B?WEJoTk1oVzR2VklndVQ0Nzl4MmVCYTVVbDhLcVFqdHhOQWxLQjQ5QnJOeS9Y?=
 =?utf-8?B?SzNkaVMzZ09PbVBuUFFJbTlhUG5BSnVjU1lKRDhaQ05tQ0d1bjYrTmtGRktt?=
 =?utf-8?B?dTZSaEpsdHB3bENUQkhjQWFST0pvREk1ejQyVnFXKyszTk5saGVabFNzN3J1?=
 =?utf-8?B?S2JTSGg1NjhFckQ2ZDI0WmtEVXp3TUs1Y1dUU1ZMRk5aMGtkTUQvcUpiNDM5?=
 =?utf-8?B?dlBnQzFXbm1Nb1RzUE1lTW13Zy9yemJHdnNtWEdnbzZ5Z2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHZNcjVHanBLV0oyTkJJTGFjcWdwaXd6STNrVnAzRTkxSUEwcEkzZkloWVJI?=
 =?utf-8?B?MXJBZGI3RHNuVzdOTWt5TTRuQm5uclpQNVg3Ti8xamZFdGliTXJvM05TRENp?=
 =?utf-8?B?Z1FTanZmZjhuK0VMZ2lWOUgrS0l5SThEUFZtbmp4a1lRRjhqVHRqRU80eXVl?=
 =?utf-8?B?aGEwRnpWeDU2ZVdqSkJBMHl4cG1WRVJ5eUlBMHA2bk5NS1ZaVCtOUG56OVRG?=
 =?utf-8?B?WXIxTzRDbitLYWNKWnRkYy9PcUR2NkhhUjR3UHBsWE9oa1hOZGhwZkFxZ2RU?=
 =?utf-8?B?M1V3OG93dDRLZWRKQjJLVy83S2xKZTdrVDhheDhvUXpYb0FSQmFRL2xmWDNM?=
 =?utf-8?B?QUZTdUxhQmtQN1ZoWnM2QUprckZVano5emtEekhiaXk3Y3BpLzVWbVk5R0tO?=
 =?utf-8?B?d3ZOSGdwSW9BSHVQbVRpZkFLeGNRakZRWUlwYlRNd0V2cGpHSHhDaWFnSU5v?=
 =?utf-8?B?QkNDaUtjMEJzKzF4UldNalRQUXFrMG1lZzhuN0dsd3BFa1l2Vmw4QWVRSEdl?=
 =?utf-8?B?ZXEvUjhhWGpCK2FDVzlhWU9WQmtaNjNENTNGdEtXelhWdmJUYnU1MmJzUHdO?=
 =?utf-8?B?YSs2SmtWUHIyUlY5T09tSVJhbVg2VDZrTnlURkc2Q0x1bUNCVVZCdnEwd2Jm?=
 =?utf-8?B?Qm4yZ1dCMTU1TkRlQWk4SUdJTU9idkNUTUVQa0NOOGRnSEpMWHBQNERBczNQ?=
 =?utf-8?B?WjExYnVheHpSemdsbDk2TWVnd08weEhvWWRFcnljUUN4NDRQdmltRmNpY1Ba?=
 =?utf-8?B?RWtQSXV0bVpVb3FDRkZjd3ZFaEZPZEhQUzJVdzU0bDVEV1djVytod1RzUTNp?=
 =?utf-8?B?RlNTbzdrSE1ZdVFUYkV1ZHVvclRxVGhhcFdpaTE2aXV5YUs1emxvU0d4ay9n?=
 =?utf-8?B?UXJJeEE5QXU3RUxudmtmNFRUZi9lSDg4UW1uOVYrMzF2VkRsM0JrUTBhcG1k?=
 =?utf-8?B?T2ZYNUhuTkZvVC8rUVJmVE1ONU1UZ0YvQ1F4S2V2bC9xTmJKS2h3eTc0aWxR?=
 =?utf-8?B?cWdsSXcxT2dYK1dpa2hDU3lZYjB0bDlJdTlyWWdWUWh3L1haWnpIUXcyQ2hI?=
 =?utf-8?B?WEVqVnRacGo0RnlwRlkyVnUvWm1Cc0Nlb0ZuMXVrSWhKbXNkSi9HUlFHakox?=
 =?utf-8?B?dnhLTEUvelVndG1HK0hFMDhuekdLK0RHempBaVZ3UVphRDlyTnVHQmg3WW5o?=
 =?utf-8?B?eEVLalRpdTVmQlBteUp1aGE5UkRrVk52cUZ1eVkwYkF4SnlzV3hyd0NTd2t0?=
 =?utf-8?B?NkRqR1QycTNsOGlsQVc5QjZINmtIMTY0ZFVOVzBRZnlPeHVjYjIzb1NYanZQ?=
 =?utf-8?B?RW00a1RCa1llR2F1R1p0elQrKytGenVNa0xKRDFsVEVydlJQSlhyNVMweEhF?=
 =?utf-8?B?KzhuKzJ5anAyQm1KMHVibFVaN09MVDNwd21kcS9WeE5IUVJIOUVtR0VQVGJ4?=
 =?utf-8?B?Q1Nnd3hCSmdDcHlJdnBMRUVoNDdRb3dibG1wczZCZHMyVlNpVnpMZEFSQkxY?=
 =?utf-8?B?ZTBzYTdKbVA0S2dlSEg4YXgvaWFaK2RlR2Fmb1pLQWtNcUxsRmlVSklrMnUr?=
 =?utf-8?B?a3dJWUowcXFPQkJJcTREWnRwOTRsZ2tIMVF2YzIwNlB1bFM5STI3dDk5WUNx?=
 =?utf-8?B?LzUvT2lUcmVWSVhwTzJoaUJ3VHpxQzJqeGRwQWdjLzVsNFNqK2pMSUxIVitv?=
 =?utf-8?B?eXpGdUg4QnhjbSsrL0Vadm1kWll3ZHBZcUEyTlpCM2lSdHdUalRzRUYxc2hV?=
 =?utf-8?B?WDYzZUdUbGpUYWpKbzNVVkpoTTQ0TWVOWGxoRG5PLzBrcWhBb2pMZFN0Yklx?=
 =?utf-8?B?S3FlaHVpTnQ0UmFzcWpQUzJZWVF3MTFZY0pXSUlWL25jZXZOaWdYV0hxaWMr?=
 =?utf-8?B?VHZGa09VRUdUR3JFZHlSczArdGxzWVRFM296RWg5VUtCVng3bWxBWlRUaERs?=
 =?utf-8?B?Sm1RMTRsSWdUVFl5N2JEODFQMWZ6c3FwMlVVNjY0YXlTSGRxQ3l3T2I3dWVK?=
 =?utf-8?B?Skt3bVRoYmhQOW8xdlVFc3IrK2RKQzVLc002NHp1aUZYYVJGL1dJWlpMWkQ3?=
 =?utf-8?B?ZVpQVjVoWk5oaDBhNlFVQmlCc3ZacUpaWkJ6NU5MSzJPNTdiR1hxai9MSFN2?=
 =?utf-8?B?dlF1M2xHT0cxUkQ4QkhSODArTmdOSmdlTDdkUk9QQlBSaUVsemhkam1CUk03?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f6c686-1b68-4887-60e2-08dcd3ce56f0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:30:35.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHWbQwxUvfaD2rNI4Uz17mlEXeQ3+i4igBP4AdmMh1fs31qV6oryhMYcWk/p6psjwW0bEyaEH8Mg7zHLcUvZCD2eqKdebDZcPqvCNtxLBLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
(System Integration Unit Lite2) hardware module. There are two
SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
SIUL2_1 for the rest.

The GPIOs are not fully contiguous, there are some gaps:
- GPIO102 up to GPIO111(inclusive) are invalid
- GPIO123 up to GPIO143(inclusive) are invalid

Some GPIOs are input only(i.e. GPI182) though this restriction
is not yet enforced in code.

This patch adds basic GPIO functionality(no interrupts, no
suspend/resume functions).

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/gpio/Kconfig            |  10 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-siul2-s32g2.c | 581 ++++++++++++++++++++++++++++++++
 3 files changed, 592 insertions(+)
 create mode 100644 drivers/gpio/gpio-siul2-s32g2.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..75a6ca60ebc7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -643,6 +643,16 @@ config GPIO_SIOX
 	  Say yes here to support SIOX I/O devices. These are units connected
 	  via a SIOX bus and have a number of fixed-direction I/O lines.
 
+config GPIO_SIUL2_S32G2
+        tristate "GPIO driver for S32G2/S32G3"
+        depends on ARCH_S32 || COMPILE_TEST
+        depends on OF_GPIO
+        select REGMAP_MMIO
+        help
+          This enables support for the SIUL2 GPIOs found on the S32G2/S32G3
+          chips. Say yes here to enable the SIUL2 to be used as an GPIO
+          controller for S32G2/S32G3 platforms.
+
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..fb6e770a64b9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SIUL2_S32G2)		+= gpio-siul2-s32g2.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-siul2-s32g2.c b/drivers/gpio/gpio-siul2-s32g2.c
new file mode 100644
index 000000000000..205a1a4d216d
--- /dev/null
+++ b/drivers/gpio/gpio-siul2-s32g2.c
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SIUL2 GPIO support.
+ *
+ * Copyright (c) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018-2024 NXP
+  */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define SIUL2_PGPDO(N)		(((N) ^ 1) * 2)
+#define S32G2_SIUL2_NUM		2
+#define S32G2_PADS_DTS_TAG_LEN	(7)
+
+#define SIUL2_GPIO_16_PAD_SIZE	16
+
+/**
+ * struct siul2_device_data  - platform data attached to the compatible.
+ * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM tables.
+ * @reset_cnt: reset the pin name counter to zero when switching to SIUL2_1.
+ */
+struct siul2_device_data {
+	const struct regmap_access_table **pad_access;
+	const bool reset_cnt;
+};
+
+/**
+ * struct siul2_desc - describes a SIUL2 hw module.
+ * @pad_access: array of valid I/O pads.
+ * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
+ * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
+ * @gpio_base: the first GPIO pin.
+ * @gpio_num: the number of GPIO pins.
+ */
+struct siul2_desc {
+	const struct regmap_access_table *pad_access;
+	struct regmap *opadmap;
+	struct regmap *ipadmap;
+	u32 gpio_base;
+	u32 gpio_num;
+};
+
+/**
+ * struct siul2_gpio_dev - describes a group of GPIO pins.
+ * @platdata: the platform data.
+ * @siul2: SIUL2_0 and SIUL2_1 modules information.
+ * @pin_dir_bitmap: the bitmap with pin directions.
+ * @gc: the GPIO chip.
+ * @lock: mutual access to bitmaps.
+ */
+struct siul2_gpio_dev {
+	const struct siul2_device_data *platdata;
+	struct siul2_desc siul2[S32G2_SIUL2_NUM];
+	unsigned long *pin_dir_bitmap;
+	struct gpio_chip gc;
+	raw_spinlock_t lock;
+};
+
+static const struct regmap_range s32g2_siul20_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(0), SIUL2_PGPDO(0)),
+	regmap_reg_range(SIUL2_PGPDO(1), SIUL2_PGPDO(1)),
+	regmap_reg_range(SIUL2_PGPDO(2), SIUL2_PGPDO(2)),
+	regmap_reg_range(SIUL2_PGPDO(3), SIUL2_PGPDO(3)),
+	regmap_reg_range(SIUL2_PGPDO(4), SIUL2_PGPDO(4)),
+	regmap_reg_range(SIUL2_PGPDO(5), SIUL2_PGPDO(5)),
+	regmap_reg_range(SIUL2_PGPDO(6), SIUL2_PGPDO(6)),
+};
+
+static const struct regmap_access_table s32g2_siul20_pad_access_table = {
+	.yes_ranges	= s32g2_siul20_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul20_pad_yes_ranges),
+};
+
+static const struct regmap_range s32g2_siul21_pad_yes_ranges[] = {
+	regmap_reg_range(SIUL2_PGPDO(7), SIUL2_PGPDO(7)),
+	regmap_reg_range(SIUL2_PGPDO(9), SIUL2_PGPDO(9)),
+	regmap_reg_range(SIUL2_PGPDO(10), SIUL2_PGPDO(10)),
+	regmap_reg_range(SIUL2_PGPDO(11), SIUL2_PGPDO(11)),
+};
+
+static const struct regmap_access_table s32g2_siul21_pad_access_table = {
+	.yes_ranges	= s32g2_siul21_pad_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g2_siul21_pad_yes_ranges),
+};
+
+static const struct regmap_access_table *s32g2_pad_access_table[] = {
+	&s32g2_siul20_pad_access_table,
+	&s32g2_siul21_pad_access_table
+};
+
+static_assert(ARRAY_SIZE(s32g2_pad_access_table) == S32G2_SIUL2_NUM);
+
+static const struct siul2_device_data s32g2_device_data = {
+	.pad_access	= s32g2_pad_access_table,
+	.reset_cnt	= true,
+};
+
+static int siul2_get_gpio_pinspec(struct platform_device *pdev,
+				  struct of_phandle_args *pinspec,
+				  unsigned int range_index)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+						range_index, pinspec);
+}
+
+static struct regmap *siul2_offset_to_regmap(struct siul2_gpio_dev *dev,
+					     unsigned int offset,
+					     bool input)
+{
+	struct siul2_desc *siul2;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->siul2); i++) {
+		siul2 = &dev->siul2[i];
+		if (offset >= siul2->gpio_base &&
+		    offset - siul2->gpio_base < siul2->gpio_num)
+			return input ? siul2->ipadmap : siul2->opadmap;
+	}
+
+	return NULL;
+}
+
+static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
+				     unsigned int gpio, int dir)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&dev->lock, flags);
+
+	if (dir == GPIO_LINE_DIRECTION_IN)
+		__clear_bit(gpio, dev->pin_dir_bitmap);
+	else
+		__set_bit(gpio, dev->pin_dir_bitmap);
+
+	raw_spin_unlock_irqrestore(&dev->lock, flags);
+}
+
+
+static int siul2_get_direction(struct siul2_gpio_dev *dev,
+			       unsigned int gpio)
+{
+	return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_OUT :
+						     GPIO_LINE_DIRECTION_IN;
+}
+
+static struct siul2_gpio_dev *to_siul2_gpio_dev(struct gpio_chip *chip)
+{
+	return container_of(chip, struct siul2_gpio_dev, gc);
+}
+
+static int siul2_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	ret = pinctrl_gpio_direction_input(chip, gpio);
+	if (ret)
+		return ret;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_IN);
+
+	return 0;
+}
+
+static int siul2_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	return siul2_get_direction(to_siul2_gpio_dev(chip), gpio);
+}
+
+static unsigned int siul2_pin2pad(unsigned int pin)
+{
+	return pin / SIUL2_GPIO_16_PAD_SIZE;
+}
+
+static u16 siul2_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(SIUL2_GPIO_16_PAD_SIZE - 1 - pin % SIUL2_GPIO_16_PAD_SIZE);
+}
+
+static void siul2_gpio_set_val(struct gpio_chip *chip, unsigned int offset,
+			       int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int pad, reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, false);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			      int val)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	int ret = 0;
+
+	gpio_dev = to_siul2_gpio_dev(chip);
+	siul2_gpio_set_val(chip, gpio, val);
+
+	ret = pinctrl_gpio_direction_output(chip, gpio);
+	if (ret)
+		return ret;
+
+	siul2_gpio_set_direction(gpio_dev, gpio, GPIO_LINE_DIRECTION_OUT);
+
+	return 0;
+}
+
+static void siul2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+
+	if (!gpio_dev)
+		return;
+
+	if (siul2_get_direction(gpio_dev, offset) == GPIO_LINE_DIRECTION_IN)
+		return;
+
+	siul2_gpio_set_val(chip, offset, value);
+}
+
+static int siul2_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct siul2_gpio_dev *gpio_dev = to_siul2_gpio_dev(chip);
+	unsigned int mask, pad, reg_offset, data = 0;
+	struct regmap *regmap;
+
+	mask = siul2_pin2mask(offset);
+	pad = siul2_pin2pad(offset);
+
+	reg_offset = SIUL2_PGPDO(pad);
+	regmap = siul2_offset_to_regmap(gpio_dev, offset, true);
+	if (!regmap)
+		return -EINVAL;
+
+	regmap_read(regmap, reg_offset, &data);
+
+	return !!(data & mask);
+}
+
+static const struct regmap_config siul2_regmap_conf = {
+	.val_bits = 32,
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap *common_regmap_init(struct platform_device *pdev,
+					 struct regmap_config *conf,
+					 const char *name)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	resource_size_t size;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	size = resource_size(res);
+	conf->val_bits = conf->reg_stride * 8;
+	conf->max_register = size - conf->reg_stride;
+	conf->name = name;
+	conf->use_raw_spinlock = true;
+
+	if (conf->cache_type != REGCACHE_NONE)
+		conf->num_reg_defaults_raw = size / conf->reg_stride;
+
+	return devm_regmap_init_mmio(dev, base, conf);
+}
+
+static bool not_writable(__always_unused struct device *dev,
+			 __always_unused unsigned int reg)
+{
+	return false;
+}
+
+static struct regmap *init_padregmap(struct platform_device *pdev,
+				     struct siul2_gpio_dev *gpio_dev,
+				     int selector, bool input)
+{
+	const struct siul2_device_data *platdata = gpio_dev->platdata;
+	struct regmap_config regmap_conf = siul2_regmap_conf;
+	char dts_tag[S32G2_PADS_DTS_TAG_LEN];
+	int err;
+
+	regmap_conf.reg_stride = 2;
+
+	if (selector != 0 && selector != 1)
+		return ERR_PTR(-EINVAL);
+
+	regmap_conf.rd_table = platdata->pad_access[selector];
+
+	err = snprintf(dts_tag, ARRAY_SIZE(dts_tag),  "%cpads%d",
+		       input ? 'i' : 'o', selector);
+	if (err < 0)
+		return ERR_PTR(-EINVAL);
+
+	if (input) {
+		regmap_conf.writeable_reg = not_writable;
+		regmap_conf.cache_type = REGCACHE_NONE;
+	} else {
+		regmap_conf.wr_table = platdata->pad_access[selector];
+	}
+
+	return common_regmap_init(pdev, &regmap_conf, dts_tag);
+}
+
+static int siul2_gpio_pads_init(struct platform_device *pdev,
+				struct siul2_gpio_dev *gpio_dev)
+{
+	struct device *dev = &pdev->dev;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
+							    false);
+		if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
+			dev_err(dev,
+				"Failed to initialize opad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].opadmap);
+		}
+
+		gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
+							    true);
+		if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
+			dev_err(dev,
+				"Failed to initialize ipad2%zu regmap config\n",
+				i);
+			return PTR_ERR(gpio_dev->siul2[i].ipadmap);
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gen_names(struct device *dev, unsigned int cnt, char **names,
+			   char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_remove_reserved_names(struct device *dev,
+					    struct siul2_gpio_dev *gpio_dev,
+					    char **names)
+{
+	struct device_node *np = dev->of_node;
+	int num_ranges, i, j, ret;
+	u32 base_gpio, num_gpio;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse the start GPIO: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret) {
+			dev_err(dev, "Could not parse num. GPIOs: %d\n", ret);
+			return ret;
+		}
+
+		if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
+			dev_err(dev, "Reserved GPIOs outside of GPIO range\n");
+			return -EINVAL;
+		}
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int siul2_gpio_populate_names(struct device *dev,
+				     struct siul2_gpio_dev *gpio_dev)
+{
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++) {
+		ret = siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
+				      names + gpio_dev->siul2[i].gpio_base,
+				      &ch_index, &num_index);
+		if (ret) {
+			dev_err(dev, "Could not set names for SIUL2_%d GPIOs\n",
+				i);
+			return ret;
+		}
+
+		if (gpio_dev->platdata->reset_cnt)
+			num_index = 0;
+
+		ch_index++;
+	}
+
+	ret = siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
+	if (ret)
+		return ret;
+
+	gpio_dev->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
+static int siul2_gpio_probe(struct platform_device *pdev)
+{
+	struct siul2_gpio_dev *gpio_dev;
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args pinspec;
+	size_t i, bitmap_size;
+	struct gpio_chip *gc;
+	int ret = 0;
+
+	gpio_dev = devm_kzalloc(dev, sizeof(*gpio_dev), GFP_KERNEL);
+	if (!gpio_dev)
+		return -ENOMEM;
+
+	gpio_dev->platdata = &s32g2_device_data;
+
+	for (i = 0; i < S32G2_SIUL2_NUM; i++)
+		gpio_dev->siul2[i].pad_access =
+			gpio_dev->platdata->pad_access[i];
+
+	ret = siul2_gpio_pads_init(pdev, gpio_dev);
+	if (ret)
+		return ret;
+
+	gc = &gpio_dev->gc;
+
+	platform_set_drvdata(pdev, gpio_dev);
+
+	raw_spin_lock_init(&gpio_dev->lock);
+
+	for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
+		ret = siul2_get_gpio_pinspec(pdev, &pinspec, i);
+		if (ret) {
+			dev_err(dev,
+				"unable to get pinspec %zu from device tree\n",
+				i);
+			return -EINVAL;
+		}
+
+		of_node_put(pinspec.np);
+
+		if (pinspec.args_count != 3) {
+			dev_err(dev, "Invalid pinspec count: %d\n",
+				pinspec.args_count);
+			return -EINVAL;
+		}
+
+		gpio_dev->siul2[i].gpio_base = pinspec.args[1];
+		gpio_dev->siul2[i].gpio_num = pinspec.args[2];
+	}
+
+	gc->base = -1;
+
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_base +
+		    gpio_dev->siul2[S32G2_SIUL2_NUM - 1].gpio_num;
+
+	ret = siul2_gpio_populate_names(&pdev->dev, gpio_dev);
+	if (ret)
+		return ret;
+
+	bitmap_size = BITS_TO_LONGS(gc->ngpio) *
+		      sizeof(*gpio_dev->pin_dir_bitmap);
+	gpio_dev->pin_dir_bitmap = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
+	if (!gpio_dev->pin_dir_bitmap)
+		return -ENOMEM;
+
+	gc->parent = dev;
+	gc->label = dev_name(dev);
+
+	gc->set = siul2_gpio_set;
+	gc->get = siul2_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	gc->direction_output = siul2_gpio_dir_out;
+	gc->direction_input = siul2_gpio_dir_in;
+	gc->get_direction = siul2_gpio_get_dir;
+	gc->owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(dev, gc, gpio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct of_device_id siul2_gpio_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-siul2-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, siul2_gpio_dt_ids);
+
+static struct platform_driver siul2_gpio_driver = {
+	.driver			= {
+		.name		= "s32g2-siul2-gpio",
+		.of_match_table = siul2_gpio_dt_ids,
+	},
+	.probe			= siul2_gpio_probe,
+};
+
+module_platform_driver(siul2_gpio_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP SIUL2 GPIO");
+MODULE_LICENSE("GPL");
-- 
2.45.2


