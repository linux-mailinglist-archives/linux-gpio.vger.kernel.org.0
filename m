Return-Path: <linux-gpio+bounces-38899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x9iGDodPPWpo1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:55:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C36C7342
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:55:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=BJSAFm4K;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38899-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38899-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EFC83056AB5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4AB24A076;
	Thu, 25 Jun 2026 15:54:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC0E309EE2;
	Thu, 25 Jun 2026 15:54:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402893; cv=fail; b=f8X10Q/2Jjh1Os+3kq32KLCndPnpIYNHPqFPJkX9EC6JOcZd8Tw+P52zI5YTMbYKXmYH38QG38r12RulaIyZ8JiSPliBurAgaLTD4G0LWYsmLrqbm9r2XPNl601yJg56rbVKlFbHCWIUdQw3+n3vXi4AJFQMIgTQHx9lSSM+ujc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402893; c=relaxed/simple;
	bh=4GWGcwkIVWq/nRl/nlRCPoW5cR4x3rnoz3tOWWYhgWc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y9jv2nfV6SMPe8ZKjgBrktfTNQAwnnCOvIrQLjZQ6wvaudfuGYJNUwPsMeKfJFMcTekZZOZX7rp7bRU5mZzqebRQPCeXNGXgKnUydd228IzlkrIor4PuNnVvhyoHcmkazmF3CjfgDi4H9ygU2NHQRApKIEZlj2qoa5FFUUIgf4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BJSAFm4K; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXR8AdGqPBrvzWV0aohXE1ddNRDtiDm+WibZvPcyVdyGlx0a6J4h8XedGBy13orbfEqOXhcQA2T8r0sEFIAkTixXTwXFTKQbv+EGR7W0R6m3jkyy42PEcUX0M65Ze/PE2UUKUbDIpv3W5pQubERVA6b2tpjP8Eau12RB0jxWeEJ+gyTCzpWZN3Wc30X/1WtfDLEbA/bn5HKvNEDMqsfL5h/vN4GrPPJ+j+3sLxC1OEppE1Xivc+lPLKA81i/enbaGhApVndHP6D0lGnPNijMn7wcWXwaq8AT3ELJ07uTaDeXYMHco5oGLgecrSisoKGlEtWSWbst3ZSW/ddUTMbk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lc7nqnZVTFoTmi8443OB2OKCYSrRnEC97oLbbWI59w=;
 b=Le8kX0AJ2m6dToYvI++L7Uxn0CBYPbHs4lbrsC8NzBkdAqSFNVwUU0aRqaijo+b9k6XcKU/qDUtW+1btHnenKAToX/kHqsLUF6ze+2HDqXskoqS/ldThvD7Ps4i1tyy5DX0JIpHQO7I+ObiXvCLCkgr+WsyuR+xdnND9Kv6MvNRj95yAR2fl7kSO7lZKh/xHs04XaTc7mg8VXDdO6NqVHUw+j8ZwRe9olwVm+NFPwNvk6i0WslP9liO+CIXksDNcWc3UV0D8yvbVpf9H1AuCN2UiXqvwOCc1GcAsFl3NW7psj+PcnUDBovK39nn8ilEa7lg8XBFN4hg9OcJ/xUdmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lc7nqnZVTFoTmi8443OB2OKCYSrRnEC97oLbbWI59w=;
 b=BJSAFm4Kuh5ZGmTFQtlScvbdzl646VxGDlPlzOWh/gAWnJfVYqOdU1LFGtZKBrGjetPnfSAWMhpOABSPcnt26+k6AEi9R6Xu4kTvvfmb+/u3LSzPzKvOf2P3FHkOdnzW2550wwj00Dood7q5QLdoOleoe+5bjCfhLZVQszN/gxMdfdvQ38q7cmCNMCn4BG3p/iZV4rG8D5tldFCAFqxc7KX9Scz2zl+4ZBBqHIxTXwLiOdWlv81cB1YIyg6BJYRzIIthLqMd0VJo08ByE5fKVh52rMNeJOte9ICfC5UyvFnJ59Wz7ajucYDHBTKMqAth7O4qXzpKBqldsrBAPVSX/w==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:38 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:38 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Thu, 25 Jun 2026 10:54:25 -0500
Message-ID: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:806:130::14) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: a251b707-2f02-4bc4-4d41-08ded2d20f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	akx6FwOlf6cs/CRAc1v7ZUOp6/NHX43dNYGHRZFHXd1/gzGOJ5dPrQM1MGk6QMbVZ+HFBIyKwnN4pY/UAuYpDdE2iDK0gg01M1yRF09r5DDFIVWSX3mjHkpJA10BhAOmRw2YnSWm26smTrrteZ6n2wRKXwF56rCv4CAaG5UhZEZ3uTXyz+FIX3QO0cCtiaXNwuHOFK0zTQAmecJFHHNHbCgMw2h/1hYWMT4N82fBcEm+/hfxdITEg22zi05VMqIJLPFAL71wlb9x4ZceMu1VpPUku8e2lkyGGtgOUfuZh+N+76mM7u9gfVRizeMJJbbXwlF3nNo+Inaeo4h6Fj5gTIhmX+/Gw21yJI/TqksS0uxoOAphqwKV8gfv6MuyQu6ZyFqLljGRDLGDy4VFIglsXrwKXoLo5AA2ZzaoZSnynMAPWWn94k4XyzfP50wxuM8+uooPvq90mkiQoVzh4Ltw7Tp+Y9PLllXLgMzeLYoPljP4+oIgOETIe3Qwb5ErwcegvctYZATnQO79OJ6VtlSqt4SC0OMF6ACqgN0E+LEdphgrFZAUS0ip41i9qFzPLMAixp2/jMLYx+KJ0zqHAXhmzjjhat3xtgizydZM4fbwTaTOMnUg8KDAFWjimUrrasD8/HxCDihja75KmbZhMuJm1IZC6aFNSaeFGkPJ4iBL9MPWDouDjeNOIJ/E35eCVt68M9C43a9d/iQga0zM1Ucxog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekg5b0lGV2lxeS8reG5jcG5yVHcxZFpSRThmMWtHZWd1RTBteS81N1lBVFp3?=
 =?utf-8?B?N2tHeGpnU1pJcnZaOXI1WEduTkpXNSsrWEl5QXMva3hySFZvcGpVRGJHaTlJ?=
 =?utf-8?B?bE94MEE2ajJjUzJySktBVHhRTmRBMytiUm9Mams3SGxxNURYaFV6LzUwZkFY?=
 =?utf-8?B?TEx4eVkwdkExSFY4SkROWDJudWtQVmVkT1Jyem5EeXFSMzVDam9LYlA1YTla?=
 =?utf-8?B?UWI5elRWM0hRZEtPNXBQRTYrZ082YU56ME01cDd6ZnRTZHdxbW5pNTUxV3RH?=
 =?utf-8?B?UDZPbEswTCtybGJPNHEvc0NYNDkvOVlIbThuL0xyd0FIRUxDSk9zdXhiQlBl?=
 =?utf-8?B?dlJjdkI3dkRmeUtUVUdmeXhSVnhVcHpEbFBqRDZLaDgvdU9rb0ZyNGpxc3hR?=
 =?utf-8?B?UGxsQ05TM2Y2QUtvRlVCTS8xQmVOOGQ3VENIeHRqbjVYUlgyU1k0MWJkVGZ6?=
 =?utf-8?B?dCsydnFsQU1Sc2l4aDZlRUF1ZElVMk8rZC9IdXhUMGxhMWV6OWovam1xencz?=
 =?utf-8?B?UGg2ZjR1S3V2TmExRmVuVmJuaUoxOXZDZmlVVVFxdVVQQXNYNTFnN3BmRWtB?=
 =?utf-8?B?YWZRMytqTmxIU256cE9HMUhuWW1lTHVQTXk5M2JlTkpMd1hhV0J4YzRFay9M?=
 =?utf-8?B?cEpJVjFHV3E4bDNRQ0tJeDRkTURFQ1l0aHdjbjE3MEw5dWJMYUZLa05Vd0F3?=
 =?utf-8?B?N2hiZTdZaG5GUkxXTldoaEluTmU5ZmF1MW1kU0J4N0VZNEM2Zk03WE91ZER2?=
 =?utf-8?B?TnB6NjdGMHZ1ak9Dc3V1TlFRZmh5OVZGMHBRSDZZaDJhQW9sNGZBZDlwSmMv?=
 =?utf-8?B?eDRjRUZMb09LbzNPRmYrVXEwSkFCTk5Yc3lGaVdNR2RIaDdzK2Y3Tk1rdzlq?=
 =?utf-8?B?bDlrOEVpaGpIRTZxWDZraEp2N3ZHdm4vaFFhODYvUW8wTE5wZmVLWDl6M0dE?=
 =?utf-8?B?Z1lSbHJjRFlnWndIRXpJeG5mSEZSUWN2U054WEt1QXlBRnFzOGxFbzhHbjF2?=
 =?utf-8?B?SFhudTRMR29wSEVBL2JDcUVpWlE3WTRiVnRPZ1VnaTROOUVNT1k5RGF0emZi?=
 =?utf-8?B?TldFdnZxd0pJUHBiUTZkcmx2L1N2N3E1N2Fqei9WQWRaVGJ4SGlacW40N3dX?=
 =?utf-8?B?VDdta2xjQWdPbVRYZzBoR2F4eStxNHBVNnkvc05PUHVqTmg1L0ZSeVRyOCtv?=
 =?utf-8?B?NkpKMnMxSUpGdTNaVTdwTzYzZlNLNFk0NGpDRnZhSUNSZnZOUE44MkNzM3Zh?=
 =?utf-8?B?c1ZKNGFzM2o3ckZlTy9xekg3cHlDR1dEeFRtOFl2MjFFQkpkU1ZWbERLeW9P?=
 =?utf-8?B?aWdxNDdVM2pxajNiTWtsRy9hZWU1YnJBYzYwRmN5Z216L3VtZVV1T0l4cEF2?=
 =?utf-8?B?SngycjNneXJ4MXdxVnlsRGJRdmErSVYwQUovRWFGbFpET1BGTm5RRFF4YVQw?=
 =?utf-8?B?Vzc4ZlB1OE5xdXowSHVDSFdYVXdCbUhScGNUK0VkcXZwM2FDUzJiejBEUzU4?=
 =?utf-8?B?QVRmSGFIdGhxVkVnd2J1VkxJWWtxOVA2UnVFcFZnUktMQ2doN3MyTmZLY1RZ?=
 =?utf-8?B?dXNOdmg5OXZyUVJ6OVRqcG1uNE5JQWlpcHJuUXIzTDNRUGl2Q1c0QisyN1pm?=
 =?utf-8?B?RnpCblp3YU5hZ1lDaVQrR1FyMzNYNUlrMU56bkhMU2hJRktiUlJGT2xPZ3hH?=
 =?utf-8?B?K1daWTU3K2VNY3JDOGFGSWFrejVsVUF1d1JQTkQ4blJPMGJtUmFnbzl6SEF1?=
 =?utf-8?B?aEJJckxjcjZ4eXp6dmJsV2VNd1kzWkN1RHZQd1lXNG4zcWpjOWphOW16UFJo?=
 =?utf-8?B?TDlPa0ozbEdXbTBRb1hFWXRqVzI4MmhHUU5ZYnFtYlBBRHdNU2ptUkUxbDNz?=
 =?utf-8?B?VmRBV0pvNWR1ZytWNExzYlY2Q2xPZjZ5eXpxdnE0V2lGZGhyaXVWaFBKbWpE?=
 =?utf-8?B?a1lZcy85NXV2eWFlQkNrRmZrcmk0Rk9GWTR4MEpySzJzaTNWSlhrK2lNQm9u?=
 =?utf-8?B?NzFUSkZNdTV5TjFYNXhMTlBhMkRzMlAxN1Z5SjE2TUFid3BhbkRUVndlNHNz?=
 =?utf-8?B?ejBRZnZWVHo0eDlyeklYU3FOR3U1ZHc0VFJTZ2QvRktmUlhBMWRHNjA1TnU3?=
 =?utf-8?B?UXZ1a1lxcjhrRThnbmhpR2twUjBtd20yTHhjV0Uyd1lGQzZpUWpQTmluUGJw?=
 =?utf-8?B?SkxZMkZKcDZKdFBPa0VDeFFrRjBTVzk2Y3VyRkxCNWF1L1kvaUovWWRqY1VU?=
 =?utf-8?B?cnk2Q0dPeGducyt3dS9PVUhwRTBPanZHNlNzM2E5UVpnczFTYlpMZ2U0YURi?=
 =?utf-8?B?dkQvczBnQ0c0SmFkOXJTZEVNSTFMaVVNQ3drUWVxT3JiVjhNZ2VyRjJlaUFa?=
 =?utf-8?Q?cKEAuAGwRONNLgeK44Q9u8i9/8W6HT8MMCBem?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a251b707-2f02-4bc4-4d41-08ded2d20f96
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:38.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPYLBna1O7E5fCOzFXBLnp11IsohCMfel/vulb1yvPbPHbqvbSkHfZ5W5Bu65GNCcP2E5llQjDG5SsUUzF6A2PjCTAL+fIp3gMCr5GlEvp1H9zHQSynQvpRgHXJ/MBF/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38899-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C56C36C7342

From: Shenwei Wang <shenwei.wang@nxp.com>

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v14:
 - Update gpio-rpmsg.rst per Mathieu’s feedback.
 - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
 - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.

Changes in v13:
 - drop the support for legacy NXP firmware.
 - remove the fixed_up hooks from the rpmsg gpio driver.
 - code cleanup.

Changes in v12:
 - Fixed the "underline" warning reported by Randy.

Changes in v11:
 - Expand RPMSG for the first time per Shuah's review comment.

Changes in v10:
 - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
 - Add a kernel CONFIG for fixed up handlers and only enable it on
   i.MX products.
 - Fixed bugs reported by kernel test robot.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  rpmsg: core: match rpmsg device IDs by prefix
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 271 +++++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 568 ++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c                    |   4 +-
 9 files changed, 994 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


