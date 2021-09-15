Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A7F40CD52
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 21:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhIOTlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Sep 2021 15:41:11 -0400
Received: from mail-bn8nam08on2085.outbound.protection.outlook.com ([40.107.100.85]:23574
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230451AbhIOTlL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Sep 2021 15:41:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQNdbo7De2sVvXGb//hCY8tN8UVe7+gjofArgkS0+VsWG39o7jtvYLOisP7/uC26elW4DO5/62IVszlvspK64QFKtVlulDoAQkIY9+yq9UqyyuJJSrmhFzXi51t0P7P+uBTrWgGM+5axAdoC17ZvjMuQVvmCkm4TCbmPx24bd8oAwFo3+f4NhaWLm50qlT+pIXYTe8uhkLitMmgawpzz0jS0O0BJn4fEBCbJ+fgx/bmkWU6kgPqnkdlyQ4wLoNXw3SlpCffYVr6yFw4DPeWHIOzgwQ8JIXMkYniumoiFP8wbndrKes81XWhQERfEgGaVTuSX1T1+H95R1vMqIMpJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=I/qzLRs20TAHLPBOHZrXCmmDyMyUq1abqIz1tH/oNT8=;
 b=KGaJ0sJZDMfxLMjMQ4lJL+A3Hm786aD+tXAeSMPPnUK18wgnrF9xltPkImj3H+ZxXA9ADqALs7CUu/oI4S40W/VzCD6Wbe1t1gngx66Pmjw7LrJAyTGRQbzwx3dO8bctxXeTwMScXkNvZOlxr4igghTmRYWfqSOFXsUHcrRXyJddz+WG4tRvdsREpaLCZDCA5HUwnxPZQYd5Gm3knmsnZnfg2yBQc2FrLDfqd6pVSYrKpdVGHmFlIrkKSfocpeW6niJ48IhNxFkomVSwG790A94bMzy9+nKLItXNtKiPCSjTkZjyKfnXPb16JFVwec4qTbGWzLeiXmvBi60GoCBkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/qzLRs20TAHLPBOHZrXCmmDyMyUq1abqIz1tH/oNT8=;
 b=yfL9Ja7u1qVBR2phqJ2czPS//LcTB/gb2D8BK01yqA8dkjH0rvLWliFOuAoBORKJTPpyh++zbrFgEbpWejoZS5ZR1rgRZlkGs6Ls08mbn8+ZH+OiK2p+sQrDQVpI674KOEznipTCv/hBWsg4teRajxLPmnwZqu2qp1oukb4ERsg=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 19:39:50 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 19:39:50 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/2] Add irq PM wakeup
Thread-Topic: [PATCH 0/2] Add irq PM wakeup
Thread-Index: AQHXpBb+++ZKkCe0JE+I4GACxOg6fauligVA
Date:   Wed, 15 Sep 2021 19:39:50 +0000
Message-ID: <SA0PR12MB4510586AE3CBCDFDADE93417E2DB9@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
 <65cb2134-c209-6381-fccd-43f252af6f9f@amd.com>
 <9c3a0ce4-efbc-e5b7-c51c-317b89ca8d52@amd.com>
In-Reply-To: <9c3a0ce4-efbc-e5b7-c51c-317b89ca8d52@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-09-15T19:39:48Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b5f9b8d4-34a4-4bed-acc7-12b74110001b;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88a4da1b-63d7-4c7a-143b-08d97880954d
x-ms-traffictypediagnostic: SN6PR12MB2782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB27822384B71D0D0DFF5E59A9E2DB9@SN6PR12MB2782.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f2XbDIxDuCCnjVBCIEiyce7fDUreM/C7kp3JtG0aHUwhs6ahX/WKq51hBOjKfWvi7Bjpq6SxXDgfKJIy32XJG17CIxI6m8MPlh9lFHcRT3Vx/5lZ6yOzVGmoh4HfuF1L7rJahufqI1s4DW+2thWWUrHcnRI3R7b/MSW841MX6JkGsHTCXdkhMPo3cWL5gUTLW14PE41BBT8TPuiKSFGe/jfbvVljjQmVPAcLeiD8T0eaFpPMk4wFSIFHR9OcoLiAJhlGC6uKXgxRt3i9Zb9q4Orc9FZcG+fitFbsUUDJNTUrvcXKR9Q3gzd7uEJUZEB6nSZNg4egbny9yoeJes5DVmTT8efRms7cvDgs6Xi3beahZto1aIEH9gCDwvhBywrsy83Cn2bJBOW2PmpKZXsWSCHY2escFxcLyKtw8pyfcGaSJbRMlAsBbbRkDZdHD2o5Yy8abHDtZt9Lv2znVFJpm2wvilC6nyaHChHiEuV0Q02AS8OdbP2U3enkrdclhhQo9FPfOUi5SfIV9cKVi2l7h8TWIGKMGmiAHycbHqRT7DYtNMSKzq2ebdWdDbZK5NU5dP+ApHA75YMK/KUqkgG4W+9gsi/9DT3WCD3jTsddkczX4eW6GvdG1lJcEUj3mRwhxHpog3hE04GOO2sB0zYDVQ2Z9bxHQqtL2cV9KT+v1WqRFzQRhhuoDTwaGRqx94MmYfYzjQRdv/pWSd1c4G3Wzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(66446008)(9686003)(4326008)(53546011)(4744005)(33656002)(186003)(55016002)(2906002)(8936002)(71200400001)(66946007)(478600001)(64756008)(66556008)(38070700005)(86362001)(110136005)(38100700002)(52536014)(83380400001)(8676002)(66476007)(6506007)(54906003)(7696005)(316002)(5660300002)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjJ2dFM4T0pOOXNJVUV0WUsxa25SWmhtcUt0cmFYT1d1VVZZVXBLVmg3OUVV?=
 =?utf-8?B?N0piUTdMd2RwWU9MdFhERVN6RTd3WEcvejNpL1NZYXhPaDhzMzJtMURKTnB6?=
 =?utf-8?B?cDloZ3pBZUNISVJ5cFlreVR3OHl6czJ3b29ZaEZJWFNDUWsxMXZVTGxUL2pD?=
 =?utf-8?B?a0tCc2ZzbHhYQjZBUlVTL3hCTm5rUmRMUzVhYk1iMWlHZ2lRR0lJRTBTWlNL?=
 =?utf-8?B?ZEJZNDB0ZkdQMlFldHVUNFZ5Wi9MajBKU2FzdGJzN2hPUk0wWWN0bTZLeEIz?=
 =?utf-8?B?aCszUEhvQXpKU2JsZ050bWRQWGFtWXhwZERsOWdXRmNyRndYMVJ6OFhjNnFz?=
 =?utf-8?B?NzlHRkZkeVNxUGY0OE4vSjhybTQrQmZRWlh2VkZvbmk4MllIYUg2c3JtNnhr?=
 =?utf-8?B?TUNzZHM5UmlzVjlNa0ZXMUxrYUtBUkxFVm5MMExKT0ErU0QvOTR1RFFFbmNm?=
 =?utf-8?B?M2xuZm5qUXBuYmpZNEMzTGZQYXZHWnpqNkNWNXYvVFJYZURFcFNSaWZ3QTdW?=
 =?utf-8?B?bjdhTDYwYUNPTWI1a2NrM0JscVVvekVQT29acVk4aDF5ZllsTWlLQ29VZGpv?=
 =?utf-8?B?Ri9MMnFkTG52bnlIaFRGOWk4ZEM1N083dmM2dWF1cjFlZU13VEFqb1c5TnFG?=
 =?utf-8?B?dnhxM3FScm5RWlVmN0YrZ21FT01hYmZBNmhNQjRxWjRRa25PQXVrQzVXV1N2?=
 =?utf-8?B?WXRsV2lJTlpMVE1VTG9HaWJtMWJtUUtaZFN4YVJqS3dPbUwrRGVwRnpWRWto?=
 =?utf-8?B?UFVpaW02bDJaMnZBaHNVZ2JxelJIN3N6cW5LSEZ0Vm1VN2hPY1NFQ2JGWTBE?=
 =?utf-8?B?TlJpY1p6aFRuSk5lakVYb3hkaG1kNmNuWE0wbkNXa0gyRU50ZStIWnFMek40?=
 =?utf-8?B?VmcxQlJnSHVsd3RpVE4wVGpQRk1NWTFFVDBWeHJyS0hHNmFjUHByRHNodVZs?=
 =?utf-8?B?RnkyMVhMbEhHV3ZBaGw0VUNndFNTQllTcEYvVnpzRkswdW5sNDk5UjJMUUhZ?=
 =?utf-8?B?ZGNLTDF3VTZzRklHb1ViQmExMVd0R2wvNS8yTDYzaGFjZmVoQVJ1bkVvdnZh?=
 =?utf-8?B?Q0p4OVBIRTBSQnd0OVVteVl1N2ZCMjNqNlFIRUhaS2VJK1JQQ1dwSENFVkl3?=
 =?utf-8?B?ZkhiVWNtd1pwY3RPRDZSRTRNd2pvTGR3K2NGNmdaOHlVcWU3aTIxRnlyTmZq?=
 =?utf-8?B?QlRjZWZ6UER4aVFGK2FJbHFZd0x6dFJreFVvdVgzZ3hvUlZZVXBoWmp3NEFw?=
 =?utf-8?B?T1dPUURIVmlMRlVPbmc4Z3hyUlJkeDNFb1FHVXNzS21qNXBCbzl3bjg1Ykgr?=
 =?utf-8?B?Vk1CVGJ6QWtSQUdaRW5vVWp5NjIydTh1Q0QrWnZHc0dsRWVZbDFIUnBzMjJI?=
 =?utf-8?B?cTlkVU8rMmFBa2E3YlJmN091TlBwYnptOWRuRzdBYThYenc4bW00dk5uU2d4?=
 =?utf-8?B?UndJa0dpbEV6cGVlNWtmNjh0a012T1gzQXlLMjVLQkl3SjloTHpkejF3SzRO?=
 =?utf-8?B?VXpBM05IODdHUDRrTk9YV1daUGhJenJiZDd0b2lhVXA1RS93Qlh6NUZrZnRS?=
 =?utf-8?B?VzFEeEN2K1lUc1JHM0NvTk95WXlDdzYzOE01WndONkJQTjRMcUNCM1o3K2Ra?=
 =?utf-8?B?YkxRd2ZyaFRYK2hNSElwNFVtTHVBS2d4WXgxRkMrcE85cTJDVi9ycFFjQlFY?=
 =?utf-8?B?ZlZDV0JjcENuM28wVzlwWHlQdjY2bFdtdTdtTTQyZ2k5YjBxdjJZdzQzZXBD?=
 =?utf-8?B?WGZMSlhIN1lPaU5yemFYUFFNOXQwdUxyR29uUStXcytwcW9YUzNydEtLeEJR?=
 =?utf-8?B?ckw4OHBnTnF1bHdDM1NhUHVuV1dkcm51eVRoc3BvRWhXMEsyOGk0V0llVnFQ?=
 =?utf-8?Q?H89e/zHuvhZJn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a4da1b-63d7-4c7a-143b-08d97880954d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 19:39:50.3936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySG6lqiI2qM9ax9rUwlHdNCbrW6vpCh4yKIki5i4OTXcwDIUHmPSmWNYUNqcMcyxOXoppc80aLBNIhfYbk6Xkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW1vbmNp
ZWxsbywgTWFyaW8NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDcsIDIwMjEgMTM6MzUNCj4g
VG86IFMtaywgU2h5YW0tc3VuZGFyIDxTaHlhbS1zdW5kYXIuUy1rQGFtZC5jb20+OyBOYXRpa2Fy
LCBCYXNhdmFyYWoNCj4gPEJhc2F2YXJhai5OYXRpa2FyQGFtZC5jb20+OyBsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc7IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDAvMl0gQWRkIGlycSBQTSB3YWtldXANCj4gDQo+IE9uIDkvNy8yMDIxIDAyOjQy
LCBTaHlhbSBTdW5kYXIgUyBLIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA4LzMxLzIwMjEgNToz
NiBQTSwgQmFzYXZhcmFqIE5hdGlrYXIgd3JvdGU6DQo+ID4+IENoYW5nZXMgaW5jbHVkZSB0byBo
YW5kbGUgSVJRIHdha2V1cCBtb2RlIHdha2UgdGhlIHN5c3RlbSBmcm9tIHNsZWVwDQo+ID4+IHN0
YXRlcyBsaWtlICJzdXNwZW5kIHRvIFJBTSIuDQo+ID4+DQo+ID4+IEJhc2F2YXJhaiBOYXRpa2Fy
ICgyKToNCj4gPj4gICAgcGluY3RybDogYW1kOiBBZGQgaXJxIGZpZWxkIGRhdGENCj4gPj4gICAg
cGluY3RybDogYW1kOiBIYW5kbGUgd2FrZS11cCBpbnRlcnJ1cHQNCj4gPj4NCj4gPj4gICBkcml2
ZXJzL3BpbmN0cmwvcGluY3RybC1hbWQuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0NCj4gPj4g
ICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hbWQuaCB8ICAxICsNCj4gPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4NCj4gPiBT
ZXJpZXMgTG9va3MgZ29vZCB0byBtZS4NCj4gPg0KPiA+IEFja2VkLWJ5OiBTaHlhbSBTdW5kYXIg
UyBLIDxTaHlhbS1zdW5kYXIuUy1rQGFtZC5jb20+DQo+ID4NCj4gDQo+IEkndmUgY29uZmlybWVk
IHRoaXMgaGVscHMgd2FrZS11cHMgb24gc29tZSBwcm9ibGVtYXRpYyBzeXN0ZW1zIGFzIHdlbGwN
Cj4gbXlzZWxmLg0KPiANCj4gVGVzdGVkLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGlt
b25jaWVsbG9AYW1kLmNvbT4NCg0KTGludXMgV2FsbGVpaiwgQmFydG9zeiwNCg0KUGluZyBvbiB0
aGlzIG9uZT8gDQoNClRoYW5rcywNCg==
