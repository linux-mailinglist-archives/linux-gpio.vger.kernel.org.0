Return-Path: <linux-gpio+bounces-21073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7AACFB35
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 04:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F69173EDE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 02:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FE41D9346;
	Fri,  6 Jun 2025 02:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o5u87ywL";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aK7gBpsy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DB5103F;
	Fri,  6 Jun 2025 02:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749176387; cv=fail; b=JuF2ZaU6DY6DVyrNBNqqyMvfvKyutJNMYux2G+IhZDqNsSEul0RIvg1kvQ3DO0jisGDGw9tzrsQAtQmw0vzqt6V2UXXdK0FS5CJf98CCkAL/eBjCvOWf1q+1WANYXbOxUVFMZsRD7YQAMTl+JhdoknIJHLf1ztYTM84sWsHCGYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749176387; c=relaxed/simple;
	bh=MAgzO35YCtrZRL9hwiVlGtjV5bZaYip3Lpiot+omvuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZMzSjfvAXCvbfTr2333Hdhvwd8FUWfUFREpZyET13bvfHFutLzMhtkHwyjpbDcIp9YtMjlVZZEmQ2iWZYmNKec1eDcMbjteI0d3XogTpUliUVJb55o4KXOdbSuL6oyDsQl+nnJg6vA3RSTfl8R7JPnFKef9ajEw66Ghsk+kBMlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=o5u87ywL; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=aK7gBpsy; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b42342f8427c11f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MAgzO35YCtrZRL9hwiVlGtjV5bZaYip3Lpiot+omvuQ=;
	b=o5u87ywLk/BLSSy13QWj02ekJccIF666lF+cIXEvqU2/Ayv6N9VlXvH8m1R4fRBBreY3nFkatScPfwVnxanGWem6CrkimjHF3CwjhTsDK+8Sz/8AjZEWHY920VtKoXmrsw9r4F6W5leCJK47PoioqZBvPzybrjmZBQz4eahMTo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4af8a3e7-527f-4c22-99c0-fb6597ff7767,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:ab8e6158-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b42342f8427c11f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1865159695; Fri, 06 Jun 2025 10:19:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:19:40 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:19:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVqfaBTrb+xV616gcKDHbcx5+m6mL1Yw2M02cfT/ZKKKH/PXlyy08Il2NkblKLwqREBzX9/BaTcEAvHX5LcXsryTkeXO0usI0SmCO/HMLqkM3UcTi3gsNCNxnALTTVtpybbeNwTno5uNDogpNdbPlyDCA9Z49D65HekA8xFikhwoiUamjEBtkEhQUQB2MlWp2f0B/vZLPfhIxyXgbeTq57+mtYhmuWJMHubW2vMoiGotWtksirbM9Qzhh0jh98FYK4uwGi5iKtQz9JCeswkRA7ro6XH8f+phjq2awd6euMkJbpLPwO22g/VlsXIefZhLrqpBBHftnUkMbNUx9sOs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAgzO35YCtrZRL9hwiVlGtjV5bZaYip3Lpiot+omvuQ=;
 b=dks9pSywUjNMjvyYquAOxGx6R7dBh1ag2IPH/i77peLvG8qHTLkqjX6KPRC91SIwnnbwfoTkckjEgvEoH2NrLQTHdlcUXfPgIS5VyC7kvkAyZRK9z5DHybyWYdNhqgI/L5lgoFAQGfAo4nj/iGTlrcDpVrYLcbi1J+/8gKxK9GCNrkVNFZnXneSQUR0+MXBQ+DTuyjBg7P3tU7sztjcHz4dFNdlNDPVfqLZGqjVEEEr09DVePuwpIny9cZzyl9EvIn6B8eQMOycrZtDcCV3+yssQYvDPzmlre6Ihdw3R3Qbc0flHMOcQ+558eAjGqY6B3SOWhRG7oj0W0SR0d7bpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAgzO35YCtrZRL9hwiVlGtjV5bZaYip3Lpiot+omvuQ=;
 b=aK7gBpsyb7fcEvUN/EiOacu3oSFR+9SEwqDHuQfnysQtY5kXexQrbfNd9HS1YVTNrZpsb3MJZ6VbplWuTOLxYE3M+x3Mzq4EE7R4QOQMHNtBGMWkPZt5P/gRROLiPGGwGjQzGe6gc2mSNsldoiZrqEzYEo39we619xsXmASRu6w=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by KL1PR03MB8010.apcprd03.prod.outlook.com (2603:1096:820:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 02:19:37 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 02:19:37 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
Thread-Topic: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
Thread-Index: AQHby8dJIxGFFQT0oU+r2pP7Bjrg3rP0/BiAgAB/PgA=
Date: Fri, 6 Jun 2025 02:19:37 +0000
Message-ID: <fd6821935b9f1f1be2c599a0b2540435024b5072.camel@mediatek.com>
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
	 <20250523094319.10377-2-ot_cathy.xu@mediatek.com>
	 <20250605184411.GA3015566-robh@kernel.org>
In-Reply-To: <20250605184411.GA3015566-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|KL1PR03MB8010:EE_
x-ms-office365-filtering-correlation-id: 55eeb881-a71f-4b48-9b84-08dda4a095d1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cFZUUGZNVlZZeXhjK0owWmFWUzhJd2NVaWV6MmdtYjcxL29RcnhzOHlud3NX?=
 =?utf-8?B?WFhrTHRRNHpPOFNaTmhYYmIveVVMNExwaWdvRlRIS0h5Nm51djZoNHVhamdN?=
 =?utf-8?B?WnY5SzQrek5Kczdqd1RQcVBjQmszdFRwZWlPRElFR0RucFhuV3hUdjgyUVdC?=
 =?utf-8?B?S0p6RklLUVFRTU5XekFiMUVkUUcyM3IvM0Nhd2VPWndVVmlwa0loN0pUYzdQ?=
 =?utf-8?B?QkNPMkdscHdtOUZyUkdnUHIxTVJob2gwTW84QXJnSlpNUU1VRlo4Y3E1cVU0?=
 =?utf-8?B?L25tWjluNmYxR0ZYZnNrY0NMbklLVm1iMmhVK2k0V0dsN2piY1pLTUNKYUkr?=
 =?utf-8?B?SXg4RFc4K2JBUDR2b3dyR2p4Y3A0OE5QN3dkZDFNblpWblU1SjRhclk1SlBj?=
 =?utf-8?B?NDlFdWlDL2tJTk5Lb3pzeWovUGlYNDJmZzNOa1J3NDhYV2ZwV29raTVMVkVq?=
 =?utf-8?B?akVLWWR1MFNuRzZCUUFGeVp1eVFVN3h2Zy9OL1JGVk90a2J2aXl3RDU1QnNP?=
 =?utf-8?B?SllpdE1CRktCZ2ZtdDBoSDhUVWtSbC84QTc0YU1lOWlraTAzTTFWYTVJM05U?=
 =?utf-8?B?ZXB5N2l5ejRnaU9sNk85Zkt2c0Z0WW80L0U0ek12M0JITTZIa3NKSlprVGFM?=
 =?utf-8?B?RkY1RGJZR1Iydjl2cFR5M2l3ZWgzRHZrbjg2bWxnbFI5THUxR3BUM0lDWTA5?=
 =?utf-8?B?M3ZweVpZN0lldWJUZjBvcFVXTWlrRWhrMUJlTzd3amJJeVYzdmZTRVNWd3FZ?=
 =?utf-8?B?clJ3V3l6MUpSamplSVhFQ3FlNXZNaTJlcDBtWGc0L29XRWdRdXE0NFNUSjli?=
 =?utf-8?B?RnlCRHJrR1ZUVSt1RVBTOGtFcFo0NGNZbGh2M0JDWThEaldMRHZITXhEQUVz?=
 =?utf-8?B?YnBxQjN1RCt3cEg0bzRmTHRiblRHQ0xHTUtBR3g5NWdtQnF0WmJhdGlnWjN2?=
 =?utf-8?B?TlVCMnRDZHdGS1ZQdEIvbWkwaWR6TllXVGhITVdJWUJsdkh6VnJOd2J3c0F6?=
 =?utf-8?B?K2NSZW1aZ3hzQ2JSTjlEWmZ3N2ZIVndWVEYzYStPNGwzN2NrOVdBdXJkZU9C?=
 =?utf-8?B?Y0ZlUWN3TEthK3ErMDBZd2JKbk16NTNoWjVza0R3N0lhQUowR0dRalV0RG9L?=
 =?utf-8?B?RFFwYWRBMHRWMlFxaU1GdWdYT0t2OXYxWG9iTFRDSks2dE4vcUlFWVUrc2Vk?=
 =?utf-8?B?dVdROTBWeTl1YkpZdXQzQjdZYWxLTkd1VlNaSG9jS0RyWUxmeVNReUdPOFdq?=
 =?utf-8?B?VkZJSFFQVk51TlZTMlpYcEd0aklXRDNYUEQ3a3YxTzVSRFZ5enNodUdsNHkx?=
 =?utf-8?B?YVFXSWZxMkFHNDVMc2xVTUNiSFVsdEwrV01JQXdmelp3RTZjdldYTUF1Q0Ja?=
 =?utf-8?B?amM2cHdDRDdESWJ3amV3c3ZQYXdsSXlvOFFVVFpiUGg3RmxNT1lxRG9tVUlv?=
 =?utf-8?B?cjBhN3BRdHVQdWFFbGJWc0J3TktxWDQ5MkVNUk5VZ2Ixb2xvSm9rL0RlY01u?=
 =?utf-8?B?NXIvOGNXZmRaWnJzeDFQZE95R1dpNFJaTEhiZnFuR3Y3bHB0SFBwTUVzUDV2?=
 =?utf-8?B?eW9Rc0NES3lPQmxVWTgyT1l6YTZkM3pTaFpaN29FN2hvNm1lY0JIUFNNV0Er?=
 =?utf-8?B?WThCM1lTc3pzcUYwQnRrVlBGV3M1ZVk1dU5oU0ZRRjkwTVVLL0VTTWxuZnVX?=
 =?utf-8?B?NURORUxkSnlJVUt2OWI4c2FIMFYrdExRdVZYM0pubUNSbVo0RG5KSXp4NTR6?=
 =?utf-8?B?Z1lTVUNWcm9vY1FhMDFvZkV4RFB5LzBVYThVa05qNVlrTHVEWEZYaVlYWXhU?=
 =?utf-8?B?dFRFVUJxTlFRU0RMa0c4aHY5ZVlTYXI5a2ZkdzNrSWVxSWZFdXZOa1QzUXBz?=
 =?utf-8?B?Zlp1aTFGb1FSZmRra3BDQ0ovR0ZDNmQ0TVVBdStSUG1sZHJZQ2FNeDZ0QUFQ?=
 =?utf-8?Q?fJttcPFhfYH1FGWpO3BmYRZjIl0d2ONe?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVZKdkNUOVRGR2Y0WDZMY1JGNk9qRWJmTnRacDBLSlc2dFRQUjZrM0YzdjZ2?=
 =?utf-8?B?WmtGRHVybWtTRFdOVnNpblBVUXpyTnpIWDBGRmt4K0xxaW02TVRCTjNjRXBT?=
 =?utf-8?B?YTNpZ0xQVGpKNUhsN0EzWkJiNkNwVDY5Zml5LzdhZG5uZFdrNGRiSjI4VmxP?=
 =?utf-8?B?eEdYV2RoWWV6UTRkcWt6L2dIOE82RFZGbFhTTisrUWVVRWR6UXNNUEtYWi9h?=
 =?utf-8?B?T3JrUERvSXFQdGIxWC9CTzRBZldUMHRqNnpwcEdYRE4wM05sOTkxSnYxUlhK?=
 =?utf-8?B?UHJJSFBWeWlVMjlVNHU1YnhJWU1YczhkcEV3akorbGdGRUxOOFFqTVpjcHYy?=
 =?utf-8?B?UWpRNVR2RXVzQ2NXbFYxbCs1VVVpWUJITDhyMkxNYW11NElOMmE1TjZaYkNW?=
 =?utf-8?B?cTNxMVhFWjNNWnRQdkRqRlpsQ0VKZ0h2bSszT1llTjdtd3hqWUpWMGFjZCs3?=
 =?utf-8?B?eDNBNGhTNk1uZjdPRnQ4Q0M4dzQxWFJhcVBFNms2MUFCUlo2Ti9oc0s2enVr?=
 =?utf-8?B?R0txSFh2UnVZci9WdkdsbUEyV0kxTHVIaGRqWGtET09nVmhqb0owU0t6b05J?=
 =?utf-8?B?UG1rUjdiaXNncUFkdFFDRXBRcCtUczlYY1NSMFk2Zm5MU3hSTWJGR0pWN1Bt?=
 =?utf-8?B?WHEyLzZrei82N3hNME1ld3plWVJJdTFLOGdZNG4zN28rR3dzSE1KU1VDaFdj?=
 =?utf-8?B?U2Nvemo4NEkvYS9GOE5pWitqVnFsQUJxWmVQanNRaEdFazhaeDk0cTIvemJO?=
 =?utf-8?B?Y1Rtand2SlFmZ3FnR0hpcmY4NEsxZFV2UXFKVlpCelI5dnNqeFNYMVR3ZUlQ?=
 =?utf-8?B?Rko1VWhQR0pMbDEvMVROM3FiWEl4OWZXRDhqV2RJbDAvNjZIUGJWQmlsdW9h?=
 =?utf-8?B?MWtMSThocjhZWExrMGhBZWFGUkFRdmRUdDVFTk9TWkJadUhMZEZwbzh1QjMx?=
 =?utf-8?B?T3ozMmUyeE90c3dkRTYyYW9rbCt6S1FyaUNpZzhLbC9EdmZmZjBUZ0x0Nm05?=
 =?utf-8?B?eVJ6QlBPVG12RzVRV1FZdThrYXh6MXFVcENEUndGWVhQOHJyR0ptRWR3a1VH?=
 =?utf-8?B?TTI3R2ZMazVKSFh4aER3Q0k1MFNWZ2tadE8vS1hQcVN1b1h1WnljWkRYeGpB?=
 =?utf-8?B?dVpXUXVEVVNubVNtczFGWlExbEM1MEJ4aUVpbDhkZCtFNFB1T09aUHUvOXN0?=
 =?utf-8?B?NkNhSEtGaUNBaVZwdmNlcVFOU2JHdnVkaTlHRU9zVW91NW5sQmtSYWg3SmFQ?=
 =?utf-8?B?UzBuRTBodFRIRy9zLzNxTFNTdXcyeVBSNnRPRVB3ZjJrZ0tPWnRIVk1yc2tp?=
 =?utf-8?B?UWlBU0dQU1VPL25MSEp5bTRIMWx5RWhzRFpwZVRsQjQ1aGJHRTk0MU4ybnJ3?=
 =?utf-8?B?a3JLRE96bGJBQ013eDhJbkZGeFF4RktkelhZWU9sL0JIejJLeDVzUUN6eUdh?=
 =?utf-8?B?blUzbWxjV0hPUGljamlZM3dDYlBuZ3R5SjhUUnBWQURWcDVLaXJmWGYzbHpD?=
 =?utf-8?B?eWl0aTgwQ053elNnQThpL2Q0RmxFTjVhcFAraVk4bStVOTBjaWE5RFJtRnQz?=
 =?utf-8?B?VGpMMDhYekFJelcyNUVlOGlJUTVWaGNmZHQrWTZ4QWxmQnhNVWhtdW5NVUhD?=
 =?utf-8?B?MHo0Sm1PbGE3Q21oL0YyQU5QdUJhYlNGYStFZHBSeVl3VVFkNUdyaTN3WWsw?=
 =?utf-8?B?eGcxMEJRdjhwSUZ1eTl0K0ZSSGxpZEk1c2xqZnpGNDRPVUJZdy9zbFptd3V5?=
 =?utf-8?B?TmtoN0xLZXJuZ1JreGtpdUJwSlQwNWNsK1FOTU9nZk94VG93QkdpWTF0ZCtY?=
 =?utf-8?B?aHQwRWFUVXZ3ZXVCSkJVMVkwNXB1VlJRWnpvZGhwbUNidnZ3WXVjMXZXanN6?=
 =?utf-8?B?ZUZINkEvbGg1TDcyTFhVaTVHSTZITTQrR3Z0TmUzL211Z3VNeldBSFQ2YXU0?=
 =?utf-8?B?VUdaRFJrVUtzdmJOaWszQzc1YlVIRTZubzM0U09vWkNxQjd5S0VSK3RtZEdp?=
 =?utf-8?B?RXZ5S2JjQ0hkRHNMUklLQ2Q3dmlwQlVBSXFrTHJZamZZaWdDUW15endRTm85?=
 =?utf-8?B?MEcySXZoaHhERHRrOG5MdFMxUHN1bGZ1dklJUC8wTlJ0ZjFpeU5PeFRGSHBj?=
 =?utf-8?B?bUlJNTNCTFM2QUJVcFRjdU1xT21qM1NBNHdHb2JoWlhWQUhJdkRwbXNUR1pO?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A83EC124E7BDA4AA562253FEE3419FE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eeb881-a71f-4b48-9b84-08dda4a095d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:19:37.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOpbAT6SsLsu5KiCVC1mMs1vizDnzEZfhBQ7y9f3PKp5/QFOF0ElFvTmLiAOzJBHEVEy6mj7Vczwj+nFme/dwOWYnYZjdQLKQh/dljlUHM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8010

T24gVGh1LCAyMDI1LTA2LTA1IGF0IDEzOjQ0IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBPbiBGcmksIE1heSAyMywgMjAyNSBhdCAwNTo0Mjo0NlBNICswODAwLCBD
YXRoeSBYdSB3cm90ZToNCj4gPiBBZGQgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50IGZvciBwaW5j
dHJsIG9uIE1lZGlhVGVrIG10ODE4OS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDYXRoeSBY
dSA8b3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGluY3RybC9t
ZWRpYXRlayxtdDgxODktcGluY3RybC55YW1sICAgICAgfCAyMTcNCj4gPiArKysrKysrKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxNyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL21lZGlhdGVrLG10ODE4OS0NCj4gPiBwaW5jdHJsLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRp
YXRlayxtdDgxODktDQo+ID4gcGluY3RybC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDgxODktDQo+ID4gcGluY3RybC55YW1s
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQzYjZm
MTVlZmFkOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDgxODktDQo+ID4gcGluY3RybC55YW1s
DQo+ID4gQEAgLTAsMCArMSwyMTcgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0N
Cj4gPiArJGlkOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9tZWRpYXRlayxtdDgxODktcGluY3RybC55YW1sKl9f
O0l3ISFDVFJOS0E5d01nMEFSYnchajRVSlRUSnZ0RFRXR3YxT0t6YnBWSGozWGxoaHVWZk9PODJ0
M0FHaW9WREF2ME1qVW5vTFpRS25NdFI0NDZHaDhJbU5jZ0k2bTF4dm1aVmlEQSQNCj4gPiArJHNj
aGVtYTogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchajRVSlRU
SnZ0RFRXR3YxT0t6YnBWSGozWGxoaHVWZk9PODJ0M0FHaW9WREF2ME1qVW5vTFpRS25NdFI0NDZH
aDhJbU5jZ0k2bTF4YU02NzZydyQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBNVDgxODkg
UGluIENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gTGVpIFh1
ZSA8bGVpLnh1ZUBtZWRpYXRlay5jb20+DQo+ID4gKyAgLSBDYXRoeSBYdSA8b3RfY2F0aHkueHVA
bWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gKyAgVGhlIE1lZGlh
VGVrJ3MgTVQ4MTg5IFBpbiBjb250cm9sbGVyIGlzIHVzZWQgdG8gY29udHJvbCBTb0MNCj4gPiBw
aW5zLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsg
ICAgY29uc3Q6IG1lZGlhdGVrLG10ODE4OS1waW5jdHJsDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBncGlvIGJhc2UNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogbG0gZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogcmIwIGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJiMSBncm91cCBJTw0K
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBibTAgZ3JvdXAgSU8NCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogYm0xIGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGJtMiBncm91
cCBJTw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBsdDAgZ3JvdXAgSU8NCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogbHQxIGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJ0
IGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGVpbnQwIGdyb3VwIElPDQo+ID4g
KyAgICAgIC0gZGVzY3JpcHRpb246IGVpbnQxIGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IGVpbnQyIGdyb3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGVpbnQzIGdy
b3VwIElPDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGVpbnQ0IGdyb3VwIElPDQo+ID4gKw0K
PiA+ICsgIHJlZy1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBi
YXNlDQo+ID4gKyAgICAgIC0gY29uc3Q6IGxtDQo+ID4gKyAgICAgIC0gY29uc3Q6IHJiMA0KPiA+
ICsgICAgICAtIGNvbnN0OiByYjENCj4gPiArICAgICAgLSBjb25zdDogYm0wDQo+ID4gKyAgICAg
IC0gY29uc3Q6IGJtMQ0KPiA+ICsgICAgICAtIGNvbnN0OiBibTINCj4gPiArICAgICAgLSBjb25z
dDogbHQwDQo+ID4gKyAgICAgIC0gY29uc3Q6IGx0MQ0KPiA+ICsgICAgICAtIGNvbnN0OiBydA0K
PiA+ICsgICAgICAtIGNvbnN0OiBlaW50MA0KPiA+ICsgICAgICAtIGNvbnN0OiBlaW50MQ0KPiA+
ICsgICAgICAtIGNvbnN0OiBlaW50Mg0KPiA+ICsgICAgICAtIGNvbnN0OiBlaW50Mw0KPiA+ICsg
ICAgICAtIGNvbnN0OiBlaW50NA0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAg
ZGVzY3JpcHRpb246IFRoZSBpbnRlcnJ1cHQgb3V0cHV0cyB0byBzeXNpcnEuDQo+IA0KPiBEcm9w
DQoNCiAgVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4gSXQgd2lsbCBiZSBmaXhlZCBpbiBuZXh0
IHZlcnNpb24uDQoNCj4gDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBpbnRl
cnJ1cHQtY29udHJvbGxlcjogdHJ1ZQ0KPiA+ICsNCj4gPiArICAnI2ludGVycnVwdC1jZWxscyc6
DQo+ID4gKyAgICBjb25zdDogMg0KPiA+ICsNCj4gPiArICBncGlvLWNvbnRyb2xsZXI6IHRydWUN
Cj4gPiArDQo+ID4gKyAgJyNncGlvLWNlbGxzJzoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+
ICsgICAgICBOdW1iZXIgb2YgY2VsbHMgaW4gR1BJTyBzcGVjaWZpZXIsIHNob3VsZCBiZSB0d28u
IFRoZSBmaXJzdA0KPiA+IGNlbGwgaXMgdGhlDQo+ID4gKyAgICAgIHBpbiBudW1iZXIsIHRoZSBz
ZWNvbmQgY2VsbCBpcyB1c2VkIHRvIHNwZWNpZnkgb3B0aW9uYWwNCj4gPiBwYXJhbWV0ZXJzIHdo
aWNoDQo+ID4gKyAgICAgIGFyZSBkZWZpbmVkIGluIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4u
DQo+IA0KPiBEcm9wIHRoZSAxc3Qgc2VudGVuY2UuDQoNCiAgSXQgd2lsbCBiZSBmaXhlZCBpbiBu
ZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gKyAgICBjb25zdDogMg0KPiA+ICsNCj4gPiArICBncGlv
LXJhbmdlczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGdwaW8tbGluZS1u
YW1lczogdHJ1ZQ0KPiA+ICsNCj4gPiArIyBQSU4gQ09ORklHVVJBVElPTiBOT0RFUw0KPiA+ICtw
YXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAnLXBpbnMkJzoNCj4gPiArICAgIHR5cGU6IG9iamVj
dA0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICAg
cGF0dGVyblByb3BlcnRpZXM6DQo+ID4gKyAgICAgICdecGlucyc6DQo+ID4gKyAgICAgICAgdHlw
ZTogb2JqZWN0DQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvcGluY3RybC9waW5jZmctbm9k
ZS55YW1sDQo+ID4gKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAg
ICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBBIHBpbmN0cmwgbm9kZSBzaG91bGQg
Y29udGFpbiBhdCBsZWFzdCBvbmUgc3Vibm9kZQ0KPiA+IHJlcHJlc2VudGluZyB0aGUNCj4gPiAr
ICAgICAgICAgIHBpbmN0cmwgZ3JvdXBzIGF2YWlsYWJsZSBvbiB0aGUgbWFjaGluZS4gRWFjaCBz
dWJub2RlDQo+ID4gd2lsbCBsaXN0IHRoZQ0KPiA+ICsgICAgICAgICAgcGlucyBpdCBuZWVkcywg
YW5kIGhvdyB0aGV5IHNob3VsZCBiZSBjb25maWd1cmVkLCB3aXRoDQo+ID4gcmVnYXJkIHRvIG11
eGVyDQo+ID4gKyAgICAgICAgICBjb25maWd1cmF0aW9uLCBwdWxsdXBzLCBkcml2ZSBzdHJlbmd0
aCwgaW5wdXQNCj4gPiBlbmFibGUvZGlzYWJsZSBhbmQgaW5wdXQNCj4gPiArICAgICAgICAgIHNj
aG1pdHQuDQo+ID4gKw0KPiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICBw
aW5tdXg6DQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgICAg
IEludGVnZXIgYXJyYXksIHJlcHJlc2VudHMgZ3BpbyBwaW4gbnVtYmVyIGFuZCBtdXgNCj4gPiBz
ZXR0aW5nLg0KPiA+ICsgICAgICAgICAgICAgIFN1cHBvcnRlZCBwaW4gbnVtYmVyIGFuZCBtdXgg
dmFyaWVzIGZvciBkaWZmZXJlbnQNCj4gPiBTb0NzLCBhbmQgYXJlDQo+ID4gKyAgICAgICAgICAg
ICAgZGVmaW5lZCBhcyBtYWNyb3MgaW4NCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4OS1waW5mdW5jLmgNCj4gPiArICAgICAgICAgICAgICBkaXJlY3RseSwgZm9yIHRoaXMg
U29DLg0KPiA+ICsNCj4gPiArICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoOg0KPiA+ICsgICAgICAg
ICAgICBlbnVtOiBbMiwgNCwgNiwgOCwgMTAsIDEyLCAxNCwgMTZdDQo+ID4gKw0KPiA+ICsgICAg
ICAgICAgYmlhcy1wdWxsLWRvd246DQo+ID4gKyAgICAgICAgICAgIG9uZU9mOg0KPiA+ICsgICAg
ICAgICAgICAgIC0gdHlwZTogYm9vbGVhbg0KPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzEw
MCwgMTAxLCAxMDIsIDEwM10NCj4gPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgx
ODkgcHVsbCBkb3duIFBVUEQvUjAvUjEgdHlwZQ0KPiA+IGRlZmluZSB2YWx1ZS4NCj4gPiArICAg
ICAgICAgICAgICAtIGVudW06IFs3NTAwMCwgNTAwMF0NCj4gPiArICAgICAgICAgICAgICAgIGRl
c2NyaXB0aW9uOiBtdDgxODkgcHVsbCBkb3duIFJTRUwgdHlwZSBzaSB1bml0DQo+ID4gdmFsdWUo
b2htKS4NCj4gPiArICAgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgICAg
ICBGb3IgcHVsbCBkb3duIHR5cGUgaXMgbm9ybWFsLCBpdCBkb2Vzbid0IG5lZWQgYWRkDQo+ID4g
UjFSMCBkZWZpbmUNCj4gPiArICAgICAgICAgICAgICBhbmQgcmVzaXN0YW5jZSB2YWx1ZS4NCj4g
DQo+IGJsYW5rIGxpbmUgYmV0d2VlbiBwYXJhZ3JhcGhzIG9yIHJlLXdyYXAgdGhlIHRleHQuDQoN
CiAgSXQgd2lsbCBiZSBmaXhlZCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gKyAgICAgICAg
ICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBVUEQvUjAvUjEgdHlwZSwgaXQgY2FuIGFkZA0K
PiA+IFIxUjAgZGVmaW5lIHRvDQo+ID4gKyAgICAgICAgICAgICAgc2V0IGRpZmZlcmVudCByZXNp
c3RhbmNlLiBJdCBjYW4gc3VwcG9ydA0KPiA+ICJNVEtfUFVQRF9TRVRfUjFSMF8wMCIgJg0KPiA+
ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFSMF8wMSIgJiAiTVRLX1BVUERfU0VUX1Ix
UjBfMTAiICYNCj4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VUX1IxUjBfMTEiIGRlZmlu
ZSBpbiBtdDgxODkuDQo+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBE
L1JTRUwsIGl0IGNhbiBhZGQgcmVzaXN0YW5jZQ0KPiA+IHZhbHVlKG9obSkNCj4gPiArICAgICAg
ICAgICAgICB0byBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2UgYnkgaWRlbnRpZnlpbmcgcHJvcGVy
dHkNCj4gPiArICAgICAgICAgICAgICAibWVkaWF0ZWsscnNlbC1yZXNpc3RhbmNlLWluLXNpLXVu
aXQiLiBJdCBjYW4NCj4gPiBzdXBwb3J0IHJlc2lzdGFuY2UNCj4gPiArICAgICAgICAgICAgICB2
YWx1ZShvaG0pICI3NTAwMCIgJiAiNTAwMCIgaW4gbXQ4MTg5Lg0KPiANCj4gTm8gbmVlZCB0byBy
ZXBlYXQgdmFsdWVzIHRoZSBzY2hlbWEgc2F5cy4NCg0KICBJdCB3aWxsIGJlIGZpeGVkIGluIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICBiaWFzLXB1bGwtdXA6DQo+
ID4gKyAgICAgICAgICAgIG9uZU9mOg0KPiA+ICsgICAgICAgICAgICAgIC0gdHlwZTogYm9vbGVh
bg0KPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzEwMCwgMTAxLCAxMDIsIDEwM10NCj4gPiAr
ICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxODkgcHVsbCB1cCBQVVBEL1IwL1IxIHR5
cGUgZGVmaW5lDQo+ID4gdmFsdWUuDQo+ID4gKyAgICAgICAgICAgICAgLSBlbnVtOiBbMTAwMCwg
MTUwMCwgMjAwMCwgMzAwMCwgNDAwMCwgNTAwMCwgNzUwMDBdDQo+ID4gKyAgICAgICAgICAgICAg
ICBkZXNjcmlwdGlvbjogbXQ4MTg5IHB1bGwgdXAgUlNFTCB0eXBlIHNpIHVuaXQNCj4gPiB2YWx1
ZShvaG0pLg0KPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICAgICAg
ICAgIEZvciBwdWxsIHVwIHR5cGUgaXMgbm9ybWFsLCBpdCBkb24ndCBuZWVkIGFkZCBSMVIwDQo+
ID4gZGVmaW5lDQo+ID4gKyAgICAgICAgICAgICAgYW5kIHJlc2lzdGFuY2UgdmFsdWUuDQo+ID4g
KyAgICAgICAgICAgICAgRm9yIHB1bGwgdXAgdHlwZSBpcyBQVVBEL1IwL1IxIHR5cGUsIGl0IGNh
biBhZGQgUjFSMA0KPiA+IGRlZmluZSB0bw0KPiA+ICsgICAgICAgICAgICAgIHNldCBkaWZmZXJl
bnQgcmVzaXN0YW5jZS4gSXQgY2FuIHN1cHBvcnQNCj4gPiAiTVRLX1BVUERfU0VUX1IxUjBfMDAi
ICYNCj4gPiArICAgICAgICAgICAgICAiTVRLX1BVUERfU0VUX1IxUjBfMDEiICYgIk1US19QVVBE
X1NFVF9SMVIwXzEwIiAmDQo+ID4gKyAgICAgICAgICAgICAgIk1US19QVVBEX1NFVF9SMVIwXzEx
IiBkZWZpbmUgaW4gbXQ4MTg5Lg0KPiA+ICsgICAgICAgICAgICAgIEZvciBwdWxsIHVwIHR5cGUg
aXMgUFUvUlNFTCwgaXQgY2FuIGFkZCByZXNpc3RhbmNlDQo+ID4gdmFsdWUob2htKQ0KPiA+ICsg
ICAgICAgICAgICAgIHRvIHNldCBkaWZmZXJlbnQgcmVzaXN0YW5jZSBieSBpZGVudGlmeWluZyBw
cm9wZXJ0eQ0KPiA+ICsgICAgICAgICAgICAgICJtZWRpYXRlayxyc2VsLXJlc2lzdGFuY2UtaW4t
c2ktdW5pdCIuIEl0IGNhbg0KPiA+IHN1cHBvcnQgcmVzaXN0YW5jZQ0KPiA+ICsgICAgICAgICAg
ICAgIHZhbHVlKG9obSkgIjEwMDAiICYgIjE1MDAiICYgIjIwMDAiICYgIjMwMDAiICYNCj4gPiAi
NDAwMCIgJiAiNTAwMCIgJg0KPiA+ICsgICAgICAgICAgICAgICI3NTAwMCIgaW4gbXQ4MTg5Lg0K
PiANCj4gTm8gbmVlZCB0byByZXBlYXQgdmFsdWVzIHRoZSBzY2hlbWEgc2F5cy4NCg0KICBJdCB3
aWxsIGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAg
ICBiaWFzLWRpc2FibGU6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgICAgICBvdXRwdXQtaGlnaDog
dHJ1ZQ0KPiA+ICsNCj4gPiArICAgICAgICAgIG91dHB1dC1sb3c6IHRydWUNCj4gPiArDQo+ID4g
KyAgICAgICAgICBpbnB1dC1lbmFibGU6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgICAgICBpbnB1
dC1kaXNhYmxlOiB0cnVlDQo+ID4gKw0KPiA+ICsgICAgICAgICAgaW5wdXQtc2NobWl0dC1lbmFi
bGU6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgICAgICBpbnB1dC1zY2htaXR0LWRpc2FibGU6IHRy
dWUNCj4gPiArDQo+ID4gKyAgICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgICAtIHBpbm11
eA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSBy
ZWcNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIGludGVycnVwdC1jb250cm9sbGVyDQo+
ID4gKyAgLSAnI2ludGVycnVwdC1jZWxscycNCj4gPiArICAtIGdwaW8tY29udHJvbGxlcg0KPiA+
ICsgIC0gJyNncGlvLWNlbGxzJw0KPiA+ICsgIC0gZ3Bpby1yYW5nZXMNCj4gPiArDQo+ID4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAg
LSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaD4NCj4g
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+DQo+ID4gKyAgICAjZGVmaW5lIFBJTk1VWF9HUElPNTFfX0ZVTkNfU0NMMCAoTVRLX1BJTl9O
Tyg1MSkgfCAyKQ0KPiA+ICsgICAgI2RlZmluZSBQSU5NVVhfR1BJTzUyX19GVU5DX1NEQTAgKE1U
S19QSU5fTk8oNTIpIHwgMikNCj4gPiArDQo+ID4gKyAgICBwaW86IHBpbmN0cmxAMTAwMDUwMDAg
ew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg5LXBpbmN0cmwiOw0K
PiA+ICsgICAgICAgIHJlZyA9IDwweDEwMDA1MDAwIDB4MTAwMD4sDQo+ID4gKyAgICAgICAgICAg
ICAgPDB4MTFiNTAwMDAgMHgxMDAwPiwNCj4gPiArICAgICAgICAgICAgICA8MHgxMWM1MDAwMCAw
eDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgIDwweDExYzYwMDAwIDB4MTAwMD4sDQo+ID4gKyAg
ICAgICAgICAgICAgPDB4MTFkMjAwMDAgMHgxMDAwPiwNCj4gPiArICAgICAgICAgICAgICA8MHgx
MWQzMDAwMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgIDwweDExZDQwMDAwIDB4MTAwMD4s
DQo+ID4gKyAgICAgICAgICAgICAgPDB4MTFlMjAwMDAgMHgxMDAwPiwNCj4gPiArICAgICAgICAg
ICAgICA8MHgxMWUzMDAwMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgIDwweDExZjIwMDAw
IDB4MTAwMD4sDQo+ID4gKyAgICAgICAgICAgICAgPDB4MTFjZTAwMDAgMHgxMDAwPiwNCj4gPiAr
ICAgICAgICAgICAgICA8MHgxMWRlMDAwMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAgICAgIDww
eDExZTYwMDAwIDB4MTAwMD4sDQo+ID4gKyAgICAgICAgICAgICAgPDB4MWMwMWUwMDAgMHgxMDAw
PiwNCj4gPiArICAgICAgICAgICAgICA8MHgxMWYwMDAwMCAweDEwMDA+Ow0KPiA+ICsgICAgICAg
IHJlZy1uYW1lcyA9ICJiYXNlIiwgImxtIiwgInJiMCIsICJyYjEiLCAiYm0wIiAsICJibTEiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICJibTIiLCAibHQwIiwgImx0MSIsICJydCIsICJlaW50
MCIsICJlaW50MSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgImVpbnQyIiwgImVpbnQzIiwg
ImVpbnQ0IjsNCj4gPiArICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQo+ID4gKyAgICAgICAgI2dw
aW8tY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbyAwIDAgMTgy
PjsNCj4gPiArICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gPiArICAgICAgICBpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMjM5IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ID4gKyAgICAg
ICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4gPiArDQo+ID4gKyAgICAgICAgaTJjMC1waW5z
IHsNCj4gPiArICAgICAgICAgICAgcGlucyB7DQo+ID4gKyAgICAgICAgICAgICAgICBwaW5tdXgg
PSA8UElOTVVYX0dQSU81MV9fRlVOQ19TQ0wwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIDxQSU5NVVhfR1BJTzUyX19GVU5DX1NEQTA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgYmlh
cy1kaXNhYmxlOw0KPiA+ICsgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAg
ICB9Ow0KPiA+IC0tDQo+ID4gMi40NS4yDQo+ID4gDQo=

