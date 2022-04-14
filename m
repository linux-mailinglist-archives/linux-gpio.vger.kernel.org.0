Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281DF500889
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Apr 2022 10:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiDNIl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Apr 2022 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241049AbiDNIlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2022 04:41:53 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EADC1A
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2022 01:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwKhSOASfyy93oZ6qPLEO/fB9TZvDsbJh8Yh1hScxKAJ32JC9JWjIgkJ7s2bcCwqt0wzeuCrU1LNOUblRzk/J2dBEHLITEL/tTAg9n94zZa8/vkKSbcNiIuq30P7Zz6Lon/JVxSgFHGDDLvt/gfNM9ANJUAdH25QAy9z/UCjVYRZdJy1vrFIrBhj9M+6QWlczsEO/0qUj8/XbHLBOMzkj2cLvIWqZV5r25BMhzgk446/0LIUIHFmu4oGVS/HCETY/cCuQvluGkQCB5hFceA5KdtxtxFCuQ4QTCV75xe+o0g5M8c2i4NRm2WO6F9/0tgcoSM+8mOH8TCtidzXuWdKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcRNQRRpmxBwYHSGb0MknYb8o036O4NXoaceHqxFFBE=;
 b=D/8ug2ILdZahx5Hxy6zBrhQm/KFq89GKMOH8g6DshHOj3Jz8xNKD3M6PTWMxy1Cc3lxpm6OD5xWqD4xQeulsVgB4Dk5/DJpuW+bZTP80TmWA2mHkam4/dap/xBv77vYcEF/4XGM+rekRnfUuadyKBgv3sW9xi4DZwpTAptGiTqB0UxBaoGlE5qaZe04YSfEJi+3mMGnR4I3PWvMA3zrynGV2P/hLbMRf2LyPtc0pyVKlE5WlH8KqJqSjFJz5YWCKS9PcvKIpEvtUKfuXpdqBhW+i0rVow1c3VF3XEnCB6JaXiQQJKSUU4ts18lwWhyvnb2veC68sWcuQNJuzErIBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dpsolutions.se; dmarc=pass action=none
 header.from=dpsolutions.se; dkim=pass header.d=dpsolutions.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dpnorge.onmicrosoft.com; s=selector2-dpnorge-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcRNQRRpmxBwYHSGb0MknYb8o036O4NXoaceHqxFFBE=;
 b=IFxgKlpy5Ji47VwRovOivEXlJA606mz/R6pDHG+zLKPzKZMzNFQQYSOoZ6VIAmBpaWxgpJEZstHMfKyc5ayqK6WomTGezRsOFbIRmwmRa8BFhhCV7PXevQQ5AYRqjZFCzgUbv2g4r3CMuwakSPtLVEmwZh9057vK8lDLu+dbv1M=
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com (2603:10a6:7:21::21) by
 AM6PR04MB5750.eurprd04.prod.outlook.com (2603:10a6:20b:ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Thu, 14 Apr 2022 08:39:21 +0000
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::2145:63a8:e9bb:f61d]) by HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::2145:63a8:e9bb:f61d%4]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 08:39:21 +0000
From:   Markus Mirevik <markus.mirevik@dpsolutions.se>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Sv: Sv: GPIO level IRQ fires twice each time.
Thread-Topic: Sv: GPIO level IRQ fires twice each time.
Thread-Index: AdgOpXxQdH2ZPD1iRWSLqE0uLueYFgBRq0qAAEEMpqAAAeOwgAAAFJCADNAgeQAC6I9fIA==
Date:   Thu, 14 Apr 2022 08:39:21 +0000
Message-ID: <HE1PR04MB3100764AD4686D6E748A9BFEE6EF9@HE1PR04MB3100.eurprd04.prod.outlook.com>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
 <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <ea65d00c-b2d8-3be5-51d9-05c4dc1616c4@metafoo.de>
 <1c646fb4-16d5-bf93-cb7d-12683a428893@metafoo.de>
 <61b715ca-075f-0f93-1c0f-a256ceb2b057@ti.com>
In-Reply-To: <61b715ca-075f-0f93-1c0f-a256ceb2b057@ti.com>
Accept-Language: en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dpsolutions.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 612e0538-9b63-4ce2-3ea2-08da1df24593
x-ms-traffictypediagnostic: AM6PR04MB5750:EE_
x-microsoft-antispam-prvs: <AM6PR04MB5750239468C419416D627354E6EF9@AM6PR04MB5750.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /PDI3SIrwfy4QFkzOFS1OQLoXfVetY4bD6hsHwKc3GdLOGZycaARw7HISHvTd4gCaiV5pLZqqfz6FTPSfV+wrUyoHCG6oDsbR9ZDjJ245o8EyROpIcKnS/T4HDpRSWiTf7Q79azrC0IttFvqnDI3PSuppVVzCY6DpUiwAWqKg/Fn5LvzLRDoIT/6fg6RZ//df2sQd4TeBX1xcOBVU/L3fCvGaUfpsEUch0q+7xo2a2Pi1kWsypS2HbF589uES7TUmXyGLGezNoXRo7KViZdmvl+Z0aGp+b51J4tAYOc2jDF6JBl0DjX2R7x2BhuNy18PYF/bvKyg7pCuOL9iYFaO+psqxZxRk7vIW6fmVoiYOVauka+rM3TqrVbshkLEFENteQhFkNcqCtw6gLuMtoQiOf8paY0Wm5dl30tkxb00s3WImFxqd5KrTrfFzZgnvNHwsCuTCNJszxShqUXCBGrRXZMGJE5naqwVklP5H40VQgFvto6rpMuRiFYPOnHfPwQZyCl3h8BnHNJAxzHWBYNS65zaypOV6mmHJfSpDtd7RxrhpSSNTsIBt5QqFJsJgcPK2MHhrV2564fBx9kTu6hGW5HO2PXivA+MwfRMVa0pYc7u/J5C+6UrlvtlGCBabGBRtE3aXV1uhT6GntbiEe+SIKLcsgsdVBhGJuynSeMGxFkoZZjYUrPmuAOlC6K8zWzu/6RLG3XKJaP7C5A28rsQ7RRHBD7nMacxYrXNtcfyJ6CzyxBRND++CPU6x40dssBMwOam2W6teP8BzMTV5b6uCL4y2jnpRTa6tMCzTjJGUGs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3100.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39830400003)(376002)(136003)(346002)(366004)(396003)(52536014)(4326008)(44832011)(66476007)(33656002)(83380400001)(66556008)(966005)(8936002)(66946007)(508600001)(2906002)(122000001)(38070700005)(38100700002)(110136005)(316002)(8676002)(66446008)(64756008)(5660300002)(26005)(186003)(71200400001)(76116006)(53546011)(6506007)(9686003)(7696005)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1JTMlVlVU1mejlhZzdxMFJrOGt2anltZW5SMzRUMTAwTlZHZWltZFp4ejNz?=
 =?utf-8?B?OUo2ZXhBNVVBU0ZmT2d2aHp4RTI2SVpiU1BnaTBYSUxIZGM1L0NweEZnNnlX?=
 =?utf-8?B?V1pRdVZDN0dsNU1rM1gzNGNpNzRXUlp1Ym5wUWNwMEt6L2M0WTBKeFJ0Mkp3?=
 =?utf-8?B?aFN1UWJKcndHN05LUzZ0ZUJxbWY3NHE2dVRvUGxpSjhBUlBvN1FZSXNsWE1I?=
 =?utf-8?B?U3JLRUVwWnVIZHRmdDFaN2N1bXd5enlSeElNNGQrYzFXK2FCRktCQjBSS0hQ?=
 =?utf-8?B?ajFOODUzQ28xY0xhREU5d0JzMnlURDNCaW5SMU9YaFcvVEdkOEVjdDlNMGlm?=
 =?utf-8?B?UkdkTDU2Qk9YSFJvZWxLRHZBUmZ1dG03U3gzb3JIK0NGWGRhT1FxN01PTVRV?=
 =?utf-8?B?Z2w4WWxsTXRIeE5KK21NMytlRjZuY29SeWN5Sk1yNjV2cnlkaVJTcDdvb0lj?=
 =?utf-8?B?MG90Smh1STFLcnNkUlhFSTBjbVA5NFlCQUhQK3VqUjRUSFI4UXUyKzFBc2Fi?=
 =?utf-8?B?TW5NS1U3ekhWRFpST1dLREtQT0xsZVJVemJnNVF2N2Y2cGpFRC83UzE1eWhy?=
 =?utf-8?B?ekFPb05xc2hpZUdkNUFTV2htVmhFS0s0bzV2SnFWK2w3aVlENXRxQUlMaWh1?=
 =?utf-8?B?cUV0RVpBT1B3Mkdoak5tNnA1OHVtQmFEM0ZtaG0zOFZZK2hYZmdzMjNxK3BD?=
 =?utf-8?B?a094aEJpRllFYWJCYjBzSXlmd1NvYUw3emt4U1JNWGdFeDVrK0tkcHJSVmhr?=
 =?utf-8?B?WERwQTBMT2t6STduNkc0NkNJWUJUaFVrUEtNbTM1UjYxSHl3cHpWUVVCQWhq?=
 =?utf-8?B?S3hnK0FrU0FPZHBaS1lMUjVZSTRLbCtSbXdvbGRidnA2dmxnSjViWkdIK1NS?=
 =?utf-8?B?WWplVTd1czU4OTBIcFdQTEkwMUozUnlSRjduVDNmMm01UVJRcEhwSFozbjEy?=
 =?utf-8?B?V2J3SEhPZlRMSTlqU2tNcnJKTVhyY08za2hVaHZBM1BSdHlKdVN3am45Q2NF?=
 =?utf-8?B?TGRSaTZOSHBtbHRUNm1mQ3VrVDd0UUZPRGp2dzJJUmJDQk1yZCtBRUxPbEQ0?=
 =?utf-8?B?cXhmVGYzZFBZVFFteFg2ME16RXpXb3dFOGpqSWhuS3Iwd0lDbFJDZDgzUmg3?=
 =?utf-8?B?SEI2STh4WG4vclpZaTE1SGdlU3JndVRPL1MzcFNaOG5RTXp2OXBnWi9jRVFX?=
 =?utf-8?B?WWY4WHNEbkhmeC9vQktRM3lkYUd2OG5OTzRRYVFwTks5NUMxT0NmVDc4am5o?=
 =?utf-8?B?NkRuMGcxUE9VK1lYa2ZRUGtVTzdkRDhVRHY1Tm45VmpZTk1JK2NJeEt5eHYz?=
 =?utf-8?B?Z1pPMFN2SVpvdzY2blFLOVBSWXJmZDg2aXdCMXpHU2V4clM4OEJzc3ZaUTlO?=
 =?utf-8?B?Z3RrM0pINXhwYWRQODg3WWNqaUdIWlVUdCtvU2tMZ0czUERGeXNZNjdwaGtH?=
 =?utf-8?B?aWk5cHJUem1YNk5JVHJvZHQ1bVk5eFhTTGRtOHpTQlpZWFRsSU04elEyaVd1?=
 =?utf-8?B?SXMwMFg2ajhaQ0JmUVlHQ2dPaDdzV2s4cmF0YmN0dmo2dU5tZGdKUHpOZkJp?=
 =?utf-8?B?L3drT1pLUHVyU3VnaFdiN0dRREk0ZVJNSGhNZDRnd0Y3TWViamVwcVd0eE5I?=
 =?utf-8?B?VjFxVnM3b1hJTE4vYVhNbGpVVjFyVVd0MjhrU0JRbnpDamJKeUxKYzJJYlZ0?=
 =?utf-8?B?bXp6YmZ3dS9Lb2VFSWVmb25tU1dyMnhXSWMyZFF1M215SmFNbTEvbDYzL01v?=
 =?utf-8?B?RlpOMkxLeEU4MVZUOHJXZmRyMm9LcDVuaDhMKzh3ckRRTHhwTFNscGlpMmZr?=
 =?utf-8?B?SUNuNExvREtMeUsvMmZONEVxV21ob3JjMDhkUWhFVDNQeTUvT3U5aHVKWkIv?=
 =?utf-8?B?Q1IyeEo1ckhMR08xYk9uLzhuWmRldzI4cDZsYnhVQytISkI5enRXMEZWcnI0?=
 =?utf-8?B?VkNqVmxPM3ZleWdETm01M0JLWUtRUjFPNTRGYm5HbFhrcDdqdkdjY2NscldB?=
 =?utf-8?B?YlBiUzNWMVdoU2t6LzlWbWVNNXBMbWVOZFFnSXNpYnAvSk5BZDh5MDhxcWI0?=
 =?utf-8?B?NWliQkljSlBmcTZJdmhhZ0tOMFR2cDFrUEhlWUxLK2JXMnVtSnQ4RDVleTJQ?=
 =?utf-8?B?Nk9XSG1NSHoyZlNrSlVmUk1sZTdaQmQ0VENJMDRHTEV1TlR2NVRIT1ZKMnFz?=
 =?utf-8?B?dDFuNVdjQ3MvSUJCaWNKVXVNbjNkT0pTb2V1MnIza2Y2UFYwNko3WFRVY2V4?=
 =?utf-8?B?VUdRMkxZZjQ2ZzZDR2krK2hJa29mUWR6eVBFS24wcXFrMkgvRURCVldiOTFn?=
 =?utf-8?B?TnRRMy9EeFplTGhkZFZhVnBEdHN6cm1tL01WT2VOdDAyekFiQXkrYXVnQzBv?=
 =?utf-8?Q?USm45gNOpgFjm+GI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dpsolutions.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3100.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e0538-9b63-4ce2-3ea2-08da1df24593
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 08:39:21.1509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3a2c5ea5-12ca-4b9d-9883-156f72a0a4ae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjXWJS8Lko7FCawuUu+bgETkLXuEk20wUBlQ8e1r6hgwyRaIKlWo46+uccjDFhY9UmmTlrLP+Y/oO73/A8Hyl4FUL5rkoiMjbZFI6mU3PNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR3J5Z29yaWkNCg0KPiBPbiAyNC8wMS8yMDIyIDA5OjU4LCBMYXJzLVBldGVyIENsYXVzZW4g
d3JvdGU6DQo+ID4gT24gMS8yNC8yMiAwODo1NiwgTGFycy1QZXRlciBDbGF1c2VuIHdyb3RlOg0K
PiA+PiBPbiAxLzI0LzIyIDA4OjEyLCBNYXJrdXMgTWlyZXZpayB3cm90ZToNCj4gPj4+PiBPbiBG
cmksIEphbiAyMSwgMjAyMiBhdCAwOTowMzo0M0FNICswMDAwLCBNYXJrdXMgTWlyZXZpayB3cm90
ZToNCj4gPj4+Pj4gSSBoYXZlIGEgcHJvYmxlbSB3aXRoIGEgY3VzdG9tIGJvcmQgYmFzZWQgb24g
U29DIGFtMzM1eCBhbmQgYQ0KPiA+Pj4+PiBkcml2ZXINCj4gPj4+PiB1dGlsaXppbmcgYSBHUElP
IGxpbmUgZm9yIGludGVycnVwdHMuDQo+ID4+Pj4+IEkgaGF2ZSB0d28gbWNwMjUxOGZkIGNoaXAg
Y29ubmVjdGVkIG9uIG9uZSBTUEkgbGluZSBhbmQgZXZlcnl0aGluZw0KPiA+Pj4+IHdvcmtzLCBi
dXQgaXQncyBob2dzIGEgbG90IG9mIENQVS4NCj4gPj4+Pj4gSW4gdGhlIGN1cnJlbnQgc2V0dXAg
b25seSBvbmUgY2hpcCBpcyBjb25uZWN0ZWQgYW5kIGl0IG9ubHkgcmVjZWl2ZXMNCj4gcGFja2V0
cy4NCj4gPj4+Pj4NCj4gPj4+Pj4gVGhlIG1jcDI1MThmZCBpcyBjb25uZWN0ZWQgd2l0aCAyIGlu
dGVycnVwdCBsaW5lcyBvbmUgIm1haW4iIGFuZA0KPiA+Pj4+PiBvbmUgZm9yDQo+ID4+Pj4gcngg
ZnJhbWVzLg0KPiA+Pj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IGZvciBldmVyeSBmcmFtZSByZWNl
aXZlZCB0aGUgaW50ZXJydXB0IGhhbmRsZXINCj4gPj4+Pj4gaXMgcnVuDQo+ID4+Pj4gdHdpY2Us
IHdoaWNoIGlzIGtpbmQgb2YgZXhwZW5zaXZlIHNpbmNlIGl0J3MgYSBTUEkgY2FsbCB0byB0aGUg
Y2hpcA0KPiA+Pj4+IHRvIGNoZWNrIGludGVycnVwdCByZWdpc3RlcnMuDQo+ID4+Pj4+IFRvIG1l
IGl0IGxvb2tzIGxpa2UgdGhlIGludGVycnVwdCBpcyBmaXJlZCBhZ2FpbiBhcyBzb29uIGFzIGl0
J3MgdW5tYXNrZWQuDQo+ID4+Pj4gRWl0aGVyIGJlY2F1c2UgaXQncyBxdWV1ZWQ/IG9yIG1heWJl
IG5vdCBjbGVhcmVkIGludGVybmFsbHk/DQo+ID4+Pj4+IEkgaGF2ZSBzY29wZWQgdGhlIGludGVy
cnVwdCBzaWduYWwgYW5kIGl0cyByZWFsIGdvb2Qgd2l0aG91dCBhbnkNCj4gZ2xpdGNoZXMuDQo+
ID4+Pj4+DQo+ID4+Pj4+IEknbSBjdXJyZW50bHkgcnVubmluZyBhIHlvY3RvIGJ1aWxkOg0KPiA+
Pj4+PiBMaW51eCBib3Rla2NjIDUuMTAuNzkteW9jdG8tdGlueSAjMSBTTVAgVHVlIE5vdiAxNiAw
Mzo1Nzo0MyBVVEMNCj4gPj4+Pj4gMjAyMSBhcm12N2wgYXJtdjdsIGFybXY3bCBHTlUvTGludXgN
Cj4gPj4+Pj4NCj4gPj4+Pj4gQnV0IHRoZSBtY3AyNTF4ZmQgZHJpdmVyIGlzIGZyb20gbmV0LW5l
eHQvbWFzdGVyDQo+ID4+Pj4+DQo+ID4+Pj4+IG1jcDI1MXhmZF9pcnEgaXMgdGhlIGlycWhhbmRs
ZXIgZm9yIHRoZSBtY3AyNTE4ZmQgYW5kIGlzIGFkZGVkIGxpa2UNCj4gdGhpczoNCj4gPj4+Pj4g
ZXJyID0gcmVxdWVzdF90aHJlYWRlZF9pcnEoc3BpLT5pcnEsIE5VTEwsIG1jcDI1MXhmZF9pcnEs
DQo+ID4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSVJRRl9TSEFSRUQgfCBJUlFGX09ORVNIT1QsDQo+ID4+
Pj4+IGRldl9uYW1lKCZzcGktPmRldiksIHByaXYpOw0KPiA+Pj4+Pg0KPiA+Pj4+IFlvdSBoYXZl
bid0IHNldCBhIElSUUZfVFJJR0dFUiBmbGFnLCBzbyB5b3UgYXJlIGdldHRpbmcgdGhlDQo+ID4+
Pj4gImFzLWFscmVhZHktIGNvbmZpZ3VyZWQiIGJlaGF2aW91ciwgd2hpY2ggb24geW91ciBzZXR1
cCBpcyBib3RoDQo+IGVkZ2VzPw0KPiA+Pj4+IFRyeSBhZGRpbmcgSVJRRl9UUklHR0VSX1JJU0lO
RywgSVJRRl9UUklHR0VSX0ZBTExJTkcsDQo+ID4+Pj4gSVJRRl9UUklHR0VSX0hJR0ggb3IgSVJR
Rl9UUklHR0VSX0xPVywgYXMgYXBwcm9wcmlhdGUgdG8geW91cg0KPiB1c2UNCj4gPj4+PiBjYXNl
LCB0byB5b3VyIGZsYWdzLg0KPiA+Pj4+DQo+ID4+Pj4gQ2hlZXJzLA0KPiA+Pj4+IEtlbnQuDQo+
ID4+PiBJIGhhdmUgdHJpZWQgd2l0aCB0aGUgSVJRRl9UUklHR0dFUl9MT1cgZmxhZyBhcyB3ZWxs
LiBXaXRoIHNhbWUNCj4gcmVzdWx0LiBpLmUgdGhlIGludGVycnVwdCBpcyBmaXJlZCBhZ2FpbiBh
cyBzb29uIGFzIHRoZSBoYW5kbGVyIGlzIHJlYWR5LiBFdmVuIGlmDQo+IHRoZSBpbnRlcnJ1cHQg
bGluZSBpcyBkZWFjdGl2YXRlZC4NCj4gPj4+IEhvd2V2ZXIgaWYgSSBjaGFuZ2UgdGhlIHRyaWdn
ZXIgdG8gZWRnZSBmYWxsaW5nIHRoZSBpbnRlcnJ1cHQgd2lsbCBvbmx5IGZpcmUNCj4gb25jZS4g
QnV0IGhpcyB3aWxsIGluZXZpdGFibHkgbGVhZCB0byBhIG1pc3NlZCBlZGdlIGV2ZW50dWFsbHku
DQo+ID4+DQo+ID4+IERlcGVuZGluZyBvbiBob3cgdGhlIG1jcDI1MTggR1BJTyBjb250cm9sbGVy
IHdvcmtzIGludGVybmFsbHkgaXRzDQo+ID4+IGRyaXZlciBtaWdodCBoYXZlIHRvIHVzZSB0aGUg
aGFuZGxlX2Zhc3Rlb2lfaXJxKCkgZmxvdyB0byBhdm9pZCB0aGlzLg0KPiA+PiBJdCBpcyBub3Qg
dW5jb21tb24gdG8gaGF2ZSBoYXJkd2FyZSB3aGljaCBuZWVkcyBhIGxldmVsIElSUSBhY2tlZA0K
PiA+PiBhZnRlciB0aGUgaW50ZXJydXB0IGhhbmRsZXIgaGFzIHJ1biwgcmF0aGVyIHRoYW4gYmVm
b3JlIGxpa2UgdGhlDQo+ID4+IGhhbmRsZV9sZXZlbF9pcnEoKSBkb2VzLiBFLmcuDQo+ID4+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC9jbw0KPiA+PiBtbWl0L2RyaXZlcnMvZ3Bpby9ncGlvLQ0KPiB6eW5xLmM/aWQ9NmRk
ODU5NTA4MzM2ZjBmZDA3OGZkNjJmM2I5ZmU0MmEzMmFhDQo+ID4+IDM4ZTINCj4gPj4NCj4gPj4g
LSBMYXJzDQo+ID4+DQo+ID4gU29ycnksIEkgbWVhbnQgYERlcGVuZGluZyBvbiBob3cgdGhlIGFt
MzM1eCBpbnRlcnJ1cHQgY29udHJvbGxlcg0KPiA+IHdvcmtzLi4uYA0KPiA+DQo+IA0KPiANCj4g
Q291bGQgIHlvdSB0cnkgdG8gdGVzdCBiZWxvdyBkaWZmIChtYXkgbm90IGJlIGFwcGxpZWQgY2xl
YW5seSk6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jIGIvZHJp
dmVycy9ncGlvL2dwaW8tb21hcC5jIGluZGV4DQo+IDJhNGExMTYzNGRkMS4uNDFlYzU0YzM2MDlm
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMNCj4gKysrIGIvZHJpdmVy
cy9ncGlvL2dwaW8tb21hcC5jDQo+IEBAIC04OTYsNiArODk2LDggQEAgc3RhdGljIHZvaWQgb21h
cF9ncGlvX3VubWFza19pcnEoc3RydWN0IGlycV9kYXRhDQo+ICpkKQ0KPiAgICAgICAgICByYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJmJhbmstPmxvY2ssIGZsYWdzKTsNCj4gICAgICAgICAgb21hcF9z
ZXRfZ3Bpb19pcnFlbmFibGUoYmFuaywgb2Zmc2V0LCAxKTsNCj4gDQo+ICsgICAgICAgaWYgKHRy
aWdnZXIpDQo+ICsgICAgICAgICAgICAgICBvbWFwX3NldF9ncGlvX3RyaWdnZXJpbmcoYmFuaywg
b2Zmc2V0LCB0cmlnZ2VyKTsNCj4gICAgICAgICAgLyoNCj4gICAgICAgICAgICogRm9yIGxldmVs
LXRyaWdnZXJlZCBHUElPcywgY2xlYXJpbmcgbXVzdCBiZSBkb25lIGFmdGVyIHRoZSBzb3VyY2UN
Cj4gICAgICAgICAgICogaXMgY2xlYXJlZCwgdGh1cyBhZnRlciB0aGUgaGFuZGxlciBoYXMgcnVu
LiBPTUFQNCBuZWVkcyB0aGlzIGRvbmUNCj4gQEAgLTkwNSw5ICs5MDcsNiBAQCBzdGF0aWMgdm9p
ZCBvbWFwX2dwaW9fdW5tYXNrX2lycShzdHJ1Y3QgaXJxX2RhdGENCj4gKmQpDQo+ICAgICAgICAg
ICAgICB0cmlnZ2VyICYgKElSUV9UWVBFX0xFVkVMX0hJR0ggfCBJUlFfVFlQRV9MRVZFTF9MT1cp
KQ0KPiAgICAgICAgICAgICAgICAgIG9tYXBfY2xlYXJfZ3Bpb19pcnFzdGF0dXMoYmFuaywgb2Zm
c2V0KTsNCj4gDQo+IC0gICAgICAgaWYgKHRyaWdnZXIpDQo+IC0gICAgICAgICAgICAgICBvbWFw
X3NldF9ncGlvX3RyaWdnZXJpbmcoYmFuaywgb2Zmc2V0LCB0cmlnZ2VyKTsNCj4gLQ0KPiAgICAg
ICAgICByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYmFuay0+bG9jaywgZmxhZ3MpOw0KPiAg
IH0NCj4gDQo+IEFzc3VtcHRpb24gLSBjbGVhcmluZyBJUlEgc3RhdHVzIG1heSByZXF1aXJlIElS
USB0eXBlIGNvbmZpZ3VyZWQuDQo+IA0KDQpJICBoYXZlIG1vdmVkIHRoYXQgcGFydCBzdWdnZXN0
ZWQgaW4geW91ciBkaWZmIGFuZCBpdCBsb29rcyBsaWtlIGl0IGhhcyBzb2x2ZWQgdGhlIHByb2Js
ZW0hIA0KDQpUaGUgaW50ZXJydXB0IGFzc29jaWF0ZWQgd2l0aCB0aGUgR1BJTyBtb2R1bGUgc3Rp
bGwgZmlyZXMgdHdpY2UNCg0KKGNhdCAvcHJvYy9pbnRlcnJ1cHRzKQ0KMTk6ICAgICAxNDcyMjcg
ICAgICBJTlRDICA5NiBMZXZlbCAgICAgNDRlMDcwMDAuZ3Bpbw0KDQpCdXQgdGhlIGludGVycnVw
dCBpbiB0aGUgbWNwMjUxeGZkIGRyaXZlciBpcyBvbmx5IGZpcmVkIG9uY2UuIA0KDQo2NDogICAg
ICA3NjY3MyAgNDRlMDcwMDAuZ3BpbyAgMjIgTGV2ZWwgICAgIHNwaTEuMQ0KDQpBbmQgc2luY2Ug
aXQncyB0aGUgc3BpIGNhbGwgdGhhdCB3b3JyaWVzIG1lIHRoZSBtb3N0IEkgdGhpbmsgdGhpcyBp
cyBmaW5lLiANClRoYW5rIHlvdSEhDQoNCiBCUg0KTWFya3VzIE1pcmV2aWsNCg0KPiAtLQ0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEdyeWdvcmlpLCBVa3JhaW5lDQo=
