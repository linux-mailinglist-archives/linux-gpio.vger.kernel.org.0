Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671856B0644
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 12:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjCHLpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 06:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCHLpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 06:45:09 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF76B5FD9;
        Wed,  8 Mar 2023 03:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV67Toj1A0meJDlN29u0EOWy74W0PRSszF6JRD5PFODLgoBGgXOge8/tiinoYVMm0L3Iv5Fl3Fcc20W9ih3fubkh/88l/RVVlU49OdpV96+eeKevj8fkeBy4bEUA6Z58wWWI/5zvtaQFFEKlu8aXyuA4m+OA3lzzgMapcxxgHRJw2MgXVhKU3IXc0Y1KeoM3splBiGmFOtar0OqWt83d0K7TUI1NXv0sw5xaegzRlCLC0LVTJ2CYBn5Z1PdB/BynmoaXK0G9Wy5X+Z8jloeiyegKhsVl7qSmlhCRGerZxg3Ht1/vRbsfM9jUMf0r2QWUSgwSyK2WiS+mhAbxjjXVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYyXUetB3DLqpV7uk1qP4LXtj7Ok48F0sAw2liqu3+U=;
 b=b15JV1b2jozINyDhqAgkFlhwxOMUCYDD8PAm0/7Z+MwhFwA6vitHAkQFVgmgiZLdPd6pptUTk7o/kd9kIXuT7lio4Z3Xj4FRBVi2w/NVF4BjB0XHtQlYXlfnugCM59LLkB7ME152vqhNhxtmnfZTXxWuvrgpg/i+7sHaJ4PlV4145g2OysoChur58ZrZY49Q9Dco06/aK2/umVvAGe9QTWzJ5vIQm9q1qsGX6/wBQ/OBPBC7SNA2Xb9zDPZBJG0UZh8mtaCGOFS6/kYXKwXlYWKVURemXPgKROPDHidYaEYKMY7e13Nf+it8n3NWdj+6/ARED1WCQkjUhjdmNCAlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYyXUetB3DLqpV7uk1qP4LXtj7Ok48F0sAw2liqu3+U=;
 b=GKymhK85qCJtNaJWEZ+FONFtBE+voL7nE/TDTzmgOErI0dJrk/HM0cmDYkCY5YalZJjUDHk1ivjUEroBHHi7jl8JbtIQVs0EL9eGAw/y5MMv01+MhKdi6IBrG+262AOuxUcvEGgWf4NKTTJDk/jd1IziFKR+hxnxA9ltHLGuDAO1AlEpnRIySWl2ICUcfsTwztcdYi/vH8e1mhpq2qIDIZjw8uHAR9KIWYjSvG1mptpHfZi4wzQXolg93LrdEY8GAb1v6GH0RqPDqy7uzFIdI1yks5gdCQpgRH3fOeAdNrTG7KUpzFxYTZSBNQWWJ3NpAc3wf6Dctf6/dzSQvyO+5w==
Received: from DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) by
 SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Wed, 8 Mar 2023 11:45:04 +0000
Received: from DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::8dc2:d06f:b372:1eb]) by DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::8dc2:d06f:b372:1eb%2]) with mapi id 15.20.6156.031; Wed, 8 Mar 2023
 11:45:04 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Jonathan Hunter <jonathanh@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: RE: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Thread-Topic: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Thread-Index: AQHZOutAO6xTuS8Nf06b/i0bqtYYHq7DnR4AgAFM5ACAAAlJAIAr+Q2Q
Date:   Wed, 8 Mar 2023 11:45:04 +0000
Message-ID: <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org> <Y+OGdMFQkL9Dtaq/@orome>
 <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
In-Reply-To: <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2406:EE_|SA0PR12MB4366:EE_
x-ms-office365-filtering-correlation-id: 307cf02c-b29a-4762-1716-08db1fca8edc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 74s/gqJdGjNSCUT4MjHoZxWoTNXE9h1+WOKwUWAtYEWXRtOKrJLAPxgYD9UyyEXb4vLcqKIa8RuQiG7en0R0xaWeivGt+o7O2Zn8sdRutc4SygdEHOye17CO3c1pVDtCGpV606NqjT5sJGgfkI3kJ5nzYHiI5h4MqQ1JGPbcywNWPsemFvRpNb3yV4xoz6u0Wo5Qv9J5RXGlJvvZp/qiIoDfujNrE3BsmsjBbMy7cqT3ZGwXrjYO/xUktpsfqqAokeXvefcJ7EOjN+aJ9h4inu7HUY0hJ6S7gqlb8RqUR1CEsg1IcKcF0vh4l3h5bY808p4xtG6+E9XuKo9R0qLvT+iZibGyeKxwRrGzaHCrh3FUhb44mYWjRrfMqqrNpe4l/3ZTJy43a5WWL4snVHCg4sIQJ2R29V+9aHainzrf/Z4USFBbfW+Pv51rEQgodMJ0W0SKIR1ZYv8fi261Ly2aQ+zBxpyUu14oT0aaP94ES2bXTNxTWK25wLS/W2foSdPrktC0Sqm/WjyWXrwblW/IMnwvC1Xl+zLjUyZv5zk0iwPu7lYfVXFPpMjrQ6OmoCGBBKllavpTBBbwzqMA7T87C5yWK4S9hE1eciA9KpArObSqlLWNlT0b/EC3km6OD2yKJS2JvrUUeFSWDlOqhvq9dXI+zIst2kPU6oHoNEVGLGrNMBMGtyHj2Nk/27O5BXHZLRoMzrvrU8U2jvV3Q7xctw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2406.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(186003)(478600001)(9686003)(26005)(83380400001)(107886003)(38070700005)(33656002)(53546011)(6506007)(86362001)(2906002)(55016003)(7696005)(71200400001)(38100700002)(316002)(5660300002)(66946007)(41300700001)(4326008)(66476007)(66446008)(8676002)(76116006)(66556008)(64756008)(122000001)(52536014)(66899018)(8936002)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STV4K0NDblZNR2tNVGtCVHBCTU9tekNPelRQT2NlQklCcU4zNEpNN1pLU2tD?=
 =?utf-8?B?YzlxVDdTSzc4VUNMbW5mMnZsc0xPU3V6L0RBb2V4OXlMTEpmbUYyL3N0cDZF?=
 =?utf-8?B?UFJ4K1hSaXlYOE10WmpGR25LdkFQcXJGb1hPdjRhRmFWdmNmNW9sM0NPVTV5?=
 =?utf-8?B?ZHRXcFlhbG8rTXNnYTdBRVNpV2JjMkxqa2VpR3JJRkdhQWJtbmlDQWYrRkRj?=
 =?utf-8?B?NXlDeXl6WVJCLzFQekZzcVY2cUtlcFJEK0JkOTlMM1VNNkx5Q242QVRzVlNo?=
 =?utf-8?B?N2FGczljQThxUmFSaHRNYi95Nnd5RWhPbWxkOWloeTNzSlI3NDNVSkFhaG1o?=
 =?utf-8?B?cys3SUNzZVdxbTExdXFLcUhOcTQ3ZG0xbGE1dmlKSjg2NHVTL0JBZXZxdkhZ?=
 =?utf-8?B?L2I2VEk5RjByblgwRzRZWEwzOUJxT1VSeFh1cm9wUGx6bVhnS1JQVFdOOXJW?=
 =?utf-8?B?aHBoMlVzM1hybzZFMUp1Y3pXSDZzN0w1SER4MDc0dVRWZ0tabXdLWTJqL0NW?=
 =?utf-8?B?eHFFc1Y1U0M1clpiZEpJQmlxdVRXZVBEd0RzcHM4ZW9MUnBvcmUzY3c1R0hZ?=
 =?utf-8?B?MXJDNkVHSHByU25HM21mK0pSeVhSZXZPenFnVGRSSjZ6bTNLUE12VGxpOE4x?=
 =?utf-8?B?SW9GMXYydi9LbEJyMzBzdjU1MzhHb0JnYTU2bWlMZDUyWWFIMC8vSXV4SG00?=
 =?utf-8?B?VVgzNEdZcEFNa2xFR0RONiswMzZKRi9JblJITncyNk5Yb2p6YlpoL1YzZXhT?=
 =?utf-8?B?SVN5NmFtQ1Z0c2h3Q3U1YVRVOUNNNWJqT2ZPdTY0L0d1UGlZdkdvUmwyUEhD?=
 =?utf-8?B?clZWSDUremxxTTlkMTc0bkZUNXRWc2UyTDlOVVFnSll4d3FFNmtmeW9Kb05j?=
 =?utf-8?B?NzdaSGZ0RUJBK1I1UTJXQmQyekowUnVMZ1NkbFVHZjJIUWNZb0hCOHlOOXkr?=
 =?utf-8?B?OGNWM1RZTmY2cm9wV2NoY1p4bDBrc3NvZVByNlpaT3VpOC9SUUxXWDJrS1do?=
 =?utf-8?B?c09QZHBZYUxML3duaStXaXY3THZObzE3a254cWhLR1NtTnE3aTh5SXR5OXdu?=
 =?utf-8?B?TUVRQ2tYZUhFaUdKV2U4ZTA5dTNyVy9DY25RaEFBY3RUS255TS9XU3BZZUww?=
 =?utf-8?B?Z0NUQzQzam9FRmRUN3Jhbk5KRWtUS1JyOTQvNnNJMWpMVlZEYzcyWCtBVUF1?=
 =?utf-8?B?VUI2VTd6L0lqcW1DRFNTY0N2ZWRTcjJLWmRURUFJN1N2MVcvQVoxNDYvRVZn?=
 =?utf-8?B?UnFvTkNrZ0taUXBpUE5GSlZFeXNtZlUwOVJ1eVlLcC9Gc0tkT3dUcC9oNUlO?=
 =?utf-8?B?S05lSHNLZXNvaGNMYkw0UTAxL3hjZDQyWkRXdUdSOUhVWTFOUEdIc2lhU0Nl?=
 =?utf-8?B?czZob21aeWs2K0UwTkQyQUY2VHB5L04zZDRnR2FSaXBTOTVRQjhqdkUzTlJy?=
 =?utf-8?B?STY2Z2xXTkc0Y012bW8yOGo4NFQ2S00yWjZJejdTbTNwS0RLUHBmdHcxdGZI?=
 =?utf-8?B?R2NsbWRCb0FHSFdJVjVjWkdTTHl3RVUxUkJGdHNicnd3MFhXN3p1RVN4R1By?=
 =?utf-8?B?cVlOeExHUFJuL1p2TUltQ0hRZEpUQ1JOckZEWmRQUXJCakhjQmJpai82emJj?=
 =?utf-8?B?UUt1NnNtcWM5VXg0cVBLTWV5dHMvRUNqL3ZxcTBUS0s0VnB5MjZyNm9kRlYy?=
 =?utf-8?B?eWdnNitHdVRrZXA2ZU1UcERjck1lT3lHV3Q1SDBzUUxCUlNISHdCSVp2cEZh?=
 =?utf-8?B?Ky9yQ2tvVU5mcVl2bXhlRysrbGxCSmNmQVhLa21SU0ZYUmdtS29OS250cXAv?=
 =?utf-8?B?RUZnZnQxTnowZGFsQWcyV21tTlk3bzFHNVlEOGJTc1ZuNVVmWm16RnV0dTND?=
 =?utf-8?B?WFI3bklrQytXOEJMbG9FZWkvMENyNGM4TkN0M2FOZXpMeTE4S0h2M3ZmemEr?=
 =?utf-8?B?SitzQU1pamVDR0QxTFl2UHpndVdJOTJ6ZDAyRWdBM29mbXNNbWMyN1h4NUFI?=
 =?utf-8?B?NTRhR09LK1dacUFzZUozcms1WFc1QTY1cHhHc3ViT21GY0xQbS8vVHFDLzg2?=
 =?utf-8?B?UEp6ZllRVk4rcEtBN3JRdXYxYWU5QmQyOFhXcUZVekFVZ1doUUd6QitsUzQ3?=
 =?utf-8?Q?rp6U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2406.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307cf02c-b29a-4762-1716-08db1fca8edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 11:45:04.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EiU0hLPqcSr8yOxwhihEHHSjFVWHvUDcL1M2xWQJTqIqBF3m6RkJy/DjRf9h5ESkRcUvJFOdgJGXFjPg/Sp1Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXks
IEZlYnJ1YXJ5IDgsIDIwMjMgNToyOCBQTQ0KPiBUbzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4NCj4gQ2M6IFByYXRoYW1lc2ggU2hldGUgPHBzaGV0ZUBudmlkaWEu
Y29tPjsgSm9uYXRoYW4gSHVudGVyDQo+IDxqb25hdGhhbmhAbnZpZGlhLmNvbT47IGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93
c2tpK2R0QGxpbmFyby5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
dGVncmFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgU3VyZXNo
IE1hbmdpcHVkaQ0KPiA8c21hbmdpcHVkaUBudmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvM10gZHQtYmluZGluZ3M6IHBpbmN0cmw6IHRlZ3JhMjM0OiBBZGQgRFQgYmluZGluZyBk
b2MNCj4gDQo+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0
dGFjaG1lbnRzDQo+IA0KPiANCj4gT24gMDgvMDIvMjAyMyAxMjoyNCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6DQo+ID4gT24gVHVlLCBGZWIgMDcsIDIwMjMgYXQgMDQ6MzM6MDhQTSArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQo+IA0KPiA+Pj4gKyAgICAgICAgICB0eXBlOiBv
YmplY3QNCj4gPj4+ICsgICAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6DQo+ID4+PiArICAg
ICAgICAgICAgcHJvcGVydGllczoNCj4gPj4+ICsgICAgICAgICAgICAgIG52aWRpYSxwaW5zOg0K
PiA+Pj4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogQW4gYXJyYXkgb2Ygc3RyaW5ncy4g
RWFjaCBzdHJpbmcgY29udGFpbnMgdGhlIG5hbWUNCj4gPj4+ICsgICAgICAgICAgICAgICAgICBv
ZiBhIHBpbiBvciBncm91cC4gVmFsaWQgdmFsdWVzIGZvciB0aGVzZSBuYW1lcyBhcmUgbGlzdGVk
DQo+ID4+PiArICAgICAgICAgICAgICAgICAgYmVsb3cuDQo+ID4+DQo+ID4+IERlZmluZSBwcm9w
ZXJ0aWVzIGluIHRvcCBsZXZlbCwgd2hpY2ggcG9pbnRzIHRvIHRoZSBjb21wbGV4aXR5IG9mDQo+
ID4+IHlvdXIgaWYtZWxzZSwgdGh1cyBwcm9iYWJseSB0aGlzIHNob3VsZCBiZSBzcGxpdCBpbnRv
IHR3byBiaW5kaW5ncy4NCj4gPj4gRHVubm8sIHlvdXIgb3RoZXIgYmluZGluZ3MgcmVwZWF0IHRo
aXMgcGF0dGVybiA6KA0KPiA+DQo+ID4gVGhlIHByb3BlcnR5IGl0c2VsZiBpcyBhbHJlYWR5IGRl
ZmluZWQgaW4gdGhlIGNvbW1vbiBzY2hlbWEgZm91bmQgaW4NCj4gPiBudmlkaWEsdGVncmEtcGlu
bXV4LWNvbW1vbi55YW1sIGFuZCB3ZSdyZSBvdmVycmlkaW5nIHRoaXMgaGVyZSBmb3INCj4gPiBl
YWNoIGluc3RhbmNlIHNpbmNlIGVhY2ggaGFzIGl0cyBvd24gc2V0IG9mIHBpbnMuDQo+ID4NCj4g
PiBUaGlzIHdhcyBhIGNvbXByb21pc2UgdG8gYXZvaWQgdG9vIG1hbnkgYmluZGluZ3MuIE9yaWdp
bmFsbHkgSQ0KPiA+IGF0dGVtcHRlZCB0byByb2xsIGFsbCBUZWdyYSBwaW5jdHJsIGJpbmRpbmdz
IGludG8gYSBzaW5nbGUgZHQtc2NoZW1hLA0KPiA+IGJ1dCB0aGF0IHR1cm5lZCBvdXQgdHJ1bHkg
aG9ycmlibGUgPSkgU3BsaXR0aW5nIHRoaXMgaW50byBwZXItU29DDQo+ID4gYmluZGluZ3MgaXMg
YWxyZWFkeSBjYXVzaW5nIGEgbG90IG9mIGR1cGxpY2F0aW9uIGluIHRoZXNlIGZpbGVzLA0KPiAN
Cj4gV2hhdCB3b3VsZCBiZSBkdXBsaWNhdGVkPyBBbG1vc3QgZXZlZXJ5dGhpbmcgc2hvdWxkIGJl
IGNvbWluZyBmcm9tDQo+IHNoYXJlZCBiaW5kaW5nLCBzbyB5b3Ugd2lsbCBoYXZlIG9ubHkgY29t
cGF0aWJsZSwNCj4gcGF0dGVyblByb3BlcnRpZXMocGlubXV4KSBhbmQgbnZpZGlhLHBpbnMuIEFu
ZCBhbiBleGFtcGxlLiBNYXliZSBJIG1pc3MNCj4gc29tZXRoaW5nIGJ1dCBJIHdvdWxkIHNheSB0
aGlzIHdvdWxkIGNyZWF0ZSBtYW55IGJ1dCB2ZXJ5IGVhc3kgdG8gcmVhZA0KPiBiaW5kaW5ncywg
cmVmZXJlbmNpbmcgY29tbW9uIHBpZWNlcy4NCj4gDQo+ID4gdGhvdWdoIHNwbGl0dGluZw0KPiA+
IG9mZiB0aGUgY29tbW9uIGJpdHMgaW50byBudmlkaSx0ZWdyYS1waW5tdXgtY29tbW9uLnlhbWwg
aGVscHMgYSBiaXQNCj4gPiB3aXRoIHRoYXQgYWxyZWFkeS4gU3BsaXR0aW5nIHRoaXMgaW50byBw
ZXItaW5zdGFuY2UgYmluZGluZ3Mgd291bGQNCj4gPiBlZmZlY3RpdmVseSBkdXBsaWNhdGUgZXZl
cnl0aGluZyBidXQgdGhlIHBpbiBhcnJheSBoZXJlLCBzbyB3ZSBraW5kIG9mDQo+ID4gc2V0dGxl
ZCBvbiB0aGlzIGNvbXByb21pc2UgZm9yIFRlZ3JhMTk0Lg0KPiANCj4gT0ssIGJ1dCBhcmUgeW91
IHN1cmUgaXQgaXMgbm93IHJlYWRhYmxlPyBZb3UgaGF2ZSBpZjp0aGVuOiB3aXRoDQo+IHBhdHRl
cm5Qcm9wZXJ0aWVzOiB3aXRoIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB3aXRoIHByb3BlcnRpZXM6
IHdpdGgNCj4gbnZpZGlhLHBpbnMuDQpUaGlzIGlzIGlubGluZSB3aXRoIHRoZSBleGlzdGluZyBi
aW5kaW5ncyBhbmQgSSB0aGluayB0aGlzIGlzIHRoZSBjb21wcm9taXNlIHRoYXQgd2FzIHJlYWNo
ZWQgZHVyaW5nIHJldmlldyB3aGVuIHRoZSBiaW5kaW5ncyB3ZXJlIHN1Ym1pdHRlZCwNCm9mZmVy
IHRvIHJld29yayBpZiBhIGJldHRlciBhbHRlcm5hdGl2ZSBjYW4gYmUgZm91bmQsIGJ1dCB0aGF0
IG9ubHkgbWFrZXMgc2Vuc2UgaWYgYWxsIHRoZSBvdGhlciBiaW5kaW5ncyBnZXQgY2hhbmdlZCBh
cyB3ZWxsLCBzbyBJIHRoaW5rIGl0J2QgYmUgZ29vZCBpZiB3ZSBjYW4gbWVyZ2UgaW4gdGhlIHNh
bWUgZm9ybWF0IGFzIHRoZSBleGlzdGluZyBiaW5kaW5ncyBmb3Igbm93IGFuZCBjaGFuZ2UgYWxs
IG9mIHRoZW0gbGF0ZXIgb24uDQpTZW50IGEgdmVyc2lvbiB2MiBhZGRyZXNzaW5nIGFsbCBvdGhl
ciBjb21tZW50cy4NClRoYW5rcw0KUHJhdGhhbWVzaA0KPiANCj4gPg0KPiA+IFdlJ3JlIHRha2lu
ZyBhIGJpdCBvZiBhIHNob3J0Y3V0IGhlcmUgYWxyZWFkeSwgc2luY2UgdGVjaG5pY2FsbHkgbm90
DQo+ID4gYWxsIHBpbnMgc3VwcG9ydCBhbGwgdGhlIGZ1bmN0aW9ucyBsaXN0ZWQgYWJvdmUuIE9u
IHRoZSBvdGhlciBoYW5kLA0KPiA+IGZ1bGx5IGFjY3VyYXRlbHkgZGVzY3JpYmluZyBwZXItcGlu
IGZ1bmN0aW9ucyB3b3VsZCBtYWtlIHRoaXMgYSB0b3RhbA0KPiA+IG1lc3MsIHNvIGFnYWluLCB3
ZSB1c2UgdGhpcyBzaW1wbGlmaWVkIHJlcHJlc2VudGF0aW9uIGFzIGEgY29tcHJvbWlzZS4NCj4g
DQo+IFRoYXQncyBva2F5LCBtYW55IHBsYXRmb3JtcyBkbyB0aGUgc2FtZSB3YXkuDQo+IA0KPiAo
Li4uKQ0KPiANCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgIHBleF9yc3RfYzVfb3V0X3N0YXRlOiBw
aW5tdXgtcGV4LXJzdC1jNS1vdXQgew0KPiA+Pj4gKyAgICAgICAgICAgIHBleF9yc3Qgew0KPiA+
Pg0KPiA+PiBVbmRlcnNjb3JlcyBhcmUgbm90IHZhbGlkIGluIG5vZGUgbmFtZXMuDQo+ID4NCj4g
PiBXZSBoYXZlIHN1cHBvcnRlZCB1bmRlcnNjb3JlIGluIG9sZGVyIGJpbmRpbmdzIGZvciBoaXN0
b3JpY2FsIHJlYXNvbnMuDQo+ID4gQnV0IEkgc3VwcG9zZSBmb3IgdGhlc2UgbmV3ZXIgYmluZGlu
Z3Mgd2UgY291bGQgZGlzYWxsb3cgdGhlbS4NCj4gPg0KPiA+IFNvbWUgb2YgdGhlIG9sZGVyIERU
cyBoYXZlIGEgbGFyZ2UgbnVtYmVyIG9mIHVuZGVyc2NvcmVzLCBzbyBJJ20gbm90DQo+ID4gc3Vy
ZSBpdCBtYWtlcyBzZW5zZSB0byBnbyBiYWNrIGFuZCBmaXggdGhvc2UuIE1heWJlIHNvbWV0aGlu
ZyB0byBrZWVwDQo+ID4gaW4gbWluZCBmb3Igd2hlbiB3ZSdyZSBkb25lIHdpdGggYWxsIHRoZSBj
b252ZXJzaW9ucy4uLg0KPiANCj4gSSB1bmRlcnN0YW5kLCB1cCB0byB5b3UuIEkgdGhpbmsgdGhh
dCBpZiBzdWNoIG9sZGVyIHBsYXRmb3JtIGlzIHN0aWxsDQo+IHN1cHBvcnRlZC9tYWludGFpbmVk
L3VzZWQsIHRoZW4gc3VjaCBjbGVhbnVwcyBhcmUgcG9zaXRpdmUuIFVuZGVyc2NvcmVzDQo+IGFy
ZSByZXBvcnRlZCBieSBkdGMgYXQgVz0yLCBzbyBpdCBpcyBub3QgdGhhdCBjcml0aWNhbC4gQnV0
IG1hbnkgb3RoZXIgbml0cyBsaWtlDQo+IGdlbmVyaWMgbm9kZSBuYW1lcyBhcmUgYmVpbmcgZW5m
b3JjZWQgYnkgZHRzY2hlbWEsIHRodXMgaWYgeW91IHdhbnQgdG8NCj4gYWNoaWV2ZSAwLXdhcm5p
bmcgc3RhdGUsIGF0IHNvbWUgcG9pbnQgeW91IHdpbGwgbmVlZCB0byBhZGRyZXNzIHRoZXNlLiBP
Zg0KPiBjb3Vyc2UgZGlmZmVyZW50IHF1ZXN0aW9uIGlzIG9uIHdoYXQgdGFza3MgeW91IHdhbnQg
dG8gc3BlbmQgeW91ciB0aW1lLiA6KQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0K
