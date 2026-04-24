Return-Path: <linux-gpio+bounces-35512-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKBTGavM62llRgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35512-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:03:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A07D463187
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94B373014763
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E261433F5B2;
	Fri, 24 Apr 2026 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="5vCoy9ti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0064.outbound.protection.office365.us [23.103.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312A266581
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777061032; cv=fail; b=gZmPsR8wvmevpwFJFaG5St9kKLoKON5U9st7I5qnmAeC2BXCqqeoJvP+qF+H3qPzWLzoVS7Q1mW0e+nIWH2syF7I0i49j8JHrs8/LCgZUzeAb92wPlctSRsDlOznhLL8vpdmF3OIg/eb0W/6aTWWDQGsHCvbmujiEwfugAWl4vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777061032; c=relaxed/simple;
	bh=49fr/6N9bUsF57XiYSH2oI7U00uj6xnyUJlv40ouAdU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z83C+FcBGMpXOsVTeArUhJESXafAw7Fm2VNSqZPk/itFJ3QgxnXCci1ImWXoowSjmhtCkGEXZDBJY05//YZgmT56IltySOonxT4QcjIsFe/cTKHvF4vaTdmD2wfHd3lpJaaRf/lamPfQSP9u/HJ8fSjMt5hK0o6NWHvivY8eTDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=5vCoy9ti; arc=fail smtp.client-ip=23.103.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=VkWxxIXN8UwOXuJRGM/D9Ih4hXqskf81DWBntQ9mfEJzVCyFKHIYIXyKGe18sH6iEnPuNJs5Tt8A1alKJV219tlmlKDszKzr2KuxxhJm/BU3DT1N2HZFBEi/8TBFnSq1o10ElPvCOBQ5gsxPMx7RTBD4ml0MG2dQMSCHoHNnPYqbiBcdM7UPMNrQ7gh7IOAOThCF3aw/ShBOCaINL9IwJqKWDgo3RMnVQ+MtFi8Tw+iRwA1VQsi+SgMtzAgwoX7+wjnfPlGhiak7ErT10ymV1peNjpPIDyl8RmVmMNYTWJGOpGQ29sFMWtLtDHOBesmn7YctgvdXCnvFYIn+t36Mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49fr/6N9bUsF57XiYSH2oI7U00uj6xnyUJlv40ouAdU=;
 b=sYmLzP8AiMU1ifKBJwaqOLThvPwSXhION5hy2J8TD3jX+TOTprWjJXcULu3i0oC3Odo2P17JF3wqMn2E8v7veHyq/JHjSfyZ9U4dwBvKCvyTrCa9av31H010NckYuYpHRk7UiCN6TRc2HkHFsTML3JEzwUUr2fqJeOotrRZOsCsIpgelkv6rPZPFPYIEqDtZo4gdZikf9XlviPS4bYOZxOpPkaYjnFb9eT9KD1f7o3jCFrT0ZR5sb6Wf9BAKoZvGE1NJGv1M4jLwPfWr+ekCafditnAMUayqB9rimNgdRev/2+v7jZIa9kI+A87e6ZQ0ptunhGduK3yXT2pQz6hnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49fr/6N9bUsF57XiYSH2oI7U00uj6xnyUJlv40ouAdU=;
 b=5vCoy9til+Oqc3/FFeIVtSpqGRowGCKhJOvUtiWR+tp4F61C5zmx6tgI8V/O9cHxndMekw5bGkmww8ZvwmmnOvGwKNBcgoP4Y/U64/njuiknfe9yjQdnTwMepUSfKhXk8WEjsMMYKAs6x/ybuOmBkKPMREzI9HpNffU3pFE8FXK8XODx3sYhNsri4A5bj8ohc/tZzYdMzNsNWASSM7n4e3+z7xXm5SJWbiDvVA171kCCCmAVHPrFaqHnRiNk5Q+0nzglnPG/EKJ50PwVTbxnvb0G8o+dnvd/6KcLKoumktSidiB+HNEGvuY1UIBTqbGLMdMUQUOM4Z6VVklR2wpF4g==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB2150.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.55; Fri, 24 Apr
 2026 12:32:51 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 12:32:51 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Erik Wierich <erik@riscstar.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio
	<vfazio@gmail.com>
Subject: Re: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Topic: [PATCH libgpiod] build: replace autotools with meson & ninja
Thread-Index: AQHc0+Z3jHISL2uef0ezBNUqJXo5Uw==
Date: Fri, 24 Apr 2026 12:32:51 +0000
Message-ID:
 <PH1P110MB16037AADF6BDDDA501B241AC9F2BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
 <PH1P110MB16037F48B385E4CF1C42ED569F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMRc=MeXo33fUWXYEcPnFOYrvOtYiefnzX2T=9dMSkWvACG1_w@mail.gmail.com>
In-Reply-To:
 <CAMRc=MeXo33fUWXYEcPnFOYrvOtYiefnzX2T=9dMSkWvACG1_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB2150:EE_
x-ms-office365-filtering-correlation-id: 7e5c653b-88a1-47ca-7e15-08dea1fd9a00
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|56012099003|55112099003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 1VisWZDrS9WAIlRR77hMSa2yf8ufj6wspfIKzl96enUWqbk3r2rWu+jpwanT83KmnQtiPTxIH21bcydaesASSOd4aO7FnZ81UAoVQxVQYon5yZvqHen50CDu8F0u5PAmfU2WQ5t4V9OaPm14yU8mBwvVmBzS4Yoc7oivsn8zvBfba4hYJf6evyq+n8b7lrnYICNK8woBxLjh8uyk3kcYr0mgsXategSdaIs/EqaUsMbOH14WER6IGnpnqqlCnfmour4SVj6L7xxyEpdC/0h803ioprawvp9iewj+D5QQtkL1w2E2Ty2VIoWg3tsrZ3o+XxGwMhVlKSXS7jiPuvEBWb4upIjEP3HvwdVlIJGS3/FCd7bAVsvhgoyOpbICBI/rgoX6vf+rk1G6jROOmOp78F/Jd3tzvtokPxHQdFB0q0brO4n/Vq+yvwgBO2l1UwoqssAGMFlIhYVdOYpQhy1pkVFq62tfcoSf2sp5D4mYYr2QkJe/92evb6mITNjSIOM95dgqrdua8ddQ/Ttdg3P6Yjc/8LbPAcbc2Z6E5sRoNE6hiXWpSOjn7QEPJtuKMuOjZn8ZMVfHi0wLjOvyw1i8Kc1Nd9Ty03RIxRDitAVxder91WSz/fA1FBrDo8roZ7WFtBGLLDJ0YbYwzWSxuUv8d62DMbVpK7hyFW/6S+Mr3nVgYQpCl6Y1nD7NsrdmAqorirPcomhnC32qTJhoGPXsMoMUvr7KiFiWhPQf20I95y9zX4vsCFpTzleiZUyW9/p7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(56012099003)(55112099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjVHWjJZb09Fa3FtSnV2bE91R2p3VjUvcGFMYUR5TWMxNnBKZkphZW41dHZB?=
 =?utf-8?B?Vmh1TXlFcmE2cmIxejFUaW5FS1FiTUFkZmJHQTgvSlVrcDNSd0JBQ3F1TlNZ?=
 =?utf-8?B?dnU0L2pOclJQTmZvVHdqNCtUbEtkazhxUU5YeXd4TlExRzhMOGw1QnQ1bEZa?=
 =?utf-8?B?UzdURlVoZmxyM21zbklhakZjMVh5WGVVdC9PeXZYSFQ5cUR1Z1NyT09MUWd2?=
 =?utf-8?B?cm5ZbDdBeU42eFNteDE4QmxObS9MRVhFQzF2YWlaaGFGZ1Yvb2wrSFhGeVJk?=
 =?utf-8?B?MHV2SitIcy9PaVh0d0crQm81M05HdVRkU0YzMTRzZ3l4R3RoZ3pCRkVEWUpz?=
 =?utf-8?B?ZitFZThqZmlrVHBRVWhyMExvZDFtRjlMZmpVOExHcmJVcGtCY21aVG1OTXdy?=
 =?utf-8?B?WmwxSmptUitCd0RaSWhWbmRadWF4UHowbElyZ1ovUkhOSG45cjNJSU01TXNB?=
 =?utf-8?B?U3JPa2JHT1N3UTlVUExLczBEU2M2cEdOd1VjZzhnNmhJVVh1SDhLVWZJdHJa?=
 =?utf-8?B?QWZ0RUxybTUzdmQrV0hveXBPOWs4T05veUE3N0wxTnpRSzZxS3grdDdPektE?=
 =?utf-8?B?ek92YTBpS3NkWlFkRlhTL1BZNmFTSFBkdnFtOXNJclNaT0JMZ0ZJNUtYdU9K?=
 =?utf-8?B?QW1CVjJpVjY4c1hadUlPRDhVKytKc3B3MGQwb200ckZXNkJ6aldmQTRKRXFF?=
 =?utf-8?B?SG4vclRHTWdMTi81VnFHM3JrSFU4OFp2dm1OMFlTcUZBaGtiN2VKRHBneHBK?=
 =?utf-8?B?YllyMDkvWC93QjVDM2ZydHhTM1ZQUHV6aFdaL0U4b05lZlZlWjNMQmFZdW0w?=
 =?utf-8?B?dTFIbkp0anh1Snh3SGlQalM5MzZaOHMySitqRUkyNWY0QzR1ZjN1WDdjMWQw?=
 =?utf-8?B?bmlvZzZSUVFOdWNqTmNxaDB1YW5qcE5TN2ljdXhGMzIwU0E0VjNBYmxDTDJF?=
 =?utf-8?B?WjZVb3FzNXpNUG5VZE9YWGFFVGJNSWF5K1IxY01Qb09wSE9pNkhLU3R0Qmg4?=
 =?utf-8?B?WmJhblB1Rk5JblhXSXJTVEUyN1N5WUNDZE9veENYQmFwU2FVeXdraTN1eWJO?=
 =?utf-8?B?MDJicHJDWXgxbGVKNG9sUk1iSkhoNWtISUEwWDRTUFUwUVptL3pxTWthcThH?=
 =?utf-8?B?UGE1ck90eTh1SGNrdmFFblNCdFdTSDFqcnFiak1hL1NLUUs5ZlhidXRZMmlD?=
 =?utf-8?B?OHl2U3RaUVBqMW5hdjE0L09CenViNWlRZGt0c0tZdjUyWkJwdHhrcGljay9K?=
 =?utf-8?B?SGZEQmFEV3lRME1kbVM4NDlQdkVHOVMxblVlUWZEWkJYYklyNWo2V3VJc24x?=
 =?utf-8?B?NEN4a2l3QldRNmhRVmlXYzRBUTErc0NzVHJkbkNESjY0eVJpSjhEWTE2YVVh?=
 =?utf-8?B?NDdQNWxDMG03cHc0N1l1QkxvSjZQaHBMRTNWcWVGMU8yY2NDRXl6TktFNEtR?=
 =?utf-8?B?NVFIUVpZRlNVaFZ6S0U1OHdVNkMyU0RIS25YRUxoRVlYb2dDbG9hczZrOTZ4?=
 =?utf-8?B?a1pxQXkzbEMxTjN2a0h3Z1BIcU81aTViRHVyMkNkT1lmcVVlTUFJZ2c0OFln?=
 =?utf-8?B?RnpqRnpoNnRuSUlrdTlSNy9NQ1NsTGlOUkZrSzJSVVFUY3QrV3c0M0FwbXpI?=
 =?utf-8?B?V04rWW9aV28zM2hXdHRjcjFTWkhZc29yTmoyT0FvZE1pYitSSFVRR2hXcnlY?=
 =?utf-8?B?RUw4MnlYUFZDdkdlZ01LZ0Jkb1pnSHM5Zk9ydXNIRE42ZU93VGhVdDZZanlh?=
 =?utf-8?B?bzlsTXVmZTZXUXZFaFhFbHd2cjZXZEw2RDFibHFBYzdKeitiQWFOTFE2L2k0?=
 =?utf-8?B?V1JIRGM5c1Z3b0R6WkZ5L05OQkpVM2tLZmZRR2Z3aWRNcno3L1RmZmNaSStu?=
 =?utf-8?B?WnQxMFdVNWhrNFI1cEYyQ1gweWpSZ1NqRnB4WkFVQ0xrbklCaTUrOFFGTXBh?=
 =?utf-8?B?OE40Nnh3SEROemQ0SVNBMzRRcnVUMUpkMDVDVFpZYVpRa1NqcWd0ODlmM3NU?=
 =?utf-8?B?Yys5amorMHlseXptSU9nR3RvbklpWi84NUhxU0lRQ1pjbi8rOGwwczZLTDYv?=
 =?utf-8?B?N3hNV09OdzVEUHV1eFBlL2g4bG1xVHF2TCs4cVZlKzhnejlVQnNYSjEvd2kx?=
 =?utf-8?B?UU9HS3FvY2pmOFFRZjFyVUJGK2F4bFNKVTJzS1JPUkN4SGxwb2dCRnNMWnJ2?=
 =?utf-8?Q?blShQ21Lk7tmB/QC8kMfW8OBMbNgKw7pKMz5EbAI/iWT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5c653b-88a1-47ca-7e15-08dea1fd9a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 12:32:51.5237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2150
X-Rspamd-Queue-Id: 9A07D463187
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,riscstar.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35512-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJyZ2xAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCAyNCwgMjAyNiA3OjE1
IEFNDQo+IFRvOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQo+IENjOiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+OyBM
aW51cw0KPiBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz47IEtlbnQgR2lic29uIDx3YXJ0aG9n
NjE4QGdtYWlsLmNvbT47IFZpcmVzaA0KPiBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+
OyBFcmlrIFdpZXJpY2ggPGVyaWtAcmlzY3N0YXIuY29tPjsgbGludXgtDQo+IGdwaW9Admdlci5r
ZXJuZWwub3JnOyBWaW5jZW50IEZhemlvIDx2ZmF6aW9AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBb
RXh0ZXJuYWxdIC0gUmU6IFtQQVRDSCBsaWJncGlvZF0gYnVpbGQ6IHJlcGxhY2UgYXV0b3Rvb2xz
IHdpdGggbWVzb24NCj4gJiBuaW5qYQ0KPiANCj4gDQo+IFRoYW5rcywgbWVzb24gMS43LjAgZnJv
bSBkZWJpYW4gZGlkIG5vdCByZXBvcnQgaXQuDQoNClNvcnJ5IGZvciB0aGUgbm9pc2UuLi4gYXBw
YXJlbnRseSBteSBidWlsZCBlbnZpcm9ubWVudCBpcyBzbyBvbGQgdGhhdCBJIGRpZG4ndCBjYXRj
aCB0aGF0IGl0IHdhcyB1bmRlcHJlY2F0ZWQgc3Vic2VxdWVudGx5IFswXS4NCg0KDQpbMF06IGh0
dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL2NvbW1pdC8wYzgwMmQyNjBjOThmOTkw
YTMyYWQyMmY1NWEwNTVhYjY1Nzc5Y2NiDQoNCg0K

