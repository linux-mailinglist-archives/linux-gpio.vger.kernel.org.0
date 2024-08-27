Return-Path: <linux-gpio+bounces-9193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27F95FF3C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F40B91C21CAF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C6812B63;
	Tue, 27 Aug 2024 02:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="qHRa+6dS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70017543;
	Tue, 27 Aug 2024 02:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726638; cv=fail; b=ss5yNan+uRMy1jQW8zYK6dDrsqvCSTlYwmsxGJPphx8nU/ON2DDYZik81ZVGf18dO/DVquYSm8Jqlv6ttRgTjlU/WKnDlX7KwFId5f57SlG6zypV3k6UI2vt3CF26drqpPiTsg0qlgbQoe43DAvco1us1k0JsigpWJ46jY0iEwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726638; c=relaxed/simple;
	bh=qcVwEtHsXGEm5oVN7ttMY80u3hqJBaLMuTyZuCyn/MI=;
	h=Date:From:To:cc:Subject:Message-ID:Content-Type:MIME-Version; b=l7mfs12gl4Gb6yQ9wKKg5KOi7Q+axOqnHfGy8EzAZ2Uo/YOM2a+dB4iNAsneI1t5mqXKoeWpAUft8drAODIfzWSw29ABNPYEZHQAP8RtlCEyDIUHtTx7U8y6lRupDdJtlX8USszRgBgatn1IgLX9xqVQdFPCwLsN6uicOgpVccI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=qHRa+6dS; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177]) by mx-outbound22-208.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 02:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouUa/Ha7W1TVf0ixc5tM1CcyW5kUiQo351SCcxwPCqGDmIfaQSz/WTDGovI4fKHcmEgLKCkNelYgV86K4TX1DNtkqwBYCaSeC0o/KeZGrHgky/8IKGbC8PZtNAoNzf1XrkAVvLVt6eRlNM7xDjhvRfqqOE/izFs4m0s/d59R/OpgfAu+4EP0Dg3ioRFHsx6mHP/kZ4C5kDO36FA4Rs97OAVEiaum8/8E5FjhRRnoHxrQjYgRHugivFbSJrdGmJs6tw5C72sWWODQS5wdBAAiTiw5Q/Lg5ZGL5wMkmdmWaZTTFQqalnBEA0PRjMzoeevjgfJiUjdLAo9++SmO34kXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et/TtYtSIRTd5m0+2fDxXyIfC54HNHWqrhTxyXJPmS0=;
 b=FYe6LummUNqqmIf1dNRO3K+zG00J4pSferFnhDn0jP/8+8WKthtfpH2tCo+H/93tc6j3ujlmiiON2ITLR74YOaK1Mx+s8AMr9jEUpi7ChRjK04Luz53Zy1GADXP4AYULsx5MAqWYBHgV9f6xABeDHkN+NbKgzpdOU61WmxkQXukeEGeXrkvDuUW8l3hGKGPNCuFe5s1yBTRHDa4tgW9vHGUa8tpQSjffk6Vaqqc6Q5/npPNHHABbqNwrpFoulNqjFS4XWwg6ipkQwqDmrCplZCPZqZRM81DhJZWHOV2RtPyCVdC9v7sdFP2ZFeQUeFK5cntUUoyrmDZMCJTpnt6mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et/TtYtSIRTd5m0+2fDxXyIfC54HNHWqrhTxyXJPmS0=;
 b=qHRa+6dSXGd24WCCjz3VCfYBjZlH6CTtadXHI6hgT1UQKVUhGpEaM9E/FEZP1Jq7cQzf9dODigvy41Z8L/ZQ+Jj6A+yu7URlDp6rsht71lsDWqUVyXL8PWDSa005SQyJLN8iNGWPDvlskf44xyziOR5fX4CbZDF0XbrKs1ZoXVWeu0PS4auLu1UB6kAye3Z/EZPyP1Nk7nq0g30ByF0yvSuQjOrlftibwqE9Zmbw1hjttHynOh4/ENYbyf6IAVSa8CWjB/qY6IdbRL7YmVq4aIxgV1p+ZWCvthjwlZQ1DJSZuyEDXSHyN9QvqrDAF8gkQkDC/IPFwGVDM/p6UjKKbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DS0PR10MB7432.namprd10.prod.outlook.com (2603:10b6:8:155::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Tue, 27 Aug 2024 02:10:52 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.006; Tue, 27 Aug 2024
 02:10:52 +0000
Date: Tue, 27 Aug 2024 12:10:44 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: linux-arm-kernel@lists.infradead.org
cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
    Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, David.Leonard@digi.com, 
    linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
Message-ID: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>
Organization: Opengear Digi
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SY5P300CA0001.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::13) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DS0PR10MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: c29354a2-ae4f-40dc-c9dc-08dcc63d7a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UCF+Zk8oNdqUem4QxBkBf+SzuzrCsyVKVPCwqUGdlJBJg5LrNFkHksfj7bal?=
 =?us-ascii?Q?JqJwgDJiS+CiSqR+wYISgwx8v3sYG3FkMEMG8WiCY3jMnfH5+Clu7OKk3Oic?=
 =?us-ascii?Q?vNxdljOCfXP7hgPy8OaTKVJ5wG3BVrwLT2OPLtWmUVjPhbZWGgXseUxOqiiL?=
 =?us-ascii?Q?nABu7KAY3kZiAxPfUgUhovulwuHc0LJTKFYDQxDSUVd1XZ6HeiOQKgn1EeIG?=
 =?us-ascii?Q?7/C0PRSmWxgrVWChOhL3TU/FDOj4rlA08Rujb497b/aKfQiN2zrwiPtUwg20?=
 =?us-ascii?Q?ieAjotMQvcn02K1HyGjTvksteiv6qmW/Wqx8p9NQh7k6RNEWXArIUSrN2VbT?=
 =?us-ascii?Q?AqsM9SLbf7oxUqVrXnBoRjeMwzH934pZnCT9IB4R0T9nG1vgMQGVM4kn9a/4?=
 =?us-ascii?Q?Fzt7GfvGp4bzR+AsWD48nrxvI/U3Mgemuty9+dSO7a5BN6mffp4nPS20WWgF?=
 =?us-ascii?Q?HYvMVo5P2ifH1tUyclH3dnw1Cexl3yrPJuFPqNn2LY7ZLwcuq2weBATMZtT+?=
 =?us-ascii?Q?wagfFZ7FRaZzOIGJNfSuOcMEWgA40kr9j07vLiWTJONTt6JM1bVX7mjc1VUl?=
 =?us-ascii?Q?vmeVppoTb68f4sf41OhB545qBjBpwz53Ht4VtLwRLA3u46JkaBp7cJm7eP3x?=
 =?us-ascii?Q?JDXOXb//kQ3oNowV5BlolJLEyWzFvIJYszA0LOWXUVMaJaVOJiUeFnGLVv81?=
 =?us-ascii?Q?oFeWSuWVj2yg9cF7ciJteJnJZQDaXK69r3VBBP97UWUyn3YLydzn/g6bPpdn?=
 =?us-ascii?Q?pKblvalSJedwabNpVlsBZIa1Dv/Cs7/33tCess4d+/5muLdtSd746iOh30iV?=
 =?us-ascii?Q?AJJk0AF+1LbiWPfaoxHrFJ3cBf/mGqdbqrIF+q/VR/bQaZqn96QGrby2pexQ?=
 =?us-ascii?Q?8CfGjACu0zAjR4umjPZIzcdSM3GqHy10eBTUVAXTeCG32O86r7alIH1DbIG+?=
 =?us-ascii?Q?G4Xjqj7wgxQzr0nHa9Mq8VwFc9bMh526oKWU72J9+79gzJgR9+2BNV9TYYti?=
 =?us-ascii?Q?+TfKzcykXA74bcs8mH3p67YFl1WKORTlaA/zWzDx6buuQdpKy3OQ631OLUB6?=
 =?us-ascii?Q?zI9rrOCnLMbKTqu4+3zHi0Hmbty7wlArJRgIYr7jTlJTdGExpL4a39g2p4fM?=
 =?us-ascii?Q?IFr96zk+biMYShfd48hG80MpKUGjl2lwLdZRjSSAej9FlHEzB1RdDNGyD7bn?=
 =?us-ascii?Q?cyRYGMK5MpeJGISaJ1dH22wRygqAPLbhEWes0ML7giKudKDckBPCOeuwWj5p?=
 =?us-ascii?Q?6wvLz8H1HBDvabjKta34Fu2DxcxxyzkYgZqNaxNVfAWdG62bpVHoHlWAG9vc?=
 =?us-ascii?Q?H4k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SEbw2gCLmUPGzjb3r6F22s/Nt+V2fhTrQK9mpteW+oT3QYMyJQsKSDX/G3rw?=
 =?us-ascii?Q?scnY2jvYj8gJdcMn7kGFWwjOvKyDKDBB31IbpYXeJmif58/qKY+uLVic4zZt?=
 =?us-ascii?Q?zZL7Pc2VN6S6BRXbZyMQLAUgrekS2c0jKangUeSBHVlJtlSFui5Fa5tyGo0e?=
 =?us-ascii?Q?7I6n+m0nTmVkWHoxAIiwSJo8ptYV0HWMbRW6lSA8yhgrlhKZmoT2bYiXMCBw?=
 =?us-ascii?Q?l3yp2bp18xmsE3GLW+wQfxGjbbMiFyHIlICE8N3elmc7tdNd2D2mmA+gLXuH?=
 =?us-ascii?Q?UkIsxmF6XiVnW+RpbRpzl2On7UbwVdhZ3tIqWTkf15UfyDzq4jzBoRl+35Vm?=
 =?us-ascii?Q?PgQ3r2B0so8ZhOO4x4zbdFD2zfra7T6WC2HPmqaQoL3xsC1+euoDA2FsIc5W?=
 =?us-ascii?Q?mXSTZMInDVdnL/jomE/GdIecUXkgvQrYyuKZAwX13TmTls4uFKUpVo0ms//W?=
 =?us-ascii?Q?RDUTOMiFjQo0MWl6AfvfNVPb6wMPd3NwQ/3zO3DREFIriXhVyQ4C875sGlqF?=
 =?us-ascii?Q?6ztf3j+ttk3XQTZJGAHxftMFEZwhnLG+St92pAHRAEpBljpX5cVSGaR1/HSp?=
 =?us-ascii?Q?wfCERdSlxfHXuAPJpW8NEYMjSmdJoHJAgFIk8KiYQ1+r4h1wM9IA72I13xNU?=
 =?us-ascii?Q?rbNh1bETnMvqsCzauJLXfvs1GWiM6JN7JQ2hxYwdz0xV3v9AtOEcsbAuEYGr?=
 =?us-ascii?Q?N4nTSkRvsPwY8hVMhUS9/ikRA8AD5WOO3KPNws1jl6FQHR3p2mrEQ5PQcjmU?=
 =?us-ascii?Q?dYKl6ixxlKNnhob3vLFryIXKV1Byt1ux9HI4U6D4jkow3t43Wvkg+xbV+Ljm?=
 =?us-ascii?Q?zJDoNB7ujuFyP7vhI8CJcrq8rU3W5uq2rD/q5E4AjPZfyDGYyBeH2Fa7tSkD?=
 =?us-ascii?Q?XN76T/+nwEhE6DNEP2+0XtavIBJwRK79DYOF1TiMBGass0jtpzWkhE8Y85Uw?=
 =?us-ascii?Q?4TgGPt3XfuWPxV7bcz3j5NjzNKvzLQ/iDZ4KIgZe7lpRUmii1G26lonT2w9T?=
 =?us-ascii?Q?OQ9xPZFJ549gJgewNujucKpt04EqvWsOAVMKGCbXqYdwnEnnq3QT/OhXvD1Z?=
 =?us-ascii?Q?8Y+mMM19YqGPJHDSP2jsh6wP/8WilXRsY4AYUU4gAv/YnGGYxVyj6xWxQrkR?=
 =?us-ascii?Q?+t30fs2g99lDVnx4xwzyJrilGB9MAF9cygINygvm2YH0AIsrreFR2q7Z1C5W?=
 =?us-ascii?Q?rDzinibx8sUIcmlVlWOKeI14NVwYbHyjTro9ma0GDly6h8tb8SaVM9A5W1KY?=
 =?us-ascii?Q?iVVMPIKGUtBf7XjuPGZ3iyY3mY17e5xz7NHIU/OBwfp/3dbLZrsyDpDmBbEG?=
 =?us-ascii?Q?Co1XZ7KRBwYlHoBDU5AySoKZmaXYaYltxt3qwIhfPfj/yFHJufBZDUQUH6em?=
 =?us-ascii?Q?IRo7FJLI1ACxEF+cwbWyE4Ohtf42CxuVHFX01VzTzpml9oY8dxvf39HAiSKR?=
 =?us-ascii?Q?luJd3DMAjJVaytfM9BdRMmGt8CsKyry7ElIVQUhmHozcadEVMYrpIVplA+QE?=
 =?us-ascii?Q?Y4sdy1fE1vDNReUIjlYRqSq00tTvrYWZDVuu+C1U/132Zuhwoh6WSXMplgPd?=
 =?us-ascii?Q?E4gnu6VN0vuy1U83OOV2ecdsvL3sryAc7AlCvgHYm4XYG0AxVnPH7dRuTzyt?=
 =?us-ascii?Q?pAjDtwDRtPDC+MA3rAAvdDeA7Vg+Tpy6I48f/cV+obIb?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29354a2-ae4f-40dc-c9dc-08dcc63d7a1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:10:52.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adTmz9E04fHOQ2FkIwEEeyoYmUZuhWMhXe4ehwHznvhMJcA325fDUz6Dw5ySurNf4jSsDyNaAD64/O/rzfawuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7432
X-BESS-ID: 1724726633-105840-22353-19911-1
X-BESS-VER: 2019.1_20240823.2008
X-BESS-Apparent-Source-IP: 104.47.57.177
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkZmFsZAVgZQMNEwydLAzDQtzd
	Ay2cjYIDkp2STJMjUxNTHZ0MLE2NJMqTYWAOMtX2NBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258621 [from 
	cloudscan11-197.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1


Add a binding schema and examples for the LS1012A's pinctrl function.

Signed-off-by: David Leonard <David.Leonard@digi.com>
---
  .../bindings/pinctrl/fsl,ls1012a-pinctrl.yaml | 83 +++++++++++++++++++
  1 file changed, 83 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
new file mode 100644
index 000000000000..599df49b44d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,ls1012a-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP QorIQ LS1012A pin multiplexing
+
+maintainers:
+  - David.Leonard@digi.com
+
+description: >
+  Bindings for LS1012A pinmux control.
+
+properties:
+  compatible:
+    const: fsl,ls1012a-pinctrl
+
+  reg:
+    description: Specifies the base address of the PMUXCR0 register.
+    maxItems: 2
+
+  big-endian:
+    description: If present, the PMUXCR0 register is implemented in big-endian.
+    type: boolean
+
+  dcfg-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the DCFG registers.
+
+patternProperties:
+  '^pinctrl-':
+    type: object
+    $ref: pinmux-node.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      function:
+        enum: [ i2c, spi, gpio, gpio_reset ]
+
+      groups:
+        items:
+          enum: [ qspi_1_grp, qspi_2_grp, qspi_3_grp ]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@1570430 {
+        compatible = "fsl,ls1012a-pinctrl";
+        reg = <0x0 0x1570430 0x0 0x4>;
+        big-endian;
+        dcfg-regmap = <&dcfg>;
+        pinctrl_qspi_1: pinctrl-qspi-1 {
+            groups = "qspi_1_grp";
+            function = "spi";
+        };
+        pinctrl_qspi_2: pinctrl-qspi-2 {
+            groups = "qspi_1_grp", "qspi_2_grp";
+            function = "spi";
+        };
+        pinctrl_qspi_4: pinctrl-qspi-4 {
+            groups = "qspi_1_grp", "qspi_2_grp", "qspi_3_grp";
+            function = "spi";
+        };
+    };
+  - |
+    qspi: quadspi@1550000 {
+        compatible = "fsl,ls1021a-qspi";
+        reg = <0 0x1550000 0 0x10000>;
+        /* QSPI pins for buswidth 2 */
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_qspi_2>;
+        status = "okay";
+    };
-- 
2.43.0


