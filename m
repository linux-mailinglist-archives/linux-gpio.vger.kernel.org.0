Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD205701FE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 14:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiGKM02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 08:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiGKM01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 08:26:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1EC4B0E2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657542386; x=1689078386;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
  b=EQIA6BG8O3M9QCOCm8oJxZE+xnqCTuQUME4NHI/YbDvtlO9mVyx3nyuW
   jhVTPZcBk6Tc95fq0zBbziH9qHMFoThbjIzE7p+HOmtSKt/TauaA9tuU2
   UI989H+9ZjFECU9I7JDa9dhrm4/kbg7SN38kgZ1+afE9b8Jori7GYxw85
   waP4IvfNQsH3EmrUoHchM1HG82Oaax4LkLgRFw3IfXI4XvkedzqaILJQG
   2GvUMnKWyry2kMCQFowIUYQcJC7hA1t7S1wZTlg5bCiz8+U8n7niOvfX/
   RqG0KtCYzBYP9JQhReij2KRsuB1INFs+zwnKwywiYftVn1IbsFNy7Yb0R
   A==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="167267693"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2022 05:26:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 05:26:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Jul 2022 05:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVdbP31VNeKjFZlrteeIi+IKo+MMYGWpG4NdyS+zm5X7ucyk0lnuwA1DeTc3yVBRcyr1nCYho4+3GCsJ0HZHey7YCIAB9jd8P6xZPCdzgxVufuQi69JFt408Vx/EESaV6byIDvV2J1SRhh3sVT9pZnG5T2N9hH2hTV7pA3rDiGWpoTmNJZSNWblb/rIfQW85eskCF4lu6XFaAy0Gc8ZQOzpR+hSSEFc3/pQqhjxCJZ+VT6c54k03qlxKLt+iBscdP/pVvfl6gCHfNJaOLTnBtSjR0FbqPgFcfE0v9v+2z+WyuBu+iK5SMo0B1Wv86B/c4j/MPaQo8VLcdPso2hydNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
 b=lp6WXNuO2DxrEgGa6HaEQ6kG+25YTibmtGhtjyGEbzqYwTkOcGaBWg0BaPLcUB3TXBSSmtgvoY9STdHj+SI26WIM2XDtQaXzzZltQpmHJFL9IUayDkq32zBG7614y5IDWenT2t9QwToxRtKHg0/kO+OwEtcxCACnyCYIMYw1PA19BkGB7MrK1jDXS5JPLzCyxBi+4ilA7ZNC3nFoGnCM+CvWV8g9wv8FiZNgwLjWkkAZvcsDOxe9hJ60fDeRWfv0QuAaiS7VPnbCk1TfqCbzXMBBWNjtPIfg7ojF3QhJMZiDjFkA/uaQNqKl7YHG6SH2VpaFAnOfZgVFn470qiA5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
 b=YgKiTPUDeJ+Fq0u4h/qZTaJlrL8ljRNVYNG6DTbt9hsybVMN1ocSVHOuzode1MEaoxIwu+gkCs8UQzBBmi2H1ybM3IuuujuhpsXM65rLwc8BKepyxW+SXzxJzFnBYweACzaAnPYwXXIZfVPEkrZFUjqwOIAIns822BPEZAnSABY=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by SN6PR11MB2926.namprd11.prod.outlook.com (2603:10b6:805:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 12:26:21 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 12:26:21 +0000
From:   <Lewis.Hanly@microchip.com>
To:     <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
        <palmer@dabbelt.com>
CC:     <paul.walmsley@sifive.com>, <Conor.Dooley@microchip.com>,
        <Daire.McNamara@microchip.com>
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Topic: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Index: AQHYkHYQCAXtENkIrkiuOdPJtyNDq61xHnwAgAgDcQA=
Date:   Mon, 11 Jul 2022 12:26:21 +0000
Message-ID: <a8f52555d18c677fda2aedf8acdbbb764132a1ed.camel@microchip.com>
References: <20220705134912.2740421-1-lewis.hanly@microchip.com>
         <20220705134912.2740421-2-lewis.hanly@microchip.com>
         <b916f508-aa9c-08df-f562-a0bd62163a95@codethink.co.uk>
In-Reply-To: <b916f508-aa9c-08df-f562-a0bd62163a95@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f8b4a6d-b2f9-433a-a913-08da6338900d
x-ms-traffictypediagnostic: SN6PR11MB2926:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jtf0CxEppnJWo+F9SrjoXTaAYQOXnpyQ/jzA8WLPZhreJusmnvhLqcdf+VS52L9hPVUjE3QqULkLMbfyjuwmUNhsFQq2ArSNeFibGyPct3Sa7mmF3DOWpsOxGLoMV0JF9wkKWo9YxkAFzuTDGx1z1PonuDHSEBqBSTrar2jZRyPwPM5Kq5bzI+WWvKsM74rOcIQfyqVC4bZh53DWxwZencuNjw+hvVoN/EUaaUfrNVONLJAffTnqtzRluVO8J8nlglVsPgtn8TGVD7pqoiofNk3QUvXjgSRnTkT9gRQ0gmBAK8Lotyk5OZ0zbIi6Ah71SuSnOHpsyY2VGy4OBJYt0J39BacbMFkM7cCAFD1uifuERW8FDEBmn5HrHP4u5CG6lteRAa1z4mWLS3MxNS+n0YM/4aKsr1DBVf7rFeZJSmr9L+OtBj0NPycUWIxAP0kSUKncYBWK9nNEkssbNiuP3PjGfUuCs6FbyoGVotl/0VCb8p5KXio0Ru94eIsbhODypezOtMdjiO98xcO1GQjKMfPS/pQQZb6Uha4UKqL+buVFYwD6UiCdbnq+pKx1HWPGmPWAA9lVjEBkH46XmAM4ZDXnyXfoe8VjGZqo60mMuExYsnDAQ5hIKHLfJnOG89T7I6K/A9nye7zYXa2CEan8jlfsHy9pW+Su/sNn1fTEIrfdGsQzJYTVZFH8GKhXsUE6GNNov2ar6LgKQtKF5Sr7Ry8AGApGYdFrbPnT9MQN4y0m8lZSHV4QTDX7i8nF6WI+Wb47kZOFqcD66EiPX+Q/mRCh4cpVx8kmYO0T+aqFAds6MMT8ildw8/RgVW60yQoH0pshCv8Vc2lkXYLvVMmVMSU1aB/XMD2i+TFX9cqsqvI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(396003)(376002)(366004)(54906003)(110136005)(316002)(41300700001)(966005)(478600001)(6486002)(6506007)(71200400001)(53546011)(2906002)(8936002)(64756008)(66946007)(66446008)(66556008)(66476007)(8676002)(76116006)(5660300002)(30864003)(91956017)(4326008)(36756003)(38070700005)(122000001)(26005)(6512007)(83380400001)(86362001)(107886003)(38100700002)(186003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGpteTlXdU9SOFRpZkUzZ2c3SjE1TnpJVXhJbXZtS1VEaWVCM1lZQ0pocFFm?=
 =?utf-8?B?dW02K1pPYkpEZHBIdzEyZ3pBMzZ6SkJJK2kwZDc1MU1TTFQzWGJwYmxTZXYz?=
 =?utf-8?B?NUw2WGs1UjR0WDg2K1pncnNxbXI3R1NSZmozQjIwYUFEbDVjTmZmZFNDVjk4?=
 =?utf-8?B?dk9XdllScFU4ZmtnR2FLVzhCY3JIOTBiNXZSZlRWU0JxM2syTHFoUC9RdDZy?=
 =?utf-8?B?QjdnUXAxL3A0eHQvdkloYzVkbTZBWGx4QmFuKzVDcmNWWmluTXErTFRnTHF1?=
 =?utf-8?B?a1dESm85V1JnaGFQTnhtRENwdkJSdzM4OHJIbE9mMUhObXBzZjZ1VE4rYm83?=
 =?utf-8?B?V2xmSkI5R01NMjdySEl1c3A2OTZVaXNXTysxL3dxaDIrRTVLa0Y3NW5HekUv?=
 =?utf-8?B?V0RaWEhVbWNVQStKNHdGYnozVGpoeDFzOHE4VjY0d2dxRzhYeW9DcTN0ZjFV?=
 =?utf-8?B?dm0zd09nYWlBeEVkbUlkRUFVVnkyUnhBRnhFT0R1MnVrL0FkTnl6WEpZY2xh?=
 =?utf-8?B?dzlHeVl1UzRmZ25QM0w1QUkwbE9oSzN6VXBvdEN2K3lXUVAxNUpWZ05WcnFr?=
 =?utf-8?B?dFZrcUlWMm1ycjN2dTdleTZWR2pnZCtTWEp3U2MxSXM0OXFKT01zY3I5ME1t?=
 =?utf-8?B?WU1JdHlQVFg2bzg1VUV3SUd2U3NVTUtpUzBwRVcyMStsY05SdzRxdWhHbnIx?=
 =?utf-8?B?eW9oY0c2LzlEVXBXLzJoOFNLbE94eVg3cE9mcVEzdHNsQzZGUnV0NVE4bTZB?=
 =?utf-8?B?UXVReEdhZjQ1VUVkSGpULzF4QzJkVzcrZkwrNG9RbWxFS0tkaS9kWkx2ZzMv?=
 =?utf-8?B?QzZ6NzN1eE1ESUpkM3pLT2JSeVNrRzU4QXJTT0NBSTY3dmRMSGd5aEgvcmpt?=
 =?utf-8?B?dzA2OEZoVkV2a1RjQVZUTkF2QnhkL0g4OE1OdzFZNmhBaERodGIycEcybVdy?=
 =?utf-8?B?TXIwcjRHLzB5TG00UkhDV1RWblh1MGgyUHdNNHVYUkN3VTRBU1BLMmhNbEtY?=
 =?utf-8?B?NVdDb0hNSjQ4bjVsa05ZbGFnRzJOWDV6OU5xT29hd0srUzY4QWwwWURUQ2dD?=
 =?utf-8?B?YlZUZkZTZXNibHVhWVpRWkxLR0lieFJDZHgwcDJzb0FwZ3JSRXY2STVLVU9u?=
 =?utf-8?B?aE11RHE0NWpTRUg2NlYxK2lsZUxNcktTbGx5MGRHYWpEcnN6MElZTXMyN0xt?=
 =?utf-8?B?NW1DajErR2d2YllJR2xCVlNzalk2clllQW85MEpNZm1JVXJKV3VrTkhZVUNp?=
 =?utf-8?B?aWZUTEJqdzZIdXE2NVhFRmpybGdjcHhDNGtTSDY2aFVBblB0d1EzcHh1SmEy?=
 =?utf-8?B?VkVNSFliV0lCTXZtRHcrNGM0UEJkcU1ORVptR0RqM2hhaGpYQ3JsdDVkQjVl?=
 =?utf-8?B?Q3JlaVk3NCtadzFBWDdJNlF5M2kvNVk3WDBoM2ozWEF1TGw3ZE1yQi9FcXRU?=
 =?utf-8?B?Q293b043dU1TaHBsaHlaTkNmSHRUcnJSN25QR3UwNEhYdG5qTkVVQW1ZYjdw?=
 =?utf-8?B?dmZHWEQxd2dVZVBMSzFoZzd2K1greXIwbTc2ektJbUVvV0p0NlkvSDlTMkZL?=
 =?utf-8?B?MDBiTFZRRTJhUVRiL1p0MVhVZTdCNUZWWGlMRU5RdGo2aVRoQW1GOG9SRVVu?=
 =?utf-8?B?YklJRlp2ZzBrWGpTRWtvaTJWV3FrdUN3Q2dZYzBkZnJZeGlqcTBUZUhOSTB3?=
 =?utf-8?B?Z0RhUVU5RStSaTFNK3hSNVRwMGtocy83amxUaXhyM2FPQlkxNU94T2JJQnow?=
 =?utf-8?B?WWlKZVRKTm5xL1NQQ3gxNGZ5VnNCWkdzMk1pTEJtaW1ZdE5GQ1Vselp5MWpV?=
 =?utf-8?B?MXRnRUtqOVBQMWlqUEEzWEN0WEZGRkx6S0ZEWnFXaytBYkx6M1lsSG5DS2hu?=
 =?utf-8?B?TTdjY0dyZzlJc0pXMEdTMzVSTzN4MUZneDZsbGp0cDV0WGZKU0IrYlAxU0hI?=
 =?utf-8?B?WFdKYTZ1NTlXc045VFdnaStuOUdNN2JrZy9EeUw2NTVXc0dzWUFpTXZ2R3hC?=
 =?utf-8?B?dGcwL3MwaFd5ZkJXTCtqOGlJeTdLTXlpWGN3TzBYMkRuV1oxUzNZTWdRbGY0?=
 =?utf-8?B?UUlFTHprRS9JSU10VGRGNGttcytGRk8rZHpxL09LdTlTdUVjd2I2N2s5QnB6?=
 =?utf-8?B?NGRYeXlTelNsMlhMNHVha0pJRGh1M2VHV3ZrN3JMNjVMVC8rTmNyVTZpa3Ru?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E0DBA9B62B6F84396A01B6D0CD759E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8b4a6d-b2f9-433a-a913-08da6338900d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 12:26:21.2323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qe5SccqsbAuqNikAo0aMieLoqoRGf+k5mO/rSmfaQ1edSudJuSoQlJQMa/67TV11nihntDoknx6deoOx2d0A6Id8m+FEGkORuyTqeOSHWdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2926
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpUaGFua3MgQmVuIGZvciBmZWVkYmFjayx3b3JraW5nIG9uIG5leHQgdmVyc2lvbiB3aXRoIHNv
bWUgb2YgeW91cg0KdXBkYXRlcyBhbmQgYWxzbyBmcm9tIE1hcmMuDQoNClJlZ2FyZHMsDQpMZXdp
cw0KDQpPbiBXZWQsIDIwMjItMDctMDYgYXQgMTE6MDMgKzAxMDAsIEJlbiBEb29rcyB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNS8wNy8y
MDIyIDE0OjQ5LCBsZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPiA+IEZyb206IExl
d2lzIEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tPg0KPiA+IA0KPiA+IEFkZCBhIGRy
aXZlciB0byBzdXBwb3J0IHRoZSBQb2xhcmZpcmUgU29DIGdwaW8gY29udHJvbGxlci4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMZXdpcyBIYW5seSA8bGV3aXMuaGFubHlAbWljcm9jaGlwLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICB8ICAgNyArDQo+ID4g
ICBkcml2ZXJzL2dwaW8vTWFrZWZpbGUgICAgfCAgIDEgKw0KPiA+ICAgZHJpdmVycy9ncGlvL2dw
aW8tbXBmcy5jIHwgMzU4DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDM2NiBpbnNlcnRpb25zKCspDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncGlvL2dwaW8tbXBmcy5jDQo+ID4gDQo+IA0KPiBzbmlw
DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1tcGZzLmMgYi9kcml2ZXJz
L2dwaW8vZ3Bpby1tcGZzLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uZGY0OGYyODM2ZTk3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3Bpby9ncGlvLW1wZnMuYw0KPiA+IEBAIC0wLDAgKzEsMzU4IEBADQo+ID4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCkNCj4gPiArLyoNCj4gPiArICogTWljcm9j
aGlwIFBvbGFyRmlyZSBTb0MgKE1QRlMpIEdQSU8gY29udHJvbGxlciBkcml2ZXINCj4gPiArICoN
Cj4gPiArICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjIgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5j
LiBhbmQgaXRzDQo+ID4gc3Vic2lkaWFyaWVzDQo+ID4gKyAqDQo+ID4gKyAqIEF1dGhvcjogTGV3
aXMgSGFubHkgPGxld2lzLmhhbmx5QG1pY3JvY2hpcC5jb20+DQo+ID4gKyAqDQo+ID4gKyAqLw0K
PiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L2Vycm5vLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+DQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL2NoYWluZWRfaXJxLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9vZi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NwaW5s
b2NrLmg+DQo+ID4gKw0KPiA+ICsjZGVmaW5lIE5VTV9HUElPICAgICAgICAgICAgICAgICAgICAg
MzINCj4gPiArI2RlZmluZSBCWVRFX0JPVU5EQVJZICAgICAgICAgICAgICAgICAgICAgICAgMHgw
NA0KPiA+ICsjZGVmaW5lIE1QRlNfR1BJT19FTl9JTlQgICAgICAgICAgICAgMw0KPiA+ICsjZGVm
aW5lIE1QRlNfR1BJT19FTl9PVVRfQlVGICAgICAgICAgQklUKDIpDQo+ID4gKyNkZWZpbmUgTVBG
U19HUElPX0VOX0lOICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQ0KPiA+ICsjZGVmaW5lIE1Q
RlNfR1BJT19FTl9PVVQgICAgICAgICAgICAgQklUKDApDQo+ID4gKw0KPiA+ICsjZGVmaW5lIE1Q
RlNfR1BJT19UWVBFX0lOVF9FREdFX0JPVEggMHg4MA0KPiA+ICsjZGVmaW5lIE1QRlNfR1BJT19U
WVBFX0lOVF9FREdFX05FRyAgMHg2MA0KPiA+ICsjZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9F
REdFX1BPUyAgMHg0MA0KPiA+ICsjZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9MRVZFTF9MT1cg
MHgyMA0KPiA+ICsjZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9MRVZFTF9ISUdIICAgICAgICAw
eDAwDQo+ID4gKyNkZWZpbmUgTVBGU19HUElPX1RZUEVfSU5UX01BU0sgICAgICAgICAgICAgIEdF
Tk1BU0soNywgNSkNCj4gPiArI2RlZmluZSBNUEZTX0lSUV9SRUcgICAgICAgICAgICAgICAgIDB4
ODANCj4gPiArI2RlZmluZSBNUEZTX0lOUF9SRUcgICAgICAgICAgICAgICAgIDB4ODQNCj4gPiAr
I2RlZmluZSBNUEZTX09VVFBfUkVHICAgICAgICAgICAgICAgICAgICAgICAgMHg4OA0KPiA+ICsN
Cj4gPiArc3RydWN0IG1wZnNfZ3Bpb19jaGlwIHsNCj4gPiArICAgICB2b2lkIF9faW9tZW0gKmJh
c2U7DQo+ID4gKyAgICAgc3RydWN0IGNsayAqY2xrOw0KPiA+ICsgICAgIHNwaW5sb2NrX3QgbG9j
azsgLyogbG9jayAqLw0KPiA+ICsgICAgIHN0cnVjdCBncGlvX2NoaXAgZ2M7DQo+ID4gK307DQo+
ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBtcGZzX2dwaW9fYXNzaWduX2JpdCh2b2lkIF9faW9tZW0g
KmFkZHIsIHVuc2lnbmVkIGludA0KPiA+IGJpdF9vZmZzZXQsIGludCB2YWx1ZSkNCj4gPiArew0K
PiA+ICsgICAgIHUzMiBvdXRwdXQgPSByZWFkbChhZGRyKTsNCj4gPiArDQo+ID4gKyAgICAgaWYg
KHZhbHVlKQ0KPiA+ICsgICAgICAgICAgICAgb3V0cHV0IHw9IEJJVChiaXRfb2Zmc2V0KTsNCj4g
PiArICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICBvdXRwdXQgJj0gfkJJVChiaXRfb2Zmc2V0
KTsNCj4gPiArDQo+ID4gKyAgICAgd3JpdGVsKG91dHB1dCwgYWRkcik7DQo+ID4gK30NCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX2RpcmVjdGlvbl9pbnB1dChzdHJ1Y3QgZ3Bpb19j
aGlwICpnYywNCj4gPiB1bnNpZ25lZCBpbnQgZ3Bpb19pbmRleCkNCj4gPiArew0KPiA+ICsgICAg
IHN0cnVjdCBtcGZzX2dwaW9fY2hpcCAqbXBmc19ncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2Mp
Ow0KPiA+ICsgICAgIHUzMiBncGlvX2NmZzsNCj4gPiArICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KPiA+ICsNCj4gPiArICAgICBpZiAoZ3Bpb19pbmRleCA+PSBOVU1fR1BJTykNCj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gDQo+ID4gKyAgICAgc3Bpbl9sb2NrX2ly
cXNhdmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICBncGlvX2Nm
ZyA9IHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIChncGlvX2luZGV4ICoNCj4gPiBCWVRFX0JPVU5E
QVJZKSk7DQo+ID4gKyAgICAgZ3Bpb19jZmcgfD0gTVBGU19HUElPX0VOX0lOOw0KPiA+ICsgICAg
IGdwaW9fY2ZnICY9IH4oTVBGU19HUElPX0VOX09VVCB8IE1QRlNfR1BJT19FTl9PVVRfQlVGKTsN
Cj4gPiArICAgICB3cml0ZWwoZ3Bpb19jZmcsIG1wZnNfZ3Bpby0+YmFzZSArIChncGlvX2luZGV4
ICoNCj4gPiBCWVRFX0JPVU5EQVJZKSk7DQo+ID4gKw0KPiA+ICsgICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICByZXR1
cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtcGZzX2dwaW9fZGlyZWN0aW9u
X291dHB1dChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiB1bnNpZ25lZCBpbnQgZ3Bpb19pbmRl
eCwgaW50IHZhbHVlKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IG1wZnNfZ3Bpb19jaGlwICpt
cGZzX2dwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ID4gKyAgICAgdTMyIGdwaW9fY2Zn
Ow0KPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKw0KPiA+ICsgICAgIGlmIChn
cGlvX2luZGV4ID49IE5VTV9HUElPKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+IA0KPiBJcyB0aGlzIG5lY2Vzc2FyeSwgc2hvdWxkbid0IGdwaW8gbGF5ZXIgaGF2ZSBjaGVj
a2VkIHRoaXMgYWxyZWFkeT8NCk5vLCByZW1vdmluZyBhbGwgaW5zdGFuY2VzLg0KPiANCj4gPiAr
ICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmbXBmc19ncGlvLT5sb2NrLCBmbGFncyk7DQo+ID4gKw0K
PiA+ICsgICAgIGdwaW9fY2ZnID0gcmVhZGwobXBmc19ncGlvLT5iYXNlICsgKGdwaW9faW5kZXgg
Kg0KPiA+IEJZVEVfQk9VTkRBUlkpKTsNCj4gPiArICAgICBncGlvX2NmZyB8PSBNUEZTX0dQSU9f
RU5fT1VUIHwgTVBGU19HUElPX0VOX09VVF9CVUY7DQo+ID4gKyAgICAgZ3Bpb19jZmcgJj0gfk1Q
RlNfR1BJT19FTl9JTjsNCj4gPiArICAgICB3cml0ZWwoZ3Bpb19jZmcsIG1wZnNfZ3Bpby0+YmFz
ZSArIChncGlvX2luZGV4ICoNCj4gPiBCWVRFX0JPVU5EQVJZKSk7DQo+ID4gKw0KPiA+ICsgICAg
IG1wZnNfZ3Bpb19hc3NpZ25fYml0KG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfT1VUUF9SRUcsDQo+
ID4gZ3Bpb19pbmRleCwgdmFsdWUpOw0KPiA+ICsNCj4gPiArICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZtcGZzX2dwaW8tPmxvY2ssIGZsYWdzKTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJu
IDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX2dldF9kaXJlY3Rp
b24oc3RydWN0IGdwaW9fY2hpcCAqZ2MsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGdwaW9faW5kZXgpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3Qg
bXBmc19ncGlvX2NoaXAgKm1wZnNfZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiAr
ICAgICB1MzIgZ3Bpb19jZmc7DQo+ID4gKw0KPiA+ICsgICAgIGlmIChncGlvX2luZGV4ID49IE5V
TV9HUElPKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBJcyB0aGlz
IG5lY2Vzc2FyeSwgc2hvdWxkbid0IGdwaW8gbGF5ZXIgaGF2ZSBjaGVja2VkIHRoaXMgYWxyZWFk
eT8NCj4gDQo+ID4gKyAgICAgZ3Bpb19jZmcgPSByZWFkbChtcGZzX2dwaW8tPmJhc2UgKyAoZ3Bp
b19pbmRleCAqDQo+ID4gQllURV9CT1VOREFSWSkpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoZ3Bp
b19jZmcgJiBNUEZTX0dQSU9fRU5fSU4pDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMTsNCj4g
PiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
bXBmc19ncGlvX2dldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBncGlvX2luZGV4KQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0
IG1wZnNfZ3Bpb19jaGlwICptcGZzX2dwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ID4g
Kw0KPiA+ICsgICAgIGlmIChncGlvX2luZGV4ID49IE5VTV9HUElPKQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBJcyB0aGlzIG5lY2Vzc2FyeSwgc2hvdWxkbid0IGdw
aW8gbGF5ZXIgaGF2ZSBjaGVja2VkIHRoaXMgYWxyZWFkeT8NCj4gDQo+ID4gKyAgICAgcmV0dXJu
ICEhKHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfSU5QX1JFRykgJg0KPiA+IEJJVChncGlv
X2luZGV4KSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIG1wZnNfZ3Bpb19zZXQo
c3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludA0KPiA+IGdwaW9faW5kZXgsIGludCB2
YWx1ZSkNCj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBtcGZzX2dwaW9fY2hpcCAqbXBmc19ncGlv
ID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+ID4gKw0KPiA+ICsgICAgIGlmIChncGlvX2luZGV4ID49IE5VTV9HUElPKQ0KPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuOw0KPiANCj4gSXMgdGhpcyBuZWNlc3NhcnksIHNob3VsZG4ndCBncGlv
IGxheWVyIGhhdmUgY2hlY2tlZCB0aGlzIGFscmVhZHk/DQo+IA0KPiA+ICsgICAgIHNwaW5fbG9j
a19pcnFzYXZlKCZtcGZzX2dwaW8tPmxvY2ssIGZsYWdzKTsNCj4gPiArDQo+ID4gKyAgICAgbXBm
c19ncGlvX2Fzc2lnbl9iaXQobXBmc19ncGlvLT5iYXNlICsgTVBGU19PVVRQX1JFRywNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvX2luZGV4LCB2YWx1ZSk7DQo+ID4gKw0KPiA+
ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IG1wZnNfZ3Bpb19pcnFfc2V0X3R5cGUoc3Ry
dWN0IGlycV9kYXRhICpkYXRhLCB1bnNpZ25lZA0KPiA+IGludCB0eXBlKQ0KPiA+ICt7DQo+ID4g
KyAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShk
YXRhKTsNCj4gPiArICAgICBpbnQgZ3Bpb19pbmRleCA9IGlycWRfdG9faHdpcnEoZGF0YSk7DQo+
ID4gKyAgICAgdTMyIGludGVycnVwdF90eXBlOw0KPiA+ICsgICAgIHN0cnVjdCBtcGZzX2dwaW9f
Y2hpcCAqbXBmc19ncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiA+ICsgICAgIHUzMiBn
cGlvX2NmZzsNCj4gPiArICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsNCj4gPiArICAg
ICBpZiAoZ3Bpb19pbmRleCA+PSBOVU1fR1BJTykNCj4gPiArICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiA+IA0KPiANCj4gSXMgdGhpcyBuZWNlc3NhcnksIHNob3VsZG4ndCBncGlvIGxh
eWVyIGhhdmUgY2hlY2tlZCB0aGlzIGFscmVhZHk/DQo+IA0KPiA+ICsgICAgIHN3aXRjaCAodHlw
ZSkgew0KPiA+ICsgICAgIGNhc2UgSVJRX1RZUEVfRURHRV9CT1RIOg0KPiA+ICsgICAgICAgICAg
ICAgaW50ZXJydXB0X3R5cGUgPSBNUEZTX0dQSU9fVFlQRV9JTlRfRURHRV9CT1RIOw0KPiA+ICsg
ICAgICAgICAgICAgYnJlYWs7DQo+ID4gKw0KPiA+ICsgICAgIGNhc2UgSVJRX1RZUEVfRURHRV9G
QUxMSU5HOg0KPiA+ICsgICAgICAgICAgICAgaW50ZXJydXB0X3R5cGUgPSBNUEZTX0dQSU9fVFlQ
RV9JTlRfRURHRV9ORUc7DQo+ID4gKyAgICAgICAgICAgICBicmVhazsNCj4gPiArDQo+ID4gKyAg
ICAgY2FzZSBJUlFfVFlQRV9FREdFX1JJU0lORzoNCj4gPiArICAgICAgICAgICAgIGludGVycnVw
dF90eXBlID0gTVBGU19HUElPX1RZUEVfSU5UX0VER0VfUE9TOw0KPiA+ICsgICAgICAgICAgICAg
YnJlYWs7DQo+ID4gKw0KPiA+ICsgICAgIGNhc2UgSVJRX1RZUEVfTEVWRUxfSElHSDoNCj4gPiAr
ICAgICAgICAgICAgIGludGVycnVwdF90eXBlID0gTVBGU19HUElPX1RZUEVfSU5UX0xFVkVMX0hJ
R0g7DQo+ID4gKyAgICAgICAgICAgICBicmVhazsNCj4gPiArDQo+ID4gKyAgICAgY2FzZSBJUlFf
VFlQRV9MRVZFTF9MT1c6DQo+ID4gKyAgICAgZGVmYXVsdDoNCj4gPiArICAgICAgICAgICAgIGlu
dGVycnVwdF90eXBlID0gTVBGU19HUElPX1RZUEVfSU5UX0xFVkVMX0xPVzsNCj4gPiArICAgICAg
ICAgICAgIGJyZWFrOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgc3Bpbl9sb2NrX2ly
cXNhdmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICBncGlvX2Nm
ZyA9IHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIChncGlvX2luZGV4ICoNCj4gPiBCWVRFX0JPVU5E
QVJZKSk7DQo+ID4gKyAgICAgZ3Bpb19jZmcgJj0gfk1QRlNfR1BJT19UWVBFX0lOVF9NQVNLOw0K
PiA+ICsgICAgIGdwaW9fY2ZnIHw9IGludGVycnVwdF90eXBlOw0KPiA+ICsgICAgIHdyaXRlbChn
cGlvX2NmZywgbXBmc19ncGlvLT5iYXNlICsgKGdwaW9faW5kZXggKg0KPiA+IEJZVEVfQk9VTkRB
UlkpKTsNCj4gPiArDQo+ID4gKyAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbXBmc19ncGlv
LT5sb2NrLCBmbGFncyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgdm9pZCBtcGZzX2dwaW9faXJxX2VuYWJsZShzdHJ1Y3QgaXJxX2RhdGEg
KmRhdGEpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZ3Bpb19jaGlwICpnYyA9IGlycV9kYXRh
X2dldF9pcnFfY2hpcF9kYXRhKGRhdGEpOw0KPiA+ICsgICAgIHN0cnVjdCBtcGZzX2dwaW9fY2hp
cCAqbXBmc19ncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KPiA+ICsgICAgIGludCBncGlv
X2luZGV4ID0gaXJxZF90b19od2lycShkYXRhKSAlIE5VTV9HUElPOw0KPiA+ICsNCj4gPiArICAg
ICBtcGZzX2dwaW9fZGlyZWN0aW9uX2lucHV0KGdjLCBncGlvX2luZGV4KTsNCj4gPiArICAgICBt
cGZzX2dwaW9fYXNzaWduX2JpdChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX0lSUV9SRUcsDQo+ID4g
Z3Bpb19pbmRleCwgMSk7DQo+ID4gKyAgICAgbXBmc19ncGlvX2Fzc2lnbl9iaXQobXBmc19ncGlv
LT5iYXNlICsgKGdwaW9faW5kZXggKg0KPiA+IEJZVEVfQk9VTkRBUlkpLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1QRlNfR1BJT19FTl9JTlQsIDEpOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICtzdGF0aWMgdm9pZCBtcGZzX2dwaW9faXJxX2Rpc2FibGUoc3RydWN0IGlycV9kYXRhICpk
YXRhKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0YV9n
ZXRfaXJxX2NoaXBfZGF0YShkYXRhKTsNCj4gPiArICAgICBzdHJ1Y3QgbXBmc19ncGlvX2NoaXAg
Km1wZnNfZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gPiArICAgICBpbnQgZ3Bpb19p
bmRleCA9IGlycWRfdG9faHdpcnEoZGF0YSkgJSBOVU1fR1BJTzsNCj4gPiArDQo+ID4gKyAgICAg
bXBmc19ncGlvX2Fzc2lnbl9iaXQobXBmc19ncGlvLT5iYXNlICsgTVBGU19JUlFfUkVHLA0KPiA+
IGdwaW9faW5kZXgsIDEpOw0KPiA+ICsgICAgIG1wZnNfZ3Bpb19hc3NpZ25fYml0KG1wZnNfZ3Bp
by0+YmFzZSArIChncGlvX2luZGV4ICoNCj4gPiBCWVRFX0JPVU5EQVJZKSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBNUEZTX0dQSU9fRU5fSU5ULCAwKTsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBtcGZzX2dwaW9faXJxY2hpcCA9IHsNCj4gPiAr
ICAgICAubmFtZSA9ICJtcGZzX2dwaW9faXJxY2hpcCIsDQo+ID4gKyAgICAgLmlycV9zZXRfdHlw
ZSA9IG1wZnNfZ3Bpb19pcnFfc2V0X3R5cGUsDQo+ID4gKyAgICAgLmlycV9lbmFibGUgPSBtcGZz
X2dwaW9faXJxX2VuYWJsZSwNCj4gPiArICAgICAuaXJxX2Rpc2FibGUgPSBtcGZzX2dwaW9faXJx
X2Rpc2FibGUsDQo+ID4gKyAgICAgLmZsYWdzID0gSVJRQ0hJUF9NQVNLX09OX1NVU1BFTkQsDQo+
ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3QgbXBmc19ncGlvX2lycV9oYW5k
bGVyKGludCBpcnEsIHZvaWQNCj4gPiAqbXBmc19ncGlvX2RhdGEpDQo+ID4gK3sNCj4gPiArICAg
ICBzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgKm1wZnNfZ3BpbyA9IG1wZnNfZ3Bpb19kYXRhOw0KPiA+
ICsgICAgIHVuc2lnbmVkIGxvbmcgc3RhdHVzOw0KPiA+ICsgICAgIGludCBvZmZzZXQ7DQo+ID4g
Kw0KPiA+ICsgICAgIHN0YXR1cyA9IHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfSVJRX1JF
Ryk7DQo+ID4gKw0KPiA+ICsgICAgIGZvcl9lYWNoX3NldF9iaXQob2Zmc2V0LCAmc3RhdHVzLCBt
cGZzX2dwaW8tPmdjLm5ncGlvKSB7DQo+ID4gKyAgICAgICAgICAgICBtcGZzX2dwaW9fYXNzaWdu
X2JpdChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX0lSUV9SRUcsDQo+ID4gb2Zmc2V0LCAxKTsNCj4g
PiArICAgICAgICAgICAgIGdlbmVyaWNfaGFuZGxlX2lycShpcnFfZmluZF9tYXBwaW5nKG1wZnNf
Z3Bpby0NCj4gPiA+Z2MuaXJxLmRvbWFpbiwgb2Zmc2V0KSk7DQo+ID4gKyAgICAgfQ0KPiA+ICsg
ICAgIHJldHVybiBJUlFfSEFORExFRDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBt
cGZzX2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+
ICsgICAgIHN0cnVjdCBjbGsgKmNsazsNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRl
di5vZl9ub2RlOw0KPiA+ICsgICAgIHN0cnVjdCBtcGZzX2dwaW9fY2hpcCAqbXBmc19ncGlvOw0K
PiA+ICsgICAgIGludCBpLCByZXQsIG5ncGlvOw0KPiA+ICsgICAgIHN0cnVjdCBncGlvX2lycV9j
aGlwICppcnFfYzsNCj4gPiArDQo+ID4gKyAgICAgbXBmc19ncGlvID0gZGV2bV9remFsbG9jKGRl
diwgc2l6ZW9mKCptcGZzX2dwaW8pLA0KPiA+IEdGUF9LRVJORUwpOw0KPiA+ICsgICAgIGlmICgh
bXBmc19ncGlvKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+
ICsgICAgIG1wZnNfZ3Bpby0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShw
ZGV2LCAwKTsNCj4gPiArICAgICBpZiAoSVNfRVJSKG1wZnNfZ3Bpby0+YmFzZSkpIHsNCj4gPiAr
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGRldmljZSBtZW1v
cnlcbiIpOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobXBmc19ncGlvLT5iYXNl
KTsNCj4gPiArICAgICB9DQo+IA0KPiBzZWVtcyB0byBiZSBhIG1peCBvZiBkZXZfZXJyIGFuZCBk
ZXZfZXJyX3Byb2JlKCkgaW4gaGVyZT8NCndpbGwgdXBkYXRlIHRvIHRvIHVzZSBvbmx5IGRldl9l
cnJfcHJvYmUNCj4gDQo+ID4gKyAgICAgY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5V
TEwpOw0KPiA+ICsgICAgIGlmIChJU19FUlIoY2xrKSkNCj4gPiArICAgICAgICAgICAgIHJldHVy
biBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIoY2xrKSwNCj4gPiAiZmFpbGVkIHRv
IGdldCBjbG9ja1xuIik7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJs
ZShjbGspOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJmYWlsZWQgdG8NCj4gPiBlbmFibGUgY2xvY2tc
biIpOw0KPiA+ICsNCj4gPiArICAgICBtcGZzX2dwaW8tPmNsayA9IGNsazsNCj4gPiArDQo+ID4g
KyAgICAgc3Bpbl9sb2NrX2luaXQoJm1wZnNfZ3Bpby0+bG9jayk7DQo+ID4gKw0KPiA+ICsgICAg
IG5ncGlvID0gb2ZfaXJxX2NvdW50KG5vZGUpOw0KPiA+ICsgICAgIGlmIChuZ3BpbyA+IE5VTV9H
UElPKSB7DQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKGRldiwgInRvbyBtYW55IGludGVycnVw
dHNcbiIpOw0KPiA+ICsgICAgICAgICAgICAgZ290byBjbGVhbnVwX2Nsb2NrOw0KPiA+ICsgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgbXBmc19ncGlvLT5nYy5kaXJlY3Rpb25faW5wdXQgPSBtcGZz
X2dwaW9fZGlyZWN0aW9uX2lucHV0Ow0KPiA+ICsgICAgIG1wZnNfZ3Bpby0+Z2MuZGlyZWN0aW9u
X291dHB1dCA9IG1wZnNfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0Ow0KPiA+ICsgICAgIG1wZnNfZ3Bp
by0+Z2MuZ2V0X2RpcmVjdGlvbiA9IG1wZnNfZ3Bpb19nZXRfZGlyZWN0aW9uOw0KPiA+ICsgICAg
IG1wZnNfZ3Bpby0+Z2MuZ2V0ID0gbXBmc19ncGlvX2dldDsNCj4gPiArICAgICBtcGZzX2dwaW8t
PmdjLnNldCA9IG1wZnNfZ3Bpb19zZXQ7DQo+ID4gKyAgICAgbXBmc19ncGlvLT5nYy5iYXNlID0g
LTE7DQo+ID4gKyAgICAgbXBmc19ncGlvLT5nYy5uZ3BpbyA9IG5ncGlvOw0KPiA+ICsgICAgIG1w
ZnNfZ3Bpby0+Z2MubGFiZWwgPSBkZXZfbmFtZShkZXYpOw0KPiA+ICsgICAgIG1wZnNfZ3Bpby0+
Z2MucGFyZW50ID0gZGV2Ow0KPiA+ICsgICAgIG1wZnNfZ3Bpby0+Z2Mub3duZXIgPSBUSElTX01P
RFVMRTsNCj4gPiArDQo+ID4gKyAgICAgaXJxX2MgPSAmbXBmc19ncGlvLT5nYy5pcnE7DQo+ID4g
KyAgICAgaXJxX2MtPmNoaXAgPSAmbXBmc19ncGlvX2lycWNoaXA7DQo+ID4gKyAgICAgaXJxX2Mt
PmNoaXAtPnBhcmVudF9kZXZpY2UgPSBkZXY7DQo+ID4gKyAgICAgaXJxX2MtPmhhbmRsZXIgPSBo
YW5kbGVfc2ltcGxlX2lycTsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gZGV2bV9pcnFfYWxsb2Nf
ZGVzY3MoJnBkZXYtPmRldiwgLTEsIDAsIG5ncGlvLCAwKTsNCj4gPiArICAgICBpZiAocmV0IDwg
MCkgew0KPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWxsb2NhdGUg
ZGVzY3NcbiIpOw0KPiA+ICsgICAgICAgICAgICAgZ290byBjbGVhbnVwX2Nsb2NrOw0KPiA+ICsg
ICAgIH0NCj4gPiArDQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiBTZXR1cCB0aGUgaW50ZXJy
dXB0IGhhbmRsZXJzLiBJbnRlcnJ1cHRzIGNhbiBiZQ0KPiA+ICsgICAgICAqIGRpcmVjdCBhbmQv
b3Igbm9uLWRpcmVjdCBtb2RlLCBiYXNlZCBvbiByZWdpc3RlciB2YWx1ZToNCj4gPiArICAgICAg
KiBHUElPX0lOVEVSUlVQVF9GQUJfQ1IuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgZm9yIChp
ID0gMDsgaSA8IG5ncGlvOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgIGludCBpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIGkpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
IGlmIChpcnEgPCAwKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGly
cSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXBmc19ncGlvX2ly
cV9oYW5kbGVyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUlFG
X1NIQVJFRCwgbXBmc19ncGlvLQ0KPiA+ID5nYy5sYWJlbCwgbXBmc19ncGlvKTsNCj4gPiArICAg
ICAgICAgICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycigm
cGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3QgaXJxDQo+ID4gJWQ6ICVkXG4iLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlycSwgcmV0KTsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgZ290byBjbGVhbnVwX2Nsb2NrOw0KPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ICsg
ICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gZ3Bpb2NoaXBfYWRkX2RhdGEoJm1wZnNfZ3Bp
by0+Z2MsIG1wZnNfZ3Bpbyk7DQo+ID4gKyAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAg
IGdvdG8gY2xlYW51cF9jbG9jazsNCj4gPiArDQo+ID4gKyAgICAgcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgbXBmc19ncGlvKTsNCj4gPiArICAgICBkZXZfaW5mbyhkZXYsICJNaWNyb2NoaXAg
TVBGUyBHUElPIHJlZ2lzdGVyZWQgJWQgR1BJT3NcbiIsDQo+ID4gbmdwaW8pOw0KPiA+ICsNCj4g
PiArICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gK2NsZWFudXBfY2xvY2s6DQo+ID4gKyAgICAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1wZnNfZ3Bpby0+Y2xrKTsNCj4gPiArICAgICByZXR1cm4g
cmV0Ow0KPiA+ICt9DQo+IA0KPiBkbyB5b3UgbmVlZCB0byBkZWFsIHdpdGggRVBST0JFREVGRVIg
aW4gdGhlIGFib3ZlIHByb2JlPw0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgbXBmc19ncGlv
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAg
c3RydWN0IG1wZnNfZ3Bpb19jaGlwICptcGZzX2dwaW8gPQ0KPiA+IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOw0KPiA+ICsNCj4gPiArICAgICBncGlvY2hpcF9yZW1vdmUoJm1wZnNfZ3Bpby0+
Z2MpOw0KPiA+ICsgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShtcGZzX2dwaW8tPmNsayk7DQo+
ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBtcGZzX2dwaW9fbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7
IC5jb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtcGZzLWdwaW8iLCB9LA0KPiA+ICsgICAgIHsgLyog
ZW5kIG9mIGxpc3QgKi8gfSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIG1wZnNfZ3Bpb19kcml2ZXIgPSB7DQo+ID4gKyAgICAgLnByb2JlID0gbXBm
c19ncGlvX3Byb2JlLA0KPiA+ICsgICAgIC5kcml2ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAu
bmFtZSA9ICJtaWNyb2NoaXAsbXBmcy1ncGlvIiwNCj4gPiArICAgICAgICAgICAgIC5vZl9tYXRj
aF90YWJsZSA9IG9mX21hdGNoX3B0cihtcGZzX2dwaW9fbWF0Y2gpLA0KPiA+ICsgICAgIH0sDQo+
ID4gKyAgICAgLnJlbW92ZSA9IG1wZnNfZ3Bpb19yZW1vdmUsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICtidWlsdGluX3BsYXRmb3JtX2RyaXZlcihtcGZzX2dwaW9fZHJpdmVyKTsNCj4gDQo+IE1PRFVM
RV9BVVRIT1IgYW5kIGFzc29jaWF0ZWQgaW5mbyBjb3VsZCBkbyB3aXRoIGJlaW5nIGF0IHRoZSBi
b3R0b20uDQoNCkl0J3Mgbm90IGEgbW9kdWxlLCBhdXRob3IgaW5mbyBhdCB0b3Agb2YgZmlsZS4N
Cg0KPiANCj4gLS0NCj4gQmVuIERvb2tzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh0
dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLw0KPiBTZW5pb3IgRW5naW5lZXIgICAgICAgICAgICAg
ICAgICAgICAgICAgQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cw0KPiANCj4gaHR0cHM6Ly93
d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbA0K
