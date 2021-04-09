Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F045A359AEF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 12:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbhDIKHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 06:07:03 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:44679 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbhDIJ76 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 05:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617962385; x=1649498385;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XFFDlaW/yYSV4DGGMtvLpfxUx0tlc4u/Ju/fDulB3oQ=;
  b=C4CVlPX7B9Hn6m+mZMTHukRwV8qzmb9o+iGMYdDu3+/hqdBD3/BGC3vd
   y0Rc4uG3d+a5E+qrysnbH3fc8wZ/V/wh6JSImrnKRLGFI4OFLnyWNztL/
   SXk6WPoen013uip02N4dV7FpeQBljuGKfg9vsNGmGzYBK8Q69JAuurZZZ
   uhRGKYVfvf/pEbz74gHfibo+YS4fEF9X01AFoV3O+WFnISFNUJueKLip8
   2cJW//i1UJmYOZ8Dng7soVXTMswHJgEQQxPbSN5T0XiExNO0bLRgWVWzy
   VGkg+y9T2+i7AgQSquPArmQ9oLHp6D70lqZc0+NEZSAQc+KRc0ZXuTM0J
   Q==;
IronPort-SDR: UbtVZfJ1hDunTbUS+yA9MsnfQzlZ1NCY9/4Uadrn1v/ToZKooAwgQCz/ykMvl6ZnKqHXhNYOHR
 BdvDyMABJroUNP8h+wTtShXFg8ElAVvGjcXQ2Z4k3ouMI/jo6pB3u22v5uXF8StiaQp9QYhTK0
 pl/sW7Ku1ENgLV6dBkl0p5KJ+cnxP4CTV4pBcgV5rQGMI7bi5kY2hyZ4oAedqvqFvyPZ1YmbWs
 CsismlpFUatvRE/ZXyhcqKzzUxkWsS5xmeZtx4ADnINVMaIxrNzpxGXimnWB1JINjIXV3Q4pnN
 YAw=
X-IronPort-AV: E=Sophos;i="5.82,209,1613458800"; 
   d="scan'208";a="116421539"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Apr 2021 02:59:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 9 Apr 2021 02:59:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 9 Apr 2021 02:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4RMOTU3bnR+g6NB2nsb+2xP2lxvpEmG9OJJYGohVlkUeyKxAHlHLb+QSFsLgxIwaGRhVKJHXKtiyJK6/5OHFPtI1ckZdYmsyqJkHliEw/oxAQko1Au0/uLFDKcvPtZuY0vDBvNTT/3a3SbUzSv/w9iM5an7pSQK5tS316hMI6tEM1GzHsOwiKszsOUt3dzn9RYb3/vWs+kliof+VulzdlGJlFfMGCkRzWcKGmYQhe7RiHH6hdKTW1mP1RMs+7QuFvQBAau0H56TSzgeyboCUc0mmpzdnNVpYwVXY5uXHSvlnkgoDTPncWeoJqpchYRtFA4GnbArxYynUymN7a0EbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFFDlaW/yYSV4DGGMtvLpfxUx0tlc4u/Ju/fDulB3oQ=;
 b=Tehf7olRGsekMf5JiZ/VLg0N6MfZdML/Yl0qvZpRvNH615WFpGh6B88LKP4h9+OWx1XBlswPDjA7VqxSVD6L0/ivQBF8uv+XFXZTdrAdltk1gRvV1dq3O3HcmivuxIWKVKTtLpXyPJO8z3BOWGNRgAa1ix701UwlzgXk6f1SjgvT5HC/Q5LlmJQIV9mi3voxbzw6MeVeZ+DUKATod1+c3rRvB+GyfwsI5jbuEB6IxRWG1ZpxRwSB6ybHrV+JUtHgceWslVexBP0KsqUZ3P8uC9pP1VBuNyBs5h/QW78kAl/ZDdZXr3bSYWyw30iiBbvpP+XOL32DWQLrUeFlLzViQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFFDlaW/yYSV4DGGMtvLpfxUx0tlc4u/Ju/fDulB3oQ=;
 b=KJCjzdWbMS1pkSYjeQtwCr2QA94thWReWiKM6lqkb284Rqa1gPcQ0m1u10cBUT/MYIOw09KnjW4a2NRxCGtFytX8P90rk3634XXgCOdPsyuCmvy/kTPRubJK/LkTnKXVl0jvZFkUivmqvBZhNc8zi4h4aJfkVHDR3T1n0FVAxSY=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR11MB1692.namprd11.prod.outlook.com (2603:10b6:3:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Fri, 9 Apr 2021 09:59:43 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::d405:a5f2:bb71:38d7]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::d405:a5f2:bb71:38d7%2]) with mapi id 15.20.3999.035; Fri, 9 Apr 2021
 09:59:43 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <Tudor.Ambarus@microchip.com>, <Ludovic.Desroches@microchip.com>,
        <linus.walleij@linaro.org>
CC:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
Thread-Topic: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
Thread-Index: AQHXLScP50uevSvackKO5w0NtAUzGg==
Date:   Fri, 9 Apr 2021 09:59:42 +0000
Message-ID: <b85dae59-d3fa-33fe-9b38-b441169d0765@microchip.com>
References: <20210409082522.625168-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210409082522.625168-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [82.76.227.232]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7abb50b8-ac28-46b8-0c47-08d8fb3e32bb
x-ms-traffictypediagnostic: DM5PR11MB1692:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB169299A3DFD5FB1E59A7E80A87739@DM5PR11MB1692.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npuY0zoHYGEL/QUpy1KfpxeOtxyhjrTJkq+ld0Z+W1CkOU96viDtgJCtHKiSzin0cTnH0FAe0rzrqAAEdCP/U1A3gW2+Z0OEp+rDwSqRBH1AAsXzmHIU3BpOA0eZ4opN+Cr0DcC9cyIPUnI67R5PeB+k/J5QBRNWoD/IERQsjxCBp2F7f8IWCghxApMr3SnsR6fKrvEK6kF/MXRSJK7HfW0DRlsaSqt5E87xdJm01uNz1euw9vHsQvmR7QxcVRafJ700KzX754eetfjVOgvNsSCGmwu/CMIqvE2WjI/AtotDGUnQ5PMuxbwVGKhEonyh4utet8VI/dg3ZpWGDsO1CjBYgfSE9DflFXuZVfvEsIdvBKTtAcelBLr0iNxdH0lb2rIZVzIzKFrvsMQExsGtXAZFlnUEgCsyqAbKT24SVR1sibSiYShwl57+x9gYzNUvM48PsSn4aKuABlnxpCgI04Z3K2pVdVM4fscJk+LGvYzBGA8fq30+l+ASdzmaVG//lJef04vOfzUNy3zpm12M1202Qexw36Evwz2zVXW222SjkrjornsbC/2Vcy+une4D9QMVuOXgXixemNiIj4ct4rbOrtNYrFA2r8cZQhuw11juwO+3yP63mJsJc4A072VcHciiPZsTRj7Fq6JsZEolc0xV3YF26zjSGC4UjNpbMNkce+aM1qksTU+ERhlDYX4YSox9QBT5ikCFQ5o0oRqFjcVSQH5Ft+DNXLmyYt2HW8I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(366004)(396003)(136003)(76116006)(31696002)(2616005)(316002)(66946007)(91956017)(66476007)(54906003)(66446008)(66556008)(2906002)(6512007)(478600001)(8676002)(8936002)(64756008)(31686004)(86362001)(6506007)(53546011)(6486002)(83380400001)(71200400001)(186003)(38100700001)(5660300002)(110136005)(4326008)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eG9xOWZzRU56SjVZU3pUeHlSOEh0NmRDR1h2Z0VuMU5ZZmFMNForMnF0dVBW?=
 =?utf-8?B?TEh0cHZ4ZEkzN2RXSzM5emhSeFAvYUZpK2RIb3prU3Z3eDNkSCsxMlZxWWYy?=
 =?utf-8?B?c0h0QU9ZTDllYlZneVhtV00yQlZTVWZ2S2xFRWkvblJhQ3BaYlBVNEtGQ3NZ?=
 =?utf-8?B?bjR6Y2lGbE5KdUp2ZlB6bi9STTJaa2xSek5zQUVEblU3Z2U0MnpuNHBDTi9D?=
 =?utf-8?B?d0dxNmRaTU9mcTZKWmM2eXdrV0NOWFBWSk5aazZSSnpIN1NsOXIzbVAyU2FK?=
 =?utf-8?B?TmZXRWllbG1vVEdQMVh1MkdncDZVV2VQL0tMbkdJcXAyM05tTnZoMHVuV1Z1?=
 =?utf-8?B?Y3RLdGFCeXFxZzg3OExLdzUyWFdtd0JKOUxJZnMrS1o2N3dwbGZsdW0xODV6?=
 =?utf-8?B?MHI1ZG0rcTRMUElJVkd6cXBWaEJtR2tTWGo2TzBacHdYR3g0Z3owRXpjcEp2?=
 =?utf-8?B?bUthSTVvWlB1Z2RQRXUxSHBUNm45d0psRUczM2FETTdDdis3MTcrUEM4V0ZY?=
 =?utf-8?B?T3BLQ3ByTmdsLzlGSGpFRkVUVjFyQ1NiQVM1NVRJelFYQW9RV28zbzFBeEh2?=
 =?utf-8?B?T01DSFRDeTFMSU0wdTFnWW12Y3l2S24wNTQ4NXY2SjUvUzAwSktROHJVbm5P?=
 =?utf-8?B?R1IxV0tZaU50Y1BBV0VqUDhFVHpObEJVcDNyQXhuS1E5R3JYNTlaS0xKWmxy?=
 =?utf-8?B?S1diUDQzU0czSENuM1JPdkpyL0RFYmZ3Tnl6M0g3QlF5NEdpa0N4OG5LelZX?=
 =?utf-8?B?bk0xbG91cHlhaFViZUtKWlpyWGF5TDE1UllVVWUwL0I1TVpBV1lSYkxFY0cv?=
 =?utf-8?B?ZlVIVFp2eDhzamtXaTFWVERZQ1ZRWEhuSW1QMVVCRVRFNTBQZEVvNmV3c093?=
 =?utf-8?B?YWc3ei9HOTBwNExNUjd2VTdUR0hFNGZoT0gvMzJtUXlESnhqV2cyMldyL2FW?=
 =?utf-8?B?eVhHS0h3S0RRbGExTjNpeUE3RmtCand5cEhLQkViaU10VWNmL0p1OFlBTHFn?=
 =?utf-8?B?MDRvOVl0RjdFU0o3U0ZhR2lSK3JtQkVEOXN5SFlHMjFYRWRxbjFjNHNHeUtX?=
 =?utf-8?B?NTJzOG1PUytWQi8vNEdKc2lNaTlmNThGVjlpNEg0NmlhV3ZTVGlLdXp0TG4w?=
 =?utf-8?B?MkxBRVE1c05adytaRkpZT3U5eVFLcUxyN1JrcEkxZm9xQldVcjdXZTlrMVpm?=
 =?utf-8?B?Y1FjcGVOL29SSWpmRlRITTNkQ3V5OFlJOS9RRmJ6aCtDdHduVmU4TXVIUFpz?=
 =?utf-8?B?U1BRcmd5RWQvSWVGeHVPRDZHejU5WXRUVndHUkEyS1E2SXcwZHV6ZEdnUWxY?=
 =?utf-8?B?M2RJc1l0c0hCeHhsdFJUMmk2N2hESXdRaGZDQ3A5ZzNOY1R5MU1QRWZBQTRm?=
 =?utf-8?B?bGlVb3NLbVBmYkpQTitrM0hTb0paamVrSnpOWSsrR0VHMFVVaUtXbDlZQ3BP?=
 =?utf-8?B?TjJhUFJ5ZGt2ZGlydUtOdkJOay9lcmxhQmQ4aUN6aW5vNVdEYU1ORzRYeFpY?=
 =?utf-8?B?YWYrZ082QjlwajVUTDNLVGIvcDBpNmIvUW5sVWtnZllmTlVXVnMrc2Rwc0tJ?=
 =?utf-8?B?VkJtY2p2OFNjalVPMkZHRkRmS1FXWlk1WDJiWWlFLzNaa3JwMUN5bjRBdFdH?=
 =?utf-8?B?RCt4b1Axd3NISms0NHd1ZVdNYzQ2cHRrclRlR2hMaDRZaE9EOVZjQ3pOdmRC?=
 =?utf-8?B?ei80eXp6TzFFYXdNZFpacXJTdVVBRkRZUmNSWmRFSEtmQ2ZYVDF3OGRjV21T?=
 =?utf-8?Q?Fd3WklUTonAeru2EzQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF8718A25D6A1B4FB0FF00B13F85793C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb50b8-ac28-46b8-0c47-08d8fb3e32bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 09:59:42.9529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rrbjgover1R1XezFJnOevdT/K5Gl7+QJKIu1YOZ0NZGTl3eEUzfIjF7BPCDtbn1P/hVWElyl5AbDGEKkIj4c1tTrWdWZhfP9AIhMZEtbKW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1692
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gMDkuMDQuMjAyMSAxMToyNSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToNCj4gVGhlIHNsZXcgcmF0
ZSB3YXMgZW5hYmxlZCBieSBkZWZhdWx0IGZvciBlYWNoIGNvbmZpZ3VyYXRpb24gb2YgdGhlDQo+
IHBpbi4gSW4gY2FzZSB0aGUgcGluIGhhZCBtb3JlIHRoYW4gb25lIGNvbmZpZ3VyYXRpb24sIGV2
ZW4gaWYNCj4gd2Ugc2V0IHRoZSBzbGV3IHJhdGUgYXMgZGlzYWJsZWQgaW4gdGhlIGRldmljZSB0
cmVlLCB0aGUgbmV4dCBwaW4NCj4gY29uZmlndXJhdGlvbiB3b3VsZCBzZXQgYWdhaW4gdGhlIHNs
ZXcgcmF0ZSBlbmFibGVkIGJ5IGRlZmF1bHQsDQo+IG92ZXJ3cml0aW5nIHRoZSBzbGV3IHJhdGUg
ZGlzYWJsZW1lbnQuDQo+IEluc3RlYWQgb2YgZW5hYmxpbmcgdGhlIHNsZXcgcmF0ZSBieSBkZWZh
dWx0IGZvciBlYWNoIHBpbiBjb25maWd1cmF0aW9uLA0KPiBlbmFibGUgdGhlIHNsZXcgcmF0ZSBi
eSBkZWZhdWx0IGp1c3Qgb25jZSBwZXIgcGluLCByZWdhcmRsZXNzIG9mIHRoZQ0KPiBudW1iZXIg
b2YgY29uZmlndXJhdGlvbnMuIFRoaXMgd2F5IHRoZSBzbGV3IHJhdGUgZGlzYWJsZW1lbnQgd2ls
bCBhbHNvDQo+IHdvcmsgZm9yIGNhc2VzIHdoZXJlIHBpbnMgaGF2ZSBtdWx0aXBsZSBjb25maWd1
cmF0aW9ucy4NCj4gDQo+IEZpeGVzOiA0NDBiMTQ0OTc4YmEgKCJwaW5jdHJsOiBhdDkxLXBpbzQ6
IGFkZCBzdXBwb3J0IGZvciBzbGV3LXJhdGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1
IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9waW5jdHJsL3BpbmN0cmwtYXQ5MS1waW80LmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEtcGlvNC5jIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtYXQ5MS1waW80LmMNCj4gaW5kZXggYTVkMzI4ODA4ZTRjLi40YzAxZDg0NzFmZmEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEtcGlvNC5jDQo+ICsr
KyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEtcGlvNC5jDQo+IEBAIC04MDEsNiArODAx
LDEwIEBAIHN0YXRpYyBpbnQgYXRtZWxfY29uZl9waW5fY29uZmlnX2dyb3VwX3NldChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYsDQo+ICANCj4gIAljb25mID0gYXRtZWxfcGluX2NvbmZpZ19y
ZWFkKHBjdGxkZXYsIHBpbl9pZCk7DQo+ICANCj4gKwkvKiBLZWVwIHNsZXcgcmF0ZSBlbmFibGVk
IGJ5IGRlZmF1bHQuICovDQo+ICsJaWYgKGF0bWVsX3Bpb2N0cmwtPnNsZXdfcmF0ZV9zdXBwb3J0
KQ0KPiArCQljb25mIHw9IEFUTUVMX1BJT19TUl9NQVNLOw0KPiArDQo+ICAJZm9yIChpID0gMDsg
aSA8IG51bV9jb25maWdzOyBpKyspIHsNCj4gIAkJdW5zaWduZWQgaW50IHBhcmFtID0gcGluY29u
Zl90b19jb25maWdfcGFyYW0oY29uZmlnc1tpXSk7DQo+ICAJCXVuc2lnbmVkIGludCBhcmcgPSBw
aW5jb25mX3RvX2NvbmZpZ19hcmd1bWVudChjb25maWdzW2ldKTsNCj4gQEAgLTgwOCwxMCArODEy
LDYgQEAgc3RhdGljIGludCBhdG1lbF9jb25mX3Bpbl9jb25maWdfZ3JvdXBfc2V0KHN0cnVjdCBw
aW5jdHJsX2RldiAqcGN0bGRldiwNCj4gIAkJZGV2X2RiZyhwY3RsZGV2LT5kZXYsICIlczogcGlu
PSV1LCBjb25maWc9MHglbHhcbiIsDQo+ICAJCQlfX2Z1bmNfXywgcGluX2lkLCBjb25maWdzW2ld
KTsNCj4gIA0KPiAtCQkvKiBLZWVwIHNsZXcgcmF0ZSBlbmFibGVkIGJ5IGRlZmF1bHQuICovDQo+
IC0JCWlmIChhdG1lbF9waW9jdHJsLT5zbGV3X3JhdGVfc3VwcG9ydCkNCj4gLQkJCWNvbmYgfD0g
QVRNRUxfUElPX1NSX01BU0s7DQo+IC0NCj4gIAkJc3dpdGNoIChwYXJhbSkgew0KPiAgCQljYXNl
IFBJTl9DT05GSUdfQklBU19ESVNBQkxFOg0KPiAgCQkJY29uZiAmPSAofkFUTUVMX1BJT19QVUVO
X01BU0spOw0KPiANCg0K
