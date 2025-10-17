Return-Path: <linux-gpio+bounces-27231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A8BE60DF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 03:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE4F44800E0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 01:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02142236FC;
	Fri, 17 Oct 2025 01:43:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023118.outbound.protection.outlook.com [52.101.127.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B25C120;
	Fri, 17 Oct 2025 01:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760665405; cv=fail; b=ezi+h5sABd4l5pMJetWCf1Dtz1Bp7WMYe8wVJCCPEn9AmMUbyZCKPWnHGHQItBa+pzLWQcXIqZgH0Skro4Yk3f9mMYbXeVfN5QUIVvfN9mP+rG7Mjptsfc8sn8p3MytOA9XRJG5F4yztxa66SqriO35nin4fi1K/pz/QCt5L6Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760665405; c=relaxed/simple;
	bh=LauIQQ7dNLQTjl1RynXUN+NnIewMJvl3VmTbRbY9k5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f+HYSDIHrE9AllB12O0t2FlRFGGzMSJGB/9u2RxvZSsq1Lz4WTSIjXzf9aRy4NpyyWIx65sgsvSeV3guqLTmhjFLRrzbV/fx9JuAj4WeqY0yOU7ZkttDeixyT7F6cbJABjIZAlvzBB8qQaVi3dOYmdJgD7u2q3riXAsnNYUYrbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBwzNsKbXq96zTMxkkXPksEF9evtktocvxanK9njh8QpWggysLswtRGtgmLTJ8NSckJXQOp2uagzk+OpNeV+xRmE2ERk3VI0I3VtGiZEoes6AFgfwT7U6KFhvq57Gizaq1LTF1biqWXS4tvbuZEe7snQW7YD76sF5GM+y2jVAfpISdyVMEoMGrL34SyB/Ade9gQkdi0kRLqwHVHi3TKSAq7aM+TAfGPQ2NRNhjyP17+M/rBdnTI8TaKQVRTpnihAhFnN2p5MFmNf6FkCEOgomQZFPUC9E8w6yMkbRHlxICPPvPAbuaGfHfIr7cQ90kbVAy+EMoVz096GAOlyFqRgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LauIQQ7dNLQTjl1RynXUN+NnIewMJvl3VmTbRbY9k5M=;
 b=VPXEcqUW3VptXltnjFaMvSJgQtBDT/4/6q1zHhBO6f9lD5Nf2tFF7JnSuBYz2YxsbutBsv5w/nKzCJSokLqKM8vaSns82kECxxYrH8TrlfEcz8b+LQzy+m9CxOpDDzG3dho6lyA3OibXkqTUo3R/vGgZjhB/l44jP2h+5GmeUKF7c2CizOYvrfvPMSnMLecm5Cz9mjUR9RRpGI2UQiKlvk4uCwif/yWYndnEBW7LNqga5IrgJN1ZYUP+9iiGsf3AemOeInJDmmWNtqwjCKM+kELlMtuYYvBg+aamw7yf2sy7ZAUeLiGMJfyyxqt4qBRcCI51nvkIR0WbPNsj5EpsSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEYPR06MB5938.apcprd06.prod.outlook.com (2603:1096:101:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 01:43:18 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 01:43:17 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgMi8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4t?=
 =?utf-8?Q?controller_support_for_sky1?=
Thread-Topic: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index: AQHcPK3dFRM/kdKvKUasRasDs/CyH7TBeTmAgAK6wTCAATFgAIAALWmQ
Date: Fri, 17 Oct 2025 01:43:17 +0000
Message-ID:
 <PUZPR06MB5887C8086DBE7A5D6BF261C4EFF6A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-3-gary.yang@cixtech.com>
 <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
 <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdaOuih=CVuGVgpfwP921g5KSd1Dm5v8oyyYq0pJdrzgHw@mail.gmail.com>
In-Reply-To:
 <CACRpkdaOuih=CVuGVgpfwP921g5KSd1Dm5v8oyyYq0pJdrzgHw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEYPR06MB5938:EE_
x-ms-office365-filtering-correlation-id: 993b62c8-046a-41d9-6b1c-08de0d1e8bd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjFxQ1BXbm5HU1BvSDY4UnFMcVdDSXp2YjdCVTlTVk9KYUVLTGtSYVhCV3hI?=
 =?utf-8?B?SGtKaVR3S2hMRjR6ZmtnNmVLV1NkcE9mNHgrQUd5QkRtRkpLM01xK1pCRUNs?=
 =?utf-8?B?dU1LaE5Ia0M1L1R1bzJsbWljNldDV2lEOVE5VFh1RU9rOStsWFcrZUkrVGJi?=
 =?utf-8?B?WTlnRUxDcUc4eGpNQ0VwWDNTbnhMa1JnajZqcXU4SHladGJTckhrTi9FYThl?=
 =?utf-8?B?ZVdDWXZ5d1duUEVqWThSYmw2bEdTM0NCVXhxZ1NnMW11ajcvblkrSE8yMFFQ?=
 =?utf-8?B?Skx3NHp4RXprUVZDaUtlWnZDQmptaHR5YlV5RzlteGM2eHVOK1F3ZjBWZ2c5?=
 =?utf-8?B?MThZbXhDalpWRUFzNXlzWHdxRENUYXBKd1prUzlienZwcGhMQ0E1M1dzZkpi?=
 =?utf-8?B?cEVqS0lOeCt5VVl6aE5iTm0rWWI5QXoyS21iUWlDV3k5ZTdqd2p6M2tWT0hJ?=
 =?utf-8?B?QVJBZk5CeVNveGg0cVBQRnArekdjQWhhalRHek9KNGlIbnVEb0Y4bnNETk92?=
 =?utf-8?B?TDNraTh6eG1obEVtejhHa3pCNTJXbXRWNTF6MzdMVUlFZXI2YkxBb2piMWR0?=
 =?utf-8?B?ekY2eEZLT1FwNExydE9PeDNNWkI1UXJpU1ZDK25hYzFCQVdwVGlHd2JUUTFK?=
 =?utf-8?B?a2tieGhveDJOaW5pOWZKc2lDODJ1SkpvZDk3SUhremZzQ0o0ZkJkUlV2V3Jp?=
 =?utf-8?B?RGIxdVNibll6VUV5KzVOQU93VXFvODFjRTdDdG9rRThTbm5tTW81d3BPU1dB?=
 =?utf-8?B?LzZJWlYreVdqZ2Q2RU9xVzhQVDNic2RmUHdtTTZMTDNwODZnVzlqeXRRUEdQ?=
 =?utf-8?B?d0hLYmVlQTk0MmFoOEdIdGt3WmtzamxnZ1FseURhblJCYzM1ZTJQelVLSkph?=
 =?utf-8?B?NzJhbXlYbnZFRk9CRjFMcktZY3lTSkdldWRveGxySHVHbW5MOWxkNmc2cFRr?=
 =?utf-8?B?VllFQks1S1JDaDNFU3l1YzhFWG1mNUxabGxOTlNqdGo3Y0pTdmJvWm5CUndo?=
 =?utf-8?B?ZHFIU09mVG5NamlSazlPNDRzL3E3SG5ZKzBteVZYcW41dXg5RHFDOEpGSUx0?=
 =?utf-8?B?VmhZU2ZZOWJrYlJTKy80NW9SaUF4Q1YyNU5FNlBoQTdnSzVaMk9nY1pPWUU3?=
 =?utf-8?B?ek4rVWI2N0p6bmd1b1pBYnU1NWlLSnFFb1RuM1hIdXc0emtPOEpSR0lpZCtm?=
 =?utf-8?B?ZzkrWU1DOG0zMlozQXk5aDlXTHVlbHNNU2t5NEtyZzNYM0dmOGVYVmQ4cHcx?=
 =?utf-8?B?U01aVUpWVmRucU94ZlpXbTFpMEZ0WGxKbnhoQlBCVmxnWW5yQlFjQm03OXZh?=
 =?utf-8?B?TjB0ZlZhb2RWTXRLRzJpdkd2MzluV29ld2RCNGZZcTU4UWJpRDU2aFJwQW4w?=
 =?utf-8?B?SXM5T1hYNURUN2xydHBqRWorYkIxb3FsMmFaV1BLSUVTallyUnZ5bUhaL2Vp?=
 =?utf-8?B?Qjl1MEQvNXlBM0FEWi84V1RyVEUwbTVsL3VOWmJ2dWd5UHZ3NFErdDRqK3Bk?=
 =?utf-8?B?NGxCbTQ3R0cvcGlBc3JzdktDdExzNGtrbVVxZjVzZkx5RE80czdDOFA3dnVn?=
 =?utf-8?B?bm5aWm01ekgxSGFzcVdSV1ZhTmp0SDhWOVdDYkk1anFRYkhaeHVHaGpKcXJK?=
 =?utf-8?B?MzJYM0xLZmx2aWJURndGV3k5VFVFZ2V5dEVxK2d1T1luRXJ4RklWRDF0c0pi?=
 =?utf-8?B?QnlSU3lQN08wNURtQldnZzZEeDFYZk9uWE5yenFKMnE3QjlCekVwNmlrUGkx?=
 =?utf-8?B?aENHUkwxQ1VLODdlL2ZGZFpuUDdibExKdU1lS3FDT0NPRndoN2xveVQ1SFRO?=
 =?utf-8?B?d0FrcDFvc2JITWtWYkUxQkI4SWk4RGg4UVhNY2xxbHlPVU5qa1JzNE5Zd1hR?=
 =?utf-8?B?elNvMk1iOG8yWEdDUWxlQ0lwWDhnQ3YyMzNoUW5hZi9yNm9Cc1poR3pXcTJC?=
 =?utf-8?B?K29NR2FBMkp1akpVUW9LZ1VxTXFGL0tYdzFMaU50YW9YYnJrUnVWT3pDSzJt?=
 =?utf-8?B?a2xuYzFuSTNyVE9DODk3WGZwaDN5YWpSQ2NGZER4TnBidjhyU2xNRjlXS2ky?=
 =?utf-8?Q?8mN6Wf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGJzVEtnZEZDUjZXVXZkRTh4RU8wNm1wZ1NuSjJhQVp1Q09BbUR6WGpMY21z?=
 =?utf-8?B?QklEMXYwbmJwekhjdGZkRXo0aGRiNmJiUFcxRXdLSUU3VHNhUVFvSmVxbGRS?=
 =?utf-8?B?RG9kankwY05JVVdFTTZubnV4UUVVcWoxRFpjT09yQ0dUZy9relZxSU1FMHdY?=
 =?utf-8?B?ekxTQyt2dytsdHVlK090b2dlakVOZnJlZVF6THNWcHlmMDhjN3NScWROMUxt?=
 =?utf-8?B?cWcxRUlUMXlKazAySE1KKy8vUmxHUkNQTUJmUEg4MDVOVHJkSUkwSklrOG9T?=
 =?utf-8?B?bWFFRG5TR1pONnJpdkJLSjNIVmJUSnJKclRHRjRjZjMrTUdtNWtMenkyQlh4?=
 =?utf-8?B?V0xCU1pKUExmWUNSSFQyT0E1cnBKbmJ5M3VBdUh6RlVPOFRsTkZ1NVV4MVNr?=
 =?utf-8?B?U1cyV3EydkphZUFlSGhxRDIxeXRQYUJmeHJkR25JL3VZWlpDeGtZR2FJTWJN?=
 =?utf-8?B?Z0ZFNUx6Q2I5ZHFEajNENm1WZ0o3bXpUeGFVckV3UXdPd1lvVE5QaExDcEZF?=
 =?utf-8?B?TUZmOFhyQjBZbUNUelJsNFJ4a2VVU1Zxdk50azB0dWx6akFJN2IrVEV6VXdB?=
 =?utf-8?B?NGpaQ1dtREtYTlUwbHJ6bGhsR1I1SGVGYXZwTWhmK2xnWXE0c0FUajZ1SFpp?=
 =?utf-8?B?VVh6VGFsU2JtNkJacHR2WTZwazdJRXptVmpIMmx0S0M4c0VZVkFQaERwWnhs?=
 =?utf-8?B?RVhQalZrRUZpL0RlM0Y4WG0rRTc3SlEwTUxpWXVZb0FrdWc4Z1krWUhTU1pU?=
 =?utf-8?B?UGF2OTZHd1RJQkRickxoVHZjV0xrT1NQZTlVckNCTi9YcXUyajNWRzVXeXNi?=
 =?utf-8?B?enBtckRNZVMySkc0eE1vY1A5NExqN1pLYXJqZEMxRHh3c2VIMWxvaVVwaGlT?=
 =?utf-8?B?SWpRbmgxelhlV2ozY3E2TXFZZXNjeUpOdlNOUndXRVNKck93WmFyUE9HVVFV?=
 =?utf-8?B?ZTRKcXdRbzRjZ1BpU1pwaWVuWUlmVys2Rm1NZWg1OGNuOHhXR2FOVkFHRWFB?=
 =?utf-8?B?djM0Vy95My9YWGJCbU1aQU0wWVFGQ2l0bmUxam9CNmFMVVpmcWpUNWh3ZHgr?=
 =?utf-8?B?RjRxMTloM3NEdXFhRm5Qb2s3bS9qRGVMT0xnQUdOdVloQ2NyQTIwZjFISWdl?=
 =?utf-8?B?OWh5NEVDT0FGTlJpckVDQ25MWVFjbnJHOVM4aWt2Zk5hV1cwTzBSMkxtdytn?=
 =?utf-8?B?OUQyU3JTSTZ1V2trV2Jmc1ZKalpZS05IaitYRUo0NGp4ZlAvbnRjbHN4YWxK?=
 =?utf-8?B?U0JIQjRTOWlPK3Y0NTh1WjNFcTk5THJVMnF2MVc2Skl5N01DcW9ueHNPdERj?=
 =?utf-8?B?MllNeDNrTmdGK3Y2MTFoTDhIZ0RjUjcxMy9mekZPbGVYNGkvZm11eWpueEtx?=
 =?utf-8?B?WlF2dWdrRUM3LzFBUDdLVjN4ZGxJNmY2cXVackNHb3FMcHNoYjczVWNGT3NS?=
 =?utf-8?B?RW44Y1pYdlBBa1NZdEl4bkxHNGJORHo1WFh3YWI3VmlORVdwZzU4L1FhU2xq?=
 =?utf-8?B?eGZVN1Bpc3JvQUtFVFJib2pFbzdkTjMrd2ZBNXExQnRTNHFrZDFXK2Z3TURs?=
 =?utf-8?B?MWl2ZGtucXA3SmhaQThKS2VHVktXTU43QUZZTWR4QVMzV3U4WHhST2VGOS9Z?=
 =?utf-8?B?eTNwbVVhbVBOYmJ0SUQ4N3ZSTG4vV2tGbE9zQlZuQnpSYXhPUVpPZ09UUnJs?=
 =?utf-8?B?cFl6RVpBeXhnT1pHeFFSU2VhOCtWdEUreFhFbEI3N3hBTFFOdkdhSDQ0RmtY?=
 =?utf-8?B?V3BkL3VpZW5xNG5Nb2MxUjJHQ3dWeXhaUzc0T1NTcG1WRkFCRmVSanpZOXhK?=
 =?utf-8?B?dERWNHQva0c4Vks0VkVIU3p1ejhJZmxCWTYwWjJENlRLMjVxZlF5T2dDaGs1?=
 =?utf-8?B?aXF6SEpNNi8rY1ZhN0Q3QW9pa3VDUFp1aVU3TWdVTk1xSyttNU94am5YY0tZ?=
 =?utf-8?B?MkpVWU1BSWgvZmk4ZkIrcTRTd0RXdmFEdGFObW9DTlQ0MUcwSGluY2RxQUlQ?=
 =?utf-8?B?SVF0dUtRY05zb2dYa3NaUXM3cE1sMHo0V3A3ckFiZVd3YitKY1Z0R3NaOE5X?=
 =?utf-8?B?OVk5UVY2eUZzMGdvMXRLbkVXRy9Ra2RvZzZGOSs5TEJNMXN4dTgxdHlGRGlG?=
 =?utf-8?Q?06+9oNv1jIigzowKp8CZGb5nd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b62c8-046a-41d9-6b1c-08de0d1e8bd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 01:43:17.8730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2jR/mGr03AZ76rpx49glrxmWGMgIPkikdCHyDGePcBk7D5iDU2qbUHx2BHVV+SrFJ9uSYdWkARpjMKubuM0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5938

SGkgTGludXMsDQoNCkknbSBnbGFkIHRvIHNlZSB5b3VyIGtpbmQgY29tbWVudHMNCg0KPiANCj4g
RVhURVJOQUwgRU1BSUwNCj4gDQo+IE9uIFRodSwgT2N0IDE2LCAyMDI1IGF0IDc6NOKAr0FNIEdh
cnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPiB3cm90ZToNCj4gDQo+ID4gR1BJTyBJUCBv
biBTa3kxIGlzIENhZGVuY2UsIG5vdCBTeW5vcHN5cyBkZXNpZ253YXJlLiBXZSB3YW50cyB0byBk
byBpdA0KPiA+IHdoZW4gdXBzdHJlYW0gR1BJTyBkcml2ZXIgaW4gdGhlIGZ1dHVyZS4NCj4gPiBB
cmUgeW91IGFncmVlPw0KPiANCj4gWWVzIG5vIHByb2JsZW0uIChJIG1pc3JlbWVtYmVyZWQgdGhh
dCBpdCB3YXMgQ2FkZW5jZSwgbm90IFN5bm9wc3lzLi4uKQ0KPiANCj4gV2hlbiBJIGxvb2sgYXQg
dGhlIENhZGVuY2UgZHJpdmVyIEkgc2VlIGl0IG5lZWRzIHNvbWUgbW9kaWZpY2F0aW9ucyBpZiBp
dCBzaG91bGQNCj4gd29yayBwcm9wZXJseSB3aXRoIEdQSU8gcmFuZ2VzIGFuZCBpbnRlcm9wZXJh
dGUgd2l0aCBwaW4gY29udHJvbGxlcnMuIEl0IG5lZWRzDQo+IHRvIGNhbGwgZ3Bpb2NoaXBfZ2Vu
ZXJpY19yZXF1ZXN0KCkgYW5kDQo+IGdwaW9jaGlwX2dlbmVyaWNfZnJlZSgpIGZyb20gaXRzIHJl
cXVlc3QvZnJlZSBmdW5jdGlvbnMsIGFuZCBwcmVmZXJhYmx5IGFsc28NCj4gZ3Bpb2NoaXBfZ2Vu
ZXJpY19jb25maWcoKSB3aGljaCB3aWxsIGV4dGVuZCB0aGUgZ3Bpb2xpYiB0byBjYWxsIGRvd24g
dG8gdGhlIHBpbg0KPiBjb250cm9sbGVyIGFuZCB0YWtlIGNvbnRyb2wgb3ZlciBsaW5lIHByb3Bl
cnRpZXMuDQo+IA0KPiBCdXQgbGV0J3MgZG8gdGhhdCBpbiBhIHNlcGFyYXRlIHBhdGNoIQ0KPiAN
Cg0KVGhhbmtzIGZvciB5b3VyIHJlbWluZCBhbmQgdW5kZXJzdGFuZGluZ3MuIFdlIG5lZWQgZm9j
dXMgb24gbW9kaWZ5aW5nIGR0LWJpbmRpbmdzIGZpbGUsIGFuZA0KDQpob3BlIG1lcmdlIHBpbmN0
cmwgZHJpdmVyIGFzIHNvb24gYXMgcG9zc2libGUuIFdlIHdpbGwgdGFrZSBpdCBjb25zaWRlciB3
aGVuIHVwc3RyZWFtIEdQSU8gZHJpdmVyIGxhdGVyLg0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxs
ZWlqDQoNCkJlc3Qgd2lzaGVzDQpHYXJ5DQo=

