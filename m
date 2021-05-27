Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328333931AA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 17:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhE0PF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 11:05:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:52180 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231419AbhE0PF7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 11:05:59 -0400
IronPort-SDR: m3NyxJZojmB9cOhxkTnkSUozvx0ojZH3NosuBqHt7XshVtMkRnkg9WWXMki8w2GqblSOShNtuY
 uEDo2UhAGq3g==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="266642909"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="266642909"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 08:04:24 -0700
IronPort-SDR: jTvnA3riL/JZvYSHVDekIvz+v0+PQdwP3vLM3sD6DRKxDk/RIovtwzT4/wFr+Oe7pKzKw5UstA
 j1RuNEAVezZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="480618874"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2021 08:04:24 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 27 May 2021 08:04:23 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 27 May 2021 08:04:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 27 May 2021 08:04:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 27 May 2021 08:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7XxOTpHbtQaTpM4vrs00GPEpGoO07rYNmtRbg+9roj4IFqJ6GNndKHvJDystHHKiH2r5TGlNXV/2EzsWxaQyFyK4R22TFiV/+cXLlqOkPzA8KdM7jEV0ggNiDBvgPADxvLqJ0aHlvt2lixJ/d8wzOmNjat5UkgQTDRfZt+U7Qf6bNhupQhnoeGMiY6sybG2izZ6hBcGwbH+tCNM1+tfOcqNOcV8LxslBQoCqM6lLhApXHz8xU+g5cAQf2Ar/70nfhhJZtcsxPvtxxVwPyYP+vk/wLWb/lc29ZzwikvRYxh950k6lMjgqlXC9pvwnw54nJmu4SXMY1YEX9p3d+mziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9ynGIpeWeOEAbeiAqptuDFp8zdJlDMFofYxfP3yISI=;
 b=n1SOkpoLEsBO+7mLKskF+yeGDD7sjrM1c8x0dXhjdDXld12H0XD0ogrfmS04is2lXcYFSgHPfchoqOesEX8J2QsSKmYWcvbEJbrEeQJjPmGRcMZ0hi6W+3OcnfhiBBNdTYKaYGgJm+QkjgqirladIfD05XBtMZtAQxw88byBLVP37Uw/MfebcNEIw3DEYJiYrGWtfuLyQN8oFiK/zfgTVSUbIgyiG+nEoN7I9cHrow3upUlJ9hW+Ef+gLEBcMmV+X74zLKIW7Nc1xf5Fttvb66SBRfyQlKpBXTbFQf6h12lCIytxri4WHl4Uj30IMVUi3BmabRLv4V1pFTxpzwotpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9ynGIpeWeOEAbeiAqptuDFp8zdJlDMFofYxfP3yISI=;
 b=cDMy2SnO3dyRpRugS1YsE+dfudZf3dQdYrhYNLfeWGBLuR0AGCH/mhv7H2++Aq84mbvRNm+5JdBdJ+Q+Wy7aCwaq6q5v5w12JoQh4dHt9bdXC1DCgn+CNBeRRCkc25x7FIb4VVbpqyvyyn554CpdXlx9h6xeOs4arbopwhyoWns=
Received: from BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 by BL0PR11MB3491.namprd11.prod.outlook.com (2603:10b6:208:33::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 27 May
 2021 15:04:18 +0000
Received: from BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::b5b7:f65c:9c4:32ed]) by BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::b5b7:f65c:9c4:32ed%6]) with mapi id 15.20.4173.020; Thu, 27 May 2021
 15:04:18 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay
 pinctrl driver
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay
 pinctrl driver
Thread-Index: AQHXUH7cAU+qWZXyfE+9tE+LCZcAOar3KM2AgABD7BA=
Date:   Thu, 27 May 2021 15:04:17 +0000
Message-ID: <BL3PR11MB56995AD9237CBA2BD3F9ABC6C4239@BL3PR11MB5699.namprd11.prod.outlook.com>
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
 <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
 <CACRpkdYK8sy26_HbQE0K0snFzKs=q5zqd5e2u4HWo939FKMW6g@mail.gmail.com>
In-Reply-To: <CACRpkdYK8sy26_HbQE0K0snFzKs=q5zqd5e2u4HWo939FKMW6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [183.82.154.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63530b9b-2610-425d-2aef-08d92120b34c
x-ms-traffictypediagnostic: BL0PR11MB3491:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB349181CE417E63011ED34A30C4239@BL0PR11MB3491.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xyeh+X4nCSxVc7X8A97kwcmGkS6MG1jK4YGMdPlRu3yiFCmZnkGT1jXoDRw3ZxqP4HdIVwcsvj3mCcipCB6VFpI2fzh+2qzB6mf5iqueApDMAdUZjr6w/9sEysXdTWZ+pwiFm/KNpHxYF2gKcXl5+zcKbbWMd8o0e9G2Fowe3RWjg0xt/b0SEPAQz24tBH4RTpK1foERxT/S8jcqXv3p0T9IjvdU/BDm09OReJgNoV0V/yd4GJI+eQHhd8Aguk9Cv7suCdlR1mupuU1oFqTM5d9EluZJj/Lycw5cK1J+KtAfhhRF99Qx4tE5bXb6vRG+UewzNhatM1eGyF7r25g37qOVoY0byd+q2sbC6cZcEI75HhAPPWi/io1jx+DWPrYhLkMGfSEhMrII3dA5+Z1Pcno4fsDwpQlHT2aWqWrenMt2oEShGBAj6xdNssCx8KH4gWuZxJ7V3W9ArmeC0HtV6UcluQIBlOzp7BP6vkvf9da3g7JYpikJvoxfAFfEcd8OjVU9vfabeFP0ONm4y0d6b+/cEccIlIa6EACvRajZNNdb7twzyld0WLHOb1H/yxmaG7s+jf6HWBHZWeVTgee2iNnMpNGRwSYF3aIYyLG3or0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39860400002)(366004)(376002)(6506007)(7696005)(53546011)(122000001)(38100700002)(316002)(66476007)(66946007)(26005)(54906003)(55016002)(83380400001)(478600001)(76116006)(64756008)(66446008)(4326008)(52536014)(2906002)(71200400001)(5660300002)(66556008)(6916009)(8676002)(186003)(86362001)(9686003)(33656002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UVJSOGkwQXRrTkRTV3doVnJ1bDd0NDROL1pMeGExU2pTOXlYbUFnYzR5ZmZO?=
 =?utf-8?B?aGllMHdrWENKR0dHL2RiRStYMjJuMit1VXduSjB3RWF1N0haNENUN3IvbFg2?=
 =?utf-8?B?WEpuU242SFpycVJuYncrY1VPL2cydTNVNnVITXNKc25FWit0RmhuOXA0ZHNJ?=
 =?utf-8?B?VGR2WlQ1Vm5xVFQwV0tpbm1XQkVGUy9GU2xsM1dkbXBVR0I4ZTNHQ2pqRUpQ?=
 =?utf-8?B?MnJlVTNpaHBZUzZVVUdMMmpadTZBcVg2aUd6THhyRG8xNEpBZlVaNXhaTk1k?=
 =?utf-8?B?S2w0ejJmUVZNRzRYcGhoRU44eUVVbWxBV3hDK2JwNkZJRHJRZjdLUTduNTZF?=
 =?utf-8?B?L2t6cHpXQTRhcE1lT0NCd3NpSDlaNTgyTTNzSy9Mc2NWeTl4a0YxQ3JvOWdG?=
 =?utf-8?B?ekFXZGVwdC85UFBVR1dZS2txK2dZYnZRbytPcEVQS3lkMDAvR0E2eUJBdExV?=
 =?utf-8?B?a1g0SFh3T1IvUUE3Yk1LMjZZUW1IMUErSmZWdUtFQmd2RnRpOWRiMElCZkF3?=
 =?utf-8?B?S2dmZlhSOUZPUERJTjVtY21aL3NUOVgwZTdCZHltWENZT0Y5SVVwL0YzVlJw?=
 =?utf-8?B?dkhBRGgvSjhhR0pnL05hR3ZDME9wWHJZUXlzSjErUjF1NUx2RXMveHB0clNk?=
 =?utf-8?B?dXpyMzVGbzJNL0tvS0daZ0JTZm1SZ29RWTZEdVFWVFpYdVEyQ1NsQkJCalRS?=
 =?utf-8?B?L0NIcjNVM3FkQ2tlWVBrNS9UcEd2TXJrMlU1S2NIQjkxOWpweENrWVAwczAy?=
 =?utf-8?B?TWxsNHc4STQ5ek5IaExLWVNBTVRJT2VyTWc1bDJyWnpxUk42L2VDTStMMWQr?=
 =?utf-8?B?MU1vL2tVckZXa25BQ2JZSWtBRE8vcjFlSXhMS3k3RnhpeDVFN3NhS1NqcUR5?=
 =?utf-8?B?aU9uRXd5MjFsOU9HNlF6UzZtOS9yUjlieHdyeEdzc3pzUE1IckVRWmFoeTFW?=
 =?utf-8?B?OTVkOVp2RTRCRHVrY2hpYmNkTGwwZE1LSlN3ZllsRldLUkRWZWR3bXZteWtt?=
 =?utf-8?B?VXpHVXMxUitHNTl2YlVqZW41NTZmNWRQV0ZlMmR3a0tLMkprUjJ6TXRjRWNS?=
 =?utf-8?B?eWNjcVp2WUZEeWlOd2JZVURybkRKaXllemFIMmFsME5aUVFnVEhrRUtENWky?=
 =?utf-8?B?NHpna0RsQTk0OTlNMmJoQitaQmhLRXdOY0lEeEZ0T2JLRm1uVllCYUREUHIy?=
 =?utf-8?B?dkxGV1BVUE80dXBaT2hlZGhUQVVPM1BvZExvZS91THpPMTJMVExEbTVxMW53?=
 =?utf-8?B?QXRYNm4yTVp4VHpyZWxVMEROVFJaZXNmVGV4T3dlTjFERW9ycVc1NDgyTVdu?=
 =?utf-8?B?bGhhTzVzZHVxVHgzZm9XU2ZQSHhpeklJM0RIbVBCcStMMU4vamlXbE1UbkY0?=
 =?utf-8?B?ak5wVForR0pWa3BYZkRQaVl2b2t2K0dwREpJR2lZZ094Qk84SmNPQU91OFAy?=
 =?utf-8?B?ZTBjYzYyNVJ1UXlNclZFajMydVJ5Ry9Fd1pZc3BTSUNtTDlBbyswUnpaa1FK?=
 =?utf-8?B?VlZrNm9wRk83cy9ZRHd3eUlXRjN1WWJ3elpTWmhGYlJhbmpTMXdZdjNmd2pz?=
 =?utf-8?B?aHVCTkRibWEzZ2x3K2dKRkFvRDFQalA3RU9GZjEzVS9rMUMyTGQ5cG9tZWhp?=
 =?utf-8?B?bEdSZUdVMTJHbG5IcytQQmtpUnNtb3lMajZiLzlHcVMxT0laakpSVWN6cGNo?=
 =?utf-8?B?ZzZTWnZlVGVFdWdDZ2kzems5ZWhKSHBFVnVIa3l2Um84WnRLNVlhZWs0dWRQ?=
 =?utf-8?Q?LwciHEQfEqBOFfPOCy4iSDo+TKlWePlNl6aEXeC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63530b9b-2610-425d-2aef-08d92120b34c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 15:04:17.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuSAFnDWKS/YdA2DFmPvRFBE/tXeZNkl/8KBGM3soF4w0mFtIFNUjrAECN6s4YzesnNf6cYT5eHF/p/qXEqkXwhy0Rleq8s2DRdXXsbhGMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3491
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgV2FsbGVpag0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNClJlZ2FyZHMsDQpM
YWtzaG1pDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IA0KU2VudDogVGh1cnNkYXksIE1heSAyNywgMjAy
MSA0OjEyIFBNDQpUbzogRCwgTGFrc2htaSBTb3dqYW55YSA8bGFrc2htaS5zb3dqYW55YS5kQGlu
dGVsLmNvbT4NCkNjOiBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnPjsgbGludXgta2VybmVsIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsg
UmFqYSBTdWJyYW1hbmlhbiwgTGFrc2htaSBCYWkgPGxha3NobWkuYmFpLnJhamEuc3VicmFtYW5p
YW5AaW50ZWwuY29tPjsgU2FoYSwgVGFtYWwgPHRhbWFsLnNhaGFAaW50ZWwuY29tPg0KU3ViamVj
dDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBBZGQgYmluZGluZ3MgZm9y
IEludGVsIEtlZW1iYXkgcGluY3RybCBkcml2ZXINCg0KSGkgTGFrc2htaSwNCg0Kc29tZSBtb3Jl
IHJldmlldyBvZiB0aGUgYmluZGluZ3MhDQoNCk9uIE1vbiwgTWF5IDI0LCAyMDIxIGF0IDExOjI2
IEFNIDxsYWtzaG1pLnNvd2phbnlhLmRAaW50ZWwuY29tPiB3cm90ZToNCg0KPiArcHJvcGVydGll
czoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogaW50ZWwsa2VlbWJheS1waW5jdHJs
DQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAyDQo+ICsNCj4gKyAgZ3Bpby1jb250
cm9sbGVyOiB0cnVlDQo+ICsNCj4gKyAgJyNncGlvLWNlbGxzJzoNCj4gKyAgICBjb25zdDogMg0K
DQpUaGUgY29kZSB1c2VzICJudW0tZ3Bpb3MiIGJ1dCBzaG91bGQgYmUgdXNpbmcgIm5ncGlvcyIg
d2hpY2ggaXMgdGhlIHN0YW5kYXJkLg0KLS0gV2lsbCB1cGRhdGUgaW4gdGhlIG5leHQgdmVyc2lv
bg0KDQo+ICsgIGludGVycnVwdHM6DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBTcGVj
aWZpZXMgdGhlIGludGVycnVwdCBsaW5lcyB0byBiZSB1c2VkIGJ5IHRoZSBjb250cm9sbGVyLg0K
PiArICAgIG1heEl0ZW1zOiA4DQoNCldlIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdGhlc2UgaW50
ZXJydXB0IGFzc2lnbiB0byBHUElPcywgYW5kIGl0IGlzIHJlbGV2YW50IHRvIHdyaXRlIHRoYXQg
YWxyZWFkeSBoZXJlLCBvbSB0aGUgZGVzY3JpcHRpb24uIEl0IGlzIGZpbmUgaWYgdGhlIHNhbWUg
aW5mbyBpcyBkdXBsaWNhdGVkIGluIHRoZSBkcml2ZXIuDQotLSBTaGFsbCBkb2N1bWVudCBpdCBw
cm9wZXJseSBpbiBuZXh0IHZlcnNpb24NCg0KPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ICsgICde
LiQnOg0KPiArICAgIHR5cGU6IG9iamVjdA0KDQpDZXJ0YWlubHkgdGhlc2Ugbm9kZXMgY2FuIGhh
dmUgYSBzdHJpY3QgbmFtZT8NCi0tSSB3aWxsIGNoYW5nZSB0aGUgbmFtZSBhY2NvcmRpbmdseS4N
Cg0KVXNlIGluY2x1ZGVzIGZvciBjaGVja2luZyBzdGFuZGFyZCBhdHRyaWJ1dGVzOg0KJHJlZjog
cGlubXV4LW5vZGUueWFtbCMNCiRyZWY6IHBpbmNmZy1ub2RlLnlhbWwjDQotLUkgd2lsbCB1c2Ug
dGhlIHN1Z2dlc3RlZCBpbmNsdWRlcy4NCg0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAg
Q2hpbGQgbm9kZXMgY2FuIGJlIHNwZWNpZmllZCB0byBjb250YWluIHBpbiBjb25maWd1cmF0aW9u
IGluZm9ybWF0aW9uLA0KPiArICAgICAgd2hpY2ggY2FuIHRoZW4gYmUgdXRpbGl6ZWQgYnkgcGlu
Y3RybCBjbGllbnQgZGV2aWNlcy4NCj4gKyAgICAgIFRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBh
cmUgc3VwcG9ydGVkLg0KPiArDQo+ICsgICAgcHJvcGVydGllczoNCj4gKyAgICAgIHBpbnM6DQo+
ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICsgICAgICAgICAgVGhlIG5hbWUocykgb2YgdGhl
IHBpbnMgdG8gYmUgY29uZmlndXJlZCBpbiB0aGUgY2hpbGQgbm9kZS4NCj4gKyAgICAgICAgICBT
dXBwb3J0ZWQgcGluIG5hbWVzIGFyZSAiR1BJTzAiIHVwIHRvICJHUElPNzkiLg0KKC4uLikNCj4g
KyAgICAgIGJpYXMtZGlzYWJsZToNCj4gKyAgICAgICAgdHlwZTogYm9vbGVhbg0KDQpVc2luZyAk
cmVmOiBwaW5jZmctbm9kZS55YW1sIyB0aGlzIGJlY29tZXMNCmJpYXMtZGlzYWJsZTogdHJ1ZQ0K
ZXRjLg0KLS1UaGFua3MhIFdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4NCg0KPiArICAgICAg
ZHJpdmUtc3RyZW5ndGg6DQo+ICsgICAgICAgIGVudW06IFsyLCA0LCA4LCAxMl0NCg0KVGhpcyBu
ZWVkcyB0byBiZSBzcGVjaWZpZWQgdGhvdWdoLg0KDQo+ICsgICAgICBzbGV3LXJhdGU6DQo+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICsgICAgICAgICAwOiBGYXN0DQo+ICsgICAgICAgICAx
OiBTbG93DQo+ICsgICAgICAgIGVudW06IFswLCAxXQ0KDQpBbmQgdGhpcy4NCi0tV2lsbCBzcGVj
aWZ5IHRoZSBlbnVtcyBpbiBuZXh0IHZlcnNpb24uDQoNCg0KWW91cnMsDQpMaW51cyBXYWxsZWlq
DQo=
