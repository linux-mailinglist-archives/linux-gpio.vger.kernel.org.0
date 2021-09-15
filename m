Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8040BF18
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 07:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhIOFC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Sep 2021 01:02:59 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54280 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229450AbhIOFC7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Sep 2021 01:02:59 -0400
X-UUID: 0d9a1c52c8064d6b9a993f336610b25a-20210915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HcIFjhLICneiwWPvosBAlNPVaYGigOSbXeS62Fv78k4=;
        b=dtWxuBgIookzbm18HLg8KAe82CLsb/CErwyGFG40qy0AIPa1vISlLs1jjgQ/hS/7GVyO1/XSgAp43D3LJr+2goaLT+VdD+wbrchRpT6kyV60SKxw4hGchoX5XEgmnbOKzkMwg/TeB4uRwx8kqPjq6G5/Hu6x3yGttIN16M3ro1Q=;
X-UUID: 0d9a1c52c8064d6b9a993f336610b25a-20210915
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1912087279; Wed, 15 Sep 2021 13:01:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Sep 2021 13:01:36 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 15 Sep 2021 13:01:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5fcfO5I8dbLrlm1FrvICbUGzwMyUOjNTfYTDTisCA+dWQcBO9v3H5cRjBegmC7/2Qn7YRUANQv1qhZQiHSfmkdhajT4BRxj5PEMKZaw3wpy6CQUt8MWK97DM5EljuGxSnjgl/s8bMGtpTgEJ2uMULrPnVyrCGxRakK/jSLXNJKH3iXGyO6tTB6glcmxzKJ/Rc2QCKP/EhxSYCuLEuJMC0jAWz1WBKJgXM7HbSfoyZxwbDE3vjz0d4tjGfYxMg1nvaEkR3VorbZjnMtXUWjzJzJbF08vWxH9yaYBcxap/iScDXMG9Pm3D1BiHPqrmvA/WucjWvw980OJimadP91lBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HcIFjhLICneiwWPvosBAlNPVaYGigOSbXeS62Fv78k4=;
 b=N/KC11eqhxiwe0lywoUdzPh4iMeDaEAYTfGB9o5hu/OH5MMOO6kd9ehYi+w/DvGikymS0dPMVBZP2OGkciMS5BxRv78eX1Afi1AbG+zOdB0uJ7d9HfOJJjppc5ARxY3Uo9iHIxAtM766WALXanMn85Xzs1El3YOp6atx1JMajULCIsvEe70NbNv/pEnm/tjOewt91UwmqpZFM56I1SiWdUgIYSRPnjykpXyFyFLs3qbTdmNhdUa5ymcGR1twiGbhAC3XdYOJenwjqw04Ur/y6XlDsqDk+zFj+mthuXr+9J/sMFy9YpcJ2X91gbQM/iJgeFn+/yMFEBlHy6RU/U1nZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcIFjhLICneiwWPvosBAlNPVaYGigOSbXeS62Fv78k4=;
 b=W0Y6pS3A0Il+1hBsQcG6jvr/zweVwBTwHH0ArQJh2s1bklj3aDodNTG4BbWWG/RKRFArwNBEd+sWvcGygQy6C/kALpEC8Pb/9FaJyzqZW+GyC2iNrRgly7nmp2nvRgU0R3uW4R41JpsefeebmPznJC/YhRvIxgPVJF1ynzI2+gk=
Received: from SI2PR03MB5260.apcprd03.prod.outlook.com (2603:1096:4:108::5) by
 SI2PR03MB5356.apcprd03.prod.outlook.com (2603:1096:4:ec::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8; Wed, 15 Sep 2021 05:01:34 +0000
Received: from SI2PR03MB5260.apcprd03.prod.outlook.com
 ([fe80::f88c:91cb:58c6:a5e9]) by SI2PR03MB5260.apcprd03.prod.outlook.com
 ([fe80::f88c:91cb:58c6:a5e9%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 05:01:34 +0000
From:   =?utf-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= 
        <Light.Hsieh@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        =?utf-8?B?WmhpeW9uZyBUYW8gKOmZtuW/l+WLhyk=?= 
        <Zhiyong.Tao@mediatek.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?utf-8?B?SHVpIExpdSAo5YiY6L6JKQ==?= <Hui.Liu@mediatek.com>,
        =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= 
        <eddie.huang@mediatek.com>,
        =?utf-8?B?QmlhbyBIdWFuZyAo6buE5b2qKQ==?= <Biao.Huang@mediatek.com>,
        "Hongzhou Yang" <hongzhou.yang@mediatek.com>,
        Sean Wang <Sean.Wang@mediatek.com>,
        =?utf-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= 
        <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
Thread-Topic: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
Thread-Index: AQHXnTcLkfkdva86SEWI0zpfLbwqkauOmzeAgAF2CICAAAtZAIADefEAgAMfNoCADNeaAIAA+uEAgAAZluA=
Date:   Wed, 15 Sep 2021 05:01:34 +0000
Message-ID: <SI2PR03MB5260191DA69F435F8539A11C84DB9@SI2PR03MB5260.apcprd03.prod.outlook.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
 <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
 <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
 <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com>
 <05f453a466995a6c272d585f18e81c5fcb837a0b.camel@mediatek.com>
 <CAGXv+5FF25a=28YNmVx_FNJ1o+OrR_LWkd1VPe6ejoxX9-bkaA@mail.gmail.com>
In-Reply-To: <CAGXv+5FF25a=28YNmVx_FNJ1o+OrR_LWkd1VPe6ejoxX9-bkaA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrMDM5ODBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mZTI5NDg3NC0xNWUxLTExZWMtOTE5OC00Y2NjNmFhMjI5OWRcYW1lLXRlc3RcZmUyOTQ4NzYtMTVlMS0xMWVjLTkxOTgtNGNjYzZhYTIyOTlkYm9keS50eHQiIHN6PSI3MTMxIiB0PSIxMzI3NjE1NTY5Mjg0MzE2MjYiIGg9Ii81dFFCRFZVV1d1ajJDN1ZYWEFycldBNmxWcz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 521da013-002a-4051-39aa-08d97805e42f
x-ms-traffictypediagnostic: SI2PR03MB5356:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SI2PR03MB5356CB538A67AE2A88346D6D84DB9@SI2PR03MB5356.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ah/FVunfsPgm0yW/cBxPck5xOggGOR77Bnn2/wPX8H0tkjpePHJ+VoqGd9uaBNhxShJzy7s68pHyMjQ0yybib6fuMXK5KbxiYQ5H+r6pJBCwPqMyweBDRuFqhPtdqAyswGFZlJFlP0NC1RO613txjIlAGNM72etGBr4YJ59kl7pSHBlPcQS/eGteFzS8o6xxdYaDCuzYnT4WCOvdG1mha/245QdKsTMB1Gf2gGDjXx+rE/xHwSUFR3grZIkRY1GqNnS3vWpojX3u9n3upKLN5XnJnzOeoGOSkNQ+/tpLbicQh2umkaxOCV+q2jvppReyesoqKPLOHO1FWdIgsYHTwinXw/EWLIjFarMiOt+svXqLlcKoTrcXknoqohuvLf/ISr/kmfRKx09tUbcVsM6RQX9IeQLWCWR/xyzCNN3QVoDk6re4A8hEQ+y4mHa1bzVkQSgNCU85lXoE85n0MWidkHMktTpsKxkp1Ql2iU/REsggtBnj+6ckeloQnuAZdsDeFEaE8eW6Icb3ujmgzMD8t4ZXLpzpI6yJnVMwfIWolJEPSQtZ3KlRrf/SeSfNkn9gAWHiYfHrgmUs0qq7mJrPi518L+Ue/FwUCK8W9mB+YyK3sCn6GXDw2Bd3vLUErhQgx1/Wwmil+4YRP5Qiuf9a8C9xhSCMj+Kyqzxd6y+XA63E2FGpuiCqgWwVnJEXGmKcBT/t4ZpqET0dKqlKDPAuTNwFS8/Ai1cHNxBp1Dgs0A/yHXr9UzSZEExWyoCUkk+1RwieXQpgHVqlN7WP5qzjUnVi6mjbJ8twBJlLbcbCioVHdnSq7PFhk9cfvatgbq7/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5260.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6636002)(76116006)(66556008)(64756008)(66476007)(66446008)(7416002)(38070700005)(5660300002)(8676002)(316002)(83380400001)(33656002)(966005)(2906002)(4326008)(85182001)(26005)(7696005)(55016002)(54906003)(186003)(110136005)(71200400001)(86362001)(508600001)(38100700002)(52536014)(9686003)(53546011)(6506007)(8936002)(122000001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 51jT+QisAWyFTlz3qvDk+Digqg6DZGm8fo8p14kgmZ8fOZHx3UR2Nu2CroqActQiG46aPyKW5nHH6xleOgpi2YsT2LJVIVveKIz6048Op5AmbJ1oKBgKdLSCjkwTXmhZsaSre6fF8h1KH7R4SIiw4CTmsW8l00ZND/n7I5+nypmRt2xBtbJ9GLhPXyG4BT3sBN2QifyiqBi5QysEJra3OjPn1xlt3IkAvo6aJte0nb0t4SJ+0Gpu4LqsUY0exKzmMa+dniArsQbsssF9/VbsdY6snhEi/JLA4nYzc6A0uEt6UdiwRoHgzWaUexnM0MeWWEwBeyjzLKR0tzUKEEvDG22ilfaTRsww+pfdB0tH6BAoCAQCCgGUWktWPZNQU7IZh5Ik77zxpJ7WcPD8w4zZPRD3bSExLHsEI8oGKPx/bGlIZbTCdaz6KjxXBfO5Q28qi6nKBPXPHSsdmPYfSxlEvkAO2NA2Xc5KObW52drfBdpeAcdVRdmbLHGPbQzgJdG+OzV1A6Vq7JjIVlnCK6k7j0BHjXKxql4qH+OsKwZ1rmDrN9prrpL2qWj2GoATO38+D8EsI/6mp7p5sqvsWuHIBELe/L5uUYMIGpiaZo0oGiDTogkJxydLJlW/i0RgONmoy9wfGxu/uC76IB8dnOMWT2fAu+oIv7ztveZCMLEnPX0aQb7pGUWgJktPfICjte63s1Ju9YJyPO6zLEXXCmjM4eIzKPvVXehqBvm4dg+Uogmfofq69h+1S3BBgbNXcMBy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5260.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521da013-002a-4051-39aa-08d97805e42f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 05:01:34.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wb5ET5ie/ZwTMacgz2L2NaabMndbe3k+XsJ0d0/eAy4F8m7uu1VvPRyFJfyBIqbPtJuybimfv643U0I5oabINAL9nJGDoFG2z2V3vhansaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5356
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rm9yIGJhY2t3YXJkIGNvbXBhdGlibGUgdG8gcHJldmlvdXMgdXNhZ2UgYW5kIG1hbnkgY3VzdG9t
ZXJzIG9mIG1lZGlhdGVrLCBNVEsgd291bGQgbm90IGNoYW5nZSBwcmV2aW91cyB1c2FnZSBvZiBi
aWFzLXB1bGwtdXAgYW5kIGJpYXMtcHVsbC1kb3duIHNldHRpbmcgdXNhZ2UuDQoNClRoZSBzaSB1
bml0IHVzYWdlIHdpbGwgb25seSBhcHBseSB0byByc2VsIG9ubHkuDQoNClBsZWFzZSBzdG8gIGdp
dmUgY29tbWVudHMgb24gY2hhbmdpbmcgbWVkaWF0ZWsncyBwcmV2aW91cyB1c2FnZS4NCg0KTGln
aHQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENoZW4tWXUgVHNhaSBbbWFp
bHRvOndlbnN0QGNocm9taXVtLm9yZ10gDQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxNSwg
MjAyMSAxMToyNSBBTQ0KVG86IFpoaXlvbmcgVGFvICjpmbblv5fli4cpDQpDYzogUm9iIEhlcnJp
bmc7IExpbnVzIFdhbGxlaWo7IE1hcmsgUnV0bGFuZDsgTWF0dGhpYXMgQnJ1Z2dlcjsgU2VhbiBX
YW5nOyBzcnZfaGV1cHN0cmVhbTsgSHVpIExpdSAo5YiY6L6JKTsgRWRkaWUgSHVhbmcgKOm7g+aZ
uuWCkSk7IExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpOyBCaWFvIEh1YW5nICjpu4TlvaopOyBIb25n
emhvdSBZYW5nOyBTZWFuIFdhbmc7IFNlaXlhIFdhbmcgKOeOi+i/uuWQmyk7IERldmljZXRyZWUg
TGlzdDsgTEtNTDsgbW9kZXJhdGVkIGxpc3Q6QVJNL0ZSRUVTQ0FMRSBJTVggLyBNWEMgQVJNIEFS
Q0hJVEVDVFVSRTsgbW9kZXJhdGVkIGxpc3Q6QVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0OyBvcGVu
IGxpc3Q6R1BJTyBTVUJTWVNURU0NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDEvNF0gZHQtYmlu
ZGluZ3M6IHBpbmN0cmw6IG10ODE5NTogYWRkIHJzZWwgZGVmaW5lDQoNCk9uIFR1ZSwgU2VwIDE0
LCAyMDIxIGF0IDg6MjcgUE0gemhpeW9uZy50YW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4g
d3JvdGU6DQo+DQo+IE9uIE1vbiwgMjAyMS0wOS0wNiBhdCAxNjoyMCArMDgwMCwgQ2hlbi1ZdSBU
c2FpIHdyb3RlOg0KPiA+IE9uIFNhdCwgU2VwIDQsIDIwMjEgYXQgNDo0MCBQTSB6aGl5b25nLnRh
byANCj4gPiA8emhpeW9uZy50YW9AbWVkaWF0ZWsuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4NCj4g
PiA+IE9uIFRodSwgMjAyMS0wOS0wMiBhdCAxMTozNSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3Rl
Og0KPiA+ID4gPiBPbiBUaHUsIFNlcCAyLCAyMDIxIGF0IDEwOjU0IEFNIHpoaXlvbmcudGFvIDwg
DQo+ID4gPiA+IHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbQ0KPiA+ID4gPiA+IHdyb3RlOg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCAyMDIxLTA5LTAxIGF0IDEyOjM1ICswODAwLCBDaGVu
LVl1IFRzYWkgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBNb24sIEF1ZyAzMCwgMjAyMSBhdCA4OjM2
IEFNIFpoaXlvbmcgVGFvIDwgDQo+ID4gPiA+ID4gPiB6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+
IHdyb3RlOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgcnNl
bCBkZWZpbmUgZm9yIG10ODE5NS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogWmhpeW9uZyBUYW8gPHpoaXlvbmcudGFvQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4g
PiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2
NXh4LmggfCA5ICsrKysrKysrKw0KPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oDQo+ID4gPiA+ID4gPiA+IGIvaW5jbHVk
ZS9kdC0NCj4gPiA+ID4gPiA+ID4gYmluZGluZ3MvcGluY3RybC9tdDY1eHguaA0KPiA+ID4gPiA+
ID4gPiBpbmRleCA3ZTE2ZTU4ZmUxZjcuLmY1OTM0YWJjZDFiZCAxMDA2NDQNCj4gPiA+ID4gPiA+
ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210NjV4eC5oDQo+ID4gPiA+ID4g
PiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaA0KPiA+ID4gPiA+
ID4gPiBAQCAtMTYsNiArMTYsMTUgQEANCj4gPiA+ID4gPiA+ID4gICNkZWZpbmUgTVRLX1BVUERf
U0VUX1IxUjBfMTAgMTAyICAjZGVmaW5lIA0KPiA+ID4gPiA+ID4gPiBNVEtfUFVQRF9TRVRfUjFS
MF8xMSAxMDMNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgTVRLX1BVTExf
U0VUX1JTRUxfMDAwICAyMDAgI2RlZmluZSANCj4gPiA+ID4gPiA+ID4gK01US19QVUxMX1NFVF9S
U0VMXzAwMSAgMjAxICNkZWZpbmUgTVRLX1BVTExfU0VUX1JTRUxfMDEwICANCj4gPiA+ID4gPiA+
ID4gKzIwMiAjZGVmaW5lIE1US19QVUxMX1NFVF9SU0VMXzAxMSAgMjAzICNkZWZpbmUgDQo+ID4g
PiA+ID4gPiA+ICtNVEtfUFVMTF9TRVRfUlNFTF8xMDAgIDIwNCAjZGVmaW5lIE1US19QVUxMX1NF
VF9SU0VMXzEwMSAgDQo+ID4gPiA+ID4gPiA+ICsyMDUgI2RlZmluZSBNVEtfUFVMTF9TRVRfUlNF
TF8xMTAgIDIwNiAjZGVmaW5lIA0KPiA+ID4gPiA+ID4gPiArTVRLX1BVTExfU0VUX1JTRUxfMTEx
ICAyMDcNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBDb3VsZCB5b3Uga2VlcCB0aGUgc3BhY2lu
ZyBiZXR3ZWVuIGNvbnN0YW50cyB0aWdodGVyLCBvciANCj4gPiA+ID4gPiA+IGhhdmUgbm8gc3Bh
Y2luZyBhdCBhbGw/IExpa2UgaGF2aW5nIE1US19QVUxMX1NFVF9SU0VMXzAwMCANCj4gPiA+ID4g
PiA+IGRlZmluZWQgYXMgMTA0IGFuZCBzbyBvbi4gVGhpcyB3b3VsZCByZWR1Y2UgdGhlIGNoYW5j
ZSBvZiANCj4gPiA+ID4gPiA+IG5ldyBtYWNybyB2YWx1ZXMgY29sbGlkaW5nIHdpdGggYWN0dWFs
IHJlc2lzdG9yIHZhbHVlcyBzZXQgDQo+ID4gPiA+ID4gPiBpbiB0aGUgZGF0YXNoZWV0cywgcGx1
cyBhIGNvbnRpZ3VvdXMgc3BhY2Ugd291bGQgYmUgZWFzeSB0byANCj4gPiA+ID4gPiA+IHJ1bGUg
YXMgbWFjcm9zLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IENoZW5ZdQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gSGkgY2hlbnl1LA0KPiA+ID4gPiA+IEJ5IHRoZSBjdXJyZW50IHNvbHV0aW9uLCBp
dCB3b24ndCBiZSBtaXhlZCB1c2VkIGJ5IA0KPiA+ID4gPiA+IE1US19QVUxMX1NFVF9SU0VMX1hY
WCBhbmQgcmVhbCAgcmVzaXN0b3IgdmFsdWUuDQo+ID4gPiA+ID4gSWYgdXNlciB1c2UgTVRLX1BV
TExfU0VUX1JTRUxfWFhYLCBUaGV5IGRvbid0IGNhcmUgdGhlIGRlZmluZSANCj4gPiA+ID4gPiB3
aGljaCBtZWFucyBob3cgbXVjaCByZXNpc3RvciB2YWx1ZS4NCj4gPiA+ID4NCj4gPiA+ID4gV2hh
dCBJIG1lYW50IHdhcyB0aGF0IGJ5IGtlZXBpbmcgdGhlIHZhbHVlIHNwYWNlIHRpZ2h0LCB3ZSBh
dm9pZCANCj4gPiA+ID4gdGhlIHNpdHVhdGlvbiB3aGVyZSBpbiBzb21lIG5ldyBjaGlwLCBvbmUg
b2YgdGhlIFJTRUwgcmVzaXN0b3JzIA0KPiA+ID4gPiBoYXBwZW5zIHRvIGJlIDIwMCBvciAzMDAg
b2htcy4gMTAwIGlzIGFscmVhZHkgdGFrZW4sIHNvIHRoZXJlJ3MgDQo+ID4gPiA+IG5vdGhpbmcg
d2UgY2FuIGRvIGlmIG5ldyBkZXNpZ25zIGFjdHVhbGx5IGRvIGhhdmUgMTAwIG9obSANCj4gPiA+
ID4gc2V0dGluZ3MuDQo+ID4gPiA+DQo+ID4gPiA+ID4gV2UgdGhpbmsgdGhhdCB3ZSBkb24ndCBj
b250aWd1b3VzIG1hY3JvIHNwYWNlIGZvciBkaWZmZXJlbnQgDQo+ID4gPiA+ID4gcmVnaXN0ZXIu
DQo+ID4gPiA+ID4gSXQgbWF5IGluY3JlYXNlIGNvZGUgY29tcGxleGl0eSB0byBtYWtlIGhhdmlu
Zw0KPiA+ID4gPiA+IE1US19QVUxMX1NFVF9SU0VMXzAwMA0KPiA+ID4gPiA+IGRlZmluZWQgYXMg
MTA0Lg0KPiA+ID4gPg0KPiA+ID4gPiBDYW4geW91IGVsYWJvcmF0ZT8gSXQgaXMgYSBzaW1wbGUg
cmFuZ2UgY2hlY2sgYW5kIG9mZnNldCANCj4gPiA+ID4gaGFuZGxpbmcuDQo+ID4gPiA+IEFyZQ0K
PiA+ID4gPiB5b3UgY29uY2VybmVkIHRoYXQgYSBuZXcgZGVzaWduIHdvdWxkIGhhdmUgUjJSMVIw
IGFuZCB5b3Ugd291bGQgDQo+ID4gPiA+IGxpa2UgdGhlIG1hY3JvcyB0byBiZSBjb250aWd1b3Vz
Pw0KPiA+ID4gPg0KPiA+ID4gPiBCVFcgSSBkb24ndCBxdWl0ZSBnZXQgd2h5IGRlY2ltYWwgYmFz
ZSB2YWx1ZXMgKDEwMCwgMjAwLCBldGMuKSANCj4gPiA+ID4gd2VyZSBjaG9zZW4uIE9uZSB3b3Vs
ZCB0aGluayB0aGF0IGJpbmFyeSBiYXNlcyBhcmUgZWFzaWVyIHRvIA0KPiA+ID4gPiBoYW5kbGUg
aW4gY29kZS4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gQ2hlbll1DQo+ID4gPiA+DQo+ID4g
Pg0KPiA+ID4gWWVzLHdlIGNvbmNlcm5lZCB0aGF0IGEgbmV3IGRlc2lnbiB3b3VsZCBoYXZlIFIy
UjFSMCBhbmQgd2Ugd291bGQgDQo+ID4gPiBsaWtlIHRoZSBtYWNyb3MgdG8gYmUgY29udGlndW91
cyBpbiB0aGUgZmVhdHVyZS4gd2UgcmVzZXJ2ZSBpdC4NCj4gPg0KPiA+IEkgc2VlLiBUaGF0IG1h
a2VzIHNlbnNlLiBEbyB5b3UgZXhwZWN0IHRvIHNlZSBSMyBvciBldmVuIFI0IGluIHRoZSANCj4g
PiBmdXR1cmU/DQo+ID4gT3IgcHV0IGFub3RoZXIgd2F5LCBkbyB5b3UgZXhwZWN0IHRvIHNlZSBy
ZXNpc3RvciB2YWx1ZXMgb2YgMTUwIG9yDQo+ID4gMjAwDQo+ID4gc3VwcG9ydGVkPw0KPiA+DQo+
ID4gTWF5YmUgd2UgY291bGQgcmVzZXJ2ZSAyMDAgYW5kIHN0YXJ0IGZyb20gMjAxIGZvciB0aGUg
UlNFTCBtYWNyb3M/DQo+ID4NCj4gPiBTb21lIHBsYW5uaW5nIG5lZWRzIHRvIGJlIGRvbmUgaGVy
ZSB0byBhdm9pZCB2YWx1ZSBjbGFzaGVzLg0KPiA+DQo+ID4gPiBXZSB0aGluayB0aGF0IGRlY2lt
YWwgYW5kIGJpbmFyeSBiYXNlIHZhbHVlcyBhcmUgdGhlIHNhbWUgZm9yIHRoZSANCj4gPiA+IGZl
YXR1cmUuDQo+ID4NCj4gPiBXaXRoIGRlY2ltYWwgbnVtYmVycyB5b3UgZW5kIHVwIHdhc3Rpbmcg
YSBiaXQgbW9yZSBzcGFjZSwgc2luY2UgdGhlIA0KPiA+IGhhcmR3YXJlIGlzIGFsd2F5cyB1c2lu
ZyBiaW5hcnkgdmFsdWVzLiBJIGp1c3QgZm91bmQgaXQgb2RkLCB0aGF0J3MgDQo+ID4gYWxsLg0K
PiA+DQo+ID4gQ2hlbll1DQo+ID4NCj4gPiA+ID4gPiBUaGFua3MuDQo+DQo+IEhpIENoZW5ZdSwN
Cj4NCj4gSW4gdGhlIG5leHQgdmVyc2lvbiwgd2UgcHJvdmlkZSBhIHNvbHV0aW9uIHdoaWNoIHdl
IGRpc2N1c3NlZCBpbnRlcm5hbCANCj4gdG8gYXZvaWQgdmFsdWUgY2xhc2hlcy4NCj4NCj4gVGhl
IHNvbHV0aW9uOg0KPiAxLiBXZSB3aWxsIGtlZXAgdGhlIGRlZmluZSAiTVRLX1BVTExfU0VUX1JT
RUxfMDAwIDIwMCIuIEl0IHdvbid0IA0KPiBjaGFuZ2UuDQo+DQo+IDIuIFdlIHdpbGwgYWRkIGEg
cHJvcGVydHkgaW4gcGlvIGR0c2kgbm9kZSwgZm9yIGV4YW1wbGUsIHRoZSBwcm9wZXJ0eSANCj4g
bmFtZSBpcyAicnNlbF9yZXNpc3RhbmNlX2luX3NpX3VuaXQiLg0KPiBXZSB3aWxsIGFkZCBhIGZs
YWcgInJzZWxfc2lfdW5pdCIgaW4gcGluY3RybCBkZXZpY2UuDQo+IGluIHByb2JlIGZ1bmN0aW9u
LCB3ZSB3aWxsIGlkZW50aWZ5IHRoZSBwcm9wZXJ0eSBuYW1lIA0KPiAicnNlbF9yZXNpc3RhbmNl
X2luX3NpX3VuaXQiIHRvIHNldCB0aGUgZmxhZyAicnNlbF9zaV91bml0IiB2YWx1ZS4NCj4gU28g
aXQgY2FuIHZvaWQgdmFsdWUgY2xhc2hlcy4NCg0KSSBzdXBwb3NlIGEgIm1lZGlhdGVrLCIgcHJl
Zml4IHNob3VsZCBiZSBhZGRlZC4gQW5kIHRvIGZ1dHVyZSBwcm9vZiB0aGluZ3MgdGhpcyBzaG91
bGQgcHJvYmFibHkgYXBwbHkgdG8gYWxsIGJpYXMtdXAvZG93biB2YWx1ZXMsIHNvICJtZWRpYXRl
ayxiaWFzLXJlc2lzdGFuY2UtaW4tc2ktdW5pdHMiPw0KDQpBbmQgdGhlIGRlc2NyaXB0aW9uIHNo
b3VsZCBpbmNsdWRlIHNvbWV0aGluZyBsaWtlIHRoYXQ6DQoNCiAgUGFzdCB1c2FnZSBvZiBiaWFz
LXVwL2Rvd24gdmFsdWVzIGluY2x1ZGVkIG1hZ2ljIG51bWJlcnMgdG8gc3BlY2lmeQ0KICBkaWZm
ZXJlbnQgaGFyZHdhcmUgY29uZmlndXJhdGlvbnMgYmFzZWQgb24gcmVnaXN0ZXIgdmFsdWVzLiBU
aGlzDQogIHByb3BlcnR5IHNwZWNpZmllcyB0aGF0IGFsbCB2YWx1ZXMgdXNlZCBmb3IgYmlhcy11
cC9kb3duIGZvciB0aGlzDQogIGNvbnRyb2xsZXIgc2hhbGwgYmUgaW4gU0kgdW5pdHMuDQoNCkFu
ZCB0aGlzIHByb3Bvc2FsIGlzIHN0aWxsIHN1YmplY3QgdG8gbWFpbnRhaW5lciAobm90IG1lKSBy
ZXZpZXcuDQoNCg0KPiAzLldlIHdpbGwgcHJvdmlkZSB0aGUgZGVmaW5lICJNVEtfUFVMTF9TRVRf
UlNFTF8wMDAgMjAwIiBhbmQgc2kgdW5pdCANCj4gdHdvIHNvbHV0aW9uLiB1c2VycyBjYW4gc3Vw
cG9ydCB3aGljaCBzb2x1dGlvbiBieSBhZGQgcHJvcGVydHkgDQo+ICJyc2VsX3Jlc2lzdGFuY2Vf
aW5fc2lfdW5pdCIgaW4gZHRzIG5vZGUgb3Igbm90Lg0KDQpUaGFua3MuIEkgdGhpbmsgdGhpcyBz
b2x1dGlvbiBkb2VzIHByb3ZpZGUgYSBjbGVhciBzZXBhcmF0aW9uIG9mIHRoZSB0d28gdmFsdWUg
c3BhY2VzLg0KDQpDaGVuWXUNCg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiAgI2RlZmluZSBNVEtfRFJJVkVfMm1BICAyDQo+ID4gPiA+ID4gPiA+ICAjZGVmaW5lIE1US19E
UklWRV80bUEgIDQNCj4gPiA+ID4gPiA+ID4gICNkZWZpbmUgTVRLX0RSSVZFXzZtQSAgNg0KPiA+
ID4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+ID4gPiAyLjE4LjANCj4gPiA+ID4gPiA+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiA+ID4gPiA+ID4g
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0IA0KPiA+ID4gPiA+ID4gPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchemZxeFpUOVdZUF9HM1QxamF2LUZ3RHVONkpN
cjcwbGRSLWxLVm15aFpqWURrSUJveUN6MUZLVC1SR0k3Y1ZoT1FuNCQgDQo=
