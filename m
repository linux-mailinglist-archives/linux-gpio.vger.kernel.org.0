Return-Path: <linux-gpio+bounces-34209-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHyZCgsqxWnb7gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34209-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:43:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52063335668
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67A15305F641
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B17347FCD;
	Thu, 26 Mar 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DqSNEPmv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rx3UpyxC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800992566E9;
	Thu, 26 Mar 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528599; cv=fail; b=MxXdpfxt/qvDs6iQKvIehJOzrHCYV+HwSptep/t80ZTvuUxWgWJGqOouap1DNLoECzEEt6kS8fG5UTvJ3gi0ELM5k7ZrqMFkl4dhOfGIPCZY/+SUjTmOhDRZJHRwQRJ7eYXXu0FlAmm2+rpW8kvqXi7tPlAVJgK+Iqtn+dCvYf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528599; c=relaxed/simple;
	bh=wihf647D6/PKw13riWPziwPBdH0DCa+gG1TlVBW/z1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B1qkk8yoVzZ1PRl2asKmE0VWnO+3NDbvgzNJx1r7CIBM/l+ytugGhArnpVCeNRzDAE+2BY2nrQ12dLrxt58W8kKcSDQcBYbVGucDrefIwj5QFj9W+lTJPThbr1cUwQAGvKfPyi3JT1x6GLPdNZffm71OMLU9hfR6J8InodHDPY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DqSNEPmv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rx3UpyxC; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6b48ed46291011f1a02d4725871ece0b-20260326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wihf647D6/PKw13riWPziwPBdH0DCa+gG1TlVBW/z1k=;
	b=DqSNEPmvQsyAWfwh5L6RIOHnvhJH0vEmsl7QxTAO39Co+u+X/uwC8x/8iBLBkSSsD8P8fDjJ+QGlrnOBbvn9ahO2s08hwhNnzfxzYgXZ7MPTtp9jVtNFTpHDBHAZEX1UjVs4J3pzJrfgzYUMIP3frIrL7vEbVQ+/dR33zypjGbM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a76bbbec-024a-4ff8-9623-af2e9af313a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1a482f3f-41ee-42eb-90dd-1068410e1f48,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b48ed46291011f1a02d4725871ece0b-20260326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <fred-wy.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1049275971; Thu, 26 Mar 2026 20:36:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Mar 2026 20:36:30 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Mar 2026 20:36:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm3jI9+dDDpl0zdxDixyOSy440yZJsmCcos6WuAer12OaEiISXCHaFlIHsq6vkBpQR4wuob04ULqkMfaV4Cy8LrqmdkBbCS9Drzx4PSNXbly1AAEwwyC9pDWkPgEo7lGLiiSPIFoc/zZjVPV6ZtPUwOXJEhVfqFPwz9fs70mlE1mITMrtKeWHlKGpj1c1O7k4UvQdD8OkZkjVaYQ77JBrS9/eJZKFuBfw3CKOWppeDFwl/Gc3SOUR6v5CCf0Q+H9ClEgqpoy4mguNEZPzye8KCaHTRLork+jAwP+qVDthGcv0mPjsk1+bIaP6XTyjdFnaFLYDcPlGWQWbK5obKMEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wihf647D6/PKw13riWPziwPBdH0DCa+gG1TlVBW/z1k=;
 b=R5YD5zDhZYtwqNEf7/EjB9jUspU/07zuTe/jnp7vqScB/lkbInvulgRxVUoRbS5yRs2o1gKThn2y49T1cMq3OIJRkNQxPm3ajpykd/+qkFTXtsr2BERx+PnmtvgVweSh0/36k2xO4Wd0Bvi5C6uiqE5RFqs8Qh2KbT1QYv0eHitZO5RidMquo1GBW/H0dNWCvaA3WFef0fc98XPvZsmz1wL89CYboPOO2uMAhpHP9JsopMjyGJhgeADVCdB4Rj9O78a38nlpLrbbamFt08AOe8itFQktw0IsYvZ03S412cZXG0H5k0yJYNf2bTL8aLWrGuGvx0ZsjYT9RqQ5pjniTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wihf647D6/PKw13riWPziwPBdH0DCa+gG1TlVBW/z1k=;
 b=rx3UpyxCEQrNOJuhp2mTAo+RzEogO+GqPBo8EAk0krc1+VErHoaBhjEUjc+kzh41SadHHISMSqyz7BTi1KqSVWS24IBNhVyFUvVjrnxBEDiD5UoJU9y6DnrFGZXQhVAf8Vjwsdhh0+OpZyU9/k9WE0vZKTDAwA1OEzSMl5O/Of0=
Received: from SEZPR03MB6594.apcprd03.prod.outlook.com (2603:1096:101:76::11)
 by SEZPR03MB6668.apcprd03.prod.outlook.com (2603:1096:101:7f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 12:36:18 +0000
Received: from SEZPR03MB6594.apcprd03.prod.outlook.com
 ([fe80::6810:8e15:46f9:a857]) by SEZPR03MB6594.apcprd03.prod.outlook.com
 ([fe80::6810:8e15:46f9:a857%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:36:18 +0000
From: =?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>
To: Mandeep S <Mandeep.S@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Deep Pani
	<Deep.Pani@mediatek.com>, "sean.wang@kernel.org" <sean.wang@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	=?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?= <ot_ye.wang@mediatek.com>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	=?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?= <ot_shunxi.zhang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: mt8901: Add pinctrl driver for
 MT8901
Thread-Topic: [PATCH 3/3] pinctrl: mediatek: mt8901: Add pinctrl driver for
 MT8901
Thread-Index: AQHcXbSA3dPwahzj0kaOPW2QUXG1wrUDKBgAgL5Wx4A=
Date: Thu, 26 Mar 2026 12:36:18 +0000
Message-ID: <0df339f15f4ba7e55880194edfdec1155f2f20f7.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-4-lei.xue@mediatek.com>
	 <df11bbf1-09d1-40fc-be56-6a98d90abcb6@collabora.com>
In-Reply-To: <df11bbf1-09d1-40fc-be56-6a98d90abcb6@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6594:EE_|SEZPR03MB6668:EE_
x-ms-office365-filtering-correlation-id: 8cd7350a-8208-4c95-2c40-08de8b344735
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: ksZ5zK6FI5T7c28Ns6x4d9JDYOcHFRZZSc0QNTUwUb5gE81UjEQpmoNe9rN88c6YRooOjPyq8G3j61MVchr2jSOCIlhpfWL/8PwQ06xuf/uvH1i4i9VHfhz0qx1T0Ka0QKultgciaPE2eHRwjWMeLzjZM4qwK01lz1TGNpCSQQgMTU5C73Lzr1jpZYaXGERZ1pBDHlRA/MkFe8lcOOp6EfJTLsgd6SUy50F3hG1+Lmm7EY/vD9605I313IpHvQ4iai69H4q6HXY7IbL0eHAfyFeWH7hgxStdBXq+d3qoKeU5Q8UrSA/6LMBk2ko5NXhLCEBIT/ZVBblD1Bnurf0CED1ATtI5DzdKuvDf4UhpK+t2by+yI3iA+litwSt8k4xcYP5y1BV2pFFijqnyCiJTCJSfY3YbRsXnv5TlLyJHojrBAnVyr8Nz1mpXOHv8Hk9QwOrnJxglDlz36Wh3juehbJ09DAjVR34Mphph53kZqRztf/y7dfbYOV0m17TJAZv0OrA2H0W/oKOiALGNS1X1djWN26iFHWC9vsntxmRAHtgBTU6cg0Qzh2T7zQ3kZkGCoVvDlPOl4+9CUHlw9lcGlDMy/cNvfqPX1LjEHpRImzMKKM/VMBo09+Te0NB+ik3CUUpP+W1jBVSD+jk2YPq0lTZG5V1BkjZszDh6e7sVcDv5kWORZ4RXQJmpyjDTUlFA5GnCQQfYeIlkXKmW7LS81//RlYJjvn4RMq6pmQuyKOvl9z1uncKYCM22J8WSzt20qH8ImSq2DUyUDd8Sqdb9Je+lAQbQt9vZ3DbocIJpklU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6594.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFlsTWpJdnJNdDlodGo3OTJNV2ExOEZkMFhHbWd2bDJKY1V3ZWJpR0pveTlL?=
 =?utf-8?B?RStITG01UHlDallvN0dqaHB2QW5pS2V3dzNtNGFvY1VNNnF2cnlQOEZrTGhT?=
 =?utf-8?B?RVBnL2lJclljWm5aNzNONlN2ZUR2alJiYkdRZGhsbjVsZmtSamhMWENseEJR?=
 =?utf-8?B?Y0lncGVqVVJyR2Q4bmlQb3RaTmRjVGtmdmc5ck1Cam52ejFBVVI1N24yZ0M3?=
 =?utf-8?B?WnhTcm5YOUxwVU1EWkczYVRzWlczTlJ5K1N5NmlrcWkyMmkwT0IyeEtJaGVP?=
 =?utf-8?B?YnRrV2xxT0lEc1luNFB2c2Fuc2ltVldwY1NGQUpSc1Btd3M1SGtDT1lsUWll?=
 =?utf-8?B?ZEgwQVp2dHoycnFLcU9qZkdtbm5OZFBFMGpydUgvQlQvc0Rpd0g2MmQrSi9m?=
 =?utf-8?B?L1BqT3RkbGtSUFBCOERRWXc2N2RkWktDaG9aMytpeE8ybXF5NkQxRHk3V3lv?=
 =?utf-8?B?c0ZxRTVJUG93Wi93aDYvei9HVFBpVkNYZGoxVENCYnpwdEZyaGljTmk5Qzk2?=
 =?utf-8?B?cnIzOG1RbWp0YVJITXl4LzJudlhiaWs1eXE5RnpkR0hqdWw2R003Q0p2aS84?=
 =?utf-8?B?NldSOUJXb29NUVRIdWNyUXlpeS9rVTc5WmNWVldUZTVLVFlrVWxXMjY2VXEw?=
 =?utf-8?B?aWg4clgzc0t3QVRMM1E2OUM5OVI2R01WRUNoWjhNZWxhak11WFpwOWZHZ0lz?=
 =?utf-8?B?emRnQlNiT3hLMS9ZenRpMFZRaVNHc1MyUjhZOThqREdoVGRjQTNnM2VRcVl6?=
 =?utf-8?B?am5hSDVIbTdOeXhxT3dxYmg4cnlWcW0yTlIxN1FJVmJ2L0pJdTIwQnp1dzY5?=
 =?utf-8?B?aU51aER5Ym93MzZYcG4rSmErQXpLYTVMKzcxWHlGaHpSN2pBckRPeXVwUGhX?=
 =?utf-8?B?aWIrMVlKWW01VERyR3JzNFI0TFFjYjN3VkdpMHZ5V3huelpCek1KQUthSU8v?=
 =?utf-8?B?NDZBT0ZTRHkxTktrZ1AxMDE3TVRZODNKTHNab202WGdSaENHYWRFQmJqbm9D?=
 =?utf-8?B?WThhQ1BQTlErVUpaVFhMNTFISjVuLzR0UlprcGVRci9NbnZOdkRRYnUvMGJC?=
 =?utf-8?B?SWkydVppdjc5cGljZXFkM3BWWTJmNWRxNFQrZSszdnFMZWh2NGd0TmcxOFB0?=
 =?utf-8?B?RERjbGRQbTJaaXNUaHNhQ3JFRnFqZEVYOW1LRVorNnA2RmtsQmxKZlNwaTBP?=
 =?utf-8?B?bmI4dHNNTk1PeGxRWVMzZitUL1kvRmFQTjN6QjZPbnYxa29mNnBqOHpqZDM1?=
 =?utf-8?B?N3o3ZWdvMlN2WnQ1bVZ1cTluNWFtRmErYVNJMXcyb2VPSitBU3libWNTNVB1?=
 =?utf-8?B?N3hhUjROUG5IaUxSVkZyd0k4OE8zSExSVWpORGFTcGdhaTRtZDlxNFdhMjhv?=
 =?utf-8?B?K1E4NHExZnJZWHMzQ3orak5GZzF2M3dnRi9OY0ZrL3pKMkVKcUZzdThjT29x?=
 =?utf-8?B?ZnRmSE04VHdydmxDUmVCejBZSWRsRGNoT28rOENESU16UzhkSGtVOFgvdzV6?=
 =?utf-8?B?c3FYYis1WGQ5V1h4MlJGRXVITW1aMkozY1V2a1FZTEpTV3plNDVJWUxQVncz?=
 =?utf-8?B?bnAxanIzVmMvNyswdmtMc1pLck51eENwUWpSakZzOUpkeWRhaXRNMW91a0kw?=
 =?utf-8?B?RTU2R0RFZ282SWcybFJyS3orWGp5cEhENEhHZTBXa0dKaVZoY0pzbis2akRx?=
 =?utf-8?B?UlpHQUpFZGJUSHJzUG13UnRGd0lwTExtcGF6Y0o2N21id3BlbDNxY0pEL3RI?=
 =?utf-8?B?c0wyNURJcHVhVHJYb2xYN3I4cU00U3pPNTFOL2tVb0FETi9IU3V0eEt4Lzkz?=
 =?utf-8?B?NFkzWWNnQUJwZURBMDRuNTJKS2JmZnpwUEhxNEFYK2xReUVNVDBWU0hnMUlZ?=
 =?utf-8?B?MGZYaFZQUzVZTDh2OERNaGMwc2NRUlhkSUx6S3l2NGRES1lXTUhOSVBWc0pI?=
 =?utf-8?B?c2R4Q0tLWnJhSm5HREJjblNrZ09HelJlQWtTcFZlRlhjQ1VacmtkTmE3RnFO?=
 =?utf-8?B?SlBIakFXcERMN3l3dUttLzV2RkxNbVRpZ3RZemxpdG1XQklOc1h3U3dYTHFI?=
 =?utf-8?B?YkRHRC9ETlBEeWR6NFN6aUN1VWVoM1gyb0ZoMTRuMDVuQ1dRS3pTV0RUcDFr?=
 =?utf-8?B?Y2hhUG44cWxFeng0ZjRqOEF2bjNROXc4YTlxckk2TVU2SWMvOEJnNjhFcGZl?=
 =?utf-8?B?WFQyWFprTHlxSzhDdVVXWWNGK1VzalhmT01vclpJNWtPekp0OVg1dXczVTRT?=
 =?utf-8?B?VkwxOW42ZmRpd3dNOW9ONVQ3eVJwRi9PbUhtZWdWLzhSeEpZM2RhU0xwb3la?=
 =?utf-8?B?emw1QmsrQkRJVTM4ZHlsbUduSC9JR3krR0lKNGNlbFNmVGdQaUViSDdHVFVz?=
 =?utf-8?Q?NvBtqVSVPvbngffc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F4D6A7CAD850944BB23CDDEF94DEAE2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wMFiFcaMFxjDjEz3t3+id8aM64FJtoSzFyGg0qMU1XX0EToMatWHOGdBXdAEtNI2kSIvWR2Ld6Uqee8GvzaT0b7QjflYN6OnB9iNG8aTsvGFvnRDYCPAtKpZiDqFIum+vDdS32JONxCToYraGYz7DFDSvOqme3hjbhUHn5Gcb1U6ZJeY68xVo5q2aD36BdEJP/wvAM9dXEiptgUcfpMaOpMfairiJii6qHSHrQYUQnmCuRXItI/REhdTi/QFISU7wD6OhHs0ArjKu9/a95JReQuUNd6uPTx0+MDZvhwSVaSslhxLZX3lsT/7nGWnqvVgGDJQWxbH0IICrxK7ZitJYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6594.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd7350a-8208-4c95-2c40-08de8b344735
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 12:36:18.1932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuSNoy7YC9cGLKjJGgcAE85nUO9vquIt72VqKFZB6BJrtVgLbtjLrf1NsgvuCGIi4scO284lFr/nmU1GamaQjJ4fti26eX5U2hOExZpuX9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6668
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-34209-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,collabora.com,kernel.org,gmail.com,linaro.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Fred-WY.Chen@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 52063335668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMDI1LTExLTI1IGF0IDEwOjU2ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjUvMTEvMjUgMDM6MzYsIExlaSBY
dWUgaGEgc2NyaXR0bzoNCj4gPiBBZGQgbXQ4OTAxIHBpbmN0cmwsIGdwaW8gYW5kIGVpbnQgZHJp
dmVyIGltcGxlbWVudGF0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBYdWUgPGxl
aS54dWVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTIgKw0KPiA+IMKg
IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgIDEgKw0KPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCA0ICsNCj4gPiDCoCBkcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvbXRrLWVpbnQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSArDQo+ID4g
wqAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4OTAxLmPCoMKgwqDCoCB8IDE0
NjAgKysrKysrKysrKysNCj4gPiDCoCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstbXQ4OTAxLmggfCAyMTMwDQo+ID4gKysrKysrKysrKysrKysrKysNCj4gPiDCoCA2IGZpbGVz
IGNoYW5nZWQsIDM2MDggaW5zZXJ0aW9ucygrKQ0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDg5MDEuYw0KPiA+IMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ4OTAxLmgN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcN
Cj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnDQo+ID4gaW5kZXggNDgxOTYx
N2Q5MzY4Li40ODIwYWU1MTk3YTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZp
Zw0KPiA+IEBAIC0zMjEsNiArMzIxLDE4IEBAIGNvbmZpZyBQSU5DVFJMX01UODUxNg0KPiA+IMKg
wqDCoMKgwqAgZGVmYXVsdCBBUk02NCAmJiBBUkNIX01FRElBVEVLDQo+ID4gwqDCoMKgwqDCoCBz
ZWxlY3QgUElOQ1RSTF9NVEsNCj4gPiANCj4gPiArY29uZmlnIFBJTkNUUkxfTVQ4OTAxDQo+ID4g
K8KgwqDCoMKgIGJvb2wgIk1lZGlhVGVrIE1UODkwMSBwaW4gY29udHJvbCINCj4gPiArwqDCoMKg
wqAgZGVwZW5kcyBvbiBBQ1BJDQo+ID4gK8KgwqDCoMKgIGRlcGVuZHMgb24gQVJNNjQgfHwgQ09N
UElMRV9URVNUDQo+ID4gK8KgwqDCoMKgIGRlZmF1bHQgQVJNNjQgJiYgQVJDSF9NRURJQVRFSw0K
PiA+ICvCoMKgwqDCoCBzZWxlY3QgUElOQ1RSTF9NVEtfUEFSSVMNCj4gPiArwqDCoMKgwqAgaGVs
cA0KPiA+ICvCoMKgwqDCoMKgwqAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xs
ZXIgYW5kIGdwaW8gZHJpdmVyDQo+ID4gK8KgwqDCoMKgwqDCoCBvbiBNZWRpYVRlayBNVDg5MDEg
U29DLg0KPiA+ICvCoMKgwqDCoMKgwqAgSW4gTVRLIHBsYXRmb3JtLCB3ZSBzdXBwb3J0IHZpcnR1
YWwgZ3BpbyBhbmQgdXNlIGl0IHRvDQo+ID4gK8KgwqDCoMKgwqDCoCBtYXAgc3BlY2lmaWMgZWlu
dCB3aGljaCBkb2Vzbid0IGhhdmUgcmVhbCBncGlvIHBpbi4NCj4gPiArDQo+ID4gwqAgIyBGb3Ig
UE1JQw0KPiA+IMKgIGNvbmZpZyBQSU5DVFJMX01UNjM5Nw0KPiA+IMKgwqDCoMKgwqAgYm9vbCAi
TWVkaWFUZWsgTVQ2Mzk3IHBpbiBjb250cm9sIg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9N
YWtlZmlsZQ0KPiA+IGluZGV4IGFlNzY1YmQ5OTk2NS4uNTdjNjliMWU1YzJkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+IEBAIC00MywzICs0Myw0IEBAIG9iai0k
KENPTkZJR19QSU5DVFJMX01UODE5NinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0N
Cj4gPiBwaW5jdHJsLW10ODE5Ni5vDQo+ID4gwqAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MzY1
KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBwaW5jdHJsLW10ODM2NS5vDQo+ID4g
wqAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4NTE2KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArPSBwaW5jdHJsLW10ODUxNi5vDQo+ID4gwqAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ2
Mzk3KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBwaW5jdHJsLW10NjM5Ny5vDQo+
ID4gK29iai0kKENPTkZJR19QSU5DVFJMX01UODkwMSnCoMKgwqDCoMKgwqDCoMKgICs9IHBpbmN0
cmwtbXQ4OTAxLm8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210
ay1laW50LmMNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5jDQo+ID4g
aW5kZXggYzhjNTA5N2MxMWM0Li5iNWE1YmVlYmY5Y2QgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL210ay1laW50LmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvbXRrLWVpbnQuYw0KPiA+IEBAIC03MSw2ICs3MSwxMCBAQCBjb25zdCB1bnNpZ25l
ZCBpbnQgZGVib3VuY2VfdGltZV9tdDY4NzhbXSA9IHsNCj4gPiDCoCB9Ow0KPiA+IMKgIEVYUE9S
VF9TWU1CT0xfR1BMKGRlYm91bmNlX3RpbWVfbXQ2ODc4KTsNCj4gPiANCj4gPiArY29uc3QgdW5z
aWduZWQgaW50IGRlYm91bmNlX3RpbWVfbXQ4OTAxW10gPSB7DQo+ID4gK8KgwqDCoMKgIDE1Niwg
MzEzLCA2MjUsIDEyNTAsIDIwMDAwLCA0MDAwMCwgODAwMDAsIDE2MDAwMCwgMzIwMDAwLA0KPiA+
IDY0MDAwMCwgMH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGRlYm91bmNlX3RpbWVfbXQ4OTAx
KTsNCj4gPiArDQo+ID4gwqAgc3RhdGljIHZvaWQgX19pb21lbSAqbXRrX2VpbnRfZ2V0X29mZnNl
dChzdHJ1Y3QgbXRrX2VpbnQgKmVpbnQsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgZWludF9udW0sDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgb2Zm
c2V0KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQu
aA0KPiA+IGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL210ay1laW50LmgNCj4gPiBpbmRleCAz
Y2RkNmY2MzEwY2QuLjFiMTg1ZjY2MGFmZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvbXRrLWVpbnQuaA0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9tdGstZWludC5oDQo+ID4gQEAgLTUzLDYgKzUzLDcgQEAgZXh0ZXJuIGNvbnN0IHVuc2lnbmVk
IGludCBkZWJvdW5jZV90aW1lX210MjcwMVtdOw0KPiA+IMKgIGV4dGVybiBjb25zdCB1bnNpZ25l
ZCBpbnQgZGVib3VuY2VfdGltZV9tdDY3NjVbXTsNCj4gPiDCoCBleHRlcm4gY29uc3QgdW5zaWdu
ZWQgaW50IGRlYm91bmNlX3RpbWVfbXQ2Nzk1W107DQo+ID4gwqAgZXh0ZXJuIGNvbnN0IHVuc2ln
bmVkIGludCBkZWJvdW5jZV90aW1lX210Njg3OFtdOw0KPiA+ICtleHRlcm4gY29uc3QgdW5zaWdu
ZWQgaW50IGRlYm91bmNlX3RpbWVfbXQ4OTAxW107DQo+ID4gDQo+ID4gwqAgc3RydWN0IG10a19l
aW50Ow0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdDg5MDEuYw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4
OTAxLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NzdkZWM4NWZlMjliDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ODkwMS5jDQo+ID4gQEAgLTAsMCArMSwxNDYwIEBADQo+ID4g
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyNSBNZWRpYVRlayBJbmMuDQo+ID4gKyAqDQo+ID4gKyAqLw0KPiA+ICsN
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPg0KPiA+ICsjaW5jbHVkZSAicGluY3RybC1tdGstbXQ4OTAxLmgiDQo+ID4gKyNpbmNsdWRl
ICJwaW5jdHJsLXBhcmlzLmgiDQo+ID4gKw0KPiANCj4gLi5zbmlwLi4NCj4gDQo+ID4gK3N0YXRp
YyBjb25zdCBjaGFyICogY29uc3QgbXQ4OTAxX3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lW10g
PSB7DQo+ID4gK8KgwqDCoMKgICJpb2NmZzAiLCAiaW9jZmdfbHQyIiwgImlvY2ZnX2x0MyIsICJp
b2NmZ19ydDEiLCAiaW9jZmdfcnQyIiwNCj4gPiAiaW9jZmdfcnQzIiwNCj4gPiArwqDCoMKgwqAg
ImlvY2ZnX3RyIiwgImlvY2ZnX3J0MCIsICJpb2NmZ19sdDEiLCAiaW9jZmdfbGIiLCAiaW9jZmdf
cmIiLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZWludF9o
dyBtdDg5MDFfZWludF9odyA9IHsNCj4gPiArwqDCoMKgwqAgLnBvcnRfbWFzayA9IDB4ZiwNCj4g
PiArwqDCoMKgwqAgLnBvcnRzwqDCoMKgwqAgPSA3LA0KPiA+ICvCoMKgwqDCoCAuYXBfbnVtwqDC
oMKgID0gMjA5LA0KPiA+ICvCoMKgwqDCoCAuZGJfY250wqDCoMKgID0gMzIsDQo+ID4gK8KgwqDC
oMKgIC5kYl90aW1lwqDCoCA9IGRlYm91bmNlX3RpbWVfbXQ4OTAxLA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX3NvYyBtdDg5MDFfZGF0YSA9IHsNCj4g
PiArwqDCoMKgwqAgLnJlZ19jYWwgPSBtdDg5MDFfcmVnX2NhbHMsDQo+ID4gK8KgwqDCoMKgIC5w
aW5zID0gbXRrX3BpbnNfbXQ4OTAxLA0KPiA+ICvCoMKgwqDCoCAubnBpbnMgPSBBUlJBWV9TSVpF
KG10a19waW5zX210ODkwMSksDQo+ID4gK8KgwqDCoMKgIC5uZ3JwcyA9IEFSUkFZX1NJWkUobXRr
X3BpbnNfbXQ4OTAxKSwNCj4gPiArwqDCoMKgwqAgLmVpbnRfaHcgPSAmbXQ4OTAxX2VpbnRfaHcs
DQo+ID4gK8KgwqDCoMKgIC5laW50X3BpbiA9IGVpbnRfcGluc19tdDg5MDEsDQo+ID4gK8KgwqDC
oMKgIC5uZnVuY3MgPSA4LA0KPiA+ICvCoMKgwqDCoCAuZ3Bpb19tID0gMCwNCj4gPiArwqDCoMKg
wqAgLmJhc2VfbmFtZXMgPSBtdDg5MDFfcGluY3RybF9yZWdpc3Rlcl9iYXNlX25hbWUsDQo+ID4g
K8KgwqDCoMKgIC5uYmFzZV9uYW1lcyA9IEFSUkFZX1NJWkUobXQ4OTAxX3BpbmN0cmxfcmVnaXN0
ZXJfYmFzZV9uYW1lKSwNCj4gPiArwqDCoMKgwqAgLnB1bGxfdHlwZSA9IG10ODkwMV9wdWxsX3R5
cGUsDQo+ID4gK8KgwqDCoMKgIC5waW5fcnNlbCA9IG10ODkwMV9waW5fcnNlbF92YWxfcmFuZ2Us
DQo+ID4gK8KgwqDCoMKgIC5ucGluX3JzZWwgPSBBUlJBWV9TSVpFKG10ODkwMV9waW5fcnNlbF92
YWxfcmFuZ2UpLA0KPiA+IC8qbnVtc2VsKi8NCj4gPiArwqDCoMKgwqAgLmJpYXNfc2V0X2NvbWJv
ID0gbXRrX3BpbmNvbmZfYmlhc19zZXRfY29tYm8sDQo+ID4gK8KgwqDCoMKgIC5iaWFzX2dldF9j
b21ibyA9IG10a19waW5jb25mX2JpYXNfZ2V0X2NvbWJvLA0KPiA+ICvCoMKgwqDCoCAuZHJpdmVf
c2V0ID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JldjEsDQo+ID4gK8KgwqDCoMKgIC5kcml2ZV9n
ZXQgPSBtdGtfcGluY29uZl9kcml2ZV9nZXRfcmV2MSwNCj4gPiArwqDCoMKgwqAgLmFkdl9kcml2
ZV9zZXQgPSBtdGtfcGluY29uZl9hZHZfZHJpdmVfc2V0X3JhdywNCj4gPiArwqDCoMKgwqAgLmFk
dl9kcml2ZV9nZXQgPSBtdGtfcGluY29uZl9hZHZfZHJpdmVfZ2V0X3JhdywNCj4gPiArfTsNCj4g
PiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgbXQ4OTAxX3BpbmN0
cmxfYWNwaV9tYXRjaFtdID0gew0KPiA+ICvCoMKgwqDCoCB7Ik5WREE5MjIxIiwgKGtlcm5lbF91
bG9uZ190KSZtdDg5MDFfZGF0YSB9LA0KPiA+ICvCoMKgwqDCoCB7IH0NCj4gPiArfTsNCj4gPiAr
TU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBtdDg5MDFfcGluY3RybF9hY3BpX21hdGNoKTsNCj4g
PiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10ODkwMV9waW5jdHJsX2Ry
aXZlciA9IHsNCj4gPiArwqDCoMKgwqAgLmRyaXZlciA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5uYW1lID0gIm10ODkwMS1waW5jdHJsIiwNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5hY3BpX21hdGNoX3RhYmxlID0NCj4gPiBBQ1BJX1BUUihtdDg5MDFfcGluY3Ry
bF9hY3BpX21hdGNoKSwNCj4gDQo+IFBsZWFzZSBhbHNvIGFkZCBzdXBwb3J0IGZvciBkZXZpY2V0
cmVlIC0gSSBoYXZlIGEgaHVuY2ggKGFuZCBJJ20gc3VyZQ0KPiB0aGF0IEkgYW0NCj4gbm90IHRo
ZSBvbmx5IG9uZSkgdGhhdCBBQ1BJIG1heSBnaXZlIHNvbWUgaXNzdWVzIGF0IHRoZSBlbmQgb2Yg
dGhlDQo+IGRheSwgb24gQVJNNjQuDQo+IA0KPiBPZiBjb3Vyc2UsIEknZCBob3BlIHRoYXQgQUNQ
SSBpcyBhbGwgZ29vZCBvbiB0aGlzIHBsYXRmb3JtLCBidXQNCj4gc3RpbGwuLi4uIDotKQ0KPiAN
Cj4gc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ4OTAxX3BpbmN0cmxfb2ZfbWF0
Y2hbXSA9IHsNCj4gwqDCoMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDg5
MDEtcGluY3RybCIsIC5kYXRhID0NCj4gJm10ODkwMV9kYXRhIH0sDQo+IMKgwqDCoMKgwqDCoMKg
IHsgLyogc2VudGluZWwgKi8gfQ0KPiB9Ow0KPiANCj4gwqDCoMKgwqDCoMKgwqAgLm9mX21hdGNo
X3RhYmxlID0gbXQ4OTAxX3BpbmN0cmxfb2ZfbWF0Y2gsDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLnBtID0gcG1fc2xlZXBfcHRyKCZtdGtfcGFyaXNfcGluY3RybF9wbV9vcHMp
DQo+ID4gK8KgwqDCoMKgIH0sDQo+ID4gK8KgwqDCoMKgIC5wcm9iZSA9IG10a19wYXJpc19waW5j
dHJsX3Byb2JlLA0KPiA+ICt9Ow0KPiANCg0KSGkgRGVlcCwNCg0KQ291bGQgeW91IHBsZWFzZSBj
aGVjayBhbmQgZmVlZGJhY2sgdG8gQW5nZWxvPw0KDQpSZWdhcmRzLA0KRnJlZC1XWSBDaGVuDQoN
Cj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBt
dDg5MDFfcGluY3RybF9pbml0KHZvaWQpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqAgcmV0dXJuIHBs
YXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmbXQ4OTAxX3BpbmN0cmxfZHJpdmVyKTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiArYXJjaF9pbml0Y2FsbChtdDg5MDFfcGluY3RybF9pbml0KTsNCj4gPiArDQo+
ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRp
YVRlayBNVDg5MDEgUGluY3RybCBEcml2ZXIiKTsNCg0K

