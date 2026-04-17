Return-Path: <linux-gpio+bounces-35203-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKgRH0XN4WkhyQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35203-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:03:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86A4173C9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 08:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 601923021EA3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 06:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5F3290D2;
	Fri, 17 Apr 2026 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CrMp6x1M";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZMzRZCzy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68246238D54;
	Fri, 17 Apr 2026 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776405779; cv=fail; b=IcUCvYcRKqmgTpY4/ZzJtaNzEwznG5rD3Lr0SPyXTvRa41odISkJ/buRagfM/TuaapgApgEzcFk8lms21ItxSFhUmjy0k6IN1xEgiXTVbzFQpQ1KD+iitnnRw8+2e0J4Trv9hFdYCTlwfuZhJUWRv9uBfKwi2MpRKIU1oYlzlgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776405779; c=relaxed/simple;
	bh=DhNlQ/POmlX6VqamgZDYFrsJFpW7n4om0R3x4RCDnQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IU5WTV2paepNseezKDLVLTP3NpdNW/qy6jsdwindnw4s9+LzM4PN86+5TAb5Tis6Pmhvcwv4xn4S4bI3bpneRf5p0EPMKwdmJzkdTsW7duv7J6cpXlFu9TuHAhHDA1yqTujjgWfCdyOvFBY9UuKZlVgDnby+LE+CqMjbddLoUJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CrMp6x1M; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZMzRZCzy; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 09d98f4c3a2311f1ae70033691e9ac7d-20260417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DhNlQ/POmlX6VqamgZDYFrsJFpW7n4om0R3x4RCDnQc=;
	b=CrMp6x1Ml679Pl2PfSxC7EPpRTImGmXqkGlWqsKL/Kl9106YqbmTh1RFedq7IcpB/qwtNCkM91Tetb1O/rYW5KoSUVW5+G53mku6/241LdI+oNePz8aw+6xlLy8XFKO6MOrLkPT5gHaCNBobAPwT8jKavhdq6OrsfM/i6cNHWzA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d18bc503-30e2-4699-94f7-2fe97af4811c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:525cf824-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09d98f4c3a2311f1ae70033691e9ac7d-20260417
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deep.pani@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1280360579; Fri, 17 Apr 2026 14:02:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Apr 2026 14:02:37 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Apr 2026 14:02:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IazQb4+2NVJjbO24CB4EgOhluMAviiv5Oo8413keLJLF4V24EqNgF6RqLges8nDl3pb4u2HGiMW8KcCtvo9V15+joKH36rJv07/U7q40Z5UJusCvyOUoeD70TXQ7qZ6VGK5nS/miwCF3OjsCTMpf9+d2wJWaiUbNTkmSU6FmYUl8n/z/a1Sv9O2+GwEovesqyiNvAr1fNcaa4M+qJxMJvON7lUn6j9KBZv/ZugDb67qhEOvpyE0DMbAZfOj9mTAZwu05D8+By0gcebbGBgGlItxwftbGTQkP8DoOGWtHS4O2MAgLyGT1ZiZF/4RSfo9VIckk/GvNZdj1kqJrQmG+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhNlQ/POmlX6VqamgZDYFrsJFpW7n4om0R3x4RCDnQc=;
 b=M64qBmzy/QJA5envBEZyK4xLQDHqra50x0CrgOymkTaMSu6LlJUt9Ikn0gZ+swUK4yFYH/1/Q7fTsTlhV9QAeKKZT2PHYS+QNUXxaYZTWlFkaQdkr0g7Fq7j9snsLDncg0rw6vSOlbLtuu3t1D16yBAj9ahztse/SZ2r9fM+tBciHZulf+G916yxMNNr0aHqeo1I8Sy0DqHuDlJHkXmtyjPXEkPcCpwe3Fs3VrIQjz+ZtpOE1A8oqPPePEEgKTbyn+EF9RETXVGzmxQYTdYc1xnb+Ok04/uitMNt8MCALBGQNbFkBk6D2yAkZtZ4o1PvTqXYKEvJb2HyQgiTEk086w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhNlQ/POmlX6VqamgZDYFrsJFpW7n4om0R3x4RCDnQc=;
 b=ZMzRZCzyYrP2JOKY9ayfx5c78WhEk0Jtw7Uo7rlmPR98znUPpP99/qHGNR3oFUpS9nOLKbWX4in5Ftfd17fkpDCJwMAJrVqBrZqu5Ce2x68tdt7ZKMP/xnHEl5aZS3VkLLOveZr8cj1prd0VWmRwodiJr4qA8H2VEYFKpfr396w=
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com (2603:1096:301:118::11)
 by TYZPR03MB9790.apcprd03.prod.outlook.com (2603:1096:405:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:02:34 +0000
Received: from PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f]) by PUZPR03MB7160.apcprd03.prod.outlook.com
 ([fe80::b818:8b46:8a66:349f%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:02:34 +0000
From: Deep Pani <Deep.Pani@mediatek.com>
To: =?utf-8?B?RnJlZC1XWSBDaGVuICjpmbPlqIHlrocp?= <Fred-WY.Chen@mediatek.com>,
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>, Mandeep S
	<Mandeep.S@mediatek.com>
CC: =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	=?utf-8?B?WWFveSBXYW5nICjnjovnkbbnkbYp?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?=
	<ot_cathy.xu@mediatek.com>, =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>, =?utf-8?B?WWUgV2FuZyAo546L5Y+2KQ==?=
	<ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Topic: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Thread-Index: AQHcXbRYlgbtaZ3Ir0OupF8D0DojabUFQ3OAgLw6jICAAaMYgIAggwwA
Date: Fri, 17 Apr 2026 06:02:34 +0000
Message-ID: <892cb5455b0306edfb98b3c7df99b88c58e303a9.camel@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
	 <20251125023639.2416546-2-lei.xue@mediatek.com>
	 <aSdBt937C6Cjj_8s@black.igk.intel.com>
	 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
	 <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
In-Reply-To: <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB7160:EE_|TYZPR03MB9790:EE_
x-ms-office365-filtering-correlation-id: 752bcb42-044c-41bd-8729-08de9c46eb6f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: cKiBE2eTN7WrZblcNSKtI1w7YlES/MQVH2nbJPUmM8xUu9rIZrfNYPNyyMHy4sDy0g7TNQXsLyMkJYEFzEGhVxn+2p+6kU5pMDYbAPiB49+E53phMJuZkNXHb+GSuSNvOL6yb9PRIEqTxlSQ2uZf6/GgE9YsBRwiHzTu2meTKwCUViDwAA3knV6opaDdeCF3slBpYi9RrtZvz+3jjdHoU415R8+UHBjO1Zchg8wEgTpTujbUTiFVL5LTaV3Qb25f4bMJ3uNTTBnHi5C4j+RsK2N+sCP8U2szu9HrBmQvHUsfgZ1Sd6VWmwVbzqiltdFRjbqwe9GW26LMamX/ezjJKsKGn84qWVMRrh18ZvtSaeEh0DOEtGVABlYcqlrSjVC7+2plgcPgBbArPr1dL8fX6JTTETbrvCLDv26Kd28HcHgHBqT8IxWu1bDMBva09SoCdwlMS4wfOmTB/S2FKCmS1lo9K5yrY/3/kU+Aatc91COflSJ4ip7Kll140kIbZxu5Q/Y5Y880Gl9D7IVA+lYt+lcy3OOG+IV1IhliS34p7jrpQz9nAxTIXZSeglVQki9O3Jbl8ZuwXxtRjwRabQ5a2UUtjxZf/Qzj9uiHe5GKkV3SCuOSOkkKfhyigMz2CHSfzk3zyMlWOCa1T2GfCQS0KqWQDGPvKJ0sdHHHwgExLd+VtsVxOJ3a/xWOnR8lp0iXVGTk8m+9sXR0jINaBeyv1opScM/Ff2zh6+xtcjsHcyHgwVmJ0GYzjvCGxlU+4WiIf5zj8QBqU+DgHe2L/lyoKmZXpzNmJDTn+aTqnpB2dvQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7160.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkcvVDl3bFFLdSt2M1RDWkRLZ0sxdytXM21aQ0UrZ3IxSUkraHZ1Rm85OXk3?=
 =?utf-8?B?eEd3dnpVZDEwa1VnR3JDaTg2Qm1IUVNpY2JKL2pvMWpIaE9kd1hFWmxBWWJD?=
 =?utf-8?B?cjdqdHZaNnNFdCtPdE1uOGhqYzJqdXAzQnU1QmpKWThGc2NOK1I4K2FjWDhZ?=
 =?utf-8?B?MTRteElPcmdSL0htNURyNkkrMEFWeDJlQWsyYnVBNDN1Ty9rb3dpbWNob2NG?=
 =?utf-8?B?dDhIbjdPZ0lMa0Ewc1AydW9HVk9NeHRaOVBQTWVxSGo5VkFvejAzWWlDREJ3?=
 =?utf-8?B?T3lpNWdaRW9OL2dVM2xrRHlxd0RKdHNRZVNQMEZSOWQzT0Jjb2lzT2ZTUU5a?=
 =?utf-8?B?eklOMldGN214akx6M1JaeXR1bzdUQTN2Z0hDUkUydHlKMUFzY1ZZWS8rRksv?=
 =?utf-8?B?VnBaUXZxSFRCUTFzY1lucXlPZTRvdTdyUC9sNjljdTZuMEc2Yk5VbjBHSWlF?=
 =?utf-8?B?MlEvbnc3dXZoQjUxRXplU1BLdmdMQTJpNnRSS3JMUW1xTDN0K2ZGWVlpemY4?=
 =?utf-8?B?UlZYRS9xb3pDbnhBbXJhemhYVlVZQ1RVWjBKME9FdWNoTnN6VU5SU3NtV2Ni?=
 =?utf-8?B?YzJFTlYxajlIcmRXbTVVSDk5WjIzaTJOTWgyOURDa3JlZXZEaS9nem80L0xD?=
 =?utf-8?B?WlZFdGoyZURUeWJmbkFVLzNkZkRPY01ZczE5Q3AyMVlJU0ZEa3gzQ096WjVn?=
 =?utf-8?B?OC8vUHJMWlIybSt2SktuRC9GYVlJMk1OZ3Z3cjBkRzhUU3JpNVVlVytkbTZr?=
 =?utf-8?B?SEJUQnFGUHFiWEYwbTM1akZyaExuWkxLRk8ya0pxMFZOMlpYTCtmSUxRRWpm?=
 =?utf-8?B?RlNUMHVkeklpRDFjcE9qYjJzb01rM3RYRk9BVjc5YkpaYzJxbGFBc09SK1FX?=
 =?utf-8?B?Rnd4Y3pWbUdsQ0VycDVQb0FnbXF5akROSCs4aldBMW5hTDk4K3hubWM0SEdu?=
 =?utf-8?B?V2V5UDVEZGJGV1p2dzRkWVhzdlVlK0xWbkMrT1FGNHp5eXVUY1Jab0FqZUl0?=
 =?utf-8?B?TDdxMG95MXVKQjZzKzRjUzBHSzFrS2xpMVV4OUU2WnpqSWV6d3lJOHBMeG9V?=
 =?utf-8?B?TUkyY09ZcEJPRnlQM3RVU1Ara00vZGx1U2lINWVtOWxVblU5WVU3bytBSUJw?=
 =?utf-8?B?cVRiYkpSMjFDMytxbWkvZDhSYllXYldRZk1sUytQNlZJMEdIenZTSk82UWNG?=
 =?utf-8?B?WjlkaUlyTjVzYXc5Yys2d3daMWlPN2pkbUtQQm5hVXgxQzFoTkdLeUg4emFJ?=
 =?utf-8?B?ajFtK1VwNmlHbGVuOWhQVlJZeHdmYzgyZEhEdEc2c2ZLY3dwYVVvN25sNks2?=
 =?utf-8?B?L0VGOW8zczBSSlBlY3lKYzI3R0hTVnF6MmhkUlp4czdSQ0dDNFJDdGVZVGI1?=
 =?utf-8?B?cFF4OUdYNjJ2Mkk0MktZOVRXS1lzTEp3UWJESko5aHd4WTlpbWRRbEoxcTNK?=
 =?utf-8?B?bFdiRHJUdStjcW9SRWx4MFBZNyt6MUwvRndZUEtQSWJzNnEzdzJHbWxPSHBk?=
 =?utf-8?B?N2dPL242UVFUTmZieERZbHB6RU9IOFFoNXFuYVdRVC9jNEhNbFJ2b3p0UUVT?=
 =?utf-8?B?RmZRZTBJTE9sZGlVWlZraXZyamlpbnE0SytDWUFNK0k3WHBlQU5MRjlxRm80?=
 =?utf-8?B?RG1tdGRrait6M3R4S0p1VlBUOFJDcDdERmlxUVNNVExQTlNmenAzdzlkc0RN?=
 =?utf-8?B?S3FVdHFFdUhOUzlza3FOb2s1djZHVHhleWVBb3BCRnBMaUtpc0ZocXRabWZS?=
 =?utf-8?B?OE84MnlVYnN4a1NabnYxMWF6SS9RUVNqYXREUTFDYXY1eVphZzk1OW90akJL?=
 =?utf-8?B?NGhrVTFUM0VEeEhwazNMeG9EclFkM3JoaXR0Z3cyWXRzc0tYYXJiQnRVWDd1?=
 =?utf-8?B?SDlldUgwa3R1eGpnMzRub2lBTC9LRng0bWNEeFdJZ0U3Y2J2cytSNmpVb0lp?=
 =?utf-8?B?a2N2bkJGaUk5RGRqeURMMTl4SFI1SWM4aHdLcG9DcFdxOThKZlVZczg1Y21J?=
 =?utf-8?B?cFgyWURySGt5OTF2Q2lOQ0c2TGpab0ZRZFZJNWhBN3p1OHh5OXQ0NEg1RTI2?=
 =?utf-8?B?OWMzR2QzME5jdWc1VmdmTjYyTHE5RUF0WnJUdHY5OGlWY1VCaHRkcnVkOFZ4?=
 =?utf-8?B?WlMyVXYrNkc1OEdNd1ViWkM0QmI4MUFFRzRZM0o5bm5uYXdwMlFkbW9kYkxK?=
 =?utf-8?B?NktCNCttcVdLaVJ3QjRycWpISWVrRjJ1c1FJdk9FYUtPbmVEZUFRMVUvaU1B?=
 =?utf-8?B?WDg3QnZXRWVPdGxieVRLSnZnd01yZU14RWRGd3Eyakp3QlZrUERyKzVLNXdv?=
 =?utf-8?B?NDNqS0lNK2lDSHlrZTJPUFcxUDNJTE5jR1U1bVhvMlEvZnZ2cGpkM2R4UjA5?=
 =?utf-8?Q?V6NjVNLRAYfSOLZg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <541089719F539A4188797D4BB1D8F053@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FV7+eXp9Zedc8xYngxKDceXHiSHRGQ0n6vefys8D8Qida/Uoxc6/wk3SxHVYTvGv2hfDAoHHL1hBGutoUQfrehucTTsAM0IH/VG2fuBcIX0PCkknqeierkQvqm/2tq9E8RnmdkQPWej6VY/UNaroRBFpZyK28Aw12fMg/kEP7PKWpMjv30zi5Lsy8wPYh7eN3EXQJyD0T5ah6qRRDv2X1GvU1YIUK7T+++O0m2V10zRdHKhqOdofkP21x738Q+B3FfNMw8kq8yaXVOVjlBWuhEIsxqp+hSFWb9Kzg1u3n/GyHuFVHmacHcCgf/wiPMNRjmTvt6OTT+jI+bFYzgWGGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7160.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752bcb42-044c-41bd-8729-08de9c46eb6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 06:02:34.4510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omZiwFi2wkDql+1H3ezQF0I8Pfyk3ms12FRMvvv33Mp8Q0ZmHlwP9W/u3rpBnPa0XDnWY88rOp0gq0ZmHKOX2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9790
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35203-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,collabora.com,vger.kernel.org,linaro.org,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediateko365.onmicrosoft.com:dkim];
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
X-Rspamd-Queue-Id: 0B86A4173C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5keSwNCg0KQW55IHVwZGF0ZXMgZnJvbSB5b3VyIHNpZGU/DQoNClRoYW5rcyBhbmQgUmVn
YXJkcywNCkRlZXAgUGFuaQ0KDQpPbiBGcmksIDIwMjYtMDMtMjcgYXQgMjE6MzMgKzA4MDAsIERl
ZXAgUGFuaSB3cm90ZToNCj4gSGkgQW5keSwNCj4gDQo+IFlvdSBtZWFuIGdwaW9jaGlwX2FkZF9w
aW5fcmFuZ2UoKSwgY29ycmVjdD8NCj4gDQo+IElJUkMsIHRoYXQgYWRkcyB0byBncGlvY2hpcCdz
IHJhbmdlLCBub3QgdGhlIHJhbmdlIHdlIGFyZSB1c2luZyBmb3INCj4gb3VyDQo+IHBpbmN0cmwg
ZHJpdmVyLiANCj4gDQo+IFRoZSByYW5nZSB3ZSBhcmUgdXRpbGl6aW5nIGluc2lkZSBvdXIgaGFy
ZHdhcmUgaXMgb2YgdGhlIHR5cGUgc3RydWN0DQo+IHBpbmN0cmxfZ3Bpb19yYW5nZS4gVGhlcmUg
aXMgbm8gY2FsbGJhY2sgaW4gZ3Bpb2NoaXAgdGhhdCBoYW5kbGVzDQo+IHRoaXMNCj4gdHlwZSBv
ZiByYW5nZQ0KPiANCj4gSSBhbHNvIHJlY2FsbCB0aGF0IGdwaW9jaGlwX2FkZF9kYXRhKCkgZG9l
c24ndCBpbml0aWFsaXplIHRoZSBodyBidXQNCj4gcmF0aGVyIGluaXRpYWxpemVzIHRoZSBncGlv
Y2hpcCBmcm9tIHRoZSBodyBkYXRhIHdlIHdpbGwgcHJvdmlkZSBpbg0KPiBtdGtfYnVpbGRfZ3Bp
b2NoaXAoKS4gVGh1c8KgIHdlIG5lZWQgYSBmdW5jdGlvbiB3aGljaCB3aWxsIGhlbHANCj4gaW5p
dGlhbGl6ZSB0aGUgcGluY3RybF9ncGlvX3JhbmdlIGluc2lkZSBvdXIgcGluY3RybCBkcml2ZXIN
Cj4gc3RydWN0dXJlLg0KPiBUaGlzIGlzIHdoeSB3ZSBtYWtlIHRoZSBtdGtfcGluY3RybF9ncGlv
X3JhbmdlX2luaXQgZnVuY3Rpb24gaGVyZS4NCj4gDQo+IEZvciB0aGUgc2Vjb25kIHF1ZXN0aW9u
LCB3ZSBhcmUga2VlcGluZyBpdCBiZWNhdXNlIGJlZm9yZSBBQ1BJIGlzDQo+IGludm9rZWQgd2Ug
c3RpbGwgbmVlZCBzb21lIG90aGVyIHBpbnMgdG8gYmUgY29uZmlndXJlZCwgZXNwZWNpYWxseSBp
Zg0KPiBkaWZmZXJlbnQgcGlucyBoYXZlIGRpZmZlcmVudCBzdHlsZXMgb2YgcHVsbCBjb25maWd1
cmF0aW9uLiBUaGUNCj4gbWV0aG9kDQo+IHdlIHVzZSBpcyB0byBkZWZpbmUgdGhvc2UgY29uZmln
dXJhdGlvbnMgaW4gdGhlIHBpbmN0cmwtbXQ4OTAxLmMgZmlsZQ0KPiB3aGljaCBkZXRlcm1pbmVz
IHRoZSBncGlvIHJhbmdlcyBhbmQgbWFwcyBwaW5jdHJsIGRldmljZSB0byBhY3BpLCBvbmUNCj4g
c2V0IG9mIGdwaW8gcmFuZ2VzIHBlciBjb25maWd1cmF0aW9uLCBmb3IgZGlmZmVyZW50IHR5cGUg
b2YgcHVsbA0KPiBjb25maWd1cmF0aW9ucyB3ZSBoYXZlIGRpZmZlcmVudCBncGlvIHJhbmdlcywg
dGhpcyBjYWxsYmFjayBoZWxwcyBhZGQNCj4gdGhlbSBpbnRvIHRoZSBwaW5jdHJsIHN1YnN5c3Rl
bSBzdWNoIHRoYXQgb3RoZXIgZGV2aWNlIG1haW50YWluZXJzDQo+IGNhbg0KPiBlYXNpbHkgbGV2
ZXJhZ2UgdGhhdCBzdWJzeXN0ZW0gdG8gYWRkIHRoZWlyIHJlc291cmNlcyBpbiB0aGVpciBfQ1JT
DQo+IGNhbGxzIHVzaW5nIHRoZSBjb21tb24gaW50ZXJmYWNlcy4gDQo+IA0KPiBUaHVzIHdlIG5l
ZWQgdG8ga2VlcCBib3RoIHRoZSBmdW5jdGlvbnMuDQo+IA0KPiBUaGFua3MgYW5kIFJlZ2FyZHMs
DQo+IERlZXAgUGFuaQ0KPiANCj4gDQo+IA0KPiBPbiBUaHUsIDIwMjYtMDMtMjYgYXQgMTI6MzMg
KzAwMDAsIEZyZWQtV1kgQ2hlbiAo6Zmz5aiB5a6HKSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjUt
MTEtMjYgYXQgMTk6MDYgKzAxMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiA+IA0KPiA+
ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIFR1ZSwgTm92IDI1LCAy
MDI1IGF0IDEwOjM2OjM0QU0gKzA4MDAsIExlaSBYdWUgd3JvdGU6DQo+ID4gPiA+IEtlcm5lbCBH
UElPIHN1YnN5c3RlbSBtYXBwaW5nIGhhcmR3YXJlIHBpbiBudW1iZXIgdG8gYQ0KPiA+ID4gPiBk
aWZmZXJlbnQNCj4gPiA+ID4gcmFuZ2Ugb2YgZ3BpbyBudW1iZXIuIEFkZCBncGlvLXJhbmdlIHN0
cnVjdHVyZSB0byBob2xkDQo+ID4gPiA+IHRoZSBtYXBwZWQgZ3BpbyByYW5nZSBpbiBwaW5jdHJs
IGRyaXZlci4gVGhhdCBlbmFibGVzIHRoZQ0KPiA+ID4gPiBrZXJuZWwNCj4gPiA+ID4gdG8gc2Vh
cmNoIGEgcmFuZ2Ugb2YgbWFwcGVkIGdwaW8gcmFuZ2UgYWdhaW5zdCBhIHBpbmN0cmwNCj4gPiA+
ID4gZGV2aWNlLg0KPiA+ID4gDQo+ID4gPiAuLi4NCj4gPiA+IA0KPiA+ID4gPiDCoHN0YXRpYyBp
bnQgbXRrX2J1aWxkX2dwaW9jaGlwKHN0cnVjdCBtdGtfcGluY3RybCAqaHcpDQo+ID4gPiA+IMKg
ew0KPiA+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCBncGlvX2NoaXAgKmNoaXAgPSAmaHctPmNoaXA7
DQo+ID4gPiANCj4gPiA+ID4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkNCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4gPiA+ID4gDQo+ID4gPiA+ICvCoMKg
wqDCoCBtdGtfcGluY3RybF9ncGlvX3JhbmdlX2luaXQoaHcsIGNoaXApOw0KPiA+ID4gPiArDQo+
ID4gPiA+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+ID4gPiANCj4gPiA+IFdlIGhhdmUgYSBjYWxs
YmFjayBmb3IgdGhhdCBpbiBzdHJ1Y3QgZ3Bpb19jaGlwLiBBbnkgcmVhc29uIG5vdA0KPiA+ID4g
dG8NCj4gPiA+IHVzZSBpdD8NCj4gPiA+IA0KPiA+ID4gPiDCoH0NCj4gPiA+IA0KPiA+ID4gLi4u
DQo+ID4gPiANCj4gPiA+ID4gK8KgwqDCoMKgIHBpbmN0cmxfYWRkX2dwaW9fcmFuZ2UoaHctPnBj
dHJsLCAmaHctPnJhbmdlKTsNCj4gPiA+IA0KPiA+ID4gTm90IHN1cmUgaWYgdGhpcyBpcyBuZWVk
ZWQuDQo+ID4gPiANCj4gPiANCj4gPiBIaSBEZWVwLA0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVh
c2UgY2hlY2sgdGhpcyBhbmQgZmVlZGJhY2s/DQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBGcmVk
LVdZIENoZW4NCj4gPiANCj4gPiA+IC0tDQo+ID4gPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gPiA+
IEFuZHkgU2hldmNoZW5rbw0KPiA+ID4gDQo+ID4gPiANCj4gPiANCj4gDQoNCg==

