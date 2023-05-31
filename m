Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3597718445
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237412AbjEaOIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 10:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237487AbjEaOIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 10:08:35 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::624])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AA730C3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 07:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVXhuvc6TmtMhBbt+a1oqQLJxaxFMH2z3j54LK3hArHTYjOuqtKfMl5cHHFmVfUMm3Okg00yVet7jGvu3B4/nUMP0AepiSQwXM4WagR7s2gXWj5DEm4ryPGJJbIWRlTGYXSGGjlcJN8eTn96/Mxw3Xq9oz7g1gWVwBBwQQA6LZnAsPXDUrHQehUnIvv6QBYpIoi8iDe2sTSDrWdgkBcjEMtreddMgZgKttapdofl1IjWyLO3F29+Oz03q+Ph+o2rE15t5SAtazmYn1bnVa5nJX8shA2dmvLgZmijOhgSKLpw20K5AXO2aDozYiujMJfGpuY0McvASmX5pRHme7/7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsl4kLb8xl9j3d6ndfJYCTEJJXADQMut6NMQ7DRR5mU=;
 b=Fgswe7WLe1xROiOc3btkbHuNdRcdMQyFSXBgl3lgniHV1OCYFY/Vp0PWZNahWlX33uF7QSmSg/hw026se4u5RvXkNRmsJxfdPwzwpan35jGQKw57KLhxGyZoaVxB/2T5yKssQaacd8EGLrvIUlxoM0r8RH0J5UjjI4BINSF7Yptv8TV9H8iTzjieFybzlgOCrMw2EJG9NR50zvCOaXuJiy8Tb5ia8q0rIEUouynNgEYvFevqlm/goorQuMj+2PV12h06KJSYo+mmctvcV/h2yYB4j/uSI1KnT/wyGC3UqJofVnTthgRCuYVE/7b9xADdypOMPxRNPR+CDCLZ++pGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exfo.com; dmarc=pass action=none header.from=exfo.com;
 dkim=pass header.d=exfo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=EXFO.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsl4kLb8xl9j3d6ndfJYCTEJJXADQMut6NMQ7DRR5mU=;
 b=hPWDf+GZr7RUNLUnuP8ZobWoeOXfZVPG/9TZX+34eEICqdJJWKc084MFD3Axar/EV46SBK4+rBdqxjURsvX/ohVGL2atnDq0IgEzfe23FZ7i8HrS44z1fw2SCCctJg/COQSxP2MrjB5EFi5RapY2rUhnzYw9rdgjpYnIgxap9uTP+u/8rgp8muv0lTNkpKLcS8pKocDrvmED0wo84JFQLpzDe4GmjWdSpPvcxA62sfQvoBBRWMr7Nuw7czaW7t81qbS3pLqU6uIuDWWmTjFnvM+cNhyOH3eBfbnNEzo95hjP9QIDdxI2QFhSffMeo+6eXfFEcCjabjMtlTSMp4goqQ==
Received: from PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 13:56:45 +0000
Received: from PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b]) by PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 13:56:44 +0000
From:   Gabriel Matni <gabriel.matni@exfo.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [E!] : Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Thread-Topic: [E!] : Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Thread-Index: AdmSWu+Yp0PkN8UmTbOZdoj4tQwCCAAfkhyAAAPonQAAA8LqAAAMnWEAAA0jWIAAGgMHcA==
Date:   Wed, 31 May 2023 13:56:44 +0000
Message-ID: <PH8PR11MB71426F12E518A6FD8A86D06B86489@PH8PR11MB7142.namprd11.prod.outlook.com>
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZHXB83x85Qchv1XJ@sol> <ZHXcLvUNvw75Z-3W@surfacebook> <ZHX1bEThvg8Cq8zD@sol>
 <CAMRc=Mc8Wnv_vTizO_UMkKenqr8n2g44x_KAURV7EQhD5ZQXwg@mail.gmail.com>
 <ZHaiP/i6e38pH4G8@sol>
In-Reply-To: <ZHaiP/i6e38pH4G8@sol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exfo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7142:EE_|CO1PR11MB5140:EE_
x-ms-office365-filtering-correlation-id: 02346331-f8f5-4cfb-6ae9-08db61dede72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jugFyyftDpdP0HOFSl1T0be91TQZiq6Hhbbg3hJy+9+np/ihqEVAQIfTciPeNxKMBxorXCjx2myI2bWIo06hSxtxJ2KGttGnKq2GkTx4R9LjzUQCHgiZncCzykHtsAKkc0iIuEuszfkRKR6eCEb3QT6t2WvecWKgBe+nb5GTWWFJ8OcG6YKhaV2hx5afaXJoSBZ5qm677E0qgBfH9axra1BO+wZusVrf8VVaGto4tT+x0jvSkyGusrrvPIdoOUZECZMyHtw6pmY8IYuAKwYtb1io9IxPlRX6VvA/mN3qXcVpaMiqY87Kv2Qfx6+vCM/sfPqw2JyddI7lROcxuCwKlQdPtrXG8AkU35wV3xUphv+ANoG/EuBzOvxPQ/asSOJkCjOxFbF7jE9G1Ik3uVvPZ0IJ6zbdBuW7Luj5nuf/0O5y+NNurvXMCMjAHkzgtqQrLABQWnJHJqzdNjz3O0swGFbDfNTYpGWSMaQcAoLotJYFjhwXCi8+FHVb8SY/RbXD4ooKxQk0fDG/KsbutaCELnZoHMyNcCQF+ShoJk7eoIyCAzS6vnMk9yo70ujv+Z9FK4KGzH2LKgVK+bucrMK4xUTErdu9J/HGoLdzdFqp24D+rXNtKnKj4uyBfj60BSAt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39850400004)(376002)(366004)(396003)(451199021)(55016003)(186003)(52536014)(54906003)(7696005)(5660300002)(38100700002)(122000001)(316002)(110136005)(86362001)(76116006)(66476007)(66946007)(64756008)(4326008)(33656002)(66556008)(71200400001)(41300700001)(478600001)(66446008)(8676002)(53546011)(6506007)(8936002)(9686003)(44832011)(38070700005)(83380400001)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHRySGVRUnFKUk52OEY5cGNCZ25LUVVid2Nsb0dya2hpWE0wTVR2MjlzbHBX?=
 =?utf-8?B?ZDJhUEo1OU9lQ0U3Tmx2Z1Q1ZjhXNXl4eXdGRVVTL3c2Z2g1TFFSc010VEdW?=
 =?utf-8?B?c2NEWkdQMTk2L1dRcDN0ZVRwaVhIRWRmR09KUVg0SFJBZFhib3k2bERTYWdD?=
 =?utf-8?B?ZGFsNG41OEt1M2pUNTVMOTd0TUo4WDV2NVFEUklJU3B3Z1NpOXlDTWhWdzVC?=
 =?utf-8?B?d0FTNk5QSEVKdllNUWVqQVpYZHpiVVAzaHN2d0xEbjBkeDdGMzdWdlVPTFZv?=
 =?utf-8?B?OXRNQXo0TVh2VHNkUHBiRjNIZ3BjNVJiWUpLenA4c04zaVQrR2xqek5oVVFk?=
 =?utf-8?B?M0o2b002V3hPWmtWelJCMFBQU1hmRm44YVVFZ3JFSnRZaFZ1d2plZXl2VDZw?=
 =?utf-8?B?SldUaUhrVzNIZEFZcGZjc0hRUUtIa2tXeG81d0dVNnpQTkFLN3pWbm0rVE9K?=
 =?utf-8?B?WTM0OU5ZYlNJR1p2dU5FeFMrZDVBbGVqVlNFRU1sZ3FUTEVVRmFTcVlreFNP?=
 =?utf-8?B?ZTgvUFYyMWhZUnJqQVlSSlBoVHdHUHBlVDNDWDNrY2RiZUZYL1RzdUxmZ05P?=
 =?utf-8?B?WXFTSjVhM1F2TVlEcVZuMmJzcGIrNFNkaFFBZ3lmS1pCS0FNZkU0ZG9rNTN5?=
 =?utf-8?B?ZUdxRWtRRGxwU0RFK3pCamJWYmE4M0J0SjN6OE5QM0dQL2NTTlBXeHlHdU9D?=
 =?utf-8?B?TE5RZERXenBLWHBleGg2bGhMdHBQaEtxNmxwNm85S2NZK3dxQUQrNkgzMitV?=
 =?utf-8?B?b2MrY01VcTBnQlNzRG5MYmlrc3lCY0FsQjFCdjgvbnpoSlBIdHZXU1VxQlB4?=
 =?utf-8?B?eTdjb2xnYlFQMDB4RE1IZGxHZkxMa1ZJb2M1aGdnNjdsUzZpNXQrbEYzckNQ?=
 =?utf-8?B?R21jUGZ4WXRMNVlXb2pSYXY4K2dWZUtIMlJHRGl6OEpLTW5XUlFiZitPUzh2?=
 =?utf-8?B?SzUvTk1XczBaMFpMaG5FOFpwWWlVYVFEbnNrSUNMNk90ZjhNMjRkQUt1S3hI?=
 =?utf-8?B?K29sbnVTbEtmSGlrckQ2RHJaK2NaWGhTc0g2djh2eVVwOW9VT1pQSS92c0NN?=
 =?utf-8?B?WVlPZWZjU3JNeWY3T2FsOWd4dVExSTBERXltbldMQjNSQzVDOGNXR0ZGaUZ5?=
 =?utf-8?B?eEZ1Z3lhQk9LYkRTbXNXcG5Vb3lUbXIxY2ZwR0dBb21SejRlMnlZUTZ2WE8z?=
 =?utf-8?B?TEZ2R1ltY3doVXBuSzY2MDZIUEFZNk0zS2JCajdOeEorcUNGYlhPdGwveGJR?=
 =?utf-8?B?WEZGcVJOSFhNclBxYnIzQUdENDhIRmZQcDgyelBtTFlvUlZmQ3RaT1hucHhK?=
 =?utf-8?B?OGNqbWJNSUZGY1VXWW00dWpjVGlPM0dtWTZFWHkzTWdib2hHV01XSVNlTmth?=
 =?utf-8?B?MEtVckdsVEsxdzJjdlh0OGNGQ21XM2ZtVkhvck1sTXJkYjk5MDVjQUo1SXlj?=
 =?utf-8?B?c0E0Y2tLTDhFN1MreDYwWm9ibUZMaGQwNDJ4Q01laUN1a3JiS2J1TG5sRm5F?=
 =?utf-8?B?ZjZUSVZBbUxJRjF0VXFjYlE1N3ZUTG10a2ord2dJbWl0WlRxZURTZFJsekhw?=
 =?utf-8?B?K0l5RWFTWlBqcERvbEducWFheldjdk5YOWk1ZFFXVGU4MFFaUzhTVHFtWEJF?=
 =?utf-8?B?Nm1qeGp5VS9JNm1zY0plRTcrVUVveDhLTTAwbTBQamF3cmE1b2dQY3VVODRa?=
 =?utf-8?B?eWVxRmhlRmhnbGxRbEZJM0REVDNaOFNFVFFIR0JWblh1bldIcEZnRTZzcWNC?=
 =?utf-8?B?OG5HQjE0bVlSTWJGZVhZMWxWdTJkL3dVZFQ5Y1RhdjdVQUt6SlFSNEJqVmJU?=
 =?utf-8?B?aW95L3oxVVRjQzR2QUNPOG1CSzh1VVFPN2pYOFVTSDVYVG5TcFE1Q1IyODh2?=
 =?utf-8?B?emZVK0hwRnE4U3dmQTJkRGRaWDlsWW9ZWVVuRHhvVkNkZ0tpQWtRbWEvVmx6?=
 =?utf-8?B?R1hFWlRSTnAxRnRCRXRzTmN1M0NPN3E0NlVoeUdvNWZPTG1WaWdraW00WnM4?=
 =?utf-8?B?ZHlERXdJQ2xXQ3BWQzJLNklDNUVDNXordm5LbWE0N1RUcHJGYm1oZytwbUor?=
 =?utf-8?B?c1RZaWszRjV2Y05RWHJybXhncHkwMEJsUHhVc1BFZzlPVDd1ZmdWN0RESTRQ?=
 =?utf-8?Q?8p01bDUMOc9OKZx8Wy+uEYSRZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: EXFO.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02346331-f8f5-4cfb-6ae9-08db61dede72
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 13:56:44.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1c75be0f-2569-4bcc-95f7-3ad9d904f42a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nh7rvDQoWdtyorfh23PCYtZuZXIHqeN7Bo2pSPYIf2Z9qV5fBWU3Fsp7UGL6/KzXMKm/0kS1iHUxatghpVs4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gS2VudCwgQmFydCwNCg0KSXQgc291bmRzIGdvb2QsIEknbGwgbWFrZSB0aGUgcmVjb21t
ZW5kZWQgY2hhbmdlcyBhbmQgc3VibWl0IGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoLg0KDQpU
aGFuayB5b3UhDQpHYWJyaWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBL
ZW50IEdpYnNvbiA8d2FydGhvZzYxOEBnbWFpbC5jb20+IA0KU2VudDogVHVlc2RheSwgTWF5IDMw
LCAyMDIzIDk6MjYgUE0NClRvOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0K
Q2M6IGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb207IEdhYnJpZWwgTWF0bmkgPGdhYnJpZWwubWF0
bmlAZXhmby5jb20+OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogW0UhXSA6
IFJlOiBbbGliZ3Bpb2RdW1BBVENIXSB0b29sczogZ3Bpb21vbjogYWRkIHRpbWVvdXQgb3B0aW9u
DQoNCk9uIFR1ZSwgTWF5IDMwLCAyMDIzIGF0IDA5OjEwOjEyUE0gKzAyMDAsIEJhcnRvc3ogR29s
YXN6ZXdza2kgd3JvdGU6DQo+IE9uIFR1ZSwgTWF5IDMwLCAyMDIzIGF0IDM6MDnigK9QTSBLZW50
IEdpYnNvbiA8d2FydGhvZzYxOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gVHVlLCBN
YXkgMzAsIDIwMjMgYXQgMDI6MjE6MThQTSArMDMwMCwgYW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNv
bSB3cm90ZToNCj4gPiA+IFR1ZSwgTWF5IDMwLCAyMDIzIGF0IDA1OjI5OjIzUE0gKzA4MDAsIEtl
bnQgR2lic29uIGtpcmpvaXR0aToNCj4gPiA+ID4gT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMDg6
MjA6NDRQTSArMDAwMCwgR2FicmllbCBNYXRuaSB3cm90ZToNCj4gPiA+ID4gPiBGcm9tOiBHYWJy
aWVsIE1hdG5pIDxnYWJyaWVsLm1hdG5pQGV4Zm8uY29tPg0KPiA+ID4NCj4gPiA+IC4uLg0KPiA+
DQo+ID4gSSB0YWtlIGl0IHlvdSB3b3VsZCBiZSBpbiBmYXZvdXIgb2YgYW4gaWRsZSB0aW1lb3V0
IG9wdGlvbiB0aGVuPw0KPiA+DQo+ID4gSSdtIHB1enpsZWQgd2h5IG5vIG9uZSBoYXMgZXZlciBh
c2tlZCBmb3IgaXQgYmVmb3JlLCBpZiBpdCBpcyANCj4gPiBzb21ldGhpbmcgdGhhdCBpcyBpbiBk
ZW1hbmQuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gS2VudC4NCj4gDQo+IEkgZG8gc2VlIHZhbHVl
IGluIHRoaXMgb3B0aW9uLiBJJ20gbm90IGJ1eWluZyB0aGUgYXJndW1lbnQgYWJvdXQgDQo+IGxv
c2luZyBldmVudHMgLSB0aGUgc2FtZSBjYW4gYmUgc2FpZCBpbiByZXZlcnNlIC0gYmVmb3JlIHdl
IGV2ZW4gDQo+IHJlcXVlc3QgYSBsaW5lLCB3ZSBjYW4gbG9zZSBldmVudHMgdG9vLg0KPiANCj4g
R2FicmllbDogcGxlYXNlIGFkZHJlc3MgdGhlIGlzc3VlcyBwb2ludGVkIG91dCBieSBLZW50IGlm
IHlvdSBzdGlsbCANCj4gd2FudCB0byBhZGQgdGhpcy4NCj4gDQoNCkFuZCBjb25zaWRlciBhZGRp
bmcgYSB0ZXN0IHRvIHRoZSB0ZXN0IHN1aXRlLCBhc3N1bWluZyB5b3UgaGF2ZSBhIHN1aXRhYmxl
IHRlc3QgZW52aXJvbm1lbnQuICBUaGVyZSBhcmUgdGltZW91dCB0ZXN0cyBmb3IgZ3Bpb3NldCB0
aGVyZSBhbHJlYWR5IGFzIGFuIGV4YW1wbGUuDQoNCkNoZWVycywNCktlbnQuDQoNCg==
