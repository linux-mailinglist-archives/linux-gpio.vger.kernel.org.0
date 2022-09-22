Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D2E5E5D6F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 10:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiIVI1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 04:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIVI1O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 04:27:14 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4B2A6AEF
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 01:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq7r6PdMQSyzKF/JhYuBcqUNFiwhoSNt1B4rRj7Cub/IhDTLjKYAhZtF6plpVhUE482hbCMZpHdNUfNjQ67QpOdKlJv15hRXW3EvbuooTpG7plheJOJczhtiOYiUcwzR2uUztQEmyjhJBnl9LCIqHXCDyhnzncpSQ7/BUkQZ86RiRvgPzS7PInKA342rXAI7AH534jDs6HwujzgbtMaJvzwYA032ufU+nUlgMfi2fwKjpVfRqiJ/M8Os13EciHrBWfgKXXPjXZwEpIk7+OTOHRPQeqZhAAaHGdw7BCRhYF2V16YYbWSFYIDQO1cjyJNP2CKDNgHDv9vxA0oXj/Kkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6R4e4TJPfa8RuY8dPuz8mOqWpt1n+8Xn7trko7RV3xs=;
 b=mHUSFxOjiiA8P3If72XGxarh0DArYwxH5kLMtsPkPNwMgnnAA6Nscwd4dxljMVTwrXFQz4tj1gpHnxzZIoVdsMdlwvfOOHtqeGW8tZVkQOI198nNdQ+oNM1mg/vSPhP96yhOJ67YuuGNhLOOAmWrb0xTCzUlCXiV1ECSbwjNAiR7YNpq4zs7hpBxOJY6aF/LJRIhNqBSryB7gRZqRCvujP/KheypRUVg5NHkdB1839hZQ1UmDNmOnN3DgrIdhtFedtrkHXHXv8fbabJuhZib+ifmXxgYZC/9H4sQVaImMa54ria6TEMsLrLMiDYS0e91IDTynRNlZ6R75Btaa0VduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6R4e4TJPfa8RuY8dPuz8mOqWpt1n+8Xn7trko7RV3xs=;
 b=LdCQ+G0xUpyJ84uaG4imJMFoW5U7qwXeAKR2JGzNdzPM55AEM7bdxoWBHCS7bdgBg1Mkd79/kfU3L/3yn347bOnJNhIV36wTCIvnXIYxmTOIrOoCwIsU6HJLDzGURa5vNTqSdVNQdblzM6mPHZAcYLEk3ilxGt6kGrw/cWxuXPs=
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 08:27:10 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::619c:feef:93c1:9dc8]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::619c:feef:93c1:9dc8%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 08:27:10 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] gpiolib: add NULL to the end of arry
 of_find_gpio_quirks[]
Thread-Topic: [PATCH] gpiolib: add NULL to the end of arry
 of_find_gpio_quirks[]
Thread-Index: AQHYzZCIngOR7Vt4DkOEsS56MbhGLq3rHe4AgAAAiEA=
Date:   Thu, 22 Sep 2022 08:27:10 +0000
Message-ID: <DB7PR04MB4010E57CA648BD33A4BD9D4B904E9@DB7PR04MB4010.eurprd04.prod.outlook.com>
References: <1663746237-7133-1-git-send-email-haibo.chen@nxp.com>
 <CAMRc=MeDqMg_sh2YCGhO3=BkjFRbqFUf0VaH0H2EYd81e5H_8w@mail.gmail.com>
In-Reply-To: <CAMRc=MeDqMg_sh2YCGhO3=BkjFRbqFUf0VaH0H2EYd81e5H_8w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4010:EE_|AM9PR04MB8355:EE_
x-ms-office365-filtering-correlation-id: 674264a8-c567-4cb1-ec42-08da9c743ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fjQY5hsAYF+VfhUMM5OB+7fm6inLmUo3ej0ndN4ayuI3t7Hjq5IXThc0Q+61ktcWT/MlSixWQfEcZqbzZs2M/7OiTvlw5pfFYGft1CBFDYboEGvPYNYyUS6V3Vd673u1iPamgNfjy7RNRn48TZtAtoxyNxs2KwzzaG+reD+gGYVkra4GhQxZvNzyFFdzP8cqlZ1amOz2cipAlLEhAAzTbaoPcKTsj9TUO6xBaJIJ8dTk2kHzNX+QpjKBj6PlU/lwtJvGrqfLsPmqhiaeAvBXUx8KL6H2gWVXld4CN7ksBWHAleW6GMBmmWmjJlkFCpmTYHMeyRM1z96OR/GV5WINwN6aDRB1Ok9QBPxDAOMczmO+3d27rWnB2EX2STCZcwNTUDCJVy2ctVmICnAdttO13khz51DYcKb6TFbB7z2e7V9vaAU7LK0Vekqee/AnvQ0VgSfshS7qmSKDfkRglIZDwCbxKEhuZG4+Ga+GFUjqO1zxfGDoY8XEVWKkyI6Ckwo2TMxV21wjv779XmI2oZtpcTU44Qmx8F31sWz8bbx0GfOgm5F8iNc088HItAhvb6rDiSTXXfSD4uEfd/0zb4kFHVT5f8iyfgQ28Aan13fUsi6sT7pOYyITa2OlPtBt+Q5scD61Zi9A4zTTESAHqjqxfeFqGl+lt8sNUF9wiV/X9JMVUpF78Hq9JgVVm/9NtmYQW8e9MXJ/4MBsDx2PhCLIvKaz+eZh+YPFe1vB2XZkyp5KMqnPpep/YmJ/2GnoEwu4p2IwU1gxvt2xDKsxQYR/cg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(186003)(83380400001)(26005)(4744005)(9686003)(53546011)(33656002)(66446008)(4326008)(64756008)(8676002)(86362001)(54906003)(66946007)(6916009)(122000001)(66556008)(66476007)(316002)(2906002)(52536014)(5660300002)(478600001)(38100700002)(8936002)(7696005)(76116006)(55016003)(38070700005)(71200400001)(41300700001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTRRN1ZhbTJuM2tiWEZzYUdudUt1TDB3eDMxM2RSUGRON1NvV2RmVjFiYnA0?=
 =?utf-8?B?ZGYwbXVqUloxWm14ekRNUFNDLzJWQjkwVzZDSEVzbHFmcnduT2t2LzgvY3ZT?=
 =?utf-8?B?cDFKSVJ5Rk1MK2pHWk16bGVkWFoyNTFtR0RLMGYwY1JEYjhaNDVjRjMvSUhn?=
 =?utf-8?B?MHBra0VwVHFPNjdjRVFMcFpKeS84NG9velc1bisxeWNveVphc1dxRC9yN3pS?=
 =?utf-8?B?OEs2dkFwSElFSFduOWdlc1Z0Yk9POXczakhoNlRyQldWWUlPaitUT1RhTVpj?=
 =?utf-8?B?aUUyYUkrVksvakprZCs1QjVYcW9oRUtaTktVVXBoczVBWUltZDFzTDYyLzl1?=
 =?utf-8?B?Z2hiYlJFcmltL0hXMGVmaHlYQkN2NFJRVEJwWlo1bVBYQlQxdnZSTStRa2lq?=
 =?utf-8?B?QjdMeTMzN2c5RlNrK3JjN0xxc0Vsb2xsdWpQUkwyT0hwNzRWOWZKOHVRMzJC?=
 =?utf-8?B?NUUvMit5RGt6UVhyVHhjeE9RQXNGc1lzbWVWQkx2bkx0L1Z1WWRNZE1MbTNH?=
 =?utf-8?B?cGVydzFkZmFLR29HQWYyTE9TR2FTRUhaTU1xUENNbjZWd3AzVFZhMkxsRktT?=
 =?utf-8?B?aW9nT2tYaldRcGk3eVdXSDdER0ZxeERxV3pFYml4V0R6VWFJMEk2MkR5aXlr?=
 =?utf-8?B?TXJPd1RQRUF2MVFpcE9TV3VCZlF1OXVzVlI1c1ppejhMWDdENDZwT3VFSXVY?=
 =?utf-8?B?R3p6eTZTZklGMEhzT21tcFlRQ294UnQvRjNiUFJWRkZWOENPYjk5YkZ6VW5s?=
 =?utf-8?B?VGpUMU1XbVg3VHgzaWllSGJacVY4TnA4UHlQS0J5Rk9CQmw5aEVZYjFQTzhw?=
 =?utf-8?B?TGN2YmU1WTM1d2FUSElCQkw3U1VGS1FoS0VRYXRaWXk5OVBCMDhNN1lBQ0xZ?=
 =?utf-8?B?UTQxL2xhOW1xYmdkQ3hNeXQ3UjhyYzFVTXMwTWtsS0NSQm00bW5Ed2hNNUd5?=
 =?utf-8?B?eGRpYmdYS1hveFRvTXArNmZYTXVsSThBWHZNdG9GbFdweHdZN3FVZG5JV0ty?=
 =?utf-8?B?ZEl5T05LemhjeHVBNEZTK1NFN0FnYUhWMVVSNDE0SG1XUEg0clpmcHVQb2pP?=
 =?utf-8?B?c0VEMWlBWVg2eXJSRkJsRFBMdkI5SmNPeWVCdjhYQ20vSW8zMDVCR29oMFdv?=
 =?utf-8?B?YlZyb1ZWQmVNNm5lMU9BeHhsQ1BwZ3N6OXAxYmpoMjd5bGljVENzelcxRmZD?=
 =?utf-8?B?cyswNlZzZWdDSWJOZEU4TGZQZFdtTTlhU2J0Zmh1TXpNNDhkV0FWakgxajU0?=
 =?utf-8?B?MmhqdmZ0K0EyTkJHTGNsbWtFRVVPU2x1TDEvWkhzWTcwZ3h2YWlKUzBXSDBK?=
 =?utf-8?B?L2wxN0xET3VtNTFZTTZQejBnMDMxWTJUdm91KzBOWCszcXM2NDVpbDZVc2xI?=
 =?utf-8?B?Zm90R0tSbTZSdGlzRHNkZzVQUDJ3MXpmMFc4QjQyN3ErSURhcUw1R3orV3o5?=
 =?utf-8?B?QW9MUDVGL2tJNmE1WjVHd1ZSM0dtOTZ5NXErUWhtVS8rTEdiZWtwOHczdDd5?=
 =?utf-8?B?Z2JzdDFUcGJaVjYyWmlsWTE4bmVsOUdKeEwxQVQ1ZjdUcWM5UC9GRVVRS2xI?=
 =?utf-8?B?bTFuZ05qZVZTNS93aUdKTk5iK1F3TWwvUTlkbzNJRS9mbWRtZ0xDM0hPMXFU?=
 =?utf-8?B?dHN6MmtFL2pacVk3TmNaV3Y0Y3BzcGptMTlhU3VURnNPbHl3a1hUT1h4VDZN?=
 =?utf-8?B?NHJybUt6T2NwZVZFZG5vK3NTZm96MnV5MXFGaHlGMkhLMUc1dktKdlppc2lF?=
 =?utf-8?B?VEx2bzRhSWcxTWowOGJXNXRpV2hYNW1ZYlQ4bjJZZWdOMVBvV0UrVHJVMi9x?=
 =?utf-8?B?QXduOTVxaytRZjVYV29GNmRCc0pMMkxkcGM1K085S3Vkb2pYWnNpNXR6bHhU?=
 =?utf-8?B?L2l0V1JtT1pjTCtPenlTeCtSRHdZRDNmaFZmL0tWNE43d2N3VFFXTFhicmV4?=
 =?utf-8?B?cm5kdGpjYlgyTlprbkNIUmY1ZVd6RGQ3TkNhVCtkYVZ4NjRSVDlUTVcySStG?=
 =?utf-8?B?TVFiNGNwc01ERHNRRFQxRGVIUmQzUC9NUUx6L2taT1I2TUVSaWkvbEFaQUx2?=
 =?utf-8?B?L2xnVVVNVHFOcWxwb0ovdDlFWDI1a1UzbXptUHpBSkRvRU41NlNzVG9rYzVp?=
 =?utf-8?Q?QiQ17yIWmmW8C8usAf97Yq8im?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674264a8-c567-4cb1-ec42-08da9c743ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 08:27:10.6907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYjAGOnxw4a2if1CT/QjGmWSSrGhWieNY0G022kGoXoy8bjRa0eT4h26indolJ9k/DA6dIILmD+RxUYOOgvCNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiAyMDIy5bm0OeaciDIy5pelIDE2OjIzDQo+IFRvOiBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IENjOiBsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc7IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb207DQo+IGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnOyBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsNCj4gZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZ3Bpb2xpYjog
YWRkIE5VTEwgdG8gdGhlIGVuZCBvZiBhcnJ5IG9mX2ZpbmRfZ3Bpb19xdWlya3NbXQ0KPiANCj4g
T24gV2VkLCBTZXAgMjEsIDIwMjIgYXQgMTA6MDIgQU0gPGhhaWJvLmNoZW5AbnhwLmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBGcm9tOiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4N
Cj4gPiBBZnRlciBjb21taXQgYTJiNWUyMDdjYWRlICgiZ3Bpb2xpYjogcmV3b3JrIHF1aXJrIGhh
bmRsaW5nIGluDQo+ID4gb2ZfZmluZF9ncGlvKCkiKSwgaXQgYWRkIGFuIGFycnkgb2ZfZmluZF9n
cGlvX3F1aXJrc1tdLCBidXQgaW4gdGhlIGZvcg0KPiA+IGxvb3AsIGl0IHVzZSAqcSB0byBqdWRn
ZSB3aGV0aGVyIGl0IGlzIG91dCBvZiB0aGUgYXJyeSByYW5nZS4NCj4gPiBVbmZvcnR1bmF0ZWx5
LCBpbiB0aGUgYXJyeSwgZm9yZ2V0IHRvIGFkZCBOVUxMIGluIHRoZSBlbmQsIHdoaWNoIGhhcw0K
PiA+IHRoZSByaXNrIG9mIG91dCBvZiBhcnJ5IGFjY2VzcywgaGVyZSBpcyB0aGUgZHVtcCBvbiBp
Lk1YOE1NLWV2ayBib2FyZDoNCj4gPg0KPiANCj4gVGhpcyB3YXMgYWxyZWFkeSBmaXhlZCBieSBN
aWNoYWVsIFdhbGxlLg0KDQpJIGp1c3QgZmluZCB0aGUgZml4IHBhdGNoIGFscmVhZHkgaW4gbmV4
dC0yMDIyMDkyMS4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQoNCkJlc3QgUmVnYXJkcw0KSGFp
Ym8gQ2hlbg0KPiANCj4gQmFydA0K
