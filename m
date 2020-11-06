Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53BA2AA065
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 23:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgKFW3T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 17:29:19 -0500
Received: from mail-eopbgr660047.outbound.protection.outlook.com ([40.107.66.47]:37408
        "EHLO CAN01-QB1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728390AbgKFW3T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 17:29:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr9SYdaHvVdO0QurqNA+j0yh8v++uoi6ECVpUeEthHcXN6BBb+7F3MSUizmNCivvnXctaIwHOBjXFnB6vv6I/szn63QCJdnV4t2HTLlethlOLaHj9yWc9UtWmrukv0IL52uX8p94sRasR7du22iKCcNfCE2M6KZYT6sF5AlE4rAFiPbIKDNEgD+KKawsR1b13sOYqzLj1s6SHh+SJXDAMxTP2gzaCxaVeLePz/wi0/9Nt5G4l1rTV2p25DXRTjTBCtNBfp1dZNdaiBE8nLCkLYGFQbJIFMqWkmiFjFNcFJCFVb1tFQBZ0MA127Wh8vmyxC5KxkrlkuYhJd7pWoOL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWhAu4oUXVM7BBsvBYyOHHQIn/G4ZybTcIj6oDqeJa8=;
 b=i1lHwn3uDOpUPmOQfAMvlRf4LKA7BvWwOnYW7lMOpYUsYXDKaa/jX8k5BR9YBuVVUzhN4zzaX3iulgT+0dhS+0gi6QRrCaY5XaJRWfnXlsFR7/fFe6ea/OSWsMTbTkGNoAPK8S8oeqstIWQdDjj4iaG/U2vFszBsXVh2f5aUCkxtjygwYbf3IsPOCClJUMYx7SDgC7JgSQ9DLpfYrtcQK/rVCKsPpUnF4XDuH2X6ToMy7LENQfaHXnAKjJ+F+nD7Hiv2p6I7ktsWA76XBuPPhHgcqQcwvB+WkqrRp47tb7SpAVGIyvLUd+NKY0FtuDp4rf7Yz+UMn3UFWZuKNX8XOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWhAu4oUXVM7BBsvBYyOHHQIn/G4ZybTcIj6oDqeJa8=;
 b=eON+rhajFymhr9SPIyt+t6Wv+8s2VWDONBreNfBodubIRjYiqi5bBL2sglqSUJOJe/0gzDTxr9VWo8HWvmabtXBndPq7aJm2tzL9ghWuoZ1MgFwu1Kh8glVTdUP1+2e3k4INJwjOTnJjN60/7+Hyl8VHAGlMhahAXNgsbGivcvE=
Received: from YTBPR01MB3551.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1d::17)
 by YTBPR01MB3214.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 22:29:16 +0000
Received: from YTBPR01MB3551.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ec1a:bef3:2b8e:22]) by YTBPR01MB3551.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ec1a:bef3:2b8e:22%6]) with mapi id 15.20.3541.022; Fri, 6 Nov 2020
 22:29:16 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "sneeli@xilinx.com" <sneeli@xilinx.com>,
        "sgoud@xilinx.com" <sgoud@xilinx.com>
CC:     "git@xilinx.com" <git@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Topic: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Index: AQHWjZiOVGZ7Zl6mL0yA/yKrlK+ADKmfY8FAgADeQACAAAZyAIAbtN+A
Date:   Fri, 6 Nov 2020 22:29:16 +0000
Message-ID: <c7f0bbb476c90ba1a01d682eb0146cb58e1425f1.camel@calian.com>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
         <YT1PR01MB3546541973024526CDB6BBECEC1E0@YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM>
         <DM6PR02MB53868B37CD6C93BB4F9FCF98AF1F0@DM6PR02MB5386.namprd02.prod.outlook.com>
         <53ea7096-e434-182b-7734-8e5abc1af90c@xilinx.com>
In-Reply-To: <53ea7096-e434-182b-7734-8e5abc1af90c@xilinx.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-12.el8) 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfc86647-a64c-4465-b8c1-08d882a36554
x-ms-traffictypediagnostic: YTBPR01MB3214:
x-microsoft-antispam-prvs: <YTBPR01MB32148C58B1151945DED59273ECED0@YTBPR01MB3214.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D0I+zGtvmhRO/Mdq4DQ0pgC5YtxNrNRaoCVV24P7JzpNORC/rXKDQoLSQIHxC1UQ4UH/wgcxEefZfVchNtI289c8KZwEUUdGlHUIMupajjpktknDchk2Op7Fd+k9DACViTy9ZiIfpXQCVPyoYvWBrbW3xzsHtPg0NXLXL8+kxroLGotV3whGYnC42b5zxp1iTgp0gde/+vFuIs/MU+SWT2GWIgQVK9H+wfyH+Cxs/H588+ByG5pElwEx/K1f8sFmupG/bZwgMFoGQL56rS8T4jhdI69M9B0sT2UdHKpFgHhRxGOCZd8Hc2QgO06GalVFXPOS8jgjxuVTCLbR0lnM7mkc8YNC4eKQFzfwPPkAXT+jUMxyE1k/ddEglSrxpOo9WabEifwlEcJPgMQrWXATb8Xv+QRJ1enZE3V9/5D+L2S6I2KmVxZHQnt+WD410lyoW15BHHnD39ZWwGcps4Mn/1iye/iVVChtUAjcauuhKNQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YTBPR01MB3551.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(8936002)(2616005)(54906003)(2906002)(66476007)(6506007)(36756003)(15650500001)(6512007)(4001150100001)(66946007)(86362001)(478600001)(15974865002)(66446008)(76116006)(71200400001)(186003)(66556008)(26005)(6486002)(53546011)(5660300002)(44832011)(64756008)(83380400001)(316002)(45080400002)(110136005)(966005)(8676002)(4326008)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: PyqbQQhYneke4EIkHkHG1V+lpOrY7YS25L8yxW5cPan2suuYsFWrkbYyCDNAS4al+obERqSlESRqS1oKvh7fD1P42QAu+2sYy102jLpLd/pQXIR7G5n3MRf3kINYAP+IQTasLiJKOr+9eau3Q5J2Fkwm//peNsiZdCGSflC9JmyNanq4RrPOdWI/ABQG6N2ylir6JsTyDAdKG2jYG61EpAathiOS1zFtD2SAddZo2xxi65+v9CwQfksC9EAjwgLnpeBQaSwlnIPepGW0Jgl1Pi9qh47uAp8n/Ys6qYRPJI3Rs1slXSow6B1mtmFQasDtuQVVQ/es9oYNMXla2XjSLKnOJLGHshFQNmpuokRnOXuh/PgqFck76HRZqOOiBpnGIAtp4mA1gEv5IAugtwIzk5ZaCEquGeXddwejj0lxudLg4Y1RRb2yIuXwi4r/85YpdFM847xq5CUMaFjbwo148jUI3+Ix/hwl8ZmFieTpQdXzwoC5hiQBleGMhHc+I6cuSbz6nHT7gOGl65c9LpxrLiS+6QZY3Tz2n+loHIj7or6whA0vdh6T/px1lhEorVCM0ZeDDq0xfAERb9+28/06JXiA9LaYl0eBKzTHaciIYnT25PJvz0iToQXOdjePwcuofSxkqLyvSbCWj3EnnJbNfg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B297EFB6F71B6C40B72090AAC8EBD3B3@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YTBPR01MB3551.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc86647-a64c-4465-b8c1-08d882a36554
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 22:29:16.3756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdhtLk/rB4X4A7hxryPgMudusVz3YVyWtZH8tXxyt+nJFR1IvtdebOUNFLDj8GZrfRHnkDixRTZbCPNmvDOzeZzs9IgDiMfPOrthPX14v00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB3214
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTEwLTIwIGF0IDA5OjIyICswMjAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6DQo+
IEhpLA0KPiANCj4gbGV0IG1lIGNvcnJlY3QgdGhpcy4gTWVyZ2UgV2luZG93LiA6LSkNCj4gNS4x
MC1yYzEgc2hvdWxkIGJlIHRhZ2dlZCBvbiBTdW5kYXkgT2N0IDI1LiBBZnRlciB0aGF0IHBhdGNo
ZXMgY2FuIGJlDQo+IHNlbmQgYWdhaW4uDQo+IA0KPiBUaGFua3MsDQo+IE1pY2hhbA0KPiANCg0K
SGksIGp1c3Qgd29uZGVyaW5nIGlmIHlvdSBhcmUgc3RpbGwgcGxhbm5pbmcgdG8gc3VibWl0IGEg
djMgb2YgdGhpcw0KcGF0Y2hzZXQ/DQoNCj4gT24gMjAuIDEwLiAyMCA4OjU5LCBTcmluaXZhcyBO
ZWVsaSB3cm90ZToNCj4gPiBIaSBSb2JlcnQsDQo+ID4gDQo+ID4gV2lsbCBzZW5kIHRoZSBuZXh0
IHZlcnNpb24odjMpIGFmdGVyIE1haW5saW5lIFdpbmRvdyBjbG9zZS4NCj4gPiANCj4gPiBUaGFu
a3MNCj4gPiBTcmluaXZhcyBOZWVsaS4NCj4gPiANCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFu
LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxOSwgMjAyMCAxMToxOCBQTQ0KPiA+
ID4gVG86IFNyaW5pdmFzIE5lZWxpIDxzbmVlbGlAeGlsaW54LmNvbT47IE1pY2hhbCBTaW1layA8
DQo+ID4gPiBtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiA+ID4gU3Jpbml2YXMgR291ZCA8c2dvdWRA
eGlsaW54LmNvbT47IFNodWJocmFqeW90aSBEYXR0YQ0KPiA+ID4gPHNodWJocmFqQHhpbGlueC5j
b20+DQo+ID4gPiBDYzogZ2l0IDxnaXRAeGlsaW54LmNvbT47IGxpbnV4LWdwaW8gPGxpbnV4LWdw
aW9Admdlci5rZXJuZWwub3JnPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAwLzNdIGdw
aW8teGlsaW54OiBVcGRhdGUgb24geGlsaW54IGdwaW8NCj4gPiA+IGRyaXZlcg0KPiA+ID4gDQo+
ID4gPiBIaSBTcmluaXZhcywNCj4gPiA+IA0KPiA+ID4gSnVzdCBjaGVja2luZyBpZiB0aGVyZSBp
cyBhbnkgdXBkYXRlIG9uIHRoaXMgcGF0Y2hzZXQ/IEl0IGxvb2tzDQo+ID4gPiBsaWtlIHRoZXJl
IHdhcw0KPiA+ID4gc29tZSBmZWVkYmFjayBidXQgSSBkaWRuJ3Qgc2VlIGFub3RoZXIgdmVyc2lv
biBzdWJtaXR0ZWQuDQo+ID4gPiANCj4gPiA+IFJvYmVydCBIYW5jb2NrDQo+ID4gPiBTZW5pb3Ig
SGFyZHdhcmUgRGVzaWduZXIsIEFkdmFuY2VkIFRlY2hub2xvZ2llcyANCj4gPiA+IGh0dHBzOi8v
Y2FuMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJG
d3d3LmNhbGlhbi5jb20lMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q3JvYmVydC5oYW5jb2NrJTQwY2Fs
aWFuLmNvbSU3Q2QyNTEyYmQzZGJhYzQ0MWY0MzYxMDhkODc0YzhmZjMwJTdDMjNiNTc4MDc1NjJm
NDlhZDkyYzQzYmIwZjA3YTFmZGYlN0MwJTdDMCU3QzYzNzM4Nzc1MzkxODU3NTY4NCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1uaW50ajI3d3BVQ3JX
ZkNKZ2dWVEtScWFuUGlNN0FuWEg1TTJWY3N0MTRjJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gPiBo
dHRwczovL2NhbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUz
QSUyRiUyRnd3dy5zZWRzeXN0ZW1zLmNhJTJGJmFtcDtkYXRhPTA0JTdDMDElN0Nyb2JlcnQuaGFu
Y29jayU0MGNhbGlhbi5jb20lN0NkMjUxMmJkM2RiYWM0NDFmNDM2MTA4ZDg3NGM4ZmYzMCU3QzIz
YjU3ODA3NTYyZjQ5YWQ5MmM0M2JiMGYwN2ExZmRmJTdDMCU3QzAlN0M2MzczODc3NTM5MTg1NzU2
ODQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9WTAl
MkZoeTAxdHV3dnJGVUFzek1xa2l0NkMzUWFtOUt0cjFxNXZOYnFrb0xjJTNEJmFtcDtyZXNlcnZl
ZD0wDQo+ID4gPiANCj4gPiA+IEZyb206IFNyaW5pdmFzIE5lZWxpIDxzcmluaXZhcy5uZWVsaUB4
aWxpbnguY29tPg0KPiA+ID4gU2VudDogSnVseSAyMywgMjAyMCA4OjM2IEFNDQo+ID4gPiBUbzog
YmdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPjsgbGludXMud2FsbGVpag0K
PiA+ID4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IG1pY2hhbC5zaW1layA8bWljaGFsLnNp
bWVrQHhpbGlueC5jb20NCj4gPiA+ID47IHNnb3VkDQo+ID4gPiA8c2dvdWRAeGlsaW54LmNvbT47
IHNodWJocmFqeW90aS5kYXR0YSA8DQo+ID4gPiBzaHViaHJhanlvdGkuZGF0dGFAeGlsaW54LmNv
bT4NCj4gPiA+IENjOiBnaXQgPGdpdEB4aWxpbnguY29tPjsgbGludXgtYXJtLWtlcm5lbCA8bGlu
dXgtYXJtLQ0KPiA+ID4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsaW51eC1ncGlvIDwN
Cj4gPiA+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgtDQo+ID4gPiBrZXJuZWwg
PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggVjIg
MC8zXSBncGlvLXhpbGlueDogVXBkYXRlIG9uIHhpbGlueCBncGlvIGRyaXZlcg0KPiA+ID4gDQo+
ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBkb2VzIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiAtQWRkIGNs
b2NrIGFkYXB0aW9uIHN1cHBvcnQNCj4gPiA+IC1BZGQgaW50ZXJ1cHQgc3VwcG9ydA0KPiA+ID4g
LUFkZCBNQUlOVEFJTkVSUyBmcmFnbWVudA0KPiA+ID4gDQo+ID4gPiBDaGFuZ2VzIGluIFYyOg0K
PiA+ID4gLUFkZGVkIGNoZWNrIGZvciByZXR1cm4gdmFsdWUgb2YgcGxhdGZvcm1fZ2V0X2lycSgp
IEFQSS4NCj4gPiA+IC1VcGRhdGVkIGNvZGUgdG8gc3VwcG9ydCByaXNpbmcgZWRnZSBhbmQgZmFs
bGluZyBlZGdlLg0KPiA+ID4gLUFkZGVkIHhncGlvX3hsYXRlKCkgQVBJIHRvIHN1cHBvcnQgc3dp
dGNoLg0KPiA+ID4gLUFkZGVkIE1BSU5UQUlORVJTIGZyYWdtZW50Lg0KPiA+ID4gLS0tDQo+ID4g
PiBUZXN0ZWQgQmVsb3cgc2NlbmFyaW9zOg0KPiA+ID4gLVRlc3RlZCBMb29wIEJhY2suKGNoYW5u
ZWwgMS4wIGNvbm5lY3RlZCB0byBjaGFubmVsIDIuMCkgLVRlc3RlZA0KPiA+ID4gRXh0ZXJuYWwN
Cj4gPiA+IHN3aXRjaChVc2VkIERJUCBzd2l0Y2gpIC1UZXN0ZWQgQ2FzY2FkZSBzY2VuYXJpbyhI
ZXJlIGdwaW8NCj4gPiA+IGNvbnRyb2xsZXIgYWN0aW5nDQo+ID4gPiBhcw0KPiA+ID4gIGFuIGlu
dGVycnVwdCBjb250cm9sbGVyKS4NCj4gPiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFNy
aW5pdmFzIE5lZWxpICgzKToNCj4gPiA+ICAgZ3BpbzogeGlsaW54OiBBZGQgY2xvY2sgYWRhcHRh
dGlvbiBzdXBwb3J0DQo+ID4gPiAgIGdwaW86IHhpbGlueDogQWRkIGludGVycnVwdCBzdXBwb3J0
DQo+ID4gPiAgIE1BSU5UQUlORVJTOiBhZGQgZnJhZ21lbnQgZm9yIHhpbGlueCBHUElPIGRyaXZl
cnMNCj4gPiA+IA0KPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgIHwgIDEwICsrDQo+
ID4gPiAgZHJpdmVycy9ncGlvL0tjb25maWcgICAgICAgfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMv
Z3Bpby9ncGlvLXhpbGlueC5jIHwgNDA0DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0NCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM5NSBpbnNlcnRp
b25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gLS0NCj4gPiA+IDIuNy40DQot
LSANClJvYmVydCBIYW5jb2NrDQpTZW5pb3IgSGFyZHdhcmUgRGVzaWduZXIsIENhbGlhbiBBZHZh
bmNlZCBUZWNobm9sb2dpZXMNCnd3dy5jYWxpYW4uY29tDQo=
