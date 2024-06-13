Return-Path: <linux-gpio+bounces-7408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0047906412
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F7C1C21337
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 06:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8675E136E12;
	Thu, 13 Jun 2024 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DMkfLFLf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D0FBF0;
	Thu, 13 Jun 2024 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260244; cv=fail; b=iKot4acy0WRCyP0UvaAM76qgMF2AJxfm9tipIeZm6xrn6KFSZU1WJ2oFYrIyj1B9/MYAPKcm6LKGqiKq0vYqft5mB6wnauD5doj3CmhMkusZY1ED4vhara+xRg239tSjY+decGtzz5hXqsoiO9VA5PZjIitPWG95hmup1ySRxag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260244; c=relaxed/simple;
	bh=dd27tkCObX49zwebK5/gHvSOJNc8VOuIjCL1tA/ZR7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IVW7eKNxdmBy3XFBKz/AoKMfn7JXtNKd6RBDS1nRQaIZ7k0sW1KAJD0QkLjFg48CZG8TX9qPZvcROR346AFYElB7P4dfeYU8rd+zrUib2y+9821JpdHOMTT+vVxHY6X6ceMOnAkz4GY3Lu1uZ+teSmLe7xpnKOE/dxuPH1Yh6hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=DMkfLFLf; arc=fail smtp.client-ip=40.107.21.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTqhsTVfnBaFwclA+zv72YVFLEwc3MTRze0z8pE5caj+W6hH3iB60NaCmeHjnV3fTOP635NlKd/sUbSJc2/X7NTrgcZsfRHwsYLXv4xSZiNm31z30lwdv8L39STY3kJPz9waoiU0NzYefCGouk/robxNIPcadNeY30aQmth0s4+rMjckk+/P6z4TI9zbgHx7D4lud8yq2zN1jqwEme4UzQ4T2sOctI+2KyBa6t57zB8kvR7pHnSandEAGH+uC6VGNOK7M/UXoppPgb6d25uJD+BbYGzrmKQScgmjk3o141lvriLvVrBYbTUjsZ8zCIsgP9t8IeB1jteygEy8LSelDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd27tkCObX49zwebK5/gHvSOJNc8VOuIjCL1tA/ZR7E=;
 b=dqvNFEPiqaAIF+jQbVQW3OJ8cOKoV2v13TBCQhmEJZWHr826H1Ix2LNBGEDj34XJxhJucvPTQXAKBQwDXo0c/7frjcCnjXV7CD3U5a0Cz9MjZvROblgomohrAow5Ga2KmxAmk4mZ686z+t09onguDYHoYOuF2tslttRen9+kbIJ2KzpsoIf0MHqhh0CEgkuLamUYzBe95WTaGS7WOsizZog4XVlnpcEKITtlROWB1YA4WP/rYroGDi4iDvVLHztfPiPBPrZzypdI+SHR1/OV/rclgCtQjN+INNIhi2qHPKUwwqpxMAHkncp1jXzkdaAdL6drnAgpqKJwxV7YWPUnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd27tkCObX49zwebK5/gHvSOJNc8VOuIjCL1tA/ZR7E=;
 b=DMkfLFLfVy7NObJmCCR9f20BAs5bsjqPxnQsK71yQatJlYagOaAjlLAQpdPoeR3k+vUnNJeW+r/zwNJwIQAeR7xSnRpLc2FTSHlS45FC74Jt+z/7FkHzMGq5XuUaKoY1Sb64mjhMAVxoo87/Hel+6i+Q/bjElP86fV6JqRdLcIU=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 06:30:38 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 06:30:38 +0000
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
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z+AFfJc9w7tEOWjM+RsEK2hrG9t/yAgAenCAA=
Date: Thu, 13 Jun 2024 06:30:38 +0000
Message-ID:
 <AM6PR04MB5941328E3343E5263C87528D88C12@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <CACRpkdbpL=HUXj0hFAo+JNki_RA9aix2sW1cg13g9=89d93PZw@mail.gmail.com>
In-Reply-To:
 <CACRpkdbpL=HUXj0hFAo+JNki_RA9aix2sW1cg13g9=89d93PZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|VI1PR04MB9761:EE_
x-ms-office365-filtering-correlation-id: 4ab8f76a-6d69-4124-1caf-08dc8b7256f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230034|376008|1800799018|366010|7416008|38070700012;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2pva2ttQUVzNS82bUFEdlkyUnNLc0FWUS9TSU9ab00rUE9YVWEySWQyOVRR?=
 =?utf-8?B?dW9zQVRqWkJxcDVrVEFJdjRhMTNnaWxnclJaaFdFT1BnYnM5elZ5T2Q1cjAv?=
 =?utf-8?B?dUpNZ2NnQVQvME9NRGU1c2VXeUVYZ3cwb0JTaW5jL2haRkNVODREZytEOEFE?=
 =?utf-8?B?a1h3VnBLQlU2MU1zNEVZNVp0QU93d0lzWkxNOTRpaGNkZnk2WFhhTWxWSnB2?=
 =?utf-8?B?S3dHaFp4MUN5S1kxa0RCd2hZZ3h4WFlBVDZYWEZlTy84Rm9YcitFcVpTU1NB?=
 =?utf-8?B?c0tqQWhJRjZTbUxzOThBSytuTHRYMFVwai9jVTUzZ1ZJczJBZkRSQmdVRnZH?=
 =?utf-8?B?UlZ3NXI0SVdDNG12WEpLeDFVb3VzOXRWUFJ6VHJXZExYY2tmYXEvNWtPVGR0?=
 =?utf-8?B?bENJaTNvMDQ4WFV6ZjVMMm1wUkI5MTVMK1JmTy9qRFUzeTFVYXBXVHdKN0JB?=
 =?utf-8?B?blA4YmJPNHV1Y3p2bzdJaWVyQVdKbDR3RGlxam00N0I4MDBzK2FmL1lERFdw?=
 =?utf-8?B?WEVFditCeTdOMVZSOHdNTU80RXJIOVJyd0NMYm5mdWRtSmlQYkZibjR2NDVs?=
 =?utf-8?B?cXl4OVFobGl6blNad0FLek5wSVdXZUpyMklxRVlxN0trQWV0c0Zoam5YUkFp?=
 =?utf-8?B?U3pwUVdJb1B6OEZxZytSVWEwUHFuTjlhVGNpRldhbmp6dlRWd1Zod2RZclZt?=
 =?utf-8?B?RW1uQnRzZVRCUHQrc0l6UktEMmJhRHBoN01zOEJncnVDQWVhZndqWXJTKzRV?=
 =?utf-8?B?am03YWI5eWRhYnpHZWdTS0Q0SEVCU1BGM0xNYm1EeHdLQXhuQTZKVlVlZWVr?=
 =?utf-8?B?MjNueVo3eExvR3BCU2hKL0NXbWpYNGlGbE1teHJnbStGdUVsRmR3NWtQOUhF?=
 =?utf-8?B?Q3RmUG8vODdjejUrbEdJWG40Y0J6WE9SWTA0K3ZBT25OZkdwaGZlYllxQ3g5?=
 =?utf-8?B?OENXNm13SEVhYzNNQWsvb0hHL0tCVUpXMThWdDJWUVVpUFlveUp4K21xeldv?=
 =?utf-8?B?Y2ZvNlM3ZDlzVG5VK1BrcmQ0Rnpwd3BWMTQyaVR2aVNMRm5BOGRiMnE3eGJN?=
 =?utf-8?B?bUZrZkUzQ0xUbjNZWlFPTndKNU9JN25nNGY0bVN2SE91TW41VlVCWkNzblM0?=
 =?utf-8?B?U1FjRWVIdVMzKzhic2UyeW5UYjBhR1Q5MEhpS25EWVRpd29CVkw4QUJJNFQz?=
 =?utf-8?B?S1gzVEc2aEE3TVBEWE54a25leXFEa1BMcXkvY2JlUUEzcjdEWU9CVGU5bjNX?=
 =?utf-8?B?Nm5JQ0N3RVIvZjFtWDNDM2JlMTZWTHQwYjRUTWF1S04zRWpHcDdBYkhyRGRM?=
 =?utf-8?B?WjM4Z3dod0dDR1Z1M1dDZEFjZEFlYnNncWVmcjltVFVVaWdIejlZT1Y2dGEw?=
 =?utf-8?B?M2c5T2lYVEplanpGckY5MXc0K29vMXlXNkZ2blBUR2ZuYlREZDVvZzBySDNw?=
 =?utf-8?B?K0tIUllVRGNWdWJFZDBsZUNHOUNsWDNVaWk0YXFsTTlCYnMycitUN0tnL1BQ?=
 =?utf-8?B?Q2N3QzdnL1ZGZzdoUnNYL2ZWb3ZpZFNpcnN2RVIwWGt1bnJWTW5YWnpKM1FM?=
 =?utf-8?B?OGVBbkZhMEcxSTZDT0JtNGRKR0NNa0FsNm9uV1lxUEgwVGNwYlJtWk0wdmd2?=
 =?utf-8?B?WWt4MFN6MXFadXdlWEJxZzZldmFwTnBFbnNIR3VYQkFVMWVpNXFpMmFJWFJ6?=
 =?utf-8?B?NWR5blM4RHpIa3pTU0JpN09GWWZwMk5OS2p2cEduT1oxWjNkeFpzUTZ4NjVH?=
 =?utf-8?B?NFRLMko0T2ZDSEdXUTk4WGVoM0I4TUFyR0QyN1RiZ0FhM3pWckJBdjNFcE1B?=
 =?utf-8?Q?juZTKrTPf0Lh58Q27w7luwGLSxHcORV9Xtjng=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010)(7416008)(38070700012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UENvRms5OFJ1QXBJSFpLdTlCZXViNXYwYTRZSXZqdGwrQnFkNjMvQzE3bEVL?=
 =?utf-8?B?dWU3UUw5VzI0NGVLRHM5Q1ZxVGFCN1pPbkNIR2VtZjB5UVlGSFlmOHFtU0w2?=
 =?utf-8?B?UUhGVjhBM2U2K084N0I2Q3ZmZVZQVjcycFBYWUQyTy81c3dBVndZOUk1NlJQ?=
 =?utf-8?B?OTU4WEEwRGw0TU1NUlhVWkZoclJVcjU5MjFGblFIYWJoNmpMcnlBTWNJZWx4?=
 =?utf-8?B?b1Q2N0NuZlhKTENjaHFIU0ZxNVhJM0FQMlFlL3dNTFBTWXM5MGQ0U0RCQWdp?=
 =?utf-8?B?OFNwWjNTQldkWWkvaHduT0VKRmZEQ3R4SHllb1hoTWEvOUhNK0JNbWNQTzMw?=
 =?utf-8?B?QlhNV216QVJoK0orMVIzakhVNVY4V1pqRFoyTkI2QVRwd3dxVVVOUVFLZ3pr?=
 =?utf-8?B?d05uZmJtRkV0bEtDQ1hiaWZuUGhoUjA5RnBoblpTVUdvWkY3cnltSmQ4ekoz?=
 =?utf-8?B?NWM4aUl2S1FpT2s3M3R3ckRZcExnQ3pmYnNiU085V2NmRERwSXRNZ1ljdS9v?=
 =?utf-8?B?c0tldXJ5Q0QvbFdVVDB3cUdCMDM5S09qdm5WZTkyaTJLenhwc2pMbm5FY00y?=
 =?utf-8?B?TUs2Lzd0NTJUdzN6ZWZlcG5UQlZRWUorT3VkTVJKTVBacUxBaEo5RDhqMmsv?=
 =?utf-8?B?WjZRbnVPTVlOdnRBeXJhMTk4L3N6NThTeHUwaUpjS2pmRjNIQ1I3Qy9IUzdi?=
 =?utf-8?B?Qi9DTFhYUEdvb3lGM2lodkxmUlJDaDk5V21TQmdjTDhoRlFoVktNMUtkSGVk?=
 =?utf-8?B?bzdKQ1l5Q3RkZG5DL0U2bWFDeGdUdkV2eWg0YXhkTm1lbCtlenFpWWwxQ0pu?=
 =?utf-8?B?b01uWjcvMDRoZlg3dEtwR2VBbTJNYkVxQWNBOWNyc0pyK3QyMmlxL1NiYzAx?=
 =?utf-8?B?WDRSbTFZL2ViZzFGY1JlQkFXRWEweE9JaS92eTJyWTdrZFBTNjRoY29yWmZk?=
 =?utf-8?B?RlZYRCtiVEhLQkNKNlVDWVhNZmt4ZVJ2NHlDaTBqbTNRemtLcEhEYnYxK0Zw?=
 =?utf-8?B?SGNQVEhETTdPeUZMTWllMTNUK3g4bjRvTFNqV1RVS0RqWGtydkcxd1R3Yk11?=
 =?utf-8?B?NWFwNUNJT05OdTg1ZHN6c054aDJocjYrUTBDTDlEUjFhOTNPYU41SW54Mytv?=
 =?utf-8?B?Z3ZMMSs3cm5PYmJQSTZJeHIraTBENmJjOGUzenhaODVwRmJ1TUxJdVBYdndw?=
 =?utf-8?B?cVFkZ1RSaG5uMjZ0anRwZnI0Mld6WHVDS3N6RFV5M0hFSEFBUm93N0gyMUIy?=
 =?utf-8?B?aktNYXRTcUlGZGJPcUhxSWdCMExDTFJJc1FwNmpFbllGWHNIWWErU2U2RmRU?=
 =?utf-8?B?alJ2VWRpcEN6QUx2UGx0L1BsYUI1cjBJVXhoZmh1dS9Xb0s2TUE4R21FOXNr?=
 =?utf-8?B?cmVDcHpzUkVBNERwTnpRbWlPVXUveGxicHdmZTYzMmtocWdCMjh5TmZzSjVB?=
 =?utf-8?B?MzdUSVdYUnZZYXpPUlZ6WEhiNFJMTWlQUUFLVlR2eWJlU3ErS0ZkSktlZk1D?=
 =?utf-8?B?dkw4Vlp3UnRBdjZHaDRybGxhWGx6c3RtZ01ocHN5VzU1WU04bTJqZElNeWZ4?=
 =?utf-8?B?TllmS1BIMlRsNFhEdTJBYXNMMDhwRnFNbmxkSmpuYmxEK0htOFBUWnpRby9O?=
 =?utf-8?B?M1RxNTB0NWlXSk5iQ1c0dkwxRC9BVzlMTGF0RExGbGJiaWlTU1FEcll6aW5i?=
 =?utf-8?B?VzJrS0YycHBMSDhXeUJ1VEV2b2FZeUpqNGxwaHkwb0wzNUdKREZVZXhjNFox?=
 =?utf-8?B?ZC9VdTh6MzdBMEN3cDIzd2ZQcXRBL3Q0SEx6bGxQYkw3OGJFMFNiUjlmZktW?=
 =?utf-8?B?Z1B4ZFkyQU94aXZCUzkxSk05Yk92aUVOVHZIWGdueWgxZU5ET0drSE1UbHQ0?=
 =?utf-8?B?dHF0M1JoUmpJY253dkhCTjZPVXdPL1Rtbk1kb1AwMWhpL2Fxem01RUxoOHpx?=
 =?utf-8?B?ZU5DV0szNXFSY0dVVUJQTlRqTnVHaElBT0ZoQlFyR0c1OU1uM0w4azU5eGJt?=
 =?utf-8?B?eEZYMXFXU29qZldWdFhZQlYrMkJwVkFTVGhGR3lrOCsvcXZjV3FBTnl1Y3VV?=
 =?utf-8?B?aUI4Qi9nOFJCYmNnYTNiUURUZHZZa1pmVGNML3BJaUplM2lzWm1nYXhJY1JM?=
 =?utf-8?Q?RrdE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab8f76a-6d69-4124-1caf-08dc8b7256f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 06:30:38.0663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqDFpUgOZjSCWw/TxvMLwaiAUA9W9rF18dsiGQqw/UQ5kBBmO93mAS95fw6rGH5vNag4IV185LjBoOy4e9w+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

SGkgTGludXMsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzNdIHBpbmN0cmw6IHNjbWk6IHN1
cHBvcnQgaS5NWDk1IE9FTSBleHRlbnNpb25zIHdpdGgNCj4gZnNsLHBpbnMgcHJvcGVydHkNCj4g
DQo+IE9uIFR1ZSwgTWF5IDIxLCAyMDI0IGF0IDg6MTfigK9BTSBQZW5nIEZhbiAoT1NTKSA8cGVu
Zy5mYW5Ab3NzLm54cC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiAgVGhlcmUgd2FzIGEgdjYgdGhh
dCB1c2UgZ2VuZXJpYyBwcm9wZXJ0aWVzLCBidXQgYXQgYSBsYXRlIHN0YWdlLCBOWFANCj4gPiBp
bnRlcm5hbHMgZGVjaWRlcyB0byBzd2l0Y2ggdG8gZnNsLHBpbnMgcHJvcGVydHkgdG8gYWxpZ24g
d2l0aCBvdGhlcg0KPiA+IGkuTVhzLiBTaW5jZSBuZXcgcHJvcGVydGllcywgZHJpdmVycyByZXdy
aXRlLCBJIHN0YXJ0IHRoaXMgcGF0Y2hzZXQNCj4gPiBmcm9tIHYxIHdpdGggYSBuZXcgcGF0Y2gg
dGl0bGUuIEEgUkZDIHBhdGNoIGZvciBiaW5kaW5nIHdhcyBwb3N0ZWQsDQo+ID4gc2luY2UgUm9i
IHNhaWQgaGUgaXMgZmluZSwgc28gcG9zdCB0aGlzIHBhdGNoc2V0IG91dC4NCj4gDQo+IFBhdGNo
ZXMgYXBwbGllZC4NCg0KSnVzdCBjaGVja2VkIHlvdXIgcmVwbyBpbiBnaXQua2VybmVsLm9yZywg
bm90IHNlZSB0aGUgcGF0Y2hlcy4NCk5vIGJpZyBkZWFsLCBqdXN0IHdvbmRlciBpZiB0aGV5IGdv
dCBmb3Jnb3R0ZW4uDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBX
YWxsZWlqDQo=

