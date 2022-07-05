Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A89F5663B6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 09:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiGEHCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 03:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiGEHCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 03:02:21 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F70120B0
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 00:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXlKSaUo7vIHG5BlX5VY52OzTqugplD5hzwEWWLxunSklf4PBgSFGtM0j9XuHbSezjm2k06B8WYjOy7D57WFelnPtsI3o2GG27ZLnagSE8LY4mGeFpUr3N1+RlujK2t63hA55S+UaX+zGMpjAdPm2yyDWPpcKBFSLL8YZ0J2GwgfQeUSBrMSCaxjFgqZRN5y0yMlctGjLQlLO6GfvjhuuDGkLVJ1hvwUcV6qXLbJHJi5RzHEtmEh1LNBEoNRS8lMr+2n3IcJyY6UkxEq6RfDip+cdZFy+MkLVuX/6Tvg7yMVMwWdf04B7b5EJCQCJuBTJFjElJFrtSVXHiet9GR7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2hMqyiqiyldJeUW5j6Uwc6G5Fg5xc+N0F8sGMm286A=;
 b=XyvRjHUgFNaKZ+hem9dMtQ1B06HO75qFcXI8KzGKx5stdD1HZdFdazELUoGjzeU8TmSpmPEZWkbYn6/HwIQOdK+sehv6bbttjYdffgyksHNbyhb3ihsQ+8GB+OALAtw2+ZYiwh/TIR1cPQ8tVPcgGm5Z3TUG/41iFOqHhAMD6wb8Wzsi4/j7bMZnvguY5dU3QTYwlFpI+K1izsb0DXxeJ+ru5NncNMEiKIE/RXNJYdK5/+3x/mzZAz4LRbT2e/qcvNvK0aMenKJJXz1vUp3rYoufQxHb/Ib65yWASHQ8ek70sBXzgClS2va5527RFrkwkbsa6zd+z5G6ellQUe1zuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2hMqyiqiyldJeUW5j6Uwc6G5Fg5xc+N0F8sGMm286A=;
 b=B/naZDOLWMIlo4hKdROGaR2Sopftr/hbXC0F9R0kiNpKp0MNLv3b1wWBwspfVP3DeBoHMpp/oy0+0zTlpv/Yu9CuS2vdSXa3RA+46aX+sMPaec+bwpY1UICrExkUAaib7YCJf7OFZp3DoslmlDs2KDRcahTqslIJFQXKlHMw6z4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB4963.eurprd04.prod.outlook.com (2603:10a6:208:c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 07:02:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%5]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 07:02:16 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Tariq Toukan <ttoukan.linux@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Tariq Toukan <tariqt@nvidia.com>,
        Ran Rozenstein <ranro@nvidia.com>,
        "gal@nvidia.com" <gal@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: RE: Compilation failure in gpio-vf610.c
Thread-Topic: Compilation failure in gpio-vf610.c
Thread-Index: AQHYkDzkYgUy3Lal90SXgToN/nmHVq1vWarg
Date:   Tue, 5 Jul 2022 07:02:16 +0000
Message-ID: <DU0PR04MB9417B6725F58E34D55CA8DDB88819@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
In-Reply-To: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e51fc8cc-e9dd-422a-978e-08da5e544bd2
x-ms-traffictypediagnostic: AM0PR04MB4963:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z740rSHUO5A70I1243H6oMl5806pwuwpCpQ0bQz9evcsxQPH3XTrblgk1fmaHyjOktMoF2PICawhsG784wGARzcmyttuIHTO/2Tal68NTYTGAQeat4tl05RJtkPx7Hr4hSGwVYhDh9B3ZebIqlZEWK4X0mhWQGgZcyYkh19U3KEcgMMq3Kg9Z6RybAqIafG6LZfdAgmopLP1tQ9eU5RuH6gCPkB7twzdaHe+GZwxxxco3Ug7vTQM+b/OV41IiETduNg4obINSQmJMzrxvS7IDwkvB4Spmr5X3q/SD8LAC4d6NDuPrv7yLvcmXRBqTt5qdRLJPyCKx6gZrKkHsdIENjbbPd7324GtSIJ66kWFEBrcCExtIIWJ1NSXZxAV0kZJffIZzVMMMPhJrvkHU7ZapX4ymiwCWgEsa75JU98Vd+HXLE+h5n/nGhfu51T0/aamJSDbAqp/62/KSLdbSG4WIhTA17Sj5nbSuGKQY21ZlNh1aaykSaU2J1jsab/7vEJctp5olRvGl6LgLruVIql2CdRMfN0d2hiGJtldesHo61Eor7/Tq83xAHW1aXnG2xbAXJ8MtUhRGAwpeV586Bo0YA9AkX6gDc1OYXDBx7VE07EtT5Im8t2GcxgMgWAumAY4FVkk1U/9Z2i4/93EQdR8vZDtx6ovQScamPbSo1Ply6K9J2p/lRhgfqKikgZtNsVxpYzHpiwVpxdNUMxvPQ4zZcFEXZ1UhaQnXYXJy+UccKn2EjX0bI1sSznYLi1bBqG8MqFiY9vioRqH8AWSRKBMrWpTXhTClxFV8Bn1XJzYICf12mIu3x0EwE30D40fi3x8yXoP7YFDHb1To/rl2N/7WDu9EPi0PyJt54cCW9jJYXk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(9686003)(110136005)(26005)(54906003)(44832011)(71200400001)(186003)(316002)(83380400001)(66946007)(52536014)(86362001)(5660300002)(76116006)(2906002)(55016003)(478600001)(6506007)(7696005)(8936002)(64756008)(66446008)(8676002)(4326008)(66476007)(66556008)(38100700002)(38070700005)(41300700001)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzUrVTArTS9GeVVyU0RTcWNKV0wxNUF4bVpQTStUbkxpazBnb0JtVFlJVGJa?=
 =?utf-8?B?THluMDBuTEVwcGlHNFluYllORXRLdk5tbDFkUTdtUHRBMnNEUEZQL0ExMHdu?=
 =?utf-8?B?aU9NRnNjSGFFRGw3Qk5PUWc3Z1hyL1RuQVRGWEZwUXNkVlBudTh5cFJsVlNa?=
 =?utf-8?B?SU5EcUcvNUpTcHNjZHhXeHVpcTlSZGo4dzRlbVI3WFRGWHBnWi9GY1RBaXRs?=
 =?utf-8?B?L1FhWlgzUW1OamhpalI4dDJTVmI0N3YwdkdxOUxhenIvSXFHcnZQOEpJaUJP?=
 =?utf-8?B?YnZoSE0waEk0NU4xZU85ZHhlblN5eGlWYmtHc1FkdEpwV1ZXT1I4bURVcWsx?=
 =?utf-8?B?eXR4MzdiYVRFWXRWek5mSmZsMi81cTlwUkZaZ3pxOUFTdnhBL2RYOHhQQk1Q?=
 =?utf-8?B?WmFIbTVzaUNLVnZxS1RmUEduNHFQUDJ0R2RBeHZVbmhiM0ZvWndRa3gwUCt1?=
 =?utf-8?B?amR0dk5PS091ZG1aeWU4SEoxYkRMbWxzRGpHeWdXUy9NWGl5dFFzYVhnZU1v?=
 =?utf-8?B?QXZrR1crS2ZUSUl4eWlBTStwaUR2b3FXVFUyeWU2bm9tTnBsQVZJZkYvRGU0?=
 =?utf-8?B?YnV6azlnVFpqTFIvMkMrYngyaXA4N0VOTytFeitXTXRsRk5PSnZPaTZvb2g0?=
 =?utf-8?B?b3BacTVMaU9Bc0x3N1grMVpDYU91dzZxL0l6VFMvdUZQb3lSRFRnTTk5ejla?=
 =?utf-8?B?d2ZKODFmdGIyb29ic1hQZHp5U1k5d0hiMW5wU010dkQyRmY2RWhKTjJCazNW?=
 =?utf-8?B?WHAxWmpHMmc0dFprZE1kY2dncncwblJGK3V3c2NhckNHVURyOEFsYm9oQ1pV?=
 =?utf-8?B?aFpZbXlJUjJKYTV3TGt4VTY1OUN5ZzZXSGJ1TUxVd3dmN2wzQ0JUOWk2OFhi?=
 =?utf-8?B?cWYwOWIzVXFTa21mZ2t1QmJjQlh2T3E5VzRYdzI5WEU5VzZSa2laNUswR0c5?=
 =?utf-8?B?Ui8vbCtwY1FZM1NHRlZPYUR4dTNFeXZldjZaN05CMzNnVEFPYUNKU1RUVDhB?=
 =?utf-8?B?czRrc3FTTERpKzV4OTdFemgxbEJFb2NJNStUZk01NkE2bDluODhQNy9CdTNy?=
 =?utf-8?B?ZjJPWEFXOEFDMlR5THpFM2dCbFZJS2dWZksyZ1BLV0pLR2lZRFY3U01LOVpy?=
 =?utf-8?B?OFN3KzBSSE1MZUs5b3ZMVi9aMTFXM3E1ckpvQm5MUTlHKzI5ZE9FdHphb2ti?=
 =?utf-8?B?c05JQmoxVE9QOG9wc3NCaW9rRXFULzhWbktWQWllTkgwMzBuemM5VFgycHla?=
 =?utf-8?B?S2R4L0pXcUhlb0FvQ3FEdC9VNGlJeERKdEFnbFJUVnpCVEY2ZE1DWmI4aEpM?=
 =?utf-8?B?T1gySUpRUHMvejBEYVJrTzliYXJHMHNGdzRNOFkrOUs2VHRuSEJpZzlsYXhx?=
 =?utf-8?B?ZXVQS2t5TldPU1R6S3MrWm0zSDkxMUV1cUJrT3hXTXF1T0wrWVN1M0tXeXJ6?=
 =?utf-8?B?cy8vRXdTdzRIVlI3L0VXa29YSmdNeHkydU9QUTI1bGY0OUppQkhxSlQ0dW0x?=
 =?utf-8?B?L2E5T1JpZ1NHUWJqOHJjWVNRSHVPYVZLYzFoQ3VqbnFmQVpnWWJmZldZNitn?=
 =?utf-8?B?VVhQMHduakNrTzVueloxZXMrVGxXSHFjTXNBY2ErK2RBS01hQi9pRmVzZjl6?=
 =?utf-8?B?bEFnYXhnMmxWUGQ0RUp5ZGZhSTVFRERlNEdpcnpiMElYSDRGc2tlMGdoM2pR?=
 =?utf-8?B?ZEhLRTdLT1FBNWEyZG1RaE0rcXZJUlNjbnpVK3NlaUtRdm15OWI2a0ZKbFZw?=
 =?utf-8?B?R01aS0FxWVNBdFU2WHdMekJPNXB6cDF5amFmVkY2M3ZIVEFENGxqcGJlSVh6?=
 =?utf-8?B?RU5FV3pSVGE5cGozQmRIRVZMSWNhL2VIY0QxU0dZWEJ6ckk1R2RCelVZZk44?=
 =?utf-8?B?SUpML084Wnk4emZablRyNVF1QUVKbGo1TmtZMG9aMWMwNFIyZTd6a045U01K?=
 =?utf-8?B?b2tDTzFsMnNVRWd2aFp0VnlueU5NTk12U1JpVzdlSVB2azFFOCtlbm5ta005?=
 =?utf-8?B?aDdxeHZjeEdreEZMRWxWSVlhOFJlZDBrVWdZeUt6bHdueS91SVh0VlBQTXM4?=
 =?utf-8?B?OGljRndzMHJSc3h2ZUF6L2UyWWQyc3BUNUdmMkMrSHF5dEVaNTQ1ckVtRWF6?=
 =?utf-8?Q?6lGE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51fc8cc-e9dd-422a-978e-08da5e544bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 07:02:16.8546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V10XxQh4UgLDecfA3S0FqiXdfVOIZHqN79jWfUuqu9Pnri/MQXMTZQKAzFRVAE4xwU3bJUTxNA4DWPjWD2V6lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4963
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiA8bGVvbnJvQG52aWRpYS5jb20+OyBTYWVlZCBNYWhhbWVlZCA8c2FlZWRtQG52aWRpYS5jb20+
DQo+IFN1YmplY3Q6IENvbXBpbGF0aW9uIGZhaWx1cmUgaW4gZ3Bpby12ZjYxMC5jDQo+IA0KPiBI
aSwNCj4gDQo+IFJlY2VudGx5IHdlIHN0YXJ0ZWQgc2VlaW5nIHRoZSBjb21waWxhdGlvbiBlcnJv
cjoNCg0KV291bGQgeW91IHBsZWFzZSBzaGFyZSB5b3VyIGJ1aWxkIGNvbmZpZz8NCg0KVGhhbmtz
LA0KUGVuZy4NCg0KPiANCj4gZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYzogSW4gZnVuY3Rpb24g
4oCYdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXTigJk6DQo+IGRyaXZlcnMvZ3Bpby9ncGlvLXZm
NjEwLmM6MTIwOjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPiDi
gJhwaW5jdHJsX2dwaW9fZGlyZWN0aW9uX2lucHV04oCZOyBkaWQgeW91IG1lYW4g4oCYdmY2MTBf
Z3Bpb19kaXJlY3Rpb25faW5wdXTigJk/DQo+IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQ0KPiAgICAxMjAgfCAgcmV0dXJuIHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25faW5w
dXQoY2hpcC0+YmFzZSArIGdwaW8pOw0KPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4gICAgICAgIHwgICAgICAgICB2ZjYxMF9ncGlvX2RpcmVjdGlvbl9p
bnB1dA0KPiANCj4gDQo+IElzIGl0IGEga25vd24gaXNzdWU/IElzIHRoZXJlIGEgZml4IHdlIGNh
biBjaGVycnktcGljaz8NCj4gDQo+IE9mZmVuZGluZyBwYXRjaDoNCj4gDQo+IGNvbW1pdCAzMGEz
NWMwN2Q5ZTlhZmZhZWJkNTU3YzQ1NGRmOThlNWJhMjY5Nzc2DQo+IEF1dGhvcjogUGVuZyBGYW4g
PHBlbmcuZmFuQG54cC5jb20+DQo+IERhdGU6ICAgTW9uIEFwciAyNSAxOToxMTozNSAyMDIyICsw
ODAwDQo+IA0KPiAgICAgIGdwaW86IHZmNjEwOiBkcm9wIHRoZSBTT0NfVkY2MTAgZGVwZW5kZW5j
eSBmb3IgR1BJT19WRjYxMA0KPiANCj4gICAgICBpLk1YN1VMUCwgaS5NWDggYW5kIGkuTVg5IHVz
ZSB0aGlzIGRyaXZlciwgc28gZHJvcA0KPiAgICAgIHRoZSBTT0NfVkY2MTAgZGVwZW5kY3kgdG8g
bWFrZSB0aGUgZHJpdmVyIGNvdWxkIGJlIGJ1aWx0DQo+ICAgICAgZm9yIGkuTVggcGxhdGZvcm0u
DQo+IA0KPiAgICAgIFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0K
PiAgICAgIFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+
DQo+IA0KPiBUaGlzIHNlZW1zIHRvIHNvbHZlIHRoZSBpc3N1ZS4NCj4gSXMgaXQgdGhlIHByb3Bl
ciB3YXkgZm9yIHNvbHZpbmcgdGhpcz8NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby12ZjYxMC5jIGIvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYyBpbmRleA0KPiAyM2NkZGIy
NjVhMGQuLjlkYjQyZjZhMjA0MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tdmY2
MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jDQo+IEBAIC0xOSw2ICsxOSw3
IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2Rl
dmljZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4gKyNpbmNsdWRlIDxsaW51
eC9waW5jdHJsL2NvbnN1bWVyLmg+DQo+IA0KPiAgICNkZWZpbmUgVkY2MTBfR1BJT19QRVJfUE9S
VCAgICAgICAgICAgIDMyDQo+IA0KPiBUaGFua3MsDQo+IFRhcmlxDQo=
