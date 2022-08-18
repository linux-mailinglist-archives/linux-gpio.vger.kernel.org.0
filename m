Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0B95980DB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 11:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237960AbiHRJaz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 05:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiHRJaw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 05:30:52 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::626])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F7EB14CC;
        Thu, 18 Aug 2022 02:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXnBJulDy/HyhrrjCA/OphI1ddJOwywaWpXDMgl8TWVYYrK6dMWsWBm2kxOHqLof07eNGgRlKk0vQREy+WeC2qjW06RNAOMdFVm77+tL7q8d0Mb3F5N+JC94bUUePl7Y/gQyhkEKrDupsVHtv4g3gtpO2YxL2atAbUUQdGmsM0dxiqm/+0Fo6C/z0ytdhtasXQ+PNhDWtB5WsnvH/qxBSKlqmOS9UtJNlrfolWRujMqWHywZrrk6uNzKEw1bL5Ymif+EJ6Fu8DHkwUnEvp31a8g+ADYAA4HR0B4wHyyET89Pb3fk6Tkg2WE3gzKMPPykArLXGjy8UPSZgVP+JogWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RStBYG+iuYoYxCN4gY4Z0e/U2SBotQh1jtIbs1UIryQ=;
 b=HQ8soL5ps+M/CK4SPo+GoOQ44tIx6ZrTawUPNxjTlHwWJzFtL0k4k3brVr59KTV4vXp4wMG/w03fSr2cJj2yir5N4/acmJ6Bm7Yvt8K8XQ7bXwNje3V17B0TYlAbWSPaEi5NFde7Uxxrkr6aesKBW3bKWXT4DdinXOGXQzzlV6XKCSUEzQst9d3ediY97CMq48t/2zrk9MjnAnoQSb3RtX4DF9OuQwADXlfNYKfsmZJdAPc0ZxAaDUTzYYbuYUh90XAarblEL0jaPqM/PuAaAlQy6jr9jhkqAoZ0BUA5gv5gnIzVy4N9LT4LKfPTH1HdOTDpDCS3s3Aw1mrQbAFvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RStBYG+iuYoYxCN4gY4Z0e/U2SBotQh1jtIbs1UIryQ=;
 b=Y1uMNV2rhYNRwqnqgc4zfyPog3dCrN1bNSTZeSlBUzF5G+fEVAAmJ1ElTAkkZdRRyGsEbyBzFUOI6OLWlpo4DZJaBYc4YBJULfiX50RcvFQD7j/rpl/iP0TRAEc28qwv+m8DkMMZtAQGmEjnpAnF2oqhekMq8KBl3Q7KZpf68Dc=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by DM6PR12MB3641.namprd12.prod.outlook.com (2603:10b6:5:3e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 09:30:44 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43%5]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 09:30:44 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "git (AMD-Xilinx)" <git@amd.com>,
        "mans0n@gorani.run" <mans0n@gorani.run>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: gpio: pca9570: Add compatible for
 slg7xl45106
Thread-Topic: [PATCH 1/2] dt-bindings: gpio: pca9570: Add compatible for
 slg7xl45106
Thread-Index: AQHYshdem46aveVGS0mEJqBjtQjDqK20WSeAgAAMdcA=
Date:   Thu, 18 Aug 2022 09:30:44 +0000
Message-ID: <BY5PR12MB4902F07B4A12C51094786C5C816D9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
 <20220817085550.18887-2-shubhrajyoti.datta@amd.com>
 <107c5c93-ee6b-e464-1b74-55877068e788@linaro.org>
In-Reply-To: <107c5c93-ee6b-e464-1b74-55877068e788@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-18T09:30:41Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5f9e2efa-7588-4f6d-9db5-cb086cf109d4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 928976d7-9995-4d98-80e6-08da80fc5365
x-ms-traffictypediagnostic: DM6PR12MB3641:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SiqMUnmeWdEJwV7drWgfF0mhH6/9zf/xht+dRFeLFTpiAogK/+ToFz8eaAk3o+O/Ekyl7duM2g7hHwMRa6Mb+/KFls/ZiR4dPGV52RmIGeboIyrfXwoK95TcblXYZGPv4s5lLxArZPcLWVGPXbbcKjk73UTDgPvK15yTnjvGpUSb5PXSBqo7fvDaqecHLHgLxIvtFAkPBPokRH5c5iylKC67DKiYdOBlnGw8UQMjzK+zoRTF91jXm+an+KRe4RJFc5IwszaeC6deAU5bVm18vH+1VgKfkKsauMTsL1V88t/Vk0Kcc7/ShTiY6oW2GWeAPKuNl5sDr3404UzMGEGTtUd5dyUtH3zVCZQOL3PopF2j3P2lAwIIQFdAJI6UBrZ5qQbNIBLVIY3BOLbKdentcc6DZvqHBLXeE06/TvJOX5Vjyn9tLf3GUbu1WyPuJHM5VpTcAx8l3tfWJUR5QrQTKBku8zcNJDnjG7Vx8BtU2lGrC6juWvu1onH3KEvwZJ+opS4rK+FCL7RzfbfGcfPLvLWyy9530w1poC03PIUdh/feHSRs2OEBYC7JcGVsErtRJkxKQx5ml+YQVr2sEo02TOPCFDSNEk6DBctBn9P5cQExdzoZYVNRK6dj0+Klzz26vdN7kEeT6wqHxCV2336XHOIglcNy/nj5nr4li0Z3FEGC6pJq/zUAD6VluKjJgPwwrzjpaC7Ef5jlrtfgFG3cVmMtp1YZh35sLzywqvPkM17E0gx2ZjNtKda+EAHEvUamowiIUqfG9OrddhXrfZNl8Tk13EKtStMEd5eQ5/NPh68=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(122000001)(38100700002)(86362001)(38070700005)(5660300002)(7696005)(6506007)(2906002)(53546011)(110136005)(71200400001)(316002)(54906003)(8936002)(64756008)(478600001)(966005)(33656002)(41300700001)(76116006)(66946007)(66476007)(52536014)(8676002)(66446008)(4326008)(66556008)(7416002)(55016003)(26005)(186003)(83380400001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0RCUVNzU0UxSWp1YVBBZEt2bVZZaHVRUmVxUGtnWHgwVm1LMnZiZUxnc0x0?=
 =?utf-8?B?YzJocFpObmhKYU9wem9BVUlqK2duNkJDVmVDc25iLzVyTURlK0hGSHNYSXhw?=
 =?utf-8?B?YTNUY25ld0pzUExhS1k3bEtxQ2VtYWUwY0xnVWNxQkpEemUxbHBIelZNdVRu?=
 =?utf-8?B?K3VyMGlReXpmcklzTE4zUHNGM1hzbHhDcEFydHRuRkltR3pyRzZ6OVh5QnZx?=
 =?utf-8?B?YTRjZ2E0bTFGQUJQaEtBaFlKZ1g2cWZUKzkvSnYxTW5TeGpsSXpvZzE0MGxQ?=
 =?utf-8?B?TThzbjV3THRobFR4NFF0TjJvTU4wZHpBVGo0UmhYMnJxdzlTYXJNRXBvTlEw?=
 =?utf-8?B?Q0xxWHdNNHF6RGFCa3lmV2pHZWdJQXE2OXJpUVJLSm1qQlJtVWwzRUQvOHJn?=
 =?utf-8?B?MnZVYVFKVXZtdFlaWkZEcXFldWYxUk9xaGZmdmh4M2lKdVRicjREbktTb0NL?=
 =?utf-8?B?ck84TUVYTllZS0ZuNGhlNnpIcHd2ZXVFcTdWSFRpUVlta29vTUVRYXJxZDJZ?=
 =?utf-8?B?bndseEZKWlBXVDAySkp0c0FleVNISnBab0RvMGU1MTZtdGxIUDl2aDkyYW9Y?=
 =?utf-8?B?dEZ0K3NxdytUYU54ZEVTWEtnM1F3dXkvQXVwbnptQWxVY1Q2dE1JbUlrbDFl?=
 =?utf-8?B?L3FmcXBIZGNDMmhFK1B2S1ZtYm0rRWlEdzA2b0ZRTWhnd0NYaXdmc2w2Q1Jl?=
 =?utf-8?B?ZUYrZDhQL1JSL2RZQXJVNjkyeDBuQ1lKS0t5bXI1Y05xeWhNTXU0d1RiTG5N?=
 =?utf-8?B?aWJPd3JPeXhSR1hyOCtiZTB0M3NIYmtoYXhCUUk4M1ljWXpLcG56SnJGemc1?=
 =?utf-8?B?L0xEOXNaSmFhVDdWQ1IvK2I4dkw4NE1GUnZBcHN3a2xMcWx4aHl2SEw5ckZq?=
 =?utf-8?B?THR1SUtCRWtMVmtQZlRPUUFDdy9XVjg3SWxoR0x1QjRjR0tmT3pWd3AvWjJE?=
 =?utf-8?B?QmdHOVYvU0ZzaUtXQnlKWElBSWhURnIzMzlRNFN0dDJpd1FzaFpwbXJ6V2Nj?=
 =?utf-8?B?Sk0vYThYcjhtQ1dVdFlPR2F5eWx1NVJEaTVjWkFyUW0wbm9GbXdGRUtXRDRa?=
 =?utf-8?B?WmI3ZkdPWkdtSlM2MnI2bFRYSTErWlBHN0hOUCtkcXA1TnJlV29FR1NkMWFU?=
 =?utf-8?B?N2twWGxOWHA1OGJWMDE2NFhHZk1QRitlZE9ZS3M4aWNKbGg2RkczaFk1c0Nt?=
 =?utf-8?B?MStxNHRNa2lSVVZLblBsbnM3bHdhR1M2bmtDcW03dGJIYWhTZSsxNktGcFFz?=
 =?utf-8?B?V3VkQUl1M3h2VmZwbjlaQWNjYnZQcC9UL0Y2cC9UanlLckthTG92NTcveW9n?=
 =?utf-8?B?a1pLNlR5YUNqNjExWmZkT0x2KytIL2pJZkUzcjhDKzB3Rk1EMlhSQnVhczNj?=
 =?utf-8?B?T3BDRERXTmdjQUxzV0FpVDVoSkJwM0ZMdHJJNnNuUTB0NXVnUkJiSDdnT0gr?=
 =?utf-8?B?eVh2YzFwanRnOXNYQzg4NUpZY0VuZ0RGVElTNms2NFR1Sk5OYytxV0ZyTlRH?=
 =?utf-8?B?eEtKNmlsZ2NQaWI1bXJhTndwMFNRQnZHZnFBL08vWUZVbTRMMFJ6Zm5JTm83?=
 =?utf-8?B?bGdwQUtiWHlHeXRSSzhiNWk5ZFhoaVA5UHpCOHFyUldqeUxMZjFlK0cvcUx0?=
 =?utf-8?B?bGpSOGY1WjhxTzVERGFVQVUyTldmL2Jnb1lUa3B6amxYd0owNUVIZXdTSUZZ?=
 =?utf-8?B?MVRKWGZncUFCdHllbnU1ZWhwNmdsQU5OKzU2UWtFWDVDYW1iSDNFUDZUcmJD?=
 =?utf-8?B?cGVMSVJTKy9lS09rZXE2WWRkRjdodis1THZlRUkzajdrdWVBMkhwQ1RlOEVX?=
 =?utf-8?B?dTg3UnVFUnVYb2JEV2xuQWliZmgxQUI0SEtXQ3haZFU5MUNGMjRlMFJHTlhZ?=
 =?utf-8?B?WDMzdXBOeTJFT0hycFNJdE9YbFJwZExBVGNBYmxrRE9Oc3ZabGIwODBnYWE5?=
 =?utf-8?B?YWxYdTFUbDdEb2k2VkF0Sk54K0RpWEptSVZ4LzBvM3BKZkErVFlzTEswR01J?=
 =?utf-8?B?QnRTc1k2VkFKNUswRC9hODEvbmJUL3RCa1ZPSmhxc0NqeU1ObGh0d0tyNkJH?=
 =?utf-8?B?TVN6M25rZzI4b3ora3RVTENWSzh2VzJEZkVBNTZkWDZhYkxNL3BlTy83cHpP?=
 =?utf-8?Q?/ddI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928976d7-9995-4d98-80e6-08da80fc5365
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 09:30:44.5152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJoMvO14Uq+Ty7iI0EJakTbNjVQM/T6b086oBK/Pd3cqvtKCVncYZFKgdj59RaCkTQG9k5MBcZmaYL4TXvDAKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3641
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxOCwgMjAyMiAyOjE0
IFBNDQo+IFRvOiBEYXR0YSwgU2h1YmhyYWp5b3RpIDxzaHViaHJhanlvdGkuZGF0dGFAYW1kLmNv
bT47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZw0KPiBDYzogZ2l0LWRldiAoQU1ELVhp
bGlueCkgPGdpdC1kZXZAYW1kLmNvbT47IG1hbnMwbkBnb3JhbmkucnVuOw0KPiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOw0KPiBy
b2JoK2R0QGtlcm5lbC5vcmc7IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgYnJnbEBiZ2Rldi5w
bDsNCj4gc2h1YmhyYWp5b3RpLmRhdHRhQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDEvMl0gZHQtYmluZGluZ3M6IGdwaW86IHBjYTk1NzA6IEFkZCBjb21wYXRpYmxlIGZvcg0KPiBz
bGc3eGw0NTEwNg0KPiANCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPiANCj4gT24gMTcv
MDgvMjAyMiAxMTo1NSwgU2h1YmhyYWp5b3RpIERhdHRhIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2gg
YWRkcyBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIFNMRzdYTDQ1MTA2LCBJMkMgR1BPDQo+ID4g
ZXhwYW5kZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNo
dWJocmFqeW90aS5kYXR0YUBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXBjYTk1NzAueWFtbCB8IDEgKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXBjYTk1NzAueWFtbA0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby1wY2E5NTcwLnlhbWwN
Cj4gPiBpbmRleCAzMzhjNTMxMmExMDYuLjUwM2NmY2I3ZjdjOSAxMDA2NDQNCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLXBjYTk1NzAueWFtbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tcGNh
OTU3MC55YW1sDQo+ID4gQEAgLTEzLDYgKzEzLDcgQEAgcHJvcGVydGllczoNCj4gPiAgICBjb21w
YXRpYmxlOg0KPiA+ICAgICAgZW51bToNCj4gPiAgICAgICAgLSBueHAscGNhOTU3MA0KPiA+ICsg
ICAgICAtIGRsZyxzbGc3eGw0NTEwNg0KPiANCj4gRmlyc3QsIHRoaXMgZG9lcyBub3QgbWF0Y2gg
dHJlZSwgcGxlYXNlIHJlYmFzZSBvbiBzb21lIG5ldyBMaW51eCBrZXJuZWwuDQo+IFNlY29uZCwg
cHV0IHRoZW0gaW4gYWxwaGFiZXRpY2FsIG9yZGVyLg0KPiBUaGlyZCwgdGhlc2UgYXJlIGRpZmZl
cmVudCBtYW51ZmFjdHVyZXJzLiBXaHkgZG8geW91IHRoaW5rIGRldmljZXMgYXJlDQo+IGNvbXBh
dGlibGU/DQoNCldpbGwgcmViYXNlIGFuZCByZXNlbmQuDQpUaGVyZSB3YXMgYSBlYXJsaWVyIGRp
c2N1c3Npb24NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUhwNzVWZV9tZ2FtMmpjeUZH
LU5nZ3ppVVNjSzNKQlo0Zm10TityamQrVnJhPWl4dXdAbWFpbC5nbWFpbC5jb20vVC8jbWUzZmI3
MGM3ODIxNTliMWMyYWVkOWNjMzNkNmViNGQzMTE5M2U1NmUNCg0KQmFzZWQgb24gd2hpY2ggSSBj
b25zaWRlcmVkIHRoZSBwY2EuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
