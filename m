Return-Path: <linux-gpio+bounces-14940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C670CA168F4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 10:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D31A73A035B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41919D072;
	Mon, 20 Jan 2025 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uqtQDCuI";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SwS0Va1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE397196DB1;
	Mon, 20 Jan 2025 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364367; cv=fail; b=TR4DS8k+COfB+gaq7zGgbw9m/XB0MxznFp+G9wmqUszPExJTeE2Os5MjTQNLpxt3S5bQ2du9doY9RuG9RB/7dm5SU6MLJMunPihLe0QMcSjo61CqzUdD5LeFoa3RdHRA7jI8Yt0OQ31RsCk2GXjEKZu9J17gIcAA870tWTbs7q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364367; c=relaxed/simple;
	bh=1fYEr3bdfojTGbQTYMuKJissbWXmqiwEA7+NRlxehjY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G0GiMXKc+ewGBudDyp3J0NhmxEVikNaj8LRATLA08FJfwo3R9x6r3N7MogfVK7UrsGPlCC5yymxI6C2N3sRiDiIvv6vYJmlURFm6xJz3i0Is6JrJYF9M9f8b6fC1JR47jUCffv4s9VdOZZTFOD07PBcnbq8XM/A+XMvGaVlqhoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uqtQDCuI; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SwS0Va1j; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b24c86a8d70e11ef99858b75a2457dd9-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1fYEr3bdfojTGbQTYMuKJissbWXmqiwEA7+NRlxehjY=;
	b=uqtQDCuIaZB7y4TTGUyn7yAXW0kAwT/WJjV5i7BL5YVhswzBoIYG85j3wQ5+9LW9fsTrNzzQy+Hgzy8MhMzz9GXqgFy2+wnSASsq+Junw3nHr+cWolU2r1j/N+sCXEo4aMHhYIVlBIsRFQSP6H5aM0g7XytxK4DGeqgPE1HkREM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5bbea15d-c457-4b22-b755-2fe6f2917b39,IP:0,U
	RL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:60aa074,CLOUDID:69fb2b0f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b24c86a8d70e11ef99858b75a2457dd9-20250120
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 981807653; Mon, 20 Jan 2025 17:12:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 20 Jan 2025 17:12:38 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 20 Jan 2025 17:12:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO117CuDS4mfF+83XHhM/tEBDcM9m3ILMgv+ggWcmTSpyF6HSo1BLM8cXHfBT6tKjbHIVi0OcBuV+UD7zfIDcyQbngdJjmWBctF+79O+zMG9LmfOO3nCREV95JGQHbubg4O/xs/bqKkdGzUkM82KN23bq5lfer46sz7POgxqtyoEV/WbSpnVc5NBANCZuGBWi57bRPeC0+bqKEI6fm79UQF7TnnWcPRT7zfWWsMfnS2hc36ZMQJ8YyWNU7jSeH5ryJPZHPAj3bb92cF4M61dsLQ1loD9mZfP1XpSxSwonOp7Ju5123XuxPsSLdtUWpQ2gCo4GKpoWa+3WKHF7AqxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fYEr3bdfojTGbQTYMuKJissbWXmqiwEA7+NRlxehjY=;
 b=QbBTi9GT2wUqsjBXF7AJmaKUqkGyJRPxV4nhJ4KiAGE2QGTMhnfBN+GX6e3e7DfiebC5MQMKAcWtpiz5lOAYe4+exDJPUP5DaQRTa6jbFTuP0uzEIXlSmGKnJm1Ij2MSwGkI5T4VFe3LfLGEzlj+PraMFCkRjsQgvmkXjnivgt2y3FOV+NV38biOsvue7pzEO5GqnjwszJCnTil72WjDjbwWq9yPioyPQQjE7Vwtk1z3k6hjYBB620Eqjk50olE/+0BIINDTeotz+sGN0PyUAKJoomeLohYqhkYyghA+wjAz9a49ArBTykkoSfAAwOl8RWPuLZsCCYzHwE4L6+brXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fYEr3bdfojTGbQTYMuKJissbWXmqiwEA7+NRlxehjY=;
 b=SwS0Va1jC917+oKTK3lIe6pypjAL1cNZymuYKbok6sAgUFe8fNfAU9Igi5da2o80sm+V390TJ37JiFDoTwy+aamWjjDdITmdo3pM1XAGIJ3lzwEN5q1141y5sAgxLPM+A/Xz8+yvalbq1ds0q2YJLzZokSCcZ7nB1qMN2YRnwAk=
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com (2603:1096:4:152::11)
 by TYZPR03MB8134.apcprd03.prod.outlook.com (2603:1096:400:453::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Mon, 20 Jan
 2025 09:12:35 +0000
Received: from SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82]) by SI2PR03MB5691.apcprd03.prod.outlook.com
 ([fe80::6e44:2111:39ae:cc82%6]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 09:12:35 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?=
	<Wenbin.Mei@mediatek.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, =?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?=
	<Guodong.Liu@mediatek.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQCAAFYhAIAADccAgAAESoCABlQ1AA==
Date: Mon, 20 Jan 2025 09:12:35 +0000
Message-ID: <113617eae8b4341b6546d9a7ed0eac069d4c19a1.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
	 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
	 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
	 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
	 <CAGXv+5FtA7KCPE1FQ1Wp=M_11=20n432zSWTkeBasUa4fdpm8A@mail.gmail.com>
In-Reply-To: <CAGXv+5FtA7KCPE1FQ1Wp=M_11=20n432zSWTkeBasUa4fdpm8A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5691:EE_|TYZPR03MB8134:EE_
x-ms-office365-filtering-correlation-id: 2bf40ace-9faf-41b3-2ec3-08dd39329416
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bms3ZTNIckpXeUN5SFNOTnlNQ2wwRndQcDN2TVl3TEZlbTBWT2tlbWdTampG?=
 =?utf-8?B?NXNhV3ZxTE5sS0haSXgvbkk0Uks0S3dNWXlHL1NBcFVQdHRyNGM2K2MxbjJi?=
 =?utf-8?B?ZGNkYmFqRERhOHJGYStKdmFpaUJSQStEYWh3cU8zbEhPWVBJdEJLbW9VVWs3?=
 =?utf-8?B?Q0Y3NnIzY0theEFZMmU2OVN1Nk0rZzdJUXU2UndkSkRJaURnWlUzL21Rd2JL?=
 =?utf-8?B?YllNZU9TUSsvdVFTTjYzRWhrTDA5dnRsUnI4MTZadnpVS05RZXdGYUNSK2JX?=
 =?utf-8?B?akRyNVdkWVY4QytQZm96ZjBaWDh0ck1HTTBkU2d0Zk5LRjNuZU1rNTJIa0Va?=
 =?utf-8?B?TkhXanhzbWNCNmgrZTRIdmhEUGNYQnl0ZGhVMEh0ZzhwMzN5VytsMTFYRHN0?=
 =?utf-8?B?WDF4ZnQzOGJJSDBsMHVBVUZlYWR1dlFtVVo0dGRIODVUYmI4RXJPbDRzaERP?=
 =?utf-8?B?VkZpWTQvQ3hScGlpRnM3NU1UVTJPenF6aXhuNWtuRkluTlRHU0FhZm02Mmds?=
 =?utf-8?B?V21rTTRBYU1QSmxnK2dtYlFMMWFNb1Z1NHozZVlUclNpWHFwTmpYQ1U5TFJI?=
 =?utf-8?B?bmVRaEtSbm9XTFFTNyswQ2JJeGFxNEpFdEllN2h0TzE5N0RBWjZnNDIzWTFH?=
 =?utf-8?B?cXV1RytreXRBOGt5YXhxL3UxcWZ0SE5LczVzblpFZnZoTlhjdnhPeENTQWxG?=
 =?utf-8?B?ZXU2bXFkZmNOalRlWE9uSU50K3htK1IwbkllN0tEYzg1bU5oYjRLZzIzNFl3?=
 =?utf-8?B?L2Npa2ZEdWdjaUZ0cHdVZWJESGZhekRQRW5vSGFvREJEKzU3azdmNnVZa3FN?=
 =?utf-8?B?OFJ0aFBJM25oZmxPTGlVbjRvZnRnQXFTaDNsVVVwUFpRbWxXMFNqQ2JrTFpo?=
 =?utf-8?B?bXA1d08vNHBMY1lzUGQ0YTRLTG4xbmVnQ1drS2NuVmkwOE9pcXZENjZPTE9S?=
 =?utf-8?B?bm5IZXlpTFRJUUN4QlpJU1JocTkwa2E1UkZXc3FIUk5XZXRRdG0xNzdCQktK?=
 =?utf-8?B?Rit6OS9QcTNNNGI2cFRjZTNyeVdwcHBVeGJIQlM0TEdxRXFMUm1CaktHR0Rw?=
 =?utf-8?B?KzNQa3IxeGE2TTZGcWNNN3BITE9GMjJPclFaeUNmQS9ncUNxVldJVXRtODJX?=
 =?utf-8?B?RmQvQkVyQk1UUEQ1M2VhS2ZvMktncTlvQlQyUTFZYkZneUFlSUtJSXArblBQ?=
 =?utf-8?B?SW8rUzhmcWFqL0Nyb3NuaXM1UkxySTQ4cys5RmFVK1FoaDdDakM2Vk1rN1B0?=
 =?utf-8?B?eUlpdCttOUsvL3hMcFhaWGRIUXlZUldPV09GVjVIMWZrM20wVU9JRVBnSDVO?=
 =?utf-8?B?cmdiWmNIY0p1THl2SHJsY3Q3MEdBWXlBMFNTM3ZobC92Vk44bWRiYXgxQTlu?=
 =?utf-8?B?L3pSdEtEcklMSDF5cjUxU09NWkZPdjMvZVdQSk15a1h2NkJTWDYzOEpsb212?=
 =?utf-8?B?Z2lrbzRJU3MwNCtKRTRtYVJiMnFuZkNkWWFXb0tZNEZBdkJNWWRLMGdzUEJV?=
 =?utf-8?B?RWtTQy9XakIrTFFmVHVNalFacmR3VnU0TXFGYk5zR1R5WTNBVVV1MGZaS0hj?=
 =?utf-8?B?NloyUmRBRVBVdGhlQTJOQWNYRFY5ckYwaVUxR05PcW5hcTdjZE90S2ovVTFG?=
 =?utf-8?B?L3ZNSk5QNUhkZW8ydlBGOVI1SVVldXc1b2xmczk3NGJnS1MrNlVVOXl2ZENW?=
 =?utf-8?B?NEJrbGhBaTB4YVZQdytSYmJ5U2FTSUdtNTc4TVl5TlVwcWl5OHVXMnV1ZVlT?=
 =?utf-8?B?bFlsY000ZjVVdHN3ZWZQT2s3NzM5MVpKS3JTR0I3RHdCejR0SVBlYmU2Q2Zy?=
 =?utf-8?B?K1IrTE9QMzhjamFQblBjbnNkQnhCSm1taXFJdUg3b2lTaDM2NFpSSFBINGlK?=
 =?utf-8?B?R0hLLzk1R2I0NlJ4ZDJEd1p5alVhUDU2TzFsYzhMbXVwVitMQ2piNFNFUWRo?=
 =?utf-8?Q?g5HBHnAmtMZIeqbRBjgdtsfpg36kwJzi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5691.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnVhK3pnRVhLRlhQODBvSkIxNGFHakNuYUtTU05zTWJlUWJObHFUUkYzRzF3?=
 =?utf-8?B?bkI0ZjZsTXpQcWJlM25IM3hIOHVNb0JvRk1aUldQRFJBYzlZa0ZxR1hIUGw1?=
 =?utf-8?B?WUtYYkJKSjdlazFVZDJTZTYyRWJmc2M5NTVvUE1DRGNqOGZ1QksvVGtkWmxu?=
 =?utf-8?B?SDlwMHo3SHB2NDBsRzBxNW1oSyttc3FLTTR5cnJCVlRnTEtYUWZZVzZSTENo?=
 =?utf-8?B?ZEdrMnFVOUIxSitTYmE2a1RVc1N2c1gzTmYxY3l6cXhGUnJLdUpPSTJGSmZG?=
 =?utf-8?B?YjZKLy9Ya1MwbUJNU2lWZTdMNGhJaUp1S21ZNmFBVGJ4Y0VJK2RXaWx5ckwy?=
 =?utf-8?B?VFVGWUdYMElSRml1UUpCd2c0aloxZEx2THhJYUhkSGZuMkRsOENKRm45KzQz?=
 =?utf-8?B?dmd2T3BjOU5SbVVnUTRrb3FLbTAwWDN6RnpjNVJROTJJc1g1R3I2aERWNWRM?=
 =?utf-8?B?eHFLMVJmdkxIbGpEQTJSYTRjc3VrbjF0WGFrSWVxVjNuWSs1M1g2Wnl5VFdT?=
 =?utf-8?B?RVgyYXRMZ3dSall4UnIyY2JMZENqOVMzeU1zZmczY290MUkxZlh6Qk5TMzhm?=
 =?utf-8?B?N2FvL0RPaDQ5QzVvbURaNkVBNVZtc0xpVGd2TTBTOGZCWCtxaFhoWldOK281?=
 =?utf-8?B?VHhuTGZTK2orWWJ1Z0tuTUplVmVxVGsvRFU1TEJtcUIzTTcvU25yRHNHcW05?=
 =?utf-8?B?VUtZZkJWYTJWU0NBMnp3MmkrY1lSYVo3bTFRVnpVYUIrbDVrdFJqcm1LVkRM?=
 =?utf-8?B?NGhKbTdSZGJvVGk1cjBwc1EwZHArOWVNOWlXY1hGbTFPRTN5Vm51SVpRWjFU?=
 =?utf-8?B?czNzWkJrdWFDanJnYWdvK1BnVEVFcEIrQnJUZysrd1BJY1FyZ0dYWForYkJO?=
 =?utf-8?B?MGw0RGlrTTF3RHMyQitDVFNMZ2trWTE0bXRGc1doUlVQdnlZYWgySEU2NVNv?=
 =?utf-8?B?Ulg1WjNjR3hmU3NDSFRWa0pOWFBxci9aSU8rVFo0cWEvOTkrd1o2dmhEVXpJ?=
 =?utf-8?B?S2VLSnlJaEd0a3J5aDRUdnliQ1J6L0Z0aU1zYVNhWkEzWUJwYTR5R3lCT3d5?=
 =?utf-8?B?UTY3T01lU01UMytRemhBZytRZi9ZWktDSkpETk56RldNdDRFVnVTUDZGNXlX?=
 =?utf-8?B?YTl3YjhJclVEV2NmRlhUYlJIUXNraFpTS2NyR3ZlQURGUFhwS2VKVmJpL1pJ?=
 =?utf-8?B?M1hCRU9ZaVVBZ3FocmwwbjhkLzdFYjRkVnNXU3NCWmFyWXVLeTcreFNNWGNa?=
 =?utf-8?B?aXY4SkErdUgyZXhNMkhueWVPaEppaDBjRTJueThPRkhFcDVrc3VnUzI4cVZO?=
 =?utf-8?B?KzRDQW5xTmVSQmFYN0pHMmE1SzhaaDJ1YkJ0aFdBK2NCYld3RThVNUJ2MUdh?=
 =?utf-8?B?VnBuUnFFVkVwVWNGL1NaOWtIR3lQNUdIR0srQlp3Vm9GUXNReUtLOFU3dkt4?=
 =?utf-8?B?RlRWcGJnMmF4clpFMEUvRjVKTGlsOW9LVWErNDJoUjZrR0QxelJsbTB2Qkcy?=
 =?utf-8?B?RnBXVEhzZ25ZUGUwN21ZRnRXYTBtNkkzbFRwQlBncHduQXBoQWd1RWFXaXVw?=
 =?utf-8?B?MDRMWXVneEY0UUx0WWFHTnROOHNkQnRsTCtWOWVlQ3pJOVJEaCsxL1QyblZE?=
 =?utf-8?B?akptTkwwbUljZGFQdkZURHdvOXhxb0tLY1QrVGtPdmwwUitib1pOV2NtVW1B?=
 =?utf-8?B?T3dVS0lDM2lIL05yNmNKMmRxWk9HTFZWMUpuVTE5WnIzUGxkZ2xYUWFleExq?=
 =?utf-8?B?eWVWaXJ0YktVVU5hbkZOLytwVCs5YjhJeE5LNjdwZ0ZMTzRrOFhERlZwcWNZ?=
 =?utf-8?B?SUxMUlZ2V1FtOHhxTXdMdG83MTNEdldIanF1OThKK0lQM0tRaVlHcitkcnZj?=
 =?utf-8?B?bFRGall1djhUblQwTERrbTQ1ODhqeGE4RUdIMVBlZHNwT3E4aytBZkhJQUF4?=
 =?utf-8?B?QVZOM0ZZaWw1eTVsQTQ0bk1weDUvSnlDQ2ZGdlR5UVJDSXRFV3hpQ2lHK211?=
 =?utf-8?B?bHB4ekdabHR2c3hYSWI5TTI5VXV1cGYwYkVPTEY3ZVphUk4vV1ZjVi9xUExP?=
 =?utf-8?B?VHE2aXJ1Sk1ZbjZlclcxUkx3Q1ZvUTBLeVJ5WTd5N284cFpNam81WEt2WVVU?=
 =?utf-8?B?cHZ0SXNKb1kwQnN2RkNiNFg5M3RNRnlJb3U4b2d1Vjd6VzhxTGlXZUVJZVZy?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <647169A9C162C54B804732F27C299CF8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5691.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf40ace-9faf-41b3-2ec3-08dd39329416
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:12:35.1958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KiM/Nv1Gr8Z+o0wf8UNmbEQwUhi/uPGC3N+uTAgBEtrP0/9gyFUJwqhhoALqtNgGAwKkXtenqoea4hWGV/8dwOpjA4pxepalMk2wKCMR65s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8134

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDE2OjMzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gT24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgNDoxOeKAr1BNIENhdGh5IFh1
ICjorrjljY7lqbcpIDwNCj4gb3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiAN
Cj4gPiBPbiBUaHUsIDIwMjUtMDEtMTYgYXQgMDg6MjggKzAxMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gT24g
MTYvMDEvMjAyNSAwMzoyMCwgQ2F0aHkgWHUgKOiuuOWNjuWptykgd3JvdGU6DQo+ID4gPiA+ID4g
PiArICAgICAgICAgIGJpYXMtcHVsbC1kb3duOg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIG9u
ZU9mOg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAtIGVudW06IFsxMDAsIDEwMSwgMTAyLCAxMDNdDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxOTYgcHVsbCBkb3duIFBVUEQv
UjAvUjENCj4gPiA+ID4gPiA+IHR5cGUNCj4gPiA+ID4gPiA+IGRlZmluZSB2YWx1ZS4NCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgIC0gZW51bTogWzIwMCwgMjAxLCAyMDIsIDIwMywgMjA0LCAy
MDUsIDIwNiwNCj4gPiA+ID4gPiA+IDIwN10NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ZGVzY3JpcHRpb246IG10ODE5NiBwdWxsIGRvd24gUlNFTCB0eXBlDQo+ID4gPiA+ID4gPiBkZWZp
bmUNCj4gPiA+ID4gPiA+IHZhbHVlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE5vdCBtdWNoIGlt
cHJvdmVkLg0KPiA+ID4gPiANCj4gPiA+ID4gICBJIGhhdmUgcmVtb3ZlZCB0aGUgY29udGVudCBy
ZWxhdGVkIHRvICdyZXNpc3RhbmNlIHZhbHVlJywgd2UNCj4gPiA+ID4gdXNlDQo+ID4gPiA+ICdS
U0VMJyBpbnN0ZWFkIG9mICdyZXNpc3RhbmNlIHZhbHVlJy4NCj4gPiA+IA0KPiA+ID4gU28gdGhl
IHZhbHVlIGluIE9obXMgd2FzIHJlbW92ZWQ/IEkgYXNzdW1lIGFib3ZlIGRvIG5vdCBoYXZlDQo+
ID4gPiBrbm93bg0KPiA+ID4gdmFsdWUNCj4gPiA+IGluIE9obXM/DQo+ID4gDQo+ID4gICBZZXMs
IHZhbHVlIGluIE9obnMgd2FzIHJlbW92ZWQsIG5vIGNvZGUgaGF2ZSBrbm93bSB2YWx1ZS4NCj4g
DQo+IFRoYXQncyBzYWQuIFdlIHdlbnQgdGhyb3VnaCBhIGxvdCBkdXJpbmcgdGhlIE1UODE5NSBj
eWNsZSB0byBnZXQgdGhlDQo+IHBhcmlzIGRyaXZlciBsaWJyYXJ5IHRvIHN1cHBvcnQgcHJvcGVy
IFNJIHVuaXQgdmFsdWVzIFsxXSB0byByZXBsYWNlDQo+IHRoZSBSU0VMIHZhbHVlcyAoMjAwIH4g
MjA3KS4gV2h5IGNhbid0IHRoaXMgYmUgc3VwcG9ydGVkIGFueW1vcmU/DQo+IA0KPiBBbHNvIHdl
IG5ldmVyIGdvdCBhcm91bmQgdG8gZ2V0dGluZyByaWQgdGhlIFBVUEQvUjAvUjEgdmFsdWVzICgx
MDAgfg0KPiAxMDMpLg0KDQogIFNvcnJ5LCBJIGRpZG4ndCBzZWUgYW55IHBhcnNpbmcgb2YgJ21l
ZGlhdGVrLHJzZWwtcmVzaXN0ZW5jZS1pbi1zaS0NCnVuaXQnIGluIGRyaXZlciwgYW5kIEkgbm90
aWNlZCB0aGF0IGluIGRyaXZlciwgdGhlIGZpbmFsIHZhbHVlIHdyaXR0ZW4NCnRvIHRoZSByc2Vs
IHJlZ2lzdGVyIGlzIGJhc2VkIG9uIHRoZSB2YWx1ZSBvZiBSU0VMKDIwMCB+IDIwNykuDQoNCiAg
QWRkaXRpb25hbGx5LCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIGFiYW5kb24gdGhlIFJTRUwv
UjAvUjEgdmFsdWVzDQooMjAwIH4gMjA3LzEwMCB+IDEwMykuIElzIGl0IHRvIHByZXZlbnQgY29u
ZnVzaW9uPyBQZXJoYXBzIGFkZGluZyBzb21lDQpjb21tZW50cyB3b3VsZCBoZWxwPw0KICANCj4g
DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIEZv
ciBwdWxsIGRvd24gdHlwZSBpcyBub3JtYWwsIGl0IGRvZXNuJ3QNCj4gPiA+ID4gPiA+IG5lZWQN
Cj4gPiA+ID4gPiA+IGFkZA0KPiA+ID4gPiA+ID4gUlNFTCAmIFIxUjAuDQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5cGUgaXMgUFVQRC9SMC9SMSB0eXBlLCBpdA0K
PiA+ID4gPiA+ID4gY2FuDQo+ID4gPiA+ID4gPiBhZGQNCj4gPiA+ID4gPiA+IFIxUjAgZGVmaW5l
IHRvDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBzZXQgZGlmZmVyZW50IHJlc2lzdGFuY2Uu
IEl0IGNhbiBzdXBwb3J0DQo+ID4gPiA+ID4gPiAiTVRLX1BVUERfU0VUX1IxUjBfMDAiICYNCj4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRfUjFSMF8wMSIgJg0KPiA+ID4g
PiA+ID4gIk1US19QVVBEX1NFVF9SMVIwXzEwIg0KPiA+ID4gPiA+ID4gJg0KPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIk1US19QVVBEX1NFVF9SMVIwXzExIiBkZWZpbmUgaW4gbXQ4MTk2Lg0K
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgRm9yIHB1bGwgZG93biB0eXBlIGlzIFBEL1JTRUws
IGl0IGNhbiBhZGQNCj4gPiA+ID4gPiA+IFJTRUwNCj4gPiA+ID4gPiA+IGRlZmluZSB0byBzZXQN
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIGRpZmZlcmVudCByZXNpc3RhbmNlLiBJdCBjYW4g
c3VwcG9ydA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzAw
MCIgJg0KPiA+ID4gPiA+ID4gIk1US19QVUxMX1NFVF9SU0VMXzAwMSIgJg0KPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzAxMCIgJg0KPiA+ID4gPiA+ID4gIk1U
S19QVUxMX1NFVF9SU0VMXzAxMSIgJg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19Q
VUxMX1NFVF9SU0VMXzEwMCIgJg0KPiA+ID4gPiA+ID4gIk1US19QVUxMX1NFVF9SU0VMXzEwMSIg
Jg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIk1US19QVUxMX1NFVF9SU0VMXzExMCIgJg0K
PiA+ID4gPiA+ID4gIk1US19QVUxMX1NFVF9SU0VMXzExMSINCj4gPiA+ID4gPiA+IGRlZmluZSBp
bg0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgbXQ4MTk2Lg0KPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+ID4g
PiA+ID4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+
ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi5iZjBjODM3NDQwN2MNCj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4g
PiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+
ID4gPiA+ID4gPiBAQCAtMCwwICsxLDE1NzIgQEANCj4gPiA+ID4gPiA+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0KPiA+ID4gPiA+ID4g
Ki8NCj4gPiA+ID4gPiA+ICsvKg0KPiA+ID4gPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBN
ZWRpYXRlayBJbmMuDQo+ID4gPiA+ID4gPiArICogQXV0aG9yOiBHdW9kb25nIExpdSA8R3VvZG9u
Zy5MaXVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gKyAqLw0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyNpZm5kZWYgX19NVDgxOTZfUElORlVOQ19IDQo+ID4gPiA+ID4gPiArI2RlZmlu
ZSBfX01UODE5Nl9QSU5GVU5DX0gNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaD4NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4g
PiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19HUElPMCAoTVRLX1BJTl9OTygwKSB8IDAp
DQo+ID4gPiA+ID4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfRE1JQzFfQ0xLIChNVEtf
UElOX05PKDApIHwgMSkNCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19T
UEkzX0FfTU8gKE1US19QSU5fTk8oMCkgfCAzKQ0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVY
X0dQSU8wX19GVU5DX0ZNSTJTX0JfTFJDSyAoTVRLX1BJTl9OTygwKSB8DQo+ID4gPiA+ID4gPiA0
KQ0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX1NDUF9ETUlDMV9DTEsg
KE1US19QSU5fTk8oMCkgfA0KPiA+ID4gPiA+ID4gNSkNCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJ
Tk1VWF9HUElPMF9fRlVOQ19UUF9HUElPMTRfQU8gKE1US19QSU5fTk8oMCkgfA0KPiA+ID4gPiA+
ID4gNikNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIGRvIG5vdCBzZWUgaG93IHlvdSByZXNvbHZl
ZCBteSBjb21tZW50IGZyb20gdjEuIEluIHYyIEkNCj4gPiA+ID4gPiByZW1pbmRlZA0KPiA+ID4g
PiA+IGFib3V0DQo+ID4gPiA+ID4gaXQsIHNvIHlvdSByZXNwb25kZWQgdGhhdCB5b3B1IHdpbGwg
Y2hhbmdlIHNvbWV0aGluZywgYnV0IEkNCj4gPiA+ID4gPiBkbw0KPiA+ID4gPiA+IG5vdA0KPiA+
ID4gPiA+IHNlZQ0KPiA+ID4gPiA+IGFueSBjaGFuZ2VzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
IFNvIGV4cGxhaW46IGhvdyBkaWQgeW91IHJlc29sdmUgbXkgY29tbWVudD8NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBUaGVzZSB0d28gZXhhbXBsZXMgd2hlcmUgeW91IGNsYWltIHlvdSB3aWxsIGNo
YW5nZSBzb21ldGhpbmcsDQo+ID4gPiA+ID4gYnV0DQo+ID4gPiA+ID4gc2VuZA0KPiA+ID4gPiA+
IHRoZSBzYW1lLiBJIHNraXBwZWQgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoLg0KPiA+ID4gPiANCj4g
PiA+ID4gICBUaGFuayB5b3UgZm9yIHlvdXIgcGF0aWVudCByZXNwb25zZSwgaGVyZSBpcyBteSBl
eHBsYW5hdGlvbg0KPiA+ID4gPiBmb3INCj4gPiA+ID4geW91DQo+ID4gPiA+IHF1ZXN0aW9uOg0K
PiA+ID4gPiANCj4gPiA+ID4gICBJbiB2MSwgSSB1bmRlcnRhbmQgdGhhdCB5b3UgbWVhbnQgSSBk
aWRuJ3Qgc2VudCBhIHJlYWwNCj4gPiA+ID4gYmluZGluZywNCj4gPiA+ID4gYW5kDQo+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gVGhlIGNvbW1lbnQgaXMgdW5kZXIgc3BlY2lmaWMgbGluZXMsIHNvIEkg
c2FpZCB0aGVzZSBkZWZpbmVzIGFyZQ0KPiA+ID4gbm90DQo+ID4gPiBhDQo+ID4gPiByZWFsIGJp
bmRpbmcuIFlvdSBzZW50IHRoZW0gYWdhaW4sIGJ1dCB0aGV5IGFyZSBzdGlsbCBub3QNCj4gPiA+
IGJpbmRpbmdzLA0KPiA+ID4gYmVjYXVzZSB0aGV5IGFyZSBub3QgdXNlZCBpbiB0aGUgZHJpdmVy
LiBNYXliZSB0aGUgdXNhZ2UgaXMNCj4gPiA+IGNvbnZvbHV0ZWQsDQo+ID4gPiBzbyB3aGljaCBw
YXJ0IG9mIGltcGxlbWVudGF0aW9uIGFyZSB0aGVzZSBjb25uZWN0aW5nIHdpdGggRFRTPw0KPiA+
ID4gSU9XLA0KPiA+ID4gd2hpY2ggcGFydCBvZiBkcml2ZXIgcmVsaWVzIG9uIHRoZSBiaW5kaW5n
Pw0KPiA+IA0KPiA+ICAgSSBnb3QgeW91LiBUaGlzIGJpbmRpbmcgZGVmaW5lIG1hbnkgbWFjcm9z
LCB3aGljaCB3aWxsIGJlIHVzZWQNCj4gPiBmb3INCj4gPiAncGlubXV4JyBzZXR0aW5nIGluIHRo
ZSBEVFMuIFRoZSB1c2FnZSBsaWtlIHRoaXM6DQo+ID4gDQo+ID4gICBhZHNwX3VhcnRfcGluczog
YWRzcC11YXJ0LXBpbnMgew0KPiA+ICAgICAgICAgICAgICAgICBwaW5zLXR4LXJ4IHsNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPQ0KPiA+IDxQSU5NVVhfR1BJTzM1X19GVU5D
X09fQURTUF9VVFhEMD4sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFBJ
Tk1VWF9HUElPMzZfX0ZVTkNfSTFfQURTUF9VUlhEMA0KPiA+ID47DQo+ID4gICAgICAgICAgICAg
ICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiANCj4gVGhlIG9ubHkgYmluZGluZyBiZXR3ZWVuIHRo
ZSBEVCBhbmQgdGhlIGRyaXZlciBpcyB0aGUgc3RydWN0dXJlIG9mDQo+IHRoZSB2YWx1ZSwgZ2l2
ZW4gYXMgIihNVEtfUElOX05PKDxOPikgfCA8ZnVuY3Rpb24gbXV4IHZhbHVlPikiLg0KPiANCj4g
VGhlIHdob2xlIGxpc3Qgb2YgIlBJTk1VWF9HUElPeHh4X19GVU5DX3h5eiIgbWFjcm9zIGlzIGp1
c3QgYQ0KPiBjb252ZW5pZW5jZQ0KPiB0YWJsZSBmb3IgZGV2ZWxvcGVycywgYW5kIG5vdCB1c2Vk
IGJ5IHRoZSBkcml2ZXIuIFRoZSBkcml2ZXIgc2ltcGx5DQo+IHRha2VzDQo+IHRoZSB2YWx1ZXMg
ZnJvbSB0aGUgdHdvIGJpdCBmaWVsZHMgYW5kIHVzZXMgdGhlbSBkaXJlY3RseS4NCj4gDQo+IFRo
YXQncyB3aHkgS3J6eXN6dG9mIGlzIHNheWluZyB0aGUgbWFjcm9zIGFyZSBub3QgdXNlZCBpbiB0
aGUgZHJpdmVyDQo+IGFuZCB0aGVyZWZvcmUgbm90IGEgYmluZGluZy4NCj4gDQo+IFBsZWFzZSBt
b3ZlIHRoZSBoZWFkZXIgZmlsZSB0byB1bmRlciAiYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ayIsDQo+IGFuZCBzcGxpdCBpdCBvdXQgYXMgYSBzZXBhcmF0ZSBjb21taXQgd2l0aCBhIHN1Ympl
Y3QgbGlrZToNCj4gDQo+ICAgICBhcm02NDogZHRzOiBtZWRpYXRlazogbXQ4MTk2OiBBZGQgcGlu
bXV4IG1hY3JvIGhlYWRlciBmaWxlDQoNCiAgb2ssIGdvdCBpdCwgSSB3aWxsIGZpeCBpbiBuZXh0
IHZlcnNpb24uIEhvd2V2ZXIsIHRoZSBwcmV2aW91cyAneHh4LQ0KcGluZnVuYy5oJyBmaWxlIHdl
cmUgcGxhY2VkIHVuZGVyIGJpbmRpbmcuDQoNCj4gDQo+IA0KPiBDaGVuWXUNCj4gDQo+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IHRoZSBiaW5kaW5ncyBzaG91bGQgYmUgc2VwYXJhdGVk
IGZyb20gZHJpdmVyLiBJbiBhZGRpdGlvbiwgSQ0KPiA+ID4gPiBzaG91bGQNCj4gPiA+ID4gcnVu
IHNjcmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwuIFNv
IGluDQo+ID4gPiA+IHYyLA0KPiA+ID4gPiBJDQo+ID4gPiA+IHNlbnQgYSByZWFsIGJpbmRpbmco
bWVkaWF0ZWssbXQ4MTk2LXBpbmN0cmwueWFtbCksIGFuZCBzZW50IHR3bw0KPiA+ID4gPiBzZXBh
cmF0ZSBwYXRjaGVzLCBvbmUgZm9yIGRyaXZlciBhbmQgb25lIGZvciBiaW5kaW5ncywgYWxzbyBy
YW4NCj4gPiA+ID4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgZ2V0IG5lY2Vzc2FyeSBwZW9w
bGUgYW5kIHNlbnQgdG8NCj4gPiA+ID4gdGhlbS4NCj4gPiA+ID4gDQo+ID4gPiA+ICAgSW4gdjIs
IEkgdW5kZXJzdGFuZCB0aGF0IEkgbmVlZCByZWZlciB0byBnaXQgaGlzdG9yeSB0bw0KPiA+ID4g
PiBtb2RpZnkNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGNvbW1pdCBtc2dzLCBzbyBJIG1hZGUgdGhl
IGNoYW5nZXMgaW4gdjMuIFRoZW4geW91IGFza2VkIG1lDQo+ID4gPiA+IGFib3V0DQo+ID4gPiA+
IHRoZQ0KPiA+ID4gPiBkaWZmZXJlbmNlIGJldHdlZW4gJ1JTRUwnIGFuZCAncmVzaXN0YW5jZSB2
YWx1ZScuIEkgcmVwbGllZA0KPiA+ID4gPiB0aGF0DQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiAncmVz
aXN0YW5jZSB2YWx1ZScgbWV0aG9kIGlzIG5vIGxvbmdlciB1c2UsIHNvIGluIHYzLCBJIHJlbW92
ZWQNCj4gPiA+ID4gYWxsDQo+ID4gPiA+IGNvbnRlbnQgYWJvdXQgaXQoaW5jbHVkZSBlbnRpcmUg
J3JzZWwtcmVzaXN0YW5jZS1pbi1zaS11bml0Jw0KPiA+ID4gPiBwcm9wZXJ0eQ0KPiA+ID4gPiBh
bmQgdGhlIHBhcnRzIG1lbnRpb25lZCBpbiBiaWFzLXB1bGwtdXAvZG93bikuDQo+ID4gPiANCj4g
PiA+IFllcywgdGhhbmsgeW91IHRoaXMgSSBzYXcsIHRoZSBjb21tZW50cyBhcHBlYXIgdW5kZXIg
c3BlY2lmaWMNCj4gPiA+IHBsYWNlcywNCj4gPiA+IHNvDQo+ID4gPiBvbmx5IHRoZXNlIHBsYWNl
cyBhcmUgZGlzY3Vzc2VkLg0KPiA+IA0KPiA+ICAgb2ssIHRoYW5rIHlvdSwgd2UgY2FuIGRpc2N1
c3MgaWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMuDQo+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiBLcnp5c3p0b2YNCg==

