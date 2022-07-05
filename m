Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF03566642
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 11:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiGEJiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 05:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiGEJiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 05:38:50 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4725E2F
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 02:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmfgi4/audekT/Tl2jMwjcJNzxi4/OHhNn0X0wcZ5ntKgZeeKyHgF2tjPtNOqH1wgRteZf7lwm5UrSOj0kmXd6uCyxSM9CqPw0E3BkNTZVEuQJN1esJpC6onXQ1rLaA/FcRzY4VynoC4JR/CK9AooKNSO+xLslf/ps+y5sn+oDbEyWyGfiKtNkrFvKYVDSazSWYRPJTXnYdqFFPYrjLvP73sosCJvWMtmuyeRPjE/Y8SWhRfyF1wuv4SF292wT/up2hSkkMeuVLhwRRlWPMQx2i1s9hWtDOclYQX1o97LeOWkAez2tNXSrXWpOTA7HtqGJGwX3SMHv2AwkaR6WDAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Hy6UBz7cMY7jyciD87fyYR5RePM2BzXZGDsaP9rZi0=;
 b=CExI8hXaWTX3fXYd4r2Wpr+ctKB6Ze3xh7N2Ehvu7YVKQ/rg6tDIEnQrW17clVCGNIJXhvVlAZf+ddim86Ppkh9fbhKQKb4+WdhF6gpntP8ztrckIC1+R+K4Pka7udEVKJtHbmUKHQKHYk6WLU3q+URchN4ju+WP3whMASY+MH3RwGFPt1GEaoFWKqZPIfHCwlbmQkKQLYOf6kXbgMjjZVzoPPdLxSV9V4sB3w4JET6/IO7n5Q6xsd+8GFvEIz4lSLO5AlrPOYAq6mJ3V6petZsBrMy1gPMsdQUth01dWDk08xhv4Bl+NENFZ9oKGPCfmC7pY/6defWrJRmZkRQS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Hy6UBz7cMY7jyciD87fyYR5RePM2BzXZGDsaP9rZi0=;
 b=RiloqQIFjwdqPsuV141Tw9Al+kL/0Sv43RuW5leootDqKAyDfFZM9Ljkv6sWb8N1kInPAtbeoXu8sowpCPh9OfMrDJtiWIl4sa9sMHM/c/Kmck/sbz5YTcjkKhBBRo7eQZ0ar4Ex1W0CfDzUzCnI0Sw6u3CR71GZhZ3AFLn/IDk=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 09:38:46 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::fdd4:8557:334b:180d%5]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 09:38:46 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Tariq Toukan <ttoukan.linux@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Tariq Toukan <tariqt@nvidia.com>,
        Ran Rozenstein <ranro@nvidia.com>,
        "gal@nvidia.com" <gal@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Subject: RE: Compilation failure in gpio-vf610.c
Thread-Topic: Compilation failure in gpio-vf610.c
Thread-Index: AQHYkDzkYgUy3Lal90SXgToN/nmHVq1vWarggAABYoCAACoDcA==
Date:   Tue, 5 Jul 2022 09:38:46 +0000
Message-ID: <DU0PR04MB94173C29DF57E3AAAF8E1DD888819@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
 <DU0PR04MB9417B6725F58E34D55CA8DDB88819@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <f5e82266-94ee-b096-30e9-914d88fa456e@gmail.com>
In-Reply-To: <f5e82266-94ee-b096-30e9-914d88fa456e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2fb6c3c-4149-4ff1-ae08-08da5e6a287a
x-ms-traffictypediagnostic: DU2PR04MB9081:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sdre0u6PmiEuFwkgb+yUYfvpEM5yyQGzXogFR4gQeA6X1cRoGFP+Q73AjiBiBThKwwKLtdQxC2jm2Bv3REleYZUWaV6leE78Y84wXYe+xjjSO5hlPvjfwvUT0ruk/ZlJyG3Qc8owyda3ApLTESyJmhUD4uaaIXvAhkoPgWWRLicVwR+gnb+1+kzC7GqHhFA4xB5cI3ZIMRbeXYEGGcAbpaglaY4MKSNhXBgKmPscqomj6IaOxteLbf4E+Jxu5Q3wLbSxxE0t4LZYPowWhRr69kzMVvAyNdaXJWCEeNO0LLS6N3CCtyH7UKxqYU0+lyomxfjsB8r9wRYD1lEhrl5Gw7LYs3dPyYB2uQXnyAPIkc1+ZI3ot0BErpzU2oVb6kWfOj5JvPaatsUI9HGSvPMCc/NfgbdvBOuAj/ZpBjuSwtDSj5LyWoGx2WQY4HKkAQ2n5dMG4eQy2KobAuKx+JeyzSBgDBO3bXBbqUzDa9OpvClLCka0O+SJlnB28ZAMckAvY6iw3+FwD/7C3D95n+z7cQyJ1GaoCGchucYouj9Th2hMxvfcX765c9BJkYdw4knMsVfJZmeVwMoN43Sj6UilkGJ/WHal3jbXLwxcDrg3ZO+mhNHqlh2wfSLI948NwT/txXu2C8p5FXGAMw0ThgBJyjW6jDfYXBCrHLk6CEaIQy9asTRD7PUxKesY7Eij1Vm/eWU15IXFeQAezS+lxRL+9ZwPgLPhEnliK8G0ByPvSFzOsrvOg960vSpF4tGvjd3Yxinkc/1KpuGpvdU7/VNj+RvVsU38yHBu+WX/0XerXp6JNVeBYXDMu4LZNJ3AES8x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(64756008)(8676002)(4326008)(76116006)(66946007)(66476007)(66556008)(66446008)(2906002)(86362001)(38100700002)(5660300002)(122000001)(8936002)(38070700005)(52536014)(55016003)(44832011)(4744005)(41300700001)(83380400001)(26005)(53546011)(9686003)(186003)(7696005)(6506007)(316002)(110136005)(54906003)(478600001)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2ZrYzFyRzh2STNkMXNjZjYxVURvNSt4RWhGRDJEMzAwdzhLSmd1VVBJYmIv?=
 =?utf-8?B?MmtOMWdmdXIwc0xUU3pMdHRkMS9RdTZ2Z0xwWUR5TkdxTWZiN2FkY01JYU42?=
 =?utf-8?B?RHVBU2FFUTJJWURLVHhPTEJ3M2lGb2RRS0cyNmlEbTF5R0lEVnZ0RmwzbUpp?=
 =?utf-8?B?K2dGY0c0bjlhQnl5MTIrd3d4alB5VHlGaHFrQ0NIWmlOM1BsWGNPY2hSVnhE?=
 =?utf-8?B?Z00xQ21ISTM2cklwQWwrTERUK0g3S1RLSWJtb3VlWjdhcldzM3pKMkU5TWg2?=
 =?utf-8?B?V3ByWmxJcGYyeDRHZytwSUR1dmpncXNnS3Juc3lrTFhEN0Nick12QlUyK3Zr?=
 =?utf-8?B?aXpYYmVMVEZ6Y2xXNnd2Sk1PS3VORUNEcnZZWU81NWNrb0xqTTZWUEIyL2lQ?=
 =?utf-8?B?RnRHd1IzNkV5NHNuZzlSZHh0Q3ZRZFZGOVZZZlF5M2ZmR0NlT3N4ZTFtQ2Rh?=
 =?utf-8?B?dStVNVl6WUhkaDNKRTEzblFCRTgybUZoWE9QKzg0dy83bE11ajFyelJjS2th?=
 =?utf-8?B?aUNMcmcvMzE5cDg3bXM2Yk5wa3pyS0gzb0VTdEV1WFk1Q2ZlMHlRUkNxWi94?=
 =?utf-8?B?ZzY1RFlmTDlnMDl3S2pyNzVtejAvYnhaWStmZ3RxMklyUUhpekJzUk9zb0hO?=
 =?utf-8?B?YysvK1B0cnVyTUJCS1pKQ3NuWGI1Q2t4aXdRaWdRZXpnRkpoOTZnS2ZQRkpk?=
 =?utf-8?B?cVMwRFJGVzV4VkN0WWxGUDh0VEd1SThEVG02KytFWk9qN3VWS0Qva2JNcUZi?=
 =?utf-8?B?Z0VmcnZ3TXQ2cnl0U0ZtUVdoZndOMjFZemdrUWFuVUhoMnJhRUo5b2dqdWtz?=
 =?utf-8?B?NTRPQ3pQSFAvTGtVVkRzb3ZRVm9xK3RWU09hcUNlRTc4YjdwRC9kdkl3MXZo?=
 =?utf-8?B?U2ZGTnZpWC9rUStJUFdoK0VpMmxYSExwbldjajUzRzdBQnFhYzVGQ1hWL2E0?=
 =?utf-8?B?MWJuUEhRWFN0cVc0M3JKMkhYaDV6bWhyNSt6MncxRVp6ZzNXK3ROcmdYa29o?=
 =?utf-8?B?WmpnbVVab29hSE43SzE4cGNsZEs5dHJWZTU0bVk3UCtlN0poY1ZjVjdmQzZT?=
 =?utf-8?B?UGE4QndLWDRWczU1b1pxTklCbkVLalBlTUU2eVVRb1VBenRVWXF1ZEViSmZo?=
 =?utf-8?B?T1paYWNaVGc3SDdMWXdJVlhKc21CeWJObkdQMkZyTDh6ZEVIOEx3UVErenpo?=
 =?utf-8?B?L0VEYjk0dElIVkI5OVB6UXJvUFBqUUZtWExQNzVuQlNKOVFEcGtIZk5lRTQ4?=
 =?utf-8?B?TnpLMU1qRllOd3JGWTlTMDc1UnlRZUxwRmpJeTJTYmJZQllVRXRuK1pkQkNT?=
 =?utf-8?B?Q0ZJcDFJY0wyNlhkUTFkVmRIcUgveDlXcGJzNWkwckI3V0JiTjkwZHB2MTBU?=
 =?utf-8?B?NzZRY0JuRVRJcnlrRU54ODRDU0Rva1hodlFubG1OdjJTdjNMZ1kxZHQ1Vk1H?=
 =?utf-8?B?RDhIRThBdkRuSVF2eG1IVm5XYVNna2hOMGZ4a2o5eHQvbDF1NjZEeHJNMlFL?=
 =?utf-8?B?cHZKRWQxcVJlSG9XQmY1bHFDQWZxZ1c0Z3VxaEtoVVVDcm53ZGRVUzFJdFNL?=
 =?utf-8?B?SkRmWlhpQlJia25xSExOaW5IVHRydzVjdHZrSWwvNmRxamlmNktmYWpoaG5p?=
 =?utf-8?B?cWt4V3YvNjl4bUVNSVQyNmRnekJMb3BHbmVyL2VacHlsaWNwVnYvWDlpSzJ2?=
 =?utf-8?B?d3RqZkJPV3Y3VkdRSEJMVFRnWUNzTlVwVU9NREpwZzlibDdOY1lGb1lySHp0?=
 =?utf-8?B?VkNtM2hkOWs1TjFISFd0aUp6MXFKclJCbDlEMnRDL2FkR2t4RmRKV2tqNFNv?=
 =?utf-8?B?bFovTEY4TGdxYk1ORVhsM3Z2bjlxeVpzMTNaUDJKQURzSlFlM1NOMTdZV2tl?=
 =?utf-8?B?eTh2YS9IbzlzTGRwWTFUendPMTVUS3ZyUzVqTE56MnVrQzZJWDJNNkNqVXZh?=
 =?utf-8?B?T1QxWDhTZDZZelR1SmdFZ0tqekJiVWM5TmFkSmlZQ0xreFpxOFFGa3crRGVp?=
 =?utf-8?B?cXBHbEg2M1B3TU9tOHUrc05mdC80TWJMR3VoMEpCYkgvcmZpbmRFbE5PV0ZJ?=
 =?utf-8?B?dzRvWDdCK2drdmVyWFhXQ1MyUzltQ2RjMmc5Q3B2R2VHMjdySmpnRGFKZmJR?=
 =?utf-8?Q?uXD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fb6c3c-4149-4ff1-ae08-08da5e6a287a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 09:38:46.4863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/7cfmIPJSXp9aS+myucMHFsVpwrKYEvPu9gpBMv6MW/cmiyMfdEzBo7zGz1aCPjdAPTX+XqLlXVwNvYikwh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogQ29tcGlsYXRpb24gZmFpbHVyZSBpbiBncGlvLXZmNjEwLmMNCj4gDQo+
IA0KPiBPbiA3LzUvMjAyMiAxMDowMiBBTSwgUGVuZyBGYW4gd3JvdGU6DQo+ID4NCj4gPiBXb3Vs
ZCB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgYnVpbGQgY29uZmlnPw0KPiA+DQo+ID4gVGhhbmtzLA0K
PiA+IFBlbmcuDQo+ID4NCj4gDQo+IFN1cmUuIEZpbmQgYXR0YWNoZWQuDQoNCkkgc2VlLiBZb3Ug
dXNlIGEgc2ltcGxpZmllZCBjb25maWcgZmlsZS4gV2l0aCBBUk02NCBkZWZjb25maWcsDQpJIG5v
dCBzZWUgc3VjaCBpc3N1ZS4gUGxlYXNlIHBvc3QgYSBmb3JtYWwgZml4Lg0KDQpUaGFua3MsDQpQ
ZW5nLg0K
