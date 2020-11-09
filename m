Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECDF2AB39C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 10:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgKIJcO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 04:32:14 -0500
Received: from mail-dm6nam11on2062.outbound.protection.outlook.com ([40.107.223.62]:26720
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726176AbgKIJcO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 04:32:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld4jVszA2BItkANDiUNWbtBlqK4ukP8gGWZpARHu8uzTvsMMFo84KyYw/LaH86s6G1M8awJV9l4CMxMKnX7dnUxx4eYD+SulXCsX7O1IZrODRk+8DsH/MB9CRA0i64jP8qNxMhiE2fXz0w8QwZA2OE0p8eOw96gIk6hAW2jgGMNoofTAmRcSmykmLj8p8aCZ8+xueW0KnyShLFEbfQdijSwPsgSv8RQ1n/XTeO/mOdR4zsC4h8X8pNRPeTnZqY5Alifw5apLyw3Jmv8q9lMeKCnsKQFrPx35082e2EADe/ds8qZjHCBAVfYDIHuiDs0QvJw5XB0y069wjFSKrpAPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWeUU7Li1D50us5fnIpWAJbJtm9uUef2fMthy9VISqg=;
 b=eQIYrGvyvkrgtcuJEWReFCItNkbhrNAZDJ7F47DUIlcFo/A7NmarTvA3SDDMrePh3M7yvlHngZQ1/YO4grgtVu9IwI1wJqxTREPyvgrMLLidgpGs3K5r1KlUHDUa0DIhebdNTrlNOBXqnuBgZZxDhNmVP6JzhNmzl+TeF2K5j0YQCRXKDK34izQKJK9fIPs2jYUEI5Jjkzcs0ZJ8Gk8kU52M/tQNWec4fXe0mWmZl8KZRz/0zcIhubxQnnW5Qw76aa+lG1YfBP74SoIZXYNVGtTrGCxS3/tXdGmEJq+RS9jePPnxCxSrvpNs2YyRNqyLd4+9USW4AVutouaZMk636Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWeUU7Li1D50us5fnIpWAJbJtm9uUef2fMthy9VISqg=;
 b=ff5hcuoIcUOItgRdKvGen1MZaol9Ib5Mo1wsEPKIch9n5w0c17Ri0TTGHCNlmcc0rW1KlmSmIfIGCJmo5Z3Dqg0n4n52oJ48awNmFoPNNVbU9e/Rbnn6BLH6ohcZly+lq79gjwWe9uzozj9GIa2EclParvJ3OUBGV7NXHTjfqmo=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB6494.namprd02.prod.outlook.com (2603:10b6:5:208::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22; Mon, 9 Nov 2020 09:32:10 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2%5]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 09:32:09 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>
CC:     git <git@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Topic: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Index: AQHWYPp3HgetPDFFh0uAYJli9r7Ng6mfvfoAgADcH4CAAAeWAIAbtOEAgAPdHhA=
Date:   Mon, 9 Nov 2020 09:32:09 +0000
Message-ID: <DM6PR02MB53863EF7FEA6856BFE1B3680AFEA0@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
         <YT1PR01MB3546541973024526CDB6BBECEC1E0@YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM>
         <DM6PR02MB53868B37CD6C93BB4F9FCF98AF1F0@DM6PR02MB5386.namprd02.prod.outlook.com>
         <53ea7096-e434-182b-7734-8e5abc1af90c@xilinx.com>
 <c7f0bbb476c90ba1a01d682eb0146cb58e1425f1.camel@calian.com>
In-Reply-To: <c7f0bbb476c90ba1a01d682eb0146cb58e1425f1.camel@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: calian.com; dkim=none (message not signed)
 header.d=none;calian.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [157.48.179.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8a4a45ca-b132-4bb6-bd57-08d884925502
x-ms-traffictypediagnostic: DM6PR02MB6494:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6494BAB0AEE98D67DBBB5081AFEA0@DM6PR02MB6494.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsKS0NOlK50ngn4UCkwSCem8TfU3Z7TICyrglOPbZX+qckKRAcjOoIqZfyQh9qLXSaz0m2BzcrVYIXE1FNQzVfgIisSG4ORN1R+qtjOoFGhFZ6R8eNDwEKO7QYKUKqG6oUAJt7sh+TweCHK20a+rX6Ni+8xhItATIkpkG1HxGoNQRuv9M6jqxWvZo8ljpaUP7LE6QW3BoN8FoO8H1ttsu9U7xA0GYOxBQ+uTOCt8bO++Lf9H+Qs19f03svcfhdxw/bg/PBNOMrmprycijmY6J53oO6YepaLCbFOR5PXFAQaV4x2D/4j+HscQpzDP77lAhSUOviaPOA/cubOHMqp8kQlLI8nshHFJgEc1hVFKXUSTqsFE+aZIMSU/xdYb+xXcidpPK4q+WULwyxUWY7d0CzJS/eaq0LOox84JbNlOfU52GQPs9h+dKgobXe+BBhTTnwvmeThO+bWLYTvXy6ekfw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(8936002)(83380400001)(6636002)(15650500001)(86362001)(4326008)(2906002)(110136005)(4001150100001)(8676002)(26005)(316002)(45080400002)(7696005)(966005)(55016002)(15974865002)(64756008)(66476007)(66446008)(66556008)(66946007)(33656002)(478600001)(54906003)(5660300002)(53546011)(6506007)(76116006)(71200400001)(9686003)(52536014)(186003)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /WOsinFsa3HjYxX9HL28wI9pSSvuCWeR4dGEPO/Lgg8IE9SG8rTXoVh8742JPjpNo9vE+N2O0OYBA4CGa36qtWTZjTvnJc1U4QxYKPm55AeUgPIW6gBOnxNycp+mnHpkXJYrPFj5l9vtSqIS2OwuCWElXUjU4Opme3rnXfjAI7DVhYXwsMN9EdiAZ0ByS9rqfG4r2zgNDmA/uUudpDAcfnLe3WqXdKUtJCb+P8yzyEUsVzgp4y0JzpyGNtMPTT+km6zL3JeJUtN9wf9TmLCyrf31PjmuD9/bp9YUk7YxrJWunIkmi0HRO9dv+GIK3rYWq//M363em5Kmr8YoWJZfVaa/AkjFSURtSaowF5y+o/Ka+Ood3TDtowZkEIFkDhWxZkh2tGO4A26ix10ON9ICvwZxq5jwRHlhnhEQT5cFgK/mYPl2+p081zWmxF8nVqNKy/ZfbA7SVQ9xCG4/0z82doeR4cX9zCzI8Z8AzO91aJ3+eGDl6cq328ywYr7xw7I226Ay9pq641JGzKnF24pYOnAB+koDQbRoxvwYmEycrHzxOyhWj9Oou6i51eGP8Wt6jG6Ceo6teLznWjKtiIK0hjyAFVs3WdN8qUbIeLwttXdl6QTwPwOe84yGhiXHeBWMhDv5y0L4ky4jeUbYrpm9jA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4a45ca-b132-4bb6-bd57-08d884925502
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 09:32:09.7770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6LRnJt7MAGkFXEX550OBBEGZgq9OOuTlZADwjKuW05kJmxhoAMmUrbzE7ly0eh5OjfWSarhdCsjJomNSPkf+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6494
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iZXJ0LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYmVy
dCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiBTZW50OiBTYXR1cmRheSwg
Tm92ZW1iZXIgNywgMjAyMCAzOjU5IEFNDQo+IFRvOiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJo
cmFqQHhpbGlueC5jb20+OyBNaWNoYWwgU2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IFNy
aW5pdmFzIE5lZWxpIDxzbmVlbGlAeGlsaW54LmNvbT47IFNyaW5pdmFzIEdvdWQNCj4gPHNnb3Vk
QHhpbGlueC5jb20+DQo+IENjOiBnaXQgPGdpdEB4aWxpbnguY29tPjsgbGludXgtZ3Bpb0B2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAwLzNdIGdwaW8teGlsaW54OiBV
cGRhdGUgb24geGlsaW54IGdwaW8gZHJpdmVyDQo+IA0KPiBPbiBUdWUsIDIwMjAtMTAtMjAgYXQg
MDk6MjIgKzAyMDAsIE1pY2hhbCBTaW1layB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IGxldCBt
ZSBjb3JyZWN0IHRoaXMuIE1lcmdlIFdpbmRvdy4gOi0pDQo+ID4gNS4xMC1yYzEgc2hvdWxkIGJl
IHRhZ2dlZCBvbiBTdW5kYXkgT2N0IDI1LiBBZnRlciB0aGF0IHBhdGNoZXMgY2FuIGJlDQo+ID4g
c2VuZCBhZ2Fpbi4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBNaWNoYWwNCj4gPg0KPiANCj4gSGks
IGp1c3Qgd29uZGVyaW5nIGlmIHlvdSBhcmUgc3RpbGwgcGxhbm5pbmcgdG8gc3VibWl0IGEgdjMg
b2YgdGhpcyBwYXRjaHNldD8NCg0Kd29ya2luZyBvbiBpdCwgaGF2ZSB0byB0ZXN0IHNvbWUgZnVu
Y3Rpb25zICwgd2lsbCBzZW5kIHRoaXMgd2Vlaw0KDQpUaGFua3MNClNyaW5pdmFzIE5lZWxpDQoN
Cj4gDQo+ID4gT24gMjAuIDEwLiAyMCA4OjU5LCBTcmluaXZhcyBOZWVsaSB3cm90ZToNCj4gPiA+
IEhpIFJvYmVydCwNCj4gPiA+DQo+ID4gPiBXaWxsIHNlbmQgdGhlIG5leHQgdmVyc2lvbih2Mykg
YWZ0ZXIgTWFpbmxpbmUgV2luZG93IGNsb3NlLg0KPiA+ID4NCj4gPiA+IFRoYW5rcw0KPiA+ID4g
U3Jpbml2YXMgTmVlbGkuDQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gPiBGcm9tOiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNv
bT4NCj4gPiA+ID4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE5LCAyMDIwIDExOjE4IFBNDQo+ID4g
PiA+IFRvOiBTcmluaXZhcyBOZWVsaSA8c25lZWxpQHhpbGlueC5jb20+OyBNaWNoYWwgU2ltZWsg
PA0KPiA+ID4gPiBtaWNoYWxzQHhpbGlueC5jb20+OyBTcmluaXZhcyBHb3VkIDxzZ291ZEB4aWxp
bnguY29tPjsNCj4gPiA+ID4gU2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhakB4aWxpbnguY29t
Pg0KPiA+ID4gPiBDYzogZ2l0IDxnaXRAeGlsaW54LmNvbT47IGxpbnV4LWdwaW8gPGxpbnV4LWdw
aW9Admdlci5rZXJuZWwub3JnPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDAvM10g
Z3Bpby14aWxpbng6IFVwZGF0ZSBvbiB4aWxpbnggZ3Bpbw0KPiA+ID4gPiBkcml2ZXINCj4gPiA+
ID4NCj4gPiA+ID4gSGkgU3Jpbml2YXMsDQo+ID4gPiA+DQo+ID4gPiA+IEp1c3QgY2hlY2tpbmcg
aWYgdGhlcmUgaXMgYW55IHVwZGF0ZSBvbiB0aGlzIHBhdGNoc2V0PyBJdCBsb29rcw0KPiA+ID4g
PiBsaWtlIHRoZXJlIHdhcyBzb21lIGZlZWRiYWNrIGJ1dCBJIGRpZG4ndCBzZWUgYW5vdGhlciB2
ZXJzaW9uDQo+ID4gPiA+IHN1Ym1pdHRlZC4NCj4gPiA+ID4NCj4gPiA+ID4gUm9iZXJ0IEhhbmNv
Y2sNCj4gPiA+ID4gU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBBZHZhbmNlZCBUZWNobm9sb2dp
ZXMNCj4gPiA+ID4NCj4gaHR0cHM6Ly9jYW4wMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZ3DQo+ID4gPiA+DQo+IHd3LmNhbGlhbi5jb20lMkYmYW1w
O2RhdGE9MDQlN0MwMSU3Q3JvYmVydC5oYW5jb2NrJTQwY2FsaWFuLmNvbSUNCj4gN0MNCj4gPiA+
ID4NCj4gZDI1MTJiZDNkYmFjNDQxZjQzNjEwOGQ4NzRjOGZmMzAlN0MyM2I1NzgwNzU2MmY0OWFk
OTJjNDNiYjBmMDdhMWZkDQo+ID4gPiA+DQo+IGYlN0MwJTdDMCU3QzYzNzM4Nzc1MzkxODU3NTY4
NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSQ0KPiBqb2lNQzQNCj4gPiA+ID4NCj4gd0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEw
MDAmYQ0KPiBtcA0KPiA+ID4gPg0KPiA7c2RhdGE9bmludGoyN3dwVUNyV2ZDSmdnVlRLUnFhblBp
TTdBblhINU0yVmNzdDE0YyUzRCZhbXA7cmVzZXINCj4gdmVkDQo+ID4gPiA+ID0wDQo+ID4gPiA+
DQo+IGh0dHBzOi8vY2FuMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwJTNBJTJGJTJGdw0KPiA+ID4gPg0KPiB3dy5zZWRzeXN0ZW1zLmNhJTJGJmFtcDtkYXRhPTA0
JTdDMDElN0Nyb2JlcnQuaGFuY29jayU0MGNhbGlhbi5jbw0KPiBtDQo+ID4gPiA+DQo+ICU3Q2Qy
NTEyYmQzZGJhYzQ0MWY0MzYxMDhkODc0YzhmZjMwJTdDMjNiNTc4MDc1NjJmNDlhZDkyYzQzYmIw
ZjA3YQ0KPiA+ID4gPg0KPiAxZmRmJTdDMCU3QzAlN0M2MzczODc3NTM5MTg1NzU2ODQlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXkNCj4gSldJam9pDQo+ID4gPiA+DQo+IE1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDANCj4gMCYN
Cj4gPiA+ID4NCj4gYW1wO3NkYXRhPVkwJTJGaHkwMXR1d3ZyRlVBc3pNcWtpdDZDM1FhbTlLdHIx
cTV2TmJxa29MYyUzRCZhbQ0KPiBwO3Jlcw0KPiA+ID4gPiBlcnZlZD0wDQo+ID4gPiA+DQo+ID4g
PiA+IEZyb206IFNyaW5pdmFzIE5lZWxpIDxzcmluaXZhcy5uZWVsaUB4aWxpbnguY29tPg0KPiA+
ID4gPiBTZW50OiBKdWx5IDIzLCAyMDIwIDg6MzYgQU0NCj4gPiA+ID4gVG86IGJnb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT47IGxpbnVzLndhbGxlaWoNCj4gPiA+ID4gPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz47IG1pY2hhbC5zaW1layA8bWljaGFsLnNpbWVrQHhpbGlu
eC5jb20NCj4gPiA+ID4gPjsgc2dvdWQNCj4gPiA+ID4gPHNnb3VkQHhpbGlueC5jb20+OyBzaHVi
aHJhanlvdGkuZGF0dGEgPA0KPiA+ID4gPiBzaHViaHJhanlvdGkuZGF0dGFAeGlsaW54LmNvbT4N
Cj4gPiA+ID4gQ2M6IGdpdCA8Z2l0QHhpbGlueC5jb20+OyBsaW51eC1hcm0ta2VybmVsIDxsaW51
eC1hcm0tDQo+ID4gPiA+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtZ3BpbyA8
DQo+ID4gPiA+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtIGtlcm5lbA0KPiA+
ID4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gPiA+ID4gU3ViamVjdDogW1BB
VENIIFYyIDAvM10gZ3Bpby14aWxpbng6IFVwZGF0ZSBvbiB4aWxpbnggZ3BpbyBkcml2ZXINCj4g
PiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgZG9lcyB0aGUgZm9sbG93aW5nOg0KPiA+
ID4gPiAtQWRkIGNsb2NrIGFkYXB0aW9uIHN1cHBvcnQNCj4gPiA+ID4gLUFkZCBpbnRlcnVwdCBz
dXBwb3J0DQo+ID4gPiA+IC1BZGQgTUFJTlRBSU5FUlMgZnJhZ21lbnQNCj4gPiA+ID4NCj4gPiA+
ID4gQ2hhbmdlcyBpbiBWMjoNCj4gPiA+ID4gLUFkZGVkIGNoZWNrIGZvciByZXR1cm4gdmFsdWUg
b2YgcGxhdGZvcm1fZ2V0X2lycSgpIEFQSS4NCj4gPiA+ID4gLVVwZGF0ZWQgY29kZSB0byBzdXBw
b3J0IHJpc2luZyBlZGdlIGFuZCBmYWxsaW5nIGVkZ2UuDQo+ID4gPiA+IC1BZGRlZCB4Z3Bpb194
bGF0ZSgpIEFQSSB0byBzdXBwb3J0IHN3aXRjaC4NCj4gPiA+ID4gLUFkZGVkIE1BSU5UQUlORVJT
IGZyYWdtZW50Lg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gVGVzdGVkIEJlbG93IHNjZW5hcmlvczoN
Cj4gPiA+ID4gLVRlc3RlZCBMb29wIEJhY2suKGNoYW5uZWwgMS4wIGNvbm5lY3RlZCB0byBjaGFu
bmVsIDIuMCkgLVRlc3RlZA0KPiA+ID4gPiBFeHRlcm5hbCBzd2l0Y2goVXNlZCBESVAgc3dpdGNo
KSAtVGVzdGVkIENhc2NhZGUgc2NlbmFyaW8oSGVyZQ0KPiA+ID4gPiBncGlvIGNvbnRyb2xsZXIg
YWN0aW5nIGFzICBhbiBpbnRlcnJ1cHQgY29udHJvbGxlcikuDQo+ID4gPiA+IC0tLQ0KPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiBTcmluaXZhcyBOZWVsaSAoMyk6DQo+ID4gPiA+ICAgZ3Bpbzog
eGlsaW54OiBBZGQgY2xvY2sgYWRhcHRhdGlvbiBzdXBwb3J0DQo+ID4gPiA+ICAgZ3BpbzogeGls
aW54OiBBZGQgaW50ZXJydXB0IHN1cHBvcnQNCj4gPiA+ID4gICBNQUlOVEFJTkVSUzogYWRkIGZy
YWdtZW50IGZvciB4aWxpbnggR1BJTyBkcml2ZXJzDQo+ID4gPiA+DQo+ID4gPiA+ICBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICB8ICAxMCArKw0KPiA+ID4gPiAgZHJpdmVycy9ncGlvL0tjb25m
aWcgICAgICAgfCAgIDEgKw0KPiA+ID4gPiAgZHJpdmVycy9ncGlvL2dwaW8teGlsaW54LmMgfCA0
MDQNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM5NSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlv
bnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi43LjQNCj4gLS0NCj4gUm9iZXJ0
IEhhbmNvY2sNCj4gU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2YW5jZWQgVGVj
aG5vbG9naWVzIHd3dy5jYWxpYW4uY29tDQo=
