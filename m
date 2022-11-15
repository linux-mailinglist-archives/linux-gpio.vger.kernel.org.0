Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1FD629540
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 11:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiKOKGy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 05:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKOKGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 05:06:53 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE36DE0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 02:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrwWfNdpQ7POOTqBzdurnwM9L2zTgVaN0OC47pqeMd2O4U4fUdxjGJHhTion2ca3TohXKpGizVHjd5rQIk0SUywthvUaMyjGIs/iyzwsASGwwSCMDOgTM/PsvyXF2h54izj2hbH+tK5lig70fBTNEIWCDS7XrSUklLVMhPlUXrv3rl7F5yA0i8Dk1fLGHOe4gZfehttgN+UcCgiQaDYfPkdSWzp7Y2kKd5UconDaeOevZcDo2BJiBUjn0xeEHggQM1hBame7g5Z9eeZspNdKQ9rTR1rxsY+aY9rsGVx476vEiS63d5xb1qbh8FApwPw7yUQxls+f7XgjpYCAYp426g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrT+6393fWI8ztejS6M0rU/wFzO1XwnS0P+kyFWsQI8=;
 b=nzn520c0wfHUop4TSwzg+HWdxoQBx0/BcyP0sN4hCTZbiRg93Uh7ECvNjnaRb6EbjC/ILSQCmme27fxjf8ik/EiJOwPax9XH+DhdDDd40S8KrbWYdkfaE2WVVQ2lqHewuNguxyKTJE7fZDWIbiZx4kZsyNR/hUtic+IItGEDPAHriWj1bkW3qdqjn22lrfJJpI6qo8DOY3n9y4i+yzHcYJXKoQA1u/HUVWFJQF/5MYzApxfKs7ci6BxUc2OACdpPNMpSZhF8fZjuYQ0ckLDkqRRRVQXMmvWAIFzqY/Vzel1O/NhgoCzyk0xcB1gBy/+FIbvwMMg3nUJF2msGC4Vzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrT+6393fWI8ztejS6M0rU/wFzO1XwnS0P+kyFWsQI8=;
 b=wJRpXhWymeZo8vH/CfjQYFP1FcAfSSRf79b5vr0HXj+WnvIUwN2Ch5Yg6dasM/bSrBWre0UnPGb5UoZqZNvJiAWW9b8cgiTX09mgMuB1AqoDIg3n7AM4xI7GMTDQkG47OgTj+dKXN6WzhTahfTEFM17nvvKCBiELmCqAQVBXntwpk4PI4oex47sm0O6b5oInBEMVCvndh+fswfzskBWa24J2pYsGm+hz86lCWgsPPc9geqr1r9CMz41mfsXEj6QarHQuRqrZDHB4Mc4eO0v/SiCMr0lw7JDAmdbCfed1n/zucOIkcm3qxQ0b/v9o308GDQ3SQ5qa7ofNGSHeKHbgoA==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS8PR10MB6866.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 10:06:49 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a9a2:43d3:12c:f695%5]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 10:06:49 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Question regarding runtime pinctrl
Thread-Topic: Question regarding runtime pinctrl
Thread-Index: AQHY+Nn5KD9wvAfV2EW6GZNUQtJ/BA==
Date:   Tue, 15 Nov 2022 10:06:49 +0000
Message-ID: <b4d10617df2b8a7c627bd93327679222d7db6796.camel@siemens.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS8PR10MB6866:EE_
x-ms-office365-filtering-correlation-id: ece8ba0d-d3b9-4f92-7bfd-08dac6f11c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +YrzJK/cjPk2a4rqX22OKbxnVBGTRR6Zf/TAKiL1fdBMP0EFEbbYmDcXAvGwWNjdhHDVRnQteSGXU20W7/gEQTmrtWkWT7wFCHOYwNofoC7iZrfWybtTkYFUsdFoKWHPcVZ/aBuJFrpNhBtTpgsFZPi/eXlMgr/CY2vAXa9Bv3IjR5yM+izYzD1BT8b/mihytSiFLsfb0vyti2isQPZ9h2lwqUrtFBHlHrA0Yt0+Zzmw6sKDXhAD9ssGBNiJg7IR+SY9nql7OkoUhvZQox0CDpJ4/5VnlQp/71LYWvyvGe5+DnkyUwzvwKgD6u7jbtOCeNPOjWFTQG9iutpwJxHR++Q6/1eERyS9eaCAFWCElCwSo4Vp4shMzUiEzGicyKE7VlSVkD2Cr8H0IVPYLTYpaVdkLUTbdEOQbh+vUeoXMDcON+I3o28LIczfSQYnone+5PQ81GfK/CsZTqFcakn7ytv3VPQitlPXTtodRrE74LcCTneZdG5bGmK0FlOIWGUs2o3SrA/+l6F0Uc1e6Q5f6nYBSuYIK8dUei8tCOIjp6jwIWvX+bKOkVDYOwE3imOh+iYv5ZrWZPdcq6RuRHYjZNLFcwcP+ggGOL2GuPQyMWegZN8wSjjDi7HjlTU+98x3I9PZyn/rZFf64XhKJqEg5lx+KmycmtAHiiKQqQa8wq0vEuH5F2S2YuNLNasijkuE8pjq87qC5Nrb4MYvIRU+UCBrXEvkDryL4M5amK34naPK5xsm3GJyeyVQjIQ86GoHaWEt5CiXa7Os3mfMfYd4Lw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(6486002)(478600001)(38070700005)(71200400001)(6506007)(6916009)(76116006)(38100700002)(6512007)(91956017)(86362001)(3450700001)(26005)(82960400001)(316002)(66476007)(66556008)(64756008)(66446008)(122000001)(66946007)(8676002)(2616005)(36756003)(186003)(8936002)(5660300002)(83380400001)(3480700007)(41300700001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWxsWEJMOFd0T0pmUElWRkRpNjR4T3gwZjNRM3pCNVoySFJHcS9VaGEzb3lU?=
 =?utf-8?B?R0N5TkpnbzlsZnczT0ZZMEl3MTlMWWNhRHpkZ25FKzBRYlllQW12bGg1MkUz?=
 =?utf-8?B?ay9QOHpRMEFFelVPYjlhR0x2K3JLRGlyZGVLeXprZldRQm5ZVG41aFY5blRl?=
 =?utf-8?B?aUphWU5ZRVlLT0ltUW5SVVlWK3d1TWk3Z2k0L2JKRmRaM0pkN0tTY1l2dWIx?=
 =?utf-8?B?L1ZaNVRtTFNFeVEwUURFUGRubUF1UWpRbEh4V0NPdDhRVkZQa3ArRHBobzh3?=
 =?utf-8?B?SnhkeGdRckVWNEsxamZ6U1JnK1ZFWktwQmN0NjVZY1ZDamVWK1NrYVVGczdq?=
 =?utf-8?B?S0x3czZkOUp6UXM1NzNoaXJZOFJJeG1Zem02bFFzeTR3a1hzUlBBNDRaamMv?=
 =?utf-8?B?bTc1UnEranpCT3RjbWk3WjZZWWFRY2xmL3EzRUdBeUV2RTB3OTZSdE5EelBr?=
 =?utf-8?B?Y3NlMU45NjJvTTFXZ3JBN0psTm1PUmdKOEoweGxwSDhoMmR0UDBONzdBNU11?=
 =?utf-8?B?K2w5eVRYSCt4VnZjcFd5M2orKys0V2ViRDZUTldicndLcTJmUzFGL0JiNmY3?=
 =?utf-8?B?d1pYdmQ5STJyN2NiMEpsQUhnb1JIbC9mcTZZUTNZYW94cnJwdDRVWW5LSHZj?=
 =?utf-8?B?YUFiVm95TWozT2NWOGFVYmZ2d3c2SXNmaU94UDVIN0trdllSQkFnemFnWTRl?=
 =?utf-8?B?b24yUXN5WFZ1aXd3K3VQYmhjRkVZLytBWnNWOEZsUUd6dTRvek1rZjR6bHNF?=
 =?utf-8?B?NVNVYllOVWpieXhYamcydXdJSyt0NFNod3BTeUFHY0I4RmJSbTFFWkg0ZTYw?=
 =?utf-8?B?TlZ4Y0lMelhzQmcrOHJjNHN3eFRHa1BBbXYrL1VkcVFVMWNrcHE2QS8yYm41?=
 =?utf-8?B?bnh5c1UvV1hpZ1FiUjJPTmpnMmNkeGZ2ZkRKeEJRYXR6aDBqQVdCM051L2Vt?=
 =?utf-8?B?TisxZjh1Vlh1c0F1U1NlYWxlYVVNQlhzRmY2dVh1a0NLbVgyVzhvOXkwR0lh?=
 =?utf-8?B?Ui9JWWh4VEJoQlRSdEF6dDFERmtEenJCSFpIVHJwMW1RWFJRYzRjYUlxcDZK?=
 =?utf-8?B?c05NVEpWRnlQUjN1T3VkakM4QjVDRjAxSFZMekloVVppU2Q5TGRIMkRuQ2lT?=
 =?utf-8?B?d0dNdHJqdE1NNWRxS3BpOUlBM3VqMDRrQUhhUjhJTFJjVHJpSER4cXpMWEZJ?=
 =?utf-8?B?bk1INHlEd0QvMC9ZUEVTTHJxOHlZdXIwL2ZKOXRQZW5tWFE5T3hqY2diT1By?=
 =?utf-8?B?Z0ZRV3FZWG5OZ0ZpbFBGbkFlYU9MM0ZOcmdoN1lhVVdBcG5zbWtqWUtvbHVM?=
 =?utf-8?B?YkpvOVJXMmpEMEVvTWRkRDdVQWY0VHBqZVpMaUF2aS9UNnFiN05SL2xIN3JS?=
 =?utf-8?B?YVVkY3phaVd6NzZ4VkQyelVtOFEyUTBLUUlJMGFLUkx6ZW4ycjVxZGlkV2Np?=
 =?utf-8?B?RXo5M1hRVS9UUk83akpwTkNBeHVjMjY0REc2M1IzSXZCWTlYMXdsTTdnUlM2?=
 =?utf-8?B?bG81OE5EN1NSbmhkL3pad09lck8veTEySUthMXVmcFpUMDlFbVgyYWpDZHY3?=
 =?utf-8?B?QUFIKzdQZHkyaDZGakJKd3NIK1hjWFJMQnduTGRldC9ONDk3ZldIcitaNkpx?=
 =?utf-8?B?WVFuYUk1WUxMSnc4NUx6SmQ2ZXJMYXJDejJSNDQxRm9lOGJnTTJ2RDE3Y2Fp?=
 =?utf-8?B?QWY4TitUWGlHSUl6eW5OQ3QxQnlUdlJYaXJkb2pmdElsbTdxRkVPdXRNVUdv?=
 =?utf-8?B?LzF5cCs0bXo4aTFlTWVkZHA3NXJPQWk0N0k3R3piYUFlM0U5dnJiRzZ6Qit6?=
 =?utf-8?B?RDIzYnEwZ28yOFFRU01pbU5RdUMrK1lCV3dBVGxGQlJqbjFrZU1iOGptQmpn?=
 =?utf-8?B?U2I2cnNZajFhNGJXS0lKZ1ZMTWFMV0xPMjdnRERiTzlMNEgxVjhvS3VDQWJp?=
 =?utf-8?B?Rk9KVmpUbjhnbHY2RENJM29qOWY5WkM0blVRVUtKc0xZUzFzbjRWZHpGc1pU?=
 =?utf-8?B?VHpTMmNmeS9oQ2NZWHRNWjcvMjNId1ZyclYyNmo1K29Kemo0Mmw0MTEvWmVI?=
 =?utf-8?B?aUpSR2R3ZkdXY0NJWEJFQ1Z5Sk45TW9IeVZMTEthaXJXamtlT3lRT1hwTU5z?=
 =?utf-8?B?UlpmUnIvWU4rbXBJUFJtNzBNMWRVNzZuS29GNEE3ZVA4MmVnZVRRZ2p0NkR2?=
 =?utf-8?Q?zmd+h9P7j4CEKLg8g47RbdI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC508A9A89D9C643BF381F068BAB4EFA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ece8ba0d-d3b9-4f92-7bfd-08dac6f11c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 10:06:49.1617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSHlpvmRW4TSJw6BLNIqEldsAS6+//Coa+v5vxCoTyhHYq2+I337++murbK97gVk64xhY00htIt//GIJjtsbRVygmCpJQAKugatoyonPw6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6866
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCmFzIHRoZSBzdWJqZWN0IG1heSBpbmRpY2F0ZSwgSSd2ZSBzdHVtYmxlZCBhY3Jv
c3MgdGhlIHVzZSBjYXNlIG9mIGNvbnRyb2xsaW5nIHBpbm11eCBmcm9tIHVzZXJzcGFjZS4NCk1h
eWJlIGJpdCBtb3JlIGJhY2tncm91bmQ6DQoNCldlIGFyZSBjdXJyZW50bHkgdXNpbmcgcGxhdGZv
cm1zIHdoaWNoIGNhbiBiZSBleHRlbmRlZCB3aXRoIGRpZmZlcmVudCBraW5kIG9mIElPLXNoaWVs
ZHMuIFRoZXNlIElPLXNoaWVsZHMgYXJlIGNvbmZpZ3VyYWJsZSAoZXZlbiBhdCBydW50aW1lKS4g
UmVjb25maWd1cmluZw0KZHVyaW5nIHJ1bnRpbWUgaXMgZ2VuZXJhbGx5IGVsZWN0cmljYWxseSBm
aW5lLg0KV2Ugbm93IHdhbnQgdG8gYmUgYWJsZSB0byBjb25maWd1cmUgdGhvc2UgSU8tc2hpZWxk
cyBieSBjaGFuZ2luZyB0aGUgcGlubXV4IGNvbmZpZ3VyYXRpb24gZHVyaW5nIHJ1bnRpbWUgKGFm
dGVyIGtlcm5lbCBib290KS4NCg0KVW50aWwgbm93IHdlIGFyZSBhY2hpZXZpbmcgdGhhdCBieSBh
Y2Nlc3NpbmcgdGhlIHRoZSBwaW5tdXgvcGluY3RybCByZWdpc3RlcnMgZGlyZWN0bHkgdmlhIC9k
ZXYvbWVtLiBCdXQgd2Ugc2VlIGF0IGxlYXN0IHR3byBpc3N1ZXMgaGVyZToNCkZyb20gYSBzZWN1
cml0eSBhc3BlY3QsIGFjY2Vzc2luZyB0aGUgL2Rldi9tZW0gaW50ZXJmYWNlIGlzIHByaXZpbGVn
ZWQgKGF0IGxlYXN0IHJlcXVpcmVzIENBUF9TWVNfUkFXSU8pLiBCdXQgdGhpcyBtYXkgY29uZmxp
Y3Qgd2l0aCB0aGUgZmluYWwgYXBwbGljYXRpb24NCndoaWNoIHNob3VsZCBydW4gbm9uIHByaXZp
bGVnZWQuIA0KVGhlIHNlY29uZCBpc3N1ZSBpcyB0aGF0IHdlIGFjdHVhbGx5IGR1cGxpY2F0ZSB0
aGUgcGlubXV4L3BpbmN0cmwga2VybmVsIGltcGxlbWVudGF0aW9uIHdoaWNoIGFscmVhZHkuDQoN
CkFyZSB0aGVyZSBhbnkgZGlzY3Vzc2lvbnMgb3V0IHRoZXJlIHJlbGF0ZWQgdG8gdGhpcyB0b3Bp
Yz8gSSB3b3VsZCBiZSBzdXJwcmlzZWQgaWYgSSB3YXMgdGhlIGZpcnN0IG9uZSBzZWFyY2hpbmcg
Zm9yIGEgc29sdXRpb24gZm9yIHRoaXMgdXNlIGNhc2UuIA0KV2UgYWxyZWFkeSBoYXZlIHNvbWUg
aWRlYXMgYnV0IHdlIGFsc28gd2FudCB0byBrbm93IGlmIGFueWJvZHkgaGFkIGEgc2ltaWxhciB1
c2UgY2FzZSBhbmQgY2FuIHNoYXJlIGFueSBleHBlcmllbmNlPyAgDQoNCmNoZWVycywNCkJlbmVk
aWt0ICANCg0KDQo=
