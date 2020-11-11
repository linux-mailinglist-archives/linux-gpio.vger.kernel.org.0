Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CDA2AE940
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 07:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgKKGyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 01:54:22 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17182 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgKKGyS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 01:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605077658; x=1636613658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XIYJBdV16zZKrJVlbFxYtokJtGft5mJv/rcuv2o2SqU=;
  b=iC0U+UWHD4gYxbgnTLnMdA7yD85ROI9MrQFTH3DrIOLh/RFUk2nkeHS0
   h7TptjdHzTam/4TdT3pbsuot3Xd5L32Mr82MXD3ih2hbDAX8M15vbbuNF
   vCP8pL6qs+zZRoHEcZspsIdFM2xngMKbAlAZgBrU+zkif3Hl8a2eKNGa0
   StXOKolUrzm3gW5dIXyDA1vsI9TpxJt8c3aGhkBCDQHa7A7zbMhwPMkEO
   8J1O05syrwXdNQZKFUFb0ZquDaB0o+V1heHtXckVnn4LJwC2R0uv+13Vy
   hzPRdwLkHtISSnsDf51cvqB0HuGH3smqYs5FXQ5ey7E5u5QLkZl1NRLdb
   w==;
IronPort-SDR: ayoSJVmtd0Vrwfs2uJsqnm1CobGPdS+QxkDP6ZAjsDkvPSR23aIldUdYb/AL5lqj+yieD6qTkR
 c7j5/Vn8rcTzH2BN0c11Xh9hayM3kCSjsaG5rD6Uv9rSYVI5hQlfX3iqaCJsn4VyrYPpoQDd4e
 wI7VpTbqgCu+iQ/KwntLq7vBqN5Kol4YBU6zCUXhWVJpAXe2GZWot7oF/IGvo0407Zfqt0DQX4
 I7gvp3Y+IH9if5DiiecFAXX2RYnnxYCm+2vFRv39i5VlREMoGg9X/tSrRrQmaI2tqCZGgHBWW8
 hpo=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="156845525"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 14:54:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+8GIDIy2go1OIyBYjxo+2iceyf+nwqbUs1jTDueYnMJYiQ+rkPMAzFlbq+5zPrHQv3ckZ0k6AHmVhvvP8Xxq6ouMSx3ElzC1XUcsKUDhtrBDMD+P7vbNmehTNQryWbC2S2T8EEJ82hi6s3DtiGqgJ5/HGp0V2MHOZAJ40LQfsWHqSlZi2imKUvow31FFm+LAhAcQy8JPRrZbNre8Fw1Yo/c9OBgntmEPRgkTkDM+PmOPd5X3REEVnxIxu5yCNfsu/4z3N0LEHg1ImwNPAwqavXTonjrpauPDCXIY+vXcoearcuhZzewIN90Gr0KL0fYrjwYWN8FkMDhvPgkPhyl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIYJBdV16zZKrJVlbFxYtokJtGft5mJv/rcuv2o2SqU=;
 b=J1vVQusmyxX/UEfwA9m9KBdQ3ffs/XjuvaKLgaMhOw53Awmc5HfCuFnlF9x3dkY+hntkGGFPI5m6zwzVffB41nvN6idnPiqM3CAj2IfPYwCmBDHg9BuaSkIOUm521n1goSp9wYemMPkP27/4/6ZIiajDhvuytbs4w/2gliyZjESW8IVRSUZe2ltMONyiHr10nRVqEY6jvfNRmZFX5qpY29g6mv1MNffqzTocRrN5vGb0qpccji3BJkrZD//UoRopJTLEUNWRIvGVtb/W1EW/vXUfaXgo+hSdf9VPL6g6Z09aX70x1uTkwo3NuDHL6rSk9n/3YGeIex+cr6dnVsR77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIYJBdV16zZKrJVlbFxYtokJtGft5mJv/rcuv2o2SqU=;
 b=W5Ta1UQP+Viv2Se6Bzg6FGjmncBtiq6WYOH8wFXhP5mXNVxK32EgXMjXufPhtZze36CxbTkaQn/Aemjo5rkIbCjHFmVRYqSvvbpjJpl9hF7hSBvOBOG7ooyTc9mKNxjE954dYpFFcXVqznZIVSzFHTahBvOsNN4144CORT2xDKI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4849.namprd04.prod.outlook.com (2603:10b6:208:5d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 06:54:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 06:54:15 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Topic: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Index: AQHWtB8gKEjfkBkVokSF5N6+r8ArFKm691UAgAZ8wICAARKbAA==
Date:   Wed, 11 Nov 2020 06:54:15 +0000
Message-ID: <b551cfa97c1ee0aa892d80454a47ed859b9a420c.camel@wdc.com>
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
         <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
         <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
         <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
In-Reply-To: <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a18efba2-4a8b-41a6-45a2-08d8860e9a9a
x-ms-traffictypediagnostic: BL0PR04MB4849:
x-microsoft-antispam-prvs: <BL0PR04MB48494C5D8EDE24FFF3537A81E7E80@BL0PR04MB4849.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pc04gCts+H49Z6ZUBvubeM60avcE6Y7DE07o1COAJBkkZOW3k3+mslbndVflmUOye3PPrEsPliG6hIibUvE7n+/EIZJOXH4dkdMAIscc4u9BEkQxX2XmzMQtn+tQkIC0NX2Ds7ZR5BAAaVz8FisqZ9zDaLMmrJlBCzVYV5t8GndrV4NXKrxihMgam+ZrNxlXxRI4hLQPZHLJh3Q9fvGe5j5KRf2ieJMq3+yMK8MkKUpi4n6t/ClKInOAhIGqW9e/UsP2w1FvQ7mtck6r7ZxTE1MCUGFafLSzV2kxzyNHQmJWFu4dZ5HxUSGumoWUBj63X3aJOCzfDMShfBfOqvq2oQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(4326008)(71200400001)(2906002)(6486002)(86362001)(8936002)(186003)(66556008)(76116006)(2616005)(4001150100001)(6506007)(6916009)(53546011)(478600001)(36756003)(8676002)(6512007)(66946007)(316002)(66476007)(91956017)(5660300002)(66446008)(54906003)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: VGCGf4YM18XS1nvn0v6owZPYr10lZtP5d2sKNHEmMmh3yIkT47iabMwBg0PxtHdC0/9ygAJ2XZBb3uMzCFcaIIY7ZMPjo6rusD+Fxb8Nrb4vOVCPYKy84X4YtrdTbg52gc0J7SvueQdS9I3+cJOCNaLmBxMyL3Y7zaY6Ru+ZLGxrmJbtrYrIRLY3EaGN25SMQu4uvukxO5rs4MEZ2oHxKcgtb2+J6j/PYHHXR2k/eHlNhuC+3u3+8qGmeUsRh4I9hjA+wU/Qj1LJsBBUaGj0A5l6InwbBqxGoNKk0eHAUPOh+m6eObxR5/Y+aj3xD0bGcAwdJk2EvOS3FSP9gZxSTiX/m0YftRPxJClDAQojS2BvL8nvUp303yBJYzO/2v2+jVqC4hEI7Tgc/WO3PEzM7bmZ/P4EGxvrBbMByqUu2tQKIURTk2nj9FdQJWvU+1wjHQc6JcDy/6tLccuKkr1ldnNZc27IxdUtuNyzZr00O2/KUUBu80Vich44pPffi3cWJ5YJ/tHuFCNZeDJHuHXZbrDiI+DbbTxSBhrfntLVRmZfCFyFpHCgE3hiPxjjawtmlZfOIY+9Vs/lc49uDofrlgvrg2OCyHGbkSDKPiuEs+pfeF2AH4f3Wn197jbAnW7WCarRTzrtl3+5d9DQnitj0jmdI60XYIX7mYAbJhsk0x6xMQ/ZZg06t9JkGbgB0lD5SrfZcaan6fKuTQtW7QAzsw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBD99B49528B4A43B53419EDA6D32CBF@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18efba2-4a8b-41a6-45a2-08d8860e9a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 06:54:15.3589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5IBNW7foCgazjZb7LYzqkJO8miSnWUY96tNiE07PYUoMtVUc7jPckRyPnzGdhl6rUKxMVs3WSZexnMmzCq3Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4849
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTEwIGF0IDE1OjMxICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBGcmksIE5vdiA2LCAyMDIwIGF0IDEyOjI3IFBNIERhbWllbiBMZSBNb2FsIDxEYW1pZW4u
TGVNb2FsQHdkYy5jb20+IHdyb3RlOg0KPiANCj4gPiBJdCBtYXkgbm90IGJlIHRoZSBiZXN0IGlu
dGVyZmFjZSBmb3IgcmVndWxhciBlbmQgdXNlcnMgdG8NCj4gPiBtYW5pcHVsYXRlIGdwaW9zLCBi
dXQgaXQgaXMgZGVmaW5pdGVseSBzdXBlciB1c2VmdWwgZm9yIGRldmVsb3BlcnMgdG8gZG8gcXVp
Y2sNCj4gPiB0ZXN0cyBvZiB0aGVpciBzZXR1cC9kcml2ZXJzICh3aGljaCBpcyB3aGF0IEkgZGlk
IGZvciBteSB3b3JrIHdpdGggdGhlIEtlbmRyeXRlDQo+ID4gSzIxMCBSSVNDLVYgU29DIHN1cHBv
cnQpLg0KPiANCj4gSXQgaXMgYSBiaXQgZGlzY291cmFnaW5nIHRoYXQgUklTQy1WLCB3aGljaCB3
YXMgaW52ZW50ZWQgYWZ0ZXIgd2UgYWxyZWFkeQ0KPiBvYnNvbGV0ZWQgdGhlIHN5c2ZzIEFCSSwg
aXMgZGVwbG95aW5nIHRoaXMgZm9yIGRldmVsb3BtZW50IGFuZCB0ZXN0Lg0KDQpUaGlzIGlzIG5v
dCBhIFJJU0MtViB0aGluZy4gSXQgaXMganVzdCBtZSB3aG8gZm91bmQgc3lzZnMgdmVyeSBjb252
ZW5pZW50IGZvcg0KdGVzdGluZyBteSB3b3JrIG9uIHRoZSBLMjEwIGJvYXJkLiBJIHdhcyBub3Qg
YXdhcmUgdGhhdCB0aGUgc3lzZnMgR1BJTw0KaW50ZXJmYWNlIGlzIGJlaW5nIGRlcHJlY2F0ZWQu
IEkgaGF2ZSBhZGRlZCBpdCB0byB0aGUgSzIxMCBkZWZhdWx0IGtlcm5lbA0KY29uZmlnIGZpbGUu
IEkgd2lsbCByZW1vdmUgaXQuIA0KDQo+IFdlIG5lZWQgdG8gdGhpbmsgYWJvdXQgYSBzaW1pbGFy
IGZhY2lsaXR5IGZvciB1c2VycyB3aGljaCBpcyBsZXNzDQo+IGRhbWFnaW5nIGJ1dCBmdWxmaWxz
IHRoZSBzYW1lIG5lZWRzLiBJIHRoaW5rIEkgc2F3IHNvbWV0aGluZyBhIHdoaWxlDQo+IGJhY2sg
dGhhdCBsb29rZWQgcHJvbWlzaW5nIGFuZCBhZGRlZCBzb21lIGZ1bmt5IGZpbGVzIGluIGRlYnVn
ZnMNCj4gaW4gYSBoaWVyYXJjaGljYWwgbWFubmVyIHBlci1ncGlvY2hpcCBpbnN0ZWFkLiBUaGF0
IGlzIGhvdyBkZWJ1Z2ZzDQo+IHNob3VsZCBiZSB1c2VkLg0KDQpJIGxpa2UgdGhpcyBpZGVhIHRv
by4gVGhlIHBvaW50IGlzIChteSBvcGluaW9uIG9ubHkpLCBhbnl0aGluZyB0aGF0IGFsbG93cw0K
cXVpY2sgdGVzdGluZyB1c2luZyBvbmx5IGEgc2hlbGwgd2l0aG91dCBhbnkgZXh0cmEgdG9vbGlu
ZyBuZWVkZWQgaXMgZmluZS4NCkV4dHJhIHRvb2xpbmcgaXMgbm90IHJlYWxseSBhbiBpc3N1ZSB3
aGVuIHVzaW5nIGEgZnVsbCBkaXN0cm8sIGJ1dCBpdCBjYW4gYmUgYQ0KcHJvYmxlbSB3aGVuIHdv
cmtpbmcgd2l0aCB0aGluZ3MgbGlrZSBidWlsZHJvb3QgKG9yIGJ1c3lib3ggZGlyZWN0bHkpLiBB
bmQNCmluZGVlZCwgYXMgaXRzIG5hbWUgaW1wbGllcywgZGVidWdmcyBzZWVtcyBsaWtlIGEgZ29v
ZCBhbHRlcm5hdGl2ZSB0byBzeXNmcy4NCg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoN
Cg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=
