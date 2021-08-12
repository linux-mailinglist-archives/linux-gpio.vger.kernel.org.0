Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D09E3E9EFA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 08:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbhHLGyn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 02:54:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:14073 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232784AbhHLGyn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 02:54:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="237320886"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="237320886"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 23:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="469661236"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 11 Aug 2021 23:54:17 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 23:54:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 23:54:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 11 Aug 2021 23:54:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 11 Aug 2021 23:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLJ7sqNfYuk/VAgU4GvdMaeiLDx13d5K+rqaLI6olUL+lob6by0hLWdHT7QiX3V7T6PKWgMU/wsj8u9yPmfxjfnptOb1tc17gU96mDY5Y2TDcqxV4VqboadjFNPcCOIL+LyEHg2FOrx8TUGPdVh/RAty+BIstkDU1eBKrne2xrQ0pxuYcUYhuKPlemIHSrjERIxcIeIM/4MBZB35t+Uz+GLxzsI2dJYbMekYxvL6tArra6j5ttSwDtJFFZWdAq0Pc/ZQmdZB2DUD7cBCY0irKrGnMtP1Xc3UwGxUeW0elT0EVATYZZ+jGmSEbc8dLvIJT1WxNLzlbJpjiOlFowq7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLUPN1T0lbzlXHQtpamllBoqgJNPdKpv2CU31y2LaM=;
 b=GjqGiibVH9/xiUoqbEYR53HlnmpoHzQX9vkyICNGrgPZGcVjid2aOZoOaKIeoxePP0lUOqMAbNE2lX7b19QEh15KYhIukbfTf/YEvMf9qvExCpeRox8MMHpDIJtWbhjGQXMmfH05MChEHe/QlTydqFcflHLL3zZjBBnCRoOLFk3e93SAMIPPmMI8Db2QgQ9/poJDCRpc+sUfMkWJZ1XyAYUNIbe6YKnL7ChRP3AUVMAugLA9kiEu1tm6wzH9ofu19tgI1SDkczz4iKzl3viA7Sl/FFWw9CMRzfS84mprwL5+BS9XXH1YmhIXoEnE+Vnlsh8qWHMdSnm7dYckoXa7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLUPN1T0lbzlXHQtpamllBoqgJNPdKpv2CU31y2LaM=;
 b=agjP71QvfC1cNVyek8XltbJlOn5GTaY1zX0dMt6N1bGkeAnMwH4CSsvi9LwXT++kg8rWe+vhdNY2+1NBEUlffhiKYQoFqBXdxTeUmV/mxypM4cxHZjuYPFssfgfqZGARduagU195aSkQ48J9NiK1+LycL4nDGzpkUhfkDUQz1g4=
Received: from BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 by BL0PR11MB3137.namprd11.prod.outlook.com (2603:10b6:208:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 06:54:15 +0000
Received: from BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::694d:3b35:3c46:64b7]) by BL3PR11MB5699.namprd11.prod.outlook.com
 ([fe80::694d:3b35:3c46:64b7%8]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 06:54:15 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [PATCH v4 0/2] Add pinctrl support for Intel Keem Bay SoC
Thread-Topic: [PATCH v4 0/2] Add pinctrl support for Intel Keem Bay SoC
Thread-Index: AQHXis851/ivp1GxZ023t4kSlwVI06tuT8gAgAAxBfA=
Date:   Thu, 12 Aug 2021 06:54:14 +0000
Message-ID: <BL3PR11MB5699258A36F846692578C42DC4F99@BL3PR11MB5699.namprd11.prod.outlook.com>
References: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
 <CACRpkdb2B-=nkp075+DvZzXYKOEXaUDBdktFSTxqRLwTVDg=Ng@mail.gmail.com>
In-Reply-To: <CACRpkdb2B-=nkp075+DvZzXYKOEXaUDBdktFSTxqRLwTVDg=Ng@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79fd3f7-3994-454c-36b3-08d95d5dff97
x-ms-traffictypediagnostic: BL0PR11MB3137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3137777D06A135A872CDBA3DC4F99@BL0PR11MB3137.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZjEfY012sixFLLFLDhc5RUC+Yz4MBQMdFnkeXdkeN+fjc0MIC+Bj6El9nOUMCVQHrNGAwPmsic/0qxiU97brQ7ms1BPFdfWr2D8zxJU70uM60LielOKNaSuoIx03z9mftDQxPiXk6B6wLCZH2LP9nTqWOUcbzZei2iMXbcEPUt9eMSVCY+ngQU+IyV5kfQstEvQykw2pR5z8+eRxptD14QbcH6BwSmw2zgEH8tpkD3qsQpxEuAD+F3CJVaOkAyQpXlnINNOT+YVYk11mV8bEANRO9R7vaSDA5r9kVoflH1DATRrH+T4EpwUJe1TwVEsPpjEu+0lK/i+0jxCqGJpSdl7G5yiI0GDUqdM51PkmWMWGM/kB2FdkVce7uZUTTy+oW0erUSya44nIY85yrDZ1OhF3uHWx53fAtQ0nrRNXNiGM68Yf418j33hUpa5q4Yhjf87LUfwjQiTH9ldFghhTom/0YtGoiwOZRo3GV3wnY6mHCBCRkPDLPpoSm9ch9WuEoJzKlGr4wzIbR7V36aZ7tEoNL4QpqoT4gyVPlQN8SAI5rW/TLcDDrHr+7LBF0vm7G913yhC7BFj76baAshJfoBIymOymmTYN6FIIYUbH75RTx0bwwidPb0Ejeh2Q08Nf+N4zEA4M48fTpQxZk164EFqji9R8q9aDaT7uh6UO5VroZJB6k+WAZscXsNSh5YrsErAJ5KnuiDS2+zdXKYaBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(52536014)(4744005)(83380400001)(66946007)(76116006)(6916009)(55016002)(9686003)(33656002)(5660300002)(8676002)(86362001)(53546011)(122000001)(6506007)(66446008)(7696005)(478600001)(2906002)(66556008)(64756008)(316002)(38070700005)(4326008)(54906003)(8936002)(71200400001)(186003)(38100700002)(26005)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2UwUStER0ZOSHRSaEtWeTZocDF2NWxoclpSYXVYMU8vdWovbEVjc011dkxo?=
 =?utf-8?B?elpIeEV0OG5DdmxGYmdtbWRDc3k5a042TzVLUytwRlhVdWFyQVd1TjFxQ1ZH?=
 =?utf-8?B?RkVMeUNqR01wczB3OEg0azNhRHF5OFZ0aitBTCtJaFkybWxHQ01XU1B5ZW9i?=
 =?utf-8?B?M1ZCRTJXZllkV3puSGJyWE56dGpaZUFmUzFrbkZ4Um4wMGtYeUhiaGUzMFc0?=
 =?utf-8?B?YmhGWXJSaVpGUERrS1RLYTZqV2dPbVRYSWswb3pIcHJZc0UwN2crYURVcHdl?=
 =?utf-8?B?YzRtSGs5MkVxSXlTWitSQzBzR3JhNklNL0VwN3JNbnpSTG5Rd1FFcG9XbjN4?=
 =?utf-8?B?UFdOMUFMSWljNnkwQjl6UGp2U2ZMaDZBY0RTdEtjWTVxR0VoVWRqYTVNZHR6?=
 =?utf-8?B?aXpOM2FhRERLbDV3YkxyanBWT2UvNnZJS2orakcxVm1YYkdudEEwQ3RJamNB?=
 =?utf-8?B?SlBOWlpQNnhJR2oya1MwSUZLUDRtK1dpS1lXcGl3azhpTWJZeXdaSUhaSmln?=
 =?utf-8?B?aXhiQ2l1TGRSYzR3SHFRUjh5TkFwVGNsZVlCR0wvcFZXRGNUMzJRRFFHL3Zz?=
 =?utf-8?B?UnpiRkNBVnJsdjZQcDZlTkNoRXNycmVTbmVFSHFuRjI4bG9lQTVxSUVGR3d6?=
 =?utf-8?B?cFR1SXpwWkpvcFdpbGc1V2lrNVgzSkNETGFMa3VxSFZ3Ny9QcnA0Ny9UZURo?=
 =?utf-8?B?bVVKOWFXMFJMKzBPbG4xWTl1VWczT1JKL2RBOFRhSmJ0WGJya3R3YUZuQXV5?=
 =?utf-8?B?SElTendGOTVEcnFPKzA4VitYUVZKUVM1czEvWXdyNFR5OGFTSlVuL1ZyV3A1?=
 =?utf-8?B?SnRSRGlGU1dZT1VLTWNPbnROREcvRDZzOWcyNnRwdi9hMG9DSWZrZlpIWjRC?=
 =?utf-8?B?TTl4bkFaMkFwYjI5TGhJTURsV1RDbWlkOXdPcVRyNGVtaldVQUVSWFZRT3VV?=
 =?utf-8?B?Y1ZwcUhyYzJrb0ovS1Z3T2d5eFBzOExidG52bXlFSXVKWjZKMVZ0SzFZbmN1?=
 =?utf-8?B?WkJGWDhYVnBtZFVrSXEvQWtoU0xIZXpHTWt0TVhZczdMZ2ZYT3NHQzI3d252?=
 =?utf-8?B?UHVJU1RCOFhUd2F0U3hWdzFENE1aWDVKcVpRQkFvNjdJeGJoSHVZZ29OSysw?=
 =?utf-8?B?dGcwQkNlaDFYZmF4YmdrU1MyR1dTdDd5TkdwdXd6aFNnY3JNUWtwcHRIckJo?=
 =?utf-8?B?TXo5SzhYZzBRT2Vxa1VxTzVRRHRJV252bjh1Ym5MWjAwaExCekErZlhKRUN0?=
 =?utf-8?B?MTVUd0xEZWtvYmh5NDdNWEg1ZGNHR2NZMUJtamNjNzgwVGdXNWhZRGh6SmEz?=
 =?utf-8?B?a3RUdjNVR0hxUWREQXFUME54ZEFLVGk1K2Z3azIrNkRsZUkwVTFkdzl0Q3VZ?=
 =?utf-8?B?YmNkaWlEZkhRbjJNcUtFTkJvN2tvVUJIUTViUjk3OFJMS1pmV2Jpd0grQWFX?=
 =?utf-8?B?M2E2aUt6WlJEczdmMGFGYnYzRmdyUnM5aWdBaW5JRWswMnVFOEdtdlBwTXJX?=
 =?utf-8?B?eU9Wdm0wNUh6dGxMdzNXOUpBM0VlOGlVdHBIZ2tnLzVvNjRHaFRqUERBRnFW?=
 =?utf-8?B?UGZVeW8yWGM0Z0dHOWQ2aUNkWXVhTEcwd0ZwZU1wUXpsdXIrc241RGtNZ0hB?=
 =?utf-8?B?SFp6c0grcEFhazJNT2xpNW54QXNaMStFWDVMOGhLSDlHVUEwUytVbDRXbE1X?=
 =?utf-8?B?Qk93dE9wMWhqSnhqZEw3KzRZeWE4OUxvMlhwL25MTGdIWU5sSk1hYkErWEM3?=
 =?utf-8?Q?xxDATVq6pmTYDazCwD5M9k0CAii6QrNVTiUdgYu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79fd3f7-3994-454c-36b3-08d95d5dff97
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 06:54:14.9584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWz2KpP82qWcPMxkJkgSVcVhvqZbYUizJwFUVo4kCZsQIcikEB9lMs9PIUMmpd7aK9Ns8Kii6RZeYLQNfVa08I3fW7iwH1qF+e/eBunFWsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3137
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMSwg
MjAyMSA2OjQ0IFBNDQo+IFRvOiBELCBMYWtzaG1pIFNvd2phbnlhIDxsYWtzaG1pLnNvd2phbnlh
LmRAaW50ZWwuY29tPg0KPiBDYzogb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC1ncGlv
QHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWtlcm5lbA0KPiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz47IEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tPjsgUmFqYSBTdWJyYW1hbmlhbiwgTGFrc2htaSBCYWkNCj4gPGxha3NobWkuYmFpLnJh
amEuc3VicmFtYW5pYW5AaW50ZWwuY29tPjsgU2FoYSwgVGFtYWwNCj4gPHRhbWFsLnNhaGFAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvMl0gQWRkIHBpbmN0cmwgc3VwcG9y
dCBmb3IgSW50ZWwgS2VlbSBCYXkgU29DDQo+IA0KPiBPbiBGcmksIEF1ZyA2LCAyMDIxIGF0IDQ6
MjUgUE0gPGxha3NobWkuc293amFueWEuZEBpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gPiBUaGlz
IHBhdGNoIHNldCBlbmFibGVzIHRoZSBzdXBwb3J0IGZvciB0aGUgaW50ZWdyYXRlZCBwaW4gY29u
dHJvbGxlcg0KPiA+IGluIHRoZSBJbnRlbCBLZWVtIEJheSBTb0MuDQo+ID4NCj4gPiBQYXRjaCAx
IGhvbGRzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwaW5jdHJsIGRyaXZlci4NCj4gPiBQYXRjaCAy
IGhvbGRzIHRoZSByZWxldmFudCBEZXZpY2UgVHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGFu
ZCBhbg0KPiA+IGVudHJ5IGluIE1BSU5UQUlORVJTIGZpbGUNCj4gDQo+IFBhdGNoZXMgYXBwbGll
ZCENCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNClRoYW5rIHlvdSAhIQ0KDQpSZWdh
cmRzLA0KU293amFueWENCg==
