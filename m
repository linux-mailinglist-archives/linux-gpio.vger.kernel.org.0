Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A69E9566F3C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 15:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbiGENcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 09:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbiGENcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 09:32:07 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A44F30
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 05:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ5Z8H5+nzMcP1Q9zUI1dYrbeSncYrtDBD4Kjfjzk1JEmquUpWQE848Ytf6yfsG4Za19LG+3ntqerIurD4pA5nIgReokrPIB2bVzav6iHJL4dpbtcJMeQLKKcskVjmHZGfldSuoPjqJOUwxC9eexp6i+DyBMKBdO6xu2NXgfvOcsC6+JM1NC4qfCQAKy7nJ43M+V6iAABlp2JQFuyWoO1BwBmMrluQzlJQYIacwNXTlFk2yZZEOAP1mkyi1A4QlZJWvtgTOxNNuBU2bJ76FJvbHaCL5TM7OqYjmvTvoXmNE2qLQYam/0hZlFZ8GtUzF9XDlSNTH/7gYOxUuBegqgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUpiI/zHIOcsSmYzQgJJuf8aPW1G+AS/pa937ABkmIk=;
 b=QmvYxUV2+nwG1gJVA3IozhK9B+MEaH7d6lGpPnabChEUZw/mUg0cWNV2QfkPqLN9UQAlrLx1XO3Vb2NNi5tmw/I4DuuHI6aTajN0bXdeQpVGW1VRrgRQmZjYUam0YdwrqVforknq2zCu7OiLPhNxirsiYw0mtjj7UQL5r+UGTGS2w0F72sjp3Ou+6bU1bstGGm7TpOBMrxRp3G0N0vQwxu30TEotlFj6cyDrTf48NG1gAUFxZ0kUB7npFMxQfSFZ3pr+iY58xsAY8zJAbZF2VVV9EbApQTSJyBE5wR05QZXqnvHXqU2PIvLv61CK0Hc89yT+VY98wxrPAJ2Plqf1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUpiI/zHIOcsSmYzQgJJuf8aPW1G+AS/pa937ABkmIk=;
 b=hDWBkWRq1gloaFGWs35tA7vYI5cn14jjIcRHhqx3wNZtIl5qVCA0NeZ/5BNaV3C9IaOho7It5aK/nNNvV2f4DXHbcRFg/csvQjRInXw3nvqKTPqBvplbesB7+C9k0RkFblGxvx5VOPWAXtzfYlksc4z6rraCCJJmLd6W//QDQjs=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB5680.eurprd04.prod.outlook.com (2603:10a6:803:e8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:52:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%5]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:52:45 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Tariq Toukan <tariqt@nvidia.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Ran Rozenstein <ranro@nvidia.com>,
        "gal@nvidia.com" <gal@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: RE: [PATCH gpio] gpio: vf610: fix compilation error
Thread-Topic: [PATCH gpio] gpio: vf610: fix compilation error
Thread-Index: AQHYkFkI5RXi7GPBOEOL/tVWEU5Qc61vu2cw
Date:   Tue, 5 Jul 2022 12:52:45 +0000
Message-ID: <DU0PR04MB9417A95F61CA7EB52B2FF32F88819@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220705102114.2067-1-tariqt@nvidia.com>
In-Reply-To: <20220705102114.2067-1-tariqt@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8b4eea3-95b6-477d-e199-08da5e8541c6
x-ms-traffictypediagnostic: VI1PR04MB5680:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OEZ2VmlGia+zjiehZbPGEidpDtv2kD4vkouVZ8V1pBHlm/29WsGdff1ZSCRmqbQj+Y1vUzK73Sb7AZC3Rk6XG7Wh2jwfIbmIh9fRJqDBoBmh3ZMU116V9XtGQPqNgyO+myiOamlF9inc5lCtgzR/1n9u4YWCtdh+w4X2BPCFYsHwc0Zi39KNZ+8gGSteSbkpVofRocKtK9aKR6YhKQNBOCZdjcd+sUz1fAXCMNSqvVdLywS3AT8buzm+w5aNHKpA42VWseETtf9OO2LmU8oL6jcQ1XgGLAg68x5X/AHsPy/zm1FxNfhCUizG/EXy7VvUSCHGMCZ0rZX3Yyf+sIOc1XThl5G6dxe6mvPFB0vN9c5ovKRpsKi5I3pdstN8VQK3YZjp68oKPD+n6qI9cJUFcXp+Bucqc0xKq0SBARHKSCPwsgfU6GOP6IAIT9yFnoqiVcGjtmHYFHbGglRv3RHj/ugiu5pXGlW0GIflGZYUryShgx7tSLjqwKdeTymrcg4KlvPPxI8dn14KFFqF31V0PiGfV2Pdeo13DmRULFy8NmC/tkHCxMXoVd3QAYzctg1d6u8dK5bPdaPYudCGKm6cOlDwPujMk4HigSXEP2fWgiwvmpmSAuN+8c/oOSDEv9feiqHfx6xK8RBVe1CLznqowAoSLkloYATwItj3SpITSb1o1lO4lLktnHSMXzJDVUr058BSWpG6zBTleQtZf44aSYaUsuiMoqcOq05r622Bv4PK3N24zd7BrCKPAfhkSwpd2JuWHUeKtYRfsQuEvIO/bMP8pdjJAz7VTaeuDjOLoSYWlhKbfPVqYQYr1QIrmS+i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(52536014)(76116006)(8936002)(5660300002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(41300700001)(86362001)(110136005)(8676002)(71200400001)(316002)(186003)(38070700005)(26005)(7696005)(9686003)(6506007)(2906002)(38100700002)(122000001)(55016003)(33656002)(44832011)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGtrL1plcU4xUFp5SDd1YllKVHBsSlpHTGlqMm5uVnRnS2d1WUNVKzZiZURC?=
 =?utf-8?B?Nnlrc3pEK2tHWE41Q0JPNHVxNzhNWG45MGVMYkVUNm9qVndVNFVNZTRGVWhD?=
 =?utf-8?B?eERITHdxcFJqcHlIa2VBNkpzb2RaSmk5WHZWNmZzenBJZWFzdVhGRUxhWTBR?=
 =?utf-8?B?eWJITWVpUTVuTjdTYWd3MWVlTXZLZ3lFYVB2UmVGT2RjVlE3Q3ljMDJiSFJp?=
 =?utf-8?B?VlVzY3RxNmZSTHNLUVYwN2ZQeFlFSFZ2OXlhVGxiZVd4bXBneUpRWCt3Uktq?=
 =?utf-8?B?dVQvYUFCRWFOam1wVExobGZyZXpPNlpXVlZjeVEzRndiWUtqZHJaaTJVTnFZ?=
 =?utf-8?B?NDNXcE10QkZ0R28wSlFhcS9ydE1ZWml5Yjc2TlMvdm9FT1VaUGE0VVJuR0J3?=
 =?utf-8?B?bFY2TnRCZzBZMXdWbjhhR0pyMEc1cHlYQWxrU0xibmlMUnVvdkF3c3MwRUg1?=
 =?utf-8?B?WldsYlFJdzdPOW5XLzBnWGxqOGVrUWdJZkpxZERrZ2lPb2F3SzlLaHVaMExX?=
 =?utf-8?B?Q3QrWm5Wa0FGSUxGU2NxbTlGSklJekR1WlVYMWZ6TVU0VDRCdzdlSHFFNldt?=
 =?utf-8?B?ZVQ0Y2JEUDlCd3NxU21BWEY2dXJLYUFab25lYVlJY0ZQaFNVaW9oU1VCUWNi?=
 =?utf-8?B?TVlYMk5FNC8xTzFrQm5pZElQOUIxdFM0MTJvVUdrYWt0dDBGNGkrUEdrVEZs?=
 =?utf-8?B?V2d3cW9JY0R3SFd3a1J1MGRRYUxZVklKRnl2QUFZZXlxTUkwTEJJWit2ZFAx?=
 =?utf-8?B?MkExMGowVFZzZEtyWDdXeUtEeE9MeVArRE5iL3g4Z005L2o4elVmUGd0akti?=
 =?utf-8?B?K1JTTkhSUVQxTzlXWXZ1U2FmK1ZzV2xYa0tWNEU5K3hzdlRVZXhwd0hSc3ZN?=
 =?utf-8?B?eUx5RWdoSjBLb0xMNVlsUDBKc0pwbk83b0owZko4Sy9EVzg0d0JLcncvRkpE?=
 =?utf-8?B?N3FoSUtId0lmcXdOcGV3V0p0TnpBR1hGbEppWGp3Um1zMDVlMCtpZkxzTG9y?=
 =?utf-8?B?NmRQajF6L1RkSHFqeHJXa2pZSXRzQlZpdjhrUlExRWNIUmVVZ3lNR01qZ3ox?=
 =?utf-8?B?VlNLQ3hKdnRQcHVlZVNodm9CR1NMdzVxWWg5c1FlS2h6NTlHZFYzeHNKall5?=
 =?utf-8?B?UmNkMkwzRUpPYVNBVDVMNEUwaWx2TkxwOTNSMnRVbHhBRmlGS0NzQm5HdFUr?=
 =?utf-8?B?YVZVazFwSkNqM3Y0TUYxdk9vTm9nMFFadmp2ZUI2ZGdZWURjWXdzdkt6Q2l6?=
 =?utf-8?B?Vk1zSERBTjFVRXhwcDJxeVdOOTZIQ0xnZDk2SmcrSUdYS1FZcTkrT2xOUTNE?=
 =?utf-8?B?S0xNNFlmQ3NYZmVKUTVpMGhLdmtRaEhnNzAvSFdOMGpPQjZGc0p1Y0pqa2NO?=
 =?utf-8?B?YktVQzA0NlA4R2I0TkRzVEIwc3BZVGxOS29Cb1VvRStzeFQrcmhNVlBSYnRz?=
 =?utf-8?B?dVRoUjRRS3pObzkwdGF0YXE2ZEJmaHZUVWJIa0p0OVE4Nnp6N0RDcFkyUGdW?=
 =?utf-8?B?Y0ZHQkNINmNLeEJIUzNWQlVhQ2trVTJZNmZtVFh4cVZ6bDlUUXU5azJmVSs3?=
 =?utf-8?B?ejVIVW5pMFl2R1l5N0hVSGswOThmekkyWHk2WXJINW1BTFg0Ri93NVY4eU1w?=
 =?utf-8?B?Z1ZSUUZsV0JuM2tzQnJ5VEpzaEFBYitqRk10aW8wY2ZVSmREZXczYmQzNGpv?=
 =?utf-8?B?Rnp0THlVKzJIUVZpeXZxWTBPVVNsZld6Y0JQYjJDL3RVc1lRWDJPYkxTb3hu?=
 =?utf-8?B?d3lqRVJDNE9rNFovVmcyWXIyVFQxWERWam52N01CMWpMV2RBVDQxVTV5eFE5?=
 =?utf-8?B?SzZrY1B4RG85azlsaFVrczFUaithUzZkSUpWb09ucUQ5ZE94U2ZsSk5xM20r?=
 =?utf-8?B?d3YrYVc0akk3VnNHTGtnSFpEZis4cFRmSWsvMGlRUC9VNDFzYnZNLzBnSGtC?=
 =?utf-8?B?YzJSbzBmU3RSVjUxSzRkcEVPbVdzUHBOc3prdWRyY0JqOUxGWDdnQWZSSjNR?=
 =?utf-8?B?NW1yK05SZFpRRlRsYjdFWFZ6bkdMWkZCaFZ6bm53YjZ3NHlBNFFVY0RzdUll?=
 =?utf-8?B?YkRwbElUQzRBSlJqek9GdXhLK0Y5RXlSVE1lS0xrc3Nmb3owdjRlYlIrSlVW?=
 =?utf-8?Q?36+g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b4eea3-95b6-477d-e199-08da5e8541c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 12:52:45.2935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HYK1SCLJJvltv6Ea8ki7hP5bdmEArmfgZFwhYN4S+8pcVutl5Hxz8oxCnhAWNf3hIpQYkPs3NROTFuDJ4/Hdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5680
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBbUEFUQ0ggZ3Bpb10gZ3BpbzogdmY2MTA6IGZpeCBjb21waWxhdGlvbiBlcnJv
cg0KPiANCj4gRnJvbTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT4NCj4gDQo+
IEZpeCBjb21waWxhdGlvbiBlcnJvciBieSBleHBsaWNpdGx5IGFkZGluZyB0aGUgbWlzc2luZyBp
bmNsdWRlLg0KPiANCj4gZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYzogSW4gZnVuY3Rpb24g4oCY
dmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXTigJk6DQo+IGRyaXZlcnMvZ3Bpby9ncGlvLXZmNjEw
LmM6MTIwOjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPiDigJhw
aW5jdHJsX2dwaW9fZGlyZWN0aW9uX2lucHV04oCZOyBkaWQgeW91IG1lYW4g4oCYdmY2MTBfZ3Bp
b19kaXJlY3Rpb25faW5wdXTigJk/DQo+IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQ0KPiAgIDEyMCB8ICByZXR1cm4gcGluY3RybF9ncGlvX2RpcmVjdGlvbl9pbnB1dChj
aGlwLT5iYXNlICsgZ3Bpbyk7DQo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+DQo+ICAgICAgIHwgICAgICAgICB2ZjYxMF9ncGlvX2RpcmVjdGlvbl9pbnB1dA0K
PiANCj4gRml4ZXM6IDMwYTM1YzA3ZDllOSAoImdwaW86IHZmNjEwOiBkcm9wIHRoZSBTT0NfVkY2
MTAgZGVwZW5kZW5jeSBmb3INCj4gR1BJT19WRjYxMCIpDQo+IFNpZ25lZC1vZmYtYnk6IExlb24g
Um9tYW5vdnNreSA8bGVvbnJvQG52aWRpYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRhcmlxIFRv
dWthbiA8dGFyaXF0QG52aWRpYS5jb20+DQoNClJldmlld2VkLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIHwgMSArDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jIGIvZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYyBpbmRleA0K
PiAyM2NkZGIyNjVhMGQuLjlkYjQyZjZhMjA0MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlv
L2dwaW8tdmY2MTAuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby12ZjYxMC5jDQo+IEBAIC0x
OSw2ICsxOSw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC9vZl9kZXZpY2UuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+DQo+IA0KPiAgI2RlZmluZSBWRjYxMF9HUElPX1BF
Ul9QT1JUCQkzMg0KPiANCj4gLS0NCj4gMi4yMS4wDQoNCg==
