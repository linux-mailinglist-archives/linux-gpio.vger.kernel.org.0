Return-Path: <linux-gpio+bounces-23356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD173B075EF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 14:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AD0B583B5F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 12:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2452F50BC;
	Wed, 16 Jul 2025 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JHGKl1WC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="l3udpkpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730D2F50B8;
	Wed, 16 Jul 2025 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669709; cv=fail; b=VehDYrglLMteyjzIHZAVce9VJSFD8yUIfxi3Z0bAoVFXAJfw6jyYPxH8KxRFt6CgGHaHP+JVuPSnaVDKTE9AAp+PwEZETmjcJx3JydU/M47NJbGNQ4e6dNQMkA/2JklWRLCQ4+XoT0Gn8jy2UkyWNdCrZKFsevxHINihfWpmHLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669709; c=relaxed/simple;
	bh=aUee1XbiehhYbznPvmmz90UCARmw7Cd53bA3eypdMsk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RoxgPc/NZEevCgF1ICvCrvLppY6ITxFP0F6aB28AKCEF6SArQFqp05qOb+rcan9GGM917sQ/49P4wnjANzSYwggFml/A6RV9A0DpPak7YDcCgRTomyoWENteHxghT2MAXGLzhv+u+VqKpvZcfvas1pbVYqu4MicKbZvtZfoEcdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JHGKl1WC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=l3udpkpm; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 37dfcf3c624211f0b33aeb1e7f16c2b6-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=aUee1XbiehhYbznPvmmz90UCARmw7Cd53bA3eypdMsk=;
	b=JHGKl1WCKDKqeI7ymXWMNm1d5k5iFUlj08IehKsTNgy/uFAiVU+kDT1dRtOU757/eftLpZD23kbRkyzAk2ZKD6iRkt/i2Ze4Wy2K0cV06oTbnP58tQ5HCVyyca6zbq66jnRAdse4ZCghXssbYNqKi3Iw1kYWhEoLsqvlQt05KvY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c80a84d0-07c1-49a8-828d-ce58b6065ec4,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:9eb4ff7,CLOUDID:07eaf199-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|97|83|106|11|80|1,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37dfcf3c624211f0b33aeb1e7f16c2b6-20250716
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1682374549; Wed, 16 Jul 2025 20:41:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 20:41:38 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 20:41:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKeS8TammkCl+MeKWKqR3zWSmB/NIngEpWsH6XC8vaioSWh2y6mQuAUIEkIE3fDr64UBLq5F4uWVvTU6aDx2jtJuw7oTQbk/aVIp11py/TYOK3llU708ka9aJ7ea0o4e6CtuHwhVStOmdPcEEQszRZtCHONEYdFpRit2R7mqiLKVO4s3NF0OUAwUAmiHxDvMItoaJP0kk9QefdtwkRAousx9kL46ccAZZazgKKwlwpSnnSoR3sTZfzCAUC7CPlJgol/kt3Y60qreLPQJnh48Fa4J1ewCJJAEenwX1LmgQFdeFx1ULdXlXozmNa2vZpQa8dMP41E/gtRI2i+7m1HoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUee1XbiehhYbznPvmmz90UCARmw7Cd53bA3eypdMsk=;
 b=apdySJebEurcBhhxFvFAfKc+3GLOTjzdBgtJpFlEUZtBN90Mu+xjcb+4/1yk8tSOceYvXJliwSVy9WkVAISfOubo/YqCE6e6AMrFTpzM2g3XsNVUrHx46ABv+v6mgUzq7gF7Yris3/TBwIerdQv1b5uBM1EYcHUJcy27stFYpTwGI5jDgN5zBD3JsxcmrvXn0IiL6iXzjd9MtSEIfv1Bdgi1fh58vYSWKBSthClX+X08trXK1T3wXgm5xi1eN1DCTIiEVrcshMunDPSN/FECEnr27qvKXvDOpiAmsmUxN5ODSMBgBPVRMb6S63vhjkvuCsOoltVcJW1HGahPK6xh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUee1XbiehhYbznPvmmz90UCARmw7Cd53bA3eypdMsk=;
 b=l3udpkpmxJ3QJU7q0xGMeWii3ppRhcR14kwLLW7O/g5LvB22Ol83KVuy0ZKFZ3Qcwp60ravNuzamAvTT+8iw6n18uRxBnbs4y0+t4UgvD+V+duAblnaMLFgeqSEuJudaK0tE5yTIAfb5M6T2b7JXVK3ClvQ7NPeXrCbgrxCa+V0=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SG2PR03MB6609.apcprd03.prod.outlook.com (2603:1096:4:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 12:41:35 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 12:41:34 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
	<tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
Thread-Topic: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
Thread-Index: AQHb7/otHAgXz125SEGgqv7lmnBnL7QyrXOAgAIQhIA=
Date: Wed, 16 Jul 2025 12:41:34 +0000
Message-ID: <e4e4cf154e9ea1a4f96a50f374e9f88fc27ca670.camel@mediatek.com>
References: <20250708111806.3992-1-darren.ye@mediatek.com>
	 <20250708111806.3992-9-darren.ye@mediatek.com>
	 <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
In-Reply-To: <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SG2PR03MB6609:EE_
x-ms-office365-filtering-correlation-id: 28f1e5f6-dcd0-4177-5074-08ddc4661943
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d1lnZXdmT3l0bUdnR29HK1E3VjBpdGxBb3FHWkZIOHBIdkJaSWt4NWg3STls?=
 =?utf-8?B?RU5YRTRKanRnQmhHWEswK0NEaDU0WUlxcG1HRjlDWHJqR3Arb0l3UHVmZi96?=
 =?utf-8?B?azgwMys5OXBGY2xnenh2NmV2SXpMam1lZEt6UHhXck5FdjRFbHFVVE5IUTFL?=
 =?utf-8?B?QmdZMHY5ZGVRSEZZS1Q4YzF2SXRrcDA4REFJdmNjVTkwMkRjeGprRXRpZ1NF?=
 =?utf-8?B?dkhIc2tHSUV5SWNoY1VzaGE5SitnZmZLQlErRSswVmRVbCtualJqYW4wRTNQ?=
 =?utf-8?B?bmtwWENRZmZSWUFmdUlwQzdXdEdPY0p0eVd0dStTd3R6enNTUCtoaS8xb1VR?=
 =?utf-8?B?U0JFWUoyWGRxSUxxOU9xKzJHR250Mkt5N0JheXowVEw3T211VjVlZkJmS3Zp?=
 =?utf-8?B?RVFjRzhNVStJb3ZZWVhUcU1IZHB1TXlPSjByZERYK0RWQkxLWnd5RG9DQjZG?=
 =?utf-8?B?UFAyNEdQcTR2UWxHU3FqaDVONU1hMHZjN0hPdHFyTTBuZmhCSEpRdHJiL2F1?=
 =?utf-8?B?MmJTY1kxODNwWEZzVDRxb1NHM2JERkhuUTljUEtjVFZJUHNJb3R5TzFKNURw?=
 =?utf-8?B?WTg5OUNEQ3FqeS9lU21kcXpOTlIwRGtTdE9XWU1SY01UbjYzYzVWUE5ML3oz?=
 =?utf-8?B?Y1djNVRFUlhVSEswaUcvbENISWgxR3RYVit6ZnhtZnJxOFA0eU5qcGxqRVh1?=
 =?utf-8?B?ZlpkSTFvRlJuRExxZGpWcUo2Z3QwalI1amo3ZmY1UFBFK0NERUxxSkR6aUkv?=
 =?utf-8?B?dkJKcVd0KzRVN0dDemJDdlhObS90NVhtVkNmYUNObXUvWXlnZDlrbGR1M3Fi?=
 =?utf-8?B?WmpuSXRCaWlNM2ZlTDlvYkZRU3g1WDFQWGRGY2VoUXdWSmdCQkYraW8wdjNl?=
 =?utf-8?B?Yzd6cXMyWlo4STd5UDRudG9UbGUySVpDU3d6eVNQbG1TR3hzaEROam9sU0pN?=
 =?utf-8?B?cnZhendpdklNUHVlRUloVWVGTEFiQ3dPSjliVDRHeUtNbGVLUlhEVnYvYVFG?=
 =?utf-8?B?UTBMZ2R1dzU5R1ByZ1EveHYvRFNiajd1OStSN3lTLzZCZzRUdktOK296eDZa?=
 =?utf-8?B?ajNhdWFMRmNJeHIwN0lnZzNXeTdNZm9LTkQ5bnVjVS9leUxjTjQ1OFFNclo3?=
 =?utf-8?B?c0dlVzRWYksrYTV5ZUFVOERBSUp1d1A2Z2FxMytoZnV6VXVNck4rWG0yMHNE?=
 =?utf-8?B?V3ZPclFXeEYxa0wwTUM3NDhDcFlQTWFtSTQ2bkhtblZESWtKeDN3M1NMWnRP?=
 =?utf-8?B?SjFEcWlJbzNXWEhQWTRkb3dFTUd4V1RYSGZXekgrTk8xLzk1ZmdJNlpxNjU4?=
 =?utf-8?B?SU4wOU5EM3U5dEc2VmE0SXgrdGVtR05aRGhkczBVMjVrNTBZQURJeFN1bWF5?=
 =?utf-8?B?U3U1cEllUGI3N0pkaEtSZlJoVS9FQnJkemhpWWhZcFo0Q01sNGdHaXhrZzhB?=
 =?utf-8?B?MG5HU3RWWG5WNkwySVByYjhubXp0V2VQdGg1RzZRTUFmMTdzYnZSdXArVUE4?=
 =?utf-8?B?M1hiZWFRc0hoZmNXVFlIL2RMMzE4YXRzNzJGZGo5c0ZrWG9VWHk4eTh0RnAz?=
 =?utf-8?B?Nk9zK1ZCSmd1RUVTMlVkRUg5bG9ucG00a2FuMWZ4cHJKTXgvYlZRWmZMU2sy?=
 =?utf-8?B?RmFhVnlWWS95UGlJM1N2QzhiaUxEZjdwNXdkdWlsNk03aG8wZXoxVVJaUkM1?=
 =?utf-8?B?VWVSTjB0bDFQNzh3UTh1WE5kdFF0d01odkxFaTNiaEp3WlZobnpkTFdJQ29U?=
 =?utf-8?B?czNvbzFNQzQwQmhFTS8zYXVlV3RWeGluRkk2T3pPS2k3SjFOY2pveFp3b0dV?=
 =?utf-8?B?S1pMVW16QU9JYmtVYlpiNkRDTFBEN2IySEJIcHdOdVRoWHVDSld1WVNBT0Rw?=
 =?utf-8?B?czhMM3B4R0FXTzNabmdXRUIwNE01aEJ6ZEtiRkJvdHFZbHdnVFB3UThsVzdI?=
 =?utf-8?Q?G+imYDiln3UYf43pwomGaB0SGLtJbGyO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC9MQjc2TlNPZ2xYSnBPWC9sUkFPZXY3U2tEeExxS2ZQcHVnVmFQQkl5V29w?=
 =?utf-8?B?L2tFcjdkcWhZMk1Zb3hFZkI5R0Q1b0FQZ1N3WmV2Yy9QaFBnSGkrSDZLRThY?=
 =?utf-8?B?YitnK2gxZDluNlp5WCtFL1VIYUFZM2ZEZkpTZldNTmtQYkgyU0NHZzJQckx2?=
 =?utf-8?B?NzRQdUNjRE1PTG1Fa25EYmdqV2VkOUtoSzhLRk04d2VSSHR6QWFmOEhyRFVT?=
 =?utf-8?B?Y0VpcWlIbk1hQlZ6czYxckdoaW1SVTFiUHhMd2RJeThMWXpUc3ZjVjBMUXVz?=
 =?utf-8?B?ZTc2UmcwaWsrRjVXOEJETXQ2VURVSURhd0tWaWF1c0xaWnhyeTV2UldPcHln?=
 =?utf-8?B?WWRxeWc5dWM5UHkyWXNGeG9ETjJNVUNjM1JseDFXd0diWFdhT0RRRGtqWkNy?=
 =?utf-8?B?dmlQamswMEFKZVAvWm01c2tVc2xoeUNlT3ZBMjJwTnl3WGdBMkpkR3Nxc2M2?=
 =?utf-8?B?Wnh0U1BlR21zSUdxNE9ERjNsZEdTN0hiNm4rYklUVlI0aFR5QmduM1luMm5J?=
 =?utf-8?B?RzQyTlJFTXd4MUlSaEh0UFdTWUJmcWhyTlRnbXd1YlUrMStZVXN2cS96Umha?=
 =?utf-8?B?Q0QyQlFrWCt6cWFPbXpnWFM3RGh5OE94LytxVndPdFRhWGpvdTZsU1ZwZ0pR?=
 =?utf-8?B?Y2ppRWpqVE1aemFMYldYMFRkYytiK216UWl5Mk15NHlwQk9jRnpIbm5aVFho?=
 =?utf-8?B?K2NEZmxHR2JxdC9zeHJEYlRZYkpwTGkraU9Sb05WeFBrbncxN29LaHU0dE5q?=
 =?utf-8?B?cnpGQWd4NGkzRUNsTVZaTGVGVXZzWE8reDVuNUVrck9Cb2N1RUdDYVhPOWVx?=
 =?utf-8?B?NzFDKzYvWkY5MWRKNFU4UlRDMHdHS0xxdXRVYlV0QTd6MlM4NlJGanJFeSt1?=
 =?utf-8?B?WE5DU1R6U1ZnOVdQV0dmUHJETFRBdStMYWRHT29YK1Jlam94UHpVazhNZW5K?=
 =?utf-8?B?VXJGOGR0TzgzbHlGTzFyQXQ3VjhaT2Y1YTRZQkxwQ1R1Wi8zMVRjVGlabFhD?=
 =?utf-8?B?c0RkeVBoelloYTB0L2NSaC9MRllLdGdKVzdEMHRlYm12VkF4YWJzNUg3Nm1P?=
 =?utf-8?B?MVpINnpreHV3YlozQnFJUkhzeVN5UVZzS0pta0RYQmI3cUROQmUzUzdjRkFq?=
 =?utf-8?B?ckpZRFZ4RmRnak9XTzhEZ21ROE9Na3ZKTUUyOTh4M25TU2ZSUDVaWnVKbzhv?=
 =?utf-8?B?cDB1TFc4ZytRb25ud3l2b3ZxSDhnME1tYXBmV1F4bm13OUxjR3VoNENzbFpw?=
 =?utf-8?B?ekRPQlliaTNyN1VtdUhRTll5RlFZL3BXTDhnTVpsdkt1cm9BR1VicWV6Vlha?=
 =?utf-8?B?dE9jb05DWGhUK0d1cjBCc2JxbFVmb0djUU8rWE5ZT2xBZkxQQUxucnhxVjc1?=
 =?utf-8?B?bTNLR0xCeEI4QWw2L3BFUm9jUDdhSVJhMFo3SkhBS21pekoyNlBvdlhtazh4?=
 =?utf-8?B?RHNXeG9WMFk5QW8ybDVUTXBrTW9Tb0lmdTdzaFkvL3dpMmhPLzJiSVM5bnIr?=
 =?utf-8?B?REVKZVM2bUdQNGNiVkxZZ3dqeEdRY3RSNXpHQlcvNCtSU0ZCMWtlWEV5OGJI?=
 =?utf-8?B?TjlVTmxPeUFaVXJiSDdEZTVlQ0orRVpiTE9kQ1dUQlFCU29vZ21zRG9sT05X?=
 =?utf-8?B?U0tlRmxGS0x4VU94VjJlbmJNTTNYeTR1K2x0QkJTUncrVGpMcE5Pc1NZbkdJ?=
 =?utf-8?B?VU9KeVZKK04vY25majdLbHZCRWVnUEl1M0NkUkU3QnJKNHdQYmVXZk1zOHVD?=
 =?utf-8?B?M0lxKzZnanJSU0VsWDFUR294NzQyVGlnQTBTdUszanpNQzZ6bmFPdEpWQUU2?=
 =?utf-8?B?SzVLc0hQanBDV3JyakJOVFZPRW9SWmcxOWZZUEpxWWFQelVCVHdCVGZobzVM?=
 =?utf-8?B?YUlndmFtd3grVk1uNC9RdXZzM1JLZWZWTVNvZnZzVW5nMDRUcjdRejN4YnU3?=
 =?utf-8?B?b1c4SDFlNXlyYkJFNUs1Vks2dURxcjlEQ2FQVzRzZ2F3Z2JrRjRHRThQMWhG?=
 =?utf-8?B?S1VVSzJpYmhpUzJyK2ZMSW1YVGVuaWxqbnFhWU5sZzFmTzNZcldYazg5b0xR?=
 =?utf-8?B?N1RTcUVWU1U4elErTWF2cUV0aFpOc0xwRmQ0elhEV0FDSm45aXdyQkp1OXdz?=
 =?utf-8?Q?SRz70Xzz+7X+KyqjUJPEpqsm9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3EF0860FE57C14C845BE22EFFA322D9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f1e5f6-dcd0-4177-5074-08ddc4661943
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 12:41:34.5399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMq/YCofQemmgZlY4OToxLwA5ysgZdRXdH5ZBLb/oykfY06mJJRDtOUF3BTAmrV0Cx78vQBdKNkxUNTI1KUBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6609

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDEzOjA5ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gSGksDQo+IA0KPiBPbiBUdWUsIEp1bCA4LCAyMDI1IGF0IDc6MzXigK9Q
TSBEYXJyZW4uWWUgPGRhcnJlbi55ZUBtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+
IEZyb206IERhcnJlbiBZZSA8ZGFycmVuLnllQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBBZGQg
bXQ4MTk2IGF1ZGlvIEFGRS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJyZW4gWWUgPGRh
cnJlbi55ZUBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiAgLi4uL2Jp
bmRpbmdzL3NvdW5kL21lZGlhdGVrLG10ODE5Ni1hZmUueWFtbCAgIHwgMTU3DQo+ID4gKysrKysr
KysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNTcgaW5zZXJ0aW9ucygrKQ0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbWVkaWF0ZWssbXQ4MTk2LWFmZS55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21lZGlhdGVrLG10
ODE5Ni1hZmUueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL21lZGlhdGVrLG10ODE5Ni1hZmUueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZTE0N2VkZGY1ZTcNCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21lZGlhdGVr
LG10ODE5Ni0NCj4gPiBhZmUueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTU3IEBADQo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+
ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL21lZGlhdGVrLG10
ODE5Ni1hZmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWlTaUJ3Q1lFaldkV1N2MjVYUmJs
M2t5M05paXczbkRwVlktZlcxZHh5cDNlVTVZRHMwYmJaWEVnUFVRMV9OSW5ieFVJZ3l6M0hKdmYt
eFRIJA0KPiA+ICskc2NoZW1hOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3
TWcwQVJidyFpU2lCd0NZRWpXZFdTdjI1WFJibDNreTNOaWl3M25EcFZZLWZXMWR4eXAzZVU1WURz
MGJiWlhFZ1BVUTFfTkluYnhVSWd5ejNISFVqSHN1VyQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRp
YVRlayBBdWRpbyBGcm9udCBFbmQgUENNIGNvbnRyb2xsZXIgZm9yIE1UODE5Ng0KPiA+ICsNCj4g
PiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBEYXJyZW4gWWUgPGRhcnJlbi55ZUBtZWRpYXRlay5j
b20+DQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAg
ICBjb25zdDogbWVkaWF0ZWssbXQ4MTk2LWFmZQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAg
ICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWF4SXRl
bXM6IDENCj4gPiArDQo+ID4gKyAgbWVtb3J5LXJlZ2lvbjoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIG1lZGlhdGVrLHZscGNrc3lzOg0KPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246
IFRvIHNldCB1cCB0aGUgYXBsbDEyIHR1bmVyDQo+IA0KPiBMb29raW5nIGF0IHRoZSBpbXBsZW1l
bnRhdGlvbiwgdGhlIGNvbmZpZ3VyYXRpb24gaXMganVzdCBhIGZpeGVkDQo+IHZhbHVlLg0KPiBD
YW4gdGhpcyBiZSBtb3ZlZCB0byB0aGUgVkxQIGNsb2NrIGRyaXZlciBpbnN0ZWFkPw0KPiANCkkg
dGhpbmtzIGl0J3Mgbm90IGdvb2QgdG8gcHV0IGl0IGluIHRoZSBWTFAgY2xvY2sga2VybmVsIGRy
aXZlciwNCmJlY2F1c2UgdGhpcyB2YWx1ZSBuZWVkcyB0byBiZSBhZGp1c3RlZC4gVXN1YWxseSwg
aXQgaXMgc2V0IGluIA0KY29yZWJvb3QsIGJ1dCBpdCBpcyBoYXJkIHRvIGNoYW5nZSBsYXRlci4g
QXVkaW8gbmVlZHMgdG8gYWRqdXN0DQp0aGlzIHZhbHVlLCBzbyBpdCdzIGJldHRlciB0byBwdXQg
aXQgaW4gdGhlIGF1ZGlvIGRyaXZlci4gV2hhdCBkbw0KeW91IHRoaW5rPw0KDQo+ID4gKw0KPiA+
ICsgIHBvd2VyLWRvbWFpbnM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBj
bG9ja3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbXV4IGZv
ciBhdWRpbyBpbnRidXMNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbXV4IGZvciBhdWRpbyBl
bmdlbjENCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbXV4IGZvciBhdWRpbyBlbmdlbjINCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogbXV4IGZvciBhdWRpbyBoDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IHZscCAyNm0gY2xvY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8g
YXBsbDEgY2xvY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8gYXBsbDIgY2xvY2sN
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8gYXBsbDEgZGl2aWRlNA0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBhdWRpbyBhcGxsMiBkaXZpZGU0DQo+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IGF1ZGlvIGFwbGwxMiBkaXZpZGUgZm9yIGkyc2luMA0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBhdWRpbyBhcGxsMTIgZGl2aWRlIGZvciBpMnNpbjENCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogYXVkaW8gYXBsbDEyIGRpdmlkZSBmb3IgZm1pMnMNCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogYXVkaW8gYXBsbDEyIGRpdmlkZSBmb3IgdGRtb3V0IG1jaw0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBhdWRpbyBhcGxsMTIgZGl2aWRlIGZvciB0ZG1vdXQgYmNrDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IG11eCBmb3IgYXVkaW8gYXBsbDENCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogbXV4IGZvciBhdWRpbyBhcGxsMg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBt
dXggZm9yIGkyc2luMCBtY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbXV4IGZvciBpMnNp
bjEgbWNrDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IG11eCBmb3IgZm1pMnMgbWNrDQo+ID4g
KyAgICAgIC0gZGVzY3JpcHRpb246IG11eCBmb3IgdGRtb3V0IG1jaw0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBtdXggZm9yIGFkc3AgY2xvY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
MjZtIGNsb2NrDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+
ID4gKyAgICAgIC0gY29uc3Q6IHRvcF9hdWRfaW50YnVzDQo+ID4gKyAgICAgIC0gY29uc3Q6IHRv
cF9hdWRfZW5nMQ0KPiA+ICsgICAgICAtIGNvbnN0OiB0b3BfYXVkX2VuZzINCj4gPiArICAgICAg
LSBjb25zdDogdG9wX2F1ZF9oDQo+ID4gKyAgICAgIC0gY29uc3Q6IHZscF9jbGsyNm0NCj4gPiAr
ICAgICAgLSBjb25zdDogYXBsbDENCj4gPiArICAgICAgLSBjb25zdDogYXBsbDINCj4gPiArICAg
ICAgLSBjb25zdDogYXBsbDFfZDQNCj4gPiArICAgICAgLSBjb25zdDogYXBsbDJfZDQNCj4gDQo+
IFRoZXNlIGFyZSBwYXJlbnRzIG9mIHRoZSB0b3BfYXBsbFsxMl0uIFRoZXkgZG8gbm90IGZlZWQg
aW50byB0aGUNCj4gaGFyZHdhcmUgZGlyZWN0bHksIHNvIHlvdSBzaG91bGQgbm90IGJlIGluY2x1
ZGluZyB0aGVtIGhlcmUuDQo+IA0KPiA+ICsgICAgICAtIGNvbnN0OiBhcGxsMTJfZGl2X2kyc2lu
MA0KPiA+ICsgICAgICAtIGNvbnN0OiBhcGxsMTJfZGl2X2kyc2luMQ0KPiA+ICsgICAgICAtIGNv
bnN0OiBhcGxsMTJfZGl2X2ZtaTJzDQo+ID4gKyAgICAgIC0gY29uc3Q6IGFwbGwxMl9kaXZfdGRt
b3V0X20NCj4gPiArICAgICAgLSBjb25zdDogYXBsbDEyX2Rpdl90ZG1vdXRfYg0KPiANCj4gSW4g
dGhlIGNsb2NrIGJpbmRpbmdzIHNlbnQgYnkgQ29sbGFib3JhLCB0aGVzZSBkaXZpZGVycyBhcmUg
bm8gbG9uZ2VyDQo+IHNlcGFyYXRlbHkgbW9kZWxlZDsgdGhleSBoYXZlIGJlZW4gY29tYmluZWQg
d2l0aCB0aGVpciByZXNwZWN0aXZlDQo+IHRvcF8qIGNsb2Nrcy4NCj4gDQo+ID4gKyAgICAgIC0g
Y29uc3Q6IHRvcF9hcGxsMQ0KPiA+ICsgICAgICAtIGNvbnN0OiB0b3BfYXBsbDINCj4gDQo+IFRo
ZXNlIHR3byBhcmUgcGFyZW50cyB0byBhcGxsMTJfZGl2XyosIGRvIG5vdCBmZWVkIGludG8gdGhl
IGhhcmR3YXJlDQo+IGRpcmVjdGx5LCBzbyB5b3Ugc2hvdWxkIG5vdCBiZSBpbmNsdWRpbmcgdGhl
bSBoZXJlLg0KPiANCj4gVGhlIGNsb2NrIHRyZWUgZm9yIGVhY2ggYXVkaW8gaW50ZXJmYWNlIGNs
b2NrIGxvb2tzIGxpa2UgdGhlDQo+IGZvbGxvd2luZzoNCj4gDQo+ICAgICBhcGxsMSAtPiBhcGxs
MV9kNCAtPiB0b3BfYXBsbDEgLS0NCj4gICAgICAgICAgICAgICAgICAgICAgLyAgICAgICAgICAg
ICAgIFwNCj4gICAgICAgICAgICAgICBjbGsyNm0gICAgICAgICAgICAgICAgICAtLT4gdG9wX2Zt
aTJzIC0+DQo+IGFwbGwxMl9kaXZfZm1pMnMNCj4gICAgICAgICAgICAgICAgICAgICAgXCAgICAg
ICAgICAgICAgIC8NCj4gICAgIGFwbGwyIC0+IGFwbGwyX2Q0IC0+IHRvcF9hcGxsMiAtLQ0KPiAN
Cj4gT25seSB0aGUgZmluYWwgImFwbGwxMl9kaXZfZm1pMnMiIHNob3VsZCBiZSByZWZlcmVuY2Vk
Lg0KPiANCj4gT24gdGhlIGltcGxlbWVudGF0aW9uIHNpZGUsIGl0IHNob3VsZCBzaW1wbHkgYmUg
YSBtYXR0ZXIgb2Ygc2V0dGluZw0KPiB0aGUNCj4gcmVxdWlyZWQgcmF0ZSAoMjQuNTc2IE1IeiBv
ciAyMi41NzkyIE1Ieiwgb3Igc29tZSBtdWx0aXBsZSkgb24gdGhpcw0KPiBsZWFmDQo+IGNsb2Nr
LCBhbmQgbGV0IHRoZSBjbG9jayBmcmFtZXdvcmsgZmlndXJlIG91dCB0aGUgUExMIGFuZCBkaXZp
ZGVycyB0bw0KPiB1c2UuIFNhbWUgdGhpbmcgZm9yIGVuYWJsaW5nIHRoZSBjbG9jay4NCg0KSSB0
aGluayB3ZSBoYXZlIHNvbWUgbWlzdW5kZXJzdGFuZGluZ3MuIEkgd2lsbCBmaXJzdCBkcmF3IG10
ayBhdWRpbw0KY2xvY2sgdG9wb2xvZ3kgZGlhZ3JhbSwgYW5kIHRoZW4gd2UgY2FuIGRpc3NjdXNz
IHdoaWNoIHBhcnRzIGNhbiBiZQ0Kb3B0aW1pemVkIHRvZ2V0aGVyLg0KDQp0b3BfYXVkX2ludGJ1
czogYXMgcmVhZC93cml0ZSByZWcgY2xvY2sgc291cmNlOw0KdG9wX2F1ZF9lbmcxL3RvcF9hdWRf
ZW5nMjogYXMgaTJzIGJjayBjbG9jayBzb3VyY2U7DQphcGxsMTJfZGl2X3h4eDogYXMgbWNsayBj
bG9jayBzb3VyY2U7DQp0b3BfYXVkaW9faDogYXMgYWZlIG90aGVyIGlwIGNsb2NrIHNvdXJjZTsN
Cg0KDQp2bHBfY2xrMjZtDQogICAgICAgIFwNCmFwbGwxICAgLS0+IHRvcF9hdWRpb19oDQoJLw0K
YXBsbDINCg0KDQogICAgICAgICAgICAgICAgdmxwX2NsazI2bQ0KICAgICAgICAgICAgICAgICAg
ICAgXA0KYXBsbDEgIC0tPiBhcGxsMV9kNCAgLS0+IHRvcF9hdWRfZW5nMSANCiAgICAgICBcDQpj
bGsyNm0gLS0+IHRvcF9hcGxsMSANCgkJXA0KCQkgLS0+IHRvcF9mbWkycyAtLT4gYXBsbDEyX2Rp
dl9mbWkycyAgDQoJCS8NCmNsazI2bSAgLS0+IHRvcF9hcGxsMg0KICAgICAgIC8NCmFwbGwyICAt
LT4gYXBsbDJfZDQgIC0tPiB0b3BfYXVkX2VuZzINCiAgICAgICAgICAgICAgICAgICAgIC8NCgkg
ICAgICAgdmxwX2NsazI2bQ0KDQoNCnZscF9jbGsyNm0gLT4gdG9wX2F1ZF9pbnRidXMNCg0KDQo+
IA0KPiA+ICsgICAgICAtIGNvbnN0OiB0b3BfaTJzaW4wDQo+ID4gKyAgICAgIC0gY29uc3Q6IHRv
cF9pMnNpbjENCj4gPiArICAgICAgLSBjb25zdDogdG9wX2ZtaTJzDQo+ID4gKyAgICAgIC0gY29u
c3Q6IHRvcF90ZG1vdXQNCj4gPiArICAgICAgLSBjb25zdDogdG9wX2Fkc3ANCj4gPiArICAgICAg
LSBjb25zdDogY2xrMjZtDQo+IA0KPiBJcyB0aGlzIG9uZSBkaXJlY3RseSBuZWVkZWQ/IEl0IGlz
IHNpbWlsYXIgdG8gdmxwX2NsazI2bSwgYW5kIEkNCj4gc3VzcGVjdA0KPiBvbmx5IHRoYXQgb25l
IGlzIG5lZWRlZC4NCj4gDQp2bHBfY2xrMjZtIGJlbG9uZ3MgdG8gdGhlIFZMUCBjbG9jayBkb21h
aW4sIGFuZCBjbGsyNiBiZWxvbmdzIHRvIHRoZQ0Kc3lzdGVtIGNsb2NrIGRvbWFpbjsNCg0KdG9w
X2FwbGwxL3RvcF9hcGxsMiBjYW4gb25seSBzZWxlY3Qgc3lzdGVtIGFwbGwxL2FwbGwyIG9yIGNs
azI2bSwgdGhleQ0KY2Fubm90IHVzZSB2bHBfY2xrMjZtOw0KDQpCUg0KRGFycmVuIFllDQoNCj4g
DQo+IENoZW5ZdQ0KPiANCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJs
ZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBtZW1vcnktcmVn
aW9uDQo+ID4gKyAgLSBtZWRpYXRlayx2bHBja3N5cw0KPiA+ICsgIC0gcG93ZXItZG9tYWlucw0K
PiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBjbG9jay1uYW1lcw0KPiA+ICsNCj4gPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwN
Cj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0t
Z2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvaXJxLmg+DQo+ID4gKw0KPiA+ICsgICAgc29jIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwyPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArDQo+ID4g
KyAgICAgICAgYWZlQDFhMTEwMDAwIHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTYtYWZlIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYTExMDAw
MCAwIDB4OTAwMD47DQo+ID4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNTEg
SVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4gPiArICAgICAgICAgICAgbWVtb3J5LXJlZ2lvbiA9
IDwmYWZlX2RtYV9tZW1fcmVzZXJ2ZWQ+Ow0KPiA+ICsgICAgICAgICAgICBtZWRpYXRlayx2bHBj
a3N5cyA9IDwmdmxwX2Nrc3lzX2Nsaz47DQo+ID4gKyAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMg
PSA8JnNjcHN5cyAxND47DQo+ID4gLy9NVDgxOTZfUE9XRVJfRE9NQUlOX0FVRElPDQo+ID4gKyAg
ICAgICAgICAgIGNsb2NrcyA9IDwmdmxwX2Nrc3lzX2NsayA0MD4sDQo+ID4gLy9DTEtfVkxQX0NL
X0FVRF9JTlRCVVNfU0VMDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDwmdmxwX2Nrc3lzX2Ns
ayAzOD4sDQo+ID4gLy9DTEtfVkxQX0NLX0FVRF9FTkdFTjFfU0VMDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIDwmdmxwX2Nrc3lzX2NsayAzOT4sDQo+ID4gLy9DTEtfVkxQX0NLX0FVRF9FTkdF
TjJfU0VMDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDwmdmxwX2Nrc3lzX2NsayAzNz4sIC8v
Q0xLX1ZMUF9DS19BVURJT19IX1NFTA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICA8JnZscF9j
a3N5c19jbGsgNDU+LCAvL0NMS19WTFBfQ0tfQ0xLU1ENCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgPCZja3N5c19jbGsgMTI5PiwgLy9DTEtfQ0tfQVBMTDENCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgPCZja3N5c19jbGsgMTMyPiwgLy9DTEtfQ0tfQVBMTDINCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgPCZja3N5c19jbGsgMTMwPiwgLy9DTEtfQ0tfQVBMTDFfRDQNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgPCZja3N5c19jbGsgMTMzPiwgLy9DTEtfQ0tfQVBMTDJfRDQNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19jbGsgODA+LA0KPiA+IC8vQ0xLX0NLX0FQTEwx
Ml9DS19ESVZfSTJTSU4wDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDwmY2tzeXNfY2xrIDgx
PiwNCj4gPiAvL0NMS19DS19BUExMMTJfQ0tfRElWX0kyU0lOMQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICA8JmNrc3lzX2NsayA5Mj4sIC8vQ0xLX0NLX0FQTEwxMl9DS19ESVZfRk1JMlMNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19jbGsgOTM+LA0KPiA+IC8vQ0xLX0NLX0FQ
TEwxMl9DS19ESVZfVERNT1VUX00NCj4gPiArICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19j
bGsgOTQ+LA0KPiA+IC8vQ0xLX0NLX0FQTEwxMl9DS19ESVZfVERNT1VUX0INCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgPCZja3N5c19jbGsgNDM+LCAvL0NMS19DS19BVURfMV9TRUwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19jbGsgNDQ+LCAvL0NMS19DS19BVURfMl9TRUwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19jbGsgNjY+LCAvL0NMS19DS19BUExM
X0kyU0lOMF9NQ0tfU0VMDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDwmY2tzeXNfY2xrIDY3
PiwgLy9DTEtfQ0tfQVBMTF9JMlNJTjFfTUNLX1NFTA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICA8JmNrc3lzX2NsayA3OD4sIC8vQ0xLX0NLX0FQTExfRk1JMlNfTUNLX1NFTA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICA8JmNrc3lzX2NsayA3OT4sIC8vQ0xLX0NLX0FQTExfVERNT1VUX01D
S19TRUwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgPCZja3N5c19jbGsgNDU+LCAvL0NMS19D
S19BRFNQX1NFTA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICA8JmNrc3lzX2NsayAxNDA+OyAv
L0NMS19DS19UQ0tfMjZNX01YOQ0KPiA+ICsgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJ0b3Bf
YXVkX2ludGJ1cyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgInRvcF9hdWRfZW5n
MSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgInRvcF9hdWRfZW5nMiIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgInRvcF9hdWRfaCIsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgInZscF9jbGsyNm0iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICJhcGxsMSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgImFwbGwyIiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAiYXBsbDFfZDQiLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICJhcGxsMl9kNCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgImFwbGwxMl9kaXZfaTJzaW4wIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAi
YXBsbDEyX2Rpdl9pMnNpbjEiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJhcGxs
MTJfZGl2X2ZtaTJzIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAiYXBsbDEyX2Rp
dl90ZG1vdXRfbSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgImFwbGwxMl9kaXZf
dGRtb3V0X2IiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3BfYXBsbDEiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3BfYXBsbDIiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICJ0b3BfaTJzaW4wIiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAidG9wX2kyc2luMSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgInRv
cF9mbWkycyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgInRvcF90ZG1vdXQiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3BfYWRzcCIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgImNsazI2bSI7DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07
DQo+ID4gKw0KPiA+ICsuLi4NCj4gPiAtLQ0KPiA+IDIuNDUuMg0KPiA+IA0KPiA+IA0K

