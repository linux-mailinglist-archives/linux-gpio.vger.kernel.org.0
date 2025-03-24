Return-Path: <linux-gpio+bounces-17907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C9A6D714
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 10:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080533A99DF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0436A25D913;
	Mon, 24 Mar 2025 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WF0yDqAi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VhYCqfTy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4F14EC46;
	Mon, 24 Mar 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807538; cv=fail; b=ry5SLe+gRduSdlRggocIylXhUCoZ09YhNNKTrNhik8MJP1x/67rCzfmayxgfth9T7QIKz5NFk+G7jHVS4mYa5yRsZHLhF1GOlPlm1vUv4saV08nyy8q6tEweGPlmdP7O3Pbzzep39U+KxEev7fNV+64+6jPvYS5ILOfokePoIkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807538; c=relaxed/simple;
	bh=RVMgZU9lLlxtZ1UQL6CNnowRfyLCYWdpLxKHytKmplc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FO62Mfo7lH7iZTh1e4rNGW5tZJNfD89TwKQ5ZKmpCalUt7zkTWQmAWVXIQJy0zcVUiUC8rlDWn9XJ8jkg1Zml6k0/yjz65hgo0e9mG7Th4IQmxlrQBpP/HlqkiWUrlCsieOJWb8aMtCxd8KHLqYVmJIcDgbZh23hPX01l/v18W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WF0yDqAi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=VhYCqfTy; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 126853b6089011f08eb9c36241bbb6fb-20250324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RVMgZU9lLlxtZ1UQL6CNnowRfyLCYWdpLxKHytKmplc=;
	b=WF0yDqAihyvfDnCE0IwR7fpE2WNEKJHTyqNg1uUE4s2f4V5bl8Qb+J8ODr7Sa5FMhrF4NUGgHSMdEmD5lh82LFP1fXxb6qLC++wb6Tw9ysmLxC03VTBXS4BdlpKJwxGYTdVC49beN5187YLbvxi2VX8DBQZP6JiQEis5PF/KsSw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e1888deb-5a73-4f7c-91b5-2080ccdcf9f7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:36cf7d4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 126853b6089011f08eb9c36241bbb6fb-20250324
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265395979; Mon, 24 Mar 2025 17:12:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 24 Mar 2025 17:12:12 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 24 Mar 2025 17:12:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+AchLtkwMNOMO6fI2RFw+jUoLDyg3rhxNI6RiEQyVzdywPIFCXkE/ZzsAwMegpGF6TY3YvMSB1wddBszCVKoyCgL7HedxtHm9jFx/Z2ASh8FWR3nsyzzKYvWwlsBszxbMa9DmkJQYXPxWCUVRtV9Rqur3SP4gYI4lv1Ouuk0tH8rhstDqD9v2uOY0mCyrI5j9JzPdXxAIdphg6T+I6SaMO6ncwxf6TAFP3KmGBgpQz79cBGkmDhl26byQtSrbPY+GzrEMbjyGiqFYKhSRRNgYVl6p598QNIdwvIDZzGvZg3y/2P7HriN6DUB7XP981yDJ+qVGPYH13cwIg83UACJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVMgZU9lLlxtZ1UQL6CNnowRfyLCYWdpLxKHytKmplc=;
 b=dF2ta3pcIXvEY2UISytxkfWF9TI668sK/P12OuiuHskkXVFBwwJkGUFMC1+bxJBzSfFLOiI4Ejqh8+lcuNKCb4f1bnG8Wvm2733/H7sLmTwWXBhhgms2YBelon2R+Nmj2R9pK1ixKDAQSFNCR1OEZ2VZvqDjYLSCLrhJgfXTxQsaF3hsDCjLyWUV1/o0aam/XcVnBigCnL65BZ/R10ZWWT/zj7NnemdhkK+s4HEjryJd6Qr1NtuDeZpQIbKgXM1gVsU2w8nycaMNbElBs7rU7b3ZvWBhwnRjMF/XgQqqp7Y6BChsJHPz6bP9GJna8d78Ypr4LxSUfu7INqiBYqHnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVMgZU9lLlxtZ1UQL6CNnowRfyLCYWdpLxKHytKmplc=;
 b=VhYCqfTyECGvEKZvJ29bgJHDAAN+bFGWxSPxn92OL0AOUZP/MPQkkvmrRWJffHeRj207friLzru+R3F8DjMNRHLUiL5lVybWO/Kv1O8Jtfrf/fPwiyfxrJIw4N3TCcO3bB5l7yv8DvH3jJSo9jBVDiKLgDxSnr3ZlhQrnuN5mmE=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by KL1PR03MB8776.apcprd03.prod.outlook.com (2603:1096:820:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:12:10 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 09:12:09 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SmltaW4gV2FuZyAo5rGq5rWO5rCRKQ==?= <Jimin.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
Thread-Topic: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
Thread-Index: AQHbmj+uGHJiG+8/6E+AdDU3uNhXNrOB8hGAgAATE4A=
Date: Mon, 24 Mar 2025 09:12:09 +0000
Message-ID: <311cc2b0bb1a6f23e036c2180a6179d6b1dbb4b1.camel@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
	 <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
	 <20250324-cunning-ruby-lorikeet-aac6bf@krzk-bin>
In-Reply-To: <20250324-cunning-ruby-lorikeet-aac6bf@krzk-bin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|KL1PR03MB8776:EE_
x-ms-office365-filtering-correlation-id: ebb525ed-14f1-4ef3-d8fe-08dd6ab3f501
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aTdiT0M0c2xmdlFlYTlGMTFITFBNL3F5ZVE4OGxBRkR0aG9PbENIOFJyTTJW?=
 =?utf-8?B?M2hKWlQ4TWNEQWpIQjR5bGlXMXVpNHpibkhLR1NCMTB4Qy81N3g2VmtIa3ZF?=
 =?utf-8?B?Z1R5Q0ZpSGhFZHhKKzVEZjl1NVBFc2J0Z01PWlhxakZXMUJFTWZzNkNXTWVB?=
 =?utf-8?B?TFE2dXFsUUZLcmxTbWwxZkNndVloNW56ZytTZC93UWVXU2ZtMlZhN1hPaHpM?=
 =?utf-8?B?WUdrYlVsdVQ4Sk5vRExmNHFYQmU1SWMwZiszZmk4eGNYVFJhMktTN0tYNFdG?=
 =?utf-8?B?SkFuKzJaT040NXFRUElDUEpDNm1YakhWV0Z0Yi9Rb283bTl1MzRzZ251R3Nq?=
 =?utf-8?B?NUVNN3JIOEFSVlNoOFJJQ2svT2ZYdFBnVlNCZUpCYnpIanoxdFptVG5kazJj?=
 =?utf-8?B?Z2NMaG1qTitvZVRmZHpsdFNOTTBNT3VMaGorSXJEMWhsQ2lxVEY2aDVkZmhH?=
 =?utf-8?B?dFVOWDVjSlIvYVF3VW51bythbDdDVThxdmcxNHlKclhCdVNWczc3ck5lNFp4?=
 =?utf-8?B?SkhIdlBFNGhRQVVPRE4zOXkwd1VHYjcrQkpockNnRksrczNnUEI3SFBuQjJX?=
 =?utf-8?B?S2RMYjdQbElZQlRrd1ZneDZObStIVTV3clpPaEd5SDJYWTJ4NUtnNlF4VDdW?=
 =?utf-8?B?TldOb1lkRXJkMndEZXYxVVFOUStVeTBnc0RwRUY2T2ZiQzk0R3paS2h1WUxM?=
 =?utf-8?B?K0lRNHFZeWRZK3lPWk91blVWL0NZRkoyZUp1VVhaNURuSWJpWml4UFZ6YzNs?=
 =?utf-8?B?Mkg1cGV3RFhtekhCUlJsVmJOQVdEN1pzZGpvazNPUmJ2OG10dUVvVElIMXVr?=
 =?utf-8?B?OEpzSnJpejZuV3lXNWFvdUVMS1NKNkZrRG1UTVA5T2VwWVpONzRMUDBFQjdn?=
 =?utf-8?B?WVdSVjRrUEE5OXFDM1VBTk5Ield5U2dBMUMzbEpVSm50UGNBRDdyQVNTc2lW?=
 =?utf-8?B?bFV4bmRyZHNrVjlORVJVQUIxeVpNZitESnZLVDZ0a1ZUbkRzRng5aXl2ZkRl?=
 =?utf-8?B?T3N5dUh0dUJZK0J0WC9QcWRxaURPMjJJNFlFeEpwQUZMdVdweS9uUDRLdnRW?=
 =?utf-8?B?blMzaExGNGNLMjM1WnpzSlJXMllyKzZCcjJESlRGRnVGK3pXcysvS3JydVVo?=
 =?utf-8?B?T25ZNmJSaWJkUW9vWkJXUlRKdEpnSUJvbU1iMVpidWxrTWpPTFIvTjRvRXkr?=
 =?utf-8?B?aGtuVVJBbVVwVkgwSnBtRFdOYWd4eXhlbGp1VXlpRElsMXd4dUJlK0I5cDlk?=
 =?utf-8?B?Skt1SGViNGJKd2liTU9SV0N0cGRHQytiM0pTWkZNc0RuNmZ3MCtyMHY5NmhK?=
 =?utf-8?B?M0dBYSsrZEdTL3AxM0ducHU1WThTYkY1NTJpbnBIcy9IeERGVGhnampnRm5u?=
 =?utf-8?B?UWFNQzloalBMbVMxTnprMHB1VkIrempleGptdUtRZVlTNnliWEZwT1djRUVY?=
 =?utf-8?B?NTdyTkZ3OVhzalRuTGJxenZYTVZuZWVNcDJ4ZXNtVTBJUzRpaXJFVThRNmdz?=
 =?utf-8?B?bWs3T2sveVNHY2NLMzByYitYV0hmelNQV1ZkbkRROUJhQ0h0TVlsRzVmM0do?=
 =?utf-8?B?enNYYUFRb3hqRGh6cm1NOVBhMWF4TGRvREdjYXUyOVo3ek1yYlRINHAwWGhL?=
 =?utf-8?B?YkcxZlNwK204eGN3UGtXSElDWGI4QkYybkFVL0ExUXpkRzM5NjY2Q011NFpp?=
 =?utf-8?B?ZHBkdXU2UjJWSGJkSWNabUUzOXp1b3NwaDNZdldQSFFKbXNGMFZVUUxRMkhy?=
 =?utf-8?B?aFZlUHpUQ2NueUpkL2lZZ0d2amdXUEVWSHo5Qi9QMEd2NGtyN1dpaFNiSnB5?=
 =?utf-8?B?aExveXNrRzhERUpYSHlGSll0MWFjQmJNTEduQi9kekQ5L0xUVzZWa0pNMnQ3?=
 =?utf-8?B?TlFxSmRiQlZoV2xPQ24xZi9QbUMvaHMySDJ2NUNPUmJQUUs3Yk1MM2oyMnZT?=
 =?utf-8?B?RjByL0pnYldjQmJsZXcxTDlYNXZKdEcrb0NYZEl4Zld4aHJNcnozaDBrdWk1?=
 =?utf-8?Q?1obHbC19JubDDvcMOZX/ZBy1e3JVIw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzJNcXJ5K2d0Uk5iSWlxWnJ6NGUwQ2FTNWxYeHhRUXBLKzhsanpBaWFXZEx1?=
 =?utf-8?B?YUZ1VTY5MWQzQ2FBeVBpU2J5dmxKYTRLVFFLaHVhbTJUN3BQOVpIb3h5by8r?=
 =?utf-8?B?Wlpncnp3Q3p4ZnQzVldyRWtRSERwUXhtcE9wVEFHVXJGQ1MyNDFaSUV6MXFG?=
 =?utf-8?B?RGdPSG9FZEwwNzd3NkIxSjFBb3VlaFJnNWtMQWlqMENLc3dMOEV3RkpCUGpV?=
 =?utf-8?B?MWp6YXZYTGpJOFhZdzBoTWhqZTB2cktnNzJ6YWJiR1hXMDhuOXNGRWpmTjk2?=
 =?utf-8?B?NFZaNEpORXE1L2VKYjlpZWh5dkFOU0x3QTdPOU1KdHV1YUU2TWZiMzhwRmhz?=
 =?utf-8?B?YkQyQjRSS1VTTTIrWUc5M0dVdWdxQWE3VGJlc2V4enNVbGlIRHFYMkRjVnBu?=
 =?utf-8?B?azlRVnFrckFBdWR5a2R4WFBNc1NwQ2Q1THNueFZKMnFZSlRQT3liQXZ3b2xO?=
 =?utf-8?B?eVJxMjFwdEJCTWp4OXJ6RC9WTDlKbkJWNkRmSWdCRDVhZ3lnbWVZa0QreWl3?=
 =?utf-8?B?YW9hRTRlR00zQ1cxQklMU0JaZ01yL2dWZTg0UDF6MTZBVi9FKzRzQllaZlM3?=
 =?utf-8?B?dndxR01NWjFZbENVcVlpOUtmUjRGZ1NXMFlCbGVubGhsRUdqMkV2UWdKSlZ1?=
 =?utf-8?B?Tk11YXZxS1A1eVZ6N3FUT2duU3cvM1JyMVFhQWxZYmhJQlkydWJEbmNpMHJ6?=
 =?utf-8?B?UmFpZCtudjVDZXVOTVlNT1V0YjE5SE9uZGk1Sm1la2JKVWRyc0VUWnhZcUlU?=
 =?utf-8?B?OWtza0NtU2hLUStHYlY0LytxT3k4bU9vMjJCa2lNT1FzOTBKbFBhL1RuY3Vx?=
 =?utf-8?B?WUxrT3VQWGxsM1dpQitBcFcvZSt5d29BSWxPTmEzRFI0L3ZvTllVb0s2Yjl2?=
 =?utf-8?B?MUxxaGVoNnE1anhPZTFQU2lpeEY5dTIvRkFPWGxYRTZNcUJrRE1LMzNPQ1li?=
 =?utf-8?B?alkrRHppTmQ3ckUvVlRlSEI0bjVIS2ZoalR6L0xRWnNpWGlRci9sOXZkSFd4?=
 =?utf-8?B?WXRuQ20xU2JPMFJ1KzRZNU9wVDdSbGhXZXp4K3BsNGEyY3g5MkkzVjdiSWNk?=
 =?utf-8?B?NGl0RXRnL01lVVNNSDgzUFZ1NmFTNWpud0RQekpqd2x2Y3BjUzgzb3FFZ3BN?=
 =?utf-8?B?TzllSXRIWUtvT1Fob0F3TWVwb2cwR2piSlBrbGJ2LytabVB2M2xPTk1YY1Iv?=
 =?utf-8?B?cGZyazZudWxYY2N4K2psd2d2ZjdVcE9OdTlTVGRZYUFUOVBUVzlPWnk3cHdk?=
 =?utf-8?B?eUxiSVpuRmhoenRZNnpMWDYrclFhQzZjeXVDaHMxOVFiU2FaVjdYL2cvTERP?=
 =?utf-8?B?bElFSjF6dWVzNTNCVDI0NkhXalFlcU1wdjNXT0tBejdIejBVMjE4TEFweTE5?=
 =?utf-8?B?SE5CZ2NMSUpnQzlaaUpMTWJoVkRvckduUWJSVkxhYzUyWDlhSG5zK1gwTUlw?=
 =?utf-8?B?aVUwME5IY0tiSitNUldna2NJRFo0aTI4MFZMWURrd21DUFd4UkNGMVZScFVY?=
 =?utf-8?B?UU9VV0w2SElaSi9hUEtySy9MR0gvQ1g2Z3QyeERoUlZUT2F5Q1pQY0hXRzdS?=
 =?utf-8?B?c2FuOGkzOWRmREVXaXRsVVA5bXMwWDNUZzB3eTlrY1ZsdW1veVFEQy9rc2NQ?=
 =?utf-8?B?WE81N3NXc3ZKRVZEWnBpdjdlek5MRzZFNWVOaFdLQS9xS2dWUHljUi9TdSs1?=
 =?utf-8?B?UzBkS3RIN2lyQUgxZHd5NWdYcy8rLzNkNkZ2SDRKanluQ29SSkdLMWV2aTFx?=
 =?utf-8?B?Tlo0TmRYYWhxamJOdXhFNzR2aktVcE5uZ05ad3NrbndtcDdnNGUxdjJ1aFpv?=
 =?utf-8?B?ckh5S1ZMZ2NjVTYrcEMrM0hjdEw5TDRnSWoyVHlnYjN1U0w0K1FZYk9FKzBz?=
 =?utf-8?B?YlExVE9abm5hMU1YSWpCbXEybVpSMUJWM1pqQno0RU9CNFBMRmx3ODhrVjV2?=
 =?utf-8?B?V2svdGh1dmR6ajFIUWtBaXhiV1hXZ1lwM1dIUVBhWWw4b2QwUHBOamM2UUN1?=
 =?utf-8?B?cEFrcVZpWmVZMXN1eEpmdllWbm56NDNuL09WdHMyS1ErZ0YrK25KQWUxblAw?=
 =?utf-8?B?d2Vwdnpub0Y5WThFQlhUaHJ6K01wTmNaNWovQUNtR1djWnJKaldhbVhnbCts?=
 =?utf-8?B?SUlSYVFTZjdLOEdlcE5GUGEwdkpEZCtEdUZBSzcxUDVHUlFUb2Mrek8ySHY2?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AA6E28DAABDC449AF7EC5E18CB81CA1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb525ed-14f1-4ef3-d8fe-08dd6ab3f501
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 09:12:09.8447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtveJ+rIF00h5VorNnOr0/+2lRALoEJ7ASue8NsFoG3m6BEfzqJ1a/Ek1wuSXQDzzjfqsAi1rwJSOKnUcCnAYeDpYmMwKEJXz8ctlPetcrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8776

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDA5OjAzICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgTWFyIDIxLCAyMDI1IGF0IDA0OjM5OjEzUE0g
KzA4MDAsIENhdGh5IFh1IHdyb3RlOg0KPiA+IEFkZCB0aGUgcGluY3RybCBoZWFkZXIgZmlsZSBv
biBNZWRpYVRlayBtdDgxOTYuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBMaXUg
PGd1b2RvbmcubGl1QG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDYXRoeSBYdSA8
b3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Ni1waW5mdW5jLmggfCAxNTc0DQo+ID4gKysrKysrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1NzQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTYtcGluZnVuYy5o
DQo+ID4gDQo+IA0KPiBXaGVyZSBpcyB0aGUgY2hhbmdlIGFkZGluZyB0aGUgcGluY3RybCBub2Rl
cyB0byB0aGUgRFRTPw0KDQogIFRoZSBEVFMgd2lsbCBiZSBzZW50IGJ5IHNvbWVvbmUgZWxzZSBs
YXRlci4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

