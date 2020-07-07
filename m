Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980FB216C50
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGGLvG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:51:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16322 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726540AbgGGLvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:51:06 -0400
X-UUID: 6ab93ad5c0504bb0a3ec9e4173deeb98-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3DMwV/Z8QcDuKhf5FKYuKYw/6Ttsn7FiYmhH2inyuNw=;
        b=m598dhivIyoCn7FiBFuIc58LWXG6u95+ulaNEoVwAOdRRF2akGZ6x42B7UGAFNAt9Jt8y2yXjjZGi1BkHdFZtQ7jGTkUXIwNSOCdAm7/niV24oBxpH2m7UHzky0m9M8K35e5iN3+fIdYViyb6eaNpBK1tVDDCiH0NJkDh+j/kwY=;
X-UUID: 6ab93ad5c0504bb0a3ec9e4173deeb98-20200707
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1135623474; Tue, 07 Jul 2020 19:51:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 19:50:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 19:50:59 +0800
Message-ID: <1594122662.24451.2.camel@mtkswgap22>
Subject: Re: [PATCH v7] Add basic SoC Support for Mediatek MT6779 SoC
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Date:   Tue, 7 Jul 2020 19:51:02 +0800
In-Reply-To: <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
         <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA3LTA3IGF0IDEzOjQxICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUaHUsIEp1bCAyLCAyMDIwIGF0IDI6NTcgUE0gSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBt
ZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiBDaGFuZ2Ugc2luY2Ugdjc6DQo+ID4gQ29tbWl0
ICJkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJpbmRpbmdzIGZvciBNZWRpYVRlayINCj4gPiAt
LSBmaXggdHlwbyBhbmQgY2hhbmdlIG9yZGVyIG9mIHBhdGNoDQo+ID4gQ29tbWl0ICJjbGs6IG1l
ZGlhdGVrOiBhZGQgVUFSVDAgY2xvY2sgc3VwcG9ydCINCj4gPiAtLSBhZGQgZml4ZXMgdGFnIGFu
ZCByZWFsIG5hbWUNCj4gPiBDb21taXQgImFybTY0OiBkdHM6IGFkZCBkdHMgbm9kZXMgZm9yIE1U
Njc3OSINCj4gPiAtLSBleHBvc2UgYWxsIHRocmVlIFVBUlRzIGluIHRoZSBkdHNpDQo+IA0KPiBP
aCBJIHNlZSB0aGVyZSBhcmUgc3RpbGwgZGV2ZWxvcG1lbnQgb24gdGhpcyBwYXRjaCBzZXQgc28g
SSB0b29rIG91dA0KPiB0aGUgcGF0Y2hlcyBJIGFwcGxpZWQgYWdhaW4uDQo+IA0KPiBXYWl0aW5n
IGZvciB0aGUgZmluYWwgcmV2aWV3ZWQgdmVyc2lvbi4NCj4gDQpUaGFuayB5b3UgZm9yIHRha2lu
ZyBhIGxvb2sgb3ZlciB0aGVzZSBzbyBxdWlja2x5IQ0KDQpHb3QgaXQsIEknbGwgc2VuZCBhIG5l
d2VyIHZlcnNpb24uDQoNClRoYW5rcyENCg0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQo=

