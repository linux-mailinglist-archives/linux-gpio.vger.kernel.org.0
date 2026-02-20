Return-Path: <linux-gpio+bounces-31940-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDp8EdEfmGn0AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31940-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:48:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62846165E96
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 681FD300B2B3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4111B3112DB;
	Fri, 20 Feb 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wBWoOKnF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8531062C;
	Fri, 20 Feb 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577274; cv=fail; b=EhOWcyM6C/5eaOPvKGOruFdrZMFcXaVLBjHS5qPbFaRqSO2tkXH8XIaXZIprdrIIQUz68uF7HCeknJejODdwVz3m/d4gvPAACFFNdlPMKgErQRA7tWNV9pbmwgqpFnlupF2COGZnvVnvy9aEWg3Hmzh52cg0pxX6e0TLx8t8AmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577274; c=relaxed/simple;
	bh=ndmJX2bAVK0zn/BTvEhYADboxiY/kOJrgO2sgvkJqyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i/BqDG2HEDtPRz5IjxfDPSS9MiBhYK/sJd2KhROLSHXCbxi4X/SJj4nOquV1XQ3tUXBwcaUL9B6SbEUWRRCrXLKd9uXVCROgDvp04iAtAjhNdLFyX9asN2tTjP3e2VNm44CWqa+eFkcUj3xtOeLQMt1nXRkLbTLZ8x6q8mPpRSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wBWoOKnF; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuYaidyca8r5x/8eiarqImKNXB6h9XKpJy90OzsQ6CmLurlbvEJ1ShbvBrKTJsUNf0iIueOHvbQpXoOor6AGaQFPNS+0fdHNdiu4f4YrMMTQOso3iBQt4+CNVRYuIjF2UIMugJ3tHq07utvgwgUO/uBHaEQiH6HClNAXnwiO4Jto5ZRIKnByiXxEsWibjvTNA72tg82Q04qv2RFrgOO2wVZJv5u/1R7xtMcI1OeNu8lek/ER2OhMr93Mg+G7QyIyJAohFtZ5fLqRHUQIGaQgv7OfVaiCDxtnt3/KTiQSny84IXZXVa0yZ6MTRsq3ZglbEdeH8Be/hEgscd1ABMLWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIhkCe7CmzfbabXRD9t00HBnBd4brvboD8QtChLHNE=;
 b=uFque9kwv9KtyC3CoqOy9Z9bE6fXiBB2s3XggmPk/PzbcV36Fvqse9Hi5SvaOha2cUl7QhnfAwgaPTZM9d4+kBRZx/aoyOJA4iGR7C1Si/RfVuJVmOYGOhfydMqp3cHAEP7qqq8wM8NUKT6ssMf/wEm7y2x3t9y82kxukbgK84feq1Hne675mT86jZik9wihwwymkYHQFgxEBbPWr0kNjckm2EauC+xboJ0gfG9CAx2tH7qhxYf8YlrlH8tR1ZznLfczNbTID4b7CSYKjfGcqzF4w+hpKSQ0YFPoKaf4t2ycWUty6/4XtY4Fqj/zKspYJfK4m/Yvpp/0hT54aZ2afA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIhkCe7CmzfbabXRD9t00HBnBd4brvboD8QtChLHNE=;
 b=wBWoOKnFJpSdW8TtxI93lTRGL6wntQfdXRXOKqaqUprmbSbsnFlDR9NX/ysVCLH8Dncxq7Pis/JrmfgAEd24wnMS7u4are7hox/DykpBH/YjeIh+S7rIBpvaT7+yVlp7FGbiCWyguAMeio3Tf94qDYJoBmeZacMawYi3fyX3o9WhVQ2eaFMDS7N867V+pvN/4h19i7XB0LhoSxIp00YFtF2zxqrJu+Uhj3Cbo8xSuYNniKFy6wSbO0Kn4ku+Bd7h+S0Lk3BzstyMaOjMxRSlgxyA1V+WuASAJDjrckp6nVznKVpZc74kgXnOrPGgVwFLlhSX/MNCypIHfu0vjEAJSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10912.eurprd04.prod.outlook.com (2603:10a6:10:58a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 08:47:46 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:47:45 +0000
Message-ID: <4d41eb9f-037e-4751-b878-202f7d613001@oss.nxp.com>
Date: Fri, 20 Feb 2026 10:50:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: add generic board-level pinctrl driver using
 mux framework
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0009.eurprd03.prod.outlook.com
 (2603:10a6:205:2::22) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10912:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e540f24-633f-4ab7-1eb3-08de705cb7aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU5DMFh4MCtFWW1PM2Y0TERIK1BYYzRCK0JBQXBBSVlOK2VkMThCNFVmMjRK?=
 =?utf-8?B?RVZOOHJ3SUw3T3lmaE1KaHpVQnRueTlJQ1psbkdTQ0xTdXA3TmQrMVJvSXY3?=
 =?utf-8?B?ZU1sUzFZaDVlYThrRXVrL2xrNGVFOHFYVWx5ZUtZVG5wUDdaZVJzRDlzQUla?=
 =?utf-8?B?czlrZjdwem1ZaDQ1eERSMmlLdEVJUjQyR0JlTC9qWE9oMEZrS29YMmRzL3pa?=
 =?utf-8?B?V0xLckJxaGtuRDlSVExBdnV4SldLV2hiRnlieG84M09CS1p0VEtReGttK0FM?=
 =?utf-8?B?QjdBeUJ4VlQyZmJRV2RRMGNGVjB0MUJOa0VRZWRZQUhnWE5UR2tPcmlEa01m?=
 =?utf-8?B?aS8rc2Nka0YzK3BidWdJQ2ZDMncwSTFNSzd6WGlQeVNjQWd1dVRvTnZ6NXBq?=
 =?utf-8?B?NW9aUXYyK1FNOVk2cE9xWDE5cWY1N0NHRUNpbGVSWXFXZnQya1krUUU4VUJm?=
 =?utf-8?B?OFMyNkhnV1MzNXMrakJGeGk0UFV0V3ZrQU03WWxiZzF6RjhXdXFQTUFQakJa?=
 =?utf-8?B?WmI3QTZwRmtzT0hiNDdXM09waFdVTEZKdEV6blZoeklRNCtQLzFWbDJadlZM?=
 =?utf-8?B?a05ZVlZsTzZFNUZyYkgrZGdIRHNLYXBwS2UwbFh6blg3ZkMwMU5TbTduK2hQ?=
 =?utf-8?B?UTBCb1I1ZGc0N2Q0SEd3ZmJhbm1mckFIWERVaSt6ckZ3U1U4c3A4UWd2NjI3?=
 =?utf-8?B?L1FHelNxdjBQWk10T2lqejg0U1A5VVI3R1N6SU95ZTcwTFgyajExdHZmMzB3?=
 =?utf-8?B?dTV5b0U1c0NzU244NFRsNjB6ektZdFAwYW1iamE2bUZiaWRhNjJSRmNQNVpS?=
 =?utf-8?B?b2lJazJBLzl2UUlteVRYeDlWaTUwZjVPMkwyQ2FCUjNqK21NWmxJbGxsTk5V?=
 =?utf-8?B?QXg0YlFqb0FMZjlocmxtQ01wYzMyV2NaVXB5YzNnM3lPWTFuQVJSSFk1d1JH?=
 =?utf-8?B?bFRudkpSenJVZi83NHpSOEhUNGYwUWZnbDlFUVlKbUg4Qi92OVpva2FrWlMv?=
 =?utf-8?B?L3FoamNHQXlDcXhuc01WT3h3bXgvSjdhc2lWa0V0YlEwL2pSdUU1NG5JYncv?=
 =?utf-8?B?c3ZOZHBLdXM0WG9yYVZabE1pYU96M002YjkwdFQ4L3RzZjV2bUMybzNkQTN1?=
 =?utf-8?B?L3gwWnF5ZUpneDVINWwrcWJpb1A0amFIUzVqVzhvVDZPNW01UEVmZE14RENy?=
 =?utf-8?B?V0t2eUZNOW5XSTVUeWhqNnA5aGh3Y1o5ekkrdDRnVVNoNGNVWWFDaG16ejlQ?=
 =?utf-8?B?MWtjTmZ6TVhjZHlaM05PQzJKYmJDODF4eU9GMFBWU0JJdEwxT0FkM1FOdlVs?=
 =?utf-8?B?SDN0SW9RMDdmMXpsOTJvd1RxVVhsZlU5QUlMOHYya2l4eUMveWtnYU5YbUdJ?=
 =?utf-8?B?R0QvRXpIUDZ3WURmV1QwQU9WcFNsbDBmNkExRnZhVU43eStoeG9ZWXduNm5E?=
 =?utf-8?B?NmRkZjNxek1yTmtwY0JIeTljU05ZeGJYeVpVVnpxN2lNb0xtU2dSKzI5UW4x?=
 =?utf-8?B?TllNcE41K0V6TEVhMlNWczA0STM0dWhUdG00cE1NcmtmMlFWRE1nUGFtVkVM?=
 =?utf-8?B?TUZsTURuUlo0NjBMYnJNaE1SbVdGQnRJQTlDVEtQUDRhZ3J4UFVHSEFUMVY5?=
 =?utf-8?B?aWVhWWx6MGlDcXhDUU9ramlubFRIQ3Zuc2lFaW9wYXhsbllrR1VTRVZJcEdS?=
 =?utf-8?B?KzdJNmRFOXQyRkNrSXhxYSs2bk1kdXc1ajc2QTIwOUVZYnNyanZCTGNLZEp3?=
 =?utf-8?B?enZ3VXhLV0oxeWVWRkZnVmpTQ2FwL2RPYWQzWGVvY0ludzhweWUxNnh4WnlG?=
 =?utf-8?B?ZEw0ZUlBNkNOZ245bS9pT0RjZmRNTUhhaEJNNG5LSVVWeWZHSXdURkZwaFg3?=
 =?utf-8?B?M0NxcElVQjlZWHZqZ0NyZDRrTzhEN2ZTd0ZnL21rZ2pUZWM5YXFiZVNRcVdq?=
 =?utf-8?B?TUVEeDFpaUxjZUV0dXZ1ZEZEeWtqS3BOWUtqaXhQa29kYXd5eUxkVzBPMHJL?=
 =?utf-8?B?bi8zL3h5ZW1TZ2lONzdkeXYyN1VyekJXeDZUSjNnUy9NYmdJOWZ2ZHRWeW1q?=
 =?utf-8?B?bnBmNjVDN1dCNTFDb05TVXpuUFJnSE1MOTRqTktFYW16MEtuKzNQSHlrYXd2?=
 =?utf-8?B?eEdBK3JsWGtPSG9jVzlHUW9Dd0dkRTA4eW1HdW1DSmJmay8zaWNmZE1xbFEv?=
 =?utf-8?B?WWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEVoL2FSajVvRWZCT1ZiNUs0dFVNbGkwRysxK3lQZEdyOHhyZGNCcEQ1OFFs?=
 =?utf-8?B?TkFSL080ckJZNHdEZVhDazlnOHdCdmY1c013RzVxanMwclRaaEg0WGtuV01y?=
 =?utf-8?B?ckJPZjhIcnk0dEpiSGpTVllPQWJVOWRoakladHNGcXNyK1JJYVd0VmI2SXoz?=
 =?utf-8?B?WUVJT3Jydm52Q2R0T2ZaREEyV3JBSjdtM05WVGs5Zi9xZHBBcUsxVHErMnMw?=
 =?utf-8?B?L1o1bFlscjErUUdwRHNXeVVrY1BFRFFFUGdhek52NDFnMlFsMlhlOThOWFFo?=
 =?utf-8?B?bjExTlpzTVh4dC9nejR2dmZWMUxUSmN2QVVoc1pPUCtqYUwrOUxrLzUrUEll?=
 =?utf-8?B?cFh0OXpMMHkvdFFPZTBlR0FLckRjaXVtZWxVVkxiWjc1TnZSbHVxUHRnSklV?=
 =?utf-8?B?OWxyclF3Q013TndmeVhDMFpFaUJCSGlkYU9DWFZyN25EZFhvTUErY29qWlBa?=
 =?utf-8?B?SzlybWtyUE9qaDNVNjA0TDNjeHhac1krZnRQcVhjQW1LTnp1MXpJb0d4b0l5?=
 =?utf-8?B?eXgzV21ZQ0tlUG9VWWlKVHN0N0tHUDZta25WV3FhZGp0Q1RlTEliUGNQamVz?=
 =?utf-8?B?S1ZPRElmenB5bDRpcmNTcjE0Sm5IaldSc0M5V3dnaStkYm5BSXRFeUFtUDBs?=
 =?utf-8?B?Rlh2akcvRTU3Wk16aG9yRm91TGhybXZsekhoWHRmZjRyRGJSQ3pyTG40Nldr?=
 =?utf-8?B?SjZUUnhRYU90SW14aDA0YlF4dVFJTGp6SUxJTnBjUGJHZzhrbnBMcGphQWNq?=
 =?utf-8?B?YkZtVDhScy84ZWhJUENyVFlGZVhPRGpUcGdEZzVleUFvS0RlUnhZdERRMGVW?=
 =?utf-8?B?cGRXL1pVcVU3eEFhSk8wUlFEMEpzd1VVQlZ5MHBJbFhCU1Q0QkJvNkxqcUsv?=
 =?utf-8?B?dFRYZW5FQ0VybytSWWFZVXFSM1hoanVvdGN2b04yV3djRzNPYktGRm5Da0VH?=
 =?utf-8?B?VjFIUkdkKyt0UTU2WENURFk5NW8zajZCeXBmZDVpZk53RkEraTAwNVcrNTZJ?=
 =?utf-8?B?VVp5MFd2bnZDZW5FTWM2QmlRc0V1RVJyZnJVbkFuM3ovZVUzSjdpRFArTXUw?=
 =?utf-8?B?SnpOdlJTYnhPa3NCanpBVk4zWXU5UFZhU1diVVp0enhoN2FCVERyR3NZQ1lR?=
 =?utf-8?B?OG1JTGJITFJ0SUg1cnpmcTFTTVFaclcwSHMza2Q0aTRCamxDQmswZCtKc3M3?=
 =?utf-8?B?eFpsNHREbEcyUFRtUHJ2anVrT2JvSnpiUUorVjJNL3BUdE1Ydy9vYVBMbEtx?=
 =?utf-8?B?eHErSUZHNitkKytvMkVhUWYvbzh0bE1reDMvVmRneXpwd0dob2w5TzVnUWNG?=
 =?utf-8?B?anZzTG5mem9MTUY2Q3dwV1V3OHIwYWJCWHo2a2pndjYxY2dXL1B1UGRYaDlX?=
 =?utf-8?B?cjdIa2NEaFdwbDhsNDBPbUFhbTRrWS9CQ3BneDN1Zllqb3o3SjNSUjN2c2Fx?=
 =?utf-8?B?RElnS09zNmlZc2Z5NVdlU1p2bmVwYWl1a1NLL05vTnZKWm1hU0l6MlpDZGZW?=
 =?utf-8?B?cnluNW8wNDRrUCtVbkFjWC9HZldNSGZRQmN3TkNXR1FZN1ZNbG1ERmhKWS9l?=
 =?utf-8?B?UStWdWRsd3Z1ZnlKUE91Y2ZtS2NpRy9ERlJZSVZUcjVoMUZFaXhxRDJkMTFY?=
 =?utf-8?B?b0FIU2JpaXNRUzE3VldiaDVRN1lkM0RsUEZBemFLQ256cFBjaDdNY0k3YnFW?=
 =?utf-8?B?M1ZxenlCYkM4NEZKZmhJV2w0aWhSbnFWb2pIOUROWjZEMEgydHArdnQ0YUdB?=
 =?utf-8?B?VGNnblJud1B5MlZMVXpzdzBpek8zZkxKdE1xZlhUcWRPWnloZUJPWTRFTVVl?=
 =?utf-8?B?TWhaeFNoZU1GdVJOcHJwTlRCeTdzSVlYQk5RM1VvaFlWQWJVUFYxUm9lb1Ew?=
 =?utf-8?B?aHhMTEFERXJtRkk1UG1pNXUrVnRnS1BTcWd1UjNudVd5S1pzSzVnN09sczN5?=
 =?utf-8?B?R2Q0d3BKTXpKSWNSby94bHhRNU9aa3B0ekd3TDBGR3ZTZXJnOGx5ZnBDRFhx?=
 =?utf-8?B?ZUdKL3lva1BvYmZyQ1AvU0pMZXZoM0FCUWdHazhCTWUwRndOZkMxSnpKSlcz?=
 =?utf-8?B?YzJOK0VtT1pidVRueVg3aHlEYlpiSEw5YXFyUmgzNUlqV0xTd3ZTaHRTeC9Y?=
 =?utf-8?B?MWJwZU9NT1dmRGxvNmF1ZXJlZ281WmdneTJUWjdlZ0JsanFsVzlZMTFjdHk3?=
 =?utf-8?B?QWQ2bGlSNG1NMzNXS0wwRUVDdUR5cEJDc0J6TnViT0tGT2YrOUQvc3E2NGps?=
 =?utf-8?B?eGkrTXhSYzVsaERlbzBQTm1PVGVMNlkrdlNOREhBN0FrMzh2NG5iRFBUdlNK?=
 =?utf-8?B?M0J1ZFM4cnlXcy9sWGJlVFZXem5CMDVuR1VUKzJCY295TlZzTmRHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e540f24-633f-4ab7-1eb3-08de705cb7aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:47:45.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JGJGtH3bBqrMp5dQFr6Wq0XQ4yVtgmBtJT2qM02/Yj4tJxeL3qqFd4qJqQDKR/itTPxRf+twTOx1CRgrfKIcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10912
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31940-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62846165E96
X-Rspamd-Action: no action

Hi Frank,

Few comments inline:


> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic Pin Control Driver for Board-Level Mux Chips
> + * Copyright (C) 2026
>
Copyright 2026 NXP

<snip>

> +struct mux_pin_function {
> +	struct mux_state *mux_state;
> +};
> +
> +struct mux_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +
> +	/* mutex protecting the lists */

what lists? 


> +static int
> +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +			  struct device_node *np_config,
> +			  struct pinctrl_map **map, unsigned int *num_maps)
> +{
> +	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct mux_pin_function *function;
> +	struct device *dev = mpctl->dev;
> +	const char **pgnames;
> +	int selector;
> +	int group;
> +	int ret;
> +
> +	*map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
>
if (!*map) ?

> +
> +	*num_maps = 0;
> +
> +	function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +	if (!function) {
> +		ret = -ENOMEM;
> +		goto err_func;
Do you really need this goto? Previously allocated memory is dev managed .
> +	}
> +
> +	pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> +	if (!pgnames) {
> +		ret = -ENOMEM;
> +		goto err_pgnames;
>
Same here.

<snip>

> +err_mux_state_get:
> +	pinctrl_generic_remove_group(mpctl->pctl, group);
> +err_add_group:
> +	pinmux_generic_remove_function(mpctl->pctl, selector);
> +err_add_func:
> +	devm_kfree(dev, pgnames);
> +err_pgnames:
> +	devm_kfree(dev, function);
> +err_func:
> +	devm_kfree(dev, *map);
> +
> +	return ret;
> +}





