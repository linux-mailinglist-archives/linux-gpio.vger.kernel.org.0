Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994BA3F014B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 12:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhHRKJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 06:09:58 -0400
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com ([40.107.237.68]:45152
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231218AbhHRKJ5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 06:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCshf6dkx1OwAO8kgjdt83gnZQ2JZG/ET4+pvfBNpzODlikqx5XeAh/mrbseBQM3jTLdkn5meNO6VbnxosGJ2jWXrpI8AmxZUD0STs+koTDsNHiz9mjQqo72vQTgPPVPDWHYVAEAcUcOjkRZX7galA2ntxdsK0NreLUOsAPrKof6AKHZFDiEVxroeoNTqvNgh8Ww/Wig1yUrsY+Xt766eqen/aHBAXoP1pVvqZykssg0LveZZiPeqLUMUMOvaX2zixUfHGcJQo5Cq6UunnN2WUOC9sR/kwJ7nQvN98l1+zX1Wej1Y5P8jNh82OaXoKU62JzHVfR5iELRjFuAEYHzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPvr/23hTaLPHtRsPHupvAeRMno1K3AodMC5tgpzueQ=;
 b=l5jtX8toLGaBcIJDGKa28yXqDRXvWJLf3HC/tiHefvFs2mbTW0s4ds1Druj4PwghbG0w79SJu5/DVYPqrE/ifU3jTQYdNYpO8J7PfEDPSen1/ByrY3dkUkpW1i9+G7p0FVQs9+jBOso96yU05+EZb0IEcY6MrTBfrIK65qIxWGgo6lcDXw6y3SLh++fA0HviUIvI2UxtexA09Pk0eXU2kt85oQKK5HujZR6JtpE2rOzg4t+API2d5mxmTYm59/8Psx0ABcqw5FTUYf+8Rz1GLLC6mA86lLn61NJruwailtUCpv4UFQsHAsW9lSlZLRMYUcUutaqdxjmlj3BmETgORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPvr/23hTaLPHtRsPHupvAeRMno1K3AodMC5tgpzueQ=;
 b=WRw79jj6RFkKTW77dbUTdEUoT6Q9/moMiPVvAlC0GV689JFYH5jEkNRHduaCQ3TUa+WNy4ofoep79VT8UiUd8f2Ni+YqZ28p/sheWuTedDpCyGfFLvE3X5XUTtSfrnFsIJKj1KZwPYNr49eISWoYnWNXeuYxxA/Ky/jLHG45ctE=
Received: from SJ0PR02MB8644.namprd02.prod.outlook.com (2603:10b6:a03:3fe::20)
 by BYAPR02MB5877.namprd02.prod.outlook.com (2603:10b6:a03:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 10:09:18 +0000
Received: from SJ0PR02MB8644.namprd02.prod.outlook.com
 ([fe80::86c:2d65:34de:65f1]) by SJ0PR02MB8644.namprd02.prod.outlook.com
 ([fe80::86c:2d65:34de:65f1%9]) with mapi id 15.20.4436.019; Wed, 18 Aug 2021
 10:09:17 +0000
From:   Piyush Mehta <piyushm@xilinx.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "zou_wei@huawei.com" <zou_wei@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Jiaying Liang <jliang@xilinx.com>,
        "iwamatsu@nigauri.org" <iwamatsu@nigauri.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Rajan Vaja <RAJANV@xilinx.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO
 controller
Thread-Topic: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin
 GPIO controller
Thread-Index: AQHXlAiba+p8agT4/0mzE0t9iLwfL6t49I4AgAAN9tA=
Date:   Wed, 18 Aug 2021 10:09:17 +0000
Message-ID: <SJ0PR02MB86443029095BF5949E51808AD4FF9@SJ0PR02MB8644.namprd02.prod.outlook.com>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-4-piyush.mehta@xilinx.com>
 <b3d718af-6eb7-a212-f599-d0d91273afdc@pengutronix.de>
In-Reply-To: <b3d718af-6eb7-a212-f599-d0d91273afdc@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1319c81c-28d9-46e5-7a05-08d962303d7a
x-ms-traffictypediagnostic: BYAPR02MB5877:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5877727B58915116739EA328D4FF9@BYAPR02MB5877.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GiePoapQg0YXj4KrYIWEsGqDynM69Ewg9l000pAXtdc15vF9XooTyO2TGiOqMSQSkdMnUGxkvcQybdF90WSve4ZQKKwndxKeECbKz8+CM07FV+4FJ38yic9zIaQW6sD4qnN5GBdiyO1hOylQleaL/gkViqrFQf07jk+H/rGkQB6N/Jgg1xvVGT2F/6vkxHp2byqo5xeZDyCOMp81uuCKrO6qW7W9DsN45+99K4IeH/CWl1vPesqkozv2mkIJ9yXqQcdCp8uKJlp5Sru4M8DIRVq5g27WzBc2lEUUL7fpLlTDemJx7Ka/U4I40a5iRjM/VV0Yf20CXab0UUnPAaXMU14lIea9fIxXSFfjsER/XjRt1uWs8pQLrUfAZ7D8MhW2+J3HxG9Vc59P0aDIZP6ayxgGRlNnqrvP+93gcoTm1bdfdSOlZDZv4k9cXFgj624k5udFj1sJ1nO2ivr8EjXj38baWiLIyATqF+9Jr/Llad6gYNinMFyDFTRxAp7WAw86NxmtQIoBbHYs9rhG+JBe0DS7jWr3u7Wx9VVNsLf8WipDdx1i7fM4U46H1UcNRKRgsF+/n6vH01g9EZwza4X7uTNXIDyWFMVr7Wa/2KVCjUi31ijAoaJ4gL12EwGT38/wFzrcCgO/QgAP+1ANT3+NVctsxpSGDuNdKVkF56VZMDAfKjRR9WqEdhZYoIFvb8PXMcf6/q5PZeiSzNpew5TpX3jmb55zpMJOiLqz503upX1a7TdYHlCMk5lRce7unNMjLzkwkQQ6tiRqAetyHMeWk+eXYyN5fcFoYyyDi3WDmdzisMm+HASKprk8hje8NpyM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8644.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(83380400001)(110136005)(54906003)(2906002)(6636002)(66946007)(966005)(86362001)(5660300002)(38070700005)(33656002)(66556008)(76116006)(66446008)(55236004)(66476007)(478600001)(7696005)(53546011)(26005)(52536014)(64756008)(6506007)(8936002)(55016002)(4326008)(186003)(316002)(122000001)(9686003)(38100700002)(8676002)(7416002)(71200400001)(921005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3k3TVpqKzg1cHpaSjM2MGJyRTgyaUNXMTE0aC9ReitSOWk5dkpudEpIU2d3?=
 =?utf-8?B?RUZVUXdzSU16bzkzNHdrTk9IcUZVc25HUHZERWdZMkE5SGluRDg5cG9VMUpq?=
 =?utf-8?B?TjJ6c3VFSWZhQWs2OGc5VHVzVFZGRXhUa0NjYmlnaHVTakJQT1NXYndic0lo?=
 =?utf-8?B?aG91dDFHalpOZkUyRzZhdU93c3ZVa1BmNWZkbERRUGY1eUQ4WFpLa0VYQjhr?=
 =?utf-8?B?S1ZCa2lnQmNxSENQOG02elNxbWJydVpoWXFRSk1iNzI1OFZSVVZKb3VZYmlz?=
 =?utf-8?B?T2dmKy9vQytIdFlIWnd5NVBJWlkvd2RRckJBcStPS25nSjlzaGVMUWI1VTN4?=
 =?utf-8?B?b3JHbUpqSW5iN2VUdHhGZFZGM3Iyam0xZTVpdGIrSXgwNm1BQWxzTkJpZUdo?=
 =?utf-8?B?UHMvSllkVTh6dG9RdnM3ZnFrZEF2MVIrYVhSZVdhOE56M3ovZkUwREc4MmlR?=
 =?utf-8?B?SG42STRqVGRNSjd5SnF1ektlRHJkdHlHbHVYQnNlS0JLbTVoVUxjbUlWbEpM?=
 =?utf-8?B?U3N5cnVYN2RIVjhNUXlZRXNDcFc1U2ZpV1pOYko1dTRSU1IzemFzb3pVdk50?=
 =?utf-8?B?aGhFVVBLdlQzR0t4eHZza09Ha2NjT3RNYzJ2d1drSlk1RWY3KzVlbWtwWGVG?=
 =?utf-8?B?VkIxc0hMNzVxWE9nRnRVY252OEsyN0NwYXhzU0hMR3ZERE9Za2NoeTVhZmhC?=
 =?utf-8?B?TDRnRGRTZGhiVDJaVkJWMGxwY0ZYTWJaaUtzODE4NzIxMGNWMEkyQVU1ZWM3?=
 =?utf-8?B?RnRyNEZiVGZ0VUlJYStSU1FUNlFKUzBkQmxvRjlGUE80YXZsK2VYYnJzSmR2?=
 =?utf-8?B?RnBiaXVVd0d5dlNLSW82ZUFSSE9CWFpSVUdubmEzeHlramFDSGR2WG1KVHhL?=
 =?utf-8?B?a0VlaG9heXJESTU2ZnNCdEZlUjRXZHI2M2lvV1BKays0WXBFV1pEMXZ4NFd5?=
 =?utf-8?B?eTlXOWdyYjRyYUhQNlRDSm5qbGF2VlJYNVJTSGJZWGVScjVZRWlXOGRyQXlr?=
 =?utf-8?B?RTZUakJaUDh1SFpVZngvK3RPYlBGV3N2U3pOK2xuYXE4cVVqZ1FEMHNHQktQ?=
 =?utf-8?B?NDB1MGkwTWxGTVhOU3VPQUpoQ25SbDdXMWY4Vjk4SUlqM2pnNXFnQXg4QkE3?=
 =?utf-8?B?VXpXVjFiQm1uNTlRWkpIaEE2VDlQM3V1SytTeGViNnR1RzRkNm9lMlhRUXNZ?=
 =?utf-8?B?bUlwcDVtQjJvWS81SURLTGVGS1ZkNFFxMGdmMGlLMXF5NkNqSlpRbEowUnps?=
 =?utf-8?B?RThsSnQzY2IydlR6clY1VzhDZGVrVXRvaElDQlN1YVBuWUF5V1cvNFhuQVRK?=
 =?utf-8?B?QzFoYmNsaWRNM2phbHVhbER4bnBZeXlUTkUzTkMrUGs3b0svNGNPZ2ZHSTQ4?=
 =?utf-8?B?WFpWNFozeFRleGpzYWlsSkcvekRaM0lIR2RSQm43Q0VQSmhDMXl1dXZRZzdn?=
 =?utf-8?B?UTJleWJCY2FFa2N4NDgydjI4dnIvQnVRaHliUkxObGhSZlpFSXZSbEo4QVJw?=
 =?utf-8?B?ZFo0eVNBd2xPcmdra3JUQXZ5Y1IzNHBXRkIydExQMzg5cXIvdkIwZzA0SVdm?=
 =?utf-8?B?b214Y0MvSzdIN1MwdE1FR0xnaStqWU91d3BYNVVlM0kyWFJsdXV2YTg2Zm9I?=
 =?utf-8?B?blZOUWhjUlFHS3lUZnorRnFHUVBLRXdCWjVhTkZodmx3aEdsSU5xSjF1ZTc2?=
 =?utf-8?B?bU9kK0gxR2d6djNLTHVwSDdjajdpZUF0aUpXaEt6UitXL1I1VWhwbldVdFpq?=
 =?utf-8?Q?L5+orF6QS3UW41FRfA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1319c81c-28d9-46e5-7a05-08d962303d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 10:09:17.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0k8XI6AiezyxbSu7+Ws0OrGZVI1itIGw5554ajcwxDxGndYGfqURgEUMtRMGk/dNunbdvNSNfB7eLorWaJ//bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5877
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQWhtYWQsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBaG1hZCBGYXRv
dW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPiANClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE4
LCAyMDIxIDI6MjIgUE0NClRvOiBQaXl1c2ggTWVodGEgPHBpeXVzaG1AeGlsaW54LmNvbT47IGFy
bmRAYXJuZGIuZGU7IHpvdV93ZWlAaHVhd2VpLmNvbTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc7IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlu
eC5jb20+OyBKaWF5aW5nIExpYW5nIDxqbGlhbmdAeGlsaW54LmNvbT47IGl3YW1hdHN1QG5pZ2F1
cmkub3JnOyBiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IFJh
amFuIFZhamEgPFJBSkFOVkB4aWxpbnguY29tPg0KQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwu
b3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZ2l0IDxnaXRAeGlsaW54LmNvbT47IFNy
aW5pdmFzIEdvdWQgPHNnb3VkQHhpbGlueC5jb20+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFBlbmd1dHJvbml4IEtl
cm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQpTdWJqZWN0OiBSZTogW1BBVENIIFYz
IDMvM10gZ3BpbzogbW9kZXBpbjogQWRkIGRyaXZlciBzdXBwb3J0IGZvciBtb2RlcGluIEdQSU8g
Y29udHJvbGxlcg0KDQpPbiAxOC4wOC4yMSAxMDoxMCwgUGl5dXNoIE1laHRhIHdyb3RlOg0KPiBU
aGlzIHBhdGNoIGFkZHMgZHJpdmVyIHN1cHBvcnQgZm9yIHRoZSB6eW5xbXAgbW9kZXBpbiBHUElP
IGNvbnRyb2xsZXIuDQo+IEdQSU8gbW9kZXBpbiBkcml2ZXIgc2V0IGFuZCBnZXQgdGhlIHZhbHVl
IGFuZCBzdGF0dXMgb2YgdGhlIFBTX01PREUgDQo+IHBpbiwgYmFzZWQgb24gZGV2aWNlLXRyZWUg
cGluIGNvbmZpZ3VyYXRpb24uIFRoZXNlIGZvdXIgbW9kZSBwaW5zIGFyZSANCj4gY29uZmlndXJh
YmxlIGFzIGlucHV0L291dHB1dC4gVGhlIG1vZGUgcGluIGhhcyBhIGNvbnRyb2wgcmVnaXN0ZXIs
IA0KPiB3aGljaCBoYXZlIGxvd2VyIGZvdXItYml0cyBbMDozXSBhcmUgY29uZmlndXJhYmxlIGFz
IGlucHV0L291dHB1dCwgDQo+IG5leHQgZm91ci1iaXRzIGNhbiBiZSB1c2VkIGZvciByZWFkaW5n
IHRoZSBkYXRhICBhcyBpbnB1dFs0OjddLCBhbmQgDQo+IG5leHQgc2V0dGluZyB0aGUgb3V0cHV0
IHBpbiBzdGF0ZSBvdXRwdXRbODoxMV0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaXl1c2ggTWVo
dGEgPHBpeXVzaC5tZWh0YUB4aWxpbnguY29tPg0KPiBBY2tlZC1ieTogTWljaGFsIFNpbWVrIDxt
aWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gLS0tDQoNCj4gKy8qKg0KPiArICogbW9kZXBpbl9n
cGlvX2Rpcl9pbiAtIFNldCB0aGUgZGlyZWN0aW9uIG9mIHRoZSBzcGVjaWZpZWQgR1BJTyBwaW4g
YXMgaW5wdXQNCj4gKyAqIEBjaGlwOglncGlvX2NoaXAgaW5zdGFuY2UgdG8gYmUgd29ya2VkIG9u
DQo+ICsgKiBAcGluOglncGlvIHBpbiBudW1iZXIgd2l0aGluIHRoZSBkZXZpY2UNCj4gKyAqDQo+
ICsgKiBSZXR1cm46IDAgYWx3YXlzDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgbW9kZXBpbl9ncGlv
X2Rpcl9pbihzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgDQo+ICtwaW4pIHsN
Cj4gKwlyZXR1cm4gMDsNCj4gK30NCg0KWW91IHNheSB0aGUgZ3BpbyBjb250cm9sbGVyIGNhbiBj
b25maWd1cmUgcGlucyBhcyBpbnB1dHMgb3Igb3V0cHV0cy4NClRoZXNlIHBpbnMgYXJlIGNvbnRy
b2xsZXIgdmlhIGZpcm13YXJlIGRyaXZlci4gV2UgYXJlIHVwZGF0aW5nIEJPT1RfUElOX0NUUkwg
CTB4RkY1RTAyNTAgcmVnaXN0ZXIuDQpbMDozXSAgPSBXaGVuIDAsIHRoZSBwaW5zIHdpbGwgYmUg
aW5wdXRzIGZyb20gdGhlIGJvYXJkIHRvIHRoZSBQUy4gV2hlbiAxLCB0aGUgUFMgd2lsbCBkcml2
ZSB0aGVzZSBwaW5zDQpbNDo3XSA9IFZhbHVlIGNhcHR1cmVkIGZyb20gdGhlIG1vZGUgcGlucw0K
Wzg6MTFdID0gVmFsdWUgZHJpdmVuIG9udG8gdGhlIG1vZGUgcGlucywgd2hlbiBjb250cm9sIHJl
Z2lzdGVyIGJpdCBzZXQgb3V0ID0gMQ0KDQpUaGUgbG93ZXIgZm91ci1iaXRzIFswOjNdIHdlIGNh
biBzZXQgZWl0aGVyIGlucHV0IGFuZCBvdXRwdXQsIGJhc2VkIG9uIGNvbmZpZ3VyYXRpb24gd2Ug
cmVhZCBwaW4gYXMgZm9yIGlucHV0IFs0OjddDQphbmQgd3JpdGUgb24gcGluIFs4OjExXS4NCkV4
YW1wbGU6DQpJZiB3ZSB3YW50IHRvIGNvbmZpZ3VyZSBwaW4gMSBhcyBvdXRwdXQsIHRoZW4gd2Ug
d2lsbCBjb25maWd1cmUgYXMgWzA6M109WzAxMDBdLCBmb3IgYWNjZXNzIHBpbiB3aWxsIHRyaWdn
ZXIgdXBwZXIgYml0IFs4OjExXT1bMDEwMF0uDQoNCkJhc2VkIG9uDQpodHRwczovL3d3dy54aWxp
bnguY29tL3N1cHBvcnQvZG9jdW1lbnRhdGlvbi91c2VyX2d1aWRlcy91ZzEwODUtenlucS11bHRy
YXNjYWxlLXRybS5wZGYNCg0KcGFnZSA0Ng0KDQpQU19NT0RFIElucHV0L091dHB1dCBEZWRpY2F0
ZWQgNC1iaXQgYm9vdCBtb2RlIHBpbnMgc2FtcGxlZCBvbiBQT1IgZGVhc3NlcnRpb24NCg0KWGls
aW54IGlzIHVzaW5nIHRoaXMgcGluIGZvciB1c2IgcGh5IHJlc2V0cy4NCg0KWWV0LCAuZGlyZWN0
aW9uX2lucHV0IGlzIGRvaW5nIG5vdGhpbmcuIFNvLCBpdCdzIG5vdCBjbGVhciB0byBtZSwgaG93
IHRoaXMgc2VxdWVuY2UgY291bGQgd29yazoNCg0KIC0gc2V0IGdwaW8gb3V0cHV0IGhpZ2ggKHdy
aXRlcyBib290bW9kZSkNCiAtIHNldCBncGlvIHRvIGlucHV0IChuby1vcCwgcGluIHdpbGwgcmVt
YWluIGhpZ2gsIG5vdCBoaWdoIGltcGVkYW5jZSkNCg0KDQoNCg0KDQoNCkkgZGlkbid0IGNoZWNr
IHRoZSBwcmV2aW91cyBkaXNjdXNzaW9ucywgYnV0IGlmIHRoaXMgaW5kZWVkIHdvcmtzIGFzIGlu
dGVuZGVkLCB0aGUgaG93IHNob3VsZCBiZSB3cml0dGVuIGhlcmUgaW50byB0aGUgZHJpdmVyLiBU
aGF0IGlzIGEgbW9yZSB1c2VmdWwgY29tbWVudCB0aGFuIGtlcm5lbCBkb2MgZm9yIGEgc3R1YiBm
dW5jdGlvbi4NCg0KLS0gDQpQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KU3RldWVyd2FsZGVyIFN0ci4gMjEg
ICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwNCjMx
MTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEy
MS0yMDY5MTctMCAgICB8DQpBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAg
ICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfA0KDQpSZWdhcmRzLA0KUGl5dXNoIE1l
aHRhDQo=
