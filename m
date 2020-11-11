Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934752AE947
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 08:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKHAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 02:00:22 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:56644 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKHAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 02:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605078020; x=1636614020;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
  b=SABW2SF7/ak1GnSe+Zn0sGO2/Udwrcb5plqtSQdRJg2spGvuZA9TG6kj
   MBqA/CH80KzfOFX0UzrzQrfcS2Biarl18Co5y4i/OpJgmgA+puGq0sF5O
   UA2TwK5W8GNM2tqkukok8LQh2ysuoaEo3sSu8ykStIjh0f4+E47+BYNMp
   3rGPSfrM0NN2E8T6rZicaAZ9AkdVoTJ8eoMcxkCimRuRZVEEyHkXqCmHn
   ubYSxRHgEFdYGWbKFA7gKIFONAt5K6Mm8ZZ6rKTgRLuF2BS/1u6hc8Pc3
   /lm2iRDVX/Byfik1SmEJLQGAMzKGZd1JDrj8NIgY36Sh64pbotl4z4FjL
   w==;
IronPort-SDR: cX8huQ16t1oZd+4UHiNM1jUwNgrhhYnhqYGGOfKF417qKdtFpsvX806e2mSJ0P8DnFbAJoWBoB
 EBbQ+4PClBjAyXGo+IwWdK6ETojKSqp0YwizxM8QoJG0U1AwwlY4dKTP4cob5I+qlhF1tedGjX
 Z8T+sukW31i9MMYfGppv2MwimFrDgWWLxZeUsXXL+NxKTmlT3o4wkUOH8+xIT5/q+HV9W9MxLP
 irA/zdzXTK2GSyqbQBuzUzXtRZw6TlI7WAr0F8IJPId7LQmfYqGDeDH6ckeAADUsPxD1iwNOm5
 CQc=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="152460024"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 15:00:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUojskjIJkMRMNcqmOioFmj1NjpOheD2CUak76N+hX4jPCXeFHfzoDcctM66k/LO6Mh+bJ7PQSdleCvh0S/Akm5fDtXDYZT5WnBc9onXlANiOHG9J5T4649KDtB7+J5tHH20tRvPjZUW3VtOI6T01MQ59dRwpPROQQtW9QwSp79iiOoGd9ebAWlhirdDVqIw+7bPIop0L8XlLtxT/47IL6ZOleYKr/3DrIkkmiybDboUVYxHHHrJ4qy/gKWJMgX2lFUbBMh/pX8FbB8QY1XRoorP0xIJKwbf3DpJk5ssOPed0VV/8pm65/AI1/C2WmAb6Wu2J0wSfv+poUv0PDjVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
 b=GDjI8jotGPmf6e2kSctlPH4FFfwrpcf2HmX89XYfCl4Sz4g8sD6MR3fKCRHEsDYkInK+b0kLkXr1DMG+z0n7ICuY7m2NowsI1AKA5lW2hBSFNUV5R6N7wMdj+XZFDXerkPJy6FWxcQpA1VkBL0dt933cqEQh/+XHV5vQeK+VQFL76AsFldyE+Xa+m5YfGgu/K5zq2SBl4zk4L5llPM1rVXqGu9EodRdl4CCOUeOY12yXlMRuLh9LczzMKWDFLUjo58o5lvVkWXNUYnXQQLRKVLKOMKsOqeg9OdtUSWyDUSIel0y8A5WkdByXCoXW1VIAdn1yhklsL073ThkD+5CVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
 b=xRMcld38xh6gs/KnpuY1X0Ox4N8V2zUgkfwV5+6BJ0oWtbBBx0KiLLONVGUdZRkN5g0ENipjoIXDCtjGWqU2ZeO3IYZYANwSoIQm7RW3gdlR8JOAoddPv4dVshUyymNaOmfB54YLJFi/11R3VfCpdZorQbus0uLw+LPtArM2hKM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6349.namprd04.prod.outlook.com (2603:10b6:208:1ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 11 Nov
 2020 07:00:18 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 07:00:18 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Topic: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Index: AQHWtN4SvWrZLi+A80GAPGjcz+Y8EKnBdPyAgAER54A=
Date:   Wed, 11 Nov 2020 07:00:18 +0000
Message-ID: <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
         <20201107081420.60325-10-damien.lemoal@wdc.com>
         <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
In-Reply-To: <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 3f922fbc-c74f-4005-1fdd-08d8860f733f
x-ms-traffictypediagnostic: MN2PR04MB6349:
x-microsoft-antispam-prvs: <MN2PR04MB63498D57052A1000F411496DE7E80@MN2PR04MB6349.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA8Or/Qr11KbkiqjdsbOk6Uk1pk1IOX8d51VgZVikp1Ykb6ohdhKzO1pxnOVIwBAa40Tz4oGntOoiQoieJRa6pi9Nwbc86bVrLE7lCN39XnNwaEebAcuVGWH1MgcsibwrYZ1dFv2YzFAtkJQSydJix5+xEErjIge12gyaapHpDRyKnTsn0U5grQ3NOLe/lUqfo+OJr5K4cWGfvpWCkK2DApbOuGYQJLraEoHVO4khI5ZR4srCD8AmPDx8RAL8KOi4ZU/gQt52h6Z4LUMTOz4ibNLuXEd+BHqQyI7hU8bmhXA/j+uFaKa3Qqw5gLbMIGvbYp3ZZPTjphAzA51aZChUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(66446008)(4001150100001)(478600001)(76116006)(316002)(186003)(6916009)(66946007)(71200400001)(2906002)(91956017)(36756003)(8936002)(6512007)(53546011)(2616005)(8676002)(6486002)(4326008)(86362001)(6506007)(64756008)(4744005)(66556008)(54906003)(5660300002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Fhol5WWON0yVN7vaRZGqPEMGaaKuBtRaRert5JWyAsRw1N9ZzUQQH0XUm+5CMaVnw6HeT+aKqJav+tLA6LVtwOkCkqO0CinldZOtSkIQD+ZZILgPsYQN8NPaT2CAEJAjyfbTb3C3hJJtYIE9Hffa0wlcv5ua+LAw+nE6Y3gEmeoTLgPlyeqP0bQ2m/6uRFo6tX3b4gjx1rAdz3ND5DW4J2CIAtARRiCfO8objY6upZziLaNurkrvh/FUZYRnWN+DdFcbwHDUETrbcnY8ywcfxm8K1T0fwFe7Ru/7YnVqBUhLqKdKSPkvQCzXa86NpAnQCjqXpmn42DmuA3DiP00m1v0n0b3MH6Bv5fDB++oCDBaCEvflBTOvcGGbuR2yk8OoIrAaKoPwUUegPIRQxYKRLC72LmqQENdQbbNkH0AZWWCJTlaO1NeK6x+mdZ6PvCAJV75wkIwS7Cul50FhZxHblEIw3LkpYNLILMe3+7rs3hsYf61tlIbTdDyzMSkzVH/0XLaHCBFbqIGdEdIr1X/GfAf839bcxgaUL+D0KUXsnEb4eq6TOflo36J+U/RDds+69hdHiyDmAzj87/ioUxzJh5KEEY2G+Za8g3Jz3I0J5Mm6xQsn1DUkD8LcCztp02CGoQdh1/kMhU5YUoCtNnAJhfHCwLacwZev7DaRYSUFTqNc6JYd+OEIhfsq6ytIoSgcnIm0krIcU+SwqHTHo9PmYA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DC6AADD477D844998E36956957BA0C3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f922fbc-c74f-4005-1fdd-08d8860f733f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:00:18.7664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPpVw6vyeNMw5X7mVX8HYAt4X8YwAXHfbP7togtlcW9pyNnNsNC8wBrU0D8bXkcW6BcInsY47MymS1+46C+Bmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6349
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTEwIGF0IDE1OjM5ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBTYXQsIE5vdiA3LCAyMDIwIGF0IDk6MTQgQU0gRGFtaWVuIExlIE1vYWwgPGRhbWllbi5s
ZW1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEZpeCB0aGUgY2hlY2sgb24gdGhlIG51bWJl
ciBvZiBJUlFzIHRvIGFsbG93IHVwIHRvIHRoZSBtYXhpbXVtICgzMikNCj4gPiBpbnN0ZWFkIG9m
IG9ubHkgdGhlIG1heGltdW0gbWludXMgb25lLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERh
bWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+DQo+IA0KPiBJIGp1c3QgcmlwcGVk
IHRoaXMgcGF0Y2ggb3V0IG9mIHlvdXIgcGF0Y2ggc2V0IGFuZCBhcHBsaWVkIGl0IHRvDQo+IHRo
ZSBHUElPIHRyZWUgd2l0aCBzb21lIG1pbm9yIGNoYW5nZSB0byB0aGUgc3ViamVjdC4NCg0KVGhh
bmtzIGZvciB0aGF0LiBJIHdpbGwgcmVtb3ZlIHRoaXMgcGF0Y2ggZnJvbSBWMiBvZiB0aGUgc2Vy
aWVzLg0KDQpJIGp1c3QgcmVhbGl6ZWQgdGhhdCBJIGZvcmdvdCB0byBhZGQgYSBGaXhlcyBhbmQg
Q0Mgc3RhYmxlIHRhZ3MuIFRoZSBwYXRjaA0Kc2hvdWxkIGhhdmU6DQoNCkZpeGVzOiA5Njg2OGRj
ZTY0NGQgKCJncGlvL3NpZml2ZTogQWRkIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUgU29DcyIpDQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KDQpEbyB5b3Ugd2FudCBtZSB0byByZXNlbmQgdGhl
IHBhdGNoIHdpdGggdGhlIGFkZGVkIHRhZ3MgPw0KDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2Fs
bGVpag0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwNCg==
