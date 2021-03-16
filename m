Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A088C33CDCD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 07:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhCPGKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 02:10:48 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:58898 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235749AbhCPGK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 02:10:28 -0400
X-UUID: db2040add5c44cb0b6f8c3f5419bebe9-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FkZGHytsgs955UTmW2uQrKqZUSuzH4HOG79H2hLEryo=;
        b=U4Dq/ykytFoenN+pMHFn8saj375x3DSjizQYGrFYWAuKY/wWrgZWZWNboIO3GNJHcorJEtNCXS0gGheY2Sb457Cxg0jqxzmnYpX41II1Lpc/a5iIjh1EUtEiSgqPpS02bJfAbzl0eJ/duianOC//ux46w3CRgKnTBi1fIkMGR00=;
X-UUID: db2040add5c44cb0b6f8c3f5419bebe9-20210316
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 876990971; Tue, 16 Mar 2021 14:10:25 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:10:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 14:10:20 +0800
Message-ID: <1615875020.11060.1.camel@mhfsdcap03>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
From:   zhiyong tao <zhiyong.tao@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <hui.liu@mediatek.com>,
        Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= 
        <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= 
        <erin.lo@mediatek.com>,
        "Sean Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?=" 
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <sj.huang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date:   Tue, 16 Mar 2021 14:10:20 +0800
In-Reply-To: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
References: <20210312063502.3685-1-zhiyong.tao@mediatek.com>
         <20210312063502.3685-2-zhiyong.tao@mediatek.com>
         <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 214DA13DA4340811ED1F8D29BF8856DE9D759CE9D7346FA589D3BCD2733CB6912000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIxLTAzLTE2IGF0IDEzOjA1ICswODAwLCBTZWFuIFdhbmcgd3JvdGU6DQo+IEhp
IFpoaXlvbmcsDQo+IA0KPiBPbiBGcmksIE1hciAxMiwgMjAyMSBhdCAyOjM1IFBNIFpoaXlvbmcg
VGFvIDx6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gV2hlbiBtdWx0
aXBsZSB0aHJlYWRzIG9wZXJhdGUgb24gdGhlIHNhbWUgcmVnaXN0ZXIgcmVzb3VyY2UNCj4gPiB3
aGljaCBpbmNsdWRlIG11bHRpcGxlIHBpbiwgSXQgd2lsbCBtYWtlIHRoZSByZWdpc3RlciByZXNv
dXJjZQ0KPiA+IHdyb25nIHRvIGNvbnRyb2wuIFNvIHdlIGFkZCBsb2NrIHRvIGF2b2lkIHRoZSBj
YXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhpeW9uZyBUYW8gPHpoaXlvbmcudGFvQG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbXRrLWNvbW1vbi12Mi5jIHwgNCArKysrDQo+ID4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1jb21tb24tdjIuaCB8IDIgKysNCj4gPiAgZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtcGFyaXMuYyAgICAgICAgIHwgMiArKw0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYw0KPiA+IGluZGV4IDcyZjE3ZjI2YWNkOC4uZmNm
N2MzZWVlZTRhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5j
dHJsLW10ay1jb21tb24tdjIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuYw0KPiA+IEBAIC01OCwxMCArNTgsMTQgQEAgdm9pZCBtdGtf
cm13KHN0cnVjdCBtdGtfcGluY3RybCAqcGN0bCwgdTggaSwgdTMyIHJlZywgdTMyIG1hc2ssIHUz
MiBzZXQpDQo+ID4gIHsNCj4gPiAgICAgICAgIHUzMiB2YWw7DQo+ID4NCj4gPiArICAgICAgIG11
dGV4X2xvY2soJnBjdGwtPmxvY2spOw0KPiA+ICsNCj4gPiAgICAgICAgIHZhbCA9IG10a19yMzIo
cGN0bCwgaSwgcmVnKTsNCj4gPiAgICAgICAgIHZhbCAmPSB+bWFzazsNCj4gPiAgICAgICAgIHZh
bCB8PSBzZXQ7DQo+ID4gICAgICAgICBtdGtfdzMyKHBjdGwsIGksIHJlZywgdmFsKTsNCj4gPiAr
DQo+ID4gKyAgICAgICBtdXRleF91bmxvY2soJnBjdGwtPmxvY2spOw0KPiA+ICB9DQo+ID4NCj4g
PiAgc3RhdGljIGludCBtdGtfaHdfcGluX2ZpZWxkX2xvb2t1cChzdHJ1Y3QgbXRrX3BpbmN0cmwg
Kmh3LA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstY29tbW9uLXYyLmggYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmgNCj4gPiBpbmRleCBlMmFhZTI4NWI1ZmMuLjY1ZWFjNzA4YTNiMyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgN
Cj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYy
LmgNCj4gPiBAQCAtMjUxLDYgKzI1MSw4IEBAIHN0cnVjdCBtdGtfcGluY3RybCB7DQo+ID4gICAg
ICAgICBzdHJ1Y3QgbXRrX2VpbnQgICAgICAgICAgICAgICAgICplaW50Ow0KPiA+ICAgICAgICAg
c3RydWN0IG10a19waW5jdHJsX2dyb3VwICAgICAgICAqZ3JvdXBzOw0KPiA+ICAgICAgICAgY29u
c3QgY2hhciAgICAgICAgICAqKmdycF9uYW1lczsNCj4gPiArICAgICAgIC8qIGxvY2sgcGluJ3Mg
cmVnaXN0ZXIgcmVzb3VyY2UgdG8gYXZvaWQgbXVsdGlwbGUgdGhyZWFkcyBpc3N1ZSovDQo+ID4g
KyAgICAgICBzdHJ1Y3QgbXV0ZXggbG9jazsNCj4gPiAgfTsNCj4gPg0KPiA+ICB2b2lkIG10a19y
bXcoc3RydWN0IG10a19waW5jdHJsICpwY3RsLCB1OCBpLCB1MzIgcmVnLCB1MzIgbWFzaywgdTMy
IHNldCk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LXBhcmlzLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jDQo+ID4g
aW5kZXggZGExZjE5Mjg4YWE2Li40OGU4MjNmNmQyOTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCj4gPiBAQCAtOTcwLDYgKzk3MCw4IEBAIGlu
dCBtdGtfcGFyaXNfcGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0K
PiA+DQo+ID4gICAgICAgICBody0+bmJhc2UgPSBody0+c29jLT5uYmFzZV9uYW1lczsNCj4gPg0K
PiA+ICsgICAgICAgbXV0ZXhfaW5pdCgmaHctPmxvY2spOw0KPiA+ICsNCj4gDQo+IENvdWxkIHlv
dSBoZWxwIGFkZCB0aGUgbXV0ZXggaW5pdGlhbGl6YXRpb24gaW50byBwaW5jdHJsLW1vb3JlLmMg
dG9vPw0KPiBhbmQgdGhlbiB0aGUgcGF0Y2ggd291bGQgbG9vayBnb29kIHRvIG1lLg0KDQo9PT5I
aSBzZWFuLA0KV2Ugd2lsbCBhZGQgYWRkIHRoZSBtdXRleCBpbml0aWFsaXphdGlvbiBpbnRvIHBp
bmN0cmwtbW9vcmUuYyB0b28gaW4gdjIuDQoNClRoYW5rcy4NCj4gDQo+ID4gICAgICAgICBlcnIg
PSBtdGtfcGN0cmxfYnVpbGRfc3RhdGUocGRldik7DQo+ID4gICAgICAgICBpZiAoZXJyKSB7DQo+
ID4gICAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImJ1aWxkIHN0YXRlIGZhaWxl
ZDogJWRcbiIsIGVycik7DQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPg0KDQo=

