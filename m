Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5476EED18
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Apr 2023 06:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjDZEuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Apr 2023 00:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239026AbjDZEuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 00:50:11 -0400
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01on2135.outbound.protection.outlook.com [40.107.108.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0A31B6
        for <linux-gpio@vger.kernel.org>; Tue, 25 Apr 2023 21:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4aMMWuvosIeOszjTKUXk1BCH+sH/NFKkvnQMRstzN4UA3upiPUuMADhI4k+8XnDlCiZxumSDdYKpfHEnclX7nqwfKS7KvkFsgemgbXpJHu/PKedadf40uM6knoH74hE4xq22bdW17DY0RXw9biJ6lbj/ghDY1aiYRo5YgiXAWZPP4UHzRkpQFI+e0JE5shePUUz7lvstxEiD32s0jg8pq/LF2Z9LcUjKUjuYZA5tvBTRAYdUAAYyAm7Jnptm8rrkOtN5klnmVxMwwDHGvWOK66FxJDGn7wpGYQBeykfhl6fnrsoQ/z7kDFz36uu9s66SDbv8RcqQhzjWsb3rSkHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91S+iXNhBvpKwaBwj7Icx0MfOYY34EUDcxOr8d+ZKQc=;
 b=AO0Ee51NlUotvN2sxG2cPAMS/6/OERLEvIEBihGPKwe9AturAdR/kejmWlr4izqtz640oUPSxK7rLvJZ6r5832Xdk7FAlmr1YnK4Ubs7W8ZyWnvYKImj7oq9ThooSLSSXSrzsYePj/ye+pkmDZ3sgSaITyUwA3qKJwjm3iMwMXZ/iIAHfd8EyxCfBkGZTCAVlsN+9eByyIEoDNoVanMToPvp03BpC/OSRlcGcflbtXvRn6Lo9l7/Kz5rq/mlsx7OWF6J6+/UUrqbAX5RM8Vbwzv2D/uIb+vMdXA1gtFPIx9tjeetIeODR7AdVHsQZbmS4yfRktUwSZANyUj2xwfLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rfi.com.au; dmarc=pass action=none header.from=rfi.com.au;
 dkim=pass header.d=rfi.com.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rfi.com.au;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91S+iXNhBvpKwaBwj7Icx0MfOYY34EUDcxOr8d+ZKQc=;
 b=GNP+u0wepCQGPFk6cLA+KgE8oAPADOLyDK0W+ze79WbNGcQB6qVEi8qStu1IR5nRWff6duTY1HtVfKC1lrVnQiJqmf5eUaUPr8Nb7fgQjvdZKadBdJTvia9Viv0bbWpQ4cXNbKG6KTDiKXk1wqP9bGhq6sdSCTtIv5sHXjl8QdU=
Received: from MEAPR01MB4231.ausprd01.prod.outlook.com (2603:10c6:220:12::18)
 by SY4PR01MB5964.ausprd01.prod.outlook.com (2603:10c6:10:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Wed, 26 Apr
 2023 04:50:06 +0000
Received: from MEAPR01MB4231.ausprd01.prod.outlook.com
 ([fe80::c561:8607:c40e:1560]) by MEAPR01MB4231.ausprd01.prod.outlook.com
 ([fe80::c561:8607:c40e:1560%7]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 04:50:06 +0000
From:   Ping Li <Ping.Li@rfi.com.au>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH] drivers/mux: Fix comparison of signed and unsigned integers
 in adgs1408.c
Thread-Topic: [PATCH] drivers/mux: Fix comparison of signed and unsigned
 integers in adgs1408.c
Thread-Index: AQHZd/o2t+VWHa320UyP0lqhjakknQ==
Date:   Wed, 26 Apr 2023 04:50:06 +0000
Message-ID: <MEAPR01MB42314FB7FB4627E0B58E6AC6C9659@MEAPR01MB4231.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rfi.com.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEAPR01MB4231:EE_|SY4PR01MB5964:EE_
x-ms-office365-filtering-correlation-id: 15ede90e-2ad2-4e57-fc63-08db4611b4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pkFtnKpj9MslkNA9N22ndVP3hRhZnEYYKQRzfpwJJG5WAity5yTU5qqmcfYQitCVu1hcgBerUIE5DhUXqrJiZvBVBh8EK/OJgkW1totPgVEZKTrkemxSv+9MdkKcV0+n9GZpcC82EWsktsSpP4rJX9N/7x/KwX3olQaIUYZv4gvhwVOug78Zy+x+OshYzgb/lDAdbiob5b7QaXPuttMKN+iWfG4K9z4GNktDCiR/tViB4uG70W6ixkZbSX+n5fwyOsc65esAqFOAzcCevgBMYp1V+7aj4pnrcvRJ1npYL+defeA+3ncxxjGpDQ/KMJNb2KR2pPCBhCFwSnlvIHSSbBKtxQsxzzV2uP7xTSsUWVyhliPf73TzxY5McJODIFfQgxn/gyDSisY7exd2CJN8QvEkUqGvHl7drU72o0HxTyk7ubtiqB1EoWzd1RJIHG2xSbMaTdTfjLA4Ba1G/jRlQCRN+b61B1FkQM7c0bPPG9ASqG/YK1xeuejlrzo6tyMHtohmZB9MQeb+51GxCdIfdxAGYgKkOG7/xCwC6Zmid2Wc5ft0oqV/VYMf1Q5bsrMuxT/UAy++Q/jxh0WWaFuaPH94GiPBgEEYnTXvYv0vxb0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MEAPR01MB4231.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(451199021)(38070700005)(2906002)(38100700002)(52536014)(5660300002)(8936002)(8676002)(55016003)(86362001)(33656002)(7696005)(71200400001)(966005)(26005)(6506007)(478600001)(83380400001)(9686003)(186003)(99936003)(316002)(6916009)(66446008)(122000001)(66556008)(64756008)(66476007)(41300700001)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bi9STk9nZm50TWcranVOOVA0UElaT0RubWsyaS9xbDhWcWp0Vm1iSldFdDVP?=
 =?utf-8?B?Y3NuZEo5ajZMVkdZYWNXK1VEbG5sZk5UbHFyZVY5LzhwZlpNM0k4K3daUkhh?=
 =?utf-8?B?eXRScUNPK0FKNFhqNDMyWnZzTnpRN2hyUVBCMlgrN1dsVUhTUUZjZmhXdkQw?=
 =?utf-8?B?dWJZT3l6dUpDblpLU3hMZHcwajFhS2pTUmxmZitFdEtENUhvU3hnTEtXQy9h?=
 =?utf-8?B?ZnRuKzRQdmJ4WktveDNxeTRsekU5TVd6Rm9raUF6Q1kzN2NwWjg5a3o4dG93?=
 =?utf-8?B?eWE1SzcySlpYdEVqZnRmUWVpVXZkaTh6d3RISmE0cEIydFdERlJjZTh2Z0xu?=
 =?utf-8?B?MjZ6NnBVVE8wS3FvS1lsYS9sZmsyQWpYTFhwbitDS0VzMVRNT3NCR1UyMDM3?=
 =?utf-8?B?WkhrME5DTVN5OVExSVRIOGJEbDJZRDg2anJQWkdVdWl3b2FrbC9wR1l0L2JK?=
 =?utf-8?B?Q2JYa3I3dlRmWkgraE9qMzgwaXFnM2M0S213aWQxYUhTNFVwWlBKeW1wcitH?=
 =?utf-8?B?Y25ubkxIaG0rWkZ1YjZ2NDBIYVV2aFlDaHI3MmNVdmp5VlZEVFB5bEE2L05V?=
 =?utf-8?B?NmFrNCtuUmQ5RWt5UVR3R2VlU3RPWmZwMi9rRTBySXhZcGJIVXZXT0crZzZL?=
 =?utf-8?B?aytVUG1KcytFOEMzODkvbDVoNlhoby9qMmY2SHRHWFdYVEl0VGJXUXRJczlQ?=
 =?utf-8?B?M3NudUFYSWxCOTF2Q0FTbi9jWHJHVUhlQUlvZjVDTFg4N1UxeW9WbkJKdGpi?=
 =?utf-8?B?Ris0THQ4TGM5dEVndmR0MGRkQlRsSEZ4ckhQRGowTmFabkdOcGdjMFExL2tM?=
 =?utf-8?B?aGkwTHF4Y2xhanNuMVoyNkdFQ0RsU2dHRkpycFBWdkk0cUd6R2tKSHFnNVVP?=
 =?utf-8?B?NTRrTnZ5Zk1DQlhqU3lQaS9HZkFvNDlGVTVBWnVpVnhOVnJDUnowd21vZnhr?=
 =?utf-8?B?WVpLMG56a1Nua3RybDdkWkUzazNwT2xSTXA1UG1EY2dlZjZwcnNQT3JDUE1R?=
 =?utf-8?B?eVpRSkQvU2dqbk9OK3huWVhmdjFCbWoveTlBWDc1R3ZmeDBpRTRZQm5pclVG?=
 =?utf-8?B?dWFCak1IV2dnSGo2TnAzaExibk03ZEJxMlMyWVFwbExoRkp3bzhLT21iZUtO?=
 =?utf-8?B?ZXRmQnYwRk9oMUxrSFJDLzdSdHdQQmdCMUFWUWpmYlVWdUFzbDNaemNKUHVz?=
 =?utf-8?B?V3BwSmVVVSt0SlJ4dUdGU0lLOVMwNUFySnV3a3JQYzZMSmxVVzVDa2VLMkta?=
 =?utf-8?B?M1hWaWpZNkJsNzFpaXNvUnFnZVg1Ym9NZWVyRElzYkMyL2puNGtmeTB6MURW?=
 =?utf-8?B?UmpYbmxjR05nRDdsUEp4SElNOVMvT29BbHNjWVp2T0IvSVFxSE1HS1QrblpG?=
 =?utf-8?B?VnJEaDZYbC9ZMXpJdWNyYjN6R0hiMkg1SkJBOSsxYVR5YVhWTml4SU1RbzlP?=
 =?utf-8?B?T3lRMGR1ZWtqUmQrOXJDNitkdWZHWkpxdDJJcHRva0xLOXlPNWU0blIzemZo?=
 =?utf-8?B?aGs4b0JaNjFaU010SjJmMGxoVXIvVHdvb0xTQVFFQ3VOUzVocmViRVFRejNB?=
 =?utf-8?B?QzJVTDdBNVpSTmVYSFM3MkxPMndlcDJCUE0vWjkwWkZxajlPaThPTU5jZkM5?=
 =?utf-8?B?TTJPbFhPMXp6QStHc3ZaMjBZQUdnSFlnT2JUKzdMNk5vY091bDFDRm9BaXBt?=
 =?utf-8?B?cStMYXFGYjljNnJHVnBYaTAzK1pGMWpFLzRXT1dlZ2FreXFBV1dDdEhlSU5J?=
 =?utf-8?B?U1AvSi91ZEFIZ2tQQ1A0WnRlSHFYcHE5TWQ0SGowUS9FVHNjR1Y4cVMweUtm?=
 =?utf-8?B?Zng4Yjd1UnpoWTRGQzlPbGNEMUlaRUx0NDdmYVgxTWNrOW5uSDZmTTR4emNG?=
 =?utf-8?B?RS9LclUxWE5xc3drREhXeHRPMkh2dXJWOUMzR1gyUmxqNUJBcmpCaTVjdm1j?=
 =?utf-8?B?OUIxczRZWld3N0pkTHZOZitWVXpNM1pLMlNQN2RmTkMyMVpIYTNnNVNQN3Mv?=
 =?utf-8?B?Q2xxa2xPcFE0ZU0zL0dqM1FraHY4OUt0QStsQjlIN1pmNVVFakJjeWtuUFlv?=
 =?utf-8?B?cXRVZnJEY2RTY0FkcWMvdGNIVkR1THl5RE9qNjhKTGRkUnF3cTR5VnNPWE12?=
 =?utf-8?Q?8F28=3D?=
Content-Type: multipart/mixed;
        boundary="_002_MEAPR01MB42314FB7FB4627E0B58E6AC6C9659MEAPR01MB4231ausp_"
MIME-Version: 1.0
X-OriginatorOrg: rfi.com.au
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEAPR01MB4231.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ede90e-2ad2-4e57-fc63-08db4611b4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 04:50:06.2014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0cbc6b29-eac2-4138-b37e-56a1535c99c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pb24/m6typDq1MWV8JnzSqRbwxDwKy749OaWjoOBBGtXg2/dN5IieqiZP9tV0e+u2N5BNmBECpHpSpWs1WrnaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5964
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--_002_MEAPR01MB42314FB7FB4627E0B58E6AC6C9659MEAPR01MB4231ausp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpJIGZvdW5kIGEgYnVnIGluIHRoZSBkcml2ZXJzL211eC9hZGdzMTQwOC5jIGRyaXZl
ciB0aGF0IGNhdXNlcyBNVVhfSURMRV9BU19JUyBtb2RlIGRvZXMgbm90IHdvcmsgYXQgYWxsLgpT
cGVjaWZpY2FsbHksIHRoZSBjb21wYXJpc29uICJpZiAoaWRsZV9zdGF0ZSA8IG11eC0+c3RhdGVz
KSIgaW4gdGhlIHN3aXRjaCBzdGF0ZW1lbnQgZmFpbHMgZHVlIHRvIFVzdWFsIGFyaXRobWV0aWMg
Y29udmVyc2lvbnMgaWYgaWRsZV9zdGF0ZSBpcyBzZXQgdG8gYSBuZWdhdGl2ZSB2YWx1ZSwgc3Vj
aCBhcyBNVVhfSURMRV9BU19JUyAoLTEpLiBSZWZlciB0byBUaGUgQyBzdGFuZGFyZCAoSVNPL0lF
QyA5ODk5OjIwMTEpLCBzZWN0aW9uIDYuMy4xLjggIFVzdWFsIGFyaXRobWV0aWMgY29udmVyc2lv
bnMgaHR0cHM6Ly93d3cub3Blbi1zdGQub3JnL2p0YzEvc2MyMi93ZzE0L3d3dy9kb2NzL24xNTcw
LnBkZiNwYWdlPTUyLgoKVG8gZml4IHRoaXMgaXNzdWUsIEkgc3VnZ2VzdCBhZGRpbmcgYW4gZXhw
bGljaXQgdHlwZSBjYXN0IHRvIHRoZSBjb21wYXJpc29uLgpIZXJlJ3MgdGhlIG1vZGlmaWVkIGNv
ZGU6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdXgvYWRnczE0MDguYyBiL2RyaXZlcnMvbXV4L2Fk
Z3MxNDA4LmMKaW5kZXggMjJlZDA1MWViMWE0Li5jNTllMGJlZDgwZDEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXV4L2FkZ3MxNDA4LmMKKysrIGIvZHJpdmVycy9tdXgvYWRnczE0MDguYwpAQCAtODks
NyArODksOSBAQCBzdGF0aWMgaW50IGFkZ3MxNDA4X3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpz
cGkpCiDigILigILigILigILigIJjYXNlIE1VWF9JRExFX0FTX0lTOgog4oCC4oCC4oCC4oCC4oCC
Y2FzZSAwIC4uLiA3Ogog4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLyogYWRnczE0
MDkgc3VwcG9ydHMgb25seSA0IHN0YXRlcyAqLwot4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCCaWYgKGlkbGVfc3RhdGUgPCBtdXgtPnN0YXRlcykgewor4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCCLyogdGhlIGlkbGVfc3RhdGUgd2lsbCBiZSBpbXBsaWNpdGx5IGNvbnZl
cnRlZCB0byBhbiB1bnNpZ25lZCBpbnQgaW4KK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAgiAgIHRoZSBjb21wYXJpc29uLCB3aGljaCB3aWxsIGZhaWwgdGhlIGNvbXBhcmlzb24gaWYg
d2l0aG91dCAoaW50KSAqLwor4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCaWYgKGlk
bGVfc3RhdGUgPCAoaW50KW11eC0+c3RhdGVzKSB7CiDigILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigILigILigIJtdXgtPmlkbGVfc3RhdGUgPSBpZGxlX3N0YXRlOwog
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCYnJlYWs7
CiDigILigILigILigILigILigILigILigILigILigILigIJ9Ci0tIAoKV2l0aCB0aGlzIGZpeCwg
YWRnczE0MDggY2FuIHdvcmsgd2l0aCBNVVhfSURMRV9BU19JUyBpbiBvdXIgZGV2ZWxvcG1lbnQg
Ym9hcmQuClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIG9yIGNv
bmNlcm5zIGFib3V0IHRoaXMgcGF0Y2guClRoYW5rIHlvdSBmb3IgeW91ciBhdHRlbnRpb24gdG8g
dGhpcyBpc3N1ZS4KCkJlc3QgcmVnYXJkcywKUGluZyBMaQ==

--_002_MEAPR01MB42314FB7FB4627E0B58E6AC6C9659MEAPR01MB4231ausp_
Content-Type: text/x-patch;
	name="0001-Fix-comparison-of-signed-and-unsigned-integers-in-ad.patch"
Content-Description:
 0001-Fix-comparison-of-signed-and-unsigned-integers-in-ad.patch
Content-Disposition: attachment;
	filename="0001-Fix-comparison-of-signed-and-unsigned-integers-in-ad.patch";
	size=944; creation-date="Wed, 26 Apr 2023 04:49:55 GMT";
	modification-date="Wed, 26 Apr 2023 04:49:55 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlOTZiYjVhYjhiNWM3ZTFkY2RhNGZmZWZmYzY0ZDZiMTIwNTc5YmFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiUGluZy5MaSIgPFBpbmcuTGlAcmZpLmNvbS5hdT4KRGF0ZTog
V2VkLCAyNiBBcHIgMjAyMyAxMzo1Mjo1MyArMDkzMApTdWJqZWN0OiBbUEFUQ0hdIEZpeCBjb21w
YXJpc29uIG9mIHNpZ25lZCBhbmQgdW5zaWduZWQgaW50ZWdlcnMgaW4gYWRnczE0MDguYwoKU2ln
bmVkLW9mZi1ieTogUGluZy5MaSA8UGluZy5MaUByZmkuY29tLmF1PgotLS0KIGRyaXZlcnMvbXV4
L2FkZ3MxNDA4LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL211eC9hZGdzMTQwOC5jIGIvZHJpdmVy
cy9tdXgvYWRnczE0MDguYwppbmRleCAyMmVkMDUxZWIxYTQuLmM1OWUwYmVkODBkMSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tdXgvYWRnczE0MDguYworKysgYi9kcml2ZXJzL211eC9hZGdzMTQwOC5j
CkBAIC04OSw3ICs4OSw5IEBAIHN0YXRpYyBpbnQgYWRnczE0MDhfcHJvYmUoc3RydWN0IHNwaV9k
ZXZpY2UgKnNwaSkKIAljYXNlIE1VWF9JRExFX0FTX0lTOgogCWNhc2UgMCAuLi4gNzoKIAkJLyog
YWRnczE0MDkgc3VwcG9ydHMgb25seSA0IHN0YXRlcyAqLwotCQlpZiAoaWRsZV9zdGF0ZSA8IG11
eC0+c3RhdGVzKSB7CisJCS8qIHRoZSBpZGxlX3N0YXRlIHdpbGwgYmUgaW1wbGljaXRseSBjb252
ZXJ0ZWQgdG8gYW4gdW5zaWduZWQgaW50IGluCisJCSAgIHRoZSBjb21wYXJpc29uLCB3aGljaCB3
aWxsIGZhaWwgdGhlIGNvbXBhcmlzb24gaWYgd2l0aG91dCAoaW50KSAqLworCQlpZiAoaWRsZV9z
dGF0ZSA8IChpbnQpbXV4LT5zdGF0ZXMpIHsKIAkJCW11eC0+aWRsZV9zdGF0ZSA9IGlkbGVfc3Rh
dGU7CiAJCQlicmVhazsKIAkJfQotLSAKMi4yNS4xCgo=

--_002_MEAPR01MB42314FB7FB4627E0B58E6AC6C9659MEAPR01MB4231ausp_--
