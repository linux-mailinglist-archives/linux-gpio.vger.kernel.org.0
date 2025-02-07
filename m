Return-Path: <linux-gpio+bounces-15502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B69A2BB49
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 07:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D04F3A600E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 06:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B549016DC3C;
	Fri,  7 Feb 2025 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="epJXO5Cx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FB42AB4
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 06:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909271; cv=fail; b=YuiDCKo6mhXFERDG8+/7KTPFs0Ls2X19UA5+v9h/WmRmpPf5rpju8q4TvEuZWhIoNEsjOcs2O+R8K2QkXGESoipqYFm2VVNbko0GPQZsgDdXSqGNUHeen46/F0kSiTkk2mVB3FlBiAEAnGam9wNhXXVFFhksTQMis499QC9W4Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909271; c=relaxed/simple;
	bh=SUca9n27uRMvzc35gpJf67sNoaf8Utht1IZEMGQfTnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qv1tnwLF4THcvUoH5BjOYLuJ8XfhoVZdM+R5duseYn/+iWHBot5DJPiaa5mM+lAqAqv03dTSlpep97Pnt0my6o6gGiEyw5boHEtdzaQb/SdLenMcrfRWDW5/ehFzR/mlKksuMyf9/K7RafNEoxPH/OX/jIo+NKVwl3FAmF9828U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=epJXO5Cx; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZoUC48/clPHB/KTT5cQJlkbxrFFK1b4+kdsbsm3+uEYeKxA0FPEEH2AdtIYs/JdFNZ0Ijg+kTF4QqjMC/Ds65N0f3xS8OSynIOvuvyeTJDPviK4CfVi1SnJP8zXvSoEK3F04dzSx6cGLeCTqsbsxz18TcZc80nvakfuA4MnPY9NmpseznwZ2196OIMrbnYLLBsP4BpYuvKJ3ihNczlb8zlpP13hfYVm/Gk98ddiCMZr6YEOw5bJi4v+JVonXGrVfhqMT+dqFzROiiawr4C07bkto64SzQ1PuD2maN0gqyca7HcCZYbQ+v0LtT48cGxOETKiTX0GJa/2FtqBy/4bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUca9n27uRMvzc35gpJf67sNoaf8Utht1IZEMGQfTnA=;
 b=NVvveQJQvHG7OTLADdKLKFjY1tyd6iJ5dHhkElym2qI5VpFd63TUeFoNow3qd1AHrBB4CVXig3Vpsk/nJIQ7XWfB/R84SHS9POQAItynqaFTtFF465V+kKaDYwnygA3cVa5oOkNhRF8SeFykf46apkEMWrsHAO+lMbJI1Idf4qAyo02nuvvjA5DpRFX69crhd+IVl2eXySgmoyPQtzrbotoZq/4quC45H63iTq089LIYl1gPEVHp/HVsziM7IKs6tXtzezn17E49inyRb0Nyxenf96SzVsf8dcu0quJES6lYaLbAJVJcni2vZFD2E1ihd8NJbDdVLdxmf7G051/gDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUca9n27uRMvzc35gpJf67sNoaf8Utht1IZEMGQfTnA=;
 b=epJXO5CxL9YfKxqc7TtAEkUzlyTX0dJlIL70WBVqIoxn9kSAqeZDsEC6wk9iuUpsjceqsNHGpsQnSOjU+RnKYaeWESw0Q/SHsXnCFWMNEo6BPghAAPElXFR172I2ak1CKKHcXV4qSiygEY6juym7poxufICDh9Jzz5fXZol5O/AlMobsowX2la3mo4z9DOj1ag+qw9R34Cts5mMNNa6cX8+MoAZcog59Cit6ZOekj+o/5446ZxXErNAn54owiY0vcnHdkt1TDxChCfvIUR4aoBQHwHGF1jVGxgyHH1DlW7lp+5eRNlH62Ch/a0UGHLQ8Ied2ocN8yuX1h1Q7GvBzCA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VI1PR04MB7168.eurprd04.prod.outlook.com (2603:10a6:800:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:21:05 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 06:21:05 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes
	<johan.korsnes@remarkable.no>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Topic: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Index: AQHbeMNtV5WxXSj9skyddrTaKpnL5rM6mI4AgADC/gA=
Date: Fri, 7 Feb 2025 06:21:05 +0000
Message-ID:
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
In-Reply-To:
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|VI1PR04MB7168:EE_
x-ms-office365-filtering-correlation-id: a4582c82-08b8-4432-b720-08dd473f9a44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ekIyN1ltWEkyZGYzM2o5alYvaGJQYzh3bXBNVXV5MkdXUHRYdUJoVjkvcVUx?=
 =?utf-8?B?Q0t0Yjd4eXhaWm1lQndZLzU2c3FlaEFMNytIcHVxeWZpa0xCNDdKVzJnZURw?=
 =?utf-8?B?UmoyOVlrSUsxK2UrTWhoc2xXbnU5dExwTS91N3FUSzFlWGJqanV4Y3FSZkFa?=
 =?utf-8?B?VUxjR2xYZGlFOFdnQXVWNGpTazNXRVdQdlZzeWFYc2pMamI2RkFjZ0pXWUlP?=
 =?utf-8?B?R2JzVTJoVkxFWkt0SGNFelFIS0lUdDFkSkVVZ3ZheGpDSmlDNGxaMGt6OFEv?=
 =?utf-8?B?enVyTUpxWktzRWtaVk8xOWh6ckFxbUxzWSswMzVwMlN5K2Z6SEcvcWt3NU94?=
 =?utf-8?B?bnFsWUJWOXdrSlJFTWpNN2Nid2oyV2pyM2h1RnBnUDdHNjRtbDFkWEpiMFh5?=
 =?utf-8?B?c0Yybm5JbDJWeE8zMnR1TEcraWwxYm5NWHRteW1oLzE0ZnIvUkRlVWh1cmM3?=
 =?utf-8?B?eG9jeVlFRW1JbEh0UHM1c2NiZjFsK3Y4T2lJUHBmbk5lR05IV2J5TWxnR00z?=
 =?utf-8?B?ZFExNUt2eGorZlhvZS9mRnNLM3ZjeXVralhXZlRMNlJVVXlZR1hpTEppMzcv?=
 =?utf-8?B?SC9LdWt1R3BCZVN5Tjdwak9MTmlyY1poNm0waFJlN2x4dDI1Mno1TWRLK2xy?=
 =?utf-8?B?aDA3N1VUTnFnUHJZTHNLSDZhRm9YYkl2VEJ2K3dxaDJ0SXloQ0xqSy9OL2tp?=
 =?utf-8?B?ZHI2NzVzNXE3dWZCc1U0aG1GQ0FDVDROMHhxcVJFQitLRFJYeEkrTjkxZXh0?=
 =?utf-8?B?UDZmTk1aWFpnUUs1ZmdQK0VJaG9CTG9vQTJuNnFoYTJqcWVvR3JvTVJmc1NZ?=
 =?utf-8?B?enR3cmcyamxUaWthOHpHYzdPMXUxeEM4ZWViY1J0TWtmNVBCMzVzeFovSGJ6?=
 =?utf-8?B?WjZuci9hU3MwMTh2WFp0bXZQWFhUNW1hMkRCb09NNDVWS2RCcmV5YUY5RWdz?=
 =?utf-8?B?cU92U3Rrd0xwS2g0WHRSbUh5NURQRlREbExISWk1N0ZNOHRMN1l3RWFYYjJT?=
 =?utf-8?B?NEpFWkFzaDNoTFlDMkxQSGs4TDNQL3ZMdVRCOUY0Z0pwa0RWZFNQMlZOc2Jn?=
 =?utf-8?B?bFMyZlB2N1NVSjhmbURudFpwZ0M4TzBIZWhTMFNValZnT1VWc0JRV3BDcnlN?=
 =?utf-8?B?T2JzYXY0Wnl6eXM3alpZZkpZc2xacTFqS2swTEhWZUNPTDVoRi9XK0Z5N0pP?=
 =?utf-8?B?VmwwMmRNdmpRR2JUcFN5U0ZVcFpKeHF3Q0NJNjExeE5zVDAwV2NEVHp1cXBC?=
 =?utf-8?B?aFphb2NLTmhWeUdsditZK0w5MHRpYk9VVmIzVVVrRnl3ODlRNy93a2lySkx2?=
 =?utf-8?B?S2VxZTltVVhlRVBSVWdhMU9OeGx1VzB2ZTBiMXY3SDZaWGQvaFQrenZsanJY?=
 =?utf-8?B?ZmNRYWVWaThaRElnTEkwL2dRTnJWOXZzWlBpcllCTE5idjNqVDlxM01xdFNs?=
 =?utf-8?B?NHl6U3JsNUFoMzVzeE4wMjRGVk41R3N4SWxmU3lMcENlZ1dreitrREhRUm92?=
 =?utf-8?B?NVc5aHFrUU8xT09kam1rc1RpSDNseXVPcGx3Qk03M1FuUmxMeUxUSngray9q?=
 =?utf-8?B?WHNsWUpOYXR0aWdJaUt3SjFLcWhVL01VOHJHVklsdGZlaWs2Z3hHNVBpNk80?=
 =?utf-8?B?K21TUVpYMmpTa0JEK2pwSWtSU1JqcFdlcVZxbGtEQzRIMmhaYndBNVhOdDJR?=
 =?utf-8?B?ZjdEUExGQUQ5aFJsdVg3VUt1SXluMlFiOHpLL3hoaW8vZkxtNHN1L0U0YUN5?=
 =?utf-8?B?OVpvRElPeGpwU0EzZ1BtMmRLeGJoSUtUZHRlb3dLYUdFTk83b01lZnpaY1Fu?=
 =?utf-8?B?TlEzT1MvWE13ZkU5RjV6TFFQWUVoSXA3OWpid2JVLy9RQ3F4cmVQWnZXREZy?=
 =?utf-8?B?a3ZwbHVlUUhLRjdkZEROU1Q3a1dwdFZ1V2RWMXVxdkd2WWJYWjhwT1EyRURz?=
 =?utf-8?Q?rx/5z09BWEbICFwEglUGMtbdHF4mNGMD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVMzTmtvYmlpLzVvM3pSRlFodmttZCsxcS9vMTlhcmprN05uU1IxK1FDMGd6?=
 =?utf-8?B?VnZETS9hcEtrS2NVMXZwamE1eTlWRlR5eHh3RFg2UFdVUVk5aEVGNFBsbUJE?=
 =?utf-8?B?eGJFSWUwdkFrVCtMbTZOYjF2MkFEbTdYbHlzd3R0NDA3d2ErdVN3VU9DTzlq?=
 =?utf-8?B?ZG9OMmxXVzY5L3AwVVQzUFRaL2dmSk9hT0RsTHhteU5Fa01idit2MUc3UFJv?=
 =?utf-8?B?T2txb2xrNVBEcUZWRkZ3ejJRUnd5K0J1aEFTTVVYcTZocW8zK01IOEliNmVt?=
 =?utf-8?B?aG5QTkFzNjVyV3ZxQ0oxS3p3eUcvQmRRTEduTHB2K1JuMXlIa0NnL2NiL2xw?=
 =?utf-8?B?d2ovYmZZeXRCNXlTSkozd0l3aGY1b0NtOXFoakJ4MzlXOHpianJITk1VVlUz?=
 =?utf-8?B?cjBhR2VHNEpvQ0R0ZnVoVkZjTitkcnNERnFTNTZvR214dlloeWJIQ0txSHA1?=
 =?utf-8?B?Nlk4eldYSjJlT3dZbWZmWmJzVlNTd0JIQ2xHKytrSGJ6OWoyQnY5Yk0zV0Zn?=
 =?utf-8?B?M1FJT0VvSkFRay9rMU1GTHFmWlhoRVorU0dGamR3OVpwYjNYU0RiMlc1cGIv?=
 =?utf-8?B?eCttc2JMS05BTXN0NGtHQ2pkc2pzUXQyK3A3M1krZE5VTkNIaXNxQ3RrSnM2?=
 =?utf-8?B?c1hablQvY1RsdEJjTzBTR3J5TGVTL1dTR1U0dXpONkRkUkFRTW1vd0h5T29H?=
 =?utf-8?B?WnY0cFlEU0tTbWkxT2RaY21YTnRXakhqZ1NOa01ER3plK1JRWHgvcklsNE5x?=
 =?utf-8?B?bGNlV1dqQWtHcW83bC9jSzdRRXE0WEdPeW9yNWJ1eVg3RDhIWlVSbkJONTF5?=
 =?utf-8?B?a1l4S0h6ekw1UjdkaFB1cXhoUmlCd1gwZ09hQ1c3ME03TisrZjJOMTNBQSs0?=
 =?utf-8?B?eWZHbnJraTZrK3F0V2tsdGxTdU96ejlYUEdzM2k1elIyWllhWnNoQmV6L0dh?=
 =?utf-8?B?LzVCT2J3cXoxUkRIWUhjZUtMNjVDcC9aYW1IUWN1ZWVSd0czUzBuekppTCtK?=
 =?utf-8?B?TFNZbGx3Z0lEcHdPUFRkNzRjbWJ4Q0w4VzhCaXNvT3owclgzanArM2ZubEpq?=
 =?utf-8?B?RCtpRmVNNlB4eWFOdTh3NnI2ajJ0a1V1RHRQbWhPTDFpQzYzYy9yZzR4Tmtw?=
 =?utf-8?B?VTdRN0hJT050STNPTEhqRzVSWmt0WWh0STV1MkNkZW9SamFjK0NOWXRVZ1V3?=
 =?utf-8?B?LzVYOUhDdEtEa05SL25kb1lvMWowRmZyanQxK3A5L0NTcjdwRkhOUklRc1Iv?=
 =?utf-8?B?K3d5N2NLSGMySTRweDFzRDR2M1FuNVU1NE1DUDFZV0EveHR0Kytnekc3YmxU?=
 =?utf-8?B?WUdEU0c2dG1nTUpYSmowb08vYjE2aHRpN2g4R284YmdNR1pESWluMWx2NGVY?=
 =?utf-8?B?NzZHY254NEdhQ01ueHJJdlFLM3FKWjEwM2JBR0U5dERvM0U5R1lNK2dyVCtS?=
 =?utf-8?B?MUZ0SENOOHRlWFJhSStheGprY2REKzN4Qi9YYW93YUFFYXArT2hLb1FBTTVO?=
 =?utf-8?B?SkQwTTFlWERZQy9pckhLQkp6azZoVTBoWVVIVnMzb1pkdjlOenp6UGlNQ0ZO?=
 =?utf-8?B?NDE0bGZqYjFOakZFTmNCN1pwVDJDTTkzS0xOYlg4Yy9kay9sZWF5dmVzckc4?=
 =?utf-8?B?QTVieFpsUlk4SXRJWGFBaHRxNVBDV0R2djRqL1IyWTFUQlRRempza0pWajZ6?=
 =?utf-8?B?d1NSdHdSR1pQaGZzRmppZHRCZEcyTitLMjRtbkdYMnVWL2xXU3d3YlpjN2FD?=
 =?utf-8?B?aWRyNmRuaGlreUd6eXVzWVdhVGV4YmN5T2pnckcvcmdxQ2ozQjdvaUZrT05T?=
 =?utf-8?B?UHVQVlA1aGtFTmluUk9QUXdMd0pRTXpuM0VHUS9SK1FwZnF4RU9ZZFZmL2Nt?=
 =?utf-8?B?S2FjcEFUcG5vL1h0SHcrMklCaFZVYVE0RG9DWDJ4ZGdSN3dscTd4Z21WNGZ6?=
 =?utf-8?B?Ny9Sc1B4KzR5SXVhU2NZeEFVZlgxL0pTZ0RiUm9YcitLN05WSFRrNE9QVkc0?=
 =?utf-8?B?cVp0Q29LZ0llT0Z4MC83V0FkazZ6a1pjb2gzWGRiN1o5ZUEzUDlOMDdUTHlu?=
 =?utf-8?B?WDlKWXc4bVZxOGJlcmcwUkN5dk9Oa1BQRktiVXU3eDE4Rmhjcmx4aUFrZ2xJ?=
 =?utf-8?Q?pZxg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4582c82-08b8-4432-b720-08dd473f9a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:21:05.3016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/+XdITeSmxd6EBRl3H9TKj2j6rzHRJrpLN4JnBMA9SQVcG/uY5HV8RbT4MOlV7famCFYPYZ/QP4oCfi3xs68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7168

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDIwMjXlubQy5pyIN+aXpSAyOjI5DQo+IFRv
OiBKb2hhbiBLb3JzbmVzIDxqb2hhbi5rb3JzbmVzQHJlbWFya2FibGUubm8+DQo+IENjOiBsaW51
eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgQmFydG9zeiBHb2xhc3pld3NraQ0KPiA8YmFydG9zei5n
b2xhc3pld3NraUBsaW5hcm8ub3JnPjsgQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlvOiB2ZjYxMDogYWRkIGxvY2tpbmcgdG8gZ3BpbyBk
aXJlY3Rpb24gZnVuY3Rpb25zDQo+IA0KPiBIaSBKb2hhbiwNCj4gDQo+IHRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+IE9uIFRodSwgRmViIDYsIDIwMjUgYXQgNzoxN+KAr1BNIEpvaGFuIEtv
cnNuZXMgPGpvaGFuLmtvcnNuZXNAcmVtYXJrYWJsZS5ubz4NCj4gd3JvdGU6DQo+IA0KPiA+IEFk
ZCBsb2NraW5nIHRvIGB2ZjYxMF9ncGlvX2RpcmVjdGlvbl9pbnB1dHxvdXRwdXQoKWAgZnVuY3Rp
b25zLg0KPiA+IFdpdGhvdXQgdGhpcyBsb2NraW5nLCBhIHJhY2UgY29uZGl0aW9uIGV4aXN0cyBi
ZXR3ZWVuIGNvbmN1cnJlbnQgY2FsbHMNCj4gPiB0byB0aGVzZSBmdW5jdGlvbnMsIHBvdGVudGlh
bGx5IGxlYWRpbmcgdG8gaW5jb3JyZWN0IEdQSU8gZGlyZWN0aW9uIHNldHRpbmdzLg0KPiA+DQo+
ID4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gPiBDYzog
QmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KPiA+
IENjOiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Sm9oYW4gS29yc25lcyA8am9oYW4ua29yc25lc0ByZW1hcmthYmxlLm5vPg0KPiANCj4gTG9va3Mg
Y29ycmVjdCB0byBtZSwgdmVyaWZpZWQgYnkgbG9va2luZyBhdCB0aGUgbW9zdCB0ZXN0ZWQgZHJp
dmVyIGdwaW8tbW1pby5jDQo+IGFuZCBzZWVpbmcgdGhlcmUgaXMgYSBsb2NrIHRoZXJlIGluZGVl
ZC4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4NCj4gDQo+ID4gd2hlcmUgYWZ0ZXIgYSBjb3VwbGUgb2YgcmVib290cyB0aGUgcmFjZSB3YXMg
Y29uZmlybWVkLiBJLmUuLCBvbmUgdXNlcg0KPiA+IGhhZCB0byB3YWl0IGJlZm9yZSBhY3F1aXJp
bmcgdGhlIGxvY2suIFdpdGggdGhpcyBwYXRjaCB0aGUgcmFjZSBoYXMNCj4gPiBub3QgYmVlbiBl
bmNvdW50ZXJlZC4gSXQncyB3b3J0aCBtZW50aW9uaW5nIHRoYXQgYW55IHR5cGUgb2YgZGVidWdn
aW5nDQo+ID4gKHByaW50aW5nLCB0cmFjaW5nLCBldGMuKSB3b3VsZCAicmVzb2x2ZSIgdGhlIGlz
c3VlLg0KPiANCj4gVHlwaWNhbC4gSSB3b3VsZCBpbmNsdWRlIHRoaXMgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLCBwZW9wbGUgY2FyZS4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGRyaXZlciBpdCBzZWVt
cyB2ZjYxMF9ncGlvX2lycV9tYXNrKCkvdmY2MTBfZ3Bpb19pcnFfdW5tYXNrKCkNCj4gY291bGQg
aGF2ZSBhIHNpbWlsYXIgaXNzdWUsIGJvdGggd3JpdGUgdGhlIHNhbWUgcmVnaXN0ZXIuDQoNCklu
ZGVlZCwgYW5kIGFsc28gdGhlIHZmNjEwX2dwaW9fc2V0KCkgLyB2ZjYxMF9ncGlvX2lycV9hY2so
KS4NCg0KPiANCj4gQm90aCBpc3N1ZXMgY291bGQgYmUgZml4ZWQgYnkgY29udmVydGluZyB0aGUg
ZHJpdmVyIHRvIHVzZQ0KPiBncGlvLW1taW8oKSB3aXRoIGJncGlvX2luaXQoKSB3aGljaCB3b3Vs
ZCBhbHNvIGltcGxlbWVudCBnZXQvc2V0X211bHRpcGxlDQo+IHN1cHBvcnQgZm9yIGZyZWUuDQo+
IA0KPiBJIGhhdmUgbm8gaWRlYSB3aHkgdGhpcyBkcml2ZXIgaXNuJ3QgdXNpbmcgZ3Bpby1tbWlv
Lg0KPiBOb3QgeW91ciBmYXVsdCB0aG91Z2gsIGp1c3QgcG9pbnRpbmcgb3V0IG9idmlvdXMgaW1w
cm92ZW1lbnQgb3Bwb3J0dW5pdGllcy4NCg0KSSBjaGVjayB0aGUgY29kZSwgZm9yIHZmNjEwX2dw
aW9fZGlyZWN0aW9uX2lucHV0KCkvdmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KCksIHRvIGxl
dCB0aGUgaW5wdXQvb3V0cHV0IHJlYWxseSB3b3JrcywgbmVlZCB0byBjYWxsIHBpbmN0cmxfZ3Bp
b19kaXJlY3Rpb25faW5wdXQoKSBmb3IgdmY2MTAvaW14N3VscC9pbXg4dWxwIFNvQy4NClJlZmVy
IHRvIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC12ZjYxMC5jLCBpdCBpbXBsZW1l
bnQgZ3Bpb19zZXRfZGlyZWN0aW9uIGNhbGxiYWNrLiBBbHNvIGZvciBpbXg3dWxwL2lteDh1bHAg
cGluY3RybCBkcml2ZXJzLg0KVGhpcyBzaG91bGQgYmUgdGhlIHJlYXNvbiB3aHkgbm90IHVzaW5n
IGdwaW8tbW1pby4NCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0KPiANCj4gWW91cnMsDQo+IExpbnVz
IFdhbGxlaWoNCg==

