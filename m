Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89633345945
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 09:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhCWIIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 04:08:18 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:5493
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229494AbhCWIIE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 04:08:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQFkbfNgi8eRnPNNAHn6edwPFGyBSK/+URA5a8TvsLHRHHBLXgv5pvcmoNwyQ/MofacQChZEei+PIZ3o9ZzRhje6Lfj5Ou7RzNgT0/O85JIY/HIKErFb0k3sk7XBn9TEZ56DjrQIwqfd+k/iHGXFHBNMmCZCUe1x3Lfro2oyN2iCVvJ9jAxqJAbRLB7sf03xn60Vhigr9TdEdk1H+mzWdokP+S2zxWzBQUQxb0eqNj6KXKdRPkHcgF5COgzAjf+TxZ5Yh6Vua3kwB9LpGRgDG3tlNCKN295QqKVClDidxmovJTNAifWDAxy4+2OuzukVV8fU/4RbhcBJoD3oMI7EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp420zV6IVNgryveUjQqbKDskXKAsVBww21Pd5FNeyQ=;
 b=BB1/CEc4NElRtCJfXuRGLurU0bmVbN6KrK6Jk+JIoYva1KssLqakM2e+zDTquR/cHDgIjA8Wy30UmTuEh6VacPsuXnn9kbfYzL3/QfceIkHX+6pI3EoX77cekQYa2NK+hroVlC5mEEuHCrZysVPA0TEKnZNXgAo/ERmJ2Z6JF0VKCuAQaOn3Waxtyd0RN4lKbUG3yRxSLyjatlpDlVRbJHelBMNfFDiQaPh3hl2wrGLrlxs4otW4qUUq2IGTJM8+eiwO68X/FR4vbMlOXiWL/3O2cTKMXBz8wyKhE4pmxGSK87qPsT8D5deIryYAJkTfu50RbCSrBnNQwEnFFP0Hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp420zV6IVNgryveUjQqbKDskXKAsVBww21Pd5FNeyQ=;
 b=ZCmbgrwHL6iijzdcFe8Q9WO/HQIGW2tCbexhQ4r75HRwyxbiTeQDUNuaJHCQdxuM5Krj/3qlf0mJvWoY0J6Rf4VsXlRdoKWBNCpvIo7a/XxPlZ1H/QtuCyVBi4Intx8+B8R/FnN4s8rafILMTcHttBrCt5IZ/uwujCDO4VbeWYM=
Received: from SN6PR02MB3917.namprd02.prod.outlook.com (2603:10b6:805:2e::26)
 by SN1PR02MB3839.namprd02.prod.outlook.com (2603:10b6:802:31::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 08:08:00 +0000
Received: from SN6PR02MB3917.namprd02.prod.outlook.com
 ([fe80::68cc:492b:dd78:daba]) by SN6PR02MB3917.namprd02.prod.outlook.com
 ([fe80::68cc:492b:dd78:daba%4]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 08:08:00 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXGwdloppct9WdF06D8lw8GDUKq6qII6IAgAEUy/CAAeU9gIAE1ayQgABU24CAAMTl4A==
Date:   Tue, 23 Mar 2021 08:08:00 +0000
Message-ID: <SN6PR02MB391785963644FD54FD37B8D9BD649@SN6PR02MB3917.namprd02.prod.outlook.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VehkqzDPQp87JL=hnCi_b4y0d3htpxRKBJ2q73AAAbBXA@mail.gmail.com>
 <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CAHp75VcbxvVsQRP_0J0mXb5vPhBor7=cq-4nqMNb-+D_+O1cdA@mail.gmail.com>
 <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CAHp75VeQyk6E4DJY0ArYX=Too-nkZ12oA2YcVZ0gw0zz5chNAQ@mail.gmail.com>
In-Reply-To: <CAHp75VeQyk6E4DJY0ArYX=Too-nkZ12oA2YcVZ0gw0zz5chNAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fcaa513f-1726-4839-df09-08d8edd2c6a4
x-ms-traffictypediagnostic: SN1PR02MB3839:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3839C2B6F69EDE292460F0D1BD649@SN1PR02MB3839.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wHJtiKzm0wrF7dK1bVz/8NPmlH3HpZiMbmiI3aIYuaZqTP4KlIIzrr4W9GGHS9K4lwUm7IXZaMT3tZy/J8dY62hWvvubGewfCfmLcQ9NURUR8FIske5ch5r0pUDKEQTJoKna46VFYXlBlEytFG1NQRvW/yH5Z5kHIlmiLn/9mOXjKun2Rlxu1kY6EcSYeOfelN4P3OopvCDWXXpObO1wScuTbIAQmPtgjaR/9v4knNLGco5dTuoh90pgbczlsk7F+sbaTzAxCauQsV6eNfiFJWoHLDXgytqw8elZXviHZgv+qpda/RpkbQj/Sek5w0Sbbxw5BCr60gF0wK5rLMwGRz+fRZvrIPR/wuoRpr157NEukfoTnfgwNMwl4SpUeqrf8Afz/sR91NVmJa4gNbk/Pi6fNDY/KUP2xHWsnwdZRtGd1Rw2oywR7C4Bs+BWzRQWXGwaylYxgCgt5I2jiZWv+Au265SRDOISbSR/tC6fePjmvyY00rEL3xTas2nXCDyQTZRsyxI0+hCi31vkUH8J8UNERJX0nWDcDpx27ivNkVc1YW4AiN3RHbm8TLhBiKp8Ulk23CAEu6AULb/ihKTYPR9/sjOdx/uCdeHXacxktcOFJk8PEVp5aeExOkkwaiqiGIFJS2i14Onyrip4sKselSkViW7k2ZXFOFHzqwkX0oM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB3917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(8936002)(7416002)(4326008)(8676002)(6916009)(33656002)(54906003)(26005)(186003)(71200400001)(83380400001)(53546011)(64756008)(316002)(2906002)(9686003)(66446008)(66476007)(5660300002)(52536014)(66556008)(66946007)(38100700001)(76116006)(86362001)(6506007)(7696005)(478600001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SzNDR1Izb0xoQTZnR0ZBQzlaQ0FZTkFnVHZsMlhVamJGWUpwSkJMYStWeEIz?=
 =?utf-8?B?Y2VpRFZFdm0vcFlEWEpqTlVuNVlMNTQ3Um85d28xSldGQXN3RUMrdlFzb2R1?=
 =?utf-8?B?c1Z1RHpCaTJEVlZqWm1qT0VaTExjWEJYVS9ONDNrQjJuUno3MXpJYjFRbGxn?=
 =?utf-8?B?c01pUjlkb1lnUGozSjdQWWs3NFlKZ28yWWpJNXFESW1Uc243N1NOcko3YmFy?=
 =?utf-8?B?SjFMcmxqcGs0ZTJyN1NFZUVtR2VxcEpsVXFXR05GUmFVMWducHlrd2d4RXlP?=
 =?utf-8?B?b3JNZVF5RGdiYmNQMWZZSmVtcjBwVkdaLzVOUkVQbDZzbEdqeHVaUzFuNzBi?=
 =?utf-8?B?U0dRdk10UHBuZTRkMk5pbXRydDJRZ0p6aUJmZ0txQWo0aFJoeDFYU05FMXNB?=
 =?utf-8?B?akdmQTV6MnhLcDBYcUZ2STJpdmZ4RWdjYjQ3eGtUTTlGK2RsVFNVdE4yMS9t?=
 =?utf-8?B?TGtoSHZjMnFBd05jcEFXVXJXTllwZktTdkZBTFdhNjFadmxFajBDYVlUd0gv?=
 =?utf-8?B?V3pLNURjb1ovUkFnNEhSZEFoZHM3SkRzNkIzYUw1VnF6TUVqM2h3ZThndzdD?=
 =?utf-8?B?c0FFanNwa0xmbmw5MUdxTWo2bzZSZjNqOXY0SUN0bkpZVjdHRzhHcjh2RmpP?=
 =?utf-8?B?UklCMHZDZG9zTUpkRjJsOXNXUjVaaERHa3FGUVpDWHRTQTk1UUFSOHFHaG02?=
 =?utf-8?B?b01WNnlTVlpRRjlMZHhDby9LekN0blV4c256NVJ5U3l0bVRwMkNHelN6OTlC?=
 =?utf-8?B?dmI3bm1pZVlBK1N4ditqWHZXWjlzY0J4TlRPYjgxbHdnK0I1djM1OWJqUWRI?=
 =?utf-8?B?anNVcWZ2MmNwUlJxazB6cTNENFhsV3EySHBtRk83d1Zoa1JkVzFKNjBGR2ta?=
 =?utf-8?B?VmNEUDRDQjQrTEpNVkUrVkJJVlNqYW9FTkFRZzRGRkZmK2VwWHR0eE9tWUk3?=
 =?utf-8?B?N1hBRC93ZEhzTUc3S1BCdGhTOVFOL21zUWpLQVlOc0NpNHdoOFpDc1RzZ3I1?=
 =?utf-8?B?SHRGRXVFUWVmK1ZEcmdJRUFOdEhsNFh6Nm41Z05YUGhZMWY3V1dkdGRHRm4v?=
 =?utf-8?B?REVZZFVjQ2k0bDZnWkg4Wk5BeXdaenJGS0RPTmhrVlNKQWV5Z3lXcnpaTHdS?=
 =?utf-8?B?cjFQb0ljeWhJcVZMN3V2ZWxHNjFxaFJMME0vVzFtTVNMQ2RDRU1HenVOVzdE?=
 =?utf-8?B?ZVh1YUdmU1NaSFJyQ1hvUHpWdnAxR3BScUxoVUJscjRPcjdxak5Fb2RvUjhz?=
 =?utf-8?B?cThBWHd1cjl3Q2lQcW1MZFh2aGlveVNQZmRPSVRpK3BWUkx5NlJPaDcxVmhP?=
 =?utf-8?B?ZElIS0EyNjZsM294MXhWMUhWWEtvOVpydnRKMWQxYVYxd3Via2x2c3JSK0FU?=
 =?utf-8?B?ekUzSWsvV0l2ejZNZnVQZ1NBUDE2YnF5cjhuUDN3eml4dC9BNWM4QndlcE04?=
 =?utf-8?B?ZGpqbUdRa1ZRWjdqWmtDT0xlQXdaa2xyUk5xbGM2WkkwbWkrVFlEd1lJUGVn?=
 =?utf-8?B?ZnV1YlhsUnZCWDdBRll5cmNjcGM5TFUzUTh5T0lzdyt2cno1OXVQUFBpWVlo?=
 =?utf-8?B?RUdWTmt6eXVmOWJETEsySEVta2ZFcWtDbUd2OXFXVk1RaXNvVlhkSmtJNThR?=
 =?utf-8?B?Zm55RE5mUDNKbHludnpSdEs1SzR1WWlXRGZ5V3I5TTNzV1U4eE9PdWRid0Zy?=
 =?utf-8?B?KzY3MnVLcWdLRmxHdk1GTTVtWngzc0I5UDFTTDFiVExwRGFZMjdoWFd2YXh6?=
 =?utf-8?Q?Q0RGuyC+5Xtpsvv7DOu45WDWrwfkuxB8cJUNmV7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB3917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaa513f-1726-4839-df09-08d8edd2c6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 08:08:00.3134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhVaaEzjkPOucSut61F4VY4EhcLzItdBUOfvGDv5jWDfboSIZBKYD4kynHKh0nWm+OT1hUnwYljSUgOIJCRzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3839
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSBTaGV2Y2hlbmtvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gU2VudDog
TW9uZGF5LCBNYXJjaCAyMiwgMjAyMSAxMDo0NyBQTQ0KPiBUbzogU2FpIEtyaXNobmEgUG90dGh1
cmkgPGxha3NobWlzQHhpbGlueC5jb20+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWlj
aGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+OyBHcmVnIEtyb2FoLQ0KPiBIYXJ0bWFuIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LWFybSBNYWlsaW5nIExpc3QgPGxpbnV4
LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGlu
ZyBMaXN0IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IGRldmljZXRyZWUgPGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgb3Blbg0KPiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxs
aW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47IGdpdCA8Z2l0QHhpbGlueC5jb20+Ow0KPiBzYWlr
cmlzaG5hMTI0NjhAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy8zXSBwaW5j
dHJsOiBBZGQgWGlsaW54IFp5bnFNUCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0DQo+IA0KPiBPbiBN
b24sIE1hciAyMiwgMjAyMSBhdCA1OjI1IFBNIFNhaSBLcmlzaG5hIFBvdHRodXJpDQo+IDxsYWtz
aG1pc0B4aWxpbnguY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5k
eS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTksIDIw
MjEgMzo1MyBQTSBPbiBUaHUsIE1hciAxOCwgMjAyMSBhdCA0OjQyIFBNDQo+ID4gPiBTYWkgS3Jp
c2huYSBQb3R0aHVyaSA8bGFrc2htaXNAeGlsaW54LmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4g
PiA+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4g
PiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE3LCAyMDIxIDY6MjYgUE0gT24gV2VkLCBN
YXIgMTcsIDIwMjEgYXQNCj4gPiA+ID4gPiAxMDoyNyBBTSBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0K
PiA+ID4gPiA+IDxsYWtzaG1pLnNhaS5rcmlzaG5hLnBvdHRodXJpQHhpbGlueC5jb20+IHdyb3Rl
Og0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9w
aW5jdHJsLXp5bnFtcC5oPg0KPiA+ID4NCj4gPiA+IExvb2tpbmcgaW50byBvdGhlciBkcml2ZXJz
IHdpdGggc2ltaWxhciBpbmNsdWRlcywgc2hvdWxkbid0IGl0IGdvDQo+ID4gPiBmaXJzdCBpbiB0
aGUgZmlsZSBiZWZvcmUgYW55IG90aGVyIGxpbnV4LyogYXNtLyogZXRjPw0KPiA+IEkgc2VlIHNv
bWUgZHJpdmVycyBhcmUgaW5jbHVkaW5nIHRoaXMgaGVhZGVyIGJlZm9yZSBsaW51eC8qIGFuZCBz
b21lDQo+ID4gYXJlIHVzaW5nIGFmdGVyIGxpbnV4LyouDQo+IA0KPiBUaGUgcnVsZSBvZiB0aHVt
YiBpcyB0aGF0OiBtb3JlIGdlbmVyaWMgaGVhZGVycyBhcmUgZ29pbmcgZmlyc3QuDQo+IA0KPiBJ
IGNvbnNpZGVyIGR0Lyogb25lcyBhcmUgbW9yZSBnZW5lcmljIHRoYW4gbGludXgvKiBvbmVzIGJl
Y2F1c2UgdGhleSBhcmUNCj4gY292ZXJpbmcgbW9yZSB0aGFuIGp1c3QgdGhlIExpbnV4IGtlcm5l
bC4NCk9rLCBJIHdpbGwgcmVvcmRlciBhY2NvcmRpbmdseS4NCj4gDQo+IC4uLg0KPiANCj4gPiA+
ID4gPiBJJ20gbG9zdCBoZXJlLiBXaGF0IGlzIElPIHN0YW5kYXJkIGV4YWN0bHk/IFdoeSBpdCBj
YW4ndCBiZSBpbg0KPiA+ID4gPiA+IGdlbmVyaWMgaGVhZGVycz8NCj4gPiA+ID4gSXQgcmVwcmVz
ZW50cyBMVkNNT1MgMy4zIHZvbHRzLyBMVkNNT1MgMS44IHZvbHRzLg0KPiA+ID4gPiBTaW5jZSB0
aGlzIGlzIHNwZWNpZmljIHRvIFhpbGlueCBaeW5xTVAgcGxhdGZvcm0sIGNvbnNpZGVyZWQgdG8g
YmUNCj4gPiA+ID4gYWRkZWQgaW4gdGhlIGRyaXZlciBmaWxlLg0KPiA+ID4NCj4gPiA+IFNvLCB3
aHkgY2FuJ3Qgd2UgY3JlYXRlIGEgY291cGxlIG9mIGJpdHMgdG8gcmVwcmVzZW50IHRoaXMgdm9s
dGFnZXMNCj4gPiA+IGluIHRoZSBnZW5lcmljIGhlYWRlciBhbmQgZ2FpbiB1c2FiaWxpdHkgZm9y
IG90aGVycyBhcyB3ZWxsPw0KPiA+IEkgc2VlIHNvbWUgZHJpdmVycyBhcmUgbWFpbnRhaW5pbmcg
dGhlIGNvbmZpZ3VyYXRpb24gbGlzdCBpbiB0aGUNCj4gPiBkcml2ZXIgZmlsZSwgaWYgdGhlIGNv
bmZpZ3VyYXRpb24gaXMgc3BlY2lmaWMgdG8gdGhlIGRyaXZlci4NCj4gDQo+IFllcywgbXkgcG9p
bnQgaXMgdGhhdCB0aGlzIGNhc2UgZG9lc24ndCBzb3VuZCB0b28gc3BlY2lmaWMgdG8gdGhlIGRy
aXZlci4gTWFueQ0KPiBwaW4gY29udHJvbCBidWZmZXJzIChpbiBoYXJkd2FyZSB3YXkgb2Ygc3Bl
YWtpbmcpIGhhdmUgcHJvcGVydGllcyB0byBiZQ0KPiBkaWZmZXJlbnQgdm9sdGFnZSB0b2xlcmFu
dCAvIHByb2R1Y2UuDQpPaywgeW91IHdhbnQgbWUgdG8gcHJvY2VlZCB3aXRoIHRoaXMgY2hhbmdl
IG9yIHNoYWxsIHdlIHdhaXQgZm9yDQpMaW51cyB0byBjb21tZW50Pw0KPiANCj4gPiBXZSBjYW4g
bW92ZSB0aGlzIHRvIGdlbmVyaWMgaGVhZGVyIGlmIGl0IGlzIHVzZWQgYnkgb3RoZXJzIGFzIHdl
bGwuDQo+ID4gT2ssIHdpbGwgd2FpdCBmb3IgTGludXMgdG8gY29tbWVudC4NCj4gPiA+DQo+ID4g
PiBMaW51cz8NCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gPiA+ICsgICAgICAgcmV0ID0genlucW1w
X3BtX3BpbmN0cmxfcmVxdWVzdChwaW4pOw0KPiA+ID4gPiA+ID4gKyAgICAgICBpZiAocmV0KSB7
DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGV2X2VycihwY3RsZGV2LT5kZXYsICJyZXF1
ZXN0IGZhaWxlZCBmb3IgcGluDQo+ID4gPiA+ID4gPiArICV1XG4iLCBwaW4pOw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBXaHkgc2hhZG93aW5nIGVycm9yIGNvZGU/DQo+ID4gPg0KPiA+ID4gU28sIGFueSBj
b21tZW50cyBvbiB0aGUgaW5pdGlhbCBRPw0KPiA+IFhpbGlueCBsb3cgbGV2ZWwgc2VjdXJlIGZp
cm13YXJlIGVycm9yIGNvZGVzIGFyZSBkaWZmZXJlbnQgZnJvbSBMaW51eCBlcnJvcg0KPiBjb2Rl
cy4NCj4gPiBTZWN1cmUgZmlybXdhcmUgbWFpbnRhaW5zIGxpc3Qgb2YgZXJyb3IgY29kZXMgKHBv
c2l0aXZlIHZhbHVlcyBvdGhlciB0aGFuDQo+IHplcm8pLg0KPiA+IEhlbmNlIHdlIHJldHVybiAt
RUlPLCBpZiB0aGUgcmV0dXJuIHZhbHVlIGZyb20gZmlybXdhcmUgaXMgbm9uLXplcm8uDQo+IA0K
PiBXaHkgdGhlIHp5bnFtcF9wbV9waW5jdHJsX3JlcXVlc3QoKSBjYW4ndCByZXR1cm4gY29kZXMg
aW4gTGludXggZXJyb3INCj4gY29kZSBzcGFjZT8NCkkgY3Jvc3MgY2hlY2tlZCB3aXRoIHRoZSBY
aWxpbnggZmlybXdhcmUgdGVhbSwgZmlybXdhcmUgZHJpdmVyIGlzIG5vdyByZXR1cm5pbmcNCkxp
bnV4IGVycm9yIGNvZGVzIGluIHRoZSBsYXRlc3Qga2VybmVsIGJ1dCB3aGlsZSBkZXZlbG9waW5n
IHRoZSBkcml2ZXIgaXQgd2FzIGENCmRpZmZlcmVudCBhcHByb2FjaC4gSSB3aWxsIHVwZGF0ZSB0
aGUgZHJpdmVyIHRvIHNpbXBseSByZXR1cm4gdGhlIHZhbHVlcyBmcm9tDQpmaXJtd2FyZSBjYWxs
cy4NCj4gDQo+ID4gPiA+PiAgU2luY2UgaXQncyB0aGUgb25seSBwb3NzaWJsZSBlcnJvciwgd2h5
IGlzIGl0IG5vdA0KPiA+ID4gPiA+IHJlZmxlY3RlZCBpbiB0aGUga2VybmVsIGRvYz8NCj4gPiA+
ID4gSSB3aWxsIHVwZGF0ZSB0aGUga2VybmVsIGRvYyB3aXRoIHRoZSBlcnJvciB2YWx1ZSBmb3Ig
c3VjaCBjYXNlcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAgICAgICB9DQo+IA0KPiAtLQ0K
PiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo=
