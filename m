Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2B31325E2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGMQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:16:47 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:33911 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727177AbgAGMQr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:16:47 -0500
X-UUID: b2f3c6d48fe44b8c85c0864c38f075c2-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xUz0iKdA3Jx7oeQE3+cQqp7m0F3c8sg3JZxB5700qYk=;
        b=Wk7K5PvLmuqs0f37o3uTDVzG3WZjjykLl9vUGffeHnBc/sW3y56CjF1LVcThnsspWNWnFD16Q8ISbmVygZCL4sET33CuR6gNsRAj0y7yVCiCskpmSwqUAviZMDn0EcNq4+0CNLrqyp9XfNB31ZRVsermppVsv2W6xXxrH3mBTbI=;
X-UUID: b2f3c6d48fe44b8c85c0864c38f075c2-20200107
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 593148599; Tue, 07 Jan 2020 20:16:42 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 20:15:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 Jan 2020 20:17:15 +0800
Message-ID: <1578399400.16092.14.camel@mtkswgap22>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, <kuohong.wang@mediatek.com>
Date:   Tue, 7 Jan 2020 20:16:40 +0800
In-Reply-To: <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
         <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
         <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B7E5CF622FD1C7D1CA83D3F7690555CFE8E879EC25EAEB8C1BCCED3F2290A7CC2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTAxLTA3IGF0IDExOjQwICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCAyOjQxIFBNIExpZ2h0IEhzaWVoIDxsaWdodC5oc2ll
aEBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiBSZWZpbmUgbXRrX3BpbmNvbmZfc2V0KCkv
bXRrX3BpbmNvbmZfZ2V0KCkgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgdG8NCj4gPiBwcmV2
aW91cyBNZWRpYVRlaydzIGJpYXMtcHVsbCB1c2FnZS4NCj4gPiBJbiBQSU5DVFJMX01USyB0aGF0
IHVzZSBwaW5jdHJsLW10ay1jb21tb24uYywgYmlhcy1wdWxsIHNldHRpbmcgZm9yIHBpbnMNCj4g
PiB3aXRoIDIgcHVsbCByZXNpc3RvcnMgY2FuIGJlIHNwZWNpZmllZCBhcyB2YWx1ZSBmb3IgYmlh
cy1wdWxsLXVwIGFuZA0KPiA+IGJpYXMtcHVsbC1kb3duLiBGb3IgZXhhbXBsZToNCj4gPiAgICAg
Ymlhcy1wdWxsLXVwID0gPE1US19QVVBEX1NFVF9SMVIwXzAwPjsNCj4gPiAgICAgYmlhcy1wdWxs
LXVwID0gPE1US19QVVBEX1NFVF9SMVIwXzAxPjsNCj4gPiAgICAgYmlhcy1wdWxsLXVwID0gPE1U
S19QVVBEX1NFVF9SMVIwXzEwPjsNCj4gPiAgICAgYmlhcy1wdWxsLXVwID0gPE1US19QVVBEX1NF
VF9SMVIwXzExPjsNCj4gPiAgICAgYmlhcy1wdWxsLWRvd24gPSA8TVRLX1BVUERfU0VUX1IxUjBf
MDA+Ow0KPiA+ICAgICBiaWFzLXB1bGwtZG93biA9IDxNVEtfUFVQRF9TRVRfUjFSMF8wMT47DQo+
ID4gICAgIGJpYXMtcHVsbC1kb3duID0gPE1US19QVVBEX1NFVF9SMVIwXzEwPjsNCj4gPiAgICAg
Ymlhcy1wdWxsLWRvd24gPSA8TVRLX1BVUERfU0VUX1IxUjBfMTE+Ow0KPiA+DQo+ID4gT24gdGhl
IG90aGVyIGhhbmQsIFBJTkNUUkxfTVRLX1BBUklTIHVzZSBjdXN0b21pemVkIHByb3BlcnRpZXMN
Cj4gPiAibWVkaWF0ZWsscHVsbC11cC1hZHYiIGFuZCAibWVkaWF0ZWsscHVsbC1kb3duLWFkdiIg
dG8gc3BlY2lmeSBiaWFzLXB1bGwNCj4gPiBzZXR0aW5nIGZvciBwaW5zIHdpdGggMiBwdWxsIHJl
c2lzdG9ycy4NCj4gPiBUaGlzIGludHJvZHVjZSBpbi1jb21wYXRpYmlsaXR5IGluIGRldmljZSB0
cmVlIGFuZCBpbmNyZWFzZSBwb3J0aW5nDQo+ID4gZWZmb3J0IHRvIE1lZGlhVGVrJ3MgY3VzdG9t
ZXIgdGhhdCBoYWQgYWxyZWFkeSB1c2VkIFBJTkNUUkxfTVRLIHZlcnNpb24uDQo+ID4gQmVzaWRl
cywgaWYgY3VzdG9tZXJzIGFyZSBub3QgYXdhcmUgb2YgdGhpcyBjaGFuZ2UgYW5kIHN0aWxsIHdy
aXRlIGRldmljZXRyZWUNCj4gPiBmb3IgUElOQ1RSTF9NVEsgdmVyc2lvbiwgdGhleSBtYXkgZW5j
b3VudGVyIHJ1bnRpbWUgZmFpbHVyZSB3aXRoIHBpbmN0cmwgYW5kDQo+ID4gc3BlbnQgdGltZSB0
byBkZWJ1Zy4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBiYWNrd2FyZCBjb21wYXRpYmxlIHRv
IHByZXZpb3VzIE1lZGlhVGVrJ3MgYmlhcy1wdWxsIHVzYWdlDQo+ID4gc28gdGhhdCBNZWRpYXRl
aydzIGN1c3RvbWVyIG5lZWQgbm90IHVzZSBhIG5ldyBkZXZpY2V0cmVlIHByb3BlcnR5IG5hbWUu
DQo+ID4gVGhlIHJhdGlvbmFsZSBpcyB0aGF0OiBjaGFuZ2luZyBkcml2ZXIgaW1wbGVtZW50YXRp
b24gaGFkIGJldHRlciBsZWF2ZQ0KPiA+IGludGVyZmFjZSB1bmNoYW5nZWQuDQo+IA0KPiBBcmUg
dGhlc2UgZGV2aWNldHJlZSBiaW5kaW5ncyB1cHN0cmVhbSwgb3IgYXJlIHRoZXNlIGJpbmRpbmdz
IG5ldmVyDQo+IHN1Ym1pdHRlZCBmb3IgaW5jbHVzaW9uIGluIHRoZSBvZmZpY2lhbCBkZXZpY2Ug
dHJlZSBiaW5kaW5ncz8NCj4gDQo+IEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gZW5jb3VyYWdlIG91
dC1vZi10cmVlIG5vbi1jYW5vbmljYWwgZGV2aWNlDQo+IHRyZWUgZXhwZXJpbWVudHMuDQo+IA0K
PiBPbiB0aGUgb3RoZXIgaGFuZCBJIHdhbnQgcnVubmluZyBjb2RlLg0KPiANCj4gSSBzdXBwb3Nl
IGlmIHRoZXJlIGlzIGEgc29saWQgdXNlIGNhc2UgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
DQo+IHRoYXQgYWxzbyBhZmZlY3QgaW5kZXBlbmRlbnQgZGV2ZWxvcGVycyAoc3VjaCBhcyBwZW9w
bGUganVzdA0KPiBoYWNraW5nIGFyb3VuZCB3aXRoIHRoZXNlIGRldmljZXMpIHRoZW4gd2UgY291
bGQgYWRkIGl0Lg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0KVXNlIG9mICJiaWFz
LXB1bGwtZG93biA9IDxNVEtfUFVQRF9TRVRfUjFSMF9YWD4iIGhhZCBhbHJlYWR5IGJlZW4NCmRl
c2NyaWJlZCBpbg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmcvcGluY3RybC9waW5j
dHJsLW10NjV4eC50eHQuDQpQcmV2aW91cyBNZWRpYVRlayBjaGlwcyB1c2luZyBwaW5jdHJsLW10
ay1jb21tb24uYyBoYWQgYWxyZWFkeSB1c2Ugc3VjaA0KYmluZGluZy4gVGhpcyBpcyBzby1jYWxs
ZWQgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCg0KQmVzaWRlcywgYWNjb3JkaW5nIHRvDQpEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZy9waW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwsIGJp
YXMtcHVsbC11cA0KYW5kIGJpYXMtcHVsbC1kb3duIGNhbiBoYXZlIGFuIG9wdGlvbmFsIGFyZ3Vt
ZW50IHRvIHNlbGVjdCBwdWxsIHN0cmVuZ3RoDQp3aGVuIHN1cHBvcnRlZCBieSBoYXJkd2FyZS4N
ClNvLCBJIHRoaW5rIHRoZSBwcm9wb3NlIG9mIHVzaW5nICJtZWRpYXRlayxwdWxsLXVwLWFkdiIg
YW5kDQoibWVkaWF0ZWsscHVsbC1kb3duLWFkdiIgaXMgbm90IG5lY2Vzc2FyeS4gSG93ZXZlciwg
SSBmYWlsIHRvIHN0b3ANCnVwc3RyZWFtIG9mIHVzaW5nICJtZWRpYXRlayxwdWxsLXVwLWFkdiIg
YW5kICJtZWRpYXRlayxwdWxsLWRvd24tYWR2IiBpbg0KcGluY3RybC1tdGstY29tbW9uLXYyLmMu
DQoNCkxpZ2h0IEhzaWVoDQoNCg0K

