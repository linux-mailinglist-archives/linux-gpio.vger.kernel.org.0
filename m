Return-Path: <linux-gpio+bounces-18655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701FA83F66
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C6F9E4500
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E7826A0C1;
	Thu, 10 Apr 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EOvFXwHW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ls8x2vpA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21022AD5E;
	Thu, 10 Apr 2025 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278398; cv=fail; b=qOwhghbU2ANf/Ig55Qd+pV3hk/uzjG7MMqSfqNCkoOoeI6qN2Plg0fJLonT5YEGLwaj9paZD4SsDtDYIYGuWuQmBIH718TURZq5ue4APPGg1bwTX4sVv/8AxeIQU9/51K//Pr+QncKllndQYyU59IlZA5v3SsbU5rq3xx7olCgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278398; c=relaxed/simple;
	bh=OqpoKUziEZ0nx0y1xOD8IIOw61LxlE2RwAMEtrHIGyw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fCmMY7svbYs2wNmToEmH6NwI1K8n/dqAp3h2yxgJ2YhhwpamwtnGXZ149XPWumJDJ7m9//JMaDtRHtmeBMiEZViXrZBW6+znnQALSxDQeUL0nFRkAvQSc0kk0XTk9HqMqknaC4d2LBh6WggxuGvnrY2ayzz+PMQKX5SMfXS3iJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EOvFXwHW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Ls8x2vpA; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ac90a0c015f011f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OqpoKUziEZ0nx0y1xOD8IIOw61LxlE2RwAMEtrHIGyw=;
	b=EOvFXwHW7TkEh+bwE/dIjuxw826zNfIsdJieXIolt+R1/dAcO2Zd1SOZ2C39ZJ+EgmvLebwmVzXVojz6ydDY9EfXbawCXN0IF2yv3MdUg6Jd6PGpzYWRCGgNAMGHx/e4uDdY2lPEmH0WBA1MRoYbjvss7x8AGYWEQWlyvGPOkaQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ccdc2721-7a8c-4b66-950c-353ba67c9446,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:c14d728d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:83|11|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ac90a0c015f011f08eb9c36241bbb6fb-20250410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 39494769; Thu, 10 Apr 2025 17:46:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 17:46:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 17:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkPsSow9sFmY1MfDa4VyTLJKp3974R8m/yNNNfSVp7dEbyhT41rvCNm5RPog0bbfIWQomgg0U1F9NqEDcD4E/GNDRHfyTa+8WbOM2Vy62gnkdVofZI0EoNEGL5mIjVyGCPmDR8KBEB74rkEmWjvuWBn57M3/asYG/ZcZ8zU3CUxg7e6E4MJv6LHRVjBdBMKACGpQ40jJ2v5NUJs7BRqsp71qfRNjw+bfKmtliFj6U62KMF4K/ec6RSadjsYn3OW0ClLUASV6z+io5NdacGvbXbSQP51L+W0qmW+lVwLPZn2jj1ZlnJF3x9YEsvBmzs7C1keNcf43HkK8fR1wqHohGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqpoKUziEZ0nx0y1xOD8IIOw61LxlE2RwAMEtrHIGyw=;
 b=nTvrqf3HgXasMJV8eaThHZTDlhg0DdWPmsNPWPdXeQX4jx66G2vyDBgL0mY+XDDUXL9r3rp7+8VVDWjpSnIZRau9tsBvNhYKpwonX5z7Ue2VaCsyRBYA7dA3U5wXEFO68xpDcC8tXbwxcxkUrPHiBbJ4eylygyFkZeSOgGQpuLX4vF0gxHY/lGAVVwlL+x+1r6HrGWjdeshblMRMFlLinTqUDSTBxWSVln9MpxmNvWPpDWJgLC1qQHH+bJF9mvk9VS3j0h8QHkw/7k68yfSFFbedLsBOI1M+N0e7a24mGlTzKZIt2ff8fqvg2axi1eMM3yE3vsJed3tLtmlpLqM9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqpoKUziEZ0nx0y1xOD8IIOw61LxlE2RwAMEtrHIGyw=;
 b=Ls8x2vpAaZj0hi28ld+PEH0nczsGwDfjDg+yxQBZmL3iUf8ZChWZBUijF8aNKPZoyjj6Q9gAXxcXlyh/Ms/uxPL/8bzZ9SpQ4sQSshI/570rlEPm91mMu972hIV4LM+JaXiEv/eW4oyovxwPFGUlbOKw7hSH9iVgplrRoVbPWoA=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by TYSPR03MB7329.apcprd03.prod.outlook.com (2603:1096:400:433::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 09:46:23 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%3]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 09:46:23 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: =?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?QW5keS1sZCBMdSAo5Y2i5LicKQ==?= <Andy-ld.Lu@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?SmltaW4gV2FuZyAo5rGq5rWO5rCRKQ==?= <Jimin.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Topic: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Index: AQHbosnjBQ9b+zdP1EeDkGJXYLG0GrOclH+AgAAgwgA=
Date: Thu, 10 Apr 2025 09:46:23 +0000
Message-ID: <29bd0c567da8aeafa932f9b55daad693fcaf994d.camel@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
	 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
	 <7e77b50c-1808-49fa-a711-956a570ad208@collabora.com>
In-Reply-To: <7e77b50c-1808-49fa-a711-956a570ad208@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|TYSPR03MB7329:EE_
x-ms-office365-filtering-correlation-id: fef78310-9179-4e3b-33b3-08dd78148e3e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDFqWFBsT0xsanJDUHowbFpaT0NlZHpnWCtZeHJUallTZjd2RHFoUXc3OWJn?=
 =?utf-8?B?QVBlK05kQjlFbm1GbW9ScHk1SmlRbzNaYXhUamU4VG9qMVBQLzV3S2NiWmMy?=
 =?utf-8?B?cytRd3YyN3RveTlaS2ZqZ09YWGNjVHB2WXM1bkpKVjcyQzI4emloWGc5MXA4?=
 =?utf-8?B?SHh0SkFlMk9OeUdrMDNMeC9sNnhtcGx6aXlPNnoyeW00cXZWZW03YVZHOWg3?=
 =?utf-8?B?MUF2azhTWGdpTEFTQUg0UFEySU9JZFZpQUpvNjR2Z1VmMG8zNk5SUDU4bDRp?=
 =?utf-8?B?dlBxQnVlN3p0eHFUbFhMWVFBNnMyNmNEdmpzL1lUbFIvTlMxV09yVCtoWlNG?=
 =?utf-8?B?M3JlNTArU3ZoeGZROTZXMFpiVnk1RmsyZHpEYTNrQnpPOVpGQTlnbHFVNm9K?=
 =?utf-8?B?NWJmVUY3VlhUOHNpSGpUZUVmRUtrWHJ6WHRqdXpqbFJ4MVRjY3lGZ2k1a2dq?=
 =?utf-8?B?TExlWHVqRjdRRG5qWG5ZbGo4bnptbU9vTURiY0VQc041bWdYaDUyZjJkYmVU?=
 =?utf-8?B?SFB0MTVGbGZwTVdRS2tNcUN4Qkp3S21BWDZzdXJiNnY5eHZPb0xHbHU4aUZ4?=
 =?utf-8?B?bjd0UkdGb25SM0FBbTN2M3ptRnFKY01zMGhESXlaaU5GWnpJTk5XL2lrL1hx?=
 =?utf-8?B?b0lRRzR1d29ZZVFYWVE4Q2phSUlyYnNJTFZ6VnRmOThTTE9hYmE3WUQ4eDVl?=
 =?utf-8?B?dVdkT3NMS0pYdy9wVjZFTHRTZWhQMC9MUlMwYkdKRnVXQzk0dWc2UngzSmxr?=
 =?utf-8?B?OWtoc3AwWnFBZDFqaDRQc3EwZEFKNGFVaEZvQ2Y1OE0veHJBR3RnVzNENEJi?=
 =?utf-8?B?WXNHRnFBbjR3R01vci93UXpkUm40cDEvRUwwemMrRTBRU0x4V3V1cURSL1po?=
 =?utf-8?B?b3UrNDJHaWhIODVYZm5WYWNYK2xsR0QzYXdPRGUyRzV6NmtSblRwMUx0MmZy?=
 =?utf-8?B?cER4alMxV1U4MVhlQjNuWjlsMVB0SmdLVndWZWdCcHZRQnRZOHp0MXZkR29Q?=
 =?utf-8?B?MjVCUjhTZVRETzFNQmc3QnZPSjZySkVqdVpTTzZwQW5XMFh5cjcyTnFGKzRF?=
 =?utf-8?B?SVV0ei96M1cxQklSVnlKQ1lVZ3hNQzcyU25CYnl6UldYblpQVTQzZTN6L3Vv?=
 =?utf-8?B?dUI2ZzliajBrSWVBeEs5cUhEOTB5UnVMa3dJMVhwRTlUalJZWXZZajV3dzFN?=
 =?utf-8?B?THcxQW1YaDAxL0NCZVA1WWU4UEl0VDNHR21XTys2TmdPYy9QT3RaaWtRMy9Z?=
 =?utf-8?B?RlNCWCtGbTFMMzdZQXV6MzlJelp2VmJnaEp4WjF0bENqMGxKL3lJSVo4clVz?=
 =?utf-8?B?NFlKNXJXSE53TlJyamY2cEdMOTJsallyWmg2bnVpUXA4NnN0VElKbTBGSW42?=
 =?utf-8?B?VFdjQWxTRitQWGhIdFpiY0lwSW9RZ1FFOHVnSkoybmhSRTZNMk1CT2pwbkpw?=
 =?utf-8?B?MjFBN083cHNJZTlZUldMY1lQbFlzSkhHLzE1eUxrUmRmMEFWNlAyZmxZQWNN?=
 =?utf-8?B?S2YyYUFUaDNQdmVzdFlxQXF3emFScEZtY3RncVFTdWZUT01IQkhSZDQrNVYz?=
 =?utf-8?B?aWIrYWlKUXpCMmdSV1doem1aeXFYQ3k5Zk93ejdhRjFhNGdURTVBR0hHdGxp?=
 =?utf-8?B?UGs5T2pzcE11clkrNkpZTVhBeFp0SVBaYVUwek5pT3I3NzRvOWw2S3BBTi9T?=
 =?utf-8?B?NDc3anlCbG1pN3NNRTBGNlNPaXF5ZExPMTIvcG9xQzhuK1pKVHY1dlVkWW5C?=
 =?utf-8?B?aXdJMWdmME1IRmh5cXNEMkdqbmdhakFtQTkxaFF3MURUc3M3UUVPSzIvQlFv?=
 =?utf-8?B?elYwL1N1TE9vVEZrTStmT096ZU5SQUNyOWlZd1h0QUZUcFd3MlM3Wm0wcXNi?=
 =?utf-8?B?WjVrMmJ1OHB3ZFFYa1Rjdlh2NHNmRnlnUXF2bmJGeThrTFhPYWhqd2FjdnRs?=
 =?utf-8?Q?IHrexLHSrVK1yBjCE6/lC3pMSJIa8eqU?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0FraFl5UmZNUUlKeVFKcWN1SGp4cE1FVlBBL01WeE5EdDJmSnNRSFQ5T3ZP?=
 =?utf-8?B?NjFCanErQmxYazR2VVBOcy9ZeS9rSnZ5ZVNXRlZ4RnVOb1ZpSmZLMDJCNG1D?=
 =?utf-8?B?eTJNOTlJTEVWazhyTGg1d0plNk9kQmcvN2NFOS81NW81anFwWVNBaVhVSzM2?=
 =?utf-8?B?NUhOZ3dOQzgwSXJxNTRscVF1Tyt3d29FTkhjdTdSQTZac3lDQnpETk5VRW02?=
 =?utf-8?B?dEF3UG9IZmViTmRvUzE0VkkvOU1IVHVQMFJ1RWtjYXVaMEV4NmJydUJNZGlN?=
 =?utf-8?B?ZTEySDQ3QnA3RVFuVEZ0Y0oxaEFhZk1mZEd5QjF4cW5DZlVFVjQwbzR2NURQ?=
 =?utf-8?B?R1lUN1RUd2xzVkRNbmt6ak1Cb3IzTXN6M1E3WElCZHZmK0ZBK1Q4bUNtRzVp?=
 =?utf-8?B?M3Z2U0FlWlczNWp2RlNBY251Tm1XQXVNWHNBK0xtc251VnBnRXVQalErWm0v?=
 =?utf-8?B?eTBJY3FsSmhzRkN3WlBORW03bjVNb2hNRzlPT0dxRHhJN2ZVeVZxRlluZWFM?=
 =?utf-8?B?bGw3dndEZXB5NUpSVWNNODNXcnVuSThORVBIMGJ5RDh6RFJVMll5VURBS3ZT?=
 =?utf-8?B?c0w1TEdOWmpJTng0YXpDMzlSWGxVSURiWnYwL2FiMVhpczdsaEFhQmxsMHhQ?=
 =?utf-8?B?S290NmdNNVBzOWI5R1k4ZEp0ckYwbFJqNzlBUEtKWVY4S0lWZGl0Tnh5VXAy?=
 =?utf-8?B?dzJmclVmUmg2RGJZblFvNzFZVEUybWhPWU05QTNuV2ZxS3Urc0VCcHpBR0Iy?=
 =?utf-8?B?Y2ZrVnkzTU1qanhUVXhPRlUzSjVZelF0RXlSNHhyZ2Z3RnNETmxJc01GUW9Y?=
 =?utf-8?B?WmlOOGhJUTFpVG0zK0l2aXNIeWFvVFA1UERXZlZmYnlqOGNvSjRGMFQyNHZF?=
 =?utf-8?B?TUswMDlvamZWalBQWUozSFkySWEyU0ppVUJ1dGFRV0VVUjdOdkd1TjlyeGdP?=
 =?utf-8?B?aU1pdE9nZFVJSlZtc2kvQnhmK1dXanBmUFpsMkVIWFFKSGtjcXVqZklCTS8w?=
 =?utf-8?B?dldyWWYrcTg1SGg0eXZIVkQ4ajVEWTZvL29lMHBvRWY1dlNPTHNRWldLSjRQ?=
 =?utf-8?B?QkFZaGpWdm9EY1dSbHVTU052anY0YjlpTDJkUHRzNlBNaG9Zcy8xKys2VTA1?=
 =?utf-8?B?RS9zc0FBNEFwQUF2Y0lTblJ2T2tBSEw5T3drVDNqWjZvMVFtRUxUUXBuMmg5?=
 =?utf-8?B?Q0t1b0hqWU1JL0FSZ3lsVFFIa3pjem9FSndBbG5lc0Q3QWMxNHhobzNGenVW?=
 =?utf-8?B?VGhpeFMyN2dvRWdra1pta1NRQkF6ZkhSY3ZIWENEeDF2NW9lWEIvR3B2Mi9Y?=
 =?utf-8?B?T1R5YWs2Z3E0MWx6a2l6MjdEdFp6TkhQQWd6NTZWbXExMURRTkx0dHI1N0dz?=
 =?utf-8?B?d0ZqZzgwOHIxMWFIVFBnQzZ2Z2JyS1ZoVnNGQ1Q4WUpZTm16WUNoZDFoM2tl?=
 =?utf-8?B?TkNYRmk5UzJiZGlpVUdFV2N4RERMLzVaZUJpZ1FYcTI0VmZXSjNMRUhJMUZR?=
 =?utf-8?B?RFdQNUFNMFN6QWhmZmw2Y1JTV2FzeWFkWWxMeUZrdGdnKy9LS1NHclU4bzlu?=
 =?utf-8?B?cjFIV0tjRkZ4c0xhMmtWNE14eHhMcUxXQUJQMm1hRHYzbEVvbVZpR0xnaGo5?=
 =?utf-8?B?dkUxUWxLMGROaXFVTzNHdy9jcmpTNWYyczg1N3VuS3d3WER4KzNpNWt5Nlhw?=
 =?utf-8?B?TDhqTXFSbVhDUEFEekZMcTNPRkthZjBRSXdqUmdJMjFhUjB1MUc3S3h2bkV2?=
 =?utf-8?B?dXZJMG5sUnAyamJxQVI3bmo5Ui81amkvOEdsMThOZEh5SlAvUndhQlp0aEZM?=
 =?utf-8?B?NGVKQnVhRTl6UnhMT3lRbGJGS2hpV0JyelhDVElkbzA2M0dNbUkrSVNwRDkv?=
 =?utf-8?B?Qmo2VjlidDhOR0RsaFd5a3FaaXAvZWlRdjJuRWNqZmp1enFxSUlUcXdwZ1R2?=
 =?utf-8?B?a2tqbEFjc1FJUGQzdTIzN3QwdndQTHJsVXhUTTg3MGtGakhtbEhGTlpONFFt?=
 =?utf-8?B?R0ppYXU4c0tDMGVodmo1S1lTSkI2MXVmdWFobEFBZWtFa2h3MnJya1l0WEJX?=
 =?utf-8?B?OWFpcFZkUjQ2SzAwdEJhajc1dUY5R3JadnNCdHU4SkdXVEp1K08ydC84NWlV?=
 =?utf-8?B?dks3SGF0bE9Hb1BPSTluWkNWQWpRVXpQRTAxNUFIMUNxc0dVQ0JVSUhqTFZz?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99A372AB85B92F4CBAD397EF839F2DC6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef78310-9179-4e3b-33b3-08dd78148e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 09:46:23.7516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yds/bg4w9hn4foJmFT+VokuBitxmhnrH/i/U5epMiqbCqpwNGala571/UC2d4HGjEalNwoIoivtMG1/JziEANRfAVXJMon1G4lYzGm4HfFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7329

T24gVGh1LCAyMDI1LTA0LTEwIGF0IDA5OjQ5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwMS8wNC8yNSAwNzo0OCwgQ2F0aHkgWHUg
aGEgc2NyaXR0bzoNCj4gPiBBZGQgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50IGZvciBwaW5jdHJs
IG9uIE1lZGlhVGVrIG10ODE5Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIExp
dSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENhdGh5IFh1
IDxvdF9jYXRoeS54dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICAuLi4vcGluY3RybC9t
ZWRpYXRlayxtdDgxOTYtcGluY3RybC55YW1sICAgICAgfCAyMjANCj4gPiArKysrKysrKysrKysr
KysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMjAgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+IHBpbmN0cmwueWFtbA0KPiA+IA0KPiA+IGRpZmYg
LS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21l
ZGlhdGVrLG10ODE5Ni0NCj4gPiBwaW5jdHJsLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10ODE5Ni0NCj4gPiBwaW5jdHJsLnlh
bWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2Vm
N2UwMzIxNzIyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10ODE5Ni0NCj4gPiBwaW5jdHJsLnlh
bWwNCj4gPiBAQCAtMCwwICsxLDIyMCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0t
LQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL21lZGlhdGVrLG10ODE5Ni1waW5jdHJsLnlhbWwq
X187SXchIUNUUk5LQTl3TWcwQVJidyFuN3hpV2ZoblUtT0gxWWg5cFV0M19VYnlOc1JUR090a3hO
RDAzdVR5VGNxU3dTVFV0c1kxR2xvNlR2RU1jOVhYMl9vR3F5ellHVjN1VjZPRTRhZWQ4WWR0WFFa
a1FqN3pkUSQNCj4gPiArJHNjaGVtYTogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJO
S0E5d01nMEFSYnchbjd4aVdmaG5VLU9IMVloOXBVdDNfVWJ5TnNSVEdPdGt4TkQwM3VUeVRjcVN3
U1RVdHNZMUdsbzZUdkVNYzlYWDJfb0dxeXpZR1YzdVY2T0U0YWVkOFlkdFhRWlI2OGMwWUEkDQo+
ID4gKw0KPiA+ICt0aXRsZTogTWVkaWFUZWsgTVQ4MTk2IFBpbiBDb250cm9sbGVyDQo+ID4gKw0K
PiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIExlaSBYdWUgPGxlaS54dWVAbWVkaWF0ZWsuY29t
Pg0KPiA+ICsgIC0gQ2F0aHkgWHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCj4gPiArDQo+
ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIFRoZSBNZWRpYVRlaydzIE1UODE5NiBQaW4gY29udHJv
bGxlciBpcyB1c2VkIHRvIGNvbnRyb2wgU29DDQo+ID4gcGlucy4NCj4gPiArDQo+ID4gK3Byb3Bl
cnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDgx
OTYtcGluY3RybA0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogZ3BpbyBiYXNlDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJ0
IGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJtMSBncm91cCBJTw0KPiA+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBybTIgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogcmIgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYm0xIGdyb3VwIElPDQo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGJtMiBncm91cCBJTw0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBibTMgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbHQgZ3JvdXAg
SU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbG0xIGdyb3VwIElPDQo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IGxtMiBncm91cCBJTw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBsYjEg
Z3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbGIyIGdyb3VwIElPDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IHRtMSBncm91cCBJTw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiB0bTIgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogdG0zIGdyb3VwIElPDQo+
ID4gKw0KPiA+ICsgIHJlZy1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNv
bnN0OiBiYXNlDQo+ID4gKyAgICAgIC0gY29uc3Q6IHJ0DQo+ID4gKyAgICAgIC0gY29uc3Q6IHJt
MQ0KPiA+ICsgICAgICAtIGNvbnN0OiBybTINCj4gPiArICAgICAgLSBjb25zdDogcmINCj4gPiAr
ICAgICAgLSBjb25zdDogYm0xDQo+ID4gKyAgICAgIC0gY29uc3Q6IGJtMg0KPiA+ICsgICAgICAt
IGNvbnN0OiBibTMNCj4gPiArICAgICAgLSBjb25zdDogbHQNCj4gPiArICAgICAgLSBjb25zdDog
bG0xDQo+ID4gKyAgICAgIC0gY29uc3Q6IGxtMg0KPiA+ICsgICAgICAtIGNvbnN0OiBsYjENCj4g
PiArICAgICAgLSBjb25zdDogbGIyDQo+ID4gKyAgICAgIC0gY29uc3Q6IHRtMQ0KPiA+ICsgICAg
ICAtIGNvbnN0OiB0bTINCj4gPiArICAgICAgLSBjb25zdDogdG0zDQo+IA0KPiBXaHkgaXMgdGhl
cmUgbm8gRUlOVCBpb3NwYWNlPw0KDQogIFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIEl0IHdp
bGwgYmUgYWRkZWQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBBbmdlbG8N
Cj4gDQo+IA0K

