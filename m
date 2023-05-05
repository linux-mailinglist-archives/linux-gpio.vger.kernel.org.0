Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AC76F8400
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 15:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjEEN22 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 09:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjEEN2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 09:28:22 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1288720752;
        Fri,  5 May 2023 06:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbcU7CDXzzkW4JYhYS+nRZbw0GQWCEWfP2LAVxNd+4uY7zISUUMWjooIZ3zAQaMj+yGQQ9vHlDR8Re068IBhTXu3QzhyeQQgNSML37zyaLVVy+lg1WwmXdVrye+mQ2yHj2quTSRpnQhq4YqNWS9NfMNZAKAp5Y2lDWmKGgIWJRMQZkHnfwZYOoRMY6gPNKoK3EgLiMNptHS7ISKTNWyN7kodaftuaeRtQ0lzuE+WOXCNzis1/55VDnoV1PfZGnDCLVepLtB/5Q9FjxBP6hmWjQOqDXDzbr3kTK4J3pv0nUIJNBGh39emkcDriuyuhszt/BaQFWHZCrlhdHUO41LIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elneCHoaTecHj8VMbQ07rGEA187UpoiU7xFxV8saiJc=;
 b=BTO4j+W/n+0iYxBRfo2oCXvj34v89oFCAfn//L1dnzmsRCFUJVbJiPpw+V3mFEbKl+Hofj1ayIjtI8f0eDpZ/l5dVyTNPUp8x1sJ22nNpB4h0nPITlYaeyozPGYclqw77FM/PM9F322rp3vTZlqx7Ys7bdobvtMc107d/sOjEcS1Ilq9X3zvBNonlHqJmRaDHh6kDwb7M9jQ+x3XiWSIm3yk2sgdCFBCjEwABX+WsrkBa3UpF+jjNln/JEMuFz9d5849D8aZu+ZIjpyg47AYZ02+o01ihEjaLis1dOeeG59P52dFWVopVERZM57gv2Bw1vtpgqAXKZJDjFHu2HdLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elneCHoaTecHj8VMbQ07rGEA187UpoiU7xFxV8saiJc=;
 b=KlUALWvwN67H0Rl72+W7DXGx2h0tiN+/+vIdRhr3AIgsXtVR0qOj+rdyHt3Ofr7k7Jk+LGpoIts3QHU+LB4+ODWtC0p/esPUt8vUL9xDg/kLaySDalYcbTnocVIN8XLs4gAmtP7d+/+MU/ckdUaGKpfds0HGrfVPYEkUMIACTHcC/gQQnuYKtC1IacRBEuwdSJOifzg80PUnRe7DuCPaL4R9qp/G5lHfEOtzRWpOf3VyiAvBkoYMviOsknLpkWSR65fXHRNPiKov4VTrvtBBjbSl/iXygIKR4FjSsH2jmfzLkwL+R5XtMqI04ZF/CcxGa34iklLYLxcziKJRS+TbYg==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS8PR10MB7255.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:618::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 13:28:10 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ffe4:701e:6fc:bd45]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ffe4:701e:6fc:bd45%4]) with mapi id 15.20.6340.036; Fri, 5 May 2023
 13:28:10 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "tony@atomide.com" <tony@atomide.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Pinconf issues on AMxxx plattforms
Thread-Topic: Pinconf issues on AMxxx plattforms
Thread-Index: AQHZfZqrvd+zoW9TUEm12TIFY5PDMa9JmSuAgAAxMwCAAeVLAA==
Date:   Fri, 5 May 2023 13:28:10 +0000
Message-ID: <f2e043d6f82bd1112c345e437a4f3bcfb8c5dd75.camel@siemens.com>
References: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com>
         <20230504053509.GN14287@atomide.com>
         <CACRpkdaQe61Jk6WoCr8vYkGKJPMiM7D+iF0w9fKjoOxBWtinhg@mail.gmail.com>
In-Reply-To: <CACRpkdaQe61Jk6WoCr8vYkGKJPMiM7D+iF0w9fKjoOxBWtinhg@mail.gmail.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS8PR10MB7255:EE_
x-ms-office365-filtering-correlation-id: 8129246d-fb8f-4b0e-e7ef-08db4d6c9229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2seL9QXp+p/x2kHlamM0tQHOyEhQR7LWmogXMPmVmLrliJCz+OttScOyjuNlr394zsHmf4FjdTQuKDAuvnBS5g7Qw4oBVw/o+b5IJDfXXzbsKsE0zN07C+oqaBG2FtMn+sTYYR+wSiIFqIzRZ6ANXx7Pj5vhYXCpzgNWPxj5DAZUWBDdZV9TA1yI+ddarc4+hlD0SWpdT7gXUuiyIZBKxXddS9DawUg+DYY9YYxmktE0XmJ7VQ9CeBTVLYD1Pm7TJTRSjaVZy3/ztkBkQFX1FDCdPwfXGE9oP6mQ/BhiHLhHJmcvXz/eh0meHChPPFMl/1ZuCC7/F9wlrM5ItN9zAyHAtPa/1IRRW6HMyMi1FYarkLcUyHjfS/Vx2RjupW/PIfIy9HN4AKLM8od/idqosR5Ln+rKrIV5HDl/oTu14CFJUPMIweJqWtR0TERUtf/vrJ6+YT6iAbJSj0yLbcD8JZB9Lw0SEAkNFy+9eCCh9OhF+8rcMKa95YgcK4y1wDqxFqzWegtJ6uHJQbgeMZDbrkcONiTI+wOKuK9PmHSrZLjppSVgFh2ecIrZFP+t2L0tO2plB+2xUCvEy2uDnFKJQUf1hE4Z6jGzCKdERtmJovjc2zs95ggnOq7t8opFtf8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(66899021)(36756003)(5660300002)(38100700002)(122000001)(2906002)(3450700001)(38070700005)(8936002)(316002)(86362001)(64756008)(66476007)(66556008)(8676002)(66446008)(66946007)(4326008)(41300700001)(82960400001)(91956017)(186003)(83380400001)(76116006)(6512007)(6506007)(53546011)(478600001)(6486002)(54906003)(110136005)(71200400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjduWXRsQnJUNnJPMFdRaDAxSlJ4aUtJZ3BybER2T2NmMmtKRDY2NDl3WmZT?=
 =?utf-8?B?UXlWTlp5OTMvdFNOcCtsNjh5YlpTSy9ZeGJXdnJWQUxFNitxbllwc0dnNVMz?=
 =?utf-8?B?bzEvd0FpcGdXYm1FelV2WU44ZjYwUEVuVTY2UERMaE5GRGVPRlB4NFNPMzRQ?=
 =?utf-8?B?TmthbkhXK05kTTBpTnNvd3lpcFkwVVpRRWFRbXZRdSs1bFM3eWFVdjRHWjFG?=
 =?utf-8?B?d1NUSVVmeGNGREU5d25wd3lxQ2hHdFIzMDBXRVM5YmN0RElSS0ZMV2tqYzhY?=
 =?utf-8?B?dWgreEFmRkVHQ21qdDFIc0krbmFlMW9QRVhOQjVlSWlaWmJrdHMweWhPSWg2?=
 =?utf-8?B?ZFArd010dTI0SGMyT2Z3RDJSQjN6SExNWWtSVUswUVpHLzFHbVB4WjJNUGhy?=
 =?utf-8?B?cHBKRUg2dUkvdVZtdGRRLzhRSHIyTUtqRm1oQ21PUkdJMVQ1b2puanZlUVlN?=
 =?utf-8?B?U3AwSUQvTFlJM1VrY2RKZXBZeXFzTUowZWNnT2Vsb1dBdEs0ZXJ3SW85bFZ1?=
 =?utf-8?B?L082b01Gem9JREhnRFRBWk9ydytBUjd4U2lyajZHZVRIVUdVR3Q0TmFmYkdF?=
 =?utf-8?B?TWxLRE5hSjVCSjJNU2grVXh4N2pZVjl1ZGc5NitmcGNpQy9lSWNqbHE1NXRn?=
 =?utf-8?B?T2JQeTUraUJJb3QvWGxEbDlibEdISWwvemJia0FaTDBPcEtpRXNpdWM4OXU0?=
 =?utf-8?B?eWtMR3RTOUtNMHZUbWpRNVE2d0V1SE5qOHpQZUZrdUN1N1UxL3ovaGRhaVFG?=
 =?utf-8?B?dThwZDhTci9NT2JXZFFIMVNqWXhHZWxIaEh0eGZ4bmdJbXZwcTVKWFFrS0FX?=
 =?utf-8?B?NVl5RzFQY2pjclppeDBIcWorbVFEbkU4UnBRZGZZZ1JtMWk4UEhGcTlKN3pQ?=
 =?utf-8?B?NFFaMm91Y0JuSGlFbWVHMjVtc2huMGs2QnZaemREQ25uVVFrdDZzYnF4a2o0?=
 =?utf-8?B?SzRGcDlLRlNvVktpSFc3R2Q2WXQwTk1Jcnk1NWpLZzJDek93UExRNnZ4dURj?=
 =?utf-8?B?N0JPNFFsakZMSEhKRldmakYyR3RFanpDOTJIQytQcGk0emxyK0dHSzJkUjZQ?=
 =?utf-8?B?RmdjMTNvTFR6WHdOdDNLZzZYb0VVeGtROFgrMjMva3lzNWVQU0NWc08veXdY?=
 =?utf-8?B?dTBwNXZQY0haTHRiU0xmYWZZTmhqbFA3QVNnMHBwTGFGTWd2aW5SQkxWRFAw?=
 =?utf-8?B?MlVlSXZQZStJdnJwVWdCamtxZk54a05raDVxblExak9qWU0vSE9vRmFQSDcr?=
 =?utf-8?B?VWVhaDhPcU9XMFNhZmlXUUVaZHY4dEhnWXppSnB5V3I4MkQ2SS9FdmF1WW5y?=
 =?utf-8?B?QnZpZW93MUpvSDRCTXJSekpBYXExc0srN2g1VkdtcEM2SXdCbi9TUmdHd0ll?=
 =?utf-8?B?VWdid0JzeGpVVTJMdXE2cFgwaWViZGgveExIRGlNdDNrMWU1WExzR3NUVi9D?=
 =?utf-8?B?TkFjYUVlREVvQnI5Z3hGV0VSc0J4bk9XV3MvT1VNdXB6djJ3NW40M2RkeWVx?=
 =?utf-8?B?bVdBeWVadmlMd2RhQnNJL0hVOHpxakRralM0SHJxWC9tTW5yVi8wNnlYb3Ry?=
 =?utf-8?B?ZTU2a25RdmI1NzAvdkRSUFRVcm0wK09GcHo2ano1SFJYRFdiQ1d3bjY4cTJN?=
 =?utf-8?B?VWk3U01ocVpxd28xSDVYR0l0M2NqUmhQS3JRN01uQ0xVcW56cGw3cGIwZUpq?=
 =?utf-8?B?R3hXRnJuYUtNQlJYUEk2U0l4U0dSbElLY0NrcjhBdmJWcGxnZ1VjNnFEV2xh?=
 =?utf-8?B?ZlNoWXBSUUZma0o0UjN5b1FURjRnRnpGaGEyelJlSFpsWjJqWUlOV2hrNnYv?=
 =?utf-8?B?SFd1TWhldkpKdlZXNE1OZTlucDRMQUZmSU41ckhENlF3Nm5CWERtcEUrRWdu?=
 =?utf-8?B?Ty81b1NSeVpxbXA3enFsd3JiVEQ1bkRvVHJhNDIrbER4dStESmE0NW9XOEtN?=
 =?utf-8?B?VmY2VWJGNGtSWVN2R09yRndUR3ZvdUFPSXFTenJOUkg1TlhPQTJOcnVCRmFa?=
 =?utf-8?B?OGhqWUFEdFczQ0dhU0x3SFBHbDRXY1BraXNKajlSU2dWZ2Jxb2NhQXBSNWN5?=
 =?utf-8?B?VG1SaTVmUmluYmswK0FBekxkY3JONnp2YnRXbU9hSWpSUmlXUElrWUlQUFgr?=
 =?utf-8?B?Z1FSTEtVLzE2L0pGRklhZUV0ZjJXT1Q5dEtDTVFIYThFbUNhdDB4dVhKeHNx?=
 =?utf-8?B?TnNLZjhQaVl5Q1VkemxHY0dSaVJMY3NTSGExM3gzY1Z6dEZpMTcxQXN2UU1k?=
 =?utf-8?Q?IGnECfQX4byaeOFhKJva1gi3ARbdFeICmQB32K90Z4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71A0F58BD34DC642A2790F41B3C56766@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8129246d-fb8f-4b0e-e7ef-08db4d6c9229
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 13:28:10.6864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZUrpMbjB46jd96q24O7thFBdR4alIjY/JmMJcXuxPLINqohKVLgEgqCFLogbv0MFGxEz5KP0InFbwbSDDIF0r6XuB11H/w8PKVq+NPvoiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7255
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIzLTA1LTA0IGF0IDEwOjMxICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDc6MzXigK9BTSBUb255IExpbmRncmVuIDx0b255QGF0
b21pZGUuY29tPiB3cm90ZToNCj4gPiAqIE5pZWRlcm1heXIsIEJFTkVESUtUIDxiZW5lZGlrdC5u
aWVkZXJtYXlyQHNpZW1lbnMuY29tPiBbMjMwNTAzIDA4OjM4XToNCj4gPiA+IFdlIGVuY291bnRl
cmVkIHNvbWUgaXNzdWVzIHdoZW4gYWNjZXNzaW5nIHRoZSBncGlvY2hhcmRldiBpbnRlcmZhY2Ug
b24gYW4NCj4gPiA+IEFNNjV4eCBwbGFmb3JtLg0KPiANCj4gVGhhbmsgeW91IGZvciB1c2luZyBj
b250ZW1wb3JhcnkgQVBJcyENCg0KQW5kIHRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIHN1Y2ghDQo+
IA0KPiA+ID4gVGhlIHBpbmN0cmwgb2ZmZXJzIDMgZGlmZmVyZW50IG9wdGlvbnMgZm9yIG11eGlu
ZzoNCj4gPiA+IA0KPiA+ID4gMS4gIFVzaW5nIHRoZSBnZW5lcmljIGtlcm5lbCBBUElzOg0KPiA+
ID4gICAgICBDYWxsIHBpbmN0cmxfc2VsZWN0X3N0YXRlKCkgZnVuY3Rpb24gYXMgc3RhdGVkDQo+
ID4gPiBpbiAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Bpbi1jb250cm9sLnJzdCAoc2VjdGlv
biAiUGluIGNvbnRyb2wgcmVxdWVzdHMNCj4gPiA+IGZyb20gZHJpdmVycyIpLg0KPiA+ID4gICAg
ICBUaGlzIGZ1bmN0aW9uIHdpbGwgc2VsZWN0IGEgZGVmaW5lZCBzdGF0ZSB3aGljaCBoYXMgYmVl
biBkZWZpbmVkIGluIERUQg0KPiA+ID4gd2l0aCAicGluY3RybC0wIiwgInBpbmN0cmwtMSIsICJw
aW5jdHJsLXgiDQo+ID4gPiAyLiAgTXV4IHBpbnMgd2l0aCBkZWJ1Z2ZzOg0KPiA+ID4gICAgICBX
cml0ZSB0aGUgZGVzaXJlZCBwaW5ncm91cCBhbmQgcGluZnVuY3Rpb24gaW50byB0aGUgInBpbm11
eC1zZWxlY3QiDQo+ID4gPiBmaWxlIG9mIHRoZSByZWxhdGVkIHBpbiBjb250cm9sbGVyLg0KPiA+
ID4gMy4gTXV4IHRoZSBHUElPIGZ1bmN0aW9uIG9mIGEgcmVxdWVzdGVkIEdQSU8gcGluIGJ5IGNh
bGxpbmcgdGhlIHBpbmN0cmwNCj4gPiA+IGRyaXZlcnMgcGNzX3JlcXVlc3RfZ3BpbygpIGZ1bmN0
aW9uLg0KPiA+ID4gDQo+ID4gPiBUaGUgcHJvYmxlbSBub3cgaXMgdGhhdCBvbmx5IG9wdGlvbiAx
LiB3aWxsIHN0b3JlIHRoZSBjdXJyZW50IG11eA0KPiA+ID4gaW5mb3JtYXRpb24gaW4gdGhlIHBp
bmN0cmwgc3Vic3lzdGVtcyBjb3JlLg0KPiA+ID4gVGhlIHBpbmN0cmwtc2luZ2xlIGRyaXZlciBo
aWdobHkgZGVwZW5kcyBvbiB0aGF0IGluZm9ybWF0aW9uLCB3aGljaCBpcyBub3QNCj4gPiA+IGF2
YWlsYWJsZSBhdCBhbGwgd2VubiBtdXhpbmcgd2l0aCBvcHRpb25zIDImMy4NCj4gPiA+IA0KPiA+
ID4gSSB3YXMgYWJsZSB0byBmaXggdGhhdCBmb3Igb3B0aW9uIDIgYnV0IG5vdCBmb3Igb3B0aW9u
IDMuIFRoZSBwcm9ibGVtIGhlcmUNCj4gPiA+IGlzIHRoYXQgdGhlIHBjc19yZXF1ZXN0X2dwaW8o
KSBmdW5jdGlvbiBqdXN0IGRvZXMgbm90IHByb3ZpZGUgZW5vdWdoDQo+ID4gPiBwYXJhbWV0ZXJz
IHdpdGggc3VmZmljaWVudCBpbmZvcm1hdGlvbiBmb3IgYWNoaWV2aW5nIHRoYXQgdGFzay4NCj4g
DQo+IFRoZSBmYWN0IHRoYXQgMykgZG9lc24ndCB3b3JrIGhhcyB0byBkbyB3aXRoIGhvdyBwaW5j
dHJsLXNpbmdsZSBoYXMNCj4gYmVlbiBlbmdpbmVlcmVkIEkgdGhpbmssIHdoYXQgdGhlIHBpbmN0
cmxfb3BzIC5ncGlvX3JlcXVlc3RfZW5hYmxlLw0KPiAuZ3Bpb19kaXNhYmxlX2ZyZWUvLmdwaW9f
c2V0X2RpcmVjdGlvbiBwcm92aWRlIGlzIGEgInNob3J0Y3V0Ig0KPiBmb3IgZHJpdmVycyB0aGF0
IHdhbnQgdG8gdGFrZSBpdCwgaW4gY2FzZSB0aGV5IGNhbiBwcm92aWRlIHRoZSByaWdodA0KPiBp
bmZvcm1hdGlvbi4NCg0KT2sgc28gSSdtIG5vdCBjb21wbGV0ZWx5IHdyb25nIGhlcmUuIE5vdyBJ
IGZlZWwgbW9yZSBjb25maWRlbnQgZm9yIGZ1cnRoZXINCmludmVzdGlnYXRpb24uIA0KDQoNCj4g
DQo+IFRoZSBwaW5jdHJsLXNpbmdsZSBkcml2ZXIgb25seSBpbXBsZW1lbnRzIC5ncGlvX3JlcXVl
c3RfZW5hYmxlKCkNCj4gYnV0IG9mdGVuIHRoYXQgaXMgZW5vdWdoLg0KPiANCj4gVGhlbiBpdCBp
cyB0aGUgY2FsbGJhY2tzIGZvciBnZW5lcmljIGNvbmZpZyB0aGF0IHlvdSBzYWlkIHlvdSBhbHJl
YWR5DQo+IGFkZGVkIHRvIGdwaW8tZGF2aW5jaS5jLCBzbyB0aGF0IHBhcnQgc2hvdWxkIGJlIGZp
bmUsIHBhdGNoZXMgd2VsY29tZSENCg0KSSdsbCBzZW5kIG91dCBzb21lIHBhdGNoZXMgdGhlIG5l
eHQgdHdvIHdlZWtzLi4uDQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCg==
