Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FFC55E43C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346221AbiF1NQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346222AbiF1NQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:16:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD343139D;
        Tue, 28 Jun 2022 06:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzAKDE3iYUyV58QOyDNAdwhkdc0Su5gaddPHiANNvuJZw8CDau0XDDsFHZCJxDHoN9oWLidwbCqlxS1TkfcoqrLd5ImnMZ4IFgyFsjyCEQFCGeLrkfg6O7wcWEZTNJnwyd97zKZvtfrmhOjQBGOAUGNjUYyfmzaGhI+sHWDA4ZTluzB49Wmmwd/updiQ82VbTWxSNj+MjI6UwJWnEHvyV/6xjnhkW0NeDBFn3ctXe5BJEzSsQkByKM/byD+jQzTGceEsuh6h3qDPbMUeiV8N87LNt2nOygpYy/TcQaTt7sPKxWppJvlFNuNFTZsbSuBwg+bV9+12k8viVXXm2N6W3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tmlgxLM31Fv66O4sIzQsjtrsapAybZAWUO+ZyG2khU=;
 b=Kxw7a7vP/MotNsr0TB+JsH0QDc+2jhYX/1AGmXinNHUTZl5APgTq6KuciZghb+SheJs2kgsXwlNgpOZDGqpVldtCExRI0jUWBVs/6Zed9W6ug+QB7P/56V63uJ+eqmm8P8+dl6ZJcT39A+6QIczM3kqwg7ObcPXlSIC07h9utGNk+TZBqBleIY/eLv44OKpIoyQ75UXZ6tkaZ0iPpOyvN0duxsF6iaA5SQgdf9eSVL7WrdvW+aWOM9mUm7dxwDd3oFE41rcZDlWp54zABVk1zJxXstqxEnuDKkMCQbV/maY9eCmV5kj5oot2Nt/DiBck43V1TEHTbfB+Z4MeJSgxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tmlgxLM31Fv66O4sIzQsjtrsapAybZAWUO+ZyG2khU=;
 b=Huxpx2vasr7GngavcdTI6ouAbBw+TJn0wZ9gKPQTpN89/Zp+KIDCD8SKHwhk8CnDx0Ec9LyuHS0YGSxuQyKTBVkU2ZhWAuyaZ3P5S/oWAkVVGUvF/RW+wpWOEy/udRwhdg6KX8Ljz7qfz/7JVOeS0ciBDD9XmSpDbqpefIKjJ54=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB2789.jpnprd01.prod.outlook.com (2603:1096:604:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 13:16:26 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 13:16:26 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] pinctrl: renesas: Add RZ/V2M pin and gpio
 controller driver
Thread-Topic: [PATCH v2 2/2] pinctrl: renesas: Add RZ/V2M pin and gpio
 controller driver
Thread-Index: AQHYh6dHSXIPhEirDkyjT9ZpN6NNCa1kxkAAgAAMmwA=
Date:   Tue, 28 Jun 2022 13:16:26 +0000
Message-ID: <TYYPR01MB7086714F47868CB18A8C4E1EF5B89@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220624084833.22605-1-phil.edworthy@renesas.com>
 <20220624084833.22605-3-phil.edworthy@renesas.com>
 <CAMuHMdXuF3nRzFaKuntqsS7m2e+hqk1+F6XSLaB+qP_eed6thA@mail.gmail.com>
In-Reply-To: <CAMuHMdXuF3nRzFaKuntqsS7m2e+hqk1+F6XSLaB+qP_eed6thA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 075e4169-6251-4c41-3056-08da59086827
x-ms-traffictypediagnostic: OSBPR01MB2789:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eSOTHPHmXfx/LHaXw534M4w0S5rR+xB2kMwvFWpWs4Gy1NEHNyh7n5vBBQGDB/0NU/PypBXl4R2Obh9qm25yGE+wI6ymaQcHdYkxpOl+kQPKBmy21PuYRmOzyFsge8E7AoFhFdayLn0K0zsQ1ZGAygKIfwrFb70tsxj/9ILk2xpCXzYFKK2oqkKLab33MzkNhZ+fhnqso9n0GSzImsmwL7fvtggslWaZf/uRNzPCmhBT5jc576HytkQElbrLm0OBN9/nQtpleZhaJpe9LqMFd/jQ6Rv8Ppvilk3QtQT7WKlkr7EwVU0jVk5lK4VezRc+09F27VCH9eukzp7TvbBww2C+I/ZoW/W6P7KmjxRiBdg15n9zENws34klbqjM4QKMVr1ODohpcJSP3r999iuHUhIOPNp0XV8j03sGdD0COGhiBOYAiRKGzD+BfaIt9yx93Xw1wo1XqUBsYtcYc2jUUw60HK5Dpv1/HZR8Ea5MSPq3MPdl/C/J6U4w6ORbxIjPWwgI4LOBd7EssgkyR/TSyL1JguEaJB/r8hlStPONB/D4egMZRCZVc2owKH94flXEHLNwsAuPAHFyEhb9DKhAfhJa6K4qlwvLp3cWmNfgv/mz1txwK9j62+qnpA/EODTZXJV4bW+Bgcv4CfzpCinWB7qwCfIKqXYtINQ5IIWc0qq2aSQJHWmlonujElFk/8bRWzdUUc8I+E6pa/isuAGeQ62qF2mSC9kaWcBR8ImWClfRoE9OQx/dwdfQye1HOiaoqSbE8NA3SGjWCVtWqk1W1oUhiyi5YP7rZkyYI3YmFLw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(8936002)(66946007)(64756008)(76116006)(316002)(52536014)(66446008)(4326008)(33656002)(66476007)(55016003)(54906003)(83380400001)(66556008)(8676002)(44832011)(5660300002)(478600001)(2906002)(86362001)(26005)(7696005)(6916009)(53546011)(41300700001)(122000001)(6506007)(9686003)(71200400001)(186003)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3QyNUV5SFZseERmbkNQbmZyU1dMelczWTRjblZrMktxNUpvanJkeWdTZllu?=
 =?utf-8?B?TFhBTWRtZEIzUDAwQzJqd1NUQ2RVaUZnY2I3RFpoVndOUzNHcTYvK040U2Zh?=
 =?utf-8?B?S1BmQVRNZ29JZGlUYzdPaEg3bFkwWFhPeXNaVnZNblNiUVZCam5MaFFJQzg0?=
 =?utf-8?B?eC9ITGJaY3lEVXZhUkNDZzdtYURmaHJhVjBsa2p4VHBQZE9PRjhtTFo0UWlM?=
 =?utf-8?B?dCtmaTJ0RjJZK3dTRXplVnBDV2JFaDdBWXJQWDRGTVlOMzNGQlZTSlMvYU1v?=
 =?utf-8?B?bkNucXVSMWc3K3RDT0VERlVmY3ZnNHIxZ3pPd1h4dXoxaVdGclFWQWltR2RS?=
 =?utf-8?B?MXlHMTErUHNhUEUveVdlSVhJZ2l0Mndhb09Lby9Fei9UVko0SGgzaks4TlFk?=
 =?utf-8?B?SDFxWnRPNzVvTGtSaVBDQlpXakxja1JaaVFaTXZvcUZialRjbER2ZHFYRDZM?=
 =?utf-8?B?dFQvVWRWR2JmTlJabzh2dXlqa2tST0gyY1M0am5PbGh0Smw4T084SjFsN0hv?=
 =?utf-8?B?QzBVYm5KVzAzL1hyWUFHeitUdmE5Q0l5cGlSZEpiT3E3Z1VhTGNnK01vdkw5?=
 =?utf-8?B?RjAvOU11a0QyL0xSNmI2Tm1TSXR0a2JVYy9lVEI4OWFwRWwvdUVkemhnM1k5?=
 =?utf-8?B?VEZsK2tFME80VlpCYlBFeWJPZko5SzU0NHp6bHdvQ01NWDNZQXlsb2xUTFBI?=
 =?utf-8?B?WHVldlN4RSthc2tBYXdwOENXMEExRm1yNmU1NG92QzVqOFBUdkduN0NmQkg0?=
 =?utf-8?B?SDEzNXA3dGJNV0kvVEN0QkpWcWxOdHVHY284MkpWMWFJbElJNm8zeWNhS0dz?=
 =?utf-8?B?SXBIVjE4ckErWjcwUXJmVUo0SXpQekVLdG9sN3AyMVhienYrNVl4dCtTaVYr?=
 =?utf-8?B?TnlHbUNCUEhGLzhsd2p1Sm9UV1ptdG5QR292QjRYNTcrOXZNNW1SVU9hS3ZS?=
 =?utf-8?B?UWM4MVVMOEQ4aGt0QmJXMk5Wa3BZdkFsTU9HZS9iWlgrOWhvUGZabmlZQmY2?=
 =?utf-8?B?SkxLTXZpanJhTU41cEp2Yk1QUGRqMDRiMEZPSnErOCtsRVE4VXdwTFNxL2lE?=
 =?utf-8?B?UVRBNWdmd09ENjVFdVJxZEhMWitSaW9kMW1zN2tla2FlQjYrS1dBem5vSjZS?=
 =?utf-8?B?VVlrMWIrOWZMNTJ2a3V2S1lpM0JEVTAwaUxBTm1jZFBtaGdIcTY1Q0VCRWJP?=
 =?utf-8?B?eWFSS25hQmNtTWxCcWJ3N1RkbmhoR2JLZnFOTk9NTkJTVCs2WTIxc203Z3or?=
 =?utf-8?B?OU1xemxXUTZPU3I3SFc3UG1JRGhHRnIySHBKRHZvSm1OQmcwNyt5NW9WeWl5?=
 =?utf-8?B?aFhpUkhvWldrdWwzTk1xd3lML0o2S1ZSaEtPS3NhUkV1ZDQ2UDl1L1ArTmE2?=
 =?utf-8?B?WjlzSU80SVdZOWQxSXlQaTgzdkZqYk0zODg1UHQxVVBBRGt3b0J4Vy83ZWsr?=
 =?utf-8?B?a3BTTTdNTytVN285Y2ZTUkx2ZFhuTWhKMTlGK21ySlM4OFlwL2Jab0hwSWx3?=
 =?utf-8?B?VW1Obzc3WUtSaW1HR1ZQdjJWMjRjS1piQWJabHBuQkJ0VzBhbmNPaWVCTS92?=
 =?utf-8?B?c2syenRRd01KOEswTTlWS0o1KzJYdENSZGdaVU9oWmhRenJhUGJsMk4vaS9M?=
 =?utf-8?B?L3o4MkNHOHdlaVdDbnVEbEc2d3kwbFY3UThXWFIvTzZKbm1waDViSmlsK2N5?=
 =?utf-8?B?cWtKZElUcmcyRWtyTWJVakhtbzhYYkhYTndGMjRMQmtyZmZqZmFISzFkWlNU?=
 =?utf-8?B?ZjVSalFXUFRMYktocUdwN2RPZWRuVVpuNFJmeTE2SGtkTFVUblVrM2dET1NZ?=
 =?utf-8?B?Y29rMnJmKzBLQTRDK0NtWUJHb3N6RVV0R2RWQ2tUV2tvSEVYSUhhNVZ0cUVk?=
 =?utf-8?B?Qm5qZE5GdU5DZytlMjZjRUlmSTN5RVlIcERQWG40djRlVlFUQlNaUDZWQjBa?=
 =?utf-8?B?S3gzRmo4QnJ6OUhYeEt5TW42aUtUVW5FeWF1dWUvN2kyak5YektDd3ZTd2Yx?=
 =?utf-8?B?V1pORmJoYTYzeEJiUDhZUmd1eEx1Q1VuNnJuZ0ZLWjFPSWZFUlVYbFBUUGw0?=
 =?utf-8?B?YVdtOVNEVzNlQ2VkZ3RnRlltZlM1anR5ckdTbUlCQnpaVmRnd2ZjR3IxLzlE?=
 =?utf-8?Q?+9nEWfDOo0d3XdYkQJqojkqTp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075e4169-6251-4c41-3056-08da59086827
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 13:16:26.7886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/i+5OS2tsFGukp6gg4WpAX4AMvp2q6Mw0RMYzOVB8FiOWROfA7kSFr6oNHCcDJxrfLO8772MN7b7YLOfKmHdtxdGoZEYPdLTYjvNr4Z5Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2789
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDI4IEp1bmUgMjAyMiAxMzozMCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDEwOjQ5IEFNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHBpbiBhbmQgZ3BpbyBjb250cm9sbGVyIGRyaXZlciBm
b3IgUlovVjJNIFNvQy4NCj4gPiBCYXNlZCBvbiB0aGUgUlovRzJMIGRyaXZlci4NCj4gPg0KPiA+
IE5vdGUgdGhhdCB0aGUgREVURE8gYW5kIERFVE1TIGRlZGljYXRlZCBwaW5zIGFyZSBjdXJyZW50
bHkgbm90DQo+ID4gZG9jdW1lbnRlZCBpbiB0aGUgSFcgbWFudWFsIGFzIHRvIHdoaWNoIHBpbiBn
cm91cCB0aGV5IGFyZSBpbi4NCj4gPiBIVyB0ZWFtIGhhdmUgc2luY2Ugc2FpZCB0aGF0IHRoZSBv
dXRwdXQgbGV2ZWwgb2YgVjEuOFYgSS9PIGdyb3VwIDQNCj4gPiAoZm9yIE1EMC03LCBhbmQgZGVi
dWdnZXIpIGlzIHRoZSBzYW1lIGFzIHRoZSAxLjhWIElPIGdyb3VwIDMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjI6DQo+ID4gIC0gTG90cyBvZiBzbWFsbCBmaXhl
cyBiYXNlZCBvbiBHZWVydCdzIHJldmlldw0KPiA+ICAtIFJlbW92ZSBQSU5fQ09ORklHX0lOUFVU
X0VOQUJMRSBhcyBpdCBpcyBub3QgYXBwcm9wcmlhdGUNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVw
ZGF0ZSENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9y
ZW5lc2FzL3BpbmN0cmwtcnp2Mm0uYw0KPiANCj4gPiArI2RlZmluZSBEUlYobikgICAgICAgICAg
ICAgICAgICgobikgPCBSWlYyTV9ERURJQ0FURURfUE9SVF9JRFggPyBcDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoMHgyOCArIChuKSAqIDB4NDApIDogMHg1OTApDQo+ID4g
KyNkZWZpbmUgU1IobikgICAgICAgICAgICAgICAgICAoKG4pIDwgUlpWMk1fREVESUNBVEVEX1BP
UlRfSURYID8gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDB4MmMgKyAo
bikgKiAweDQwKSA6IDB4NTk0KQ0KPiANCj4gSWYgeW91IGRvbid0IG1pbmQsIEknbGwgcmVmb3Jt
YXQgdGhpcyBzbGlnaHRseSB3aGlsZSBhcHBseWluZzoNCj4gDQo+ICAgICAjZGVmaW5lIERSVihu
KSAgICAgICAgICAoKG4pIDwgUlpWMk1fREVESUNBVEVEX1BPUlRfSURYID8gKDB4MjggKw0KPiAo
bikgKiAweDQwKSBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDogMHg1OTApDQo+ICAgICAjZGVmaW5lIFNSKG4pICAgICAgICAg
ICAoKG4pIDwgUlpWMk1fREVESUNBVEVEX1BPUlRfSURYID8gKDB4MmMgKw0KPiAobikgKiAweDQw
KSBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDogMHg1OTQpDQpNYWtlcyBzZW5zZS4NCg0KVGhhbmtzDQpQaGlsDQo=
