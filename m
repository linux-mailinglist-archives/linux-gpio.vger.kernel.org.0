Return-Path: <linux-gpio+bounces-6662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3B8D0122
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2CD1F222CC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A3B15ECD1;
	Mon, 27 May 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="m1ikTifn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678184EB55;
	Mon, 27 May 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815861; cv=fail; b=QwsspjPRp1onFtZg6snFeZ9SYL09Jlt1YxZYdMXQQDDJuCRNHWsIQa8HfdATUISHAElPSfx8INSDk15NlFOCdyhR5d3cXaVrl9wwzpzk435D3WgE7jnb/7tByWuXNd9AZXC+PmMT2GdeFPQPPKGc1g6oAp8zZ4BBFmsg7QcQ1Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815861; c=relaxed/simple;
	bh=iR2ePQhM0kFc2kf93q6KBkLUjm3cQTN75p4FkJUFz/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ntmr+XzOQXDHDYsq6gX/rzkGvHlOoQXzur7GzW4k6pr/FTobkqpz591OO924dsqwwL/IYr7dWkSoMfLR7MwcNQpv6diKAZ/VniLYZkf73dpkx8/y4/NQ4/7csRSDWFHoZIKJSb835zm48rYubqoHlSsz9L/NfoLV0SpSDnRVdtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=m1ikTifn; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXcuyirgHobWdYe0fXwFKSVqTD+RLALXGj/cXt7t/t1RptHBofNnpQ4KyCWodjFc6fEv8aZQcf+WewnhoYLrFn6Q1haKXUwq15jMj/XgeCPUmzBGMrWUjWipC6S/YQSz483dAhm8A3N1trGwViMj8LQmltcmDoXHQdp7/NO8oDw6RrfGa2cVQNhzfXKrkfdigtINJ+fHRN88bhjRrq+oYYersY34HedqxMtCtX2CXi3WHpouFRnzkwcm1nKdjlcIF46vKiqzc/gpYmtJca73U8LwaNebxRRP0QcXfSaIv72RwnQwGOVppNZaNHol5aiqDcFtvASer/yXG5grdFqp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR2ePQhM0kFc2kf93q6KBkLUjm3cQTN75p4FkJUFz/w=;
 b=fdKCQ1cxLjC41VuXtfpv83Z/6KokMclLysfedAhVbLPx3NanKjBAK72T1gAN2NK1LfFfDieVP2KfoSINsTE1Fg2OrchGX5/yPvhBafq82NfYb+CICxwt3RPdyUmWtIO1urUfkST1FBGIeesvyfKCSdsDbidOkxWrcpbDCTvOGguxmfucFq5ypUnnULnCgkduKCEh4JXEtO6BhddoJeTrs8ybQiMrtxvmgyEhb9rafIrEVZKzvm81vqDtMtqnhIjRATP4wP4yOdjeWzNDNZgkilE4dc8BD7gg9Lx+5SbH1qLs4+2NjgdNgQM/Dj2Czg21uYtBj+kjQ9fPVvd4BFmzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR2ePQhM0kFc2kf93q6KBkLUjm3cQTN75p4FkJUFz/w=;
 b=m1ikTifnUXBcbu4BxVV6nf+PtJWxsUkqg8yimQiNzF/ER3IdwTsxXVoa3HtZB3C7wXHXqyHB6EUWzC1gheruk1ju44Dqp3wpnYzIgZaN7/itQhImWCkqRxWFS40ocgRfRLCNrRY1MWHu4Ksv/N+bPreLxumMUQdaEYeFxdfS8Hs=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 13:17:36 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 13:17:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Topic: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Thread-Index: AQHaq0aJyos6fv3s5ke7eS39lhuMG7GrEz4AgAAA6EA=
Date: Mon, 27 May 2024 13:17:33 +0000
Message-ID:
 <DU0PR04MB94173F9C323C123186F1ECDE88F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
 <CACRpkdanc3gJ7_z+V5zwKbn+L-Qy1+nwsPLCSF9ZQ_xk3qJOXA@mail.gmail.com>
In-Reply-To:
 <CACRpkdanc3gJ7_z+V5zwKbn+L-Qy1+nwsPLCSF9ZQ_xk3qJOXA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAWPR04MB9960:EE_
x-ms-office365-filtering-correlation-id: e96dd703-bce5-472f-8523-08dc7e4f5ee4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|366007|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0dwRFpJZ09DSGtNeFhrYi83SzJuY1Vza1lQcVg3c3lZd1NHYmZabWMzZDRi?=
 =?utf-8?B?WHpwcFZZa1hSeWg3c2JmK2xweUpWN1JBQzlCRHQwSEthZ1pneDhWcnJac1gz?=
 =?utf-8?B?RlJ3bWVaY1R5ZUEwMVpMSWYxUkJnQ1JuUnQ5RU9UMFBHcXRaeks5OTNGSVk0?=
 =?utf-8?B?UVVOMkFiN1BKdWttelQ2N0Y5dUJjUkpkNVhTbktia3VQbitSMDlMeUR3VWF2?=
 =?utf-8?B?cGI5NldiQTBLditteHMrWjZUVmRGMnBZMmJVV0VNT1F4dWR6MjVPVE1zVUhR?=
 =?utf-8?B?bXlyR2hDZFJVZENNNjZRc1Y0N01tYXVQOW9yaHgvSlpjQjhJMU5CaE9xOHpZ?=
 =?utf-8?B?dWx0ZEQ2Q201WXBEQmdUYzNsVkljR0Y0RnBhZkNhSFd2YUg0RXd0UGhFVEdv?=
 =?utf-8?B?ZysxVzJQMGg4ZzQ4UWdrZ1lyalYvSjE0NFpydkltY3RIZWMrRjFCU1dPeVVo?=
 =?utf-8?B?UHE0aVFwcnVqRTNxUUcwL2MvZXptbEd0WWwvcUdBUWc3cUs1T1loSzNRRk5u?=
 =?utf-8?B?L3dVSWIzemFqeGhEWTc2MzZydU1Jc1VsR0tzU1ppaGZRczB6Q3R0SG11Yzho?=
 =?utf-8?B?OUhJLzA3M2dIMksvcXFleE12Z3Vja0g3dHZwakFma3RxVm9YZmFJQlA1NGlJ?=
 =?utf-8?B?L3dXZ1BRTWRqdVhoVWNMdnpHUk95dzl0azB2K25zem5RTHNKSG0zTHlBZ1RI?=
 =?utf-8?B?SzlCYlU0cTd2c3VJaUZIQUJTSldORXB4ekxjaS9WS1BNelpYMVk3TEk0RjVV?=
 =?utf-8?B?WjdaY0ZZbExHdDRyblZ0S2pGSmhKSWw4MTRMcVBEdVBMQ2t1Q1NWV21jbWJF?=
 =?utf-8?B?aUZzVStsdWdZQlFIM0U2MHFVODdCMW10SGMwOENZS0syWDFuYWFucHh2QzJw?=
 =?utf-8?B?NEVDMXlGTjUyN253MTBRK3g0aTlwNUJoOG1aV1JHVjQ4NGRJWmxhZnExcElC?=
 =?utf-8?B?Q2ZRdTF1RExnTGJZaEFYWlZ1dVFZWHlFQVkxN0JXOThjclhmdnI2WUsxRTFV?=
 =?utf-8?B?TUhoWDVmRCtOazhWczZULzhnRzJFQ3NmcTZFNXlKMms4WUxKdlQ2TXMxVk92?=
 =?utf-8?B?TUtpM2RqY3lHcWhJTjhnTlBDbHZUUXVqMXpET2h0OTQzd1JnV1JOak9sTEVm?=
 =?utf-8?B?L2pxdlZFNkR0cXJzTitjRkpIanQ1cTVJWVNDSUxCaHRJN0VqdWJNTk9GZkt5?=
 =?utf-8?B?NXJBT2RCbVV3dTk5ZDRpZU9aa2V1aHVUTmpSTnFrU0hBR1VhNFZ2dURzL0dD?=
 =?utf-8?B?dXFXdlJHZ0dMcWFyVklmUnA3ZTZpQzJRbllGdDZKYjE3a1pKTnpabzc5M2RI?=
 =?utf-8?B?NnJlaFhNdUdjeFVhYlFKbDdlS1Zqbjkxc1NoczFIb1pranNxQlNUU1RmQU15?=
 =?utf-8?B?d2NtdC82aStLZ3I2WUFyRklxZ3Fua3BQS2JhQWxGVTNzbTRtUVNJMzZDQkNQ?=
 =?utf-8?B?ZU5Bc05OR3NiSDBMVUhOeFREQUVvaUhIbmJNN3E2UThrZ3pkMWREWWFRUS93?=
 =?utf-8?B?ZTM2d05wMklKc1VQT0I4MmhYLy8xWk10TGp4VUtrd1JwY3FzMHIwcklIb0JE?=
 =?utf-8?B?eDllT1d0S3hrSVQxRHRsaFJFQzFRdkc5KzVsZHVFME1hemVyUTBaVVVWNWlJ?=
 =?utf-8?B?dHdVYlhMR3ozbGNLY2ZFUUxieTRZQllsYWMwV0tDYlBjUm1MVm5mdFIyR2p4?=
 =?utf-8?B?eDliQ3NsNXcrbktJd1BBWjJFQ0QvUFFONTR2cjYyTW5ZNmxvNVlKdm9FeHRo?=
 =?utf-8?B?Y1lzMlhqa3JUV2w0amQ2V24xem5QSGtmTVlTU2V1bTBWNDVPaVh6RDArUGhi?=
 =?utf-8?B?aEtNV000bmFlYmhCK1UyZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3kwd3ZBN1lWcFNRZ1laVHZ5RTg3dWIycnlFV1lzMlJEYUpWd2l6YTlkSWJK?=
 =?utf-8?B?YUhUc0xFVENiV1Z2elorT2tZS2RPUFNodGJydlV6VUswRkd0RzVtNGl4MEdQ?=
 =?utf-8?B?aFJrYTBzM1hOalN2cDJ4bk50aVN1OFZ2TkdxTkdRSFpXZGtscGJtaU11S2pl?=
 =?utf-8?B?d1g5N0V3WUxzSGo1UXJ6REg4Um05Q21JcFVlRDlob3YzQkpnd1E4WUlZRzBh?=
 =?utf-8?B?SzFMb1p0dDBxa3FySEI2UFhPRDE2M0FwM2lNczM5b1A1TnRNNWRnTUdUeXg5?=
 =?utf-8?B?RkhNMTB5c0hVMmprVVZQR09PUUh6WndvQm0xaFo3RHhsczZjNGtWSWxUdEtn?=
 =?utf-8?B?aENPYko4RnFCendDVng2bi84U3Z6Vy80dHpnOU81TGdxeHdpZkRQa2tORFNj?=
 =?utf-8?B?b1dGY0pENU9ha2I4Y2ExZ05RdEgrUVRDNkhySWxsTktmRTVWTjJVKzBES3BY?=
 =?utf-8?B?YVlpWFZBQ2wraU9OWUNpaTV1ZEdSSlpYbDhrRkhNZXdvdlE4bStFTXVid2JW?=
 =?utf-8?B?cDlVT0k4NTFpektSMUE3UG94dFg4a2RkbklJdHpYbVN4Z2RPdUpnYjd2d2tL?=
 =?utf-8?B?SkFUV29DcHNkRHl6UmUzVWxUQ1FhbU9kSHU5V2NGd2o2OHhkVjF5eDVqMi9C?=
 =?utf-8?B?Rm9qaUV6QkJrUnBFUDh0aVlkMjhiTVZMSnJaSnU2OHFKT1BnMitHSHlhaG0z?=
 =?utf-8?B?eWdDellaZUpTTDVVZGplSVFVbUVpSEZ3TW52dDR6SE1zdmVkNzhVNmhQTTJv?=
 =?utf-8?B?UDB2NGNTQ2g4ampESks1Wi9icXF5THowNlAyNTJFL3RkVUtya3FsRzd4Wi9s?=
 =?utf-8?B?MG1kUmx4ZU9BcitOSUZwazg1V1Q1UExnenRRYUZCOWtNNW1qQm1wbncrWWox?=
 =?utf-8?B?NGM2TGE1SnlkWjl6S1ZiNHZOQkxlanQvdGs2WUlUcnJEMVE1MWlWSEZMd0lK?=
 =?utf-8?B?VUY0blZBeGFRak9qVHJyVkxSU1JiUzM3OVEzSnVmNWh0S3BheFQrdHRSUDdE?=
 =?utf-8?B?ZzlJQitFRFk1TFdOM1hCcUc0YzJWcURpR1Faejh2Qm9obUJzckRZbXY5K2JV?=
 =?utf-8?B?R1J4WmxLUnEzRDBiSW43aTFkdERYNkxXWEVhaUtQTUhiZ3l0MzBtcjlqSnBi?=
 =?utf-8?B?a3Vjd2R5aENPbURqeGRzaGswWXpoWEo5SmJjSVNXc3N6Z0VFNnBXb1Q1YUs4?=
 =?utf-8?B?ek9ObHZPMGdRbWVWZlRYcG9pdXZPb0t0RUNqVWFIa0NvVHlscVVyT2Z3ZUx4?=
 =?utf-8?B?VWZWM0h1Q3dkWEl3LzhzcGtwbFhLQzVoTzYwSEcyNXZyMmNDYzhnT2VDTU1a?=
 =?utf-8?B?N2dwTkVhVTAvRlJUd3h3VnNIM2Q0ekN6dWxvQUtJLzljdEJCdXlJRk1LUHFz?=
 =?utf-8?B?VHMvMkxDQ00wMUE3SDJzRUoyMWY5dGR4WEZrTWxRaVptSjNVK1BHR1dFZlpW?=
 =?utf-8?B?OW94c3FtZkVrWC9DVEI0bStPL1F6NndSVGd5VW1RS0V3V1Q0VENYUjB0M09K?=
 =?utf-8?B?clh1eVFnWGQxZkFtQ0VsR3RKUEFWd2MrNTFDcCtSK215NVM2cDFHak92QXVJ?=
 =?utf-8?B?Rm5mYlpVZjY1SXYwTWdJYkNhWkFvQlRDYWxRUkszaThQY1FPd0RBU3k5RXV6?=
 =?utf-8?B?dDRlUWo3MnlVbzd6ako2SjhnNXNXMjBQTkZya09Ed0NyMVp3M3ltSllWYmEv?=
 =?utf-8?B?c2tJNWE4ZXV6STM5empMWnNDNWhNZEp0QW9PSVVqcitzbW9mR29lQTFmYVZs?=
 =?utf-8?B?dkN0RzlnSkg2NWl4VW5QdldqT1B2RHJwZWZ1Y09mdjNIb2hEZUFUZjJKR3Er?=
 =?utf-8?B?bytoMnUzSklKYVFVTEtqZzh4Z3lkQzFHdCtId0xCS0oyQm1FdFBpRmJlT285?=
 =?utf-8?B?aFdiRVRxc2t0MTN1ZEsreTEyckJqdmFZWHFYOEJjOGdhZ2RRdjhKaEE3bENG?=
 =?utf-8?B?R0tzRzdBTmV3OHRBamZEZDQxejZtK1lzWTBHb05DcGgveUxjVU5KWDZzVUlT?=
 =?utf-8?B?SXV1VS94Q2doL3NjS1VPSUE2T2hKRTRTSVBVaGQ3cmQzQys3cStKWGM0a3FQ?=
 =?utf-8?B?c0c1K0xIUkJzY1FSYWV2OEs4c2JCa2tmZC9qUHBaSHVUeUdtUElRb3VXOC93?=
 =?utf-8?Q?DvEA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96dd703-bce5-472f-8523-08dc7e4f5ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 13:17:33.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PCCqbJHKjerUJq1AC10j43GML23+5ezDwiKj5RaYJk8NFqtmMN0SOVBZbM4xNbix65P5aHwcvxPT464eJMp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIHBpbmN0cmw6IGlteDogc3Vw
cG9ydCBTQ01JIHBpbmN0cmwgcHJvdG9jb2wgZm9yDQo+IGkuTVg5NQ0KPiANCj4gT24gVHVlLCBN
YXkgMjEsIDIwMjQgYXQgODoxN+KAr0FNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZhbkBvc3Mubnhw
LmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+ICtzdGF0aWMgaW50IHBpbmN0cmxfc2NtaV9pbXhfZHRf
bm9kZV90b19tYXAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGlu
Y3RybF9tYXAgKiptYXAsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCAqbnVtX21hcHMpDQo+ICguLi4pDQo+ID4gK3N0YXRpYyBpbnQg
cGluY3RybF9zY21pX2lteF9waW5jb25mX3NldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBwaW4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgKmNvbmZpZ3MsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBudW1fY29uZmlncykNCj4gDQo+IFRoZSBjb2RlIGluIHRoZXNl
IGZ1bmN0aW9ucyBsb29rIHN1c3BpY2lvdXNseSBzaW1pbGFyIHRvIHNhbWUgY29kZSBpbiBwaW5j
dHJsLQ0KPiBpbXguYywgSSBiZXQgaXQgaXMgY29weS9wYXNlL21vZGlmeS4NCg0KSSBvbmx5IHRv
b2sgdGhlIGlteF9waW5jdHJsX3BhcnNlX3Bpbl9tbWlvIGFzIGV4YW1wbGUgdG8gZ2V0IHBhcnNl
IHRoZSBub2RlDQphbmQgZG8gdGhlIHBpbmN0cmxfc2NtaV9pbXhfZHRfbm9kZV90b19tYXAgaGVy
ZS4gT25seSB0aGUgcGllY2VzOg0KImJlMzJfdG9fY3B1KCpsaXN0KyspOyAiDQoNCkZvciBvdGhl
ciBwYXJ0cywgdGhleSBhcmUgZGlmZmVyZW50LiBUaGVyZSBpcyBubyBNVVggaGVyZSwgY29uZmln
cw0KaGFzIHZlbmRvciBTQ01JICJJTVhfU0NNSV9QSU5fWCIsIGFuZCBtb3JlLg0KDQo+IA0KPiBD
YW4geW91IGxvb2sgYSBzZWNvbmQgdGltZSBpZiBpdCBpcyBwb3NzaWJsZSB0byBzaGFyZSBjb2Rl
IGJldHdlZW4gdGhlIGRyaXZlcnM/DQoNCkkgdGhvdWdodCBhYm91dCB0aGlzLiBKdXN0IHRyeWlu
ZyB3aGF0IGRpZCBmb3IgaS5NWDggU0NVIHBpbmN0cmwgQVBJIGJ5IGFkZGluZw0KSU1YX1VTRV9T
Q01JIGZsYWcuDQoNCkJ1dCBiZWNhdXNlIHRoYXQgbWVhbnMgbW9yZSBpZiBlbHNlIGNoZWNrIGlu
IHBpbmN0cmwtaW14LmMgYW5kIA0Kc2NtaSByZXF1aXJlcyBkaWZmZXJlbnQgY29uZmlncyBsYXlv
dXQsIHdoaWNoIG1ha2VzIHBpbmN0cmwtaW14LmMgbG9va3MNCm1lc3N5LiBBbmQgc2NtaSBwaW5j
dHJsIHJlcXVpcmVzIGEgdG90YWxseSBkaWZmZXJlbnQgcHJvYmUgZnVuY3Rpb24sDQpub3QgaW14
X3BpbmN0cmxfcHJvYmUuIFNvIEkgZGVjaWRlZCB0byB3cml0ZSBhIG5ldyBkcml2ZXIgZm9yIGku
TVg5NS4NCg0KPiANCj4gSXQncyBub3Qgc3VwZXIgbXVjaCBjb2RlLCBJJ20gbW9zdGx5IHdvcnJp
ZWQgYWJvdXQgYnVncyBoYXZpbmcgdG8gYmUgZml4ZWQgaW4NCj4gdHdvIHBsYWNlcy4NCg0KSSBj
b3VsZCBzd2l0Y2ggYmFjayB0byBteSBpbml0aWFsIHRyeSB0byBzaGFyZSBwaW5jdHJsLWlteC5j
LCBidXQgSSBob3BlIG5vdC4NCg0KPiANCj4gV2hhdCBpcyB0aGUgb3BpbmlvbiBvZiB0aGUgb3Ro
ZSBpLk1YIHBpbmN0cmwgbWFpbnRhaW5lcnM/DQoNCkFpc2hlbmcsICBGYWJpbywgU2hhd24sIEph
Y2t5LCBhbnkgY29tbWVudHM/DQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IFlvdXJzLA0KPiBM
aW51cyBXYWxsZWlqDQo=

