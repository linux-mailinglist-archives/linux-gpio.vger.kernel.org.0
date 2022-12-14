Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5664C33D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 05:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiLNEqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 23:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLNEqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 23:46:35 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8865B627F
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 20:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670993194; x=1702529194;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ACgKs+MPNkKYp5WOi/uH4QHUGtlGnHW4MZ+BG+h3YaA=;
  b=eWiveFkyHBRNMgu8/VJmJ6nA2m7v2gFAFHaB9oIAuuRgCjhnBSec+nZp
   JrmGexukLog+49QXezn/RTbtqDezQYTkp7Yqv2bxCVfHgLqvi2M6CerRj
   1X3MphCIjG4oZ4CgSRA+fE2+W+fkK6AdMMdj3WFsw8t8MgPT18T8s0F7K
   QDVlHGPLbJPCnR/jhfFalICMDMU9rEu1EwEkHJzmOW9jgVxfh3qH8xqO1
   4cWoGFaF1tZB3Nb1lDTD44WT+MgdKt4aRGwEo5OajQLJjQM3VTLAGL3Yx
   h8S3QT6DQSdlaaFBRp4/Ygyzcm3audCQifjTqXnZVZpDodOlsqoG0h4Nb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="320174606"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="320174606"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 20:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="681396439"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="681396439"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 13 Dec 2022 20:46:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 20:46:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 20:46:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 20:46:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 20:46:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW2Fl5JCPkp657bF2Zn7cTKTrMFCemtZ2ehwrkC8hNFGyr2HqjiA55fcH2Hto1EgTGBCUovE+U++/crWpjFg6yuMlTNVJIheU2LwdCD8Q+EcDDZbflOiLpazKQwRsDH6nb9odI2VmjN5+UU9XxrivuJ44AeLgdG/IJqZpDZeoAyZcRlBcCEJlXuNAPqI3Sig52aUTjIm5QAzZpcjJkn0L9oyOBBy5xN1vvkyDULgbBbW5uJluHqwubKmY5FRtIDTq0dX5S4WSAMBSS0K446dasyADudwENEXcmEFM2jm5HgfdMn2MIHBA1OibTOWIyHhXO4+/0pQMQrBuVwbz31ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACgKs+MPNkKYp5WOi/uH4QHUGtlGnHW4MZ+BG+h3YaA=;
 b=GPLUHl65YgpC0tHmcbzJ2PcENUqEa3hWMRQO9wafDu5xexCsDJ3CJxCKg3lq1LIyaDQTl6i9F/6ur3AZgI4mEC158iYnXkMg07SXDj7nztpEH2a5ihCUOFx7U2VElxMS6H9wDs8ra83c99yzi2/CU8Q4xB/BKv+vk0tkG202L3tZejy0J/4ecMPVC7Ez4tspHHXqhYLb+CAS7f9Y7jYL817RkXoXUh90zRFLAhGP+qthfl10zmxq5lK2CwUv5NWsTDm5dmWk5pbaiXHeqes1BQyfUf2HgqCAh9pubxHlrFWd5q2tBSeWtQU4Sq4T0DeDeSateKYtLJDntbWfEf5Hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1499.namprd11.prod.outlook.com (2603:10b6:4:8::17) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 04:46:31 +0000
Received: from DM5PR11MB1499.namprd11.prod.outlook.com
 ([fe80::acab:ad03:bedf:a12f]) by DM5PR11MB1499.namprd11.prod.outlook.com
 ([fe80::acab:ad03:bedf:a12f%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 04:46:31 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        "S, Kiran Kumar1" <kiran.kumar1.s@intel.com>,
        "rafal@milecki.pl" <rafal@milecki.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "N, Pandith" <pandith.n@intel.com>
Subject: RE: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
Thread-Topic: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
Thread-Index: AQHZA+pbdeFRx+YdWkSg0cA2dSBJza5VzbtggAspNwCAC+8W8A==
Date:   Wed, 14 Dec 2022 04:46:31 +0000
Message-ID: <DM5PR11MB1499C72E44E6B22499F82360C4E09@DM5PR11MB1499.namprd11.prod.outlook.com>
References: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
 <DM5PR11MB1499491D6679FA47FFA3FE5FC4129@DM5PR11MB1499.namprd11.prod.outlook.com>
 <CACRpkdaYP0ZW5PrQyOk0=Sop9mXkvxjFP3-r_2YdoyJoVeqz9w@mail.gmail.com>
In-Reply-To: <CACRpkdaYP0ZW5PrQyOk0=Sop9mXkvxjFP3-r_2YdoyJoVeqz9w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1499:EE_|SJ1PR11MB6108:EE_
x-ms-office365-filtering-correlation-id: 434bd039-8fab-4a6c-3577-08dadd8e2b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NkZVKhjWIx0n4+eGU/N1xJi6hxqYJEmE7URakvV3/PsRVVHofb5SPELbG51OJCDCHDTo/v5f2Rt7MeylOfHnaKG3vPXhYyodWj//EFK0JOpQduR2b+3nvIYh5q6Rvp8rt778fC7C1auoGvLfa7sXotuT/Qdjwzsb+5eBtAjX1MLh1tpqHwUeBBqdhDS4ald2skCSOik0JBPQKtbFp5awrajwFjFs0CZA0C8wB5Vey6+1IYFajmfflYBgb+6HNHhIaGojA2Kj8ic63BSNAuRlDgKUHnmhxjVQsPo4VutGBXNLE2wV9nVdPuvRHBVa+rSMlUqffNE2MBYQl/mUGCzzVSGyncrJo/DK74dDtnxqGzvF9NSjvtOSQVpHHZmehSl+Hrg3+ZquuHH43UVh7koeMmwmDAGo00loEdwY0DIBeOda7fUjn3p5DdM8tSTtH/vToIpfdnHFYH2CIzSjEpGqaMye7fsLz1hs0vpFVr3g34GbiUgKZR5TeZE0gKagOr3/z/iROYMP6rvMglY8vF5WiV5bNzKvQLazfEYgrjVhkXtMLn/hlavSO5K3HrSf4g34D8ZNidSzO1IImQm4XQbifjrackejY00Xl4GhrXmTPmH5HOgK3oisVtcHNtXf6wXxZC8qibN0QdqRHLAbPnbbq0P7A6SbkmvfdadeVLO36/wS1JKdVdtkqwpol9pTvlBseghknqef4suHf0yaJJgCbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1499.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(55016003)(33656002)(38070700005)(86362001)(122000001)(316002)(54906003)(478600001)(6916009)(71200400001)(2906002)(76116006)(41300700001)(66446008)(5660300002)(4326008)(8676002)(66476007)(66556008)(4744005)(66946007)(52536014)(8936002)(64756008)(38100700002)(82960400001)(83380400001)(26005)(53546011)(6506007)(107886003)(7696005)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk50QmwzM1JLSmV6ZWdJL2dvUmczQXR3cldvK1MyeENwTEYveDBGTVBhYjFx?=
 =?utf-8?B?STNFZ2hqKzNxZXhjVkRDcFlrMWttd2ZZQk93WU5lTFhEQnloaXBSdXVSZHIr?=
 =?utf-8?B?WVNiNVYvelg3ZVowOGZRdHBrTG80ZE84aG4vd25nV01iOG91cElvVGtUeCtP?=
 =?utf-8?B?bVY1b21rSGQyUnFseHZXS0J2cDlxV29nMWZubFc2d0toMjJ0NU8waURTOGpo?=
 =?utf-8?B?a2RBaXFnbythQ0c4TWlYZjZZK01PeXBRNjk3Sko5NTdUMk9ET0p2NmtmK3Zr?=
 =?utf-8?B?K1lMY3c4bllXcVl2R3oxYzA1L21yeUU2Z0lxMXZKdFp5TFQwYlU0ZGw4WGwx?=
 =?utf-8?B?cXV0NDgvdW9wZ3NNWXI2MkNrOEtWMUk3eUVJc0FCMVZWVTV0eUdrWEdaQzZm?=
 =?utf-8?B?VlkzR2Jla1QraGhkOHFGS2xrbmRMY1dDKzVrZ3g0cFdsZUUrc25BZnY3Mzd4?=
 =?utf-8?B?UkI4NFZhTkUzOTlWL2pPZlExaFF2V0dDS2tJckNycWYrcE1wT0toaTRCS2Y0?=
 =?utf-8?B?TVM0cHRmY1dJUzJWTzhEbS94L1FrWUd3MTFGWG5mUEs4OEV2ci9zbkc4b2ww?=
 =?utf-8?B?TXI2MUdYQWFLem9HY3VWK2tnNzljT2cxU09DZW51ZVhqajFUdloyUHBVaVM4?=
 =?utf-8?B?OG4xbnFwZ3JIUXVYbElyUzV4SHl5WWlJZDIzbm9RMC8xbmpLTHliQitiYTdQ?=
 =?utf-8?B?V1gwSWpxTHE0VlFOQnhmLzNKc3RKeWxTNmw4YlhERUhaUFNRZTFjaldoOEIz?=
 =?utf-8?B?cjFWV2tGNXJWQU5wWE1hZGNqMFJxVzFiRGxuYWVrY1N2eFhMc09ZTXBIaVFP?=
 =?utf-8?B?YkNnK0tYR1c4RmpYbitzem5CSnlhemhEaEVETGlyVVBlajdMbGtVYnEvWllB?=
 =?utf-8?B?VE1SN3B2L0JaK2RSUEV4bG15QjZuMVVkcXdwQ3prTlgwTWFVMjVUdDBVMzFh?=
 =?utf-8?B?VXYzSWZXMDVBZHhPaXlzdUZwL2FDL3RtVDhvUi9LOWZZWGMwUGl0VFJDU1RC?=
 =?utf-8?B?aUt4SmRRQVk5Q09paDkyeUw5VFdVcXVKWFhOeFJZNzI4bzIxSDBiNFhoZEM2?=
 =?utf-8?B?K1QxTG4zSU5QKzRLUkxiYURrbklYVDNWRk5hOXlnVVZvekRPTEpUMTRabUsx?=
 =?utf-8?B?a245U3VwOEFjUU44QVJBNGJCc3pJWWRoNzdCa0puMU56RUc1ZXM2MXZvOVdS?=
 =?utf-8?B?OHJDM3VKRFFIVEpjMFZTNnZMaUpKUjRrejFwSjhyTTA4dDY2T09pTEdHekZB?=
 =?utf-8?B?eDVzZlBaaUZ1NW1GQVpVRmZmZFp3MkhoeHpuWTYzbDd1ZDM0MlhNV21CajdU?=
 =?utf-8?B?RE5LWkFsZnRiUXNkVEFVNW00YVJQQ3RDRVd3bjlMWk5NZGNOMmJBb3M0OEFk?=
 =?utf-8?B?VThRS0VKb0haVHRlQ0h0YjhOclFJOUpxcFoyYXE0dFFieGJ0SW5JaWRScjlv?=
 =?utf-8?B?cEl3cHh6S1hsbjZaaUhuV1BGRVJ6dVo5aExrRTV1am85K00yRE5vc1BEUkpW?=
 =?utf-8?B?c0NaOURuSm94K2EvTFNTSmZRZjROR1doNTliMk9GR2Ria3FoOEt0amYvMFVz?=
 =?utf-8?B?L2QyOGs1S2EvenRNMHpObGJWa0h0bkMxczRha1VjK3pkSkdXcUxSQzFkVEU5?=
 =?utf-8?B?ODBJSEw2VnhteDdUSFUwYktkQlIwSndSaVRYL3FrV0dwdXdIanpnL29HTERt?=
 =?utf-8?B?eHFsR0N5a2d1R3FNMVNpYjJsQyt5cXFVUS9DM2k5RmVMTHBud2lxSFRyUGNl?=
 =?utf-8?B?eHNTQUs5am1JWXYwdVJMdVQ5TzVKd3ByeTc3aDZ3Q0FuVklYc1BLb3p6aEVC?=
 =?utf-8?B?Rm1zZmhqRzJFTTZ4M045Z212cm5Qd1NNbS82VUdQS1RmTVdxclJJM1JqSUtG?=
 =?utf-8?B?eUUwS3RSKy9XUDh3a3RTUDdwZEd5eXJONVAxdEVmMkxDcU1ERkNmZldSY1pr?=
 =?utf-8?B?c00zcVVYVjFJVTJkNHJzcmpKVXdXeC9STWhhZytKWXVPRXl1NDVrS3FpZHJS?=
 =?utf-8?B?L0pLWEorMDR5ckhYbCtTckQrdWFEM0daTVZ6a0VZKzEwZlczOHEvVktwaVFW?=
 =?utf-8?B?NDJRN0k2MEZtRU5Uc05JVFBJekx0am15QnFWbFY3clVKNHNqN0VQZk9qdGxW?=
 =?utf-8?B?eTI1ZmRJVFptNzV0SjNMenRTelA5NEJPelV5SXRDWmFzNFhIVm90TVgxUUhl?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1499.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434bd039-8fab-4a6c-3577-08dadd8e2b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 04:46:31.0966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYp9DJKFRVN13/ve//O0JAinycqwknGM4NpZf88iFv/KGMt/QAgUzVSf4ArKRYLaLm7p3/m0ILhhVtYyTbCB8wSg3n9wd91HJSAwlEqlVvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciA2LCAy
MDIyIDg6MDEgUE0NCj4gVG86IEQsIExha3NobWkgU293amFueWEgPGxha3NobWkuc293amFueWEu
ZEBpbnRlbC5jb20+DQo+IENjOiBHYW9zaGVuZyBDdWkgPGN1aWdhb3NoZW5nMUBodWF3ZWkuY29t
PjsgUywgS2lyYW4gS3VtYXIxDQo+IDxraXJhbi5rdW1hcjEuc0BpbnRlbC5jb20+OyByYWZhbEBt
aWxlY2tpLnBsOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgTiwNCj4gUGFuZGl0aCA8cGFu
ZGl0aC5uQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gcGluY3RybDogdGh1
bmRlcmJheTogZml4IHBvc3NpYmxlIG1lbW9yeSBsZWFrIGluDQo+IHRodW5kZXJiYXlfYnVpbGRf
ZnVuY3Rpb25zKCkNCj4gDQo+IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDE6MDkgUE0gRCwgTGFr
c2htaSBTb3dqYW55YQ0KPiA8bGFrc2htaS5zb3dqYW55YS5kQGludGVsLmNvbT4gd3JvdGU6DQo+
IA0KPiA+IFRoYW5rcyBmb3IgdGhlIGNoYW5nZXMgc3VnZ2VzdGVkLCBidXQgcGluY3RybC10aHVu
ZGVyYmF5LmMgZmlsZSB3aWxsDQo+ID4gc29vbiBiZSByZW1vdmVkIGZyb20gb3BlbnNvdXJjZSBr
ZXJuZWwNCj4gDQo+IFdoeT8gSXMgdGhlIHByb2R1Y3QgY2FuY2VsbGVkPw0KPiANCj4gWW91cnMs
DQo+IExpbnVzIFdhbGxlaWoNCg0KWWVzLCBUaHVuZGVyIEJheSBwcm9qZWN0IGlzIGNsb3NlZC4N
Cg0KUmVnYXJkcw0KTGFrc2htaSBTb3dqYW55YSBEDQoNCg0K
