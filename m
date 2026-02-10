Return-Path: <linux-gpio+bounces-31542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI/DMh7Qimk/OAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 07:28:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 196251175DC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 07:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F6D13011C67
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 06:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC7432D0E6;
	Tue, 10 Feb 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="VteyAKJV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022141.outbound.protection.outlook.com [40.107.75.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081032C309;
	Tue, 10 Feb 2026 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704922; cv=fail; b=pFDxfLNM4pFr7f+j0wXNQiWxA7yncicGQQkNjBeWKY6vKYRuoOQCwb66yjesCR88gBV/12YAwXkqhA5ALcSrFt2anRmAhEvzBcg7Ac9MITJOkvS/hmZqJPRr/K6VqJAXAXyg5YI7VBb/iTahs004UGn87HkI7f7pD64U9lKgt0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704922; c=relaxed/simple;
	bh=SI9/wCYqjDywNk5QukKszejpo1veOwu0ao+PaGkMhDM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ar1oP8CrBUMzcsKlRWywyEtbuVOQg5ISbWZGXQwIuzLkh+pgk6C/pgFvYq4nL77jhSeTX8M9sgztGvY2s+gqsWiiDSuxBxmb1BuOkMDUfldvkyen6RWOBh8DMydPkBrW1G5933sKq0Krc3QiiGVGlYT7Ty+0SR+3NJiopTRsaWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=VteyAKJV; arc=fail smtp.client-ip=40.107.75.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPEVqB4jEFjI9iGFf1pccWsMj4b1JiYT2+DGplBlFwraYR+EKPnrrn18Rja3fsCtoUBDc/oo1xSchbC7VKQRnplM3IO5rydlqxJt7U2I/CfeTJmmNyXB5jc1Mmo9g41WExCc5rchMk6loWKD2QmOCUbJqdfeIiRlgkxJ0g/To7IUJv+ZCUnhp6Avbm+W9fM/a33jcaPmGIh+GnR1nyGz5SWovu0cgTf+xMjq0d82vWT9hT9mnV7r1dIb+CU3jl3xnGazFSRUr1UCIlaP+Gnv1jZqdD/r2GOVfrYXRFVJUiLZPco98hG2Qv2TwR5at8jUAdo1c6LAnPyTWsZqN1GL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI9/wCYqjDywNk5QukKszejpo1veOwu0ao+PaGkMhDM=;
 b=mdUBqX8P84Hse0o0Nm5KDTH6NGlubgtHlFpygb0jbKIot1S4D3e7EmDUWPIygdkyqc7KhbCXSgn2QeYv4ItjWUm6TCcdK68xCftlVmBt77xoefal82eVJaNviyTMBJCMm9xfW24Rm7IWAVpgI06+X4xyMgbEXHNIPOKu6ikI5pkYkdKIz2EGZSAeanL5KLPWvEfqPnFfmecjhT7B184zA4q4fRrB/sfYX2dJev4Or1ONCk/7+3rpj94OgFeWMN/1Af1kWNdZk0BxLN3fLej26XE37FEqijsw41lEZLwDv6A252UKC6HLPNpOC18sZRwnJNDntre6RY6b7eTe0qL8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI9/wCYqjDywNk5QukKszejpo1veOwu0ao+PaGkMhDM=;
 b=VteyAKJVvYzil5mms6sYjSWfipGsiMC9NnLxYRx6F6qZUpOEGARvEDOMCspbhr8e0cv1+TZj3F+VFI6W4dAJL6lesGL62X1V1lKnY1aapKdETNlxengblq+YHlB3oePvr6ltJ3gvFVyGyAR3oeSG3gwXpQvB9HQ8etqEieKL5FzYpsS9hEEVOqerSj9qje9VTGfqNHceCLjtdgzkJBnTrMU+EoXbA3lm2LxMZ5dZkRrdHzBxvB0fxBbshYwl8cE76UBMiu/tnfrpgqI4PWUn3o1FpKwG3Y+IRkrrupupsW75pCINamwkI+cPmhnuAxgSwy549THQmIm6UZomacFZAg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by PUZPR06MB6029.apcprd06.prod.outlook.com (2603:1096:301:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 06:28:34 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:28:33 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Linus Walleij <linusw@kernel.org>
CC: Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Topic: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Thread-Index:
 AQHcjBon++X4WP13bEy2OWyHfoxUrrVwK6aAgAH+4O+AAv2egIAAIat4gABOpwCAAAIPAoAAG5WAgAQGN3yAAH6cgIAAUZkAgAEFX4M=
Date: Tue, 10 Feb 2026 06:28:33 +0000
Message-ID:
 <OSQPR06MB72526DA818EACDE2931BA0168B62A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References:
 <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
 <20260209144250.GC5376@atomide.com>
In-Reply-To: <20260209144250.GC5376@atomide.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|PUZPR06MB6029:EE_
x-ms-office365-filtering-correlation-id: 02820bca-d291-4501-896b-08de686d9dad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cW9OWGF0VVF4dnQ5bjgvZkhNdThWUElGRnlPNWpPZERNMklEbXRvbzRRam5y?=
 =?utf-8?B?Y0JpSkoreUowV0drUWVxYStNMndLOFFZdFd3bDE4YWpOQUxJU3B6L1VlNnZU?=
 =?utf-8?B?NXN0d25KbXArWE1McDkxVG8rK3RIVnZLK04rUFk3TldRWlN4YWlKSkdkbjgx?=
 =?utf-8?B?VXNNZ3d5eXV3MFdhWk5OcWJ5YWwzaVBEbGVHVnZWUGZZWi9jblQraE9iYVZE?=
 =?utf-8?B?R1hpcHAwNFhMZThrNHp4ZGpqY2IrQlRuU2RYL2xmc0lRaExmb2xJUjNQUit1?=
 =?utf-8?B?ZVIrUGtlUXUwSjJsdVVhSElGbk13eXpydXgwSk81OWJZYUlNY1JNQTdla3FG?=
 =?utf-8?B?K21YaDIxSno1NHNkcDl3UlJpZkdYTjM5dCtqS2V4NEdmRXIybWh0bUV6dlhI?=
 =?utf-8?B?MFltVlVmYVhHRHVWaVVsMmJZV2tqRlRTckF0NHMwUmhmcXhPYk1hK3hKWWgy?=
 =?utf-8?B?enZFdVJxWnNNWnlSNExvR3pIMlYxdzgzNVZ1SGt4MEtwRkVEVTZZbDR0L0lK?=
 =?utf-8?B?QlgyalFESmNEZ1lpbmpWaUppQTR3R25WWmRvQmoveEpTb0xPaE81aGpFTkYv?=
 =?utf-8?B?bmtoQUt6ZVBMTkNnMVc2OUp2UFphZ2k4TmFLNkxqS3lqZTVhMXN5MlFmai9H?=
 =?utf-8?B?M3RoZDZvVUZkSjVMRHBLZ3B4RUxtNURVVjMvdFg1dEljazNISE9VYkdkb1d2?=
 =?utf-8?B?OG5oakkydW5rNWhGUmNFMGhucWxZY3o1UG5qaU5OQVV1NzBxbDZwWmNrM1ln?=
 =?utf-8?B?OHBrZ1YwSHc1T3J2TGJvbnhwaW8zQ0hFNGNrek00eXdySmN1MFBMUEx2TDNr?=
 =?utf-8?B?MldMU3ZuK1k0ZGpNaEVkcnozZGxQbGI3RFM5QkQxeVlyVWxsbjVlYWxuckM2?=
 =?utf-8?B?QzhLaDFlSUh3MFM5a0UvQnl3bGlJZExTcTlscUdFV3UyeGVWMHdwMjErS3BK?=
 =?utf-8?B?MnhVVXlRQjRjZCtrOFk2SjdnOERiQUVpOUM3c1NzbXY5WHRMdis4RVNldWFH?=
 =?utf-8?B?ZDFjbUUyVjJKeUNXU3VVR1lIWmVDM2VsclZjNGxMalhvZ1R0YlBBcW5rRmd3?=
 =?utf-8?B?L3hUTWM5VFUwM3pNY2ZpRTYrOUh2c0VISml3Umt0ZHAzYjIzNG8rS0pCWmxN?=
 =?utf-8?B?Q2dFdXJOcVMxNEEvaXhDaWVOdWM2emdSU2x5UnFvdEozNHVoYkJuajJzOWtq?=
 =?utf-8?B?RGZwMUtoSU5RdTI4bDhLS3hmZGZnd0tWNHBPeHZ6Z2FvUGw5R0FkQkpNR2J6?=
 =?utf-8?B?Y21jeDBPSDJSSWZSTThpTStjd3hSSFdDaXFQSWw5WGMxRlkrdUpNdSsyY2tR?=
 =?utf-8?B?N1M4M0M3SE02UEdnZEVnbWhzeTB4cVkzemViNE9xWlAwT1cvWHV1MXU3eGR0?=
 =?utf-8?B?enNCNHkyaUUyZlhuVzlMZk12T3FvWlhVMnJyOHZpc1ZHbmpWNVJqV0FMZGhk?=
 =?utf-8?B?UEM4MjIzNHIwUDhzWEpQbVc2bndET2s2TU5peWl5VlhUQVJVQXNmaVZsellQ?=
 =?utf-8?B?djB4aVlmZnUxZTc1Z291QmhNTTJRNkd1TDhYSm8wbzhxMlR1R2wyVXRYNTVh?=
 =?utf-8?B?MjVFZVFHWHYrZG9iQUZ2SHF5WVlqNUpKUElhVE51RERYWGRUazFWSGg3QTQy?=
 =?utf-8?B?UCtjSWJUVjZ3MWlPMFVCWHRCT1FNOEsreVQzN2x4cDRuSHJhOWhRZGdyanJE?=
 =?utf-8?B?RlJ2ZlVmcnNiS0hMdWNIMVdUTmZVUHRlWXEwd2RtM21BaGtFSFRWaDRQd2FX?=
 =?utf-8?B?VlhDSmJEU3p5WUhpQUJXWlZ5NDFIWGNvYVRYSFlUckNvTEZZMlZhYXlUU2t4?=
 =?utf-8?B?TURORHRrN2lGYzYyb2J3MmxYQWUwUzRBWWlHM2RaTVloa1ZBalNHZHlZdXJi?=
 =?utf-8?B?WEhPQWppNjBKS0R3SE1mS1VWV1dwZTVoOFFWb2oxcFd6QTh6bUsxUHRkSy9F?=
 =?utf-8?B?aS9sLzNFNkdrNC9MaXNzY3ZETzQvRDI1SWV6SllPUVBwY1QrMmZ1eFowM1dN?=
 =?utf-8?B?VFJYUW94eElVWmk4RGNQcUtVdWhyRXFtZnhvNWVoMHlrZzRjQkpJNXkraEZ1?=
 =?utf-8?B?dWFUVHJCRXRzVzJxTG1pblpxMlRBVEluNSsvRXBON1c1citGMGlibThKV3dW?=
 =?utf-8?B?UXVnTXBWZ21QSk1JdTZYb05oWW9uR3lIZk1GV0FqRU16SjNkOVpjL0tiZ2Fj?=
 =?utf-8?Q?lfh0mXDr5s5SEBstNlrc64g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDNVQjVlSW5Db3BEU3pMZ0VJK2ZaYUlxb00rVlVzdVJvZTF5bHczZ01XRHkw?=
 =?utf-8?B?YXFVbnZkT1hobk42Ujk4eGo5Z29NT2loODRKN3d6RE1nRW1nYjBDQ3B2b2pL?=
 =?utf-8?B?YkNJSUdCTmdWL0ZobDFuMzk2cFdKOVp0R251ejFYRjRSVXFBQ1BZRml1eXRV?=
 =?utf-8?B?RWs4NGZFUEo4Mm9PRk51UGNZOExvRk9wNXBmRjA0bm9DS2l2b0c5VVNNbzlu?=
 =?utf-8?B?REFsZWpnWDNLN2FHZUs1YVM5TjJTOUVUaUUyTXpib1JveFA5eTVObzhmdVJa?=
 =?utf-8?B?VDl5TWQxeXFnVnNIS3pGVEdSczJJcHFNOTJLSWRLZGswaWszNlNHdDJRei90?=
 =?utf-8?B?c0VLZ3BtOWc4Z0pPbGZxdXp0UDMyWDNLdFlzSHE0NndPakorNSttTURjdXRZ?=
 =?utf-8?B?Q3RwKzJjOXY3RXl4NU9TelJWVG5kaEtZZ1BPSUFTV0R3c1VZQS9SQVJGcTJG?=
 =?utf-8?B?c1hYMmlvT21CUzRVanZIS21sTGFnRkxvekxVUEozQjI2TXBXV0N6UG9OZmFW?=
 =?utf-8?B?aGNYSm81NFpQRUFCanIzUU1CeDRNQzhFRWp2dkxTS01ZYkx1aWFMNUNOMklS?=
 =?utf-8?B?OStKSzRaTldadEF4SXVWcFk0VEM2amw2ZjE4eXp6Q0xzQmFYTWhpbHA3VkVG?=
 =?utf-8?B?MWJubEtZcGlGV1FtMWJEUjc4bHAzODRjY2lyN254dStvV0Vwb0lBZXpGb2xR?=
 =?utf-8?B?QVdKTldIaG95b255U3Y2enNsdytyV2VmcW1SL0g0djBETEdkZVpBb1R6eWFO?=
 =?utf-8?B?Y21iMERqU2hsL2k5Zndnb2lTcjdrSzNXem5MNXlSMCtmQmpPR2poZEpHbmhB?=
 =?utf-8?B?OTVVN1NKclBvTVE1VUU4eUQyMmQ2NFVsOWd1MVZJSWw3MUhyRjBsTUN1VzM0?=
 =?utf-8?B?UTlVaUd4c0lzdTB0VGhoNnFnUEhIcGMxV1ZVdXo5aGhkcHo4NzhQWktXTEdC?=
 =?utf-8?B?d3VuUElNQ3lCbW12TXZ6S1RVcFJLdXVsRnZkVmp4d09sTUxhMVNSZzJDVVU0?=
 =?utf-8?B?dXlGU3BwSXpXdHU0elk3d0FJc0hKS28yVzdjaTJXdHFZQUUvT0dpVGRqczNJ?=
 =?utf-8?B?cmpYaFZqaXdzOWhYSk1OdUhsS2Y4Snkrby9pamg4d0NHS1J4WGR1RWhhM2Ev?=
 =?utf-8?B?RlcxQWMrZDZaNHdrRnhBdnRmazk3eFNXd0daY1dQSDJ6emg1eU1hZmxPTlR0?=
 =?utf-8?B?WGVwZ3ZqTzNnaFpra3hXb282bENGOU9tUlBHVHUxa2FqcjhIKzBQZytPSEZs?=
 =?utf-8?B?allQMm5rZ3pjVVd0K0t1dkNvVCtQS1VvSVJrNkZLTHVvZVRwY0RwTVZ4RnZL?=
 =?utf-8?B?dFBiVTlvd0Nmak5MNUEyVDVYSENkcjExcWx3S3V0YkpmeitkR0NNaitJT2Ny?=
 =?utf-8?B?L0dMRXhIcURCMTkvRFMzTTh2REhNM1UrYzlxeE5MZk12ei9pUWo2VjZxNG9t?=
 =?utf-8?B?bVBvOEp4NlgxVlU4dm1rY3phWk0vZENvdi9ZVW0rVUFhMG1WWEZFM1I0L2pQ?=
 =?utf-8?B?T0pBQ25IeVNMMW1xeVpZbGd4bkdvN2ZtbWVPNEY2dU43Qm1WY0N0blUyUEs1?=
 =?utf-8?B?S0ZmaGdzZDJxdnhJNy9wcHp2VnZYcVZkUlN1a1IwU3k1ek1Ybm5WdGE0OHFL?=
 =?utf-8?B?Q29BWW5OVU5TWE5EQkgzWnFXd1BXaHhEVGRnbXVZaDVZUEF1MDdZYWtsaTBC?=
 =?utf-8?B?cVcrU3FEdzZLa2hEemg4RjYvTGhveDFuTFNPWUs3N09JanVuNWJmS2lsbEdI?=
 =?utf-8?B?MnJ5TWJBTHN0Z2hyR2gvc3JFbHJEejhyUC9tM3RDRWJRUlJ4Z3luRHJUQ3Nx?=
 =?utf-8?B?R1F5VjcrTlVGT0t6VitjZVNkdXJXT3JNVU0yZ0JaRzRZbTlzL0VmQnNkbDRr?=
 =?utf-8?B?WXM1b3U1amZCYXNPNWFsZXhWQUdmVFJRWW1ITnVvOHlsaWhENG9NK2NRaDA4?=
 =?utf-8?B?UGlRRkswMjBoQzV5ZzM4YUJTYThwN3ZtS1FiL3pEd0pROWQ2d09acmFndjZS?=
 =?utf-8?B?NHB6NE5scW9aVHBWZjdEZ2JFeGhJb291czFNbmFHZFd0UW5oMEhNOGdJSnRQ?=
 =?utf-8?B?cDVFSmVQOHhuTVY0TVNrT2NNdC9vV2pZREozOEQ1ZWhsNlFzbll1WUMzSDVl?=
 =?utf-8?B?ditKUnNlZC9SMUwyUVk0VGxzSWZvV0ZycndIck9RN0ViUjR0emNhN3VwNWdu?=
 =?utf-8?B?UU5seUxEdk1GblNkbkJTYmJDWnJMeUFDM1o0WW1tak1JeXFIYlhlZU5qeFgw?=
 =?utf-8?B?TzVjZnBsMkV5TjlDeUQxWC9MZVdzN2dIKzk1b3loV1VkVmFRK3hTaVY4QWxK?=
 =?utf-8?B?WlA0K2ZrZ3RwMVF3d0JhSXY4SUM5aXRHeFBqbVVFUURrSjlqZy9RQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02820bca-d291-4501-896b-08de686d9dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 06:28:33.8930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwYJoX05yRlmkd4KqxjQptjpoVDbrVx2rLDatePufOtwF/s12CPMyqJInjlfZD9MFvBLZmpA4woQ4lLwuDm5JAaNBQ3bZfVWWzNRTCMvpJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31542-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,aspeedtech.com:dkim]
X-Rspamd-Queue-Id: 196251175DC
X-Rspamd-Action: no action

PiAqIExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPiBbMjYwMjA5IDA5OjUxXToKPiA+
IE9uIE1vbiwgRmViIDksIDIwMjYgYXQgMzoyNeKAr0FNIEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlA
YXNwZWVkdGVjaC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gVG8gbWFrZSBzdXJlIEkgYWxpZ24gd2l0
aCB5b3VyIGV4cGVjdGF0aW9uczoKPiA+ID4gMSkgV291bGQgeW91IHByZWZlciB0aGUgbmV3IGRy
aXZlciB0byBiZSBmdWxseSBzdGFuZGFsb25lICh1c2luZyB0aGUKPiA+ID4gICAgR0VORVJJQ19Q
SU4qIGhlbHBlcnMgKyBzeXNjb24vcmVnbWFwLW1taW8pLCByYXRoZXIgdGhhbiB0cnlpbmcgdG8K
PiA+ID4gICAgcmVmYWN0b3IvZXhwb3J0IGhlbHBlcnMgZnJvbSBwaW5jdHJsLXNpbmdsZT8KPiA+
Cj4gPiBZZXMuIENvbm9yIGltcHJvdmVkIHRoZXNlIGhlbHBlcnMgc28gbm93IGl0IHNob3VsZCBi
ZSBwb3NzaWJsZQo+ID4gdG8gdXNlIHRoZXNlIHRvIGRvIGEgdmVyeSBzaW1wbGUgYW5kIHNsaW0g
ZHJpdmVyIGZvciB3aGF0IHlvdQo+ID4gd2FudCB0byBkby4KPiA+Cj4gPiA+ICAgIEFjdGlvbiBp
dGVtOiBJbnRyb2R1Y2UgYSBuZXcgcGluY3RybC1zaW5nbGUtYml0LmMgZHJpdmVyIGFuZCBEVAo+
ID4gPiAgICBiaW5kaW5nLCB3aGljaCBjYW4gYWxzbyBjb3ZlciB0aGUgZXhpc3RpbmcgYml0LXBl
ci1tdXggbG9naWMgY3VycmVudGx5Cj4gPiA+ICAgIGluIHBpbmN0cmwtc2luZ2xlLmMuCj4gPgo+
ID4gU291bmRzIGFib3V0IHJpZ2h0Lgo+ID4KPiA+ID4gMikgRm9yIHRoZSBzeXNjb24vcmVnbWFw
IGhvb2t1cCwgaXMgaXQgYWNjZXB0YWJsZSB0byBhZGQgYSBzeXNjb24gcGhhbmRsZQo+ID4gPiAg
ICBwcm9wZXJ0eSBpbiBEVCAoZS5nLiAic3lzY29uID0gPCZzY3U+OyIpIGZvciB0aGUgbmV3IGRy
aXZlciB0byBvYnRhaW4KPiA+ID4gICAgdGhlIHJlZ21hcCwgb3IgZG8geW91IHByZWZlciBhIGRp
ZmZlcmVudCBiaW5kaW5nL3Byb3BlcnR5IG5hbWU/Cj4gPgo+ID4gVGhpcyB3b3JrcyBmb3IgbWUu
Cgo+IEdyZWF0LCBzb3VuZHMgZ29vZCB0byBtZSB0b28hCgpIaSBUb255ICYgTGludXMsCgpUaGFu
a3MgYWdhaW4gZm9yIHRoZSBlYXJsaWVyIGd1aWRhbmNlIOKAlCB0aGF0IHdhcyB2ZXJ5IGhlbHBm
dWwuCgpJIHdhbnRlZCB0byBkb3VibGUtY2hlY2sgb25lIHJlbWFpbmluZyBkZXRhaWwgYXJvdW5k
IHRoZSBzeXNjb24vcmVnbWFwCmhvb2t1cC4gQXMgZGlzY3Vzc2VkIGJlZm9yZSwgdXNpbmcgYW4g
ZXhwbGljaXQgc3lzY29uIHBoYW5kbGUgb24gdGhlCnBpbmN0cmwgbm9kZSAoZS5nLiBzeXNjb24g
PSA8JnNjdT4pIGlzIGZpbmUgZnJvbSBteSBzaWRlLCBhbmQgSQp1bmRlcnN0YW5kIHRoYXQgYXBw
cm9hY2ggaXMgYWNjZXB0YWJsZS4KCkFuZHJldyBhbHNvIHBvaW50ZWQgb3V0IHRoYXQsIGZvciBB
U1QyNzAwL1NvQzAsIHRoZSBTQ1UgaXMgbW92aW5nIHRvd2FyZHMKYW4gYXV4aWxpYXJ5LWJ1cyBi
YXNlZCBtb2RlbCwgd2hlcmUgc3ViZnVuY3Rpb25zIHN1Y2ggYXMgcGluY3RybCBhcmUKaW5zdGFu
dGlhdGVkIGFzIGF1eGlsaWFyeSBkZXZpY2VzIGJ5IHRoZSBTQ1UgZHJpdmVyIGl0c2VsZiwgd2l0
aCB0aGUKcGluY3RybCBub2RlIGFwcGVhcmluZyBhcyBhIHN1Ym5vZGUgb2YgdGhlIFNDVSBiaW5k
aW5nLiBJbiB0aGF0IHNldHVwLAp0aGUgcGluY3RybCBkcml2ZXIgd291bGQgb2J0YWluIHRoZSBy
ZWdtYXAgZnJvbSBpdHMgcGFyZW50IGRldmljZSByYXRoZXIKdGhhbiB2aWEgYW4gZXhwbGljaXQg
RFQgcGhhbmRsZSwgc2ltaWxhciB0byB3aGF0IGlzIGRpc2N1c3NlZCBoZXJlOgogIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC80NTlmODRjNTZhNTAxMDkxMGVjYmY4YjQ0NWMwOTI2NzRmMDYw
NjkxLmNhbWVsQGNvZGVjb25zdHJ1Y3QuY29tLmF1LwoKQmVmb3JlIHByb2NlZWRpbmcsIEkgd2Fu
dGVkIHRvIGNvbmZpcm0gd2hldGhlciB0aGlzIGF1eGJ1cy1iYXNlZCBhcHByb2FjaApmb3IgdGhl
IG5ldyBwaW5jdHJsLXNpbmdsZS1iaXQgZHJpdmVyIHdvdWxkIGFsc28gYmUgYWNjZXB0YWJsZSBm
cm9tIHlvdXIKcGVyc3BlY3RpdmUsIGdpdmVuIHRoYXQgaXQgYXZvaWRzIGludHJvZHVjaW5nIGEg
Z2VuZXJhbGl6ZWQgRFQtYmFzZWQKc3lzY29uIGhvb2t1cCB1cCBmcm9udCBhbmQgYWxpZ25zIHdp
dGggdGhlIFNvQzAgZGlyZWN0aW9uLgoKVGhhbmtzLApCaWxseQo=

