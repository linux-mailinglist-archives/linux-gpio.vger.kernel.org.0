Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1825932DB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiHOQTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 12:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiHOQTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 12:19:07 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D7718B02;
        Mon, 15 Aug 2022 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660580342; x=1692116342;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
  b=Wmp6v3mX7fBLIlb81/C1oRh+6/g6U8iqxhNvgamM8qIeAuK2fUslyPtH
   Cy6yckBPWnbb9GtwORydpJQtwDEEs7bnR2PH81OVHgSy/kTgDcTqO9pUJ
   QoEmCmuyU3j8XSX7d8gAutzgg/P9oI00yA9FUd5wz7uo60l/vu6dfyoD2
   wNT1XhDOK2ElkrImLzsVvv3dI257nWcC8Vl9wCNhia7aDUiQsFqdo3R6l
   H+Z2orVuN8SAc8BMHxcoGzAsp3JnSabQSuPrVthV/f2okawrvHuUkVI2y
   2IWq8bMkmlRQDWr0C0fllmibShX5GwuF/hmbVLTSQfIosenPpxoYQjFnZ
   A==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="186523207"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 09:19:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 09:19:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 09:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfD2kpkBk3M/Z+mS75i70++ms0Bz/Gk/uhHqMVnZ05BZ3afeYQQRce3FzQYchyyiZ6PIvYFcGJ7P3oTZQScvd4hFFPS0lMiE+lns4Q7uKnTf5WsmNxzAljnCIbJ8HVHHSuHEGlibWc70W+1T5QKBe0sotpuMJ15YymunI61jsbNzXQ8g4hX+UCUS661k6Nr3a2aKKSQvX5zMiPRJJ21DRiqap7dzDqG1FohgHBvJojUCE/ByhyKkwJqRFEZV8XDoUwdSrrUUl9Uc4C/T7BwBt7KNp3zhmSttcpOSl7CmsaahcR7waUv3v12yo/hEp3+eDKMz+cf8HrUy5vViBnxSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
 b=RzVHgeBKGk5DlAO+969fYQZkMMdTkfBSObSDMkX6iT0aXlRbTtXQ40SbyfCtRt1RUCmKBC6DrYDx8X3h5kN6Uc10rLNztAQ7Zco7OcOYUf1SXKSkzHqGOVilIc33KRBwn74c0/HnAixutbdWt6skKByy6e8GcIoMDLvuuVK0OX13Rh84bv/8q3+TV/VJFSKpRRtSQvuYwh8gP6T71zm1pR/sZmSppj3lfyH/5P7tRufpns0Ew6MsY+g+NWPRQxcZNBJE64MXl+iaRWPrfyy4Pbghc/wF7CuwYpJJWWowl7KF/gw+fFSNaM5RsCrJrY4WJJ9yA5kzOUiHxk+r+G7U6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
 b=Co60OiQpgLHQ7ZcWmu/AQQAQA4MMetqNmzOac14m5b1LVgDeudb2NoDYeU+5ELEGYWzjvDnLMXiokQ2T63TqxEInHxtCU+3wKmTi9aJKU2Kpe6c7o+BObp8Ch7gTn4U/udp6E+gbJSv2Dwj19fKMWSY+ZIHAvuAnLmNZ5S1JYMY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1769.namprd11.prod.outlook.com (2603:10b6:3:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 16:18:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:18:52 +0000
From:   <Conor.Dooley@microchip.com>
To:     <Lewis.Hanly@microchip.com>, <linux-gpio@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <palmer@dabbelt.com>, <maz@kernel.org>
CC:     <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYsJ/HwsKWI4ziKk+4Z6/CkrdV+a2wJCmA
Date:   Mon, 15 Aug 2022 16:18:51 +0000
Message-ID: <23a69be6-96d3-1c28-f1aa-555e38ff991e@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com>
In-Reply-To: <20220815120834.1562544-2-lewis.hanly@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 797df481-4b5b-45c8-584f-08da7ed9d7c7
x-ms-traffictypediagnostic: DM5PR11MB1769:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlMsrtTvwjMnpoZQOAB6reRZA1/EOhR1ShxE0wRZGieMfZBjJOddU36FeoQciMYyjjI49QP4EUbTDKWXbQmUgWcr3fGB8Q1bg52eu3R+JaSkM+dDVIs5tC9LS8NSihp5ygIjiOUUsTc01ZNKnRzRIUFakYyah3fsVimQkCHJdZxcGDzIti+C/5PAM6UJf4ldL7lxwV0fgIPqBVJMuskeSqpg3olCeRBU5V6zJjZbqC8xHpKWcxkZ6e0w13pSg4sYetDliLKsvKHy61L1R5uCoq6anq2+RJSXo25GRpdCQDuq8KzggOGS4o+5rArLg6PlS9E77MRj5+eXcdyRIV/I/AvlLWNJvdZCKvv1peozc0Wc1tqXQQwW4h15Y7VKjL3l45v/yjCywJeW3t6O7PUsdkgD4fJxGrOd4QiNVvcAt9H89F3EnTYx8YnAaRUp7/fN5zXb5DFdPVnwb5Zhc4WRUYVrHhqIIfdcg0XNrCTv/evK+PAYQjR7ddjHKkPPoVh17hi21AEuYNt6+7drKAPXeU7JYHw80/deu31I0g1Ry4R7SBrkc4ghqdobk6O6YWBetkpUmioJ4y4zFa4eOLsGXqmO7FrzrOH9IZU0f5wNETMpZcarQIsE+FAuYS0ZWjHVPE2dbHImReo/OswIj3Tjkz6tzijWRsrileT3hY+5xVa/G/+sX7Xa4vKv6GA34MUivm0B+Bd4mbukasXRwR6dFM5SVXZxbkWLBmDLdMXsVad+8bmonlO/hOVwaCWLtY5vGDEzCafwFeYiZz85m0vRezwyaEy6p8sduy3iIOUQaI41UNMS3TynOa2BZIMgihhAq7D/Rq9N1vAcvRgYtTOw46FbX7lMlFw9ZNxGtGH4W94dt1fNcyz6/RnkHVv6AR6eV1O5rM4WfiOX31ET7dyUWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39860400002)(366004)(6486002)(83380400001)(966005)(6506007)(478600001)(26005)(186003)(41300700001)(53546011)(6512007)(2616005)(316002)(110136005)(8676002)(31686004)(36756003)(66476007)(8936002)(66446008)(4326008)(91956017)(76116006)(66556008)(64756008)(66946007)(2906002)(107886003)(38070700005)(5660300002)(30864003)(71200400001)(86362001)(31696002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVVneWQ3bmVreDdWQ1BOTGJua2pWMzhUNFRhS2Z3a2ZxZCt5bUVZWWluL2ZW?=
 =?utf-8?B?eHJHYWlBT0dxc2w4UDFtd0pRZWpCREFKVW5mL01taVlFRnNaVDJnNGZQVlpL?=
 =?utf-8?B?YkN4Wi9RaTBlMlhSTHRta05MTG9RWUY4dWFiRUc3c2RHN0tXNEZvMUhua1pl?=
 =?utf-8?B?dldUc1dTT2Q4WTZRMUUyTFpsSEdsVXV3MDErUWJlU2p6c1oyRFR5UlJuK3VG?=
 =?utf-8?B?Qzgxb0IxK2hHK3FuVlRrTjZwRGl0RUptVUZHSk54MDZVV2pwdGloazJTQ205?=
 =?utf-8?B?NHJZRkF5all1NEZQTEtZMjY2MG9jUTBrZEd4bXJhT1ZETFNRTURlbjZ5alUv?=
 =?utf-8?B?OXUrSmtkVlFXNmxtNFphbFFDcitxMUJXK0RsczJRS284Q3RBYWIvVGUvOEw4?=
 =?utf-8?B?M3JOSzE3eWFHbXdXMm4wanplcWpvWlNnVnNucVcvMmtOZ1ZXd2c1djdTT1BP?=
 =?utf-8?B?YUJzaTNZOUU5Q1B3eEkybzhQcUY4VURBajJZVWtxaXZlaE1zTTZGVmMxeDlE?=
 =?utf-8?B?dTVVK2RocnFpZ25PeDZLZnBYK0RjMDBqUmVyVzQzbDI0MlBqZjQveTk4N01j?=
 =?utf-8?B?Nko2cEpyc0M4ZkRRR05ROWpFQkNnbS9rd2IyT3cvb3NlMDJMcWxCM0hwbTNX?=
 =?utf-8?B?RFNPT0d1ajlYZllhcjc1cUROR0kxMnN2S0l3TnRiMlllVTZMSnV6RmJSZUpV?=
 =?utf-8?B?Z1hhN1BKQUlYWjN2S09pOFZUUW5vYUF6MmwyN1k1WURXVFlYOStJa1ZsMDhC?=
 =?utf-8?B?M1VVSWtjRVZoTUs1SWluZU9TaWsvOXV4RjFNVFNpc0QvQ2ZiZmxhbFdkbkRY?=
 =?utf-8?B?Z2dZSG9Ra0pZaVYwQnc1N3QwZ0sxNjFEdUZqS2FYRXhyaGwvSnF4KzFvVnFp?=
 =?utf-8?B?T2FiUTZUUmVQWjJnTEFmM3BPVVk5Kytwd1VLR1RoL2lxRHdiczMvUmsxS2t4?=
 =?utf-8?B?UWxYMnk4TDBJaVNkM2tDL3ZWZE1iZHROKzd1eS9VOFllT1RzZktRakNYekdx?=
 =?utf-8?B?WXRTTGd4aUh1NWtValI1MSsreGJqc05wcGJMZ1p4VWFJUGsxckVuKzJJNzY1?=
 =?utf-8?B?bjVGNnJubWlySVpkV0NVYWpFZFdpRlV4TmV2aHVRNG9yV1RpeVIwQlBPdWdC?=
 =?utf-8?B?QVZBb29FYVNEckUydjQydFNLY3gvdWNmVkF6ZGd2dDcrUzNxeW41U21oNXN0?=
 =?utf-8?B?WXZ1RkEvaGJ0akZDa1RLV05qNk1YZm85ZjZKbU9pWWxIMXNldEJQR0VtM1pw?=
 =?utf-8?B?L1MzYktlaHZ0YW9pTFcyZzhHYnJzMlVrM1p4b3BrSXlOcEJYL0lLaFFKYThD?=
 =?utf-8?B?aFdiNFJHMTlPT3pZNUVmVGdTMlZkTG1tOHV5MVZoeEJpZklUb3dVMG5wUlgx?=
 =?utf-8?B?VEp0ZUpZMWpjcXoxSDJwcEdLYzMzaTFidkF4NVBMcDZvWVVUVXBwWkZhYkhm?=
 =?utf-8?B?YW40TkR4YkpjeHo1WUVjNWkrQUVzTWprcXk5TE1UVEJJY0ZacmI2VmFHUzBU?=
 =?utf-8?B?bFhKc29PQnA1T0Y4cVNjRUptSkxUS0QyUVZNSWloTFlQZWcycy92OVpYMUxZ?=
 =?utf-8?B?Yk0rTHJtSklwUkFTWTFza1BycnRxVm43TFhVMXU2clpvaUczWlJqRHhTOGpI?=
 =?utf-8?B?L1g2Y3JKVzNYL3k4VFR3LzI1N0d4bXRVeEp5QVFJenozaTV1SlRvV0FrZnBS?=
 =?utf-8?B?QlllSGlZb3ZPRDY4dlhXZnFhbmZvYWI1dHllUUg0bHo3dTBXcjJPS0x3VUJL?=
 =?utf-8?B?S3FVWEJvK1I3YlNWUTJpWTdGVWxtd2doangwZFNOSm9ZM3pyZ09WSWRaNEZD?=
 =?utf-8?B?Q29hbC9tcUtHVW11TmFQeDlxWVV2Z3VXbk5sa0JxbHlwTTFPeFBFdlNiM3BL?=
 =?utf-8?B?OWhOUjhlTHhaMFVtVW42bGZpRGdxVzkwcHhRZnJaZlZmb2toaVNvNy93cW8y?=
 =?utf-8?B?Ymp3M1g5dnQrMVlQOEFMMnpXUHZoa3lSR2JEZmJ3bnZhYkl6T3FtOE1aWS92?=
 =?utf-8?B?citLQWd1RU9uaVpxVlZpMzdoblFWNDFDREdWSWIrTGtzOWoxZlhMZER3c1k3?=
 =?utf-8?B?V3YvNERHZG5WUW01UlU0RS9SSEVabTVKcENwdzRaSjBRVkhUeVZybVdxdWtO?=
 =?utf-8?Q?wlxC0ASTeJUXFkIZKuQzAQeX5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F72F076BF9ECCB43976E181F754E4188@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797df481-4b5b-45c8-584f-08da7ed9d7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 16:18:51.9358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibOEa/zkgtvaOqDlagcfpl/mUw9XwLvzXFrLPPCuDCjcW6oXT/ytT8G5eK04Z3LBQFz44uvgIfe4drokSFobSo7pH+MCbTMKMA3mFxZfCRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1769
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

TGV3aXMsIE1hcmMsDQoNClRvcCBwb3N0aW5nIHRoaXMgYml0IGFzIGl0J3MgaW1wb3J0YW50IGNv
bnRleHQgJiBhIHF1ZXN0IHRoYXQgSSBkb24ndA0KaGF2ZSBhIHNwZWNpZmljIHBsYWNlIHRvIGFz
ay4NCg0KU28gSSBoYXZlIHR3byBjb25jZXJucy9xdWVzdGlvbnMgYWJvdXQgdGhpcyBwYXRjaCwg
b2Ygd2hpY2ggYm90aA0KcmVsYXRlIHRvIGludGVycnVwdCBoYW5kbGluZy4gRnJvbSB0aGUgY292
ZXI6DQoNCj4gQ2hhbmdlZCB0aGUgaW50ZXJydXB0IGhhbmRsaW5nIGZyb20gSGllcmFyY2hpY2Fs
IGZsb3cgdG8gY2hhaW5lZA0KPiBpbnRlcnJ1cHQgZmxvdy4gVGhlIHJlYXNvbiBmb3IgdGhlIGNo
YW5nZSB3YXMgd2l0aCBoaWVyYXJjaGljYWwgZmxvdyB3ZQ0KPiByZXF1cmllZCBhIGludGVycnVw
dCBudW1iZXIgbWFwcGluZyBhcnJheSB0byB3b3JrIHdpdGggb3VyIEhXIGFuZCB0aGlzDQo+IHdh
cyBub3QgYWNjZXB0YWJsZS4gT24gcmV2aWV3aW5nIHRoZSBhcmNoaXRlY3R1cmUgdGhlIGNoYWlu
ZWQgaW50ZXJydXB0DQo+IGZsb3cgd29ya3MgYmV0dGVyIGZvciBvdXIgaGFyZHdhcmUgYW5kIGNv
bmZpZ3VyYXRpb25zIHdoaWNoIGFyZSBub3QNCj4gZml4ZWQgaW4gU2lsaWNvbi4NCg0KUHJldmlv
dXNseSB3ZSBkaXNjdXNzZWQgdGhlIGNvbmZpZ3VyYXRpb25zIG9mIHRoZSBoYXJkd2FyZToNCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2Lzg3djhydnpzZmMud2wtbWF6QGtlcm5l
bC5vcmcvDQoNClRvIHJlY2FwLCB0aGUgU29DIGhhcyA5NiBHUElPcyBidXQgZmV3ZXIgaW50ZXJy
dXB0cy4gVG8gcHJvdmlkZQ0KYWNjZXNzIHRvIGFsbCA5NiBHUElPcyAoMzIgcGVyIGJsb2NrKSB0
aGVyZSBpcyBhIG11eGVkIGludGVycnVwdA0KcGVyIGJsb2NrIHRvby4gV2hpY2hldmVyIEdQSU9z
IGRvIG5vdCBoYXZlIGEgZGlyZWN0IGNvbm5lY3Rpb24NCnRvIHRoZSBwbGljIGFuZCBsdW1wZWQg
aW50byB0aGUgbXV4ZWQgaW50ZXJydXB0LiBXaGljaCBpbnRlcnVwdHMNCmFyZSBtdXhlZCBvciBk
aXJlY3QgaXMgc2V0IGJ5IGEgc2luZ2xlIHJlZ2lzdGVyLCBub3QgcGFydCBvZg0KYW55IG9mIHRo
ZSAzIEdQSU8gYmxvY2tzLiBPbiBhIHBlciBibG9jayBsZXZlbCwgdGhlcmUgaXMgbm8gc2V0DQpj
b25maWd1cmF0aW9uIGZvciB3aGljaCBpbnRlcnJ1cHRzIGFyZSBkaXJlY3Qgb3IgbXV4ZWQgLSBh
bGwgb3INCm5vIEdQSU8gaW50ZXJydXB0cyBtYXkgYmUgbXV4ZWQuDQoNCk15IGZpcnN0IHF1ZXN0
aW9uIGlzIGhvdyBhcmUgaW5kaXZpZHVhbCBHUElPcyAmIHRoZWlyIGludGVycnVwdHMNCnJlbGF0
ZWQ/IEFzIHRoZSBpbnRlcnJ1cHQgbWFwcGluZyBpcyBzcGFyc2UsIGhvdyBkbyB3ZSBrbm93IHRo
YXQNCmludGVycnVwdCAyNiBzcGVjaWZpY2FsbHkgY29ycmVzcG9uZHMgdG8gR1BJTyAxNCBvbiBi
bG9jayAwLCBidXQNCmFsbCAzMSBvdGhlciBHUElPcyBhcmUgdXNpbmcgaW50ZXJydXB0IDUxPyBN
YXliZSB0aGlzIGlzIG5ldmVyIHNvbWV0aGluZw0KdGhhdCBtYXR0ZXJzIG9yIEkgaGF2ZSBtaXNz
ZWQgc29tZXRoaW5nLg0KDQpTZWNvbmQgcXVlc3Rpb24gaXMgaW5saW5lIEAgbXBmc19ncGlvX2ly
cV9oYW5kbGVyKCkuDQogDQpPbiAxNS8wOC8yMDIyIDEzOjA4LCBsZXdpcy5oYW5seUBtaWNyb2No
aXAuY29tIHdyb3RlOg0KPiBGcm9tOiBMZXdpcyBIYW5seSA8bGV3aXMuaGFubHlAbWljcm9jaGlw
LmNvbT4NCj4gDQo+IEFkZCBhIGRyaXZlciB0byBzdXBwb3J0IHRoZSBQb2xhcmZpcmUgU29DIGdw
aW8gY29udHJvbGxlcg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGV3aXMgSGFubHkgPGxld2lzLmhh
bmx5QG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL0tjb25maWcgICAgIHwg
ICA3ICsNCj4gIGRyaXZlcnMvZ3Bpby9NYWtlZmlsZSAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dw
aW8vZ3Bpby1tcGZzLmMgfCAzMTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMyNSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncGlvL2dwaW8tbXBmcy5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncGlvL0tjb25maWcgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiBpbmRleCAwNjQyZjU3
OTE5NmYuLjMwM2VhN2Y2ZjdiYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL0tjb25maWcN
Cj4gKysrIGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gQEAgLTQ5MCw2ICs0OTAsMTMgQEAgY29u
ZmlnIEdQSU9fUE1JQ19FSUNfU1BSRA0KPiAgCWhlbHANCj4gIAkgIFNheSB5ZXMgaGVyZSB0byBz
dXBwb3J0IFNwcmVhZHRydW0gUE1JQyBFSUMgZGV2aWNlLg0KPiAgDQo+ICtjb25maWcgR1BJT19Q
T0xBUkZJUkVfU09DDQo+ICsJYm9vbCAiTWljcm9jaGlwIEZQR0EgR1BJTyBzdXBwb3J0Ig0KPiAr
CWRlcGVuZHMgb24gT0ZfR1BJTw0KPiArCXNlbGVjdCBHUElPTElCX0lSUUNISVANCj4gKwloZWxw
DQo+ICsJICBTYXkgeWVzIGhlcmUgdG8gc3VwcG9ydCB0aGUgR1BJTyBkZXZpY2Ugb24gTWljcm9j
aGlwIEZQR0FzLg0KPiArDQo+ICBjb25maWcgR1BJT19QWEENCj4gIAlib29sICJQWEEgR1BJTyBz
dXBwb3J0Ig0KPiAgCWRlcGVuZHMgb24gQVJDSF9QWEEgfHwgQVJDSF9NTVAgfHwgQ09NUElMRV9U
RVNUDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vTWFrZWZpbGUgYi9kcml2ZXJzL2dwaW8v
TWFrZWZpbGUNCj4gaW5kZXggYTA5ODVkMzBmNTFiLi5lMDQwNjFhYzVhMjggMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3Bpby9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwaW8vTWFrZWZpbGUN
Cj4gQEAgLTEyMCw2ICsxMjAsNyBAQCBvYmotJChDT05GSUdfR1BJT19QQ0lfSURJT18xNikJCSs9
IGdwaW8tcGNpLWlkaW8tMTYubw0KPiAgb2JqLSQoQ09ORklHX0dQSU9fUElTT1NSKQkJKz0gZ3Bp
by1waXNvc3Iubw0KPiAgb2JqLSQoQ09ORklHX0dQSU9fUEwwNjEpCQkrPSBncGlvLXBsMDYxLm8N
Cj4gIG9iai0kKENPTkZJR19HUElPX1BNSUNfRUlDX1NQUkQpCSs9IGdwaW8tcG1pYy1laWMtc3By
ZC5vDQo+ICtvYmotJChDT05GSUdfR1BJT19QT0xBUkZJUkVfU09DKQkrPSBncGlvLW1wZnMubw0K
PiAgb2JqLSQoQ09ORklHX0dQSU9fUFhBKQkJCSs9IGdwaW8tcHhhLm8NCj4gIG9iai0kKENPTkZJ
R19HUElPX1JBU1BCRVJSWVBJX0VYUCkJKz0gZ3Bpby1yYXNwYmVycnlwaS1leHAubw0KPiAgb2Jq
LSQoQ09ORklHX0dQSU9fUkM1VDU4MykJCSs9IGdwaW8tcmM1dDU4My5vDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwaW8vZ3Bpby1tcGZzLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGZzLmMNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMGU2OGE4Yjg5MWQN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGZzLmMNCj4gQEAg
LTAsMCArMSwzMTcgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCkN
Cj4gKy8qDQo+ICsgKiBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQyAoTVBGUykgR1BJTyBjb250cm9s
bGVyIGRyaXZlcg0KPiArICoNCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOC0yMDIyIE1pY3JvY2hp
cCBUZWNobm9sb2d5IEluYy4gYW5kIGl0cyBzdWJzaWRpYXJpZXMNCj4gKyAqDQo+ICsgKiBBdXRo
b3I6IExld2lzIEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tPg0KPiArICovDQo+ICsN
Cj4gKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4N
Cj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9lcnJuby5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
aW5pdC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2lycS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2ly
cWNoaXAvY2hhaW5lZF9pcnEuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L29mX2lycS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L3NwaW5sb2NrLmg+DQo+ICsNCj4gKyNkZWZpbmUgTVBGU19HUElPX0NUUkwoaSkJCSgweDQg
KiAoaSkpDQo+ICsjZGVmaW5lIE1BWF9OVU1fR1BJTwkJCTMyDQo+ICsjZGVmaW5lIE1QRlNfR1BJ
T19FTl9JTlQJCTMNCj4gKyNkZWZpbmUgTVBGU19HUElPX0VOX09VVF9CVUYJCUJJVCgyKQ0KPiAr
I2RlZmluZSBNUEZTX0dQSU9fRU5fSU4JCQlCSVQoMSkNCj4gKyNkZWZpbmUgTVBGU19HUElPX0VO
X09VVAkJQklUKDApDQo+ICsNCj4gKyNkZWZpbmUgTVBGU19HUElPX1RZUEVfSU5UX0VER0VfQk9U
SAkweDgwDQo+ICsjZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9FREdFX05FRwkweDYwDQo+ICsj
ZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9FREdFX1BPUwkweDQwDQo+ICsjZGVmaW5lIE1QRlNf
R1BJT19UWVBFX0lOVF9MRVZFTF9MT1cJMHgyMA0KPiArI2RlZmluZSBNUEZTX0dQSU9fVFlQRV9J
TlRfTEVWRUxfSElHSAkweDAwDQo+ICsjZGVmaW5lIE1QRlNfR1BJT19UWVBFX0lOVF9NQVNLCQlH
RU5NQVNLKDcsIDUpDQo+ICsjZGVmaW5lIE1QRlNfSVJRX1JFRwkJCTB4ODANCj4gKyNkZWZpbmUg
TVBGU19JTlBfUkVHCQkJMHg4NA0KPiArI2RlZmluZSBNUEZTX09VVFBfUkVHCQkJMHg4OA0KPiAr
DQo+ICtzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgew0KPiArCXZvaWQgX19pb21lbSAqYmFzZTsNCj4g
KwlzdHJ1Y3QgY2xrICpjbGs7DQo+ICsJcmF3X3NwaW5sb2NrX3QJbG9jazsNCj4gKwlzdHJ1Y3Qg
Z3Bpb19jaGlwIGdjOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIHZvaWQgbXBmc19ncGlvX2Fzc2ln
bl9iaXQodm9pZCBfX2lvbWVtICphZGRyLCB1bnNpZ25lZCBpbnQgYml0X29mZnNldCwgYm9vbCB2
YWx1ZSkNCj4gK3sNCj4gKwl1bnNpZ25lZCBsb25nIHJlZyA9IHJlYWRsKGFkZHIpOw0KPiArDQo+
ICsJX19hc3NpZ25fYml0KGJpdF9vZmZzZXQsICZyZWcsIHZhbHVlKTsNCj4gKwl3cml0ZWwocmVn
LCBhZGRyKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBtcGZzX2dwaW9fZGlyZWN0aW9uX2lu
cHV0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3Bpb19pbmRleCkNCj4gK3sN
Cj4gKwlzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgKm1wZnNfZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRh
KGdjKTsNCj4gKwl1MzIgZ3Bpb19jZmc7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0K
PiArCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmbXBmc19ncGlvLT5sb2NrLCBmbGFncyk7DQo+ICsN
Cj4gKwlncGlvX2NmZyA9IHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfR1BJT19DVFJMKGdw
aW9faW5kZXgpKTsNCj4gKwlncGlvX2NmZyB8PSBNUEZTX0dQSU9fRU5fSU47DQo+ICsJZ3Bpb19j
ZmcgJj0gfihNUEZTX0dQSU9fRU5fT1VUIHwgTVBGU19HUElPX0VOX09VVF9CVUYpOw0KPiArCXdy
aXRlbChncGlvX2NmZywgbXBmc19ncGlvLT5iYXNlICsgTVBGU19HUElPX0NUUkwoZ3Bpb19pbmRl
eCkpOw0KPiArDQo+ICsJcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1wZnNfZ3Bpby0+bG9j
aywgZmxhZ3MpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQg
bXBmc19ncGlvX2RpcmVjdGlvbl9vdXRwdXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVk
IGludCBncGlvX2luZGV4LCBpbnQgdmFsdWUpDQo+ICt7DQo+ICsJc3RydWN0IG1wZnNfZ3Bpb19j
aGlwICptcGZzX2dwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ICsJdTMyIGdwaW9fY2Zn
Ow0KPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsNCj4gKwlyYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJZ3Bpb19jZmcgPSByZWFkbCht
cGZzX2dwaW8tPmJhc2UgKyBNUEZTX0dQSU9fQ1RSTChncGlvX2luZGV4KSk7DQo+ICsJZ3Bpb19j
ZmcgfD0gTVBGU19HUElPX0VOX09VVCB8IE1QRlNfR1BJT19FTl9PVVRfQlVGOw0KPiArCWdwaW9f
Y2ZnICY9IH5NUEZTX0dQSU9fRU5fSU47DQo+ICsJd3JpdGVsKGdwaW9fY2ZnLCBtcGZzX2dwaW8t
PmJhc2UgKyBNUEZTX0dQSU9fQ1RSTChncGlvX2luZGV4KSk7DQo+ICsNCj4gKwltcGZzX2dwaW9f
YXNzaWduX2JpdChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX09VVFBfUkVHLCBncGlvX2luZGV4LCB2
YWx1ZSk7DQo+ICsNCj4gKwlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbXBmc19ncGlvLT5s
b2NrLCBmbGFncyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlu
dCBtcGZzX2dwaW9fZ2V0X2RpcmVjdGlvbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gKwkJCQkg
ICB1bnNpZ25lZCBpbnQgZ3Bpb19pbmRleCkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXBmc19ncGlvX2No
aXAgKm1wZnNfZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gKwl1MzIgZ3Bpb19jZmc7
DQo+ICsNCj4gKwlncGlvX2NmZyA9IHJlYWRsKG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfR1BJT19D
VFJMKGdwaW9faW5kZXgpKTsNCj4gKwlpZiAoZ3Bpb19jZmcgJiBNUEZTX0dQSU9fRU5fSU4pDQo+
ICsJCXJldHVybiBHUElPX0xJTkVfRElSRUNUSU9OX0lOOw0KPiArDQo+ICsJcmV0dXJuIEdQSU9f
TElORV9ESVJFQ1RJT05fT1VUOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IG1wZnNfZ3Bpb19n
ZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsDQo+ICsJCQkgdW5zaWduZWQgaW50IGdwaW9faW5kZXgp
DQo+ICt7DQo+ICsJc3RydWN0IG1wZnNfZ3Bpb19jaGlwICptcGZzX2dwaW8gPSBncGlvY2hpcF9n
ZXRfZGF0YShnYyk7DQo+ICsNCj4gKwlyZXR1cm4gISEocmVhZGwobXBmc19ncGlvLT5iYXNlICsg
TVBGU19JTlBfUkVHKSAmIEJJVChncGlvX2luZGV4KSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2
b2lkIG1wZnNfZ3Bpb19zZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlv
X2luZGV4LCBpbnQgdmFsdWUpDQo+ICt7DQo+ICsJc3RydWN0IG1wZnNfZ3Bpb19jaGlwICptcGZz
X2dwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4gKw0KPiArCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmbXBmc19ncGlvLT5sb2NrLCBmbGFncyk7
DQo+ICsNCj4gKwltcGZzX2dwaW9fYXNzaWduX2JpdChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX09V
VFBfUkVHLA0KPiArCQkJICAgICBncGlvX2luZGV4LCB2YWx1ZSk7DQo+ICsNCj4gKwlyYXdfc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmbXBmc19ncGlvLT5sb2NrLCBmbGFncyk7DQo+ICt9DQo+ICsN
Cj4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX2lycV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmRh
dGEsIHVuc2lnbmVkIGludCB0eXBlKQ0KPiArew0KPiArCXN0cnVjdCBncGlvX2NoaXAgKmdjID0g
aXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZGF0YSk7DQo+ICsJc3RydWN0IG1wZnNfZ3Bpb19j
aGlwICptcGZzX2dwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7DQo+ICsJaW50IGdwaW9faW5k
ZXggPSBpcnFkX3RvX2h3aXJxKGRhdGEpOw0KPiArCXUzMiBpbnRlcnJ1cHRfdHlwZTsNCj4gKwl1
MzIgZ3Bpb19jZmc7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0KPiArCXN3aXRjaCAo
dHlwZSkgew0KPiArCWNhc2UgSVJRX1RZUEVfRURHRV9CT1RIOg0KPiArCQlpbnRlcnJ1cHRfdHlw
ZSA9IE1QRlNfR1BJT19UWVBFX0lOVF9FREdFX0JPVEg7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2Ug
SVJRX1RZUEVfRURHRV9GQUxMSU5HOg0KPiArCQlpbnRlcnJ1cHRfdHlwZSA9IE1QRlNfR1BJT19U
WVBFX0lOVF9FREdFX05FRzsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBJUlFfVFlQRV9FREdFX1JJ
U0lORzoNCj4gKwkJaW50ZXJydXB0X3R5cGUgPSBNUEZTX0dQSU9fVFlQRV9JTlRfRURHRV9QT1M7
DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgSVJRX1RZUEVfTEVWRUxfSElHSDoNCj4gKwkJaW50ZXJy
dXB0X3R5cGUgPSBNUEZTX0dQSU9fVFlQRV9JTlRfTEVWRUxfSElHSDsNCj4gKwkJYnJlYWs7DQo+
ICsJY2FzZSBJUlFfVFlQRV9MRVZFTF9MT1c6DQo+ICsJCWludGVycnVwdF90eXBlID0gTVBGU19H
UElPX1RZUEVfSU5UX0xFVkVMX0xPVzsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJcmF3
X3NwaW5fbG9ja19pcnFzYXZlKCZtcGZzX2dwaW8tPmxvY2ssIGZsYWdzKTsNCj4gKw0KPiArCWdw
aW9fY2ZnID0gcmVhZGwobXBmc19ncGlvLT5iYXNlICsgTVBGU19HUElPX0NUUkwoZ3Bpb19pbmRl
eCkpOw0KPiArCWdwaW9fY2ZnICY9IH5NUEZTX0dQSU9fVFlQRV9JTlRfTUFTSzsNCj4gKwlncGlv
X2NmZyB8PSBpbnRlcnJ1cHRfdHlwZTsNCj4gKwl3cml0ZWwoZ3Bpb19jZmcsIG1wZnNfZ3Bpby0+
YmFzZSArIE1QRlNfR1BJT19DVFJMKGdwaW9faW5kZXgpKTsNCj4gKw0KPiArCXJhd19zcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZtcGZzX2dwaW8tPmxvY2ssIGZsYWdzKTsNCj4gKw0KPiArCXJldHVy
biAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBtcGZzX2dwaW9faXJxX3VubWFzayhzdHJ1
Y3QgaXJxX2RhdGEgKmRhdGEpDQo+ICt7DQo+ICsJc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFf
ZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkYXRhKTsNCj4gKwlzdHJ1Y3QgbXBmc19ncGlvX2NoaXAg
Km1wZnNfZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsNCj4gKwlpbnQgZ3Bpb19pbmRleCA9
IGlycWRfdG9faHdpcnEoZGF0YSkgJSBNQVhfTlVNX0dQSU87DQo+ICsNCj4gKwltcGZzX2dwaW9f
ZGlyZWN0aW9uX2lucHV0KGdjLCBncGlvX2luZGV4KTsNCj4gKwltcGZzX2dwaW9fYXNzaWduX2Jp
dChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX0lSUV9SRUcsIGdwaW9faW5kZXgsIDEpOw0KPiArCW1w
ZnNfZ3Bpb19hc3NpZ25fYml0KG1wZnNfZ3Bpby0+YmFzZSArIE1QRlNfR1BJT19DVFJMKGdwaW9f
aW5kZXgpLA0KPiArCQkJICAgICBNUEZTX0dQSU9fRU5fSU5ULCAxKTsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIHZvaWQgbXBmc19ncGlvX2lycV9tYXNrKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgZ3Bpb19jaGlwICpnYyA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRh
KGRhdGEpOw0KPiArCXN0cnVjdCBtcGZzX2dwaW9fY2hpcCAqbXBmc19ncGlvID0gZ3Bpb2NoaXBf
Z2V0X2RhdGEoZ2MpOw0KPiArCWludCBncGlvX2luZGV4ID0gaXJxZF90b19od2lycShkYXRhKSAl
IE1BWF9OVU1fR1BJTzsNCj4gKw0KPiArCW1wZnNfZ3Bpb19hc3NpZ25fYml0KG1wZnNfZ3Bpby0+
YmFzZSArIE1QRlNfSVJRX1JFRywgZ3Bpb19pbmRleCwgMSk7DQo+ICsJbXBmc19ncGlvX2Fzc2ln
bl9iaXQobXBmc19ncGlvLT5iYXNlICsgTVBGU19HUElPX0NUUkwoZ3Bpb19pbmRleCksDQo+ICsJ
CQkgICAgIE1QRlNfR1BJT19FTl9JTlQsIDApOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGlycV9jaGlwIG1wZnNfZ3Bpb19pcnFjaGlwID0gew0KPiArCS5uYW1lID0gIm1wZnMi
LA0KPiArCS5pcnFfc2V0X3R5cGUgPSBtcGZzX2dwaW9faXJxX3NldF90eXBlLA0KPiArCS5pcnFf
bWFzawk9IG1wZnNfZ3Bpb19pcnFfbWFzaywNCj4gKwkuaXJxX3VubWFzawk9IG1wZnNfZ3Bpb19p
cnFfdW5tYXNrLA0KPiArCS5mbGFncyA9IElSUUNISVBfTUFTS19PTl9TVVNQRU5ELA0KPiArfTsN
Cj4gKw0KPiArc3RhdGljIHZvaWQgbXBmc19ncGlvX2lycV9oYW5kbGVyKHN0cnVjdCBpcnFfZGVz
YyAqZGVzYykNCj4gK3sNCj4gKwlzdHJ1Y3QgaXJxX2NoaXAgKmlycWNoaXAgPSBpcnFfZGVzY19n
ZXRfY2hpcChkZXNjKTsNCj4gKwlzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgKm1wZnNfZ3BpbyA9DQo+
ICsJCWdwaW9jaGlwX2dldF9kYXRhKGlycV9kZXNjX2dldF9oYW5kbGVyX2RhdGEoZGVzYykpOw0K
PiArCXVuc2lnbmVkIGxvbmcgc3RhdHVzOw0KPiArCWludCBvZmZzZXQ7DQo+ICsNCj4gKwljaGFp
bmVkX2lycV9lbnRlcihpcnFjaGlwLCBkZXNjKTsNCj4gKw0KPiArCXN0YXR1cyA9IHJlYWRsKG1w
ZnNfZ3Bpby0+YmFzZSArIE1QRlNfSVJRX1JFRyk7DQo+ICsJZm9yX2VhY2hfc2V0X2JpdChvZmZz
ZXQsICZzdGF0dXMsIG1wZnNfZ3Bpby0+Z2MubmdwaW8pIHsNCj4gKwkJbXBmc19ncGlvX2Fzc2ln
bl9iaXQobXBmc19ncGlvLT5iYXNlICsgTVBGU19JUlFfUkVHLCBvZmZzZXQsIDEpOw0KPiArCQln
ZW5lcmljX2hhbmRsZV9pcnEoaXJxX2ZpbmRfbWFwcGluZyhtcGZzX2dwaW8tPmdjLmlycS5kb21h
aW4sIG9mZnNldCkpOw0KPiArCX0NCj4gKw0KDQpNeSBjb25jZXJuIGhlcmUgaXMgZm9yIGEgcG90
ZW50aWFsIHJhY2Ugb3IgbWlzc2VkIGludGVycnVwdHMuDQpBcyB0aGlzIGludGVycnVwdCBoYW5k
bGVyIGlzIGdvaW5nIHRvIGJlIHVzZWQgZm9yIFsxLi4zMl0gZGlmZmVyZW50DQppbnRlcnJ1cHRz
IGF0IHRoZSBzYW1lIHRpbWUsIGFueSB0aW1lIGl0IGlzIGhpdCBpdCB3aWxsIGNsZWFyIGFsbCBv
Zg0KdGhlIEdQSU9zIHBlbmRpbmcgaW50ZXJydXB0IGJpdHMgLSBldmVuIGZvciBHUElPcyB0aGF0
IGFyZSBub3QgdXNpbmcNCnRoZSBpbnRlcnJ1cHQgdGhhdCB0cmlnZ2VyZWQgdGhlIGhhbmRsZXIu
IEFnYWluLCBtYXliZSBJIGhhdmUgbWlzc2VkDQpzb21ldGhpbmcgdGhhdCBlbnN1cmVzIHRoYXQg
Y2Fubm90IGJlIGEgcHJvYmxlbSwgYnV0IEkgd291bGQgbGlrZSB0bw0KYmUgY29udmluY2VkLg0K
DQpUaGFua3MsDQpDb25vci4NCg0KPiArCWNoYWluZWRfaXJxX2V4aXQoaXJxY2hpcCwgZGVzYyk7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGNsayAqY2xrOw0KPiArCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0g
cGRldi0+ZGV2Lm9mX25vZGU7DQo+ICsJc3RydWN0IG1wZnNfZ3Bpb19jaGlwICptcGZzX2dwaW87
DQo+ICsJc3RydWN0IGdwaW9faXJxX2NoaXAgKmdpcnE7DQo+ICsJaW50IGksIHJldCwgbmdwaW9z
LCBuaXJxczsNCj4gKw0KPiArCW1wZnNfZ3BpbyA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigq
bXBmc19ncGlvKSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFtcGZzX2dwaW8pDQo+ICsJCXJldHVy
biAtRU5PTUVNOw0KPiArDQo+ICsJbXBmc19ncGlvLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiArCWlmIChJU19FUlIobXBmc19ncGlvLT5iYXNlKSkN
Cj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKG1wZnNfZ3Bpby0+YmFzZSks
ICJmYWlsZWQgdG8gaW9yZW1hcCBtZW1vcnkgcmVzb3VyY2VcbiIpOw0KPiArDQo+ICsJY2xrID0g
ZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7DQo+ICsJaWYgKElTX0VSUihjbGspKQ0KPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY2xrKSwgImRldm1fY2xrX2dldCBmYWlsZWRc
biIpOw0KPiArDQo+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNsayk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZW5hYmxl
IGNsb2NrXG4iKTsNCj4gKw0KPiArCW1wZnNfZ3Bpby0+Y2xrID0gY2xrOw0KPiArDQo+ICsJbmdw
aW9zID0gTUFYX05VTV9HUElPOw0KPiArCWRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJu
Z3Bpb3MiLCAmbmdwaW9zKTsNCj4gKwlpZiAobmdwaW9zID4gTUFYX05VTV9HUElPKQ0KPiArCQlu
Z3Bpb3MgPSBNQVhfTlVNX0dQSU87DQo+ICsNCj4gKwlyYXdfc3Bpbl9sb2NrX2luaXQoJm1wZnNf
Z3Bpby0+bG9jayk7DQo+ICsJbXBmc19ncGlvLT5nYy5kaXJlY3Rpb25faW5wdXQgPSBtcGZzX2dw
aW9fZGlyZWN0aW9uX2lucHV0Ow0KPiArCW1wZnNfZ3Bpby0+Z2MuZGlyZWN0aW9uX291dHB1dCA9
IG1wZnNfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0Ow0KPiArCW1wZnNfZ3Bpby0+Z2MuZ2V0X2RpcmVj
dGlvbiA9IG1wZnNfZ3Bpb19nZXRfZGlyZWN0aW9uOw0KPiArCW1wZnNfZ3Bpby0+Z2MuZ2V0ID0g
bXBmc19ncGlvX2dldDsNCj4gKwltcGZzX2dwaW8tPmdjLnNldCA9IG1wZnNfZ3Bpb19zZXQ7DQo+
ICsJbXBmc19ncGlvLT5nYy5iYXNlID0gLTE7DQo+ICsJbXBmc19ncGlvLT5nYy5uZ3BpbyA9IG5n
cGlvczsNCj4gKwltcGZzX2dwaW8tPmdjLmxhYmVsID0gZGV2X25hbWUoZGV2KTsNCj4gKwltcGZz
X2dwaW8tPmdjLnBhcmVudCA9IGRldjsNCj4gKwltcGZzX2dwaW8tPmdjLm93bmVyID0gVEhJU19N
T0RVTEU7DQo+ICsNCj4gKwluaXJxcyA9IG9mX2lycV9jb3VudChub2RlKTsNCj4gKwlpZiAobmly
cXMgPiBNQVhfTlVNX0dQSU8pIHsNCj4gKwkJcmV0ID0gLUVOWElPOw0KPiArCQlnb3RvIGNsZWFu
dXBfY2xvY2s7DQo+ICsJfQ0KPiArCWdpcnEgPSAmbXBmc19ncGlvLT5nYy5pcnE7DQo+ICsJZ3Bp
b19pcnFfY2hpcF9zZXRfY2hpcChnaXJxLCAmbXBmc19ncGlvX2lycWNoaXApOw0KPiArCWdpcnEt
PmhhbmRsZXIgPSBoYW5kbGVfc2ltcGxlX2lycTsNCj4gKwlnaXJxLT5wYXJlbnRfaGFuZGxlciA9
IG1wZnNfZ3Bpb19pcnFfaGFuZGxlcjsNCj4gKwlnaXJxLT5kZWZhdWx0X3R5cGUgPSBJUlFfVFlQ
RV9OT05FOw0KPiArCWdpcnEtPm51bV9wYXJlbnRzID0gbmlycXM7DQo+ICsJZ2lycS0+cGFyZW50
cyA9IGRldm1fa2NhbGxvYygmcGRldi0+ZGV2LCBuaXJxcywNCj4gKwkJCQkgICAgIHNpemVvZigq
Z2lycS0+cGFyZW50cyksIEdGUF9LRVJORUwpOw0KPiArCWlmICghZ2lycS0+cGFyZW50cykgew0K
PiArCQlyZXQgPSAtRU5PTUVNOw0KPiArCQlnb3RvIGNsZWFudXBfY2xvY2s7DQo+ICsJfQ0KPiAr
CWZvciAoaSA9IDA7IGkgPCBuaXJxczsgaSsrKQ0KPiArCQlnaXJxLT5wYXJlbnRzW2ldID0gcGxh
dGZvcm1fZ2V0X2lycShwZGV2LCBpKTsNCj4gKw0KPiArCXJldCA9IGdwaW9jaGlwX2FkZF9kYXRh
KCZtcGZzX2dwaW8tPmdjLCBtcGZzX2dwaW8pOw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8gY2xl
YW51cF9jbG9jazsNCj4gKw0KPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG1wZnNfZ3Bp
byk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gKw0KPiArY2xlYW51cF9jbG9jazoNCj4gKwljbGtf
ZGlzYWJsZV91bnByZXBhcmUobXBmc19ncGlvLT5jbGspOw0KPiArCXJldHVybiByZXQ7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiArew0KPiArCXN0cnVjdCBtcGZzX2dwaW9fY2hpcCAqbXBmc19ncGlvID0g
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICsNCj4gKwlncGlvY2hpcF9yZW1vdmUoJm1w
ZnNfZ3Bpby0+Z2MpOw0KPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShtcGZzX2dwaW8tPmNsayk7
DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXBmc19vZl9pZHNbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxlID0gIm1pY3Jv
Y2hpcCxtcGZzLWdwaW8iLCB9LA0KPiArCXsgLyogZW5kIG9mIGxpc3QgKi8gfQ0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXBmc19ncGlvX2RyaXZlciA9IHsN
Cj4gKwkucHJvYmUgPSBtcGZzX2dwaW9fcHJvYmUsDQo+ICsJLmRyaXZlciA9IHsNCj4gKwkJLm5h
bWUgPSAibWljcm9jaGlwLG1wZnMtZ3BpbyIsDQo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IG1wZnNf
b2ZfaWRzLA0KPiArCX0sDQo+ICsJLnJlbW92ZSA9IG1wZnNfZ3Bpb19yZW1vdmUsDQo+ICt9Ow0K
PiArYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIobXBmc19ncGlvX2RyaXZlcik7DQoNCg==
