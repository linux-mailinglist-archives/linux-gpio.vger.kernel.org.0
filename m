Return-Path: <linux-gpio+bounces-35204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKyIKjfS4WnQyQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:24:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F94175FA
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 723ED31DFDB4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 06:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC1435E940;
	Fri, 17 Apr 2026 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W3B1Y2Xb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dm2sM03e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A916344DAB;
	Fri, 17 Apr 2026 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406761; cv=fail; b=psAS+nD4HE7u6AG5sA0hQ0cc1FaARwpBk155672TKs8TsTUxYwecL5vozK4CzRg1tefNYXuz7RCQkKoQtE7SrgsDTtJD0rMpIZ8sZZh2wEVY2/UBY4De8y4jg6OnwAgXVbfQfQhL3T8YqCjdhUOFXPve6DDP0sfsG7pGTFAeMsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406761; c=relaxed/simple;
	bh=a6vgaWlgXRsJ48GhoKJ3PZsZUDBTJ/+td/FIqbOLlsM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ng3g8wjGtnVAH5BYdnGd9qjKsuaXldsBKveY/pnBAfO5CabIEbNYeTTMp8LKdJEy0iLKGu5NzVV2oV+8HUodtDzh9jMBF8giohlTBGpPDUAnLQrBmDV/Asu+PKcqSjkQWjpubhl5jcLwAnQXMGzuxCeHkU6gb46CgiefdTGSodM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=W3B1Y2Xb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dm2sM03e; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3de64f643a2311f19a16598d5ca7f8ec-20260417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a6vgaWlgXRsJ48GhoKJ3PZsZUDBTJ/+td/FIqbOLlsM=;
	b=W3B1Y2XbvpeCY4EtXWvGJCj5Kqq4a+oQNCPCQuAa0w+0MBVZcJPZfoj962GyrFN7whiqauYiCgssQgB6+/L2d39SjpM8GgXP2gkPuTyPbP4PWETXU/xFbMJgANgKl5cgBoDY/iOSUEWQ278SU39pFJG3zzcjOY8m0WXvuCHJkns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1236cca0-f2cd-46de-9868-547418119d99,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:6775f7d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3de64f643a2311f19a16598d5ca7f8ec-20260417
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <deep.pani@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 160665121; Fri, 17 Apr 2026 14:04:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Apr 2026 14:04:05 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Apr 2026 14:04:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7g4gsHB+SiG3iG01axN6jJSrdEciSBhnTktVTSYwY+IG0aXDAaUIaiZz3OeIMOvNOzD7f3J55hM1ygIMrpLWcearL+iLmTdm1DUcIn8mDPw19s8tV27obHQ+BChzCaVUWxuZp7brF14wqQc6ZhbXqS1lnFwk+qhNy89iRO1Ky8vlf2qO1sefjSaF9jgL0Hv6zCIgfOsTlXZyUH7geHCdqJo+CPjf+P+Ts2rBc7iHZW+Axieu57FdDc9D33ilJTH2Y26sBlmGOEYVCW8FjbXcickIOeE9UvXZ/KJs9nQiSBz+ZpIrKPA5rcpoC0DQzWDPZR6nhmdMNCYdMtCMEGaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6vgaWlgXRsJ48GhoKJ3PZsZUDBTJ/+td/FIqbOLlsM=;
 b=BcfruXBTXsIT2Vrq+yNN0vTPL6jyopweyk1FRNJu9+bW/9er4u4NaTjXL9i8GSUc9Enl6wiqVK3EddIo2I8pevmuRG9CyqmPRHEezWGN2zHxED3Cb4LsDkxcChYZXrnbKkYka+Z7dHiv1DpJxCQvfoW/VOjAKl3NQLGe9946LDk7Iab0CYyZi1zGZIHeMlFfg+YGlAMqK0KQeNWy9MxNyci9LrygX+9MzK9C2mpGKzOEPCDuYge0Eg/aNEfwU+X2KoDF6Ur/CVgw+hP7mZRHx5S5nTqdbsr+P7h30ClsCf1/hoXSF4wyHc3yf4CSMoOxIDcJvtCS9+7oMDxBi5pcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6vgaWlgXRsJ48GhoKJ3PZsZUDBTJ/+td/FIqbOLlsM=;
 b=dm2sM03epAQSV6QfIBFdd4jin27YRpoMQhf1x2mLeOjgRHsFzH0BIo3NpLxHYxVd2eRwCMA9kFpkCCXipeN84PMvZ5q5+K75xJcM7isdKC3eGwZ8p35WR0LlTUow3ZAIGD22pz9T1v7nqfIls/BPymJr7P2fH57HFxKvuq4D8dw=
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com (2603:1096:301:118::11)
 by TYZPR03MB9790.apcprd03.prod.outlook.com (2603:1096:405:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:04:03 +0000
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f]) by PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:04:03 +0000
From: Deep Pani <Deep.Pani@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Mandeep S <Mandeep.S@mediatek.com>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>
CC: =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	=?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?= <ot_ye.wang@mediatek.com>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
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
Thread-Index: AQHcXbSA3dPwahzj0kaOPW2QUXG1wrUDKBgAgL5Wx4CAAaSVgIAggR0A
Date: Fri, 17 Apr 2026 06:04:03 +0000
Message-ID: <0b76b625c9dadc7146098c1a3cd4e7f646291974.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-4-lei.xue@mediatek.com>
	 <df11bbf1-09d1-40fc-be56-6a98d90abcb6@collabora.com>
	 <0df339f15f4ba7e55880194edfdec1155f2f20f7.camel@mediatek.com>
	 <666207716ac5021e81736c30e802ba2febfed081.camel@mediatek.com>
In-Reply-To: <666207716ac5021e81736c30e802ba2febfed081.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7160:EE_|TYZPR03MB9790:EE_
x-ms-office365-filtering-correlation-id: 640418ed-abb2-40fd-7c93-08de9c47204c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: Ar1nGbUWc9trsKZ4jCD+Uv7j30auYLOb00ua+2M5p25HjCPsUYG6s5l6sMEfzJ36t9knzHmYTzxWbczW+0mLNd/1RVRdkqwSakyeNa2rajryiB3TC36BhQ8q96v/+9mFpZRbTEWhNVhed3l3sBEV5WlmUMKWQkG0CN04z0vuQ5TydAuj3jJf9tGy+FOEUPQywR3KEOVQDo84tKJeSFiagV+PQ0ioshPVeQiSVqG6YcBl+LB6JXkob+wLBOlXU4VnV2mps7mLc1bbzM0OgsSAuZAo1RQ7sZ7HtijH0JiVZVhN3emT4ZUvOe5q617oKEJg79uEGdTPk/HdyFvGt4j358LuxSP2jtPXR/wKta3y3kQZQPdBEky9xYbivFoxIdyggOKvLEjh20IjdBpn1IEbu6C90lCu5WFRUXL/Db3OGS2uTHFIUnLSI0JYFBUcQIyVnxUff2OWztRw41VdJNLHwxMqQJljJt2xz4F1TOXMbnD62b5Pvi61GQREqwyIexQgm5XBDvs+K/fuVg7FAuokkGxinUUJ98jBK3ZJs08q9BtqubQ5KCaBTtJcmOkWwNvXzdwAwjqa2zHbqhTFmsMxSrS1aoWV2phl+3139y0elqUZZ54LABgdVLVlTKrPX1Osa+jkgTk9pqaThF1Dly8N/mnI3IV2Vyy6rkKwaXN9N9aQO+db0JZNhaNdZ7jgs2WXCO6JB+KF4BsI0aBM8qZD2oSf52UJj54Tgj18czD4/hPEJgKtT5rjD6VvflQlRw3hQhZ8cmGmtPtcXfi+vkxtJRmQ2t+wwqr128lqB927JUU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7160.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmY2N2dEWk03NnluSEdjYlVVVUxjc1BlbjY5UkNFamI3QXBYNEYybnBsbDlS?=
 =?utf-8?B?S1YwNFBocGZpYS9kQ1dMdFYyTjBzUUw3QW92WWdMNE5CZ2dxWkYyRlVsaXJ6?=
 =?utf-8?B?ZThQNFJnQjczVUZWUGo4ZlVnMjZLY0c0UXhEZ2lVbTJ2ckNzMFF6T0MzWG9k?=
 =?utf-8?B?RHRFZVlpeklvN2kzamo0WDZLbGhqTEV2UFkxdjRzWTRDMUJwTnhidkpQT2Nz?=
 =?utf-8?B?Qm5oeDhnYVRYbktpUkxteFM0V1RXTTBIanJyVDNvcTVLYVZTZms3Q3lodEF5?=
 =?utf-8?B?TTNqellFMWtQeE42MWloeUhCUGx1Vm85ZEo3Zlk5MVBjak1Kc2tpZlN2Z2RM?=
 =?utf-8?B?RnEzQzBpY0VtQ1NPd2wvUk5uelJVcEJxM09kWFpGY2NNOW9HTnVaWHpnbU83?=
 =?utf-8?B?ekhhbFVRSlI0bkl0YnE3Uzd3b1BUYllPQ0NJQ3JhY1ZnMkkzRXZXcUJHWWFS?=
 =?utf-8?B?V3UwVFZTclpIRFFrOEdlT09yRzRzOGNVaGV0dnAxNnBiSm5FVXljQitxeXRR?=
 =?utf-8?B?c0d5ODZ3dFRDVEtVbExDSlBOWm9Cd3NoSVg0bm5VVHpKbVlqeEtqNDdSVW96?=
 =?utf-8?B?S3lXYkdDRTlzSC9MdW03ZnhoZCtrMVBZY2thbTdNYmwxYU9ocTU1MkFYSDBU?=
 =?utf-8?B?OHdGT1dtVTgyUTNMRWcvd3ZFckZQT29iOGwrT3FDYTAxSGE1NFNnZHhDSlNP?=
 =?utf-8?B?MGVJOVBhS0tIc0V2cjd6RC9DWHp6NXMvL2hqY0dNbFVGL1Nrb2NsdHZlSitQ?=
 =?utf-8?B?YlRJWnJDZFF5S1k5ZnRBUEtXREJxeUNpRm5BRkloeXcvd2FQM3dIemFCOXZx?=
 =?utf-8?B?VFRuOFZIU3EwSEpSRGQ1eE5rcmIrd2t6Rm0zUS9hTVFwOFI1UGVaa1JUcTVz?=
 =?utf-8?B?QlczcEhEdmxGS0FVcHhmam11Y2FISmR5dFkzdVU4ZmtkcTF2UmgzSHlhL1gz?=
 =?utf-8?B?U29IZzdQdU45eTEzRmlqOGo3Z0tKNDBRQXpiKzNXb2wxRTMwcUo3QXZkNENn?=
 =?utf-8?B?OWpLZm11RkVRYW5oZldsVzYxNlgzMWllMzByVlBnNDFISG15QU5ma2tsOUx4?=
 =?utf-8?B?UWYyWEVOY1dOa2haZUFXVlExaWtmNnFwbGg1elpZNG1iR0JBeHNVMitMbk9a?=
 =?utf-8?B?dXJLaGlYbWUvbG11ZDIrQ01jeVZEL0labERwQnBBUFI5WGJhS3JNV0l3aTNu?=
 =?utf-8?B?cUxyenNXRVFNbjZnMEdWbjlvWVozYnc2Rmd0c2NYL0UvcVJORldjU2puUVlO?=
 =?utf-8?B?UTlBYUVJc0c2SlE3S1BjYUdGdEc1OVFoUUE4dlppWi9YODhadjZuSHhINTFN?=
 =?utf-8?B?QkhldHY3dS9heWVyMTRjbUxFampUa0RlK2l0S3FMNjRoYm44WHhtMnJITk94?=
 =?utf-8?B?VUQwMklNakpJUk0wbk05S2xJNDI2aFJOZWN6RUFwN1E5UVdEdWpEMjNSTHJi?=
 =?utf-8?B?MWhUVUtjOGJOeG9xYUJhc3UxcTdLVVFMdGlZZzU0YmhDSlVPTkFBd2I5YThn?=
 =?utf-8?B?Vkg0T29TenFrVTl0UC84dWtZbTB1VmZMRStkOERFZDdLRlFnci9uTFhLUWMz?=
 =?utf-8?B?THhjNmJhckZWMVVjb1dsWkYyYWtsUmdBaGxBVkZGVEUwTlVQV21TZnE3Smps?=
 =?utf-8?B?M2lZU0ZrRzd1bEpKUTlVcGNlcW44YWRXQW1CaTlHRVFyVzc4RXQ4VURjZnY3?=
 =?utf-8?B?YVRsS1d0MWFuUHZZWnJGc3NkcS82Vk83ejgvUWptc2NIVVlZdnJXVko1Mzlx?=
 =?utf-8?B?dXd2WURKc3pLMjRxdHhjbWo3SUdxdFQwN083M0l1NUxwNTJWWkpKYWxHbFVm?=
 =?utf-8?B?a3dHN3YzRnFiMGdOZG5rYUNlTEpIQVMwc1REZEtXSXZkM0YyWG5XWE9pNndr?=
 =?utf-8?B?dEc1enp1MTV0RlphaEZKclJsUGpTYVoyOGx3ZGN3dEZ4anU1SjR6UTJIWEIw?=
 =?utf-8?B?cXo2Vjd0cmtrc3c0bWVrbU0rSXljejUwMnFUY1RmRjBFZXRZSWdreEJ2S2pY?=
 =?utf-8?B?akFWVkVBb0pnQ1piN01PdGhKdUpFakM3cnlBeXorZHdyQ29RUGZSdFdjQnBM?=
 =?utf-8?B?dDRmQ0h4Q2hIOHUrdzJMY2wvNzc5OGYwbEFzVnBSUDhBYWJab3ZYeUdKVlFH?=
 =?utf-8?B?cll6elZxL1hOT0hrSVlXUFE5TDhya3NnY2tmOTc3QVRVbzJUbm5JUTMxM2dO?=
 =?utf-8?B?UlQyTzBxSllTWUEyVGJ2VCtBNnJJcjdDVXhyL3UwYzVtK2szV3Z5bHBIZXM3?=
 =?utf-8?B?R0JhcEY5WDJzRG40RWN4TUtsL2tnRklnZ3RYQUFmWkVVMHZyK2ZqUWpiMlIw?=
 =?utf-8?B?d1ZsUHFmOXB4eVZmejlqOGlCdUk1RDRSdUswaUFsRVVDLzhXdStXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4FD76C789E4F94398F01D745C5EC874@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: alfDtHpQAdZuH+yK46GWFh1nQGgjfxyPsuXHfpKDxpDwcN+8H9ovwnIWmUMsD1ttUFELjwamIJpwYoNVlAk4OZyOpQENpIM4+MfEFH335dHnKyadDHFqiSeBbTQU39gdXxjgWru9wdoHiMYwxCvdyEYv7qMoOsZVPGzELopzqx/QDAT6u+8uhwysf8ngt9e4GtImYbGywT3RLC+v6qL6h6WcSvQlkifEdoxtSU2INyOsVkqAA1JHJXuzNQyD+oHgFyNbQvQEULbhBWL6yslSAeXoKHP/NIs02A7Nw5k9YISZcJVfqqq4V9dWhIMlQFN6b/6NE51CQmARji/xzDm8rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7160.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640418ed-abb2-40fd-7c93-08de9c47204c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 06:04:03.1537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0JQAaCDHRoGBMbvt3gHzaFBSPbr/xLd++mC6m3z2XhIq9NqoeF/aSlp9twMHxaD8yDxwXbC0CQ3l/MzJiRRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9790
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-35204-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,mediatek.com,collabora.com,kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Deep.Pani@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 267F94175FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5nZWxvLA0KDQpBcmUgdGhlcmUgYW55IHVwZGF0ZXMgZnJvbSB5b3VyIHNpZGU/DQoNClRo
YW5rcyBhbmQgUmVnYXJkcywNCkRlZXAgUGFuaQ0KDQpPbiBGcmksIDIwMjYtMDMtMjcgYXQgMjE6
NDEgKzA4MDAsIERlZXAgUGFuaSB3cm90ZToNCj4gSGkgQW5nZWxvLA0KPiANCj4gTVQ4OTAxIGRv
ZXNuJ3QgdXNlIGRldmljZXRyZWUgZm9yIGdwaW8gcGluIGNvbmZpZ3VyYXRpb24uIEFDUEkgQVNM
DQo+IG1hY3JvcyBhcmUgZGVjbGFyZWQgaW4gdGhlIGRldmljZSdzIF9DUlMgbWV0aG9kcyB0byBk
ZWZpbmUgZXhhY3QNCj4gY29uZmlndXJhdGlvbiBmb3IgdGhlIGdwaW8gcGlucy4NCj4gDQo+IFdl
IGhhdmUgYW5kIHdpbGwgYWx3YXlzIG1ha2Ugc3VyZSBBQ1BJIGlzIGFsbCBnb29kIG9uIHRoaXMg
cGxhdGZvcm0uDQo+IA0KPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+IERlZXAgUGFuaQ0KPiANCj4g
T24gVGh1LCAyMDI2LTAzLTI2IGF0IDEyOjM2ICswMDAwLCBGcmVkLVdZIENoZW4gKOmZs+WogeWu
hykgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI1LTExLTI1IGF0IDEwOjU2ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubw0KPiA+IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBFeHRlcm5hbCBl
bWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+
ID4gdW50aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gSWwgMjUvMTEvMjUgMDM6MzYsIExlaSBYdWUgaGEg
c2NyaXR0bzoNCj4gPiA+ID4gQWRkIG10ODkwMSBwaW5jdHJsLCBncGlvIGFuZCBlaW50IGRyaXZl
ciBpbXBsZW1lbnRhdGlvbi4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBY
dWUgPGxlaS54dWVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqAgZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAxMiArDQo+ID4gPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgKw0KPiA+ID4gPiDCoCBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvbXRrLWVpbnQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgNCArDQo+
ID4gPiA+IMKgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5owqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoCAxICsNCj4gPiA+ID4gwqAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ4OTAxLmPCoMKgwqDCoCB8IDE0NjANCj4gPiA+ID4gKysrKysrKysrKysNCj4g
PiA+ID4gwqAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLW10ODkwMS5oIHwg
MjEzMA0KPiA+ID4gPiArKysrKysrKysrKysrKysrKw0KPiA+ID4gPiDCoCA2IGZpbGVzIGNoYW5n
ZWQsIDM2MDggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4OTAxLmMNCj4gPiA+ID4gwqAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay0NCj4gPiA+
ID4gbXQ4OTAxLmgNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9L
Y29uZmlnDQo+ID4gPiA+IGluZGV4IDQ4MTk2MTdkOTM2OC4uNDgyMGFlNTE5N2EwIDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ID4gPiBAQCAtMzIxLDYg
KzMyMSwxOCBAQCBjb25maWcgUElOQ1RSTF9NVDg1MTYNCj4gPiA+ID4gwqDCoMKgwqDCoCBkZWZh
dWx0IEFSTTY0ICYmIEFSQ0hfTUVESUFURUsNCj4gPiA+ID4gwqDCoMKgwqDCoCBzZWxlY3QgUElO
Q1RSTF9NVEsNCj4gPiA+ID4gDQo+ID4gPiA+ICtjb25maWcgUElOQ1RSTF9NVDg5MDENCj4gPiA+
ID4gK8KgwqDCoMKgIGJvb2wgIk1lZGlhVGVrIE1UODkwMSBwaW4gY29udHJvbCINCj4gPiA+ID4g
K8KgwqDCoMKgIGRlcGVuZHMgb24gQUNQSQ0KPiA+ID4gPiArwqDCoMKgwqAgZGVwZW5kcyBvbiBB
Uk02NCB8fCBDT01QSUxFX1RFU1QNCj4gPiA+ID4gK8KgwqDCoMKgIGRlZmF1bHQgQVJNNjQgJiYg
QVJDSF9NRURJQVRFSw0KPiA+ID4gPiArwqDCoMKgwqAgc2VsZWN0IFBJTkNUUkxfTVRLX1BBUklT
DQo+ID4gPiA+ICvCoMKgwqDCoCBoZWxwDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgU2F5IHllcyBo
ZXJlIHRvIHN1cHBvcnQgcGluIGNvbnRyb2xsZXIgYW5kIGdwaW8gZHJpdmVyDQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgb24gTWVkaWFUZWsgTVQ4OTAxIFNvQy4NCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oCBJbiBNVEsgcGxhdGZvcm0sIHdlIHN1cHBvcnQgdmlydHVhbCBncGlvIGFuZCB1c2UgaXQgdG8N
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBtYXAgc3BlY2lmaWMgZWludCB3aGljaCBkb2Vzbid0IGhh
dmUgcmVhbCBncGlvIHBpbi4NCj4gPiA+ID4gKw0KPiA+ID4gPiDCoCAjIEZvciBQTUlDDQo+ID4g
PiA+IMKgIGNvbmZpZyBQSU5DVFJMX01UNjM5Nw0KPiA+ID4gPiDCoMKgwqDCoMKgIGJvb2wgIk1l
ZGlhVGVrIE1UNjM5NyBwaW4gY29udHJvbCINCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9NYWtlZmlsZQ0KPiA+ID4gPiBpbmRleCBhZTc2NWJkOTk5NjUuLjU3YzY5YjFlNWMyZCAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ID4gPiBA
QCAtNDMsMyArNDMsNCBAQCBvYmotJChDT05GSUdfUElOQ1RSTF9NVDgxOTYpwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiA+ICs9DQo+ID4gPiA+IHBpbmN0cmwtbXQ4MTk2Lm8N
Cj4gPiA+ID4gwqAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MzY1KcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArPSBwaW5jdHJsLQ0KPiA+ID4gPiBtdDgzNjUubw0KPiA+ID4gPiDCoCBv
YmotJChDT05GSUdfUElOQ1RSTF9NVDg1MTYpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICs9IHBpbmN0cmwtDQo+ID4gPiA+IG10ODUxNi5vDQo+ID4gPiA+IMKgIG9iai0kKENPTkZJR19Q
SU5DVFJMX01UNjM5NynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gcGluY3RybC0N
Cj4gPiA+ID4gbXQ2Mzk3Lm8NCj4gPiA+ID4gK29iai0kKENPTkZJR19QSU5DVFJMX01UODkwMSnC
oMKgwqDCoMKgwqDCoMKgICs9IHBpbmN0cmwtbXQ4OTAxLm8NCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5jDQo+ID4gPiA+IGIvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL210ay1laW50LmMNCj4gPiA+ID4gaW5kZXggYzhjNTA5N2MxMWM0Li5i
NWE1YmVlYmY5Y2QgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9tdGstZWludC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGst
ZWludC5jDQo+ID4gPiA+IEBAIC03MSw2ICs3MSwxMCBAQCBjb25zdCB1bnNpZ25lZCBpbnQgZGVi
b3VuY2VfdGltZV9tdDY4NzhbXSA9DQo+ID4gPiA+IHsNCj4gPiA+ID4gwqAgfTsNCj4gPiA+ID4g
wqAgRVhQT1JUX1NZTUJPTF9HUEwoZGVib3VuY2VfdGltZV9tdDY4NzgpOw0KPiA+ID4gPiANCj4g
PiA+ID4gK2NvbnN0IHVuc2lnbmVkIGludCBkZWJvdW5jZV90aW1lX210ODkwMVtdID0gew0KPiA+
ID4gPiArwqDCoMKgwqAgMTU2LCAzMTMsIDYyNSwgMTI1MCwgMjAwMDAsIDQwMDAwLCA4MDAwMCwg
MTYwMDAwLCAzMjAwMDAsDQo+ID4gPiA+IDY0MDAwMCwgMH07DQo+ID4gPiA+ICtFWFBPUlRfU1lN
Qk9MX0dQTChkZWJvdW5jZV90aW1lX210ODkwMSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gwqAgc3Rh
dGljIHZvaWQgX19pb21lbSAqbXRrX2VpbnRfZ2V0X29mZnNldChzdHJ1Y3QgbXRrX2VpbnQNCj4g
PiA+ID4gKmVpbnQsDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGVp
bnRfbnVtLA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBvZmZzZXQp
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQu
aA0KPiA+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5oDQo+ID4gPiA+
IGluZGV4IDNjZGQ2ZjYzMTBjZC4uMWIxODVmNjYwYWZmIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvbXRrLWVpbnQuaA0KPiA+ID4gPiBAQCAtNTMsNiArNTMsNyBAQCBl
eHRlcm4gY29uc3QgdW5zaWduZWQgaW50DQo+ID4gPiA+IGRlYm91bmNlX3RpbWVfbXQyNzAxW107
DQo+ID4gPiA+IMKgIGV4dGVybiBjb25zdCB1bnNpZ25lZCBpbnQgZGVib3VuY2VfdGltZV9tdDY3
NjVbXTsNCj4gPiA+ID4gwqAgZXh0ZXJuIGNvbnN0IHVuc2lnbmVkIGludCBkZWJvdW5jZV90aW1l
X210Njc5NVtdOw0KPiA+ID4gPiDCoCBleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IGRlYm91bmNl
X3RpbWVfbXQ2ODc4W107DQo+ID4gPiA+ICtleHRlcm4gY29uc3QgdW5zaWduZWQgaW50IGRlYm91
bmNlX3RpbWVfbXQ4OTAxW107DQo+ID4gPiA+IA0KPiA+ID4gPiDCoCBzdHJ1Y3QgbXRrX2VpbnQ7
DQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ4OTAxLmMNCj4gPiA+ID4gYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdDg5MDEuYw0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjc3ZGVjODVmZTI5Yg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODkwMS5jDQo+ID4g
PiA+IEBAIC0wLDAgKzEsMTQ2MCBAQA0KPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjANCj4gPiA+ID4gKy8qDQo+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUg
TWVkaWFUZWsgSW5jLg0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArDQo+ID4g
PiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPg0KPiA+ID4gPiArI2luY2x1ZGUgInBpbmN0cmwtbXRrLW10ODkwMS5oIg0KPiA+ID4g
PiArI2luY2x1ZGUgInBpbmN0cmwtcGFyaXMuaCINCj4gPiA+ID4gKw0KPiA+ID4gDQo+ID4gPiAu
LnNuaXAuLg0KPiA+ID4gDQo+ID4gPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10ODkw
MV9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZVtdDQo+ID4gPiA+ID0NCj4gPiA+ID4gew0KPiA+
ID4gPiArwqDCoMKgwqAgImlvY2ZnMCIsICJpb2NmZ19sdDIiLCAiaW9jZmdfbHQzIiwgImlvY2Zn
X3J0MSIsDQo+ID4gPiA+ICJpb2NmZ19ydDIiLA0KPiA+ID4gPiAiaW9jZmdfcnQzIiwNCj4gPiA+
ID4gK8KgwqDCoMKgICJpb2NmZ190ciIsICJpb2NmZ19ydDAiLCAiaW9jZmdfbHQxIiwgImlvY2Zn
X2xiIiwNCj4gPiA+ID4gImlvY2ZnX3JiIiwNCj4gPiA+ID4gK307DQo+ID4gPiA+ICsNCj4gPiA+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2VpbnRfaHcgbXQ4OTAxX2VpbnRfaHcgPSB7DQo+
ID4gPiA+ICvCoMKgwqDCoCAucG9ydF9tYXNrID0gMHhmLA0KPiA+ID4gPiArwqDCoMKgwqAgLnBv
cnRzwqDCoMKgwqAgPSA3LA0KPiA+ID4gPiArwqDCoMKgwqAgLmFwX251bcKgwqDCoCA9IDIwOSwN
Cj4gPiA+ID4gK8KgwqDCoMKgIC5kYl9jbnTCoMKgwqAgPSAzMiwNCj4gPiA+ID4gK8KgwqDCoMKg
IC5kYl90aW1lwqDCoCA9IGRlYm91bmNlX3RpbWVfbXQ4OTAxLA0KPiA+ID4gPiArfTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX3NvYyBtdDg5MDFfZGF0
YSA9IHsNCj4gPiA+ID4gK8KgwqDCoMKgIC5yZWdfY2FsID0gbXQ4OTAxX3JlZ19jYWxzLA0KPiA+
ID4gPiArwqDCoMKgwqAgLnBpbnMgPSBtdGtfcGluc19tdDg5MDEsDQo+ID4gPiA+ICvCoMKgwqDC
oCAubnBpbnMgPSBBUlJBWV9TSVpFKG10a19waW5zX210ODkwMSksDQo+ID4gPiA+ICvCoMKgwqDC
oCAubmdycHMgPSBBUlJBWV9TSVpFKG10a19waW5zX210ODkwMSksDQo+ID4gPiA+ICvCoMKgwqDC
oCAuZWludF9odyA9ICZtdDg5MDFfZWludF9odywNCj4gPiA+ID4gK8KgwqDCoMKgIC5laW50X3Bp
biA9IGVpbnRfcGluc19tdDg5MDEsDQo+ID4gPiA+ICvCoMKgwqDCoCAubmZ1bmNzID0gOCwNCj4g
PiA+ID4gK8KgwqDCoMKgIC5ncGlvX20gPSAwLA0KPiA+ID4gPiArwqDCoMKgwqAgLmJhc2VfbmFt
ZXMgPSBtdDg5MDFfcGluY3RybF9yZWdpc3Rlcl9iYXNlX25hbWUsDQo+ID4gPiA+ICvCoMKgwqDC
oCAubmJhc2VfbmFtZXMgPQ0KPiA+ID4gPiBBUlJBWV9TSVpFKG10ODkwMV9waW5jdHJsX3JlZ2lz
dGVyX2Jhc2VfbmFtZSksDQo+ID4gPiA+ICvCoMKgwqDCoCAucHVsbF90eXBlID0gbXQ4OTAxX3B1
bGxfdHlwZSwNCj4gPiA+ID4gK8KgwqDCoMKgIC5waW5fcnNlbCA9IG10ODkwMV9waW5fcnNlbF92
YWxfcmFuZ2UsDQo+ID4gPiA+ICvCoMKgwqDCoCAubnBpbl9yc2VsID0gQVJSQVlfU0laRShtdDg5
MDFfcGluX3JzZWxfdmFsX3JhbmdlKSwNCj4gPiA+ID4gLypudW1zZWwqLw0KPiA+ID4gPiArwqDC
oMKgwqAgLmJpYXNfc2V0X2NvbWJvID0gbXRrX3BpbmNvbmZfYmlhc19zZXRfY29tYm8sDQo+ID4g
PiA+ICvCoMKgwqDCoCAuYmlhc19nZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFzX2dldF9jb21i
bywNCj4gPiA+ID4gK8KgwqDCoMKgIC5kcml2ZV9zZXQgPSBtdGtfcGluY29uZl9kcml2ZV9zZXRf
cmV2MSwNCj4gPiA+ID4gK8KgwqDCoMKgIC5kcml2ZV9nZXQgPSBtdGtfcGluY29uZl9kcml2ZV9n
ZXRfcmV2MSwNCj4gPiA+ID4gK8KgwqDCoMKgIC5hZHZfZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZf
YWR2X2RyaXZlX3NldF9yYXcsDQo+ID4gPiA+ICvCoMKgwqDCoCAuYWR2X2RyaXZlX2dldCA9IG10
a19waW5jb25mX2Fkdl9kcml2ZV9nZXRfcmF3LA0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBtdDg5MDFfcGluY3RybF9h
Y3BpX21hdGNoW10NCj4gPiA+ID4gPQ0KPiA+ID4gPiB7DQo+ID4gPiA+ICvCoMKgwqDCoCB7Ik5W
REE5MjIxIiwgKGtlcm5lbF91bG9uZ190KSZtdDg5MDFfZGF0YSB9LA0KPiA+ID4gPiArwqDCoMKg
wqAgeyB9DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBt
dDg5MDFfcGluY3RybF9hY3BpX21hdGNoKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXQ4OTAxX3BpbmN0cmxfZHJpdmVyID0gew0KPiA+ID4gPiAr
wqDCoMKgwqAgLmRyaXZlciA9IHsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
bmFtZSA9ICJtdDg5MDEtcGluY3RybCIsDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmFjcGlfbWF0Y2hfdGFibGUgPQ0KPiA+ID4gPiBBQ1BJX1BUUihtdDg5MDFfcGluY3RybF9h
Y3BpX21hdGNoKSwNCj4gPiA+IA0KPiA+ID4gUGxlYXNlIGFsc28gYWRkIHN1cHBvcnQgZm9yIGRl
dmljZXRyZWUgLSBJIGhhdmUgYSBodW5jaCAoYW5kIEknbQ0KPiA+ID4gc3VyZQ0KPiA+ID4gdGhh
dCBJIGFtDQo+ID4gPiBub3QgdGhlIG9ubHkgb25lKSB0aGF0IEFDUEkgbWF5IGdpdmUgc29tZSBp
c3N1ZXMgYXQgdGhlIGVuZCBvZg0KPiA+ID4gdGhlDQo+ID4gPiBkYXksIG9uIEFSTTY0Lg0KPiA+
ID4gDQo+ID4gPiBPZiBjb3Vyc2UsIEknZCBob3BlIHRoYXQgQUNQSSBpcyBhbGwgZ29vZCBvbiB0
aGlzIHBsYXRmb3JtLCBidXQNCj4gPiA+IHN0aWxsLi4uLiA6LSkNCj4gPiA+IA0KPiA+ID4gc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ4OTAxX3BpbmN0cmxfb2ZfbWF0Y2hbXSA9
IHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4OTAx
LXBpbmN0cmwiLCAuZGF0YSA9DQo+ID4gPiAmbXQ4OTAxX2RhdGEgfSwNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ID4gfTsNCj4gPiA+IA0KPiA+ID4gwqDCoMKg
wqDCoMKgwqAgLm9mX21hdGNoX3RhYmxlID0gbXQ4OTAxX3BpbmN0cmxfb2ZfbWF0Y2gsDQo+ID4g
PiANCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucG0gPSBwbV9zbGVlcF9wdHIo
Jm10a19wYXJpc19waW5jdHJsX3BtX29wcykNCj4gPiA+ID4gK8KgwqDCoMKgIH0sDQo+ID4gPiA+
ICvCoMKgwqDCoCAucHJvYmUgPSBtdGtfcGFyaXNfcGluY3RybF9wcm9iZSwNCj4gPiA+ID4gK307
DQo+ID4gPiANCj4gPiANCj4gPiBIaSBEZWVwLA0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVhc2Ug
Y2hlY2sgYW5kIGZlZWRiYWNrIHRvIEFuZ2Vsbz8NCj4gPiANCj4gPiBSZWdhcmRzLA0KPiA+IEZy
ZWQtV1kgQ2hlbg0KPiA+IA0KPiA+ID4gQ2hlZXJzLA0KPiA+ID4gQW5nZWxvDQo+ID4gPiANCj4g
PiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGludCBfX2luaXQgbXQ4OTAxX3BpbmN0cmxfaW5pdCh2
b2lkKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArwqDCoMKgwqAgcmV0dXJuIHBsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcigmbXQ4OTAxX3BpbmN0cmxfZHJpdmVyKTsNCj4gPiA+ID4gK30NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArYXJjaF9pbml0Y2FsbChtdDg5MDFfcGluY3RybF9pbml0KTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiA+ID4gPiArTU9EVUxFX0RFU0NS
SVBUSU9OKCJNZWRpYVRlayBNVDg5MDEgUGluY3RybCBEcml2ZXIiKTsNCj4gPiANCj4gDQoNCg==

