Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3495C6426ED
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 11:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiLEKrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 05:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiLEKra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 05:47:30 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3F412757
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 02:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDg1Fpm+jJm2yPZV/jAtdqAMcDsZGucRybMDmfn1vgJERjMSiIQErALn4EcBi0BCfC14M5Uyt1KvDH961yC5u8VkxTxJizzKYSHrn36n0pvUmCT3uwyngYXi28rgD3bnPViVltiUE0BGXlRGO6em7fJk45wKcs6Sd0tzrvyHp2h3teiH+v1QYRcdJ/5hBXsnyNE8ojcTF7/FHJFGbwTeRbre+SgRNWaTptjJy+doETWAvcR32mk6GaI6SbdAWRdxuHINWbVBQ4FKDWbjpWA9S32UG57wFUDEx1lIgDxNNM70u7/aIl6Y25VAPXsmsDfBPj9sXIBO91KsU8cKZyr05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaFI571kXSz6ThFsb33is9uebgDg8rA8uUhBSMadB6o=;
 b=QKnWBua/bc8n5GB/JP+PO8fbTBBT5i4kUwOon7f6O5ysXtQyMRGq3RjAAvSH3Z7J49ZpJ2RrnzSsCsvNOSJIIHOdIwCvvKsvqesQdVIh6wDeTzj56EN/+viMFNFDUV2ZD6siBUiXTpWlJqW7D7uBHY/gdcyH9RaSexu1+H/T1kvLuMYtekXiosGpx6sL3s+MLLnevA0KMBtxvl0H/GbIAEprbj+wHE+NfskMxJjXzQEPJe4TTCB+InAPuOHj07tnIVPNOQi/AXzsYluZOKQkg9ryfJG1Vreq7NczaBxYZMqm+EeMeFGwW5Tns0h9MxA0EVwHtgTOPBMsrkFOvtNUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaFI571kXSz6ThFsb33is9uebgDg8rA8uUhBSMadB6o=;
 b=j/qZuh9urS016RZiV44LhrQXjDrO/lgx8Gp1gkaGVQb/MhQs+Au4VwhEF5ChR1WyiyZAzSC1FLsZHRtXb3gWGRi3Jc+P8mVyaF0Sh1wkRYvdW6yM8SVcxqoNKzRPSVOoEzZBS4NBFlK3x7Xo92vJN8TD/zDUewwJjY+fNP698kMhSrpW8QX0Jl8hkuGFE+/xN4AMiEBgJ72OBI7Ts8/7tsWzU0wPBbiQSzHeCwf7Uyr2PleCGxkhuArZ6/nXy4hYWoPgDzD7vMRHtvu20bqS2ioOO0EBu0yBopbC6foaYuFisJUYyCpx2OmjggGsfYuk3FmERVZhreqLaNfAhVf3dg==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM0PR10MB3972.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 10:47:27 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 10:47:27 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: Question regarding runtime pinctrl (2nd try)
Thread-Topic: Question regarding runtime pinctrl (2nd try)
Thread-Index: AQHZBM3Lq/cXs1to5Uuhi20fkVKuV65Xm34AgAeI0wA=
Date:   Mon, 5 Dec 2022 10:47:27 +0000
Message-ID: <21ea48401aa3d652a379bf6aa412c660d3f4f0e5.camel@siemens.com>
References: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
         <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
In-Reply-To: <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM0PR10MB3972:EE_
x-ms-office365-filtering-correlation-id: a0ad85b7-f175-4afc-abd3-08dad6ae19c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZfBT4wWMSwYz9Mq68SC0QTE4ahuWt/Ugb+3VuhShJ73z4odGq/QusiyMIjGmuhmg8qNlb4pZ0FmzriLAnT+93/5c3nC5LO+cLHKi1tl5Qy8/Baj1e2vjeu6cZ9moaIEzdVs/pbCJwudSEUxj8d1LpkyfIwecVi0Ydwz13Rv0sR+d16dtcsZKNAaDQwtYppf0XOtQ5oRwCmNNGzObvXaIXiWrb4C06nqySUY6FnMu0P8q2O6OXYZyuBaWoulQ0vsTlASSniPB7mn4zdeatZOKvQKVwr62/hMRhuB5X6OoA2ULco05oXxt6W79UgHQZB7uwjnpySZOqcat1KmTPGYgsDfTN1AUYwW4+sL4YUuPROLSEA3Uq7S/PttFa0GedIE5udY2A0dbxmArKq2kzrNYsZuhe4ZZrdY7D2qzPjHtH/JDCy6PISdzgEBIASIAL2BHxbJFtoeRP41eIQ+hOLzmMcwWo+T27p/XLYwItqz0VwwayYxOehlaaCwqkLUd9Iv3UCqukNZ2apS3LrvU1QOLWkc4tjdwWOMIYTihkAPwdcHjHsA1jylmIuq4kDUS2NZj74HM8l01cTvAvaKJxuDuLSXQlyOHrP7Pb9zzEjMbsy+O7vk8DRojP31KDI48LtjHbCo5sYQhE+SpDAB/39QoD1AfEmIA42DQtYSa6B4McCYgSZG23pHpX32x2s12OHgErVTrq1dIGMe6x86i6AI33Hw61ywb57m9JbfCEXp3Y8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(76116006)(38100700002)(82960400001)(91956017)(66946007)(41300700001)(66446008)(64756008)(66476007)(66556008)(4326008)(8676002)(5660300002)(2906002)(2616005)(8936002)(36756003)(122000001)(83380400001)(86362001)(478600001)(66899015)(966005)(6486002)(6916009)(71200400001)(38070700005)(54906003)(3450700001)(26005)(6512007)(6506007)(186003)(4001150100001)(316002)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1YxRmFyMVVFbHFRNWJrYjRPeS82UGl4ZUg4MGpaV0pxTHc3STR4T1NpSUh2?=
 =?utf-8?B?cnNkVDBXS3hlZzZ2Umt0NktsOWRkQjNpL2FDOUZnaEYwMmdCeFRnV01FdDMy?=
 =?utf-8?B?T3FibkIwMWRYeWI3RGlSVzN3YkFzeHBJaW51Slhtcm5ZTDJheE1IMUdzUFFu?=
 =?utf-8?B?U2daTHNWMWVvZGU4eVVFZ0I0cHVEdlM5ZXRSOUM5K1M5Q0dwNlhhY2JKQmpx?=
 =?utf-8?B?RC90MmozOTFWL1RJOUhLZ240SXk0OWs4NU1vbVBXM1Ezd29nbVJRdGtDU1RH?=
 =?utf-8?B?V1lQVTFrSUx6d0JiYmFOQnFqOFhnWkhOS1JDY2VVUjNRWUxLNmJtdGZDalA4?=
 =?utf-8?B?Y2UrYXRGcTNIU3Q1V2Qwbmg4OFBVeTBvVVd5VGlqVERvaklrWngxblBTb09Z?=
 =?utf-8?B?UFdxSldVTHlrZ08vUkRHdHdEYUZFeDNKZ3BycmNORlBPbHZ6bERzTThZZjNY?=
 =?utf-8?B?azdMbXhObTVGdExRK1BPNHRiQXJNREltWll1Q3BSMEZCM3dYYkhqWFlBZGY2?=
 =?utf-8?B?WVpSU3Fjb3dKSVJ2a3RGUlNORWNtazBoUTdSRTFNaWNUV0ovaEZ0anBIZDdG?=
 =?utf-8?B?NmMvU2ZyWDJ4YjhiOVRBVHhWQmVhcHVDV2F2S0wzSCttRkFkQTFvczJIcUlI?=
 =?utf-8?B?MmJrblFIU0NSY2dETTdwQTJySU93VkYrUlpzODhocitpWE9PV1ZFRHNXZkds?=
 =?utf-8?B?MWw0NmhjY3krQnFuYVpycmJPYWMxd1piY21uK1ZkT0JUV3h6MVEzS0ZMT3hK?=
 =?utf-8?B?cTBuR0tGeE5qdmt5VXlERWI5UTIzRllsZmVHdWFJdTZPS3BqaUlzTXFIamhL?=
 =?utf-8?B?cW5DaERGSXliNTRYc2NMbjk0eDBBU25zWWQyMXl1LzVrNlh1RUNEelFtWm5p?=
 =?utf-8?B?S240aGZjQ2VSQk5nckp3UFBSNXVYZTJNeDdwOVBheStuUU9sUWtQSFgyZUR2?=
 =?utf-8?B?OFN3aHRoYWp6alRPSFdhSXZQaERMbkh2ZUFLMGdDZmdTV1ZGM056U1Ard2dM?=
 =?utf-8?B?a1FQVURGYkhEYnZ3MkxnU3Q5S1RDQ25YQzhQU0dsS0U2ZEVzaW9kVUF5U0ow?=
 =?utf-8?B?UXJhUjB6bEVscHBWNGtMVzk3WUQ5dXN6L1RDelQ3Uit3VVJ4RE5zQUh1Q0dD?=
 =?utf-8?B?cjFoNEM4WUprNW9FZW9pUkVPNmhmTEoxWmN2R29jV0FXUHBsaUUybE5vSm4y?=
 =?utf-8?B?cm9CSTZxRE0xT0JKQnlYcldtcXUvNmZKWXhweHQwSS8wN3RRc1EydUhGdEZ5?=
 =?utf-8?B?dmpJME84cTRaS0VmQ3N3cGNKNGlLUVhJdURQSEhheFhPd25Gcm5GNnk5VDN2?=
 =?utf-8?B?SmkrbThNeXJMVUpqNlI0VHRWc012Y2tOQ0dHV3Zsc1lMc1dOK0ZzdS9MV0ND?=
 =?utf-8?B?V0owOVdlWWtTUVpxL2JGRW9Majl3b3oyWWZCNWV5MHBoQTJ6TUplN2xoejNr?=
 =?utf-8?B?QWtDTkEvcndqY0g3VmtuZEQ4cjd4MVQ3ODgvaHVVNm50ZmNwYVdpTEk3YUlC?=
 =?utf-8?B?b2FMbWdiY3dRZ2hNL0FrbzZObXRRdWN5azJrUlIxWEY1VXhLOFpwSmdNakNY?=
 =?utf-8?B?QjUzV2RjdkxQc1J0QU9NYjZWejhCWHNVZHlTRGxBWS9PSzBwWXlKMzJrY05J?=
 =?utf-8?B?S0NDakdyYkRKWE44ekFqOC9HME1zVHlQM3NaM2hZRStJRUY2TVpYNGlBb2hx?=
 =?utf-8?B?bGRCNy80VHJpVURmL2s4Vy9qMWpkZkNYU2EwaEliS0RLbThWSGxSSGdYbWRu?=
 =?utf-8?B?MDcrQmJtOGVmRmVaT2pLZmNRbWIzUzk1Q0VPUGkyWFBJY2ZXL3pGRmxudzVt?=
 =?utf-8?B?cG9iTUhmcjlQM29OSmNMdjQ4RTR4R0I1ZGRwdGNWR0xPSVovbDFydFFackRW?=
 =?utf-8?B?WDViODA1Q2FZcllLazFBNFFCdmlGN2x3QnR6SWJMWDhCRW9lY1pMbk9yd2Np?=
 =?utf-8?B?aWp5NlhjM2tWTVJwK0Iwc0NSVHNUVSthYWRMVWF1R3pzamkyUThPQkxITm40?=
 =?utf-8?B?U3dnYW1rc25sWmRDaHk3aFQ2MlljeUIvU2lBNEFZckZxQzduc2s5dXd1RXpv?=
 =?utf-8?B?YWZSR2lOa21NOGZybEdTZkZoQTVCTHJwM2lwMjk3R1J0TWo0eXV1dG8vTnlV?=
 =?utf-8?B?Q0ZqRHcyeFpNWEp5cDk4YXVham9VSG5BZ3U3WHlsUzFmUnQ1d2pIUTRjSDRC?=
 =?utf-8?Q?11/FV27/wfdWI4uE1LG86U4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4818CCD756E4D43B428C2CDB0876918@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ad85b7-f175-4afc-abd3-08dad6ae19c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 10:47:27.0587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BI4U9frTxdklDKfhUdQjSMvT0xK6+BSJiK+woMX/BBbnMynkkbVGghh64l25sLuhLSK/AeneA/yIeHTgHEaPIglaIM7pp2tk90pPb5uU46A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3972
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCnRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlIQ0KDQpPbiBXZWQsIDIwMjItMTEtMzAg
YXQgMTc6NDMgKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gV2VkLCBOb3YgMzAs
IDIwMjIgYXQgMDM6MDk6NTBQTSArMDAwMCwgTmllZGVybWF5ciwgQkVORURJS1Qgd3JvdGU6DQo+
ID4gSGVsbG8sDQo+ID4gDQo+ID4gSSBnb3Qgbm8gcmVzcG9uc2Ugc2luY2UgbGFzdCB0aW1lIHNv
IEkgdHJ5IGl0IGFnYWluLCBidXQgd2l0aCBhIGJpdCBtb3JlDQo+ID4ga25vd2xlZGdlIHRoaXMg
dGltZS4NCj4gPiANCj4gPiBBZnRlciBjYXJlZnVsbHkgcmVhZGluZyB0aGUgcGluY3RybCBkb2N1
bWVudGF0aW9uDQo+ID4gKGRyaXZlci1hcGkvcGluLWNvbnRyb2wucnN0KSBpdCB3YXMgdmVyeSBj
bGVhciBmb3IgbWUgdGhhdCBzdWNoIGFuIGludGVyZmFjZQ0KPiA+IGFscmVhZHkgZXhpc3RzIGFu
ZCBpcyBhY2Nlc3NhYmxlIHZpYSBkZWJ1Z2ZzLiBUaGUgZG9jdW1lbnRhdGlvbiBpcyB2ZXJ5IGNs
ZWFyDQo+ID4gYW5kIHNlbGYtZXhwbGFuYXRvcnkuIFRoYW5rcyBmb3IgdGhhdCENCj4gPiBBdCB0
aGUgdGltZSBvZiB3cml0aW5nIG15IGxhc3QgZW1haWwgWzFdIEkgdG9vayBhIGxvb2sgaW50byBh
biBvbGRlciBCU1ANCj4gPiBrZXJuZWwgd2hlcmUgdGhpcyBmZWF0dXJlIGhhcyBub3QgYmVlbiBp
bXBsZW1lbnRlZCwgeWV0LiBJIG11c3QgYXBvbG9naXplIGZvcg0KPiA+IHRoYXQuLi4NCj4gPiAN
Cj4gPiBOb3cgbXkgbGFzdCBjb25jZXJuIGlzIHVzaW5nIGRlYnVnZnMgb24gYSBwcm9kdWN0aXZl
IHN5c3RlbS4gSU1ITyBkZWJ1Z2ZzIGlzDQo+ID4gbm90IHRoZSByaWdodCBpbnRlcmZhY2UgdG8g
aW50ZXJhY3Qgb24gYSBwcm9kdWN0aXZlIHN5c3RlbS4NCj4gDQo+IEFuZCB0aGlzIGlzIGEgcG9p
bnQuIE5vLW9uZSBzaG91bGQgdHJ5IGl0IG9uIHRoZSBwcm9kdWN0aW9uIHN5c3RlbXMuDQo+IA0K
PiA+IEVzcGVjaWFsbHkgd2hlbg0KPiA+IHdoZW4gYSB1bnByaXZpbGVnZWQgcHJvY2VzcyB3YW50
cyB0byBpbnRlcmFjdCB3aXRoIGFuIGludGVyZmFjZSBvZmZlcmVkIGJ5DQo+ID4gZGVidWdmcy4g
SXQncyBwb3NzaWJsZSB0byBjaGFuZ2UNCj4gPiBwZXJtaXNzaW9ucyBvbiBmaWxlcyBhbmQgZm9s
ZGVycyB0aGVyZSBidXQgbmV2ZXJ0aGVsZXNzIEkgdGhpbmsgdGhhdCB0aGlzIGlzDQo+ID4gbm90
IHRoZSB3YXkgdG8gZ28sIHNpbmNlIGRlYnVnZnMgd2FzIGRlc2lnbmVkIHRvIG9mZmVyIGludGVy
ZmFjZXMgdG8NCj4gPiBwcml2aWxlZ2VkIHByb2Nlc3NlcyBvbmx5Lg0KPiANCj4gQ29ycmVjdC4N
Cj4gDQo+ID4gTXkgcHJvcG9zYWwgd291bGQgYmUgdG8gaW1wbGVtZW50IGFuIGNoYXJkZXYgaW50
ZXJmYWNlIGZvciB0aGF0IGFuZCB1c2luZw0KPiA+IHVkZXYgcnVsZXMgdG8gYXNzaWduIGNvcnJl
Y3QgcGVybWlzc2lvbnMgdG8gdGhhdC4gV2l0aCB0aGlzIGludGVyZmFjZSBJIGNhbg0KPiA+IHRo
ZW4gc2VsZWN0IHRoZSBhY3RpdmUgcGluY3RybC1ncm91cHMgd2hpY2ggaGF2ZSBiZWVuIGRlZmlu
ZWQgaW4gdGhlIGRldmljZQ0KPiA+IHRyZWUgYmVmb3JlLg0KPiA+IEkgY291bGQgYWxzbyBpbWFn
aW5lIHRvIHB1dCB0aGUgaW50ZXJmYWNlIGludG8gdGhlIHN5c2ZzICh0aGF0IHdvdWxkIGJlIHZl
cnkNCj4gPiBjbG9zZSB0byB0aGUgZGVidWdmcyBpbXBsZW1lbnRhdGlvbiBJIHRoaW5rKS4NCj4g
PiANCj4gPiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdD8gQW0gSSBzdGlsbCBtaXNzaW5nIHNv
bWV0aGluZz8NCj4gDQo+IEluIG15IG9waW5pb24gLS0gbm8gZ28uDQo+IA0KPiBUaGUgcGxhdGZv
cm0gZGVzY3JpcHRpb24gKEFDUEksIERULCBvciBib2FyZCBmaWxlcykgc2hvdWxkIGtub3cgd2hh
dCB0aGV5IGFyZQ0KPiBkb2luZy4gSWYgc29tZXRoaW5nIG1pc3NpbmcgdG8gYWNoaWV2ZSB3aGF0
IHlvdSBuZWVkIHZpYSBleGlzdGluZyBpbnRlcmZhY2VzDQo+IHdlIHJhdGhlciB0aGluayBhYm91
dCB0aGF0LCBidXQgbm8sIHRoZSBkZWJ1Z2ZzIHN0YXlzIGFuZCBvbmx5IGZvciB0aGUgcHVycG9z
ZXMNCj4gb2YgZGV2ZWxvcG1lbnQgb24gdGhlICJJIGtub3cgd2hhdCBJJ20gZG9pbmciIGJhc2lz
Lg0KPiANCk9rLiBJZiBJIGdvdCB5b3UgcmlnaHQsIHlvdSBtZWFudCB0aGF0IHRoZXJlIGlzIG5v
IHdheSB0byByZXBsYWNlIHRoZSBkZWJ1Z2ZzIGludGVyZmFjZT8NCg0KU28gaW5zdGVhZCByZXBs
YWNpbmcgdGhlIGRlYnVnZnMgaW50ZXJmYWNlIEkgd291bGQgcmF0aGVyIGFkZCBhIHNlY29uZCBp
bnRlcmZhY2UgdGhhdCBjb2V4aXN0cyB3aXRoDQpkZWJ1Z2ZzLiAgDQoNClVuZm9ydHVuYXRlbGx5
IHRoZXJlIGlzIG5vIGludGVyZmFjZSBhdmFpbGFibGUgZm9yIHJ1bnRpbWUgY29uZmlndXJhdGlv
biwgeWV0LiBUaGUgb25seSBhbHRlcm5hdGl2ZSANCmlzIHRvIGFjY2VzcyAiL2Rldi9tZW0iLCBi
dXQgdGhpcyBpcyB0aGUgbW9zdCBxdWVzdGlvbmFibGUgc29sdXRpb24gZnJvbSBhIHNlY3VyaXR5
IHBlcnNwZWN0aXZlLg0KVGhlcmUgc2hvdWxkIGJlIGEgd2F5IHRvIGF2b2lkIHVuc2VjdXJlICIv
ZGV2L21lbSIgaW1wbGVtZW50YXRpb25zIGJ1dCBjdXJyZW50bHkgdGhpcyBpcyB0aGUgb25seQ0K
d2F5IHRvIGFjaGlldmUgcnVudGltZSBjb25maWd1cmF0aW9uIHdpdGggcmVhc29uYWJsZSBlZmZv
cnQuIA0KSU1ITyB0aGUgY3VycmVudCBhcmNoaXRlY3R1cmUgbGVhZHMgdG8gbG90IG9mIHVuc2Vj
dXJlIGltcGxlbWVudGF0aW9ucyBvdXQgdGhlcmUuDQoNCkZvciBleGFtcGxlIHRoZSByYXNwYmVy
cnlwaSBrZXJuZWwgdHJpZXMgdG8gd29ya2Fyb3VuZCB0aGlzIGlzc3VlIGJ5IHByb3ZpZGluZyBh
ICIvZGV2L2dwaW9tZW0iDQppbnRlcmZhY2UgdGhhdCBvbmx5IHByb3ZpZGVzIG1hcHBpbmdzIHRv
IHRoZSBncGlvIHJlZ2lzdGVyIHNldChkcml2ZXJzL2NoYXIvYnJvYWRjb20vYmNtMjgzNS1ncGlv
bWVtLmMpLiANClRoaXMgcmVkdWNlcyBwb3NzaWJsZSB2dWxuZXJhYmlsaXRpZXMgYnV0IHRoZXkg
c3RpbGwgcGVyc2lzdCBzaW5jZToNCg0KLSBtbWFwKCkgY2Fubm90IG1hcCBtZW1vcnkgbGVzcyB0
aGFuIFBBR0VfU0laRSwgd2hpY2ggbWVhbnMgdGhhdCBtZW1vcnkgb3V0c2lkZSBvZiB0aGUgR1BJ
TyByZWdpc3RlcnMgaXMgYWNjZXNzYWJsZS4gDQotIGl0J3MgcG9zc2libGUgdG8gc2VsZWN0IHVu
dGVzdGVkICBwaW4gY29uZmlndXJhdGlvbnMgd2hpY2ggbWF5IG5vdCBiZSBlbGVjdHJpY2FsIGZp
bmUuDQoNCg0KSSBsaWtlIHRoZSBjdXJyZW50IGFyY2hpdGVjdHVyZSBzaW5jZSBJIGRlZmluZSBw
aW5ncm91cHMgaW4gdGhlIHBsYXRmb3JtIGRlc2NyaXB0aW9uIHdoaWNoIGhhdmUgYmVlbiB0ZXN0
ZWQgYW5kIA0KdGhlbiBzZWxlY3Qgb25lIG9mIHRoZW0gZHVyaW5nIHJ1bnRpbWUuDQpJdCdzIGp1
c3QgdGhlIGludGVyZmFjZSBpdHNlbGYgd2hpY2ggaXMgbm90IHN1ZmZpY2llbnQgZW5vdWdoIHdo
ZW4gaXQgY29tZXMgdG8gc2VjdXJpdHkuICANCg0KPiA+IFsxXSBodHRwczovL21hcmMuaW5mby8/
bD1saW51eC1ncGlvJm09MTY2ODUwNjQwOTIwMTIwDQoNCg0KY2hlZXJzLA0KQmVuZWRpa3QNCg0K
