Return-Path: <linux-gpio+bounces-20314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1846ABCC81
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E028A22F3
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 01:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B13525522D;
	Tue, 20 May 2025 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oVHx5hV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2912211710;
	Tue, 20 May 2025 01:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706172; cv=fail; b=PAbvp0fdgPNj1g1cuML6HQNDfXiosHNDLk0m/CJbDlGf3YnP5xuLUSTitJNm7e/t9Nqfklw2aY2f3gc/S0ZRJ5LGiyAlKvMdJQelHRd0s17hwHFTUHV9s1sak08Gmk//1QLh4Tjcc1Lbg18JBPRiyzPMjr/pbF6fGrFlKw2XdJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706172; c=relaxed/simple;
	bh=f6evssgHF1qt4pf4J+A2P9nmh6M64eyHTPtoQ/LGGEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R5O3GZ/yejTcaAhtNvSZBoIkW4aaBgodCGtGI9AnYjwSm/CBcfOeHes+t6z6jQawfAx0ZQpvAcUF8IfuDIROi9U7wBPD4JRyCgbsO9Cii5Uj3hElB+SZIxbEh81pUcdRGlHMchXjWGrN4LLXbpd6jNNKn0mxjlZiQXrvIFGIPBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oVHx5hV7; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOk3YkQN1Dse7AbQsOQgirax/c5Db14XDoA345NM7PkGSaQVCozz6UpP/3xZRsvRmhD7oz/DKbIHq8esEya6GOIhQGxSVhu8zB9UuED/xdK7sqv9EjrFy755T3wWjzNYMwO8Skaz8evSEYoXsYBi58hxGVuFlGunLVeFRsA140FHvgU4lwtRc7Aodq8cFV/7Y12C+qp5hOOSj4sE/M69JYFlAfh0bz3AyqsHcpZKNtwW7ztQp/sWIK6eKQv5S1fQMTiRJhKaUOzl64QMdlv0XLCOUpC43eSg0sSM+2TcfRa+HeSoi4GTEfnE4CZz/FaRJ4lSXknLFD3KVvUCbYF2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6evssgHF1qt4pf4J+A2P9nmh6M64eyHTPtoQ/LGGEs=;
 b=w2xOTPQ7Tl+qYp5nFIpRhkMqogwSE9NgFYmHKArQ5bAFrKSlRTU4vh49JmIL+3kZRxY3ZTAgvXbuc6GMWyLddRmMHV2/cn6rbgbM6jpWc8zI6/ZMEw82Pkbl5KyFlmMItRt3YK9RGIlGIdjSM2OlRBdB8yOgTUDrcvsqz5G8fqD6BaZywfQPCPj1UakPoUf0oNMjueLkcpwzjxJwHgKXlSgaRO3ZesXBQF/elzbu5fhPsnOFCx9eqvNsdTsaiuQDWUnF5lJL+Mgll8GvWMYP3otiZ7xDaMJICcxAM78IL7zRWu/YF/jtlEAoXkobcFr2MPRdjWj+Z18yCUj2BZ2OmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6evssgHF1qt4pf4J+A2P9nmh6M64eyHTPtoQ/LGGEs=;
 b=oVHx5hV7O/Kl+rDAuoUGMbk4XbjzrNjkJ7AITJ9M+F7J9IRyqu+6L577uD3iOGi3vnIV4D7bHvK3zglKMh2VAqWe1huiBaSlJRB/YQixdIXxU+ed3uLJ3x5+3O3503lWNo7mK5rJ5vYdSTbN8JijKLDiBy+LC9nPq0f3Gl7O00GuPM7YJ3a6IsHPSHgU7k6lIIciNZ4Evlr7L4dBXu2/fMp/cxHFqq8neHNF5Ehy2OSRz60t7hLUiduBFHkxh8Jisz331mtovvAua/rbzcanM0LUElnAY3bDgGXCFsDLGvN4VxnVtQzzgrBwGG6iHRkvHXqKzmSwlJOm7UA1hEBVRA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 01:56:06 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 01:56:06 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Topic: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Thread-Index: AQHbyIOJtotboVfnW0K2Klb8iuZMaLPaE9MAgACvtGA=
Date: Tue, 20 May 2025 01:56:06 +0000
Message-ID:
 <DU0PR04MB9496BBDFD43E4C235B676D7D909FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
 <aCtNtKHay9IXmCgD@lizhi-Precision-Tower-5810>
In-Reply-To: <aCtNtKHay9IXmCgD@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB9487:EE_
x-ms-office365-filtering-correlation-id: 88fe6fb8-4156-4984-c1e6-08dd97417c2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?VGJ6a2VXK2UvaFhadXNlTlI4M2ZRSDJpa1VPcHJyQlRVM01xQll0VUQzNFlC?=
 =?gb2312?B?Q1ZsTGg4eHZCQ2lyOGUxc1RUSkpVWlFLcEVIWWlvVWVjQ0RrRE5FdTZPLzVI?=
 =?gb2312?B?YmlIc2cyOENrbnZYdzFHSDU4QjZQYXlhajRHbEcrdzE3K1pKZGlsVnNnSlFm?=
 =?gb2312?B?WjVUbDN0cWx2YkVPaW96Q3p2V040V3YzUnBuUUVacGFlM01rdzJwMFRMODJD?=
 =?gb2312?B?NlN0Z21ab2NsMmZRQjV0MzAwbk9MajV1SWVmQXZ2U09DbllXNmZsa2FONFJD?=
 =?gb2312?B?MnMrOU9hUkZMUEFaVk9KRXlMbHBERlBCRW9SSEdQNmY2RC96S1ZOVThGLyts?=
 =?gb2312?B?SlJyZ0JOeHFZRkhXd1lrd0l1a2FzcEtXRm4vc1ZFTFBzRDQwWlNzcmwrNjdt?=
 =?gb2312?B?aXhCSEU1K2FpV0tKcVd3SS91RmxEL0tqMUJNL3l0dzVZQjI2Y1g4cFhFOHlY?=
 =?gb2312?B?RXdBSUdYZzJvWU1jeFJvbEp0aGY4SnRyd3Y0OSsxS2RqWk5VdnRPMHhicXhU?=
 =?gb2312?B?ejhjQTdmVUd0R3ZuR2VKa3RjVGNhQ0Nkb0Fyd2V4ZjJQRlVZN0J6S3FGelFp?=
 =?gb2312?B?dldzcXFYY055N25IYnRuUjZWbHAwb1l1d0t5c2FIb09BRFp3UEJLZVZEWnpQ?=
 =?gb2312?B?UEdHSDNSUmwxMVpSb0ZCK0R2MHBzclBOZDJuRnZzeGtkMkVMSDlreWEyc2M2?=
 =?gb2312?B?UWNhQ3JqQWJDNTc4QnZHNUI3TnZYbVgrNlNlS2daOE1vc0tqUjJrbVJNQ0l5?=
 =?gb2312?B?eStRK3d4Yk9XQk1JRkQzYjNZWXpSNy9EVytXeE1YZnBCMzFDZitZK0hQS0E4?=
 =?gb2312?B?b0NHRVF0bStBaHVvMnpXeVpOT1NUQ2x0aWNvTlVuVEI3UDRWdzE0WW5LYUZ3?=
 =?gb2312?B?WHpMTEsrZmJOZmd6ZFVyVURza1JQd0NWdDBOMlRoazhqSXhNMHZZa09EMmh1?=
 =?gb2312?B?cXZJK0RySGdiNzI2WGNMVTJjZWp1K2pielBMZWtCL1YwWEwrSXlqY0J5SmJL?=
 =?gb2312?B?S3ljVlQ4MUhhWTBLdGhsZUVOYVhkTHZaUloxNWhIeUdyeXFtRThwR25INDVD?=
 =?gb2312?B?Vnh0RWo3c3RIeGVtL1pwaTVDWnBORGxZUUJySkU5cW1nb2J6cHRCWXpDRXps?=
 =?gb2312?B?WjB2WHM4czRVbjNBRm9DMEw1WHZFOEM3MEsyd05CejBNOXczUFVIaW5FOGpk?=
 =?gb2312?B?b0JwODFKY3lDRGV1cWg1UVRVRzNCZ0J0c212NWR1SGxvQmp0UmlvV2ZQVjMr?=
 =?gb2312?B?clJhc0xoTEFYTFpNeU42L1cxMUJSekJmTnc4UkJHaml5WEJxMFhXK2Y5WEtV?=
 =?gb2312?B?YmxaeW94SmNoUFQzSEdWU0JQTzFZWTViSlRGc0JYT3ZHSGFkbHdqM0pyZ3Rm?=
 =?gb2312?B?eEErUk5UUlF0d0M0bCtSWWY1aENTN2E2aVpkcnVqZk4vall6L0lCTW10b2Ja?=
 =?gb2312?B?aXhoYVRSZHFZbm0rZ0NGWEdZLzIwcVYrblRZTGlyZTJBcjgxNEV0bzBmS1Zm?=
 =?gb2312?B?UE5zUTJKbTNZUUV6eDZJc2RxRkw4L1JHWlBtOFYxQThpdmQxUmVNK3dkZVQy?=
 =?gb2312?B?MWJsL05lK2ZoVW92UVRCT2tJdUtZYURSSkMrSks0OGxxZXJQSnR6d2xSdU5C?=
 =?gb2312?B?aXJhbEF1Nnl5RG9Sd2pEU2U1RlFvK2FHYWs0bnoxcEdUYUdqRC9hbnlaNmMv?=
 =?gb2312?B?cGIyMDFuWitCNjl5UWx1YmRKSy9abTNZek1Mb1RhNG5IN1BySEd2N1ZMaWFl?=
 =?gb2312?B?UmtKUHZPbkdLVlFBSWpDdncvMDJQRVpmbEFnUlo0NklQU3ZyS1JyaUo3NmVr?=
 =?gb2312?B?TXZZUFB0WG1KVW94UnZUTzhyeDZST2xibHBaSE8wNWRwc0NMTlo2b1AvL005?=
 =?gb2312?B?WEhXdUo0YnZBOTN1QzA4aVp0Y2FXby9oSVk2UlY4NjhhMm5zbGtlVHBmbHlK?=
 =?gb2312?B?Zk83UWNkL01pWWVsQlYrZ3Q5Y0pRM20zRW5jbktEL1BLUkpMdUFPZDhPUHFN?=
 =?gb2312?B?Nis3Y3ZRVmRBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?YnVUSUZsOHo4L2xCZkIyQVg4elh3UGl0SjMzcCs4MS82Yk1uNmNrQlpLSHNB?=
 =?gb2312?B?MGJOWXlnMU9tOWROOFYrYXJNNUtOb1ZrUEVTckhaR2VjQ3BkUTUxMkFrS1pO?=
 =?gb2312?B?UmwwbUJpK0x1M2ExTW1XRW82WjhBYXprZHg3ZERUVWlkR05UNXdxcHVXVVM4?=
 =?gb2312?B?UE5WUW1WeXlNck4rdlhyUEozUHF5dzFYS3RMNEk2WHN3eERXeFVwd1FwZjJN?=
 =?gb2312?B?ZGk0dU4zeUYxaksrQ0o1VGxNU3JHZnZvNCtwdHVXSzQvZ1dzdzNZV2FkL2Jw?=
 =?gb2312?B?bWN1ZkJQOE13V0dCYWtLZlMzMi9PWVNRT2d6SGZvTGlUUCtBV2dSemRqb2hx?=
 =?gb2312?B?MFdKZEh2a3QwejhWOUZxcjF3TzBPaWs1MzJJZkNFTll2d05KblBUdXpYMGJU?=
 =?gb2312?B?cHBCRitFeXZQb3pRRVhER0VsM2k5ejRwNUFBak9YczN4VmdqMEdzQTVuTDdY?=
 =?gb2312?B?YkNqY0FLT2prSmkvc2JLSjFqTWZhQ1A4czl1QW9oSHNFYmoxajhlRkc1R3Fw?=
 =?gb2312?B?R3ZSemIxaUtYSnZobmZpMklwNnRWbURwQXhvSWtacmlmMHN2MmRIbDczUVhu?=
 =?gb2312?B?NUxVUFZjUE42MXNoS2EycUE2QzJUMTdVcmJKMVZ6WEhGNjNmdHBaOFVXd25G?=
 =?gb2312?B?UXJrMEduV2lUL0pmb2Q5V1NpcGNxYS8zRnJleWRxQ1NWTytZKyt3RERYdS94?=
 =?gb2312?B?VmcwdWpQemNvWm9kMngyTHR0WTVLZHQreUJoOVhZRmRoU0dzRk9MZUJPaFhO?=
 =?gb2312?B?dnZNVjc1VloyVHBsVTFwUEN0eEttMVh6a2N0cUFyck1YS1RadVBHb1h6anZl?=
 =?gb2312?B?ZVNvUjVtNk9BTUZoUVVLZ1NZekg5NnprT3hmMllITU5CYThmd3hPQldjSEVh?=
 =?gb2312?B?Nk5XNEl2L0p4ZWtsT0NDd2l6azhCUk1VcHhLK2syUEdSR2ZmMlZPNDRwTG5P?=
 =?gb2312?B?b2FpTUVtL3B1bUZyNlNETGliTDdDQzNiYkdZQ2VOWld0MTBPNlcxMlJocFlo?=
 =?gb2312?B?ZU56U0RHSFY1S1d5ODUzYkgrbXlSa1NndW5vQVlMNUl1Z3lTeUdLb2FmeGRL?=
 =?gb2312?B?Y2tOeHllMG5vNEM5OGZraHErVERNRlpiZU5NWERJUHV1QWpoYm1DTk5lc3Z5?=
 =?gb2312?B?V2NkUDhMSkhrR0xZMDZrQm94WEZyaCt3eWRIMUZNYjUwTHRTWk9RcTNXZ000?=
 =?gb2312?B?RzJYWUU0cTA5RlBWUHZkWWMrRG51azdBdHhIS0NYempPUUliMk05aTR6WUFi?=
 =?gb2312?B?b1RuQ0ZDVlQyWi9tTzBxTjJRZ0pQZHk3QW9aeCsrd3JXekRVaVpXdFpDUVNt?=
 =?gb2312?B?VFZzRmRLS1I2amVLa3l5TGJJaDl2TjB0Y1Yvd2txUWN6OWJOR0hZc1lpY29v?=
 =?gb2312?B?elRSTkU5NlBLWTQ3Q2h2eGpnV3FEd0hwN0VmMDBFa0FwOHZsR3Z4QmpQM1Qz?=
 =?gb2312?B?TFVqWE1zdUkrWUFkVlJjTkx6ay9DZTcvWll3OUUzTnRDb1h0WFE4OXN1VDZo?=
 =?gb2312?B?THdNam4zdHRLK0NGR0tibmRFRjRTUDVXK2VpVy90d2pnV0VvSlU5ay9zSE1I?=
 =?gb2312?B?enhUMjM0T01KY1dxUnN3ajRkMXBNR3lkT2J1cFQ5MW9MdThBREw0Wnc2R3JC?=
 =?gb2312?B?NnpiOXl2MlFmQXVyTjZaTGtHNlF6am95d0xQS3kyQnYwVXlUYlJFclVRM09z?=
 =?gb2312?B?QlJydXloS2FHVHcxbkhkT1V4YkZYNE9hbzRzbW82UEdkTzZzblF3VE9MaVdV?=
 =?gb2312?B?cVR2dW80c293NStpb2NncnBoeGZ3VHU4bWpWRGFDTHhyelU3N2Z2Vmk2TDRa?=
 =?gb2312?B?M0RqQjN4ekd0cmQ3N2EzNE9DZ29raEFWRGwrTGJydVh1MzFyWTcxeW02ZjQ5?=
 =?gb2312?B?TElrSVFSWW5YY2s4MVZmakJVNlR0L3lnRHNNTFZIMldTYm1lNHFHNVJJaDNa?=
 =?gb2312?B?eGR3Z0RjRVA1dk9zdXBac0VrSTRwTHJZcUVKcWoxakVFR0VXYVRCakNBaXN6?=
 =?gb2312?B?WWlVaUxTUjRjajFNZjFMRmdSdzFpS3dya0lwbktBSjMwOUhBVVdBN2hqSTZu?=
 =?gb2312?B?OWhwZjdCZkUvVVN4ai9TNVRJNXZSZ0NlYmNvdGpoOEpCVk53cExPUThPQ2Uv?=
 =?gb2312?Q?XYyk=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fe6fb8-4156-4984-c1e6-08dd97417c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 01:56:06.8236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6HAjn0dkYG/99ba3cjlrVQn0fdIsGPsfftS1Lbwhi8WEVkwY+JXQm0KjwoCMePZoIGkDtM1H4kDermgB0/Drw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNcTqNdTCMTnI1SAyMzoyNw0KPiBUbzogQm91Z2ggQ2hlbiA8
aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47DQo+IENvbm9yIERvb2xl
eSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47
DQo+IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtl
cm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+OyBTdGVmYW4NCj4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD47IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRvc3oNCj4gR29sYXN6ZXdz
a2kgPGJyZ2xAYmdkZXYucGw+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3Rz
LmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZHQtYmluZGluZ3M6IGdwaW86IHZmNjEwOiBh
ZGQgbmdwaW9zIGFuZA0KPiBncGlvLXJlc2VydmVkLXJhbmdlcw0KPiANCj4gT24gTW9uLCBNYXkg
MTksIDIwMjUgYXQgMDI6MDM6NDNQTSArMDgwMCwgSGFpYm8gQ2hlbiB3cm90ZToNCj4gPiBBZGQg
b3B0aW9uYWwgbmdwaW9zIGFuZCBncGlvLXJlc2VydmVkLXJhbmdlcyBwcm9wZXJ0eQ0KPiANCj4g
Tml0OiBBZGQgIi4iIGFmdGVyIHNlbnRlbnNlLg0KDQpPa2F5LCB0aGFua3MNCg0KUmVnYXJkcw0K
SGFpYm8gQ2hlbg0KPiANCj4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5Abnhw
LmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
aW8vZ3Bpby12ZjYxMC55YW1sIHwgNiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiA+IGluZGV4DQo+IDRmYjMyZTlh
ZWMwYTM0MWE1MDA4OGYzZTQzNTJlZDRkMzZmNjQ5ZDMuLjViOTgyMjg0NjZjNjQxNGJlNjgxYzQ5
NA0KPiAxN2JiZGQ4MmYyYzQ1NzU2IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tdmY2MTAueWFtbA0KPiA+IEBAIC03
MCw2ICs3MCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgbWluSXRlbXM6IDENCj4gPiAgICAg
IG1heEl0ZW1zOiA0DQo+ID4NCj4gPiArICBncGlvLXJlc2VydmVkLXJhbmdlczogdHJ1ZQ0KPiA+
ICsNCj4gPiArICBuZ3Bpb3M6DQo+ID4gKyAgICBtaW5pbXVtOiAxDQo+ID4gKyAgICBtYXhpbXVt
OiAzMg0KPiA+ICsNCj4gPiAgcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gICAgIl4uKy1ob2coLVsw
LTldKyk/JCI6DQo+ID4gICAgICB0eXBlOiBvYmplY3QNCj4gPg0KPiA+IC0tDQo+ID4gMi4zNC4x
DQo+ID4NCg==

