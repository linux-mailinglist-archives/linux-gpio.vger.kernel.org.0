Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF128551176
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 09:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239320AbiFTHZj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 03:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbiFTHZj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 03:25:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A98E0D1;
        Mon, 20 Jun 2022 00:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHB69/jU6B/pFM2BnOaBLU0H1IpUPd6xqHreZIWDTvetajAxSHEs4SiBWWHA6d/y9Q9Wbu5nTQ4VHm065NDDj+SAd5cim1JuebCz8T8sTU5kXMk1d5UwF0vXNN811jr1TF4oxcsZovXFmR445pj/8JXCRmFgpSQkoH86u7cYfuTHQeWxLq7FgZohoqmCnHFBt5Q3IYQeKmk0/4H1BQLI+CGH6rkv7WJWrivmFW1tBxkjAO/7nHsxSuPzWY9NoBMPbMmgZghvbsDhh6TtCfMnp9sQt9rjIcY3oQi0NntlaY1sDUDbwZya3YbMmE4YJLaRsvC7P7/UoagCUSkRuGuC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5shGF9GzUMkUvpQbTiMXUTt8z2f3d/4nMMf6mQ+jtA=;
 b=cqINVXqRngKZBJ+LOVXbLm6vcwvTNgZcCQNoRcPyi1sOEWMQMFnjUObWMQO25BDynae/1kP0NgbJMMGWiFMaNrqhLtPxa2W2I7n3A3lDNDzIoF0ZuV+BXxSh+hyqM9k3T3tczpux7U4Z97FOEPXuWw3d627FHHwqonDu7cpbM29raEbJXhv/vR18J9H3UDBFOTXjNRjEkFVkSyKmEmJBmuKIegONTJP1owmQq/4TF9n1Mul4AmaC7zwZWNezrhioPUDQbZuy8JW3tQN5GNVdtLzhH0InfE12yAYiYjIH3n62rhcxm+aT6zrd53NaQD36uoOMPD07lz+9c6FQSg21XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5shGF9GzUMkUvpQbTiMXUTt8z2f3d/4nMMf6mQ+jtA=;
 b=K7NcHA+6G+RJyGifcYgXfFra8cor6Yi1tIsmuKeBv8yobtVzwF84JtixKcQCEUJe/RczQtO4AG917z1CbYDIs1kquJkz5h9txWSpiYq6YIOmubNDPrmMtQlVVnWDsbWWvshNvgnGmhUKWCa+HGi5tAsPgA70EdzJB7AMiFsgwd8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB8884.jpnprd01.prod.outlook.com (2603:1096:400:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 07:25:31 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 07:25:31 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Index: AQHYbGAJuUt0o0UhwkGKZGmmj+mQHK1O9rEAgAAESvCACRVIkA==
Date:   Mon, 20 Jun 2022 07:25:31 +0000
Message-ID: <TYYPR01MB708625D19AD3E5EA9BD21356F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
 <20220520154051.29088-2-phil.edworthy@renesas.com>
 <CAMuHMdVyoCG7PNtk9b32JAnzq4R+EeLCxM-8owuphhD=KFS=Ow@mail.gmail.com>
 <TYYPR01MB70865B5F1C4F918F3125CFB8F5AA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70865B5F1C4F918F3125CFB8F5AA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c068dc95-dd3e-43e4-9a58-08da528e0eb0
x-ms-traffictypediagnostic: TYCPR01MB8884:EE_
x-microsoft-antispam-prvs: <TYCPR01MB88840957DB9FF02FF08FB132F5B09@TYCPR01MB8884.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L53EoPQnYr/aneFF8VmU9VAmJrIbltVzCKKjfX+VnVjl6tFpfFbor8kP/G6XDkkVjqzfb5M8tZwaO4wY0qboI1MF0KQ8hneawUGctCxoF+AJ2fCz1efEECNTgzYx774HUwDQLPYrKkilED6bMyg7keCgUYLGinf3RwRT41BrB5XnwYxmOqup1GQ8M3TK1ppqkKcqXTpyAf7cWOz/h1rvc/x5QDqljLn11CFf/ftjXmrGipkvBfe8KeUXcCyZ+128zU3vSwlmkUh/7ArgOUrqVPI+vJW4r2wJcoc2VCODk1zBU9DdUE3oEznJVyrHYaTdJozsR6CYmzP1FoS5gF6oeo3uorrfuF0JKEvUeCp18kr/9fQ5u/SUUdft9V+iJIm/x0RnTA5lRJcxSiL+B+YukwbLTcirLQUr+20SDHLF7HD5/u9dBn67l5nvvmTKaxjEDG21cFDTrPZRn+UUu9uBv+CdRiKHN4nPwWE3L9VgGsKSsD7TwoDSYgXn5nzqZv0vH8O0vhz66A16HZGkAEOqGvTFAhJeg6p4RmuJWch2x6cy8wzi2g57Wx4QOZ3GnBWHnvJ2k1kXsV9OWJaZ/wQVBImaLadYzaJQf2IE/SlCw5mRrpUSXKM52bqLUF1JygsuCWjGt/+ZZpBvo/WKgNiROC4z9w8kCh4RI8WThAQ+sgl/HPgaOahCtwkrLs1lzxUPYiEvjqfNVw5SCQ7KvgWfYUwRk7FclBOMvrDOedn4kr9vjqTHg/nAbLrGr2gp7Oal
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(8936002)(26005)(122000001)(52536014)(9686003)(53546011)(41300700001)(54906003)(478600001)(2906002)(38100700002)(33656002)(71200400001)(5660300002)(44832011)(86362001)(186003)(6506007)(7696005)(4744005)(66946007)(76116006)(38070700005)(66476007)(64756008)(55016003)(66446008)(4326008)(8676002)(316002)(66556008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3FKM2hManNPMDZ4YkxUMVMwcjN2cTVNN2FJVm9vRkpzK1h4amtkZW4wNjRh?=
 =?utf-8?B?bXhySVlpT3ZscVdDV05pV2NONHhNWjNjVUM2VlFFWE9aVGZ4dDduQm01emo5?=
 =?utf-8?B?bGN2VnI1dzFXNlpxcUZWclVudHlrQVRXU1YyRXFxS2FIT1VPV3piV2tqQzVv?=
 =?utf-8?B?UnY0ZDMyakxVcEtib1kzTWd3eHVDUDZCKzRBNlFqSEx2c2hmR3ZyUm9PYzlT?=
 =?utf-8?B?T1dmMzFTQXJETnhsdWcwbGxyU1VKUlRHNnNYMXdjWFg0V0xyWXQ4ZEFkMFBZ?=
 =?utf-8?B?SUJUMEQ3c1ZDVDJMT2wvT1lKZHFuTGRtcHlVWFl2NGR5emE0bnhDa2ZrR0VL?=
 =?utf-8?B?MWJ4VkpXZS9YWDJOUkRNdEwxMUJKZFU2NTVtdVF0T2NETS92NU5SUHhBdDVN?=
 =?utf-8?B?dUdRZFJ0eFFPbDZJbVpHTTd4MkxRdFZnY3lQSU95dktXZjBYUGZnK2Q4SVgy?=
 =?utf-8?B?YlNVT0xsTXhBekRaUkpheE9OdytTU1Q5ZGZpWGVyUEczV2VrdzkwTUZURHhX?=
 =?utf-8?B?L092M2prM01kR1dBejlxNVhicDBqM0VoQzh0QkFRR1grdzl0UStoeDlNRkRs?=
 =?utf-8?B?d2JiK3UwdHQvQ3BHOVMyRWovcHI4Q0JoTDBkVzFBa01OaElTQVcwU1gzVUlV?=
 =?utf-8?B?bDJaV1p1SWF4L2lvREdKOEZrNUZvTWZoc1llU0pySUt2bEZaaVByVEo5elNo?=
 =?utf-8?B?QjBqNUlvSFQ0R1FhUXIzUXlJWFFmWFFKZGFDVDEwNWlSZmhNb3BTNkVjSVRi?=
 =?utf-8?B?dE1iVnp4L25vT0pNT0hzOThmWEVsMHBON3NSOFRvd08yR0w0R3pvMUxIMmFD?=
 =?utf-8?B?NXZWUDBGdXRzVmhSTzQ1NHgzSTFsVnl3dDN5RTBodk5EQ3A4MjNVWFZnRUFM?=
 =?utf-8?B?QlI3bU1ha3dsR1NuR2pFTkRmSXk5dkhCeFJ1SStVRXlNb2xueWJpZzN6Yjlv?=
 =?utf-8?B?V2lMTEszSTdXcEpuc1lYOVc4N2hkS3d3QlVRa09zUm9vaDVEcWhEcTJzOVE2?=
 =?utf-8?B?SWtKbGZJdU02MGRBNUFpQ1ErSlc0OHlvL1VJNDVoWjgzaXl2MW9MRldHUTZL?=
 =?utf-8?B?a080UlozZ3lwMUNoYkQySE9SUzlBd1duSStlQWRCa3Arc0ZUNklMY1hDSEVC?=
 =?utf-8?B?bithUmhVcGgrbzFOU09pQ1BNYU1LaFMwZ2UvY2VxRUxVcU9CUkZsQWZIWUcw?=
 =?utf-8?B?bUpXVGN4V1pjMkkrUWNkWG1zaHdFTXNTYk9Rb0w4SE9xZ0M2Sm5WdlNwd01y?=
 =?utf-8?B?NXpod2dmalNSSTAzY3JMQW5NT1pXZWFPWi9SdjNkczRNUUxGTExodS9yMUlL?=
 =?utf-8?B?U21QeXFtcUp2UGFncU5JNk9PeDJTdk1oMGVXWDVRQlNlMWptekxVK2tHZUg5?=
 =?utf-8?B?bkRGVlZkUEpYcnRKNEZ4bUtRTFFGM3NCdW11b0xnRjZ5UGoyZGlaUkt4VHh0?=
 =?utf-8?B?cW14SzFVS3k4ZHBQelh1eGQ1d2FHbzZiNEhFaDV2cGpXRlVtL2o1YjA2OVFn?=
 =?utf-8?B?Zk41bTV6MkNycUtnbGxiN1RtK0F4Z1RSK3hBMzRocExhUENMM01QMk1ab1Ur?=
 =?utf-8?B?RjFiRG9xQng3OWcvWVdSUDVPeFZnT1J0OU0ySDB5cDF2RldoNTFQbmR3YjZx?=
 =?utf-8?B?WE9aeEJrbVVpMkJvdXg1emhoMDRkS3NadzFBTitlZHIrVnIxY3FNc284L1Jx?=
 =?utf-8?B?dGJYYVUzcHo0Q05PNHJUMzliMy94a2N2R21SbHF0Q0o2bzlqYjdXMjhoTzhI?=
 =?utf-8?B?MGhOeHRJa0ZMY0dqSUtoeUpOMDJXN21nL2FMQnIycjJRR2RXR0RVeG54U3U4?=
 =?utf-8?B?b0s4dkNGQzVlR09IN1JuVHo4YUZvNU03cEsrZHZQWm1wVlRBTVJZNFM1eTdm?=
 =?utf-8?B?dlFBUXNHYXRVdXpMZGJHRml0M3ZKWXc4NTVsamF4M1p4dFFDWEpqN3VMaFVW?=
 =?utf-8?B?U2ZjWjY1b2xZSnpHQ1VIcDBibWhYNEZFQ3JUcitkdHBMZ1M4NXZSZEtIK3VQ?=
 =?utf-8?B?aEswQXQ5eGQwS1V0bjk3RkVkTDdQTklrZHd4Z2N6SHdmNGxKWWdhcnM3LzBp?=
 =?utf-8?B?NnNiLzNVL1E4WnBiZStPNjZqQWFNeGJGbXVxSVRPVFBvbmgxSThwZG91citj?=
 =?utf-8?B?ME01R0FSeDBCQmVsd0ZVdFloVkJzSzhkUUNXdy96MDdJV0FlSVFFcjA1TlZP?=
 =?utf-8?B?T0RTYVBVcmtsaG80c2xvckxjTVc2MUNzNVVuQWl4Qm1MMFhhT0JGTnRIQjhy?=
 =?utf-8?B?c2pLNnlMY1hTRTlTZ1RiQzRDaU40eVVsTjh3ZWxrYzBhK0Y4NDI5UVUrTE9j?=
 =?utf-8?B?Uyt3enlBdzFiNnFvVkNlUGUyd0srajRvdlZDNEFRT2pKcUxIdktNcCtvRVpP?=
 =?utf-8?Q?nJ10F1lWCw8SN7Vk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c068dc95-dd3e-43e4-9a58-08da528e0eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 07:25:31.1308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W92JWmb+WfTq1elv+x3NJSbsygF071XaF4QshhyIPZ6yHhYisBVvk0pbb4du0EoObk3EDqNChd/OzEkTtvyeBedg0RGVZqoiwTgJehjJLDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8884
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCk9uIDE0IEp1bmUgMjAyMiAxNDowMSBQaGlsIEVkd29ydGh5IHdyb3RlOg0K
PiBPbiAxNCBKdW5lIDIwMjIgMTM6MTAgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IE9u
IEZyaSwgTWF5IDIwLCAyMDIyIGF0IDU6NDEgUE0gUGhpbCBFZHdvcnRoeSB3cm90ZToNCjxzbmlw
Pg0KDQo+ID4gPiArICAgICAgICBncGlvLWhvZzogdHJ1ZQ0KPiA+ID4gKyAgICAgICAgZ3Bpb3M6
IHRydWUNCj4gPiA+ICsgICAgICAgIGlucHV0LWVuYWJsZTogdHJ1ZQ0KPiA+DQo+ID4gTWlzc2lu
ZyBvdXRwdXQtZW5hYmxlPw0KPiBJZiBpdCdzIGFuIG91dHB1dCwgd291bGRuJ3QgeW91IG9ubHkg
d2FudCB0byBzZXQgaXQgaGlnaCBvciBsb3c/DQpJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhl
IHVzZSBvZiBpbnB1dC1lbmFibGUgYW5kIG91dHB1dC1lbmFibGUgRFQNCnByb3BlcnRpZXMuIEFz
IGZhciBhcyBJIGNhbiB0ZWxsLCB0aGVzZSBhcmUgb25seSB1c2VmdWwgZm9yIHBpbnMgdGhhdA0K
YXJlIG5vdCBnb2luZyB0byBiZSB1c2VkIGFzIGdwaW9zLiBJcyB0aGF0IGNvcnJlY3Q/DQoNCklm
IHRoZXkgYXJlIHRvIGJlIHVzZWQgYXMgZ3Bpb3MsIGdwaW9saWIgd291bGQgc2V0IHRoZSBkaXJl
Y3Rpb24gdmlhDQpzdHJ1Y3QgZ3Bpb19jaGlwIGRpcmVjdGlvbl9pbnB1dCgpIGFuZCBkaXJlY3Rp
b25fb3V0cHV0KCkNCg0KVGhhbmtzDQpQaGlsDQo=
