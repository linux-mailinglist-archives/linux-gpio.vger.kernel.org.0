Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C617F5974EC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 19:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240974AbiHQRV2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 13:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbiHQRV1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 13:21:27 -0400
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90071.outbound.protection.outlook.com [40.107.9.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246209D8ED;
        Wed, 17 Aug 2022 10:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+C+sUJXizkpxPz0XfJYpcNZ4YBmATVDolRqYiHSeydsv7VWwpqBB5y9DAVKhEU5JZ9jqVtPjAFGXht4Etjw+6QbCXrwHopHh/JRV5BChU9jq+uxlN8Zcx0iFeqLj9drOwwaebfBi7NlyXJ+zCDLwCVpI+/NgFnkF147d4/nAtakk4XBUe6+t/aCmHRIfYOxxsq7w35TerIW6RMtRHButmNvQwJNFrqsYeOiGKRrnlOSS2/lft4JWmrH69mJXBYUWk4XB+BvpFS1n7bxAia5MTvExMCtPTylWOU7eZ8FEVzEJv2yoP2kPbET0gLSUbz8/QKqvHIbaa+JdhWtTJYZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJCnagAR82ikb2Scvl8PiqO5BFkvZjdJsk4BprEw3/g=;
 b=PLmLFOMiowLjevD35o8yQHoui36sHWwEnUd7oNo6210aEUBzQvoG46vfWzbLQlYAI7+uMPvghvyrZSwW6/1o3R4hLEc5HhDRUNSjoqacaZQ/H8bihVI9qVc7KD3X5v+IZxZlnjlnbR35n/5MAoNMyMVB4i26Op4Zv+BDll2PgKeL/B8PkI4HbNVzznM9BZKb2AXkbLmIkvwVebFkOoI6mwipaXtOsZDG350wNbkXGJ4WheeyrzlOI25c9f7ptInGUWoRZ2mMifJGJkkSqWTHZrjsyboUtQDBusltxLDfQiLjTu4L4ENZG/j/rUI5UCrRtssS9Gu/BrBzXIguN7/X9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJCnagAR82ikb2Scvl8PiqO5BFkvZjdJsk4BprEw3/g=;
 b=1NP+D+VhH0eCiScl8k1it8yzRo6hyle6zfmdUP02SEPerXOK/XAGkLgWvuQY53jhe8I6O4UjKyXpf+oOa98qXWSfDkB44wNpfWorHTC0m3LUle+4DHIwsJCFo0v96HymmgVylQsknXtBEB8M26IxW9OklZdoq7GLWdj70MifzQXLfalytCCk67HYunzXWV3aThw3+jkA5A+j80OfHmQronTLyYqBD4Fc3RzD7lNPitdGKe1SJSAaAQilN59g3LzwdFXMP/ueQF8wuscA4SGsrnRZMszGHqnSFZY3SDo3zxH0Mjvua2OieK6Wz5fpssSRr8gzQyFFYjniA7RDbHKs7w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3321.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 17:21:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 17:21:22 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     "H. Peter Anvin" <hpa@zytor.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
Thread-Topic: [PATCH] gpio: Allow user to customise maximum number of GPIOs
Thread-Index: AQHYq9yc0+2EsNg9hki12SrFrcAXy62qIW6AgAlCYoA=
Date:   Wed, 17 Aug 2022 17:21:21 +0000
Message-ID: <ea14ec0a-72cb-9bb3-7ad8-d7c35e8eb810@csgroup.eu>
References: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
 <C1886F9A-1799-4E3D-9153-579D31488695@zytor.com>
In-Reply-To: <C1886F9A-1799-4E3D-9153-579D31488695@zytor.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd5986a2-fe2e-4825-15ab-08da8074e7d6
x-ms-traffictypediagnostic: PR0P264MB3321:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 18ebRSYcO/OYVCYLqIuHPw80xYZsw8Wiy8fYfh9yGsQD763M1brHIs9EwpD4m85ZLf5RlEFHe2Zyefd364PVfGY7P8MBBcDJwXIy4lqmViI0ESLaoma23HZQ5IPoindhukmJO7x2sYf6q6AIfAsoMm9+bQGSBSZEq7uEdqAPDpW1dY1FMUvlrsSP6U8WbNEvErX6zlE1igvs9ENIv/UT8AFnGIsfXMjA6hEDmc8tmira9e4OGu4hdAbeueB98++qB0lLNEzpWw83bMKVJA4esfwMVafhUSR9pcBzgaRf5rdFEkieJIfvcsice22gZsIa086UJayu1+CONULUfXub5IigBEOvO+BBrkYRVVg+PlP8Wlr9d61t5R6CguFDqQYzEFNxUAyYKRHoFXyQ5ddOfvkLiyTufyPCbWgJbaA0RJhDDjZdz+zhCpXxYU9JQW/w8YAwl70dZ37DjUkspu12nPJ4QdDedAiLI02dqyJKEaQA0ME54OHjG4oNBK7rZjC0pVETzz66nIYss7cQ8btBtjKsf0nIPbmZrit48J1Mc4MYneep0IPYe4B58PC0ymw1l11gVrByVkgW7bO0uU09mDhQ0jx7fRmpMytavjl/yppvvTrqDkRgXbUzGTRtwUQqcdtoOEYm9fIZ64kfXyHZBA5k+x3po4yKJ8ulGPoT/43pueHBVp0PV9WNYpQx3TYzPIfkF3Yip8Xs70pmG4U3s2wAHO0nKy4nTwAVqZxA/AN4ZSocsiTZFqD37do0bzeBEWE45yz7KfLXNaPkxVK2KBS9cer5YT2glv+/3XjDGZEXLGqu1CzoZjf326fOTezJnilc4TeWtNzYNTNEnth3/aZP/XnsiSmKt1uiKY4v1/S54RVNwyWyWZuusfvF5CeAuJU30f3IIS1MmWbURz2H5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(396003)(346002)(366004)(136003)(26005)(122000001)(71200400001)(316002)(38070700005)(91956017)(2616005)(41300700001)(7416002)(921005)(44832011)(66446008)(2906002)(6512007)(66476007)(66946007)(76116006)(8676002)(4326008)(38100700002)(66556008)(186003)(5660300002)(64756008)(31686004)(66574015)(478600001)(31696002)(54906003)(83380400001)(8936002)(110136005)(86362001)(36756003)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEVyeCtWZCsxSjRsbWZDa1FrSkV3eDVhdUhvT3RzWW1RUnhSbjQ2bW5DWGFk?=
 =?utf-8?B?NkV2VzlmeDhhVlJCSVBBS0FxNU5YS3NEcjVBeDNXMTlab21ZemEyQUE5dWUw?=
 =?utf-8?B?eFVOT3NqMldodXVJMVhPUGhMckxWZEpUN2gxN2xJUmc0MlNHOVVuak45aE9J?=
 =?utf-8?B?OFBnYTdIZlo2dWpNWnZpbXBka284MXhraWpqS3YwZ2RDSXJreUJUZ0JTN3Y4?=
 =?utf-8?B?Tkhub1M0eU80THVieHdJNDdyYWp4YXY4Vkl4MUJwVWFtYjd5UWJ0aWwyQXhZ?=
 =?utf-8?B?YTMyVkdjWFl2T2VsQXJxMVFDamdQTXRDZFQ0OThzUkFpU0x6REo0cXNycHBs?=
 =?utf-8?B?MDJEMHBtcXhFTjNVYW5GRmsxYVJTWC8rN3lZNFJEZm1hcCt5NVdtaDVsa09T?=
 =?utf-8?B?L200ZWgvUWRsRVVNLzM5MWw2VTU5Z003cmhCSXpKeEl1Nks0cW5oQy9xMkJk?=
 =?utf-8?B?VWZnS1B4UzM0WlJzYVpiZnZ0S0w1ellKNEVMQzl0cXg2d2FMN3RsaWpYU283?=
 =?utf-8?B?dE9kOTQrT3pKdGlWMjZYMmVFZ0hFRHNwbUIwY0krWkQwRXRsZGFCV1N5OGFa?=
 =?utf-8?B?MExsOWxGRmFZdEV5aHpRaUNpbEFPcFhBczhkZjJVQk9vbFFmUTNjSzhGeTZH?=
 =?utf-8?B?cFFvYnovOHNZZEMzNi9DUnVlRFlWZkt6NWFQaWp0Znd6RmZkOWNOZ0ZqejEv?=
 =?utf-8?B?Z01MSkRHM01sQ2xLSFl1MmhHYURhNk5VWEJoUGNmeFQrKzA0UXVTb3g3QjZV?=
 =?utf-8?B?czJ1MTdCUGtFNVFmMWJ4WWRZUkYrVXBLOUR2Mzl2TmVEakV2VXhXSW1BLzVy?=
 =?utf-8?B?L25CMmNhd1ExVzZaSDBseTlWeUJaUEg2OVN6NDk5dHF6WkxkLzMwdlVUdkFE?=
 =?utf-8?B?dkpmV1pRZ0dkbkI4ZmF2aHIzNk4yWk5FYk4zYVpyNm1EWG1DbnFXQVlRblVn?=
 =?utf-8?B?S3Z4cG1VU1M5VjNPR2RjYityMWdnTFZQTVJRb3dGdzdvUnNXc2F4TXZEOU12?=
 =?utf-8?B?UG1YWFA1cXhsTkUvZ3ZpNkIxbFVaN2g5U2pwT2tURFpoMlY5anBCdHBMVHhp?=
 =?utf-8?B?am45c0dISytQa2hpTkRLMWMzc0dtN0lMR2tQcS83cFllK3gwZWQyNDBHbWJl?=
 =?utf-8?B?UjlvdDdQOHZPV1pDWjhRc1ArSzhmM1NoTVNMdmlHWUdCSTBpRDBiVlhSdGVk?=
 =?utf-8?B?cE9xMG9Gajc5clEvQTVkeFg4MGcyL0RGOFE1dVJXRmFWS21EdWxEdHpodXdR?=
 =?utf-8?B?UEd2aUZIUU5qVmpWdTVGQmtGRVg2MWpVeTRwWUt4WFM5VzhtRWlGelhjTlRE?=
 =?utf-8?B?aVhTZ1V6OTRleWtJWTJLRTF6SGNnK09WcENoc3UraDJwdEx6NTFKcC94ZlJr?=
 =?utf-8?B?bFlXWWlmalR1a1MxckJYVi9nS2k2QnRESWlwWkpGRkYxdmxhU2FZY2ZMQWJG?=
 =?utf-8?B?R0FqOU9FWG5Qa0ljMDJnWURwWmxCaW5Qci94dkQ3TnMwR0RZOFJJdFVmNVl1?=
 =?utf-8?B?amg3UVlaWGhZOWlabWx1SGI0RGpUNnVXT1NVTDZlZFNHOXk1eG5FU1h3aWhZ?=
 =?utf-8?B?eEtpZTE3VWUrQ3FlU3dTdFE5OFM5dklZZXlmRk1nSUN3QjBYUis1aUJSOElp?=
 =?utf-8?B?a0loUVNha09OMk44V0N5L21KQmxzbGNFZmErVzM2QkJPWHcxQkF1dmFnZWRk?=
 =?utf-8?B?Z2dFb3pjVUduQ0NBRXRFMCtUK2N2Vlo4MVpSMkh5Nm1vYzlFUDZhVm56d01a?=
 =?utf-8?B?clAxTmI0U0JpQ3JUbUFGK254cmtMdlFxQU5kVlJxb1E3T2k4aFJERjZoRGlB?=
 =?utf-8?B?dUhZeTAvRjVHOEc5RWxkZUdwQUQwWFJLNENxdm9CWm5iU2NnUzF2eG9SbFVN?=
 =?utf-8?B?bkpmdm9QTTZwZWNvMjY1N0J1OWpab2ZndDdXZVNxMzlFTWNicE9EY1doWTVx?=
 =?utf-8?B?MlJSL1hDTnM5QVhnb1RGVXNucURrZlBqcndDb1AzbVBJdXlCa1NoSlllZlB6?=
 =?utf-8?B?NmFVVTBKSTZWajczVTVxUXJZOVI1SGRXRlYwalFsdU9KNnlMSEJ0bUIxSWlZ?=
 =?utf-8?B?cmx1b0o0em1iSDE3d0RiTVdOZlc5cHFhcWg5YjRhallBa0dEK1lTY0tJNERB?=
 =?utf-8?B?bjdWQW1wR3FjZHhDdUlYSjdmWDJSa2lIRHN2d245Z3QyVXEzR3FQMCtPclA3?=
 =?utf-8?Q?7YGc4YV5DLpFsp8T7EuVo+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B349BFBBD984D74CAEC4E40130AD8FE3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5986a2-fe2e-4825-15ab-08da8074e7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 17:21:21.9850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQXf4WQBn6hIH3xql7CYBOTD+C58bUwfPUfuu5nEqrwTEeITaT/G4n7WtFnHVQU0hUGFqJQABgk/tdr0KQ9kzFTgBa21zDNnVmnwIS3pyN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3321
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCkxlIDExLzA4LzIwMjIgw6AgMjE6NTcsIEguIFBldGVyIEFudmluIGEgw6ljcml0wqA6DQo+
IE9uIEF1Z3VzdCA5LCAyMDIyIDM6NDA6MzggQU0gUERULCBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4gQXQgdGhlIHRpbWUgYmVpbmcsIHRo
ZSBkZWZhdWx0IG1heGltdW0gbnVtYmVyIG9mIEdQSU9zIGlzIHNldCB0byA1MTINCj4+IGFuZCBj
YW4gb25seSBnZXQgY3VzdG9taXNlZCB2aWEgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljDQo+PiBD
T05GSUdfQVJDSF9OUl9HUElPLg0KPj4NCj4+IFRoZSBtYXhpbXVtIG51bWJlciBvZiBHUElPcyBt
aWdodCBiZSBkZXBlbmRlbnQgb24gdGhlIG51bWJlciBvZg0KPj4gaW50ZXJmYWNlIGJvYXJkcyBh
bmQgaXMgc29tZXdoYXQgaW5kZXBlbmRlbnQgb2YgYXJjaGl0ZWN0dXJlLg0KPj4NCj4+IEFsbG93
IHRoZSB1c2VyIHRvIHNlbGVjdCB0aGF0IG1heGltdW0gbnVtYmVyIG91dHNpZGUgb2YgYW55DQo+
PiBhcmNoaXRlY3R1cmUgY29uZmlndXJhdGlvbi4gVG8gZW5hYmxlIHRoYXQsIHJlLWRlZmluZSBh
DQo+PiBjb3JlIENPTkZJR19BUkNIX05SX0dQSU8gZm9yIGFyY2hpdGVjdHVyZXMgd2hpY2ggZG9u
J3QgYWxyZWFkeQ0KPj4gZGVmaW5lIG9uZS4gR3VhcmQgaXQgd2l0aCBhIG5ldyBoaWRkZW4gQ09O
RklHX0FSQ0hfSEFTX05SX0dQSU8uDQo+Pg0KPj4gT25seSB0d28gYXJjaGl0ZWN0dXJlcyB3aWxs
IG5lZWQgQ09ORklHX0FSQ0hfSEFTX05SX0dQSU86IHg4NiBhbmQgYXJtLg0KPj4NCj4+IE9uIGFy
bSwgZG8gbGlrZSB4ODYgYW5kIHNldCA1MTIgYXMgdGhlIGRlZmF1bHQgaW5zdGVhZCBvZiAwLCB0
aGF0DQo+PiBhbGxvd3Mgc2ltcGxpZnlpbmcgdGhlIGxvZ2ljIGluIGFzbS1nZW5lcmljL2dwaW8u
aA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dwaW8v
bGVnYWN5LnJzdCB8ICAyICstDQo+PiBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKystDQo+PiBhcmNoL2FybS9pbmNsdWRlL2FzbS9ncGlvLmggICAgICAgICAg
ICAgIHwgIDEgLQ0KPj4gYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsNCj4+IGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAxNCAr
KysrKysrKysrKysrKw0KPj4gaW5jbHVkZS9hc20tZ2VuZXJpYy9ncGlvLmggICAgICAgICAgICAg
ICB8ICA2IC0tLS0tLQ0KPj4gNiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
Z3Bpby9sZWdhY3kucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dwaW8vbGVnYWN5LnJz
dA0KPj4gaW5kZXggOWIxMmVlYjg5MTcwLi41NjZiMDZhNTg0Y2YgMTAwNjQ0DQo+PiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZ3Bpby9sZWdhY3kucnN0DQo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvZ3Bpby9sZWdhY3kucnN0DQo+PiBAQCAtNTU4LDcgKzU1OCw3IEBA
IFBsYXRmb3JtIFN1cHBvcnQNCj4+IFRvIGZvcmNlLWVuYWJsZSB0aGlzIGZyYW1ld29yaywgYSBw
bGF0Zm9ybSdzIEtjb25maWcgd2lsbCAic2VsZWN0IiBHUElPTElCLA0KPj4gZWxzZSBpdCBpcyB1
cCB0byB0aGUgdXNlciB0byBjb25maWd1cmUgc3VwcG9ydCBmb3IgR1BJTy4NCj4+DQo+PiAtSXQg
bWF5IGFsc28gcHJvdmlkZSBhIGN1c3RvbSB2YWx1ZSBmb3IgQVJDSF9OUl9HUElPUywgc28gdGhh
dCBpdCBiZXR0ZXINCj4+ICtJdCBtYXkgYWxzbyBwcm92aWRlIGEgY3VzdG9tIHZhbHVlIGZvciBD
T05GSUdfQVJDSF9OUl9HUElPLCBzbyB0aGF0IGl0IGJldHRlcg0KPj4gcmVmbGVjdHMgdGhlIG51
bWJlciBvZiBHUElPcyBpbiBhY3R1YWwgdXNlIG9uIHRoYXQgcGxhdGZvcm0sIHdpdGhvdXQNCj4+
IHdhc3Rpbmcgc3RhdGljIHRhYmxlIHNwYWNlLiAgKEl0IHNob3VsZCBjb3VudCBib3RoIGJ1aWx0
LWluL1NvQyBHUElPcyBhbmQNCj4+IGFsc28gb25lcyBvbiBHUElPIGV4cGFuZGVycy4NCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9LY29uZmlnIGIvYXJjaC9hcm0vS2NvbmZpZw0KPj4gaW5kZXgg
NTNlNmExZGE5YWY1Li5lNTViNjU2MGZlNGYgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybS9LY29u
ZmlnDQo+PiArKysgYi9hcmNoL2FybS9LY29uZmlnDQo+PiBAQCAtMTQsNiArMTQsNyBAQCBjb25m
aWcgQVJNDQo+PiAJc2VsZWN0IEFSQ0hfSEFTX0tDT1YNCj4+IAlzZWxlY3QgQVJDSF9IQVNfTUVN
QkFSUklFUl9TWU5DX0NPUkUNCj4+IAlzZWxlY3QgQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FE
RFJFU1NfU1BBQ0UNCj4+ICsJc2VsZWN0IEFSQ0hfSEFTX05SX0dQSU8NCj4+IAlzZWxlY3QgQVJD
SF9IQVNfUFRFX1NQRUNJQUwgaWYgQVJNX0xQQUUNCj4+IAlzZWxlY3QgQVJDSF9IQVNfUEhZU19U
T19ETUENCj4+IAlzZWxlY3QgQVJDSF9IQVNfU0VUVVBfRE1BX09QUw0KPj4gQEAgLTEyNDMsNyAr
MTI0NCw3IEBAIGNvbmZpZyBBUkNIX05SX0dQSU8NCj4+IAlkZWZhdWx0IDM1MiBpZiBBUkNIX1ZU
ODUwMA0KPj4gCWRlZmF1bHQgMjg4IGlmIEFSQ0hfUk9DS0NISVANCj4+IAlkZWZhdWx0IDI2NCBp
ZiBNQUNIX0g0NzAwDQo+PiAtCWRlZmF1bHQgMA0KPj4gKwlkZWZhdWx0IDUxMg0KPj4gCWhlbHAN
Cj4+IAkgIE1heGltdW0gbnVtYmVyIG9mIEdQSU9zIGluIHRoZSBzeXN0ZW0uDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dwaW8uaCBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2dwaW8uaA0KPj4gaW5kZXggZjNiYjhhMmJmNzg4Li40ZWJiYjU4ZjA2ZWEgMTAwNjQ0DQo+
PiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncGlvLmgNCj4+ICsrKyBiL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2dwaW8uaA0KPj4gQEAgLTIsNyArMiw2IEBADQo+PiAjaWZuZGVmIF9BUkNIX0FS
TV9HUElPX0gNCj4+ICNkZWZpbmUgX0FSQ0hfQVJNX0dQSU9fSA0KPj4NCj4+IC0vKiBOb3RlOiB0
aGlzIG1heSByZWx5IHVwb24gdGhlIHZhbHVlIG9mIEFSQ0hfTlJfR1BJT1Mgc2V0IGluIG1hY2gv
Z3Bpby5oICovDQo+PiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvZ3Bpby5oPg0KPj4NCj4+IC8qIFRo
ZSB0cml2aWFsIGdwaW9saWIgZGlzcGF0Y2hlcnMgKi8NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZw0KPj4gaW5kZXggZjk5MjBmMTM0MWM4Li5hOGM5
NTZhYmMyMWUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+PiArKysgYi9hcmNo
L3g4Ni9LY29uZmlnDQo+PiBAQCAtODIsNiArODIsNyBAQCBjb25maWcgWDg2DQo+PiAJc2VsZWN0
IEFSQ0hfSEFTX01FTV9FTkNSWVBUDQo+PiAJc2VsZWN0IEFSQ0hfSEFTX01FTUJBUlJJRVJfU1lO
Q19DT1JFDQo+PiAJc2VsZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNF
DQo+PiArCXNlbGVjdCBBUkNIX0hBU19OUl9HUElPDQo+PiAJc2VsZWN0IEFSQ0hfSEFTX1BNRU1f
QVBJCQlpZiBYODZfNjQNCj4+IAlzZWxlY3QgQVJDSF9IQVNfUFRFX0RFVk1BUAkJaWYgWDg2XzY0
DQo+PiAJc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncGlvL0tjb25maWcgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPj4gaW5kZXggMDY0MmY1Nzkx
OTZmLi4yNTBiNTBlZDQ0ZTEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwaW8vS2NvbmZpZw0K
Pj4gKysrIGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4+IEBAIC0xMSw2ICsxMSw5IEBAIGNvbmZp
ZyBBUkNIX0hBVkVfQ1VTVE9NX0dQSU9fSA0KPj4gCSAgb3ZlcnJpZGluZyB0aGUgZGVmYXVsdCBp
bXBsZW1lbnRhdGlvbnMuICBOZXcgdXNlcyBvZiB0aGlzIGFyZQ0KPj4gCSAgc3Ryb25nbHkgZGlz
Y291cmFnZWQuDQo+Pg0KPj4gK2NvbmZpZyBBUkNIX0hBU19OUl9HUElPDQo+PiArCWJvb2wNCj4+
ICsNCj4+IG1lbnVjb25maWcgR1BJT0xJQg0KPj4gCWJvb2wgIkdQSU8gU3VwcG9ydCINCj4+IAlo
ZWxwDQo+PiBAQCAtMjIsNiArMjUsMTcgQEAgbWVudWNvbmZpZyBHUElPTElCDQo+Pg0KPj4gaWYg
R1BJT0xJQg0KPj4NCj4+ICtjb25maWcgQVJDSF9OUl9HUElPDQo+PiArCWludCAiTWF4aW11bSBu
dW1iZXIgb2YgR1BJT3MiIGlmIEVYUEVSVA0KPj4gKwlkZXBlbmRzIG9uICFBUkNIX0hBU19OUl9H
UElPDQo+PiArCWRlZmF1bHQgNTEyDQo+PiArCWhlbHANCj4+ICsJICBUaGlzIGFsbG93cyB0aGUg
dXNlciB0byBzZWxlY3QgdGhlIG1heGltdW0gbnVtYmVyIG9mIEdQSU9zIHRoZQ0KPj4gKwkgIGtl
cm5lbCBtdXN0IHN1cHBvcnQuIFdoZW4gdGhlIGFyY2hpdGVjdHVyZSBkZWZpbmVzIGEgbnVtYmVy
DQo+PiArCSAgdGhyb3VnaCBDT05GSUdfQVJDSF9OUl9HUElPLCB0aGF0IHZhbHVlIGlzIHRha2Vu
IGFuZCB0aGUgdXNlcg0KPj4gKwkgIGNhbm5vdCBjaGFuZ2UgaXQuIE90aGVyd2lzZSBpdCBkZWZh
dWx0cyB0byA1MTIgYW5kIHRoZSB1c2VyDQo+PiArCSAgY2FuIGNoYW5nZSBpdCB3aGVuIENPTkZJ
R19FWFBFUlQgaXMgc2V0Lg0KPj4gKw0KPj4gY29uZmlnIEdQSU9MSUJfRkFTVFBBVEhfTElNSVQN
Cj4+IAlpbnQgIk1heGltdW0gbnVtYmVyIG9mIEdQSU9zIGZvciBmYXN0IHBhdGgiDQo+PiAJcmFu
Z2UgMzIgNTEyDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9ncGlvLmggYi9p
bmNsdWRlL2FzbS1nZW5lcmljL2dwaW8uaA0KPj4gaW5kZXggYWVhOWFlZTFmM2U5Li5lZTA5MGY1
MzRhYjggMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL2dwaW8uaA0KPj4gKysr
IGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9ncGlvLmgNCj4+IEBAIC0yNCwxMyArMjQsNyBAQA0KPj4g
ICAqIGFjdHVhbGx5IGFuIGVzdGltYXRlIG9mIGEgYm9hcmQtc3BlY2lmaWMgdmFsdWUuDQo+PiAg
ICovDQo+Pg0KPj4gLSNpZm5kZWYgQVJDSF9OUl9HUElPUw0KPj4gLSNpZiBkZWZpbmVkKENPTkZJ
R19BUkNIX05SX0dQSU8pICYmIENPTkZJR19BUkNIX05SX0dQSU8gPiAwDQo+PiAjZGVmaW5lIEFS
Q0hfTlJfR1BJT1MgQ09ORklHX0FSQ0hfTlJfR1BJTw0KPj4gLSNlbHNlDQo+PiAtI2RlZmluZSBB
UkNIX05SX0dQSU9TCQk1MTINCj4+IC0jZW5kaWYNCj4+IC0jZW5kaWYNCj4+DQo+PiAvKg0KPj4g
ICAqICJ2YWxpZCIgR1BJTyBudW1iZXJzIGFyZSBub25uZWdhdGl2ZSBhbmQgbWF5IGJlIHBhc3Nl
ZCB0bw0KPiANCj4gVGhpcyBzZWVtcyB2ZXJ5IG9kZCB0byBtZS4gR1BJT3MgY2FuIGJlLCBhbmQg
b2Z0ZW4gYXJlLCBhdHRhY2hlZCB0byBwZXJpcGhlcmFsIGJ1c2VzIHdoaWNoIG1lYW5zIHRoYXQg
dGhlICpzYW1lIHN5c3RlbSogY2FuIGhhdmUgYW55dGhpbmcgZnJvbSBub25lIHRvIHRob3VzYW5k
cyBvZiBncGlvcyAuLg0KDQpFeGFjdGx5LCB0aGF0J3MgdGhlIHJlYXNvbiB3aHkgaXQgbmVlZHMg
dG8gYmUgY29uZmlndXJhYmxlIGluZGVwZW5kZW50bHkgDQpvZiB0aGUgYXJjaGl0ZWN0dXJlLg0K
DQpUaGUgcmVxdWlyZWQgbnVtYmVyIG9mIEdQSU9zIGRlcGVuZHMgb24gdGhlIG51bWJlciBvZiBi
b2FyZHMgSSBoYXZlIGluIA0KdGhlIHN5c3RlbSwgbm90IG9uIHdoZXRoZXIgaXQgaXMgYSB4ODZf
NjQsIGFuIGFybSBvciBhIHBvd2VycGMgQ1BVLg0KDQpJIGRpZCB0aGlzIHBhdGNoIGJlY2F1c2Ug
SSBmYWNlZCBhIHByb2JsZW0gYWZ0ZXIgSSBhZGRlZCBhIGJvYXJkIGluIG15IA0KcG93ZXJwYyBz
eXN0ZW0uIEF0IHRoZSB0aW1lIGJlaW5nIHBvd2VycGMgaGFzIHRoZSBkZWZhdWx0LCB3aGlsZSB4
ODZfNjQgDQpoYXMgMTAyNCwgYW5kIEkgdGhvdWdodCB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciB0
byBnZXQgaXQgY29uZmlndXJhYmxlIA0KcmF0aGVyIHRoYW4gaGFyZCBjb2RpbmcgYSBoaWdoZXIg
bGltaXQgb24gcG93ZXJwYyBhcyBkb25lIG9uIHg4Nl82NCBvciANCnNldmVyYWwgc3BlY2lmaWMg
QVJNIHN5c3RlbXMuDQoNCk9uIHRoZSBsb25nIHJ1biB0aGUgYmVzdCB3b3VsZCBwcm9iYWJseSBi
ZSB0byBoYXZlIGl0IGR5bmFtaWMsIGJ1dCBpdCANCm1lYW5zIG1vcmUgY2hhbmdlcywgSSB0aGlu
ayBoYXZpbmcgaXQgY29uZmlndXJhYmxlIGF0IGJ1aWxkIHRpbWUgaXMgYSANCmdvb2QgY29tcHJv
bWlzZSBmb3IgdGhlIHRpbWUgYmVpbmcsIGlzbid0IGl0ID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
