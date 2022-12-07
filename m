Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0696645991
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 13:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiLGMCO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 07:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiLGMCN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 07:02:13 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415C66165
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 04:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXSZKBb10OopOoC7ZQc8Hda0TIJ8jZvG+gmKaQ2l8s+yk51XnUoFHgSOGz8/J8RYOu1dHNViWhVwGb045bsdIdH6TpdWKsLz+jszwS+B5axI5fk3Aj8l2MBQsZU4DDJRGKDXUGB3lrU+1DRqls+cSKlw5bSPfh+As0I+cOEQ93ggjd8xtVYNrZ2p+P85etCBrEvAVAbZFP1VF9tWqx+xQXQ6C/aoj0ft2wGx+nWbX2aoadaPeYpoUKq+aoE/A1/wWMQ2iWJjGRLz3trUQ9MceLJ+NNtVEAXfgdY4UsstIXZ9jFF6OSW/fTtTXVi6Hq3D2OOtlnQp4kfbXTnw/FAkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qwXRWCqFZ85xdBVWH7lp6lDCHdj7tuSrGzE6bkaqz4=;
 b=XVTxPP9Oassp90UFluV3VVGOpvwyzRDmaMqYKywal7X1oEBvkZkQiwSA4VQI9l5Li3Gab79A1DFhe0hqxzquDM1xBLK79BYSDpNmKB4oMDbw3oVVViIHzTG1AyJ671TV7ueKehbWVqhmiUlfLgsYLhZI3LkU8jRrbtzBU175gJl28rJhSOCMQ4Un3uaPe6IltRp41+IoDtwuU5+K3DRaDNQzIL5u7kZiaii1OqyS8xU19G9HpJSD/I3NCi7xaFn619LdmKpMyPag0+OrTwp7hESCH2kjZD2HnPeMx0eTSXmI1+bZQn/EBfoV83NZrfvMdM8snUJNk6NcQhkPcJ3+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qwXRWCqFZ85xdBVWH7lp6lDCHdj7tuSrGzE6bkaqz4=;
 b=lT6W0HxXACHbX14HR3Hzpw0sn5wVdbX1nPz4TY7HvvqVfeZqshC1t6Y4qB6wXs7t1uGYOWFJY5ScRQSeUoQX2mw/SjIEm2dA0yi1/jB5+kzCeILU5DvOB3sA23YNRXLY7PkVn/agCv81W+WuJDBNSuywzb+1+zdqIiqQSYP349ALpAhYZKxOWb1WNWt8Bwr0hqnv2OZWbppIbJ8MVNht6CUcT1MxVDCgw2XRhTbYwgLeUW+Rv6hId8xUIzagaZ1KcpDWlwgGpblZtUIqplceZkibJHzKqD8m5+U8HlpQGgy+o5O8I31kWXHVLOhfKNH+cAlaLpkVgiFIoYoawCHf3w==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM7PR10MB3175.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 12:02:08 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 12:02:08 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: Question regarding runtime pinctrl (2nd try)
Thread-Topic: Question regarding runtime pinctrl (2nd try)
Thread-Index: AQHZBM3Lq/cXs1to5Uuhi20fkVKuV65Xm34AgAeI0wCAACShAIADFOgA
Date:   Wed, 7 Dec 2022 12:02:08 +0000
Message-ID: <87e807ea2542b86c043e065cd9c80ce0a556479b.camel@siemens.com>
References: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
         <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
         <21ea48401aa3d652a379bf6aa412c660d3f4f0e5.camel@siemens.com>
         <Y43q+Be+uOzaDJAi@smile.fi.intel.com>
In-Reply-To: <Y43q+Be+uOzaDJAi@smile.fi.intel.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM7PR10MB3175:EE_
x-ms-office365-filtering-correlation-id: 9f4f76bc-75a1-4e87-5c68-08dad84addcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jkmmXQCQAsRPWZf+2ZdONTKNeABfIwGze6/Kw4+PkMvbBXgREJ/62dwLKRkgqKQQOpjbcYfjacZTal8CLl/2F9L9VSwtXNIfRRqooD9RBEeyUY6A+Qniwt+reqiPsHITG9/I6rxI1O5YvQCMKAeCzDxnOuuYWh6UN0dFxw0h27PsPeBlMgnWS8VODHiuZsNiNgFuz6NCn4mJFtqQu7pvKq15dJKMCndt8Qr5oPdB534RhcWBOzrU4OemMKTnZ02ZZhKGosbygTQUkjB/WNt9R5vI4RAMP3MOpoSTuq5r4AwgDIzv8+O37BppcNwN34cSUYXaHM1e6icscPm/wwdh1f3EfhhjoWqi4djaGmdsVk6mZxSQH8euGTuhl+tOcRPHyIdoOk7djiBfwEHy5XlDMb9Q/+rOdU9RxGaRLbtb+5IUZkYz/C0HIT+M8nuTui1+vFO/gFp40f9wd2842t7w0fa0ciJJQ/8DzvFjg0cyhEgr26y9EKxtB/4UblKzTN5WIHF+GlPpGHIBE31i5e/5DYpvLCfm1fJ0UlD0uFuH5C+u3lDlgWU4KHG+kQhmk8vghR9+RToTcqXiIeB43LkYFL+AH2xVXjtvd6JfrA162HMzHRcIjrYvavMDTZFMF9yrb/olTPwJVQ/mzcYKBqiYgXYDnR9WrXKCei6p+djKBngChTjyY1DWkdsVl7l13FZARhAg2A29GKAtI4icKDqeCon2YAVQrRpIMm74zhXfdiQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(66556008)(86362001)(66946007)(36756003)(186003)(76116006)(41300700001)(71200400001)(966005)(4326008)(122000001)(8676002)(66446008)(64756008)(66476007)(2616005)(8936002)(6486002)(6506007)(107886003)(5660300002)(6916009)(316002)(54906003)(478600001)(91956017)(6512007)(82960400001)(38100700002)(38070700005)(83380400001)(2906002)(3450700001)(4001150100001)(66899015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFDcmJMSEFqaDl6UmNJMWxubjBCVlpNSUJ6ZWI4c0dwVzdIL1luSEVFcHh4?=
 =?utf-8?B?eHNUWUJiZ1FRZ0N0ckl6Z2lpTGJ1OVozZEMyS3ZhTHl3K2J4Y240U1p1YnF2?=
 =?utf-8?B?YndmS3Eyd0lUWXhDLy91Nld1bnBQZVlubmFZN3Q3Yno5QTRpOGRaRlVodGN0?=
 =?utf-8?B?NlRSeTM5cXVCbnNPMmhTWjNrK3NkbzRHZUUvSlRIMXhxV3IrNkVDaFpMVEFt?=
 =?utf-8?B?Y2l3eGFaTXFPaFY4NlhTVUJaclA4MDJMaHdOTlZXWjRWS1dBbm5CdkZ2WENK?=
 =?utf-8?B?NHFobmZmQWZyODZDQVJRUHhUdGsyOUh2SUpyM0o2a3psbFgvRll4czkwelIz?=
 =?utf-8?B?WFBjSUNQWTJTZ1pEK0xMSTVCbWFIeHppQmJNVzFXZ0lGcXZ0a2lWWVFzTnhn?=
 =?utf-8?B?T09Sc1lYY0FtVXJ3VDZvYUgzU0pNNEhsd2RZNHIrNll1Y01uTXU1NHNDV2R6?=
 =?utf-8?B?QmhsUWU5LzJkVUVtVWRCRW1xY0RkYlF5TWRIYzFXaDNkcWhLZTJyNE9oMndO?=
 =?utf-8?B?MWhaK0RxaWY0OWVPcm51WjBrTkc3OWFneUFtMml5dUZGTkl1K09DNHJmVDB2?=
 =?utf-8?B?MFpMSkx5b0tTY1B6VzJaS3kydHVtSVUza1EyazcxMkg0MVNod1VhRnNFUXZQ?=
 =?utf-8?B?b2UzSGZEUTZuOGlPNXhleVQ3ei9ickdkQ24yRW41QVc3RFI4cFVHM1FKUk5S?=
 =?utf-8?B?empxNk5DYXNtL1R2MUtUMWZCbHlhSXBVd1VpQnNpZjdTN003ZGtWelR6Zzgv?=
 =?utf-8?B?N3R2VEIyNFBtNWNFM0oyREt3UXBnMTlPR1ZKdmtibms5SFZ5aURyUVVtVGRk?=
 =?utf-8?B?ZmNmcFdLb292REJmZVl1cUFVWUVoUmJuYm1wVEJHVkNscjZBVW0zbFJmNW9p?=
 =?utf-8?B?ZzdFZmZRQ1pCam56T2JtQ1BRYWNwdDNzdjlpeDhQQi9CUjdhcXBueXp5Q0xt?=
 =?utf-8?B?VG9aN3l5ZS9YODZOVUFjNGtJQnRmdjljTVQ2TkNPZThFdVhVTkNUaW1meWJm?=
 =?utf-8?B?NWtvNExIUTdyTWNEQzZSU1ZKM2EyTXkybmF1SU9pR1VNbFpnVzBzVG5tamRa?=
 =?utf-8?B?VTFid2c0RWhHaEl3a2VxUkhKajVacG15U1JYWXJTTnRwZkMvcUh6amZ6cXR4?=
 =?utf-8?B?L1E2QVM1MUM2KzlDbkRSdUNiYm1KOHVNcVpUdnd3QzJWQ0hTeDZIZjV3eFJL?=
 =?utf-8?B?MHRLQUdUQnExOEpwaTdvQjBXVWQ4TFJqakRUWUxsZlNTQWRrTE53c0x2bFRp?=
 =?utf-8?B?WjFNcnJ3eDBOYUhGbmZHSktvRERSam9MTUFKNU41clB3SlJ5OFF3SUNBMGFy?=
 =?utf-8?B?VFI2WmJTd3BoZDRKZWRyMk5KcWcwaUo4L1RDbklqRHBtMTBYNTQvU04reDZZ?=
 =?utf-8?B?SFVtVEV5OHNWeGI1S25NcG5oa29YU0RIWXE1dUFWMTR0MFA1c0Y1by9lakRZ?=
 =?utf-8?B?a0RJZGlEL0VyK2p5bzFhbEpLdjE4cVUzRCswUWY5RS9uS0ZFV3l4Y1JzbWQx?=
 =?utf-8?B?TURUaGxDVHNPcnU5RFZRSDBQa09oSlpLdXlOUERPalgxWXV5eSsxKzhjVUdt?=
 =?utf-8?B?V0ZHTHorYWFISC9lMEJKQmV3N25pSEl1ZTVsQVNESktGNStST2FvU052czVV?=
 =?utf-8?B?MlVuVVFaaCtXcDFsWmpUc3c2NDhySVhvV1FOOHV0VUdBMW11cTFtSkxZS1lE?=
 =?utf-8?B?R0RZdWJFdDlhdUQ3WlpOZVluOUwwMXNVanJyellNam54SW5GZE9tUXBhNzRD?=
 =?utf-8?B?NWdHWWpXaUxKeWEveXhYRC95Z3pYVnFlQkFVNk9iRFlmRm14blBLRm5sUXlC?=
 =?utf-8?B?RFV4OUh6THd5ZFpvTnhEaXlVdkZxRUtMVmREdk15YzJHMUF3YVJQTXBDL1ZB?=
 =?utf-8?B?dHNlaGZsT1E2OXZzZkdHMG84c0szc1YyTFQ0U0tUUWpsRVB6RVVEVGZadGdF?=
 =?utf-8?B?eURaTDI5dFpnaGhjMmx4azJ2YktxelRWTzM5WmhHbU1mVW51amFRRjZOZE1H?=
 =?utf-8?B?emRxM0puYzN6NUljLzJRWmRTQUloUEdCVXkrbFlmWk9XMTFqTUdhVThGcHpW?=
 =?utf-8?B?bVlyS093L1JybUg5S0pORE0vbUZMUW5MVzBpU2hRZ0tXVGNpZDFwd0VTQ3Rj?=
 =?utf-8?B?dDFhQ090TlNCWHlZRU5LcTV1Y3NITFdEN2VEQWgrdmgxY2FmMGwzYVZMOEpD?=
 =?utf-8?B?RUs1enBVZHJBUHF2alRuVXdWdFRYc0htZjAwbTRHbnJZTlVQaThQMWZSdTJH?=
 =?utf-8?Q?F1dP4OpX32IG8gI6bDFfjYcP2n45mGFtN6W3B4RRQQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B29A5B0476EA346B6DF79636672DFDB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4f76bc-75a1-4e87-5c68-08dad84addcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 12:02:08.6058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KlDN1pI9HQ75vVX4SyoFCWQv54gSzqBsxX9nyZUH6xfBqNNGNkTtKMunnDPJx26zc6XKNO4D/Xb5ardawGm1HP+x40Km+d/5x6IuUSAak7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3175
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KT24gTW9uLCAyMDIyLTEyLTA1IGF0IDE0OjU4ICswMjAwLCBhbmRyaXkuc2hl
dmNoZW5rb0BpbnRlbC5jb20gd3JvdGU6DQo+IE9uIE1vbiwgRGVjIDA1LCAyMDIyIGF0IDEwOjQ3
OjI3QU0gKzAwMDAsIE5pZWRlcm1heXIsIEJFTkVESUtUIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAy
Mi0xMS0zMCBhdCAxNzo0MyArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gT24g
V2VkLCBOb3YgMzAsIDIwMjIgYXQgMDM6MDk6NTBQTSArMDAwMCwgTmllZGVybWF5ciwgQkVORURJ
S1Qgd3JvdGU6DQo+ID4gPiA+IEhlbGxvLA0KPiA+ID4gPiANCj4gPiA+ID4gSSBnb3Qgbm8gcmVz
cG9uc2Ugc2luY2UgbGFzdCB0aW1lIHNvIEkgdHJ5IGl0IGFnYWluLCBidXQgd2l0aCBhIGJpdCBt
b3JlDQo+ID4gPiA+IGtub3dsZWRnZSB0aGlzIHRpbWUuDQo+ID4gPiA+IA0KPiA+ID4gPiBBZnRl
ciBjYXJlZnVsbHkgcmVhZGluZyB0aGUgcGluY3RybCBkb2N1bWVudGF0aW9uDQo+ID4gPiA+IChk
cml2ZXItYXBpL3Bpbi1jb250cm9sLnJzdCkgaXQgd2FzIHZlcnkgY2xlYXIgZm9yIG1lIHRoYXQg
c3VjaCBhbiBpbnRlcmZhY2UNCj4gPiA+ID4gYWxyZWFkeSBleGlzdHMgYW5kIGlzIGFjY2Vzc2Fi
bGUgdmlhIGRlYnVnZnMuIFRoZSBkb2N1bWVudGF0aW9uIGlzIHZlcnkgY2xlYXINCj4gPiA+ID4g
YW5kIHNlbGYtZXhwbGFuYXRvcnkuIFRoYW5rcyBmb3IgdGhhdCENCj4gPiA+ID4gQXQgdGhlIHRp
bWUgb2Ygd3JpdGluZyBteSBsYXN0IGVtYWlsIFsxXSBJIHRvb2sgYSBsb29rIGludG8gYW4gb2xk
ZXIgQlNQDQo+ID4gPiA+IGtlcm5lbCB3aGVyZSB0aGlzIGZlYXR1cmUgaGFzIG5vdCBiZWVuIGlt
cGxlbWVudGVkLCB5ZXQuIEkgbXVzdCBhcG9sb2dpemUgZm9yDQo+ID4gPiA+IHRoYXQuLi4NCj4g
PiA+ID4gDQo+ID4gPiA+IE5vdyBteSBsYXN0IGNvbmNlcm4gaXMgdXNpbmcgZGVidWdmcyBvbiBh
IHByb2R1Y3RpdmUgc3lzdGVtLiBJTUhPIGRlYnVnZnMgaXMNCj4gPiA+ID4gbm90IHRoZSByaWdo
dCBpbnRlcmZhY2UgdG8gaW50ZXJhY3Qgb24gYSBwcm9kdWN0aXZlIHN5c3RlbS4NCj4gPiA+IA0K
PiA+ID4gQW5kIHRoaXMgaXMgYSBwb2ludC4gTm8tb25lIHNob3VsZCB0cnkgaXQgb24gdGhlIHBy
b2R1Y3Rpb24gc3lzdGVtcy4NCj4gPiA+IA0KPiA+ID4gPiBFc3BlY2lhbGx5IHdoZW4NCj4gPiA+
ID4gd2hlbiBhIHVucHJpdmlsZWdlZCBwcm9jZXNzIHdhbnRzIHRvIGludGVyYWN0IHdpdGggYW4g
aW50ZXJmYWNlIG9mZmVyZWQgYnkNCj4gPiA+ID4gZGVidWdmcy4gSXQncyBwb3NzaWJsZSB0byBj
aGFuZ2UNCj4gPiA+ID4gcGVybWlzc2lvbnMgb24gZmlsZXMgYW5kIGZvbGRlcnMgdGhlcmUgYnV0
IG5ldmVydGhlbGVzcyBJIHRoaW5rIHRoYXQgdGhpcyBpcw0KPiA+ID4gPiBub3QgdGhlIHdheSB0
byBnbywgc2luY2UgZGVidWdmcyB3YXMgZGVzaWduZWQgdG8gb2ZmZXIgaW50ZXJmYWNlcyB0bw0K
PiA+ID4gPiBwcml2aWxlZ2VkIHByb2Nlc3NlcyBvbmx5Lg0KPiA+ID4gDQo+ID4gPiBDb3JyZWN0
Lg0KPiA+ID4gDQo+ID4gPiA+IE15IHByb3Bvc2FsIHdvdWxkIGJlIHRvIGltcGxlbWVudCBhbiBj
aGFyZGV2IGludGVyZmFjZSBmb3IgdGhhdCBhbmQgdXNpbmcNCj4gPiA+ID4gdWRldiBydWxlcyB0
byBhc3NpZ24gY29ycmVjdCBwZXJtaXNzaW9ucyB0byB0aGF0LiBXaXRoIHRoaXMgaW50ZXJmYWNl
IEkgY2FuDQo+ID4gPiA+IHRoZW4gc2VsZWN0IHRoZSBhY3RpdmUgcGluY3RybC1ncm91cHMgd2hp
Y2ggaGF2ZSBiZWVuIGRlZmluZWQgaW4gdGhlIGRldmljZQ0KPiA+ID4gPiB0cmVlIGJlZm9yZS4N
Cj4gPiA+ID4gSSBjb3VsZCBhbHNvIGltYWdpbmUgdG8gcHV0IHRoZSBpbnRlcmZhY2UgaW50byB0
aGUgc3lzZnMgKHRoYXQgd291bGQgYmUgdmVyeQ0KPiA+ID4gPiBjbG9zZSB0byB0aGUgZGVidWdm
cyBpbXBsZW1lbnRhdGlvbiBJIHRoaW5rKS4NCj4gPiA+ID4gDQo+ID4gPiA+IFdoYXQgZG8geW91
IHRoaW5rIGFib3V0IGl0PyBBbSBJIHN0aWxsIG1pc3Npbmcgc29tZXRoaW5nPw0KPiA+ID4gDQo+
ID4gPiBJbiBteSBvcGluaW9uIC0tIG5vIGdvLg0KPiA+ID4gDQo+ID4gPiBUaGUgcGxhdGZvcm0g
ZGVzY3JpcHRpb24gKEFDUEksIERULCBvciBib2FyZCBmaWxlcykgc2hvdWxkIGtub3cgd2hhdCB0
aGV5IGFyZQ0KPiA+ID4gZG9pbmcuIElmIHNvbWV0aGluZyBtaXNzaW5nIHRvIGFjaGlldmUgd2hh
dCB5b3UgbmVlZCB2aWEgZXhpc3RpbmcgaW50ZXJmYWNlcw0KPiA+ID4gd2UgcmF0aGVyIHRoaW5r
IGFib3V0IHRoYXQsIGJ1dCBubywgdGhlIGRlYnVnZnMgc3RheXMgYW5kIG9ubHkgZm9yIHRoZSBw
dXJwb3Nlcw0KPiA+ID4gb2YgZGV2ZWxvcG1lbnQgb24gdGhlICJJIGtub3cgd2hhdCBJJ20gZG9p
bmciIGJhc2lzLg0KPiA+ID4gDQo+ID4gT2suIElmIEkgZ290IHlvdSByaWdodCwgeW91IG1lYW50
IHRoYXQgdGhlcmUgaXMgbm8gd2F5IHRvIHJlcGxhY2UgdGhlIGRlYnVnZnMgaW50ZXJmYWNlPw0K
PiA+IA0KPiA+IFNvIGluc3RlYWQgcmVwbGFjaW5nIHRoZSBkZWJ1Z2ZzIGludGVyZmFjZSBJIHdv
dWxkIHJhdGhlciBhZGQgYSBzZWNvbmQgaW50ZXJmYWNlIHRoYXQgY29leGlzdHMgd2l0aA0KPiA+
IGRlYnVnZnMuDQo+IA0KPiBJIG1lYW50IHRoYXQgdGhpcyBmZWF0dXJlIHF1aXRlIGxpa2VseSB3
aWxsIHN0YXkgaW4gdGhlIGRlYnVnZnMgcmVhbG0uIE5vIG5ldw0KPiBpbnRlcmZhY2UgaXMgbmVl
ZGVkIGZvciBzdXJlLg0KPiANCj4gPiBVbmZvcnR1bmF0ZWxseSB0aGVyZSBpcyBubyBpbnRlcmZh
Y2UgYXZhaWxhYmxlIGZvciBydW50aW1lIGNvbmZpZ3VyYXRpb24sIHlldC4NCj4gDQo+IFRoZXJl
IGlzIG5vIGV4cGxhbmF0aW9uIHdoeSB5b3UgbmVlZCB0aGF0Lg0KPiBUaGlzIGlzIHRoZSBtYWlu
IHBvaW50IG9mIHRoaXMgZGlzY3Vzc2lvbiwgcmlnaHQ/DQo+IA0KPiA+IFRoZSBvbmx5IGFsdGVy
bmF0aXZlIA0KPiA+IGlzIHRvIGFjY2VzcyAiL2Rldi9tZW0iLCBidXQgdGhpcyBpcyB0aGUgbW9z
dCBxdWVzdGlvbmFibGUgc29sdXRpb24gZnJvbSBhIHNlY3VyaXR5IHBlcnNwZWN0aXZlLg0KPiAN
Cj4gSXQncyBub3QgYW4gYWx0ZXJuYXRpdmUgYXQgYWxsLCBpdCdzIHNpbXBsZSBubyBnbyB2YXJp
YW50Lg0KPiANCj4gPiBUaGVyZSBzaG91bGQgYmUgYSB3YXkgdG8gYXZvaWQgdW5zZWN1cmUgIi9k
ZXYvbWVtIiBpbXBsZW1lbnRhdGlvbnMgYnV0IGN1cnJlbnRseSB0aGlzIGlzIHRoZSBvbmx5DQo+
ID4gd2F5IHRvIGFjaGlldmUgcnVudGltZSBjb25maWd1cmF0aW9uIHdpdGggcmVhc29uYWJsZSBl
ZmZvcnQuIA0KPiA+IElNSE8gdGhlIGN1cnJlbnQgYXJjaGl0ZWN0dXJlIGxlYWRzIHRvIGxvdCBv
ZiB1bnNlY3VyZSBpbXBsZW1lbnRhdGlvbnMgb3V0IHRoZXJlLg0KPiA+IA0KPiA+IEZvciBleGFt
cGxlIHRoZSByYXNwYmVycnlwaSBrZXJuZWwgdHJpZXMgdG8gd29ya2Fyb3VuZCB0aGlzIGlzc3Vl
IGJ5IHByb3ZpZGluZyBhICIvZGV2L2dwaW9tZW0iDQo+IA0KPiBUaGlzIGlzIGV2ZW4gd29yc2Ug
dGhhbiBtb3JlIHN0YW5kYXJkIC9kZXYvbWVtIGludGVyZmFjZS4NCj4gDQo+ID4gaW50ZXJmYWNl
IHRoYXQgb25seSBwcm92aWRlcyBtYXBwaW5ncyB0byB0aGUgZ3BpbyByZWdpc3RlciBzZXQoZHJp
dmVycy9jaGFyL2Jyb2FkY29tL2JjbTI4MzUtZ3Bpb21lbS5jKS4gDQo+ID4gVGhpcyByZWR1Y2Vz
IHBvc3NpYmxlIHZ1bG5lcmFiaWxpdGllcyBidXQgdGhleSBzdGlsbCBwZXJzaXN0IHNpbmNlOg0K
PiA+IA0KPiA+IC0gbW1hcCgpIGNhbm5vdCBtYXAgbWVtb3J5IGxlc3MgdGhhbiBQQUdFX1NJWkUs
IHdoaWNoIG1lYW5zIHRoYXQgbWVtb3J5IG91dHNpZGUgb2YgdGhlIEdQSU8gcmVnaXN0ZXJzIGlz
IGFjY2Vzc2FibGUuIA0KPiA+IC0gaXQncyBwb3NzaWJsZSB0byBzZWxlY3QgdW50ZXN0ZWQgIHBp
biBjb25maWd1cmF0aW9ucyB3aGljaCBtYXkgbm90IGJlIGVsZWN0cmljYWwgZmluZS4NCj4gPiAN
Cj4gPiBJIGxpa2UgdGhlIGN1cnJlbnQgYXJjaGl0ZWN0dXJlIHNpbmNlIEkgZGVmaW5lIHBpbmdy
b3VwcyBpbiB0aGUgcGxhdGZvcm0gZGVzY3JpcHRpb24gd2hpY2ggaGF2ZSBiZWVuIHRlc3RlZCBh
bmQgDQo+ID4gdGhlbiBzZWxlY3Qgb25lIG9mIHRoZW0gZHVyaW5nIHJ1bnRpbWUuDQo+ID4gSXQn
cyBqdXN0IHRoZSBpbnRlcmZhY2UgaXRzZWxmIHdoaWNoIGlzIG5vdCBzdWZmaWNpZW50IGVub3Vn
aCB3aGVuIGl0IGNvbWVzIHRvIHNlY3VyaXR5LiAgDQo+IA0KPiBTdGlsbCBubyBjbHVlLCB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGFjaGlldmUgYW5kIHdoeS4gVXNlIGNhc2UsIHBsZWFzZT8NCkl0
IGFscmVhZHkgbWVudGlvbmVkIHRoZSB1c2UgY2FzZSBoZXJlIFsxXS4gQnV0IGxldCBtZSBleHBs
YWluIGl0IGFnYWluIGFuZCBpbiBzbGlnaHRseSBvdGhlciB3b3Jkcy4NCg0KV2UgYXJlIGN1cnJl
bnRseSB3b3JraW5nIG9uIHBsYXRmb3JtcyB0aGF0IGNhbiBiZSBleHRlbmRlZCB3aXRoIGRpZmZl
cmVudCB0eXBlcyBvZiBJTy1TaGllbGRzLiBUaGUgcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMgY3Vy
cmVudGx5IGRvbmUNCmJ5IGEgdXNlcnNwYWNlIGFwcGxpY2F0aW9uIHRoYXQgb2ZmZXJzIGEgbmN1
cnNlcy1saWtlIEdVSSBpbnRlcmZhY2UuIFRoZXJlIHlvdSBjYW4gc2VsZWN0IHRoZSBwaW5tdXgg
Y29uZmlndXJhdGlvbiBmb3IgZWFjaCBwaW4gcmVnYXJkaW5nDQpvbiB0aGUgSU8tU2hpZWxkIHlv
dSBhcmUgdXNpbmcuDQoNCkkgYWxyZWFkeSBtZW50aW9uZWQgaG93IHBpbm11eGluZyB3b3JrcyB3
aXRoIHRoaXMgZnJhbWV3b3JrIGFuZCB3ZSBoYXZlIHRoZSBzYW1lIG9waW5pb24gYWJvdXQgdXNp
bmcgL2Rldi9tZW0gbGlrZSB5b3UuDQpXZWxsLCBub3cgd2UncmUgYXJlIGxvb2tpbmcgZm9yIG90
aGVyIHNvbHV0aW9ucy4NCg0KRm9yIGV4YW1wbGUgdXNpbmcgZGV2aWNlIHRyZWUgb3ZlcmxheXMg
KHdyaXR0ZW4gc3RhdGljYWxseSBvciBnZW5lcmF0ZWQpIGZvciBlYWNoIGRpZmZlcmVudCBraW5k
IG9mIHNoaWVsZCB3b3VsZCBiZSB0ZWNobmljYWxseSBmaW5lLCBidXQgZG9lc24ndCBzY2FsZSB2
ZXJ5DQp3ZWxsIHdpdGggaW5jcmVhc2luZyBudW1iZXIgb2Ygc2hpZWxkcyBhbmQgaG9zdCBwbGF0
Zm9ybXMuIEFuZCBpZiB0aGUgaG9zdCBwbGF0Zm9ybSBpcyBub24gQVJNIGJhc2VkIHRoaXMgYXBw
cm9hY2ggbWF5IG5vdCB3b3JrLiBGdXJ0aGVybW9yZSB3ZSBuZWVkDQp0byBkZWFsIGFsc28gd2l0
aCBBQ1BJIHN0dWZmIG9uIHg4Ni4gDQoNClJlY29tcGlsaW5nIHRoZSBkZXZpY2UtdHJlZS9rZXJu
ZWwgZm9yIGVhY2ggc2hpZWxkIGFuZCBob3N0IHBsYXRmb3JtIGlzIHBvc3NpYmxlLCBidXQgZnJv
bSBhIHVzZXJzcGFjZSBkZXZlbG9wZXIgcG9pbnQgb2YgdmlldyB0aGlzIG1lYW5zIGVmZm9yZCBh
bmQgbWF5DQpyZXF1aXJlIG1vcmUga25vd2xlZGdlIGFib3V0IHRoZSBoYXJkd2FyZSAob3IgeW91
IG5lZWQgdG8gcmVxdWVzdCBmb3IgZmVhdHVyZXMgZnJvbSB5b3VyIEJTUCBwcm92aWRlcikuIA0K
DQpJIGFsc28gdGhpbmsgYWJvdXQgdGhlIHF1ZXN0aW9uLCB3aHkgYXJlIHRoZXJlIGZyYW1ld29y
a3Mgb3V0IHRoZXJlIHRoYXQgdHJ5IHRvIHNvbHZlIHRoYXQgcGFydCBvZiB0aGUgcHJvYmxlbSAo
d2lyaW5nLXBpLCBlY2xpcHNlLW1yYWEsIGV0Yy4pLiANCkkgdGhpbmsgdGhlc2UgZnJhbWV3b3Jr
cyB0cnkgdG8gYWRkcmVzcywgYW1vbmcgb3RoZXIgdGhpbmdzLCB0aG9zZSBpc3N1ZXMuIA0KU28g
aXQncyBub3Qgb25seSBhYm91dCBvdXIgc3BlY2lhbCB1c2UgY2FzZS4gSU1ITyB0aGVyZSBhcmUg
bWFueSB1c2UgY2FzZXMgd2hlcmUgdGhpcyB3b3VsZCBtYWtlIHNlbnNlLCBvdGhlcndpc2UgdGhl
c2UgZnJhbWV3b3JrcyB3b3VsZCBoYXZlIG5ldmVyIGNvbWUNCmludG8gYmVpbmcuICANCg0KDQpJ
IGhvcGUgdGhpcyBjbGFyaWZpZXMgbXkgcG9pbnQgb2YgdmlldyBhIGJpdCBiZXR0ZXIuDQoNCg0K
WzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWdwaW8mbT0xNjY4NTA2NDA5MjAxMjANCg0K
DQo+IA0KPiA+ID4gPiBbMV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtZ3BpbyZtPTE2Njg1
MDY0MDkyMDEyMA0KDQpjaGVlcnMsDQpCZW5lZGlrdA0KDQo=
