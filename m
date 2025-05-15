Return-Path: <linux-gpio+bounces-20188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE232AB7C7B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 05:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19723A48D6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 03:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FED82580C9;
	Thu, 15 May 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p6Q+1jwE";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UWT/b9kY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B451361;
	Thu, 15 May 2025 03:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281069; cv=fail; b=jIz/gNWhCzAk9dStQcpRGgApochKONXoUb/wT0smI2OIoHqwjROKIfl5JJVZObJXHryc3WyJhTmHWz8oFX2+RAZCUUDfZA6r03JRWPati5gc7yNtozpQaUUNbujROSUorVJoR20Q8oDdVAPBmOB+nuF5Dt1z8eaHRw+P8EL75Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281069; c=relaxed/simple;
	bh=K7mhuGhTpBFPqXUpnv93qyCX8eI98rn5n+nZVov9z6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W7oqlthEdouD6Ra24+HF0z6bKmzvPWIJ55UHJtRjIQpvyVPpVqD0aN6Y3Hib6X+xRuqt/+BKwzy7fQS6IgkKxsSgvhWX0mdkyRPFGeP2QUz8n2GJDuey9u1uTNod1d2RR7+WUyz1khXRr/eFheklbaHsaFVLwoYfD5L/6hVbBHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=p6Q+1jwE; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UWT/b9kY; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d1453c4a313f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K7mhuGhTpBFPqXUpnv93qyCX8eI98rn5n+nZVov9z6E=;
	b=p6Q+1jwEf0pTD0khbsXA07KAtRQDS3GBBl4DAHznWTAjDBRlEHaCTQS/F3H3d0LzxS17AJUgI/8G26TTp9UyuwUnYS4ui1JNM8Gunrv7ubQbISeBadVMivUqhW24F8adWKzNz6DlpF2wS7mAXpj9Nvi+yd3gfsdENnMF5rX48vA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c3ea9adb-1578-45ca-a4c4-e1eea3e82b24,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:09e0c773-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d1453c4a313f11f082f7f7ac98dee637-20250515
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1336135934; Thu, 15 May 2025 11:51:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:50:59 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:50:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuyPATZHI9y9Lzj1Ol+uH7gqQd+wBjsCgYs+WlI2dtiIeMpwxIKU9A38VkGDWbrM4Wl9oJYbw7iVGNGH++h6d688Q0tk8PixDdBfr6QYVgJdkdFdAXvjoJShKfT8bg36YS32xmCxdsasOmcpjisjzYMoMhBqkpMBpp9BpMklEM/gtviRGJWRz/WvoxaYHhJJZNKFvsl7jL0mDyn6Gcx6KeZXgMI6YKXKW/hVaoC3Ahk0KUP4x3vfC/LtdJFP7KicUMfEdeYLLj2t0y2gvJI9oPw8vfTeoD64bsichAok9+8wl/nxhA0DjXoa4e/guqIIgOMjSpA23qXQC2nJZ0FFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7mhuGhTpBFPqXUpnv93qyCX8eI98rn5n+nZVov9z6E=;
 b=r5nsrLHZN2Fb8NNp0sHUNtpa1l+mfcA2xCiNxEM73fExN1xNi3muC/e33y1ZIE3rVOIkSnbNbMIu6jZD9VkGHfv1R/r0LcJOiOkvanII9JmocCX8yotn3DZL2+Q86orNeah1qcj36fYS+G0woHIi6D089S9Fyd4jEyb0OGOVkdhRtlTiHjBiLhkQ/9AMI7gwxsOsai97GEhDfAUB74WAES0o17R4wS0t5ROqrQHYwPsFhsqaglNhF/64pDE2t2u47nRnHtAR1Qnmh7vq+q91TyAGqHFfIpkA/uWQl03pRBiQqsm9SA7uQomj5aCAkIeoqHviBGmvA/+TgcVLaXRIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7mhuGhTpBFPqXUpnv93qyCX8eI98rn5n+nZVov9z6E=;
 b=UWT/b9kYmWS7xuh8DlTFLvb29bHuLcvute9ud83dNnvi6+PxZyo0x+xg79661Ksf22RkCla3uDppRy5DyfQ42VjdWxDMDP+ACumWQ9iRsg4Jft0xjtsQ7wCvz7Xtvqwx047S29kIC/Mv51qBFq3x5EsemGlpnZ9cyK/hcz4c7xw=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEZPR03MB8677.apcprd03.prod.outlook.com (2603:1096:101:22a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 03:50:56 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 03:50:55 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: add
 mt8196-nau8825 document
Thread-Topic: [PATCH v3 10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: add
 mt8196-nau8825 document
Thread-Index: AQHbxKgoOuHfeeDGa0yNKUSms35e97PR8wUAgAEcxoA=
Date: Thu, 15 May 2025 03:50:54 +0000
Message-ID: <a4771a76db6489b6c8507d602fc4cfca17432091.camel@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
	 <20250514081125.24475-11-darren.ye@mediatek.com>
	 <67a7343b-fd1e-4276-83b0-baa28d19f207@kernel.org>
In-Reply-To: <67a7343b-fd1e-4276-83b0-baa28d19f207@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEZPR03MB8677:EE_
x-ms-office365-filtering-correlation-id: aabb44ee-5213-483b-092b-08dd9363b1d5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U05oR3FTTjdRdzlweGs5RDJXRVNWekxGNGd4bTVLN3ZhdXYxenExWVZyT1hx?=
 =?utf-8?B?dzRwU29XTWViVzVmV1BXQ3BDUXl5ekxSdmRQTk9OTWhSb2dOL3dlL01oaFpJ?=
 =?utf-8?B?Wi9scS9sQWFuSTZudzVZSm4zOStJWmpZOFpZSExlTVl5cklCNktCZDgveGFI?=
 =?utf-8?B?L1RsN0NiaUlrSHJET2s5Z2FlWkwwcENvaXVKNTlON3BPYzhrekhORWMyTnIv?=
 =?utf-8?B?NEcwbWNNU1RIUmNYOWhLWkZsSlcya2p4RWZhMk1sejdybUxBRXhnNVFtR2RI?=
 =?utf-8?B?Uk1lZEt0M3haalE5Q0pmckVELzlEL2h0Wjlsb25pejRFSndtM3lBTnZRc1U4?=
 =?utf-8?B?MjJQRGVqL2ltZXdmTmJRU0JSc1FaOStvMjB5c0hiLzhGS052dU05UW0yem9L?=
 =?utf-8?B?UjdIT01kUk1KUHdGVnMxVmsyQzlIVUZlZTYwbGtxeVNvN0ZVWmRIZ2MyR3dr?=
 =?utf-8?B?eVZVSUZ5bEVtWWc2TXZzNnFMUUN0L0xvQnBxYU83R2pJNDVCRGVsSWxxbmFP?=
 =?utf-8?B?TlBibWp2TTFnam1OMkxqKy9tWGg5d3liZ1Y5Zk1hZkE3bVBzUnNjWjRvdlZP?=
 =?utf-8?B?QXFRNGlKeno5dXdncTdKak9UYU84a2p1eGk5ZHVFa1dZbDVGUmEvODlPU1dN?=
 =?utf-8?B?T2VBQnRKRzFrTENSYlB0eW5aUUVCSm5MbzlQMUxhTFdhM2Z1UHBsbjVYalNH?=
 =?utf-8?B?SXY1ZGdLUUNGdWFEZFJQWUYvZytTUW5MK3E1czZWZU5TQWtOeGl1ZjJtVjV6?=
 =?utf-8?B?aDNTSEhSRWdyNlhXUm16bkNYY2lJcjlMakpFYTBDTlpEYkM5YU5CTkd6ZU8w?=
 =?utf-8?B?K05TNkNieWtSMDVMa0wvS3B1QWpGM3FzMUk0UG5RekJFdVFVRVN2cy9UeVli?=
 =?utf-8?B?TEJmNHU3UlZrY3VmdFRNVlF5UDlEMUxveEV1T0cxMTRSbVczNzlHQ1Y2eEli?=
 =?utf-8?B?ZFJPUUFKWjBTbGh4NWtPVU55SENzUDNHL0tweGlhTmgzMlpoSkticm1qYzl3?=
 =?utf-8?B?NGRBV2V5QlBPMVR2YzZHY0ZLY0E2NHZuMlI4L2FqREhhUCswd2VXTFg5Ri9H?=
 =?utf-8?B?M1c5dysxcmVTY0piT1Y2dmo1VlloZkFRcTN5Qis3VDljLzI3cVZsNkNIVUhB?=
 =?utf-8?B?eGF0VnlwckI4Mk52ellyUGgwOWhMc3VrMmxlZ0FGWEQ3SkZERlgxL3lwSW9u?=
 =?utf-8?B?VFJsRGx0bklmRkJWNWIydDgzeWYwN0Z2Y1JreUhEZytEUkpEckNWbFYxbFRk?=
 =?utf-8?B?bU9FRTNHeFViRG9zdVhTK0lkakhqT0pUZXYwNmZmeHdTWko5Wlp0SU9YMGdz?=
 =?utf-8?B?S1Nnd2QxckUzS1RSQWo0Z043Z0EzdkZEdUVQK0hBdDdESm14R3RzaCtMWnJo?=
 =?utf-8?B?V1NRVGd5eDBTQm1BNUhpNzBJbmtTYks1KzFNM0JKMEVNRW5Db24wdnVJdlpT?=
 =?utf-8?B?RkF5SEhIZ09mYXdsSTAvQUpWNmxIemdkclZXQ09OSWJTZkVxaVhuWDd2NnBm?=
 =?utf-8?B?ZHcwTmViaHpmM1hPQmJUQWVvTHNCWWxPcWJXRkljdm5DYXRkVFFubGtRSlVW?=
 =?utf-8?B?T3VSUjA0cWg1REYvMzlsZ3JoNXBzYndRNFdRNWl0bGswdkh4dFZGRjNvYy9s?=
 =?utf-8?B?Nk04WmR5THd0Z0E5RVBSR29YUHNsaFlRMXYvMEFyem9UVUwzSEpMZDlWU3dN?=
 =?utf-8?B?dE83Mkw1SXVVVlB0Z1BUNGQ5eE0wcVNzaTh1cElqU25sMUpnTi83L3poYzY0?=
 =?utf-8?B?KzRZUUUxQW9XNkkzWDhMTS93Znk2TmdaMlZXbTdNa3ZwNTdqOVZMSDhwNkxl?=
 =?utf-8?B?RUF1ZWxOUTBPWVlJYXFmVk1TbEIzR1hGNmM4eDJ3T3lvN1Z2Y2RNK0ZiODJt?=
 =?utf-8?B?WGx0UDVBWlIrTTZvL3A2VnpuRUxQb1U4UkxsM05ialVBTk9PWTJMTUVQOHcr?=
 =?utf-8?Q?Ow98TLyZj9Ha2gczWv+xjnuKOg07oll2?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGRPTlphN0phc0R5NlArYm50QUlyZnU4ZVRRQTliL2o5THdGUVBoUW5KeUtp?=
 =?utf-8?B?M0U3RmIzdUdhUDNIQU8vbU5QRmNrM3JvM1NtcWFWeG5EQTR6U2VLUGVKbnR4?=
 =?utf-8?B?bHZFanFPdHcxaWlmdEQyc0kxSWFjek9hSUdyZzAreVdHTSt5MHJ4TlNtSEpG?=
 =?utf-8?B?aHpPUktEQkJqZXZwNjhIVitHRDJzV2FJZWxzZFd4Z3BzTHcwR2dvOWFQVWp2?=
 =?utf-8?B?MHN0ZkRUMFIrbHBKaThJTTRseEZsT0M1ZzR6Z2p1K3JZMlhOTTY0Rk1xOEhU?=
 =?utf-8?B?VTNrazFsRDZZR0ROb1lhQlYyNDBybkNKeUg1azlaOHNtdHNmSm9jNThEUGhM?=
 =?utf-8?B?ODNlZFlxWDFuNmZKdWJQRFNRaE4yZ0k2ZkxKakxiMDJMOXVBc0d6WGIzemZN?=
 =?utf-8?B?YnNiVWszcHgzVSsxYTNlaHZFZUpGb0xNNC9iajBsc0tjSy9HSERRR2Q3YnRR?=
 =?utf-8?B?YTZDREhYUVBIc3owRnE4V1dTUEg1OXlzdEx1d0ZGSS8zUGFDcGV6cjBYQUo5?=
 =?utf-8?B?NlNGRjlqTklSOElHVEdtN1R4eGRHRDAzNytBN0NZT3ZqMEtTdzNCVXVscm9J?=
 =?utf-8?B?bThZQnNDMmNYZzc1VEMwai9RK285T2VjSWUraVZPNXdsdytrTHEzakhadzJk?=
 =?utf-8?B?bXVRWDZnNUNKWmVwaVBLMzlTUFprR1BWcFhXMisyMHVHakI3T1RRVk5wdmt2?=
 =?utf-8?B?cDBkVTBNaDQ0VVh0Y1pjZjlnQVNYb2syem1yWWdBbForTHIyblNFZ0l3NEVS?=
 =?utf-8?B?Sk11TmdLQTVkOHBiZ1FicE5WV1NjM0lwaEVVZHAyaWNvTXlVdmI0Q1M4ekpn?=
 =?utf-8?B?cCtDcGplQVk4cXUraUdyMkp4N1ZibXE2ZzY1QjQ4LzVzcWNkNTJFYndPZTQy?=
 =?utf-8?B?NzhtczRVN21WNmNkdks2ZGVSOWI4eTFxYmp4T09xMC9Yb3BKTC90UGN2Z05l?=
 =?utf-8?B?WGcwNUQyeDQzendpU2N3ZThMK0tjL2hBZExKeDJjMGZjYmkwa1pSRCtZZXNr?=
 =?utf-8?B?S1h6OGVjdWZzYnIyY1FzMnYyZzhJdDl5Qm5rdWZhZ3dULzFPVGorNDJmQ3R0?=
 =?utf-8?B?QmhkMFlFZmwxbmVLNzQrQmV0bmRaVjY2U1p0Y2w1NTF5ZklFdjZHTjEyenNz?=
 =?utf-8?B?VmZ3M29Cb0h0ZHRSakMrdEZLNzc3TXFEYUl0STVtWFdRNW91SW95WGIyOTdL?=
 =?utf-8?B?Z3I1TnBwejJWSkNNelExcVMvSFc2TjVobHcvOTZ3d1JMSzIvTEdkeWpDVEZT?=
 =?utf-8?B?TlFnSWtHZGQ1RW1nd0lCWjRzeFlGNC9TZGRsazAwbTJHRGUvN1pYR3ArWHRz?=
 =?utf-8?B?UGdXTlcrSTFkU0kwdmVwQ0srb0Y1RWRUZmNjN0RkL215VEtlaC9DN01UZm11?=
 =?utf-8?B?Vk1uNzNXZzg0YnJUc0hFMHRxbGs2WGpjdUlwOTJKNTdkUW1jM3E2OVVoTlNS?=
 =?utf-8?B?VDRLSGNxV0pxanA2aWhWbkowclhhUFF6WGNUSkExYVUvYVREU2NyWjVPUkov?=
 =?utf-8?B?ZldCeCtYWDlaSHV2TEMrYUtWTW1jL3AyZWtxT1YxUUhnYjdMZ3BxTUJ0Kzhr?=
 =?utf-8?B?Q3R6dXF4T25HcjMyUnl5d2VnUDAyNC9iV3FrK0N0bDRSYU1NTStoaDBzMVBX?=
 =?utf-8?B?YlUzbmR6K3lLZmJoS3dIQlBkU0NacHhrcFdzWUZBMm9maWlaTHlkaG1IcG1Y?=
 =?utf-8?B?Wlpid2pHOXhvSHRnaDgrZmhrakVpZjhPeFNrMG5nVmJXRkZ6a3A1SGJkLzRV?=
 =?utf-8?B?SW5YYVJFY3JvZFQ2WUtIbEZmQ3dHMUdhZnFBYndsOU9zSmtFTDh4aDE5c3dS?=
 =?utf-8?B?dWVXbnlXNWJrZlNsMktHQW1pTU12Y3dOMlZzb1M4Z0NDVW9XWWJwTi81UVJB?=
 =?utf-8?B?NnFWQ0M2MjdYakpDUUp5dU1mOXJla3BiUDE5cFFNWWx5c29tM1pkWU9aMFJy?=
 =?utf-8?B?elZYeW1xa2NPQTBUS2xTcUJkbkRzU2pGV0dhVWdyQkVDdVVjS1V2TUVnOFk5?=
 =?utf-8?B?OWtJZjF3T1pIb052cjBRRVk3aktCOW1ySktiUUtVTktHTTFEaHdsVE5sNGJX?=
 =?utf-8?B?SzB1bVM2N3RteVAvNkN5QnFwTGZyY3psTWwvazh1VzVCM281eVpXMDVIWS9P?=
 =?utf-8?B?Yk9RYkRlVzVGWVpRVWwydUpDK29QWXZxejNrL0ZMck41Y1Z3Y0xZUFdrL0E0?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAC06F7DC9DA354C9DE1EF1C645ACF24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabb44ee-5213-483b-092b-08dd9363b1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 03:50:55.0681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peFH5yy6u+KlhpbJBiufmuZS7lJ9ajYGMRn3ElJQQmdw3C3WFQqqrK50iaCsnR2llEc5+jo1zZIDH9ikdDORYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8677

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDEyOjUxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE0LzA1LzIwMjUgMTA6MTEsIERhcnJlbi5ZZSB3cm90
ZToNCj4gDQo+IA0KPiBBIG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50
ICJkb2N1bWVudCIuIFRoZQ0KPiAiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRp
bmcgdGhhdCB0aGlzIGlzIGEgZG9jdW1lbnQuDQo+IFNlZSBhbHNvOg0KPiANCmh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJj
OC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QqTDE4X187SXchIUNUUk5LQTl3TWcwQVJidyFuMnRYdE1qRWFqcjlyakhneFk4SHJv
YklyVnh0Qi1ycjV4am02MjZFZ3lERzdOdlhycmNQQmhvWlp3eGdkTGF0QUhIdXl5VXBEOWdGMGck
DQo+IA0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsg
ICAgZW51bToNCj4gPiArICAgICAgLSBtZWRpYXRlayxtdDgxOTYtbmF1ODgyNS1zb3VuZA0KPiA+
ICsgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1ydDU2ODJzLXNvdW5kDQo+ID4gKyAgICAgIC0gbWVk
aWF0ZWssbXQ4MTk2LXJ0NTY1MC1zb3VuZA0KPiA+ICsNCj4gPiArICBhdWRpby1yb3V0aW5nOg0K
PiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFZhbGlkIG5hbWVzIGNvdWxkIGJlIHRo
ZSBpbnB1dCBvciBvdXRwdXQgd2lkZ2V0cyBvZiBhdWRpbw0KPiA+IGNvbXBvbmVudHMsDQo+ID4g
KyAgICAgIHBvd2VyIHN1cHBsaWVzLCBNaWNCaWFzIG9mIGNvZGVjIGFuZCB0aGUgc29mdHdhcmUg
c3dpdGNoLg0KPiANCj4gTm90aGluZyBpbXByb3ZlZC4gSSBhc2tlZCB0byBkcm9wIHRoZSBwcm9w
ZXJ0eS4gV2h5IGRvIHlvdSBuZWVkIGl0Pw0KDQo+IEkgYW0gc28gc29ycnkgdG8gbG9zZSB5b3Vy
IGFkdmljZSBhbmQgbWFrZSB1cCB0aGUgbmV4dCB2ZXJzaW9uLA0KdGhhbmtzLiBjb25maXJtIHdp
dGggeW91IGFnYWluIHRoZSByZW1vdmUgb2YgYXVkaW8tcm91dGluZyBwcm9wZXJ0eS4NCj4NCj4g
PiArDQo+ID4gKyAgbWVkaWF0ZWsscGxhdGZvcm06DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhl
IHBoYW5kbGUgb2YgTVQ4MTg4IEFTb0MgcGxhdGZvcm0uDQo+ID4gKw0KPiA+ICsgIG1lZGlhdGVr
LGFkc3A6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9w
aGFuZGxlDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhlIHBoYW5kbGUgb2Yg
dGhlIE1UODE4OCBBRFNQIHBsYXRmb3JtLCB3aGljaCBpcyB0aGUNCj4gPiBvcHRpb25hbCBBdWRp
byBEU1ANCj4gPiArICAgICAgaGFyZHdhcmUgdGhhdCBwcm92aWRlcyBhZGRpdGlvbmFsIGF1ZGlv
IGZ1bmN0aW9uYWxpdGllcyBpZg0KPiA+IHByZXNlbnQuDQo+ID4gKyAgICAgIFRoZSBBRkUgd2ls
bCBsaW5rIHRvIEFEU1Agd2hlbiB0aGUgcGhhbmRsZSBpcyBwcm92aWRlZC4NCj4gPiArDQo+IA0K
PiAuLi4NCj4gcmVtb3ZlIG9mIG1lZGlhdGVrLGFkc3AgcHJvcGVydHkuDQo+IA0KPiA+ICsgICAg
ICBjb2RlYzoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogSG9sZHMgc3Vibm9kZSB3aGljaCBp
bmRpY2F0ZXMgY29kZWMgZGFpLg0KPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAg
ICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsgICAgICAgIHByb3BlcnRpZXM6
DQo+ID4gKyAgICAgICAgICBzb3VuZC1kYWk6DQo+ID4gKyAgICAgICAgICAgIG1pbkl0ZW1zOiAx
DQo+ID4gKyAgICAgICAgICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICAgICAgcmVxdWlyZWQ6DQo+
ID4gKyAgICAgICAgICAtIHNvdW5kLWRhaQ0KPiA+ICsNCj4gPiArICAgICAgZGFpLWZvcm1hdDoN
Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogYXVkaW8gZm9ybWF0Lg0KPiA+ICsgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgLSBpMnMNCj4gPiAr
ICAgICAgICAgICAgLSByaWdodF9qDQo+ID4gKyAgICAgICAgICAgIC0gbGVmdF9qDQo+ID4gKyAg
ICAgICAgICAgIC0gZHNwX2ENCj4gPiArICAgICAgICAgICAgLSBkc3BfYg0KPiA+ICsNCj4gPiAr
ICAgICAgbWVkaWF0ZWssY2xrLXByb3ZpZGVyOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZw0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9u
OiBJbmRpY2F0ZXMgZGFpLWxpbmsgY2xvY2sgbWFzdGVyLg0KPiA+ICsgICAgICAgIGl0ZW1zOg0K
PiANCj4gRHJvcCBpdGVtcw0KPg0KPiBEcm9wIGl0ZW1zOiBsaW5lDQo+DQo+ICsgICAgICAgICAg
ZW51bToNCj4gPiArICAgICAgICAgICAgLSBjcHUNCj4gPiArICAgICAgICAgICAgLSBjb2RlYw0K
PiA+ICsNCj4gPiArICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiAr
ICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIGxpbmstbmFtZQ0KPiA+ICsNCj4gPiArdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gVGhpcyBnb2VzIGFmdGVyIHJlcXVpcmVkOiBi
bG9jay4NCj4gDQo+IG1vZGlmeSBhcyBmb2xsb3dzIA0KPiByZXF1aXJlZDoNCj4gICAtIGNvbXBh
dGlibGUNCj4gICAtIG1lZGlhdGVrLHBsYXRmb3JtDQo+DQo+IHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBEYXJyZW4NCj4NCj4gPiArDQo+ID4gK3Jl
cXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gbWVkaWF0ZWsscGxhdGZvcm0N
Cj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

