Return-Path: <linux-gpio+bounces-14741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF62A0FF17
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 04:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA62188560F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 03:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D8522FE0B;
	Tue, 14 Jan 2025 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aIfHKxpG";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Q4x72Ad1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAA1E535;
	Tue, 14 Jan 2025 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736824537; cv=fail; b=XoXeMNGGzY4Q//mGXxi4bmv3T6kseFTWtwXmll2aUdHODNthd7NWm4BtjocHffv466JgHfxSsLHiFzZhKU/gkQMO997hbCn+FAEU5lzkjd08o34n/8FhowR4D4sPPFrDnBIU4f/U7DuNblotcuINpjDiQi/oSv6F+uFnAHSkcAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736824537; c=relaxed/simple;
	bh=UEaA3xjRpNYqQVETSR5UXBBD5fwJs0bt8qxlV7xbs2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nmo22/xkMHt2umwFulmiaVppBYqTUwqkft5zqbIVQWDiu76UNxos1lO/ibV41ok6TiO5vO9p/6wRVmInFkBap5DdWmpuLQPzH1aqBIIqnLw4uR/eiVKShfwMS/xk2OsfbVKoBpkvbFhLXMNU3NiWexCpca7WIwxIUs848rIV+kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aIfHKxpG; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Q4x72Ad1; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ae749cfed22311ef99858b75a2457dd9-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UEaA3xjRpNYqQVETSR5UXBBD5fwJs0bt8qxlV7xbs2M=;
	b=aIfHKxpGtFogDKjPowK9HqG8rZ7JQSD+mT+z362WEy/huMh57mQiPwN34rOWRHwNdq0wYe14XrhGig36oHDGG4FPbSQ0w8F0JNWnxwyeRDbHKHAG7a8Sfd5y4jX9gRJErWy7wC9yYjj2Z2kBag//5ttZ+ItDV6Pbpw0ZdgI3CEA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b63bf8c8-0585-480f-b2a0-902965630a9f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a85cd637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae749cfed22311ef99858b75a2457dd9-20250114
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 137243302; Tue, 14 Jan 2025 11:00:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 11:00:15 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 11:00:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMR/4HMFsydPDhpZWXeiZiaa0BYe0ggTdn4w85zIx74pOEYHHNqJaKJVUBXYk7KHLQ+egkzBJDq5dYIo2z4anlEziaNySrCyDo+DCdrPy6gksW7mH2QJIpy30mVdfZm04WD4QEGAEEpIYRqwqI0OuLCV7UZcGLCeET+2jalEJ7k1nG0qzskygFvOJAA2XIT/HF0bNNJHIcp9Uo6izXYf8cLjwD+r76MnGUKQkS6QoqFYOL7Iyr0x2bYFhmZCxslGSMIhl7161fw6a+22ra7HGs2vAvd590+9TdZmaruaUMLAmGaYfj4wQyj4fZqo2GtfFf3fxvnO+5OiC6UVBZL/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEaA3xjRpNYqQVETSR5UXBBD5fwJs0bt8qxlV7xbs2M=;
 b=phv37Vt7T1Tifwa87skjdYjltIBi15TO0KfUiJAsNfEgOXiRIfPFgm7rB122rRK8G9JOH4Tl+lMotqf7wWrR+VgctwL3AXrtg+Tdgbg2eT4B3VcsaQBQhK4eb3+lIkXmVQL7diK9TWaH0hMZi5vv8Gmp+0uR4P7c1g20UHmgNm+est+TMdYi9AIqCQ6sfc+tzPxXoK/NDtvXId0fMB2JBcwS+WyuzfISeXnmIdM5WLgFAwbc+OyIWghI+oOcj9qkEURoKbBERVb0VtK2GbpPz0e12hW7bp+tyMyI7EXnEigxZqCJfeO0Pi73oIBoxwYoudomNJF8QznpDqzv+AepMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEaA3xjRpNYqQVETSR5UXBBD5fwJs0bt8qxlV7xbs2M=;
 b=Q4x72Ad1ZI1NbX77c2ECy9q4zgP7VXpBzLpt2eM0girkWKYDrSCshGYIcEapGMvrSg5rNqMlGnW0/TeMxLssZ/TkG6gA/Qn3vDyO3ffHdZS3MYHN3Rc/0X4s/PjgUOyexzj+BE3MBxOUCrfg8s/5R8VxUlDxIzfLSLqq1XRdjz4=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by KL1PR03MB8473.apcprd03.prod.outlook.com (2603:1096:820:12c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 03:00:12 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Tue, 14 Jan 2025
 03:00:12 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "frank-w@public-files.de"
	<frank-w@public-files.de>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Aw: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Topic: Aw: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Index: AQHbNGv90ceBiMFMO0Kz/ALR4pUu7rMV+AGA
Date: Tue, 14 Jan 2025 03:00:12 +0000
Message-ID: <9028b6d6c8cf35dbc388943649e6e1ded6625f0f.camel@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
	 <trinity-090addc5-80b8-4d9f-8f01-ed2c519e0d3d-1731351635476@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q>
In-Reply-To: <trinity-090addc5-80b8-4d9f-8f01-ed2c519e0d3d-1731351635476@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|KL1PR03MB8473:EE_
x-ms-office365-filtering-correlation-id: 410449b9-256f-43fe-4e8e-08dd34479065
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S0NuelhzUDlPd29EeFBabjJmL2M4Tzd5UTdTRVdUSUoxSDdIb2p2ZngvTkQ4?=
 =?utf-8?B?elNRdGI4eTVhODB2OUVTTDdQUkY5aDl6Wlg1UmdWOEY2Q2J1TXlDajZwa3dF?=
 =?utf-8?B?NGVMY0YvODlGNTdvM3Z3WktmMTVIdE9laU5aMElzTEZydXJ0dFBHbUMvcDlU?=
 =?utf-8?B?L0FNWDJydDVGVnBxOG5aZi9Pa0RvWi9JaW1MWFhHSytYNXpnRjB3aE9pSmhy?=
 =?utf-8?B?VjlMd0FPeTA3ZktOQldleE5mMEVRcU92dVRIVERZckNoSUpZUXhQWmRMdVRX?=
 =?utf-8?B?U0FPZU00ZkIwcy9uQTR1Wm00QTFqTFpvQjlOTHZubmFjTHV1MXIrd1Uvbk1R?=
 =?utf-8?B?TUVsQnBLZ0JDMXVjRVpGZ1ozWDA0U0hkT1lTU1h6STduT0RFeSt0VEFFUVdw?=
 =?utf-8?B?TGNFR2NaWFRnbUNEZTN2K0JkNjVDYStYK1c0dGZ0UnlqRmtVOFhVS3VUU0Jl?=
 =?utf-8?B?c0l3WHp1cXg2OUFZa1FEbHR3Yy9xUC9OWWJaOXREWmFRclgzdGZubVgxWnl4?=
 =?utf-8?B?WVZGU0VYUEhUTXk4SVRVVWdiUFhZK21VNWFPdjBBQ2REY0txQ2JSL2VjZ2RK?=
 =?utf-8?B?ZFFaR0VZd0g4SlFUK2ZGS2dRL25vS2VJSmJWdTVmbWxTT1VqblBmNmNyaW5m?=
 =?utf-8?B?RjJ3a2pMVHdRcnlyWVVGN0pGMk9JYzdmVGxZazVnUGpFbXdaYTIwalZ6a0lO?=
 =?utf-8?B?ZllzMkp0RnNoZkZ2eE8rVXI4U1JIaHpRYVdxY1NPbXJSYWpTNzgvTDRCMEtV?=
 =?utf-8?B?SXNwVGFMYjVuSmJ2QkZ2cFFYaWY0SktzVllCMEpYKzBVek9KeGpObUFONUtl?=
 =?utf-8?B?Rk4wZ3FNdFlFazlVMkRPWVVackoreXRPZGsxSHMyWFJvMVFlSVBtamg5Qy9q?=
 =?utf-8?B?YmNhUUZmUUJOZnBBcFJSNWNjVTNPVzBuUGZFRkFBWmdRS3RJS2RWUVV3d21z?=
 =?utf-8?B?dk9HeHZMWk1DeFhtcit2Mm5VaUJvb29jbisydmlnQmZYOW5JS2tzS3RrMVJq?=
 =?utf-8?B?KzBST2NZeU1ZQVZkcGJ0TEljVTZUZ3pXdzI5MXlMV1QxL0V4cCtTMUdGcEZ1?=
 =?utf-8?B?OC82WWs5UlZDeStvbzJPU3lscmJNY1grOWgxUVl0bU90R0Ura2RDaTh6Tmpv?=
 =?utf-8?B?N2VHbGMyMHJjVGdYVThqUG9yQ0RRZjhycngzTGV6NXI0MnlzbHVwT2VFaG5I?=
 =?utf-8?B?ZlZZbFQrYzF3SU1oK0ZaUjlFcGt5NEJ1WnhrQTR4ZENqTG5Oa3RQVFVySmtC?=
 =?utf-8?B?c3FtRFcrRjlwcjhBallXUGQyS1RVWkJDT2ZVdWRibFArNkYzbXNvV0dmei9O?=
 =?utf-8?B?L0o5cVgwZ1Zicm15ZWFnN2xhZXlpOEprYkhwczExZVh3dUoxZktad1VjTHEr?=
 =?utf-8?B?QVYwT2lWTmZiUWxqdVBrbEZWVlB6VEc4RHBNenhQMmkxUHFYclUyc1J5bjJx?=
 =?utf-8?B?dkxjbUZ3RXZpckFrUEhrYUxKSklaaTVnSlFJS1k0dFBMRFA2ZVFWc0JMMms4?=
 =?utf-8?B?NzYweExaKzZjL29Ia2VJK1RCenJDbTc2WnhGa1MwQSt5K1NIdUZuUTRkbjJH?=
 =?utf-8?B?WkhncmlEbjNXVVZ6dlRIOGpaaVBOeWd3TElEQW1meFFZNFNidnNRckRNZTNJ?=
 =?utf-8?B?c0NUa29nYkRDUWlQVDhzMzdJK2h0dElrZ2Z2NzVsNVVHZThRKzlWamZjdXBO?=
 =?utf-8?B?THVTV2kxRk16ZmxXMjF1Sngxd0dQUUZPNEUxYm9PK3dTSzhrQndSVnNPT1Y2?=
 =?utf-8?B?MTJRRk9hdEFRcFEwS2F3bXF2RXg3ck5YZ3IxTXpINTM1Q1VaSS8wT1YwSEY3?=
 =?utf-8?B?ZWpNK25sdVgydDMrTUNIQis5THg5R2wxOU4xbm5meGlRWjc5T0liLzFhUTZN?=
 =?utf-8?B?bGFsaU90M1JyVTNFcXF2YVJqcThTUW1HMWh5UUh3TEhzODBsdDgzUHV3RjBE?=
 =?utf-8?Q?bMgomn5PxBK2jDaEt/WLqPJMxVh0L3Kl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk9IYXNRNjlPWi9kKzArZWUxa3VaZm1IWFVvK2QzQmliRlo3Y2F4UUJLdDZ2?=
 =?utf-8?B?OVI4WkJPelRzdHNHZ24vM1gwTWhjaHJ5eWhDZ0dzOERPT01qWFRyRHZzNi9k?=
 =?utf-8?B?Z09JM0pKQktlbC9MdmdZSE8rK2ZxSTRDMXpVbFB3L1l1Zk51TFE2TitMdVMr?=
 =?utf-8?B?TkhFbW9ZSHlQMi9QbVkwVkcwS29Wc0J1TVYvRVcyWXhwZ0UzVFNQaWN4VTJn?=
 =?utf-8?B?blY3V3ZQMWZiQy8vOG01R3JIYnJ3UDhWWGVYTUtETDkraHdtQnYyMUQwaGtG?=
 =?utf-8?B?M2R6YnluTytBYWJjeTNYV3FWMTBiaUpPNHc2VkhqS211L2tqOGJHdEtTcUR3?=
 =?utf-8?B?LzBRM0tDc1BpSDVmc21WLzYwQjdXT2plVDhsTnlDN3VpclE5d1NmSmJ6MG14?=
 =?utf-8?B?YWl4NDZLaFAvMjZuZFI3UFNkOVNmRXJNVUJ0RWtxTG5EWDVIZXhrM1ZYMlFK?=
 =?utf-8?B?TkhrWjZBeDNnUytCUGNRMG5YTlRFWjVBSml6aU94SmxIeHlhQ0JBTENiWTZ1?=
 =?utf-8?B?S3pRR2JzQUFHbG51QXNtQ3ltdWtrbVBaUUIvUDVwQU1sQmN0bDRIcDNWV280?=
 =?utf-8?B?NDJRSjY2R0ZpUkJBbzY2ZHlwOE80dEJWWjkzSW1jUGMyUVFBVjd3UUNFc1NR?=
 =?utf-8?B?VHh6SkRpeVZkY1k0cEcvK2piaW1HWk54U1NUcXNlYU0zN1dvUk5XRnk1dGIz?=
 =?utf-8?B?Nnp4VDBrQ1BYRlpVVGRCVzJScmRnWjJ4OEdBSUx5Vm85SGxXdHZWQ0c1dTdP?=
 =?utf-8?B?dlQvT0kyc2dpR2hCSHFMYm1VQ0Y2eDhsd2MweXFDOExLNXp6YXg4bW8yMnB5?=
 =?utf-8?B?TU5QWVc3alNoUnZNdnQ5NUVHS3lvcWp4Sys0bDF2ZFRjcmZlNXQ3WlVSb0M1?=
 =?utf-8?B?cGFuK1pHancvT0lxVmNJY0pEaTBjWmNvcmdiZ2Vhb1VjLysvclRLOHpCdVlX?=
 =?utf-8?B?MCtETnovWkxhWW9BdnBzSytwVm1qdkFNMDFiY3FoNVdOSE0rY3IxNW1ISi9R?=
 =?utf-8?B?bEliUStYWEJFY1VrQjBQZG9NMm1JVDdUaU9CQnI3UEw5ZEFSY0RreThxM1F4?=
 =?utf-8?B?S28wL0xoL254ZmVkeDBRdWFzUGhhSVo0VXJ1VWIyZDJpNE1mK0xVa2RzcDhB?=
 =?utf-8?B?TFRQOGVOOTIwZGJjZDE2QmtHbitZVEtyTWw3OGhldElSZlI1SzV1QkphRFVy?=
 =?utf-8?B?bys0MjJDQnZVWlNNOFFFK2ZQc1M1VTBEd09Zd3VncXU3RmRodklGOUNQZW1O?=
 =?utf-8?B?NUVPSXBZQ3B4RDM5K0N5NkVOd1JCN3hnSkJ6RGlrV1REUjBWM1BtU2p2eGNI?=
 =?utf-8?B?TUhCZWsxVWVjNHZpWUxFWHNJNSsvMjdMYzFSZG0yWkI2TkpBS3NuMU8rcW9M?=
 =?utf-8?B?YWc0N3JXNFlKRXMwc3NnY01sOXc2dVBqUytCQTNKR0hlVlhDMERERDFMQmNH?=
 =?utf-8?B?TVpocjZHTDdJRkkxaUZsOHovaGFwK3E4M0I5OFV1QkxxeGVSNndlWWJRN0Yx?=
 =?utf-8?B?eUFqeDdsQ3I3NGVuRVZtZjNaZ0FpQm5IRDRFK25hcWsxTWdlbklkaGVaUEpR?=
 =?utf-8?B?alhJZUwyT0tDRVdjQUJ0RE9aN0Vwb2Z5elFvRXNKTTFZQkcvbFJtaEhldURz?=
 =?utf-8?B?UE1mMVNYRlI1YnNFN2lMVlBGMlZVNG5aaDFJMjN6RkcrRnZKZWt3aVRDalFk?=
 =?utf-8?B?aXNSOGFyT0tpdFhMajZJajRYS0NYSlVnMDA0SU9FcnNvL1FZNUY1aWFKNXNY?=
 =?utf-8?B?Mkg1NDRsclVFQklyVkgrMFRZVlFvZTJsZEVrczdXZXR3ekR1SzNIS0lRZk1r?=
 =?utf-8?B?UzhZUzViWmpxaUkzclU4bHBmbGREU0swT2xvQ2duVlF4SFdjU2xiWDlUYlRQ?=
 =?utf-8?B?UVFPQjZjNU9hVW43Mk8zbGR6WDB4aGVLZG84WVhEazdQUlNSVmxjM1dHNWRv?=
 =?utf-8?B?U0FVRy9Nc3Z0UVF3WVdKRC85UUI5bkZiaHd6VTF0NnN3UVFJcHV5NXBsYmhY?=
 =?utf-8?B?TzF0OWNiSXRDZFh5Yno1eEtKWENiYVp3cVdLQmlnRjlRMFFrY1NXeHh4SGN2?=
 =?utf-8?B?a1RhbTVQQlhVYm9rSlZjd1IvcUpyRjJ3ekhsQTJrRHJ4bDd2ekQ5THdTRmoy?=
 =?utf-8?B?NWRpVlhMZWZEV21VcDlRRkVIN2hRdmhXOGlESDBVbExycU5wb0dPdE5wQTZ4?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CFF46C94AF1F2428C37A1EBBCAD9222@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410449b9-256f-43fe-4e8e-08dd34479065
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 03:00:12.5982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcLwyGl4EEdNE0oFwxul37zOmf68K0vRT1GXpSBIJQG+kooH6LKFW10+ndi5O+k70G1OyzXNcTFWAgnKa/DL7181Orss2kSNZjDP5fOA2uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8473

T24gTW9uLCAyMDI0LTExLTExIGF0IDE5OjAwICswMDAwLCBGcmFuayBXdW5kZXJsaWNoIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+ICZndDsgR2VzZW5kZXQ6IE1vbnRhZywgMTEuIE5vdmVtYmVyIDIw
MjQgdW0gMDg6NDANCj4gJmd0OyBWb246IG90OTA3MjgwIDxvdF9jYXRoeS54dUBtZWRpYXRlay5j
b20+DQo+ICZndDsgQmV0cmVmZjogW1BBVENIXSBwaW5jdHJsOiBtZWRpYXRlazogQWRkIHBpbmN0
cmwgZHJpdmVyDQo+ICZndDsNCj4gJmd0OyBGcm9tOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVA
bWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+ICZndDsNCj4gJmd0OyBBZGQgcGlu
Y3RybCBkcml2ZXIgZm9yIG10ODE5Ng0KPiANCj4gSGkNCj4gDQo+IHlvdSBzaG91bGQgYWRkIHlv
dXIgU29DIHRvIGNvbW1pdC0vcGF0Y2gtdGl0bGUgdG9vLg0KICBUaGFuayB5b3UgZm9yIHlvdXIg
cmV2aWV3LiBJdCB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gcmVnYXJk
cyBGcmFuaw0KPiA8L2d1b2RvbmcubGl1QG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29t
PjwNCj4gL290X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCg==

