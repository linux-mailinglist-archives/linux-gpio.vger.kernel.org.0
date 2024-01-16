Return-Path: <linux-gpio+bounces-2274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C782E80C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 03:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 636ED1C2290E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 02:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D281290D;
	Tue, 16 Jan 2024 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bmc+SQhg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA937E;
	Tue, 16 Jan 2024 02:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjfEk5SwarN0Oce+PIiUU2OcttY4s/DeP0PEr9agkv4ZR5rYixul+kL4h+R2s7lOB4kp/HlG2djkvgfpHzjMs5ytURFhvmW4auhkqIVvzUfX/S6rEYECKQ1SR9+8RTYoS1C4f2fOxup1F5w26U4XZyZJuYMS2BZAXen/PX0ABl0X8PQNktZLUyHAYfFkKCygF+N3laiYEptq2EX62BWx4M8DcwonHQhPVfE3fxO/u2LI6JecU8aTo7RAyBL9gvXg0KoqzNy00yipiRUB9pvy5M9MddmZKHDXDgWnMdAV+V4kH/PsCi3howuGI9oCUM0FFmkCBVQjM37t+Aaxm2Lmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbHMxfwGv+TW9gULBKqYiBQ8RtxF9lCHkKiEnDosi5g=;
 b=ksYduD889WT9QjyEz/QTTqi3tCCs5r5HEtl2GkxVdjruR/piEh/fjYueFf3Ap2orc+3csBjLVnycUcUOsbZXtgMKe4EppavbihHwct0rVd9nRRd1os92QT5NH/exxCuC5FfvR3GuA6e0zDqzfXvJ+WfTMwEbfAP13okzatCNDDSMXoZHfPIMZ/oNZB2juXuXdMnAgNBhEziwhVNO/HRCI9SgUqbNCL/WW4umFJeq9+XqW3/VoF/PzDWKp5ecl08EB3XDe6m8p1cvFUv/fu5W8tShCuA8Qrs8AVuC5GOcH4WTZdaTaqjvr+1Enim8U1Z39P4f96+JQcic0h/b6buoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbHMxfwGv+TW9gULBKqYiBQ8RtxF9lCHkKiEnDosi5g=;
 b=Bmc+SQhgDq7w0tRdXKTrVdb5xvryUQYxTvUCmgFZDAqZvqeqq13j7utnQzUyU3yi9N4y48WbPHDGN5aNhOn+NwfMPw+bbz2aeMCmyCl7iBVk25yEYWeQ8h++VJrC4eR5tJWpyM9qP8Gbk7qMhfMZ0O9O4jzjA8h4fTa7xOSQVl4=
Received: from AM0PR04MB5267.eurprd04.prod.outlook.com (2603:10a6:208:d0::12)
 by DBBPR04MB7723.eurprd04.prod.outlook.com (2603:10a6:10:20a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 02:59:42 +0000
Received: from AM0PR04MB5267.eurprd04.prod.outlook.com
 ([fe80::c82c:f8ca:577a:a5fd]) by AM0PR04MB5267.eurprd04.prod.outlook.com
 ([fe80::c82c:f8ca:577a:a5fd%4]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 02:59:41 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Hector Palacios <hector.palacios@digi.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>
CC: "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v2 2/2] arm64: dts: imx93: specify available 'ngpios' per
 GPIO port
Thread-Topic: [PATCH v2 2/2] arm64: dts: imx93: specify available 'ngpios' per
 GPIO port
Thread-Index: AQHaR7UxBPve+3BG50mynSRlU+ZTebDa3quAgAAkjQCAALdeEA==
Date: Tue, 16 Jan 2024 02:59:41 +0000
Message-ID:
 <AM0PR04MB5267511AA458DBBF45D0974390732@AM0PR04MB5267.eurprd04.prod.outlook.com>
References: <20240115131605.395691-1-hector.palacios@digi.com>
 <20240115131605.395691-3-hector.palacios@digi.com>
 <2919725.e9J7NaK4W3@steina-w> <3a24cb45-9fa1-424c-86c1-0c9e64eaa407@digi.com>
In-Reply-To: <3a24cb45-9fa1-424c-86c1-0c9e64eaa407@digi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5267:EE_|DBBPR04MB7723:EE_
x-ms-office365-filtering-correlation-id: a12296f1-832f-4c66-71b1-08dc163f2fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XEw7/I4v+njrs4vocbu6ziQ1dEgD+3Um6TtNxyFZfu3xNMFbBZ1AkxsJ+5UPFcsTuoDhNHHgSo78Kx/Skhx8eUQvqH4aqFkbJcPsT9ssbnR37NmNHzQRWCanUzPmT5XrKURasHsHVWM4j+CA4zWnQZZrM8Kzqp7z8AyADC3kO/trTCikzlLfCYJvrHsm2xlsbtkIDSuCc8mW9OuiS2EQF0rKpuHlAo5SxrzVKtmK/UHmE3IrLGOUDbcGCRgror1ZJ8OzeHP0DEHXoEae7JpzSztGZVs6XUeptm6Cf83Yk39nUCtKOyYrYL7KA9ilSkMQ+1a0uWowKkPBqJGDyBtpV1W71I8wueijYVBgrzPAyp6ebL2H6gNfgygVaMv2yxiFwDdXZD1PdDrP3TcqspRsFUbdcL7aXsTgy0b5Wvt1dOnY9acRB3I1pUk7MzDCpBCMg7NTU84cPpZehZVta4vs/RmN1AEpg7T9aNjY+FYBeDHof1oVOb0wEc95ue0EKiwj20lHOkA99csRQlax4G4orI+NCBVkvEmnoCQYc4jOg3j+i2BGpy1RYHsHZwtFNbFGZ96nGPzBy7ThRfragN/lOQ9kutu5CuWE+gPrtHVJM4xaIzOla0l7Oyfj2qKimeKw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5267.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38070700009)(55016003)(66574015)(478600001)(83380400001)(4326008)(52536014)(5660300002)(8676002)(8936002)(9686003)(316002)(66476007)(66556008)(66946007)(66446008)(6506007)(54906003)(76116006)(64756008)(71200400001)(110136005)(26005)(122000001)(38100700002)(7696005)(53546011)(2906002)(41300700001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dG9vOTUxeDhqUkp6b2dlc2srREhvYm0ySzgyUEl5MlMxbDNvNHNuWXpnbHQ1?=
 =?utf-8?B?SWdvanV5ZmllRStWRnJUK2w0azM3bTVhbHZCZzk5MXQ2dFJPNE9nZkNaS204?=
 =?utf-8?B?aVJsQnMxUU10SDk3NzZQRmxkK0wvT0c3a242UnV6cFhkbUFZbkVIb1dNeEFS?=
 =?utf-8?B?NzNtbDB1UDBzOHAzeVpvV0JMaDZnbnFIVWtoaHZyYlZnVWx4Q2VMRG0vSnJu?=
 =?utf-8?B?eHpNOVk0bTU0VHA5R3VIanI1WGNRMVZTU3d2WVgxN0pLKzNDejh2WDg5Y0h0?=
 =?utf-8?B?NHBKdmxWOGJhRktjcjRIaTZjZXp2QUJPNlJvemZYSUR5QkVKQ2E4QW5HT3Fr?=
 =?utf-8?B?S0JDM3k1MCs4d3RlakpFT2NDcTdLRU90NE1jRGE3b2hkajl1QUJqZzZlR00v?=
 =?utf-8?B?ellkU25YSlNoVTh3L3Q1WEhXNWdBTktrbTJwWS9YdHZyOFVjNTNPNzRLT3I4?=
 =?utf-8?B?M2lKSlFPalhzdzlIc2NjTzBQdVZoRHdkZ252Q3prK3Y2c24yVVczRk5pczdl?=
 =?utf-8?B?L2I1Zk1LL2tKc3h1dVJDUTBmNjNlWHY5N085TEZOTmR1TFZNYTFQbzUydnFY?=
 =?utf-8?B?dTFIUjJMeitJS2o3aVRIVVptL2o1U3h6bFRxLzI2QTYzWWxOck9sbmZWbzNV?=
 =?utf-8?B?cXkzRHQxQ1phNUZ3QjNxMm9NNVFJcHZqczNkSEc0Z096cGQrbWUyck03SnBn?=
 =?utf-8?B?TGVETUNuTkpnL012TzhsL3BSRGVRTExqUDV2aCtxMGpocHYxdnMvSDZRcUpE?=
 =?utf-8?B?aWJ4RXVxdTVZMWJEYWJuZFRtOER3Nmk0QmRoUEhVcFJIb1FZTlNVdmhpbWZ1?=
 =?utf-8?B?dHFycW9acUhiYmlJWDFMMFFaZmh0S1l5UUFLcE9zTFVSWVRzV1NCZ0RjRHNs?=
 =?utf-8?B?ditDeDNRNGtac3I1YmZsRE5yVEd4bzUrbm1BRm82NU9VM0ZpVm94N09lZU9j?=
 =?utf-8?B?SEd4UG0wc1h0ZXEzL3BObFJiOW1jQm9KVlQ0dnRiR0x2elNTaWNWVTEzbkpq?=
 =?utf-8?B?WmgxV0dJUzFEUUZiNmhLbzI5ako0N3BkOEVXeit5SDJvZDYyR3JZU2cvNXNG?=
 =?utf-8?B?eEN5dzIrR3NzTXBlb2FLYmdTYWN1WVJVanB1Vk5wS3ZUN3Uxekg4cDRoOEdP?=
 =?utf-8?B?bmZkd2N4cXN3MlEwbkJNZVJwYmJENUtsSHJSZjh2UlRQUmZ5U2EvUU1EaHR6?=
 =?utf-8?B?MklzTitrNTRsNWJleEpPMkxVMDhHZC8yOGtBOWNiN01LRVFGOWN0WVlrNGJh?=
 =?utf-8?B?elZjME5Rdy80T1RweWYwb1R2SnRpMlFOMDNwQzF6WEFRYWNGa25wenJEZ3Jy?=
 =?utf-8?B?SWlncFBYcTI2dVNFSVhNSkNjanpBdVJrcEpCaTgzRS9qS0xPaVhjQlhjenMy?=
 =?utf-8?B?amo5VlZ6R3FOQ1BrTm10NmlreUdtQUFmZXB3eVNhSEx5bTgxZ25GSW9UWith?=
 =?utf-8?B?eXc5NVRmQzZiZ1BiS3FpQWF1Ty9QdXVVNHBQU3g2NUpJYWE5NStJUVhwK09H?=
 =?utf-8?B?dWxYUmowMVFpSDcwVG5xN1UwVk9hWXpXdDB5Qm8xRTI3UE1xNmVWMDBWMERJ?=
 =?utf-8?B?cHFpc05kSi9zNlpCNGxVNFU1RXNwSWk2QnQ3OXdFalg2RTA0QlBvNGZqekp1?=
 =?utf-8?B?L29UUlMxVkc4MUlCbHRqQk9CK0hpdWNmTEx3NUo0NS82Zy9KN1ZhYm1DVm1X?=
 =?utf-8?B?N01zRlc2U1VHRkE2alVPYS9PQ09zU0kyU0phM2VUamtJcFZJbEtydllOa0xp?=
 =?utf-8?B?Tm5VcHlNU09yaWdsTnNqV2N0dXc4OFV6UWR3TEVvSmpFNmRVZ3RHby9mN2tS?=
 =?utf-8?B?c2VWYzQ1aGpOL0Z3QW9xd3NqcTFVYWk2VitXNFRFc2ZnajJtV0piVDFkYTVO?=
 =?utf-8?B?ckhLZjRKcy9LUlNzZjdBZisxRlJBcTBqL0JTS1MxYTFhUzVvMmsrVDdLQjlZ?=
 =?utf-8?B?blYwTkhMZzBDN2VQMFNLeFFMSkpsbGIwR0ZhTEtXSXFGNjJMdXlSY2ovclZx?=
 =?utf-8?B?OXFWK3ByMHB6RFRjWkRMK1BONjFvb2NpVFk4emplT3dEeGx5OFlYclI4ZzVa?=
 =?utf-8?B?RnpjNDZ0T3Jmc1NPRm5nSEhYODEwMnM1VG1VNmlRTmNEVHFhRUJTeDFJSm5Q?=
 =?utf-8?Q?MVv0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5267.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12296f1-832f-4c66-71b1-08dc163f2fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 02:59:41.8402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXqMic4tD+KLtHV8PVCbH2TEiEG5rGeMayrRSE5aukpGWykaoKr6h5f8lzZ+a+7GUahrTc6/+IWEKwQv8LesXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7723

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIZWN0b3IgUGFsYWNpb3MgPGhl
Y3Rvci5wYWxhY2lvc0BkaWdpLmNvbT4NCj4gU2VudDogMjAyNOW5tDHmnIgxNeaXpSAyMzo0Mg0K
PiBUbzogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPjsN
Cj4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnOyBicmdsQGJnZGV2LnBsOyByb2JoK2R0QGtlcm5l
bC5vcmcNCj4gQ2M6IHN0ZWZhbkBhZ25lci5jaDsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT47IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzJdIGFybTY0OiBkdHM6IGlteDkzOiBzcGVjaWZ5IGF2YWlsYWJsZSAnbmdwaW9zJyBw
ZXINCj4gR1BJTyBwb3J0DQo+IA0KPiBIaSBBbGV4YW5kZXIsDQo+IA0KPiBPbiAxLzE1LzI0IDE0
OjMwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6DQo+ID4gSGkgSGVjdG9yLA0KPiA+DQo+ID4gdGhh
bmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPiBBbSBNb250YWcsIDE1LiBKYW51YXIgMjAyNCwg
MTQ6MTY6MDUgQ0VUIHNjaHJpZWIgSGVjdG9yIFBhbGFjaW9zOg0KPiA+PiBBY2NvcmRpbmcgdG8g
TlhQIEhSTSBmb3IgaS5NWDkzLCB0aGUgZm9sbG93aW5nIEdQSU8gcGlucyBhcmUgYXZhaWxhYmxl
Og0KPiA+PiAtIEdQSU8xOiAxNiBwaW5zICgwLi4xNSkNCj4gPg0KPiA+IE1oLCBSTSBSZXY0ICgx
Mi8yMDIzKSBzYXlzOg0KPiA+PiAgIEJpdFszMToxN10gc2hvdWxkIGJlIFJlc2VydmVkIGZvciBH
UElPMQ0KPiA+DQo+ID4gU28gR1BJTzEgaGFzIHRoZSByYW5nZSAwLi4xNg0KPiA+DQo+ID4+IC0g
R1BJTzI6IDMwIHBpbnMgKDAuLjI5KQ0KPiA+PiAtIEdQSU8zOiAzMiBwaW5zICgwLi4zMSkNCj4g
Pj4gLSBHUElPNDogMzAgcGlucyAoMC4uMjkpDQo+ID4NCj4gPiBSTSBSZXY0ICgxMi8yMDIzKSBz
YXlzOg0KPiA+PiBCaXRbMzE6MjhdIHNob3VsZCBiZSBSZXNlcnZlZCBmb3IgR1BJTzQNCj4gPg0K
PiA+IFNvIEdQSU80IHdvdWxkIGJlIHRoZSByYW5nZSAwLi4yNw0KPiA+DQo+ID4gV2hlcmUgZGlk
IHlvdSBnZXQgeW91ciBudW1iZXJzIGZyb20/DQo+IA0KPiBJIGFsc28gc2F3IHdoYXQgeW91IHBv
aW50IG91dCBhYm91dCB0aGUgSFJNIGJ1dCB3aGVuIGNyb3NzLWNoZWNraW5nIHdpdGggdGhlDQo+
IElPTVVYQyB0b3BpYyAoQ2hhcHRlciAyNykgdG8gdmVyaWZ5IHdoYXQgcGFkcyBjYW4gd29yayBh
cyBHUElPIGZvciBlYWNoIG9mIHRoZQ0KPiBwb3J0cywgSSBmb3VuZCB5b3UgY2FuIGNvbmZpZ3Vy
ZSBwYWRzIGZvcg0KPiAtIEdQSU8xX0lPMDAuLkdQSU8xX0lPMTUNCj4gLSBHUElPMl9JTzAwLi5H
UElPMl9JTzI5DQo+IC0gR1BJTzNfSU8wMC4uR1BJTzNfSU8zMQ0KPiAtIEdQSU80X0lPMDAuLkdQ
SU80X0lPMjkNCj4gDQo+IHdoaWNoIGRvZXNuJ3QgZXhhY3RseSBtYXRjaCB0aGUgbm90ZSBhYm91
dCB0aGUgcmVzZXJ2ZWQgYml0cy4NCj4gSSBjb25zaWRlciB0aGUgSU9NVVhDIHRvcGljIG1vcmUg
cmVsaWFibGUgYnV0IGl0IHdvdWxkIGRlZmluaXRlbHkgYmUgYmV0dGVyIGlmDQo+IHNvbWVvbmUg
ZnJvbSBOWFAgY291bGQgY2xhcmlmeS4NCg0KSGkgQWxsLA0KDQpJIGp1c3QgY29uZmlybSB3aXRo
IElQIHRlYW0sIHRoZXkgdXNlIHRoZSBJT01VWCB0byBpbXBsZW1lbnQgUlRMIGNvZGUuIFNvIElP
TVVYIGlzIHJlbGlhYmxlLg0KVGhlIGZvbGxvd2luZyBhcmUgY29ycmVjdC4NCiAtIEdQSU8xX0lP
MDAuLkdQSU8xX0lPMTUNCiAtIEdQSU8yX0lPMDAuLkdQSU8yX0lPMjkNCiAtIEdQSU8zX0lPMDAu
LkdQSU8zX0lPMzENCiAtIEdQSU80X0lPMDAuLkdQSU80X0lPMjkNCg0KSSB3aWxsIGFzayB0aGUg
RG9jIHRlYW0gdG8gdXBkYXRlIHRoZSByZXNlcnZlZCBiaXRzIHRvIGFsaWduIHdpdGggdGhlIElP
TVVYLg0KDQpCZXN0IFJlZ2FyZHMNCkhhaWJvIENoZW4NCj4gDQo+IFJlZ2FyZHMNCj4gLS0NCj4g
SMOpY3RvciBQYWxhY2lvcw0KPiANCj4gPg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBIZWN0
b3IgUGFsYWNpb3MgPGhlY3Rvci5wYWxhY2lvc0BkaWdpLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAg
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMuZHRzaSB8IDQgKysrKw0KPiA+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLmR0c2kNCj4gPj4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My5kdHNpIGluZGV4DQo+ID4+IDM0YzA1NDAyNzZk
MS4uN2ViMmNhYjdjNzQ5DQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg5My5kdHNpDQo+ID4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDkzLmR0c2kNCj4gPj4gQEAgLTk3MCw2ICs5NzAsNyBAQCBncGlvMjogZ3Bp
b0A0MzgxMDAwMCB7DQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsg
SU1YOTNfQ0xLX0dQSU8yX0dBVEU+Ow0KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gImdwaW8iLCAicG9ydCI7DQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgZ3Bp
by1yYW5nZXMgPSA8JmlvbXV4YyAwIDQgMzA+Ow0KPiA+PiArICAgICAgICAgICAgICAgICAgICAg
bmdwaW9zID0gPDMwPjsNCj4gPj4gICAgICAgICAgICAgICAgfTsNCj4gPj4NCj4gPj4gICAgICAg
ICAgICAgICAgZ3BpbzM6IGdwaW9ANDM4MjAwMDAgeyBAQCAtOTg2LDYgKzk4Nyw3IEBAIGdwaW8z
Og0KPiA+PiBncGlvQDQzODIwMDAwIHsNCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICBjbG9j
ay1uYW1lcyA9ICJncGlvIiwgInBvcnQiOw0KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgIGdw
aW8tcmFuZ2VzID0gPCZpb211eGMgMCA4NCA4PiwgPCZpb211eGMgOA0KPiA2Ng0KPiA+IDE4PiwN
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmaW9tdXhjIDI2IDM0
IDI+LA0KPiA8JmlvbXV4YyAyOCAwDQo+ID4gND47DQo+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICBuZ3Bpb3MgPSA8MzI+Ow0KPiA+PiAgICAgICAgICAgICAgICB9Ow0KPiA+Pg0KPiA+PiAgICAg
ICAgICAgICAgICBncGlvNDogZ3Bpb0A0MzgzMDAwMCB7IEBAIC0xMDAxLDYgKzEwMDMsNyBAQA0K
PiBncGlvNDoNCj4gPj4gZ3Bpb0A0MzgzMDAwMCB7DQo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjbGsgSU1YOTNfQ0xLX0dQSU80X0dBVEU+Ow0KPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImdwaW8iLCAicG9ydCI7DQo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgZ3Bpby1yYW5nZXMgPSA8JmlvbXV4YyAwIDM4IDI4PiwgPCZpb211eGMg
MjgNCj4gPj4gMzYNCj4gPiAyPjsNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIG5ncGlvcyA9
IDwzMD47DQo+ID4+ICAgICAgICAgICAgICAgIH07DQo+ID4+DQo+ID4+ICAgICAgICAgICAgICAg
IGdwaW8xOiBncGlvQDQ3NDAwMDAwIHsgQEAgLTEwMTYsNiArMTAxOSw3IEBADQo+IGdwaW8xOg0K
PiA+PiBncGlvQDQ3NDAwMDAwIHsNCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmNsayBJTVg5M19DTEtfR1BJTzFfR0FURT47DQo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAiZ3BpbyIsICJwb3J0IjsNCj4gPj4gICAgICAgICAgICAgICAgICAg
ICAgICBncGlvLXJhbmdlcyA9IDwmaW9tdXhjIDAgOTIgMTY+Ow0KPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgbmdwaW9zID0gPDE2PjsNCj4gPj4gICAgICAgICAgICAgICAgfTsNCj4gPj4NCj4g
Pj4gICAgICAgICAgICAgICAgb2NvdHA6IGVmdXNlQDQ3NTEwMDAwIHsNCj4gPg0KDQo=

