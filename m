Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A492327EE2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 14:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbhCANER (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 08:04:17 -0500
Received: from mail-eopbgr700063.outbound.protection.outlook.com ([40.107.70.63]:60640
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235303AbhCANEN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 08:04:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvC+IiP9ECn7Vbbo+AsRUcjzyX+ZNBrdoCwKsDzEnwspacRXw9SuPF1AzVRSUX+IufiushjlzoGmkGGMLx4hw6SDOeXGoaEWWDsbxKMml1UEBe0EznYl0Ft6vVaoaXA09hUAyoH1L9rNBS9Jr23c1/HfOghpNbkeWYfWpvV3H1cS+lIfnpmE26wq7rHRw0itN5108yDXK7jPu9T9qpjbx3yLJk+/5C4Yq5whxbXgiD8756nj4wsq/iGjNucKnLH4vWzXxB/rSgysLQWaIHxEvPuSuVZphxM3avR0Td+KNNAPZogGAu4fbCBfMbCFRK9w+RA5dmQjc5C6QeWK6C8j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQrf8x0fMh7qgUaNjRTFd7yJ7sc3JGen8GwF/ytvQvY=;
 b=ad2EjJZmP0kif9ygwYY+Yy2loKbCaIK8F0j9KY2xZ3tJr6UCpRsR87ddflnpmbHhxKAJpIyRwwxZ6iwynWF7wMPR9yBWGPC2LpiQzCiQNVyPHHgwTURvh4IqeMicm+pY9/RhOryF5JxzUZjwS452EzJdoWJhi7NcTq3jWrWtEhB4VgtUtlvQNFooMkYOICpa6SK5dj9BYR508SuNm8LZ1QRk0YGOyvkF+H7bfSkyw+xM0FsGEZW1l/503jbMaEYPrK4UcmMw+sbjl39pg9PhFjO2LneUmqvHA9HYzYd614io22mbax8cQwxdYhYVdaOZkU7hM1pHRg9YFb+U3ePL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQrf8x0fMh7qgUaNjRTFd7yJ7sc3JGen8GwF/ytvQvY=;
 b=iknRC5d/IRegVD6Zwc90jqJMa7COElDo5SDVuHZbixKwcUMv03ZKh0JQzrS2mZhyinf2dIu/Gg2BBEQq/3r1BScOb1wWf1zOpTN6UI5shwb0BBSqzAy2I9FdWfgrkdXjZps0n24TAbR2oQQaEju96SL3xzfYXOE92zuD7ZjGmQM=
Received: from DM5PR02MB2874.namprd02.prod.outlook.com (2603:10b6:3:108::8) by
 DM6PR02MB6844.namprd02.prod.outlook.com (2603:10b6:5:21a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Mon, 1 Mar 2021 13:03:25 +0000
Received: from DM5PR02MB2874.namprd02.prod.outlook.com
 ([fe80::b8f7:1a45:afd4:8006]) by DM5PR02MB2874.namprd02.prod.outlook.com
 ([fe80::b8f7:1a45:afd4:8006%5]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 13:03:25 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v3 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v3 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXATfWh0U1hnkZrECYKWdk3dBSx6ps1IoAgAJelnA=
Date:   Mon, 1 Mar 2021 13:03:25 +0000
Message-ID: <DM5PR02MB28743FF276B65A3186EA1C87BD9A9@DM5PR02MB2874.namprd02.prod.outlook.com>
References: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1613131643-60062-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CABMQnVKXDj-e2+YkBsGUdj58nAK2edFXDyaXmT94SJya4W80ww@mail.gmail.com>
In-Reply-To: <CABMQnVKXDj-e2+YkBsGUdj58nAK2edFXDyaXmT94SJya4W80ww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: nigauri.org; dkim=none (message not signed)
 header.d=none;nigauri.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [2406:b400:d1:88ed:f016:bf0e:6d45:f655]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 942c7d63-8fff-4e49-640b-08d8dcb2666d
x-ms-traffictypediagnostic: DM6PR02MB6844:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB684469D23655880471B50D12BD9A9@DM6PR02MB6844.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QyAiZMMlijvFAzYDRzMFmCcKquo8wR/jW2aMiOGkl+9/1ttZS/fS6BxWd/6uODsyp8FPdmuOeFx9hiNc+R5rNJE71wmC7VMqoMV5t6Q2k/38BZnS3h++/RpAXbe/3r/oP8J6Zy+1+ZugnGCyXv9e+Ti02zAT+t3Jz5hSB8KK2PBjql39h3CJuAJIJyeaJRRELdbgCJcpXCss8Jb4n2wvB90hJkh/QcIm7CxhwlrEAscAs9QBCYZeOCqgoUktpb1YFwj2QpQQRADaLYCt4Q+6V7GvY+sq7hEXs8sP8/ittjSRUToam6m4I8nMVaCbck9XLmkauqmuaLQ54xgtTz03TTGbybU5Xr/HEmThUDACzMFcGlVRoxfn0BtUYiHfqX3qHqPu8FSR5/0RbaCMaAjmeex+uUeCC7cOb0XbH4I57oy+Kl/NEJKOewv+pkeagHTr24FF/SiWsa78iWIkWNVJTGaLdsT+aObJR8XUEXzpeSHAqLasZRH9TGjnIW4AKfdhB47KnX0oyWKOYAC7IRk7wg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB2874.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(71200400001)(4326008)(8676002)(83380400001)(186003)(8936002)(6916009)(54906003)(86362001)(2906002)(76116006)(33656002)(55016002)(7696005)(66946007)(66556008)(52536014)(7416002)(478600001)(66446008)(53546011)(66476007)(316002)(9686003)(6506007)(64756008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z3ltVTduZVQxb0krVkNsbUlDYU5GaUsrNGhCdUhwVi9yci9nVm5valhCZUZo?=
 =?utf-8?B?MkIzZ25WTkdMN1hDQTFLaWh3TGJVRHhRZW9TYUxQWWpSYnJpWUZYU1M0OGs5?=
 =?utf-8?B?Y0ZNdHZiLzJaQm4wV0xmZCttZG96MFVoMklQc25IbWtPVzFnWko5L3NQbGVx?=
 =?utf-8?B?azVZcDlmZCtFRWpTWisxTmsyZFZtK0p0SjJITU80eW1jbjBTNW51YUpDSlFN?=
 =?utf-8?B?VGIrRllIeTBZQThocFJ1aVR5UHdVdUVOdmdJcWhIT1dUWVRoU3dSU3NUUmtw?=
 =?utf-8?B?T0xBZU9TbTJvaG85NTFnbXFmMldMY2hBcTJEYnppbmU4RU5qNWNaRUtBM2t2?=
 =?utf-8?B?Zlh5bW5rOUx0MU5URDVNWnN4Tmg2d2RMSGJRbnpHSmlMLzBtUXhzZGh3Z2Nv?=
 =?utf-8?B?a3M5eFpMY0hrUit5dUVMRGVuZmdwQkgvMWRFRERmQ1RhbVc5WVJBWkVxdFJI?=
 =?utf-8?B?VmZWNE1FQTdIbUhQOVZaczd4RklPb2lLcHI0ZzBSYlFlc2JlS0hjUWNCRW1S?=
 =?utf-8?B?MVV1bWVhS1Fvd3U4R2tKMEdyU09ydzdKNSs4WFYxeEVndi8wU1dhOFpxMTZS?=
 =?utf-8?B?bXllaHV2M2lUVndUQmYrb0VkUkdKcjMyUnJlYjBkYjdMM1ZGTlNrOU50ZEh2?=
 =?utf-8?B?UDNlQ3hYRUM3T2JLdVZ2bjAvZERtKzFlU05TckdaSlc5TFpMcUxVTUNuaHE0?=
 =?utf-8?B?Wmt2R2VzYVNpSUdwZHQyc29kb3ozTWxxaUNpWmZuQTQvOUtMd0swVVFiYjN3?=
 =?utf-8?B?RFkwNFo0WTJxc3Vab0preTUrTTdqMUR2OXIzS0hzTG5vVGRHQU1pSEwrUEtE?=
 =?utf-8?B?a0RUU0tyc2pBS2xJbVdIN0szUFcxNEN0eUJ1REpHejZsN2VKdlZEbHZXdVU3?=
 =?utf-8?B?MUJxdGNpcFhiMWZ4T2tBS0JBRFdBdFNhazhHaWVXV3F4UE91MWxVZzd6L1lp?=
 =?utf-8?B?YWhwZWZyNEM0Y0pHS3ZlallnTUxHMURTOGI3cEhlSG9LQThuSzFwS0ZxUTl0?=
 =?utf-8?B?cTBCSVkvS0xQOXlkQWE5eWxQSzEvSHYzcThHQ21hUWFlYzh6dENIN0xtZklx?=
 =?utf-8?B?OEVlNWJrckt3M1I1ZnlxNEthRVVublk5aG1iblZOejNLOUFoRVQ2UEFINGM4?=
 =?utf-8?B?R3VrVHpBYlczaVhHSnNraW1Qd043ZUVRUWI5bW94azc0S29yZGRXcHM5YTRZ?=
 =?utf-8?B?c2E4SGJuNExnbFBpV2dXMit6eXZsaHlNRCsxUHU0eWMyOEVSZXlZMHhYVHNy?=
 =?utf-8?B?d09IeW1EYy9YTGw4WDdjUzVTK2J6bHVWWDhkWmJsc2ZVZVExbW9VWUpNMWVL?=
 =?utf-8?B?QXI1L0lkSkNUemhiWStwV1ROMFdlcEtvb0JvbjFvSm9NaGVpRlZQY3dLUVh5?=
 =?utf-8?B?TnhFSjdyVXJhV2plRGMyeVZRdW1XWElFellkUHhER1RGVUthNnlXbTRpTDhC?=
 =?utf-8?B?WDRMRWRzUEpOYjI0QnF3TVVJMVlPcUxOWkFwL1gyTFdEVlc5S0JnditHc2dk?=
 =?utf-8?B?cWF5Z1N1cVRSZnp1a3dSdy9ZWDd0Vmo0dGVVck5IYVRHQTdYNWNLWThZSnBO?=
 =?utf-8?B?bDhpWDdtNTFoZnJZcnpYODNQNjBpWHZLUG9HaTFIVlBwWHJvQ284S2lDOGdu?=
 =?utf-8?B?ZGZRcHpRTzZZUGdEMkpkcXh5TmhTaVFkeFpvcXJNZkdIQWhTaWJKN2FDaGZt?=
 =?utf-8?B?Tk45cHRYbE83V2k2V1VXMXJZUm5QeDBWYnVSSTBJWlBnS2dsRzNPTVNwWGs5?=
 =?utf-8?B?ZE9qRndhK0VwZERwZTdEeStGQ1dtTW4wUVc3NUVJYWFuMi85bHBwMUJ4VytL?=
 =?utf-8?B?WmlHY1FjWVg1VmthY1QvK05FVUkzRGUvd0ZKcGliZmJ2S1Fkdjd4UXVScko1?=
 =?utf-8?Q?D6fclsLhdBqBr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB2874.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942c7d63-8fff-4e49-640b-08d8dcb2666d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 13:03:25.3099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SF6PSbxu1znB0CPwCpo4H7pkddKeekeuUPPmfZUDLxa1fia6LjCWrUOAFnE1HfwhsHyzslsvmflHH0gs2+N/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6844
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTm9idWhpcm8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTm9i
dWhpcm8gSXdhbWF0c3UgPGl3YW1hdHN1QG5pZ2F1cmkub3JnPg0KPiBTZW50OiBTdW5kYXksIEZl
YnJ1YXJ5IDI4LCAyMDIxIDY6MTkgQU0NCj4gVG86IFNhaSBLcmlzaG5hIFBvdHRodXJpIDxsYWtz
aG1pc0B4aWxpbnguY29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IE1pY2hhbCBTaW1l
ayA8bWljaGFsc0B4aWxpbnguY29tPjsgR3JlZyBLcm9haC0NCj4gSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51eCBBUk0gPGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC0NCj4ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGdpdCA8Z2l0QHhpbGlueC5jb20+OyBzYWlrcmlzaG5h
MTI0NjhAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSBwaW5jdHJsOiBB
ZGQgWGlsaW54IFp5bnFNUCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0DQo+IA0KPiBIaSwNCj4gDQo+
IDIwMjHlubQy5pyIMTLml6Uo6YeRKSAyMToxMCBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA8bGFr
c2htaS5zYWkua3Jpc2huYS5wb3R0aHVyaUB4aWxpbnguY29tPjoNCj4gPg0KPiA+IEFkZGluZyBw
aW5jdHJsIGRyaXZlciBmb3IgWGlsaW54IFp5bnFNUCBwbGF0Zm9ybS4NCj4gPiBUaGlzIGRyaXZl
ciBxdWVyaWVzIHBpbiBpbmZvcm1hdGlvbiBmcm9tIGZpcm13YXJlIGFuZCByZWdpc3RlcnMgcGlu
DQo+ID4gY29udHJvbCBhY2NvcmRpbmdseS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBL
cmlzaG5hIFBvdHRodXJpDQo+ID4gPGxha3NobWkuc2FpLmtyaXNobmEucG90dGh1cmlAeGlsaW54
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL0tjb25maWcgICAgICAgICAgfCAg
IDEzICsNCj4gPiAgZHJpdmVycy9waW5jdHJsL01ha2VmaWxlICAgICAgICAgfCAgICAxICsNCj4g
PiAgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtenlucW1wLmMgfCAxMDMxDQo+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTA0NSBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC16
eW5xbXAuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9LY29uZmlnIGIv
ZHJpdmVycy9waW5jdHJsL0tjb25maWcgaW5kZXgNCj4gPiA4MTUwOTUzMjZlMmQuLjI1ZDNjNzIw
ODk3NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvS2NvbmZpZw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9LY29uZmlnDQo+ID4gQEAgLTM0MSw2ICszNDEsMTkgQEAgY29uZmln
IFBJTkNUUkxfWllOUQ0KPiA+ICAgICAgICAgaGVscA0KPiA+ICAgICAgICAgICBUaGlzIHNlbGVj
dHMgdGhlIHBpbmN0cmwgZHJpdmVyIGZvciBYaWxpbnggWnlucS4NCj4gPg0KPiA+ICtjb25maWcg
UElOQ1RSTF9aWU5RTVANCj4gPiArICAgICAgIGJvb2wgIlBpbmN0cmwgZHJpdmVyIGZvciBYaWxp
bnggWnlucU1QIg0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX1pZTlFNUA0KPiA+ICsgICAg
ICAgc2VsZWN0IFBJTk1VWA0KPiA+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORg0KPiA+
ICsgICAgICAgaGVscA0KPiA+ICsgICAgICAgICBUaGlzIHNlbGVjdHMgdGhlIHBpbmN0cmwgZHJp
dmVyIGZvciBYaWxpbnggWnlucU1QIHBsYXRmb3JtLg0KPiA+ICsgICAgICAgICBUaGlzIGRyaXZl
ciB3aWxsIHF1ZXJ5IHRoZSBwaW4gaW5mb3JtYXRpb24gZnJvbSB0aGUgZmlybXdhcmUNCj4gPiAr
ICAgICAgICAgYW5kIGFsbG93IGNvbmZpZ3VyaW5nIHRoZSBwaW5zLg0KPiA+ICsgICAgICAgICBD
b25maWd1cmF0aW9uIGNhbiBpbmNsdWRlIHRoZSBtdXggZnVuY3Rpb24gdG8gc2VsZWN0IG9uIHRo
b3NlDQo+ID4gKyAgICAgICAgIHBpbihzKS9ncm91cChzKSwgYW5kIHZhcmlvdXMgcGluIGNvbmZp
Z3VyYXRpb24gcGFyYW1ldGVycw0KPiA+ICsgICAgICAgICBzdWNoIGFzIHB1bGwtdXAsIHNsZXcg
cmF0ZSwgZXRjLg0KPiA+ICsNCj4gPiAgY29uZmlnIFBJTkNUUkxfSU5HRU5JQw0KPiA+ICAgICAg
ICAgYm9vbCAiUGluY3RybCBkcml2ZXIgZm9yIHRoZSBJbmdlbmljIEpaNDd4eCBTb0NzIg0KPiA+
ICAgICAgICAgZGVmYXVsdCBNQUNIX0lOR0VOSUMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aW5jdHJsL01ha2VmaWxlIGIvZHJpdmVycy9waW5jdHJsL01ha2VmaWxlIGluZGV4DQo+ID4gZjUz
OTMzYjJmZjAyLi43ZTA1ODczOWYwZDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJs
L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL01ha2VmaWxlDQo+ID4gQEAgLTQz
LDYgKzQzLDcgQEAgb2JqLSQoQ09ORklHX1BJTkNUUkxfVEIxMFgpICAgKz0gcGluY3RybC10YjEw
eC5vDQo+ID4gIG9iai0kKENPTkZJR19QSU5DVFJMX1NUKSAgICAgICArPSBwaW5jdHJsLXN0Lm8N
Cj4gPiAgb2JqLSQoQ09ORklHX1BJTkNUUkxfU1RNRlgpICAgICs9IHBpbmN0cmwtc3RtZngubw0K
PiA+ICBvYmotJChDT05GSUdfUElOQ1RSTF9aWU5RKSAgICAgKz0gcGluY3RybC16eW5xLm8NCj4g
PiArb2JqLSQoQ09ORklHX1BJTkNUUkxfWllOUU1QKSAgICArPSBwaW5jdHJsLXp5bnFtcC5vDQo+
ID4gIG9iai0kKENPTkZJR19QSU5DVFJMX0lOR0VOSUMpICArPSBwaW5jdHJsLWluZ2VuaWMubw0K
PiA+ICBvYmotJChDT05GSUdfUElOQ1RSTF9SSzgwNSkgICAgKz0gcGluY3RybC1yazgwNS5vDQo+
ID4gIG9iai0kKENPTkZJR19QSU5DVFJMX09DRUxPVCkgICArPSBwaW5jdHJsLW9jZWxvdC5vDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXp5bnFtcC5jDQo+ID4gYi9k
cml2ZXJzL3BpbmN0cmwvcGluY3RybC16eW5xbXAuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lYzBhNWQwZTIyZDUNCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtenlucW1wLmMNCj4gPiBAQCAtMCww
ICsxLDEwMzEgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
PiArLyoNCj4gPiArICogWnlucU1QIHBpbiBjb250cm9sbGVyDQo+ID4gKyAqDQo+ID4gKyAqICBD
b3B5cmlnaHQgKEMpIDIwMjAgWGlsaW54LCBJbmMuDQo+ID4gKyAqDQo+ID4gKyAqICBTYWkgS3Jp
c2huYSBQb3R0aHVyaSA8bGFrc2htaS5zYWkua3Jpc2huYS5wb3R0aHVyaUB4aWxpbnguY29tPg0K
PiA+ICsgKiAgUmFqYW4gVmFqYSA8cmFqYW52QHhpbGlueC5jb20+DQo+ID4gKyAqLw0KPiANCj4g
PHNuaXA+DQo+IA0KPiA+ICsvKioNCj4gPiArICogenlucW1wX3BpbmN0cmxfZ2V0X2Z1bmN0aW9u
X25hbWUoKSAtIGdldCBmdW5jdGlvbiBuYW1lDQo+ID4gKyAqIEBmaWQ6ICAgICAgIEZ1bmN0aW9u
IElELg0KPiA+ICsgKiBAbmFtZTogICAgICBGdW5jdGlvbiBuYW1lDQo+ID4gKyAqDQo+ID4gKyAq
IENhbGwgZmlybXdhcmUgQVBJIHRvIGdldCBuYW1lIG9mIGdpdmVuIGZ1bmN0aW9uLg0KPiA+ICsg
Kg0KPiA+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBlbHNlIGVycm9yIGNvZGUuDQo+ID4gKyAq
Lw0KPiA+ICtzdGF0aWMgaW50IHp5bnFtcF9waW5jdHJsX2dldF9mdW5jdGlvbl9uYW1lKHUzMiBm
aWQsIGNoYXIgKm5hbWUpIHsNCj4gPiArICAgICAgIHN0cnVjdCB6eW5xbXBfcG1fcXVlcnlfZGF0
YSBxZGF0YSA9IHswfTsNCj4gPiArICAgICAgIHUzMiByZXRfcGF5bG9hZFtQQVlMT0FEX0FSR19D
TlRdOw0KPiA+ICsNCj4gPiArICAgICAgIHFkYXRhLnFpZCA9IFBNX1FJRF9QSU5DVFJMX0dFVF9G
VU5DVElPTl9OQU1FOw0KPiA+ICsgICAgICAgcWRhdGEuYXJnMSA9IGZpZDsNCj4gPiArDQo+ID4g
KyAgICAgICB6eW5xbXBfcG1fcXVlcnlfZGF0YShxZGF0YSwgcmV0X3BheWxvYWQpOw0KPiANCj4g
UGxlYXNlIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgaGVyZSBhcyB3ZWxsIGFzIG90aGVyIGZ1bmN0
aW9ucy4NCj4gDQo+IEkga25vdyB0aGF0IHdoZW4gd2UgdXNlZCB6eW5xbXBfcG1fcXVlcnlfZGF0
YSB3aXRoDQo+IFBNX1FJRF9QSU5DVFJMX0dFVF9GVU5DVElPTl9OQU1FLCBpdCByZXR1cm5zIC0y
MiBlcnJvciBjb2RlLg0KPiBIb3cgYWJvdXQgYWRkaW5nIHByb2Nlc3Npbmcgd2l0aCB6eW5xbXBf
cG1fcXVlcnlfZGF0YSBsaWtlDQo+IFBNX1FJRF9DTE9DS19HRVRfTkFNRSBvciB3cml0aW5nIGEg
Y29tbWVudCBoZXJlPw0KSSB3aWxsIGFkZCBjb21tZW50IGZvciB0aGlzIGtpbmQgb2YgaW50ZW50
aW9uYWwgY2FzZXMuDQoNClJlZ2FyZHMNClNhaSBLcmlzaG5hIA0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiAgIE5vYnVoaXJvDQo+IA0KPiAtLQ0KPiBOb2J1aGlybyBJd2FtYXRzdQ0KPiAgICBpd2Ft
YXRzdSBhdCB7bmlnYXVyaS5vcmcgLyBkZWJpYW4ub3JnfQ0KPiAgICBHUEcgSUQ6IDQwQUQxRkE2
DQo=
