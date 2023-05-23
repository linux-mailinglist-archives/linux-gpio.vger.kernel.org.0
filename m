Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360D370D305
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 07:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjEWFCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 01:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjEWFCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 01:02:31 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D9C129;
        Mon, 22 May 2023 22:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684818083; x=1716354083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lCIpaWb0ApA+DM8dNVU5YUKeOxTgl4XargRVoozQ1sE=;
  b=DAqOeKStBQGgq0uZFTWtNSiVhkNTK0trIJXuDWbbekCpB2Sf98llojLh
   L3mUcXiGPufOzW8qFSyauTS+XOCBRtXKduMtjhUBETH/OI/izEsq9kEhr
   bO0Hm7tdJ+slt/lCrCW3whs3DTAEcvhAO7dJJiSGRZ2fw8GDd8w8IuPri
   dl9bLxIyp1xHFJy1EHO7yjXuomLdWgNnb51Fy+s2/6ME2L7WEM25B6+ca
   0wl/UYBMvk+P8w34dPqzlvYWQ1sDUXDZlS7iQtoqrHGtXWIRZ5Ysp8plK
   ZKhELmu0bBeHy06elV8mNJWHdhK8HrDozKFdrsLc51fdIuQTnYdv5TpKD
   A==;
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="226531284"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 22:01:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 22:01:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 22:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8kAreWHBhek0NhtdcX0nWtiwhkefO5fyS0vRh4j9Pdcn2uE47MSj6dtmi1J7JoMFB9+lTK8w9uy4xHjjT2SL6Au6ZZCnPE+Q/ZIVdZabXFq1S59bGSEF27IQ6Z8BvS0ISVKAfhmKK48oWdbLd3Tbux/vvhVcitb0f6ij1AmN+rEq8dDqiZND5YRxnN6p3QT2wwJLvzPNnR1RLu6eiarhWhsQa/PoweWKAgEdk+q9JLWh3AEqZWFu5XwgArjC4Mv3k3cg/yN0tOvjtXGSjPq+4LIg20q8cC3i1p1FDqPmJHWNP/yfYv8/jut8FYNLYOwIwtE3Dyo/S19k/Qw5mjrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCIpaWb0ApA+DM8dNVU5YUKeOxTgl4XargRVoozQ1sE=;
 b=dFlN7ufoAn0Wl8M9fy5x8E6YjA+wJAE30dMPQ6igtXOs3VM2tOMtTiVOEkPaPI8o7B85bDkokxnBuYsaDFVP7FUSc59UWQZ0t16PnQ5T6KnZzKsNQXYs/0nIQGfVNu8F18fgUMzrbxVCrUoblGxrrmivZnOvttH5RW5br/Hfob+P5UZhuOFDwdNYBEpDZ5lc2SMFU6h8lgSprKjmKw8cdrupf4BpjfNfvJ19+iOQIZaOPgU79YAe+p3kwUeagkycMFss7occ2pvKPywdvqR2Yvl5Jb8UcgvruFn+3GnTxblrly/GIE3fFPpDQ71vIq12seaBMzfH+bIKYadv1lhvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCIpaWb0ApA+DM8dNVU5YUKeOxTgl4XargRVoozQ1sE=;
 b=sgPVkm4G0TQ2kECUbkJRyegnSEJ3ThVWllowtPH/jMjT+PXQHnuW2o0yvL6DkxZFuRW64pIXTT3kG9DDqZ3NgE5ZzTlP557tVWoHoQY99FgI4nqIZip9DeGUqzXC78a/mgnVno2RRmOC5yvVzXFQ24YfepOEKXLYnTdtxjp8lUQ=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 23 May
 2023 05:01:20 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 05:01:20 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <dan.carpenter@linaro.org>, <andriy.shevchenko@linux.intel.com>
CC:     <Ludovic.Desroches@microchip.com>, <linus.walleij@linaro.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-gpio@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
Thread-Topic: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
Thread-Index: AQHZjTOcUEmq8na++kWdnot+bXIX0A==
Date:   Tue, 23 May 2023 05:01:20 +0000
Message-ID: <eaadf5e2-ff0e-d6e4-23c9-57d21878f26c@microchip.com>
References: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
In-Reply-To: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|SN7PR11MB6921:EE_
x-ms-office365-filtering-correlation-id: 2f45991a-9671-45c0-e1d1-08db5b4abf74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtTVxjazk9WhvMxUYZY0YT02PJuWtqLcSKRMJkzr0MQ/MlPsx4pLHOaWNt374fOK+pH21n1/uvL/ID1Upp0FBmGQwhf73tqTRgeTE7p/0pTviLKpG9aCQpCdr3/AsBGU3XLMAvPr2oLDllV7d21tq/uiALCXuOkfdHdr2BnGxRUVyCRzzFRuD4qMB9BKFyRl1awlQzyn4a3aEotlToaL8zsBb42l/cmGcyjN1FRXD/KM1JRJJjx1Kklj1YQfwmxVe2cW/EK2Ovf7AzdDFYsBS945A15TE21cNX9vSGzQw6dXLFZUtUghM1Y/H+OG6Dr88y6oCa/OShYiXeMQlt6UXstjt/rvT+5G7/2yIg2xsPuZztRQFxGQ1MQKMdBhj0l4bR6wGwheBPfVTVrWM7jNqak2I3jqhlVgu9ImeiL7/5jMpYdk4ifY2lDT4XJNufPQlAxU1LCeZW0Ud/wHXJhvMVD/MZJpZ+qQVrCUB5JLE2LZNCGveL2oCwAC9O4S0HBBWPjfUAsfIaomlSzUPTh6LTxf9IUhyr43emCmcpBVIlcZj9eXRT+mA77hBK0HYnKfTlvG0VDCW1Ir28q+xqyQCDA4+OV6ZNdvIzS+HTyNKD/0kvAIdBCd4WvRleeN1ZGhCtnIcWAvkoX86AH4riT1iBa9gg6dAz7jcuS6hrC0andm1x918JJOGbNd3ST47JZh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(38070700005)(91956017)(4326008)(316002)(64756008)(66946007)(76116006)(66476007)(66556008)(66446008)(54906003)(38100700002)(6486002)(478600001)(110136005)(8676002)(2906002)(31696002)(41300700001)(8936002)(5660300002)(83380400001)(122000001)(86362001)(26005)(186003)(6506007)(6512007)(53546011)(71200400001)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUlHckVGMlVHU295a0h0N29GUlJNREkyWXk3TStRYmFkOEh6M2tGKzZYVC94?=
 =?utf-8?B?emNCWkZGZFhMQWhGQ3lick40MTBpd25NWTNka1ZYcEpPYVZYblZ3RUQzK242?=
 =?utf-8?B?UWZrbkd0YkJxeDZpSCtoQ2RjeHB2dm9QOWFHWGRxU1NUaC93QVJqS1lmQUF3?=
 =?utf-8?B?YzBUR1JZMFJsUlVHMm9qcWZNQVdVYmZmR21FcWcrb1kxUkVSUEVhWkIyNzlh?=
 =?utf-8?B?MzNaQzg4RXpPVlJLc21nYUg1MzRxTkx6UzJhTFl4WmVXaEgyRFFPbTdBWDQ0?=
 =?utf-8?B?YVlSS1U4cGk5NnloOHFkVW9OZU5TV1d5Wmw0NVlzNkhQWlIvNGdqV0E1bm9q?=
 =?utf-8?B?blliekVtTGZGQWcvUit2bXQzWmx1SGU4ckJuWUxmOHk5VHlqRFIwb2FzNWU0?=
 =?utf-8?B?TmE5VWdoQkpNVHJuQzArb2IxSmNxNWJSQ2JvYmZ3TGFpZmcwUEVmdjZnSENR?=
 =?utf-8?B?bElnNk5hdUZHd1BMbjdPUkh0Mjh5dnZjSmRuZC9ZdzJDcENBY3d1M0lOVUdu?=
 =?utf-8?B?M1M4TEZHVDlJakEwTDkrM0VnWW9HN0hYRjdPMGd5dHJyYk9ML0FVT3p1L1E4?=
 =?utf-8?B?OElySlZ0OHNGSHZDL2ZLZjdYRFZydUlSTUM3bThKTDJURTRqY2orUEE4RVZU?=
 =?utf-8?B?OGt6QnczYXpHbFZjd3crMm9MSkplVVRJaE1aWDBzb0JUOEJoRlYyNG9QMFhF?=
 =?utf-8?B?WXZzQkJ3a2VHZTNJK2NsaE9uR1ltSU8rRVpCeE8wcVdBcnRkNmxNblk5RlJn?=
 =?utf-8?B?WnlPU3VMMmdGaUFnMThkNGczRUxLQUtTMU4vOXJoamhkUGJxVW5STW8zbzhz?=
 =?utf-8?B?Nzd5RGtLNFU3WDM2ek1SZGkzL0pZVDBwYnV6Ui8yMFN6UFBMdVZNaVFkS0lR?=
 =?utf-8?B?aHVNbzNGYVl3WUsxT3JKWG5xSUpuSEN6d2l6UGdyb2pHVThPWlFEekx6SnBK?=
 =?utf-8?B?WHlkWHp0eVFDUEp5QStBQ01GY3MzYVkrWEhOclUwcWZ4RjlRT3ZMN2ZYQUlR?=
 =?utf-8?B?blkwV2FJMW93YVphQ0xGRm1SdzBUanozNTUxUzFsd2FZMGhMTTZJbm5FVE11?=
 =?utf-8?B?VXdrREVTcndQaUJrOHFRZjg4d3FYV01tZ0lYQ3V0Vm5HUnFZUUt2VUowbFFJ?=
 =?utf-8?B?RDFKclFXdzVRVHl3NC9OeUtsOGw5L3plV2libU14MlI0d09ucUZFYmI3cEZU?=
 =?utf-8?B?ZjZhZkZibU1sUWhqWHpReEd3S1pid0hncGtHZjNsSllWN244djhWVStnaDVL?=
 =?utf-8?B?ME9yWkREYlNNRkRnd0xTZVM3NFpFWElNSFFTY0pLWUpMalhuVVBITUJEdS94?=
 =?utf-8?B?L0h3clpMYlpsT3ZFWE1WYzJ6M2VTVjJlZWc1MXhaK3VHTlhsL0o5dWs5UU40?=
 =?utf-8?B?bVpEZ0M0MWs5Y1Ivb0ZZMlZ6MHd2aWhIeTFrMnVuSnFvUVdwMEJteEtIeFJC?=
 =?utf-8?B?dzYvWlpYQytwWXBKVW83TmNDWDVNZ0psd2VBbEJnS3B4QnRkNmFrWVVzMCtn?=
 =?utf-8?B?YlY5MDJjdWI1dWpQdURjUmpVNlBRY0ZyMnByNEdNTnlxZkFKNnFEVVNjZmFQ?=
 =?utf-8?B?OEJyNzhXc3p0R254SHp4aVcvV0x1TzBTZkE5bWwwaUNxV0w3U3g0aU5qTjBK?=
 =?utf-8?B?ajdKUUZuNjZNbTRvR0t3cVRqT3doNVZMaDVuMjhycytTbVRZb21jaGQyTENh?=
 =?utf-8?B?azBQR29sZXl6WGJpTFhqS1hmeG9ReHpGZUlHVTZGRms5U2wwUWZYZndzM255?=
 =?utf-8?B?SXRPcnZEL1llMkR1U3FPWmpVbHErcGtTeUJ4eHBxYzE2R2UvQkpxSmlqRFVv?=
 =?utf-8?B?VE1xNStYN1E2NmtDVUEvVlZFaklsTC9MSmw1a0V4NHdFWGNJbnpsK1J2Z0Ux?=
 =?utf-8?B?YzVJd29Id1cxNEdlOVlGeGdDTkpPZjErV3JNZlk4T1hadUFkU083RkoybDE1?=
 =?utf-8?B?a3FORzdtdVY4ajFhUnN4c3I1WExZWFE0Z2pjMFloNnRka20yazFlSnhnK1Vk?=
 =?utf-8?B?MWsrS21iVWNOK2JqYmVWQlBuVlRxVXRTaVptRUJkcE9aZnBEK2s0aG5EanJk?=
 =?utf-8?B?V294M2pyUGF3TzViUDg3elRmRnQzdVhjNE80UncyRGNRVy94WGlnemNvUkVz?=
 =?utf-8?B?ampRZDc2am94RmNDclhwc0xzSHVyUUJuRFF4dFZKLzEwQ1pZRi9WcUNtRXdE?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DB65E7FFADD1C48A3772D713411293D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f45991a-9671-45c0-e1d1-08db5b4abf74
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 05:01:20.0584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0FJPXgFHcoLRqHFYPfqsRHC0jGulLG5SevFZxkfvZay0IZPMc8leu/XA/jpsW4ET/sy3L6y4JZr0Dbm06uV6sVCC375rdj2gWZPnvtKIRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gMjIuMDUuMjAyMyAxMDo0NCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgZGV2bV9rYXNwcmludGZfc3RyYXJyYXko
KSBmdW5jdGlvbiBkb2Vzbid0IHJldHVybiBOVUxMIG9uIGVycm9yLA0KPiBpdCByZXR1cm5zIGVy
cm9yIHBvaW50ZXJzLiAgVXBkYXRlIHRoZSBjaGVja3MgYWNjb3JkaW5nbHkuDQo+IA0KPiBGaXhl
czogZjQ5NGMxOTEzY2JiICgicGluY3RybDogYXQ5MTogdXNlIGRldm1fa2FzcHJpbnRmKCkgdG8g
YXZvaWQgcG90ZW50aWFsIGxlYWtzIChwYXJ0IDIpIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0KPiAtLS0NCj4gIGRy
aXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEuYyB8IDggKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXQ5MS5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
YXQ5MS5jDQo+IGluZGV4IDg3MTIwOWMyNDE1My4uMzk5NTZkODIxYWQ3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hdDkxLmMNCj4gKysrIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtYXQ5MS5jDQo+IEBAIC0xMzg5LDggKzEzODksOCBAQCBzdGF0aWMgaW50IGF0OTFf
cGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgICAg
ICAgICAgY2hhciAqKm5hbWVzOw0KPiANCj4gICAgICAgICAgICAgICAgIG5hbWVzID0gZGV2bV9r
YXNwcmludGZfc3RyYXJyYXkoZGV2LCAicGlvIiwgTUFYX05CX0dQSU9fUEVSX0JBTkspOw0KPiAt
ICAgICAgICAgICAgICAgaWYgKCFuYW1lcykNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07DQo+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKG5hbWVzKSkNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobmFtZXMpOw0KPiANCj4gICAgICAg
ICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBNQVhfTkJfR1BJT19QRVJfQkFOSzsgaisrLCBrKysp
IHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqbmFtZSA9IG5hbWVzW2pdOw0KPiBA
QCAtMTg3MCw4ICsxODcwLDggQEAgc3RhdGljIGludCBhdDkxX2dwaW9fcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIG5hbWVzID0g
ZGV2bV9rYXNwcmludGZfc3RyYXJyYXkoZGV2LCAicGlvIiwgY2hpcC0+bmdwaW8pOw0KPiAtICAg
ICAgIGlmICghbmFtZXMpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gKyAg
ICAgICBpZiAoSVNfRVJSKG5hbWVzKSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KG5hbWVzKTsNCj4gDQo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNoaXAtPm5ncGlvOyBpKysp
DQo+ICAgICAgICAgICAgICAgICBzdHJyZXBsYWNlKG5hbWVzW2ldLCAnLScsIGFsaWFzX2lkeCAr
ICdBJyk7DQo+IC0tDQo+IDIuMzkuMg0KPiANCg0K
