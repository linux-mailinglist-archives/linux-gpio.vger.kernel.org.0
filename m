Return-Path: <linux-gpio+bounces-8724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3FB94FD58
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 07:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE76FB227BC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 05:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB1F5674D;
	Tue, 13 Aug 2024 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1epSMLAO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679A1482D7;
	Tue, 13 Aug 2024 05:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723527664; cv=fail; b=jsuSHCvJNgb3T2SW0gVLxvnmh0ug0oKGGk/vdMEJqjGzR13RiBdc08DpVi+IEDDYWG+UxGl5KmMq4qvPgie7mVkQprZBcJeULg9c3ZTVSycyAWt+iByLeC9a+4VgJkoHpO4vErWMTG8TXpUiOM5SgK0wLPvdsYistJhRzXclT8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723527664; c=relaxed/simple;
	bh=ZoD923in75PC1eIikerZ/9klMEabHRcpteP+4vHStL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I3WRYLCBMcGnwA0WHZeTM4G/vVw5qFj84F7WX+alWugM7j/LRf6Ok8lJKrqCD1agJXCR88YyQdRknEA7E604g8K5B5C3S6p5L1y93rA8d1l+wSF1DceXse7GXMn6C507dK3ZvssX2QaX8KeJoq6w0z0d0/pY2N+wywb6j0xWY6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1epSMLAO; arc=fail smtp.client-ip=40.107.102.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uil65A84gj/NxutMhPaXlympIgrZuNt85P/aN2deM1t5G+WBNDjlwTEO+Nlk6lgWldEzCrFUvaFvUlx4zJT0G4lxjgwnjzX4bTUKwrnA5sYf+ykgGyzrZQ/Q94U8w80zUSpFf5z8aAKjlMa3ip9m26mRkrAG0cojI96mZhvrvb0gHJC+F1nOSh+VrqOJruI/rBhmYzcsO8Wnf4AoPL0ryQQ+sHmXq+nhmsNywXs2Pz99bNf1+WZC2pfTEMIiRw5vqraiGDWhQ00yJ+0CNzH7NX4hd8VvZnmSgCu5kjRIUbcQn2oFpZzqfA1yN0SItD015tz4dLUo5KvWrJeh79zI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoD923in75PC1eIikerZ/9klMEabHRcpteP+4vHStL4=;
 b=ceFVQl5KtGwvicgpjLTs2Rte7dIciNeVUIvIecL2o+rrr8MXp1/0gilpUzmvUWy7EpHfiy6E18v7W0BL0ozk2znTflEenQ6Wut/00VjO1jP5wYuFHoEVGf/+1w+0MQTsQnDiQBq7vv/1fC2e+U6FPUslGol9i0mU5M4bqE+8T6JyCXViqmW+DvYnTUBR9rUBUKp5yXaBnVgJTuCiwKxx3g/lm+cy99FcRimU7cZlycQs39uDJOmuVvygzlYLK/WRn5RtEkz9Y1lKw7Vckvj6CnvyvwVDiLMnOwKWrCcC/doW3ye/OCTDIOs/42w+rxBubhGnHC1iD1dZhZdjosE5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoD923in75PC1eIikerZ/9klMEabHRcpteP+4vHStL4=;
 b=1epSMLAO+WZNXqVGMLNf5Li2ejvJygmUClddlTwstOoHjOjyC902ngElO7uFlNCKSGoXsl1MraUQtt+nKZ7zSBa8XztJA5g3GoYD8bCieXKVQeGNmEWiTKR/uIZstIv2f3gGiEG3is5545AKLvZVDjb6eM14CBIghVrx8YV/sDA=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 05:40:58 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%5]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 05:40:58 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Topic: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Thread-Index: AQHa5Ap1S6h2PZuQS0qUfT0Rrn8w7LIYdoGAgARnERCAA66SAIAELpiQ
Date: Tue, 13 Aug 2024 05:40:58 +0000
Message-ID:
 <BY5PR12MB4258AE889108439ECAA4B1C2DB862@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
 <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
 <BY5PR12MB42586B02EB54BA76704F1062DBB92@BY5PR12MB4258.namprd12.prod.outlook.com>
 <0bded05c-0fe6-4f35-b527-662b3356fb56@linaro.org>
In-Reply-To: <0bded05c-0fe6-4f35-b527-662b3356fb56@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|PH7PR12MB5685:EE_
x-ms-office365-filtering-correlation-id: 2c6e787c-338e-429a-fa7c-08dcbb5a822b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?b2NudTBsOFhodjh0RU1pcS9oVnZMUjNuN2lqdzlpczR1TTJVakkvRVV3UU55?=
 =?utf-8?B?OHo4YXZIaU1uNS9GRG5TVnpJU2tEV0dycTFKbGhxRlE0M0JYd3pDdzYxUEtF?=
 =?utf-8?B?TkhSMzlWb1BhanpVbWZXWkdIdWw5N0hoQkpUOFFWRjczdThpSGRKb0FUcEFK?=
 =?utf-8?B?RWtsTlFGR0djMkw1YXlYaStGTnh2M0xQMHlwTG1LYzYzOUFEM3dqeGtSckJu?=
 =?utf-8?B?Q2Nna0x4UjBEVDRyQ0hwdUxYVm5HclAvZ1ljVUF2TUFqeTBKR2liRFgvZ0RY?=
 =?utf-8?B?eStYWFdudDdBTll6VHlOSnVhSkN3cDdjTjl4YlZKSnRNcFZRRVQ1amkwTUhC?=
 =?utf-8?B?UVdReVBxaXVQUGh6WGpaRnB1WTNHSlRnZmY4OE5uc1VVNytqRm9xWUlYZ2tU?=
 =?utf-8?B?ays1b000NWZjdXBFOGc3V2xvM284REN6MjZaTFoxNXJHb3hOdVFJS3FmT3lI?=
 =?utf-8?B?eUZoQ3Y1MnNKOG1zTEIyMEJSbWJZMG8rVkxDT2xKTEljQ2xiUlBtVlo1RzRE?=
 =?utf-8?B?MkY4aW10bU4vOXNpREpmYzdleExLcDNpaGVpS2JzQXZrdlZsTHJWcC8vMUFM?=
 =?utf-8?B?TktnbnFJL1ZEa2JBcFdrTmxxU2VMQ3l6QnRpM3hLRVJ1enU0YVZsZlE0ZnJl?=
 =?utf-8?B?aUNVMzNCSjJCYXh6STJlRUZMUGxMc2dSalpROEsyb1l2ZTRSQ3JoazBkK1Ay?=
 =?utf-8?B?QlUvZCtWSDRvdllvRi9iWGdFTGdjNE1raVk5OW1LM2Q4NStoL3Z1dTNkT0dF?=
 =?utf-8?B?OG9CMzE3Y3l5cWpQUTBFSklhTzBOOUZQUmJtdXkvSkZ6UHp0d2JBQkFYTHl1?=
 =?utf-8?B?S0RDeTZtNEhBNlo0Tzg4VkhwcmVib3o5aGRNVDRJWnNrbkhHa29kTjhnNS90?=
 =?utf-8?B?YW56SG1FdTcyekhsSVdQbHBENnFFRC9JUGh1RWsyL1VMSWQxQ0VlbG1aZlg5?=
 =?utf-8?B?WjEvODJ5bTRVVVBERzVOazltUEkvTThmK1Y0bnNWdFpEMGx3RERzMUZlSi94?=
 =?utf-8?B?RzY0b0VQUmRoQkZab3Vvek91cURnWlI5UURlMFVlSmNVK2hIanU2L1RvUWJu?=
 =?utf-8?B?Z3ZmNmtCYldsWGNqMitLZmJOZ1U0VjdOTzVKbXB6ZmFjWEttUVVTaXVsUG9o?=
 =?utf-8?B?eHl0c2JjMFdXWFVCNjRyUGtZQTZGalBWRXhYeklVeUpOVDhONDBPdmVrRFBC?=
 =?utf-8?B?V3cyaWp4ZjM0blRJVHFOOVZMd3ltaFNXZUwxUU9qaUxPL3BubjVoTXJLMVcx?=
 =?utf-8?B?ckxEN1dWK0V0ZktZM1c0WFZOcXZYeHpMN2x3M1JDaXVIcFlDMUxXVmx1T2lq?=
 =?utf-8?B?YjF6VGIzL3hONkJVZVRnV29zQVJHQWdFcmlNSWZBQVJIZmoybjB5a2tvazBk?=
 =?utf-8?B?UEJiTzFmZGtDcGtkN081TkJnOWpMT2RzcVBSV21HZkx3NVBpOGMxd0pNYnZx?=
 =?utf-8?B?aGRHMjJsWWRlS3N5WlVqVStWWlJXdkp2QzlBS1M2NGhVVUJOMU9qbisxRVky?=
 =?utf-8?B?Vzc0MGZ6b09keDFYd1lqTEg5YzJNS3FhNHZuSjN5aTJuRnRpb0w4Q2tjVWli?=
 =?utf-8?B?RDlYUUUwRytubUlGRzFaTUdwRXBWazdnNE12eUZmc3lkMUVyM3RzNnhUMXh6?=
 =?utf-8?B?OE5WTElXY0EwSk5XV200cXVsL0pKTnZZWVZmWldCdlRTK1ZFR2k4T2Z1ZW5V?=
 =?utf-8?B?K2NjMGNhR2dWZ1FCN1BWNDlsV0dCTi81Wk51UlRleGkrMTdMVnFxck04NlpQ?=
 =?utf-8?B?aXFHU21lSFd0SGNYeEwzc3ByWS83MFN1QmxFU2tZelFIVjNLYmlIbjRKTS9O?=
 =?utf-8?B?My92NWJ3ZWczVHRJN1p4NzAwUDRlZW03R1ZEdzJDamJ5MnJNMityREpZMHpW?=
 =?utf-8?B?WDF1WDgyNEZ2OTYva2thN1ZnN3hWcHkwTE1XZ0VJeTA4T1hrQjEvNVA4REpD?=
 =?utf-8?Q?oi37TnDGnXQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnFnc0hYUks4VnpLMStRc3JkcEgxMXFncTJJSkorS3hOeko0RkR0UnRPamxD?=
 =?utf-8?B?cGd4R3hCNWtQY0RHVGNhK0huT1dNL2I5Y3VnZnpsaWM2VjFjNndwTUVMeDdV?=
 =?utf-8?B?c3QzUWZrMkt1MzJsaTRaYmRydDVCUTBacm16UFZOY1g0cDV0NTcyYVhoNjFk?=
 =?utf-8?B?ZFRJemVxREJpSTR0SFl0MldLb253M1YrTVJobGlJRXFvVlU1c2V1b2dtL2Nl?=
 =?utf-8?B?a25oQ1NkMm85NjhFVWdBbFgrZ1NkWHdOd0tiUWJvODFWSGNzc3dTai9VVEhQ?=
 =?utf-8?B?NkI1NDE5Mld4QTJZZ2JSeFRvTHB1RmtOV29rdXd3MitZSnRqakloQ3haZUwr?=
 =?utf-8?B?UEpYRDFSVTUyTnA2ZzFocnU1eERCV2NCSThsZVRLdHIySTkzSmQ5eUxNOUcv?=
 =?utf-8?B?WWxpL3pHbzBMUXpNdGhlNjNaakNLcENiVmxZUW1kWkFPZU5ic2VUMk1tRk1P?=
 =?utf-8?B?aUlIbi9BY3VjM0Fsc0hQWXNuU1IxRlI5Um9LaDVEK1F1SXRaZHMyNlBOaER0?=
 =?utf-8?B?VE1ua1YrVHlCVHpESGdQUHRtQmZ0dzhMMExla3ZKcURaUlJLZlRDWkd6MFNT?=
 =?utf-8?B?UkxibnNNWmhJeWJoZXlJMDJtZ2hOaS9IeWgwMytWRU54NjcxS0J3SmVZWUpZ?=
 =?utf-8?B?cnBHTVhZNHcrK1BZVEk5c28rb0cwNUNrR05iUWx4b2lucU5hejVGa0xIZnBG?=
 =?utf-8?B?Ti9HdVN6WE01ZTN5RlNIVG4yenNZVEovZEN4Y1ZRbDI2Ui8yUWxjZ3hQcW4v?=
 =?utf-8?B?REFHMnZLMGlvVWpMd3pLQnFRWG54K1dhYUdhY3ZkS3QxRnJUd2x0NXVFYktM?=
 =?utf-8?B?TUxzdEQwSVpJdUhYejh2TDk4M0FKK2VpY3dsRHBrR1NDLzYwSk82UklTeVlx?=
 =?utf-8?B?YjdaQVBNZi9nZzVTUHN4cDFYL3RTWndobXhyR012dVFCMTVGOWVzTVNpQkxO?=
 =?utf-8?B?aGhpSDZyUFp4TkhGc0tMS0htanFKM3pxSitWWWZlZFFxYk5UdzN6ZmFaeGFz?=
 =?utf-8?B?L0RhQ21Oek13MCtiWDJmV2xMQkFXaUVMQmdSbXR6TXVyblFBRU1WWkVoSk15?=
 =?utf-8?B?Ym1OdXRUdWRMZ3dxLy9BUkRZajluRDFPblluK2ppMUQ5U2VId28vVDZ1b0Jw?=
 =?utf-8?B?UVA2MW1XSk83WWRVYmJvMEN0d3EvTGZCcFdNTU10WHJ5TFBuTm5JY1JBUUdv?=
 =?utf-8?B?aFU3SkVOa1lMYkNGSWRmUFR1ak05cnBXRjNRWENZa1ROV0J0VWhaYVMwRkdP?=
 =?utf-8?B?OGM0UURJZWw3Q3A2TEs3UGNiaXlKWUk1QW1UMDdTeGFIVUd5bXFXNGpzU243?=
 =?utf-8?B?VWNnbXFSeTVUZ0diSjJ2UWdTQmhFWHY3aHJVWnVieGlvcmhvNjlBQlFaVGJh?=
 =?utf-8?B?Yk5lQ09jNUxRTmRCZHJEODFpQmdUL1hpTVNvM1M5TkdyeU9hMEFYY0hUVThY?=
 =?utf-8?B?dGZmOFJoNXFLZ0xCLzhiL2dPWWFpZHRGVHV3YUhsYmNyUXI3OGJjQ1VzdmVu?=
 =?utf-8?B?aFE5a2V5aWQrd05xM0gvUklPbVplVmJXWUJPUFZHelhlcncyNFMxRzFTN3hN?=
 =?utf-8?B?c3hNQ1pyMGxqTTlGSzVpV1F1dUtNd2hnaDFGM3gxZGNlNUJkaFdheUJxcFkx?=
 =?utf-8?B?aE1iT2xkZjk4ODl3THJtdkEyNG5JNzJ6SzlNMWMrRHF0K3NFVmJrQUw5aE12?=
 =?utf-8?B?WkIxK3VtZU1ySC82a1JHTVdnc1NEU3BOZjVCdDlLT2ZkdFQ1RWQyeEVqdkt1?=
 =?utf-8?B?NFRxTFNKSlV5MHdHZ1lWczhESSs4a0RyQkFYWjQvR2Q3U3RTWllZWUFTRlFi?=
 =?utf-8?B?Wm9QMXhjMk1wMzdSN1Y1QXVHYjVuRTBiNHZMOXhSZjQ3c1NOYkxSd1Y0dC8w?=
 =?utf-8?B?bWRNejFIQTVhc1lFdWMyd1ZYSWFjbVpBMG9ZbzNnMm9mcWJKdk9xT3daM3or?=
 =?utf-8?B?V29uWkRmYmNGQzY5NURFWEhhNGdPNXVFM3gwTGFocVVYTFNCUUUreDVWaGQ4?=
 =?utf-8?B?Rm0zczMwYkZmOUE3MGF5NFpra1c1blh3R2pzR1Z5QjNLc3lvS2RCODlVQ3d6?=
 =?utf-8?B?M3BVWTcxcGV0U2F4M3I5L3RXcmsrVEJKNjlucjB4cWJybVpuR1JhOGRQN2lY?=
 =?utf-8?Q?Bdug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6e787c-338e-429a-fa7c-08dcbb5a822b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 05:40:58.4953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdsK1ksZTKJIaPJbxWJ2UfPtzCn8xG0u8wq38Cd9B9PxJK6hkGoZHGZQvyKNpUu5fVh4J1cgy+QjgswRFN0YEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogU2F0dXJkYXksIEF1Z3VzdCAxMCwgMjAyNCA3OjA1IFBNDQo+IFRvOiBQb3R0aHVyaSwgU2Fp
IEtyaXNobmEgPHNhaS5rcmlzaG5hLnBvdHRodXJpQGFtZC5jb20+OyBMaW51cyBXYWxsZWlqDQo+
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2Yg
S296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25vciBE
b29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBCdWRkaGFiaGF0dGksIEpheSA8amF5LmJ1
ZGRoYWJoYXR0aUBhbWQuY29tPjsgS3VuZGFuYWxhLCBQcmF2ZWVuIFRlamENCj4gPHByYXZlZW4u
dGVqYS5rdW5kYW5hbGFAYW1kLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gc2Fpa3Jpc2huYTEyNDY4
QGdtYWlsLmNvbTsgZ2l0IChBTUQtWGlsaW54KSA8Z2l0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMS8zXSBkdC1iaW5kaW5nczogcGluY3RybDogQWRkIHN1cHBvcnQgZm9yIFhp
bGlueCBWZXJzYWwNCj4gcGxhdGZvcm0NCj4gDQo+IE9uIDA4LzA4LzIwMjQgMDc6NTMsIFBvdHRo
dXJpLCBTYWkgS3Jpc2huYSB3cm90ZToNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzk4IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+Pj4gKyAgICAgIGJpYXMtcHVsbC11cDogdHJ1ZQ0KPiA+Pj4gKw0K
PiA+Pj4gKyAgICAgIGJpYXMtcHVsbC1kb3duOiB0cnVlDQo+ID4+PiArDQo+ID4+PiArICAgICAg
Ymlhcy1kaXNhYmxlOiB0cnVlDQo+ID4+PiArDQo+ID4+PiArICAgICAgaW5wdXQtc2NobWl0dC1l
bmFibGU6IHRydWUNCj4gPj4+ICsNCj4gPj4+ICsgICAgICBpbnB1dC1zY2htaXR0LWRpc2FibGU6
IHRydWUNCj4gPj4+ICsNCj4gPj4+ICsgICAgICBiaWFzLWhpZ2gtaW1wZWRhbmNlOiB0cnVlDQo+
ID4+PiArDQo+ID4+PiArICAgICAgbG93LXBvd2VyLWVuYWJsZTogdHJ1ZQ0KPiA+Pj4gKw0KPiA+
Pj4gKyAgICAgIGxvdy1wb3dlci1kaXNhYmxlOiB0cnVlDQo+ID4+DQo+ID4+IFdoeSBkbyB5b3Ug
bmVlZCB0byBjb3B5IGFsbCBvZiB0aGVzZT8gSnVzdCBzd2l0Y2ggdG8NCj4gdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzLg0KPiA+IEkgdHJpZWQgd2l0aCAidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxz
ZSIsIGl0IHdvcmtlZCBidXQgYnkgYWRkaW5nDQo+ID4gdGhpcyBhbGwgdGhlIHByb3BlcnRpZXMg
aW4gdGhlIHBpbmNmZy1ub2RlLnlhbWwgYmVjb21lIHZhbGlkIGZvciB0aGlzDQo+ID4gcGxhdGZv
cm0gd2hpY2ggaXMgbm90IHRydWUuIE5vdCBhbGwgdGhlIHByb3BlcnRpZXMgaW4gdGhlIHBpbmNm
Zy1ub2RlLnlhbWwNCj4gYXJlIHN1cHBvcnRlZCBpbiB0aGlzIHBsYXRmb3JtLg0KPiA+IFNvLCBp
cyB0aGVyZSBhbnkgb3RoZXIgd2F5IG9mIHJlcHJlc2VudGluZyB0aGlzPw0KPiANCj4gSWYgdGhl
eSBkbyBub3QgbWFrZSBhbnkgc2Vuc2UsIHRoZW4gc3VyZSwgeW91IGNhbiBrZWVwIGl0IGxpa2Ug
dGhpcy4NCj4gRHJvcCB0aGUgYmxhbmsgbGluZXMgYmV0d2VlbiBlYWNoIG9mIHRoZXNlLCBzbyBp
dCB3aWxsIGJlIGNvbXBhY3QuDQpPaywgd2lsbCBkbyBpdC4NCg0KQWxzbywgZG8geW91IGFncmVl
IHdpdGggbXkgY29tbWVudHMgd2hpY2ggSSByZXBsaWVkIGluIG90aGVyIHRocmVhZD8NClBhc3Rp
bmcgdGhvc2UgY29tbWVudHMgYmVsb3cgZm9yIHJlZmVyZW5jZSwNCg0KPiBzZDFfd3BfMF9ncnAs
IHNkMV93cF8xX2dycCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIG9zcGkwXzBfZ3Jw
LCBvc3BpMF9zc18wX2dycCwgcXNwaTBfMF9ncnAsDQo+IHFzcGkwX2ZiY2xrXzBfZ3JwLCBxc3Bp
MF9zc18wX2dycCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfY2xrXzBfZ3Jw
LCB0ZXN0X3NjYW5fMF9ncnAsIHRhbXBlcl90cmlnZ2VyXzBfZ3JwXQ0KPiA+ICsgICAgICAgICAg
ICBtYXhJdGVtczogNzgNCj4gDQo+IFlvdSBtaXNzIG1pbkl0ZW1zLi4uIEkgaGF2ZSBkb3VidHMg
dGhpcyB3YXMgcmVhbGx5IHRlc3RlZC4NCmdyb3Vwcy9waW5zIGFyZSBtZW50aW9uZWQgYXMgcmVx
dWlyZWQgcHJvcGVydHkuDQpEbyB3ZSBzdGlsbCBuZWVkIHRvIGRlZmluZSBtaW5JdGVtcz8NCg0K
Li4uLg0KDQo+ID4gKw0KPiA+ICsgICAgICBkcml2ZS1zdHJlbmd0aDoNCj4gDQo+IGRyaXZlLXN0
cmVuZ3RoLW1pY3JvYW1wDQpJbiB0aGlzIGNhc2UsIHZhbHVlcyBhcmUgaW4gbUEuDQpEbyB3ZSBz
dGlsbCBuZWVkIHRvIHVzZSBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcD8NCg0KUmVnYXJkcw0KU2Fp
IEtyaXNobmENCg==

