Return-Path: <linux-gpio+bounces-36603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKS3KVEwAmq/ogEAu9opvQ
	(envelope-from <linux-gpio+bounces-36603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:38:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B576251532A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D17030095C6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D474D2EE2;
	Mon, 11 May 2026 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0qO1g0L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D64347A0C3;
	Mon, 11 May 2026 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528327; cv=fail; b=oE1j/rjBq6QtbthyosOpCC9+t+9cVHv4E5MQTHsJC3V1F+92f4nRGy67gVybh6PaB9EShqnyV3kivkmQKlVQsteAMJsM0LGFfaaHwBx3Kx6ITEqxywIFPP+Wh8Tvxhhyb+l2t7JAj9NZSVG2Z/5LobUA+xL/fRFcXdLlyiaK8b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528327; c=relaxed/simple;
	bh=c4ffoR4YUbe0GtXOgtxXlzH/13W5O0Qi2Q9yq9diJjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W3LEqgG3rU33+BHABsRQyGb3+dJ2PzuU51nyzpYjyQeO9OMHgg0A7Sa8waONyA2NGdPgefOmsij0IlQq35sDTLYDg86r4hLH1e4aj4C9ZhnrLW1c3o6xi2f2LlG57Op8IV4PUXn0xy/GGKGI3+BxhQ4ttYtj0uPshfyxijZOjww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0qO1g0L; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/lt7uXCgNF+ETU8CFkw/21EailWjH0jfUjzhmXLBleC42XTT81mm0B/dwoo5oFl96v2swGY7y4Xh9wwwmMZwPmLk688biB6k7VxoF8W52jk37iJGzNenCcfbHH9UuPWeRS4qQo0kl9juDkC2rCBwX0be7uwTntnQCVbGdfF/e9DiVUmbdqXqXVtFWqH4gS+5p4eWmpF5KOWLFaXrDwOJmjfKs2aWxIPA5qL8jfcTOQ5RmNBNGk6isbgQplLkGDbXVS/yBEAbpna4/YPebfxIpdUnlXc69aB7OpDlcskjfJq60h4gpTJp3H7Sfy3F7zmXjV0Bw81OcOcl83JuyyDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cru/PifwDYDBIPwaagUdHg0Sa//tTVH6HYZs3RP+Xw=;
 b=FOWPXPqWvji/+mhgHANDkeKa3fsAxPuLKon6jxROY0vclRODdO+3L/E7ee6ncuKlmiyR7CR/aDAZdGN25cNuyf/rr8u3NZwm+QEP8An0mS1WNrnnqwxSkN10UYxSeRC36g3jx04pynIOgQUMCJBgnihxs3Gc3ZDquHgNuNbUQAGzvj/hOXUSjaZ48saJqDBpF0rIxCwE6S3zDaDGqpVhJSk6caleicgPPAHSqkpFAwW5DkGuehU/5u48R0RRyWIDE2+6SAvhRRWlK2bYZR89dDGpjq1BFKnzSwj58lDb2xDIgHw4i/b6qocZBgc5151UdNjCU7EYaZ6w/0nOYIhEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cru/PifwDYDBIPwaagUdHg0Sa//tTVH6HYZs3RP+Xw=;
 b=H0qO1g0LSHcJeAZvcGQx2So/1Pm/6PVzORMF7xSsQIzapfBYFanv2p6Y4Nfj+CEWH1the6GzxsnqGb9HehiXRvsJfgEErAQ5jJxG7up6Tfq3onuOpZ6LO9LvQHPICFREVmhRc4WfbVLRAIEwIknPUpjXXhPQl/MzLZ40BbrTFSrZqis5WjdpL1/8KlA5D7+X2cnW3Nc7GjN9tQ4VKfiWHd6r0JgdXY3GWQfeKaJm9AwfmMxJR1QYNJ+yvGseM55SvvHAZZ+tAk12qPbw4Llaek+ieUr1OuSSKv1qTXyby9Yk3iGtpne4MvWticQ8qdc235bOG445mgl/FpSfTijXvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:38:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:38:42 +0000
Date: Mon, 11 May 2026 15:38:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Message-ID: <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
X-ClientProxiedBy: PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: e3159b21-d387-4d48-4e34-08deaf94e86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	JkIPkJQs2uFbHDJE4Fn8wh5/nKKTJS3vskg4KMfcW8GpmvJl519rEibAJ5pynMJV7LuZFadbfCQ377KzSfXQpSEDijJgWGNDmj3wxbdvJiHh1v+CrlrpdMcl8ADBzp9x19Rq3l9d4TocaDCWnOy+BT4yxDLjZ2lEeUD/+OjZkEFjPWcA19xCzO2TlMAwDgrXDlS1QUlbl/aMqPi+d/9hb8dk7Cdc3DKcXrX+YSGX+n+vV1Qpf6gjKUivbJd+08CaqjLdYuy/3v67bRUxDw4IcW1BYxmb3ZuX+Fk7m9Yzl6PG1NsbH+aVQTysuaDimsU8wJlXJr4lZzCHXabKGGDfp1L1K5oZsGwpgHbdVD1PxsoWdcFLnNk9V6MBoinMx8NnnDi+oRPr04bNwRUrbQMpmSQwQyhHDIXJpr7oX1apHyeLsIcKTzVQX/PZ/8jzgk7Cz5ZZNHrbUy5Bw12lcgWcDe7VjT1eC2KCXV1tMGkSHvwtggmK57T/zbGR+3yQf65+uOIOOe4J/EoFpb0K+PkP/yFK+2aRqKZlGxUlpS74HNBWDUIbZAsZeX9JLOZkCtZzoUxyVYJ6lHHof6mtAGnLR+QL1gC4/PdwKeSpjxFJF85KBdxm1Uh07Kku67axwH+GnWd7F3e0iW6qOXVZAcpScIFxzG0KsT4CjCmaqsqu6JE7kKinHUZD8Krnzg/PTxIKWG16iCUHsVwpUSZGpYsS9BPfdt0Mv6FP9E2Mx7kqaUgGU/XZMDGplqyX4xwCYYke
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkZHbFNnWHE1RGpwNzJ2NjA1V0hHTDcvVjJidURsamNYWTVzeXJTYkdGUGxG?=
 =?utf-8?B?M0o2cEhEUENpSUlsNDRTY3pNWm1lNnpoTmNENzZ5VzlaTmRLQ1VoYktiaDRE?=
 =?utf-8?B?dkNWbXJlM3kwL0dOVklzM3FoS1R2YlpiL1BxQlV6bWdPNURTWkVJSExXWnV0?=
 =?utf-8?B?UEtyMU1ZTENIL2U3MUd1OVdHdXM1eUdoZlVTdnlZS2ovcXM4WFlqQlpjMkxQ?=
 =?utf-8?B?VUpOUEw4SC9lRlh5OVRRcUtabVgyUUxmbHBHRUFaQnZzMS9HczY1cU5FajJL?=
 =?utf-8?B?bHFrSmdQdVV3Yit6OWlJd3RqNnVxTmlCb0h3YytFK1lwSDNpUEsxVHU5TGsv?=
 =?utf-8?B?MkUvcVhKbDVsNXVyK1IyUkJTVEhoSUxTVnFiekU2NzA1d0htVXh2N2U4V1k3?=
 =?utf-8?B?b3VXaHFlWldoOCtqTVhrUTlUbllMc3VyWmcxRWRmR0xROFpNbXZZbmVlU0R2?=
 =?utf-8?B?WEZFR1FHSm5RTy9uaTJGMlFZK2MrMVJSZGVQZEQ2RVZoYlpxeFhzK3Jhajl5?=
 =?utf-8?B?U0hwajhKNVZyK3VsTlhTcmZkamE0aXJCNDlvT2N4Z0FsVnhIcjAyRFhQcnNo?=
 =?utf-8?B?cENUNnNxZVRtZEFvZEhXc1o5K0lzbFVWN0lsaFZMMWNKZWd1ZGtwK0plUjls?=
 =?utf-8?B?SG9IYWRZNzZESGx0TkpXRHZWdUZRZ1VQWEdEQ0s0NnpzOUJVZzk2RHZzZ3BD?=
 =?utf-8?B?YnFxZ3ZvV1BIUzhrT2l5Q09wRFp3TS9TakVRdE1xL3RSZGMzTnU2ejhtOEdM?=
 =?utf-8?B?a2dYemZZeTRRUFlZc3BpSGJ0SDNOdXZ3WUk3bGwyaitKZW5Lc0FIUHRaK2Ra?=
 =?utf-8?B?RVpKeURoRUt1cm1wemFoWEExUWU3TzhWbTJFWEFEdjIvaldPSzREcG1uRm4y?=
 =?utf-8?B?WEQzZXZjdlB6T0R2WmNIOXpjdzJNekV3U1FvUkpUckV6VzJuUmo2SURHTE1o?=
 =?utf-8?B?OVV2Wmp6em81WUMvSU9vZlNsMkYwcmMzZlY4MmE1dExFS2cxeXFDd0FVZXpm?=
 =?utf-8?B?M0VtcDBmZFFvVDlLU3U0LzdhSDgwaDJuNm1qTUNvaWpxazV5RzU0eWhHWW9Y?=
 =?utf-8?B?MG96dDcyTEhmc05GTzdaZ1ExVTZFWVk0Zit0UlptcEYxMmt5bnVYSHQ4ODEv?=
 =?utf-8?B?YjlPVENXYU81dTBxaXQxK3dxUzExL1o1Zm5oOGdCZDdOd0VJM2gwZWJrQXQ0?=
 =?utf-8?B?SXVSK3k3T0ZTaUI0dGVUeGhiRGx1K3VCV0NjRDFGT3AxV3pkemQ2cTl0ODk0?=
 =?utf-8?B?a2Y1K084OTdhd2FxTnR0Rzg2eTQxVWdKWjdXZVQyZkk1MXI0aXpHUDB3eVhM?=
 =?utf-8?B?RUNVeE14KzZxQ0drSnFraVNhM0F1elkzTUVaVzhUb2RIaFFOVFZCa3FSYzY1?=
 =?utf-8?B?ZEZFTS9sRWFFNndWM28yN21Dem9IWUl3Q1ZMSUpNeVRwbEo5cENFMlV6bEtK?=
 =?utf-8?B?ZkhiVy8yVjB1SzAzNWp1MzlLbnRwSkpPVnVGN3YwbVJLS0I3QndiZkY0YjNi?=
 =?utf-8?B?WUV1S2JiTGt6dmZMUWRxUllIS2NqbUt3YjNxU3JoOTdYVnFxdHJqMXdiSGxh?=
 =?utf-8?B?bWh5bDI2YzlRbjlHVzc2Vkhrb2IzWHJFQ3RCaTY0enU0SHU5S2ovUGRJUkxa?=
 =?utf-8?B?ZGVOWHcvcXQvWnpYanNFMkVhWjJZL0ROK1NzTS83UkU3RTAyVWhJKzJJclZx?=
 =?utf-8?B?WUhwTkl3cU5JK0dpUjlpNzRXRHBQU0M3OUVMQnFJb1liV3pQRWNwbUlGVkYz?=
 =?utf-8?B?NGtBbDJIcEh3WWhvZ2J2MkI1OGUrRFJIcEEwbDJURDZIWmF6NTRGZEQxVVAz?=
 =?utf-8?B?dFloc0NLYzlyd00zR1RwVytQV3BnbHZ5QzRpU3c1cWRrdGFlZDJibDRSY25T?=
 =?utf-8?B?U2lyWFE2amF4YnltN2tyb3NEOGNkemFRU0RpVjZ4ZzRKTzBKSWREeU9YQVR6?=
 =?utf-8?B?QnU2eDlNZU5NUzJzWDl1WWlSTkRuSjJNRXp5YWdsOUZVbWF5a3c1dUV0Vkl3?=
 =?utf-8?B?R0ZSVmFkMVB5T2tJUHhTL1hxcktGcHNuSGkzSHcxSjRNWXRiZmJEdkRyWE8w?=
 =?utf-8?B?MDBUTXFxMG9hYjlNeG5UN05wbWZpeHlvTUx6VGVHeXl4UjJXQVJLNG5mZlds?=
 =?utf-8?B?Y0NmSmFjKzUwdS9VV2t1RGQ4ZXJkTkpBaERSU0ZCbndDckxPYnFvZDFibkVI?=
 =?utf-8?B?aXd3Z1RZRm9xK3poSDFuRWFCdllaUS9hSG5Ga2V5L2dTbjhRSzlqMUk5eDNT?=
 =?utf-8?B?b2ROeUswNVV2VDBYOThRSm9nRE14ekNQRU9jRzVxRlUySThhV1BuZEQ5L2hm?=
 =?utf-8?Q?+hc3jnNwcnY8MQbwLJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3159b21-d387-4d48-4e34-08deaf94e86e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:38:42.5881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5B7kY+IrDgbdgWTwQfY8ZG9X5UHfPgShLaC+VkkUwZndrtXlo1j/kKVuLtI/1834TDreLxAWATCxjLgciBFe9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177
X-Rspamd-Queue-Id: B576251532A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36603-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 02:50:17PM +0200, Linus Walleij wrote:
> Hi Frank!
>
> On Tue, May 5, 2026 at 1:55 AM Frank Li <Frank.Li@nxp.com> wrote:
>
> > Add a generic pinctrl binding for board-level pinmux chips that are
> > controlled through the multiplexer subsystem.
> >
> > On some boards, especially development boards, external mux chips are used
> > to switch SoC signals between different peripherals (e.g. MMC and UART).
> > The mux select lines are often driven by a GPIO expander over I2C,
> > as illustrated below:
> >
> >         ┌──────┐      ┌─────┐
> >         │ SOC  │      │     │    ┌───────┐
> >         │      │      │     │───►│ MMC   │
> >         │      │      │ MUX │    └───────┘
> >         │      ├─────►│     │    ┌───────┐
> >         │      │      │     │───►│ UART  │
> >         │      │      └─────┘    └───────┘
> >         │      │         ▲
> >         │      │    ┌────┴──────────────┐
> >         │ I2C  ├───►│ GPIO Expander     │
> >         └──────┘    └───────────────────┘
> >
> > Traditionally, gpio-hog is used to configure the onboard mux at boot.
> > However, the GPIO expander may probe later than consumer devices such as
> > MMC. As a result, the MUX might not be configured when the peripheral
> > driver probes, leading to initialization failures or data transfer errors.
> >
> > Introduce a generic pinctrl binding that models the board-level MUX as a
> > pin control provider and builds proper device links between the MUX, its
> > GPIO controller, and peripheral devices. This ensures correct probe
> > ordering and reliable mux configuration.
> >
> > The implementation leverages the standard multiplexer subsystem, which
> > provides broad support for onboard mux controllers and avoids the need for
> > per-driver custom MUX handling
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> I put the pinctrl patches on an immutable branch for testing again,
> if nothing explodes I will try to merge it for linux-next ASAP!

I fixed a build warning by missing doc 'np',
https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/

Anything need me to do futher?

Frank

>
> Yours,
> Linus Walleij

