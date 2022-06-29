Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F383560122
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 15:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbiF2NTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 09:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiF2NTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 09:19:14 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35DD205C9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 06:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftkv7CslJ+3F1VRkZZASKKNsuGwFmhfTwG5U9aDtJPhppNQVNUuKv871iKaA7ioaKB1iI5QVaVa/WymSRWKhTK1KysdNPiMW9GcftNHduKVv9OWXdxKEY730WHZTdfX3m+996tVdEWzIQ985hORfxSwwzbtEulvXb6y8kES17MTyBeg6JsB3PoeOEwWoimVPD2rQ6Uc25cbZwuprJXRLFSFT2dGTw+t9purX2mfDfTbT1O7qFoQ4pEtH5ypHUUyT4ghGy3guqCR6aEuR6/pwvJ5NcvuvLUWK2LsjhLriIz8xJhDAMlvNnvigzVJXik+WXcy65AIsOo+tPQQL9gtLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxpZYF6t29otSohKSsU+6ipN6Jdhwjg8cfghZVKWa2w=;
 b=kaBzVtEqmPCY21YUsJcZr4TDsR6dF4ASaW2HqRpBrMkKmyuwAT6BGfe2VmZ+5oTKNhBxQl+xZ2Nd59IxuPDVARwYwAvEOKcFPGZew9wvSvtgmcuhj3sCvEosdimuvsmXb4V1cQt/tcyRDyuVe3zQEsbR7N5WkADukE9yySIfjOYABwdAlshVFDnaW3qQD55HXzm5rVmzW/2lKp0l4tjmXLWcV7ksLmF1UuCHgtm1nGlTVlPeSWmCcCxHH7NLaQ+OAlGe3J80KAByWkcwoO4c4shX6mjnHC9khNXl8adQQRn6domoTAw0o/bmTJw7RCtQu2iJ/EfMQ/fjObtUM9bqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxpZYF6t29otSohKSsU+6ipN6Jdhwjg8cfghZVKWa2w=;
 b=bjV++YKYv4nbPQ3XuXm0f3j2HtPgd6dyVIMK3tCz3RC6IM0goV6OeblQ+tYwNysa2eHVeUS4l0WuDwip/JYk8GbdAwYZMPX2bCAluLasgYrxOkmLr5z8j0VmNuxQs/0JxMu7R6v0D2zxuvuOKsCR7bRTjp7yAOsSxOAiropFtxk=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by DM6PR12MB2841.namprd12.prod.outlook.com (2603:10b6:5:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 13:19:09 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6%7]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 13:19:07 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Simek, Michal" <michal.simek@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Sungbo Eo <mans0n@gorani.run>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "git (AMD-Xilinx)" <git@amd.com>, git <git@xilinx.com>
Subject: RE: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
Thread-Topic: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
Thread-Index: AQHYivwuNdT0jlAETkONDD0nQHCSJa1lMGYAgAACQQCAAF6UgIAAaGmAgAAylgCAAAZFAIAALJKQ
Date:   Wed, 29 Jun 2022 13:19:07 +0000
Message-ID: <BY5PR12MB49028FF6BE7C65B9564555E381BB9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
 <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
 <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run>
 <f2d1d6e6-abaf-8f3b-0102-49bb93888ede@amd.com>
 <CAHp75Ve_mgam2jcyFG-NggziUScK3JBZ4fmtN+rjd+Vra=ixuw@mail.gmail.com>
 <02badfe5-395d-b63b-cf18-e2b3aad93625@amd.com>
In-Reply-To: <02badfe5-395d-b63b-cf18-e2b3aad93625@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-29T13:17:30Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=8cf80a8f-cffd-4113-aa28-803e781b669a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 100c3729-0bbf-4023-89d9-08da59d1f244
x-ms-traffictypediagnostic: DM6PR12MB2841:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BmXbIxaygyq2k/4CWfjiVAR3p0t05HKbunek4wZxhe0uvWIcKdIodcWVsBtjGY49MyWPIS+JALBzHul3TDZ8aTwpj91tFWb5Ie5+yxro3kUS7Hayh9V726Etyd0hMODBaNJ3gK44dXvCJE8Ybs/x2A3k/g1o3aeqKIn0By1t6vB/qjRt+0LJAW2xWjuyjdy0x+BYcY7L/8GsLYDDH5Rz6wNYqL4uozqssjg19fELhUr5zzV4KpDxRKDBDPV+JsO+K4R7zIc1TePEifWCx+phxr5B9vfTC81he1wjVkdL9MnuXwWuK88Ajc27A3DOJVeNrF9hUgADItEGqH7fYooFlLWjJI4t/Tt3wjwh2FawuUyJo1B6qM65GDCJogOIID0idzLxLqBmy70mVn9dFx0eAZRI8ZTxqSaIWS5NYCBYN/06320jDRnxVBGpBV0R/krxmmzrdmfrUEnxB5UV/sxrFJPTsBIlkHKBu6s5M8tvarTV4IopFTTpguzOy0PJzT2VCYcEwetspuY3pGgdSGnMS+1miJx4e1WSxuF7Zj2M6BjY7MmEjyxCA+/w6CiLxsnseW4pdVEtq++4/9zOzBXBIE2H8W/t500iiF1+LQ05ci1AnetIpWw76FWX+nHvVMPTRnIJanvyt7Fm6j6DmiDOBaRqEXcmeleLhUGk3QuFgB6J1rYkN97NbLkYa0SaVlfrG90SyS++1Bxg3fwgue8e4hD2LZTB+0H9mE2EEB/wJt8C9+pEFzDWaJLW+xzUC0/O8LQNw833g2V4lXFlZnhSfVapSmi2OIiR3nFI+B3ooa3Gr6R2j364U8q0H0cnGW9caAkC71M5gXYQ04+71snX4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(55016003)(83380400001)(4326008)(54906003)(9686003)(33656002)(316002)(478600001)(26005)(66476007)(38100700002)(66446008)(53546011)(8676002)(110136005)(186003)(6506007)(86362001)(71200400001)(8936002)(76116006)(5660300002)(38070700005)(66946007)(122000001)(2906002)(52536014)(107886003)(966005)(66556008)(64756008)(7696005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0hPNlJNRDFXcUJFWTdjbmhwNXFnblgyZVdXNlhwODhPblE0bmdSVmM4dzhz?=
 =?utf-8?B?SWtzOHNlalMrUnVpQ2FTemFGRHQvVk5nc2twU3JTbUpYMWtIQjBhRHd3NERr?=
 =?utf-8?B?QVEvdEswbmh4RkFsU0FSK2NublFIaFpTdTV6VTFyZzh4RmUyaENpTFFkdzhl?=
 =?utf-8?B?dnBXTDVkRWtpV09Na1BpZk1XNTJ0ZW1SeldDU0ZPaEFmMERxZW5iR2I1eHBy?=
 =?utf-8?B?dVRjM0txL282Z01vN1h1TlJDRmdFZTIvb2ozcjdZQXVOamRzd0RSYlNkaFc0?=
 =?utf-8?B?c1Naai9hS2t0dlh2dmxGUDZqdDJGNFJIWXRJYmg0Z0p1R0dwUU1CUTBQa2Ji?=
 =?utf-8?B?QzhrRFZRbXJCUUhsd1FKelZzMWl6TzluM3huRndhSk1GUDVzTXZrdDNwUzZY?=
 =?utf-8?B?UmFkcDdPOU9JdGNsQ3lVQ2Z3MEgrb2RGb0RyN3o3U1h5Zk5BOW5ocFFFUVVO?=
 =?utf-8?B?Vmd4cEVhcGs0OXVMYjZUbGx6WlVQZUU4RXd0Vm1TckFVZHNLT3RUR3RGUlpP?=
 =?utf-8?B?RzRRRnN2TVJQb2NVclhHd3BFTEpRdjgxL01mNnlZU2ZlRTVnSlRZRThCdEY0?=
 =?utf-8?B?VldpaTNOYk5JY3BvWEwzMmNNZ0Q3S0RHSFZQYUJEOUZCQ1NjaXpyZExJZUJV?=
 =?utf-8?B?QXc4d0EvVXk3UTZPNG5kSnM5SjZDQzAyZWFTR2FSV1QxZDY2OUg0S1hveEZ4?=
 =?utf-8?B?Wnk2eFJmQjQrRXFBMFRxc05XaXp1NDgwMGNVYnk3amJac1QyY2JYRjZiKzY4?=
 =?utf-8?B?R01RR29NL3F3d1MrcklnYWhtQ2Y5SkE0eUtYTVVEV3ppMEJuVHRMNVpxaDdr?=
 =?utf-8?B?Z1ZnaFlYZHZGZWxwV0c4aG5QVDNuQmczaVIwbldHMDVmc0ZXcmNZYXB2WlZ5?=
 =?utf-8?B?cFJNbXZoY1VidXAyTXFYTE5ZWTdIWmFJa1VxTVFmT0NCaEtMSlBNbEJkbjI0?=
 =?utf-8?B?V0pwNUE1LzZOWFpVN0w3N3BWNUdZUGJPaXc5alRFNkFDelJyNElqWkpWSnZv?=
 =?utf-8?B?NDhpRk5mT1cvbGlLWitvQlNUSkZPbTBCOGdvYUlJWHkxYkpiUTR4VnU4eHpk?=
 =?utf-8?B?RkFNTlFkZE5sVzYrVFcwc3FHK3c2NXZOZlZSTnZWYWw4KzBLbTVlL2gyUUZ3?=
 =?utf-8?B?Y0pPeFhIaDJXUkVCYXBsYmVpdWQzS25yUGFqQnF1YzhIREx6cG1icUhNVlVG?=
 =?utf-8?B?eXZLQzRlZnFjUldYMlBJOVFESFR1Mk4rby9ieGxCQ3pNYjh0Sk9mVTBWdmpX?=
 =?utf-8?B?RFhjVFgzRmtVU29UNEptajdWSC9LZFEvTXhoNlZQM1ljc1hFZkQ2K0NOdmM0?=
 =?utf-8?B?RkFEekp3aWRadlJQNHhSSGZFVjZ0NTFENy9kUFB2bHk4REdHZGJ1VUtqTE9M?=
 =?utf-8?B?ck45dVorKzdyOEcvZm1oUDd4TlVDQ0d3NHZVM2YraTU4bjFoWjR1UmxrU1Ix?=
 =?utf-8?B?ZHh5aEk5a2w0ZTltMW9QcHJXUXZZdGZVdjFKOERkNnlaQjNBQmluUm1oSlpk?=
 =?utf-8?B?dzdUK2RzL3FvcU5ySTRyVGhsTDJKajRHanVwRHhMMUJ0WW40bjNxWkZBK3ly?=
 =?utf-8?B?ZHpxQytpRStmVkFxRGo5aFJhbGVSMlc0eWVpQ3diRFlsY2daNGR4RUxYVS9R?=
 =?utf-8?B?dmZFUlp6TmF0T29VZXk1MHFBZS9lU2ZROEJSaWlVWklLUEVqV3c1S0lzcFUy?=
 =?utf-8?B?ZlRhSDlaekp5VWI3SGtPaHRlSkp3NnJLSzlNVW1lR0ZLVXluZ2FsYkt6Qmcw?=
 =?utf-8?B?eXlVanFoZXkzR0p5SXoyZnEvNTlHbHZQRkgxYkUyZU94Tkl1WFNza3B4bGs3?=
 =?utf-8?B?aEtxZk9OUGxsRjc1S3owTW5IVHgxSmlpdlNNOGx0Sm9CNzBvNG9uN3ZleDZz?=
 =?utf-8?B?YXNOeEw4OGVaTWpndzZnUVExT085ZFcwSWZJS1VzdlZNY2tmdVpJRk5yNVpD?=
 =?utf-8?B?eDd1OGNoS2Q3Tm5IUkxGblE3K3VrR3NXRU1YOXFsR3E5ZCtiQVkrUGxEbXBv?=
 =?utf-8?B?dzQ1SCs3ZGVnYklpQWZPdkREdEVBVEQ4bksvYS9VMHdDL1hGYlNjMDFTR1p3?=
 =?utf-8?B?U0hKZDlEc0RWcmxQNW1lM014bVVndXBHaS9ja1VyNFlRbVZtdEV3aVpWQXBZ?=
 =?utf-8?Q?4Olw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100c3729-0bbf-4023-89d9-08da59d1f244
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 13:19:07.3649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCOmyfJgrXs/GDHkDqNMjAPW9ml802DnGtmYnc2Me6CVCBHW63TAfwbQ8G2JtxNa9syh+GMZkHXcnNNGpjZtfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2841
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29t
Pg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjksIDIwMjIgNDowOCBQTQ0KPiBUbzogQW5keSBT
aGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBDYzogU3VuZ2JvIEVvIDxt
YW5zMG5AZ29yYW5pLnJ1bj47IFNodWJocmFqeW90aSBEYXR0YQ0KPiA8c2h1YmhyYWp5b3RpLmRh
dHRhQHhpbGlueC5jb20+OyBvcGVuIGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxpbnV4LQ0KPiBncGlv
QHZnZXIua2VybmVsLm9yZz47IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+
OyBnaXQgKEFNRC0NCj4gWGlsaW54KSA8Z2l0QGFtZC5jb20+OyBnaXQgPGdpdEB4aWxpbnguY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZ3BpbzogQWRkIHN1cHBvcnQgZm9yIFNMRzdY
TDQ1MTA2IEkyQyBHUE8NCj4gZXhwYW5kZXINCj4gDQo+IA0KPiANCj4gT24gNi8yOS8yMiAxMjox
NSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+IE9uIFdlZCwgSnVuIDI5LCAyMDIyIGF0IDk6
MTQgQU0gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4+
IE9uIDYvMjkvMjIgMDM6MDAsIFN1bmdibyBFbyB3cm90ZToNCj4gPj4+IE9uIDIwMjItMDYtMjkg
MDQ6MjEsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPj4+PiBPbiBUdWUsIEp1biAyOCwgMjAy
MiBhdCA5OjEzIFBNIEFuZHkgU2hldmNoZW5rbw0KPiA+Pj4+IDxhbmR5LnNoZXZjaGVua29AZ21h
aWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4+Pj4gQWN0dWFsbHksIHdoeSBj
YW4ndCBwY2E5NTcwIGJlIGFtZW5kZWQgdG8gc3VwcG9ydCB0aGlzPw0KPiA+DQo+ID4+PiBJdCBz
ZWVtcyB0aGUgc2xnN3hsNDUxMDYgZHJpdmVyIHJlYWRzL3dyaXRlcyBhIHJlZyBhdCAweERCIHNv
IGl0IGlzDQo+ID4+PiBub3QgY29tcGF0aWJsZSB3aXRoIHBjYTk1NzAgZHJpdmVyIChpbiB0aGUg
Y3VycmVudCBzdGF0ZSksIGFuZCAoSQ0KPiA+Pj4gc3VwcG9zZSkgaXQgY291bGQgYmUgY29udmVy
dGVkIHRvIHVzZSBncGlvLXJlZ21hcC4NCj4gPj4+DQo+ID4+PiBbMV0NCj4gPj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LQ0KPiBncGlvLzY5ZjVkMWExOTcwODM4YjhjNGJkOGQ2ZThk
YmE2Y2FjQA0KPiA+Pj4gd2FsbGUuY2MvDQo+ID4+DQo+ID4+IEFzIHdhcyBtZW50aW9uZWQgZHJp
dmVyIGlzIGJhc2VkIG9uIHBjYTk1NzAgYW5kIHRoZSBvbmx5IGltcG9ydGFudA0KPiA+PiBkaWZm
ZXJlbmNlIGlzIHdpdGggaTJjX3NtYnVzX3JlYWRfYnl0ZS9pMmNfc21idXNfcmVhZF9ieXRlX2Rh
dGEgYW5kDQo+ID4+IGVzcGVjaWFsbHkgaTJjX3NtYnVzX3dyaXRlX2J5dGUvaTJjX3NtYnVzX3dy
aXRlX2J5dGVfZGF0YS4NCj4gPj4NCj4gPj4gUmVhZCBjYW4gYmUgYWxpZ25lZCB3aXRob3V0IGFu
eSBpc3N1ZSBidXQgd3JpdGUgd2lsbCBoYXZlIGlmL2Vsc2UNCj4gPj4gYmVjYXVzZSBvZiBpMmNf
c21idXNfd3JpdGVfYnl0ZV9kYXRhLiBFeGFtcGxlIGJlbG93Lg0KPiA+Pg0KPiA+PiBTb21ldGhp
bmcgbGlrZSB0aGlzLiBJZiB0aGlzIGNoYW5nZSBpcyBmaW5lIEkgdGhpbmsgdGhlcmUgd29uJ3Qg
YmUNCj4gPj4gYW55IGlzc3VlIHRvIGp1c3QgbWVyZ2UgaXQgd2l0aCBwY2E5NTcwLg0KPiA+DQo+
ID4gVGhhbmtzLCBJIGFsc28gd291bGQgbGlrZSB0byBzZWUgc29tZXRoaW5nIGFzIGJlbG93IGlu
IHRoZSByZXN1bHQuDQo+IA0KPiBvay4gR29vZC4NCj4gDQo+ID4NCj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3Bpby9ncGlvLXNsZzd4bDQ1MTA2LmMNCj4gPj4gYi9kcml2ZXJzL2dwaW8vZ3Bp
by1zbGc3eGw0NTEwNi5jIGluZGV4IGJmMjVlNmZiNjc4Mi4uYjkwOTUwYWUzOGMxDQo+ID4+IDEw
MDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1zbGc3eGw0NTEwNi5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNsZzd4bDQ1MTA2LmMNCj4gPj4gQEAgLTIyLDIwICsyMiwy
NCBAQA0KPiA+PiAgICBzdHJ1Y3Qgc2xnN3hsNDUxMDYgew0KPiA+PiAgICAgICAgICAgc3RydWN0
IGdwaW9fY2hpcCBjaGlwOw0KPiA+PiAgICAgICAgICAgc3RydWN0IG11dGV4IGxvY2s7ICAgICAg
LyogVG8gcHJvdGVjdCB3cml0ZXMgKi8NCj4gPj4gKyAgICAgICB1MzIgY29tbWFuZDsNCj4gPj4g
ICAgfTsNCj4gPj4NCj4gPj4gICAgc3RhdGljIGludCBzbGc3eGw0NTEwNl9yZWFkKHN0cnVjdCBz
bGc3eGw0NTEwNiAqZ3BpbykNCj4gPj4gICAgew0KPiA+PiAgICAgICAgICAgc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9DQo+ID4+IHRvX2kyY19jbGllbnQoZ3Bpby0+Y2hpcC5wYXJlbnQpOw0K
PiA+Pg0KPiA+PiAtICAgICAgIHJldHVybiBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50
LCBTTEc3WEw0NTEwNl9HUE9fUkVHKTsNCj4gPj4gKyAgICAgICByZXR1cm4gaTJjX3NtYnVzX3Jl
YWRfYnl0ZV9kYXRhKGNsaWVudCwgZ3Bpby0+Y29tbWFuZCk7DQo+ID4+ICAgIH0NCj4gPj4NCj4g
Pj4gICAgc3RhdGljIGludCBzbGc3eGw0NTEwNl93cml0ZShzdHJ1Y3Qgc2xnN3hsNDUxMDYgKmdw
aW8sIHU4IHZhbHVlKQ0KPiA+PiAgICB7DQo+ID4+ICAgICAgICAgICBzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50ID0NCj4gPj4gdG9faTJjX2NsaWVudChncGlvLT5jaGlwLnBhcmVudCk7DQo+ID4+
DQo+ID4+IC0gICAgICAgcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBT
TEc3WEw0NTEwNl9HUE9fUkVHLA0KPiB2YWx1ZSk7DQo+ID4+ICsgICAgICAgaWYgKGdwaW8tPmNv
bW1hbmQpDQo+ID4+ICsgICAgICAgICAgICAgICByZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGVf
ZGF0YShjbGllbnQsDQo+ID4+ICsgU0xHN1hMNDUxMDZfR1BPX1JFRywNCj4gPj4gdmFsdWUpOw0K
PiA+DQo+ID4gTWlzc2VkIGNoYW5nZSB0byBncGlvLT5jb21tYW5kIDotKQ0KPiANCj4gSSBmb3Vu
ZCBpdCB0b28uIDotKQ0KPiANCj4gU2h1YmhyYWp5b3RpOiBDYW4geW91IHBsZWFzZSBtZXJnZSB0
aGF0IHNsZyBkcml2ZXIgdG8gOTU3MD8gVGhhdCBkdC1iaW5kaW5nDQo+IHdpbGwgcmVxdWlyZSBz
bWFsbCBtYXNzYWdlIHRvby4NCg0KV2lsbCBmaXggaW4gdGhlIG5leHQgdmVyc2lvbi4NClRoYW5r
cyANCj4gDQo+IFRoYW5rcywNCj4gTWljaGFsDQo+IA0K
