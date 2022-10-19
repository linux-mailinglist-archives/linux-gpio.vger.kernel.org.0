Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 705EB60413B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 12:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbiJSKlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 06:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbiJSKkN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 06:40:13 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2063.outbound.protection.outlook.com [40.107.249.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E2915745D
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeeneaQeSun1/pc4qP2niZKJauiqJgUyTSuBtDE+wHqcy/aANa2QftJqRitPhqA0x/VGVPd5vjL4x1I6fX1AWFPg0LkQdEPJNEhf6YPHxb4NXeJc9KzPZuDlbxaOKMmrPLg23zcWSct/aLA9sPtlDBZyc+xHTDKFiDPxQhTsj9w+rneKp4A/OtMJrV5zpQx/a8K0G6wpxbp48DL3WSv8nsNTOGZgwag8ynnPKgT2Xv7HlOTr71JEoiAU+qbLFv6zmJM+QhYZJzbtR0io3e+VY5jIsWIPwBlsWdoIG3MumtqfvkjSMpHiVDAho8AvKyDniudi3AOYOdz0yyUEXC3E0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MbhRJVM9mg/tKLePrIoh15+ClRLzbcz+uc3dxoEYtE=;
 b=YQlrhZUETHOGc/d6wMIFlqdABkTaiM9v4k8wgTExKx6DEmj/Q4buXaADYUdTGy/Syq78PInKkxLxjMG9wWiuNPdllSm945tt+6G+F97gnGvQdIsdNHGDyKox6AWYJw0ONkGfLTLYTk8GdP4Qn0NtjxkNB+kx7321yadgk/F8VsSllLeIgUJDYL4c6qfxmeKdeA9eE2VjtnENU3YtWQEa9F01ClF0ey0kSo06OPLUFAbjucS5VCzDiP4C8FB76zdaHXI2HpZGu+5l9sV2HYslifajAGtRopmZ5zifL9pnVvaglO1LFjBzVc3iYo6jUA/hy6lXHfWpKVMnaa9cA4wt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MbhRJVM9mg/tKLePrIoh15+ClRLzbcz+uc3dxoEYtE=;
 b=D0VOeTluVTWIXI1/uY7urGfs5fH6Ljz7k4Mbkep3DxYs53k8lN1L5p8+viSNewn1wqW6JxtpLIUBlEK7uL6zds+wcTl22cV/mCjnpFjMVYfW7ktecIn9H6rQ21hCSY0efjAFWrlPpjIGqxCwyATSw4AlA6yAqqXxpdgdYJTJIJg=
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by DU2P194MB2200.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:49f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 10:15:01 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::2371:5129:3402:be5]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::2371:5129:3402:be5%2]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 10:15:01 +0000
From:   =?iso-8859-1?Q?R=E9v=E9sz=2C_Levente?= <levente.revesz@eilabs.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Martyn Welch <martyn.welch@collabora.com>,
        Nate Drude <nate.d@variscite.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for pca953x
 chips
Thread-Topic: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for
 pca953x chips
Thread-Index: AQHY3Kt5nf8h6S+hwEOB92T1CHT6kq4SZbsAgAB9ZACAAqmr6Q==
Date:   Wed, 19 Oct 2022 10:15:01 +0000
Message-ID: <VI1P194MB06553A18E489E4F456B0EBE1E32B9@VI1P194MB0655.EURP194.PROD.OUTLOOK.COM>
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
 <CACRpkdbVCw=b-Hot83UpqmzaBSYGT0VY0g3QcgHNaPke4=grgA@mail.gmail.com>
 <Y02RWJVvybzvNbaA@smile.fi.intel.com>
In-Reply-To: <Y02RWJVvybzvNbaA@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P194MB0655:EE_|DU2P194MB2200:EE_
x-ms-office365-filtering-correlation-id: 5f616bb7-5272-4238-1553-08dab1bac872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q1MWR6cybqo+jDPNJtDRRB5lkw0VL2FoZvgvQR8pZdNgCTJ9a7+/4o+tzTrP7VkVuxVWkpL2i512bHK/gvLmPdRuK8b71M7yVUyiC1yoctczI2i/t8Wu3dNfXIa2ZaTVKF5p/PnkcyUfp7EtkIcxTRs7nBC57gndekGJ+EBqKFkTsFz8VV9ni2wnxTBIskgyRnLTri7S3oU8Jw0GoCMQzEelwalZQRjF5iMOLBMBSRy7FVUqb4HRJSU8KFL7vbuwHEagVTSv0CFWm+KEx6OGFs1m53OVTyQ51NK7qnEIX9frIISa53u9jAQOaOO1zSjEuRA0qCsvsPQwwVeD2o7+UTjkeTf7I+F64qYPPf8sakrjbrLEgyPdiEv/PnlCOr+EhzWyloqdPLaa1lMe+rfXeEXnqs1PkfSKXwYV5Bpg7oM46O+2w/o7No5cI7MeVpJlUoTv6ueK8XOdowTTbpqKhaemQTa7cUM88ZYx4r50LvKr/xFDtldCIOQMsT/GzQKkdreaI25YeRAIG/WZssWgwjjV6r++v3oQtwBlWBRgc+gaqA8g1s8hKO9ke14j0CSnoI8zso4zxjIFkgWKP1XDvb2qDyLyRhLV81Zra1tY9nXkHFne9qeAj9blY/RsxD553wcIin4t8WZTdpDabwYelzEZoBRUD7n8MYLyquaflPq68hh1rTdoP/Epi5Scib+2cFJ8UiPrZqpSLo14T1vbF5mVDPk/wzFR6xF8JuiQ8eKx4pa6O3L2iibT9whgfAfM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(136003)(346002)(366004)(396003)(376002)(451199015)(33656002)(86362001)(122000001)(7416002)(38100700002)(2906002)(4744005)(5660300002)(8936002)(54906003)(186003)(71200400001)(38070700005)(478600001)(6506007)(53546011)(4326008)(9686003)(7696005)(55016003)(26005)(6916009)(76116006)(66946007)(66446008)(66556008)(66476007)(316002)(52536014)(8676002)(64756008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aRsjX6CcEMc8og9JAS4C/BHio1Jvx5p2FfE1Br+4TcK25Ynhly7XRg9zok?=
 =?iso-8859-1?Q?OD0FtFc/UykOo5guK40Q5u1oZaOmVqw9+Hlk2UP/TG+tanVf4uypVDfM7d?=
 =?iso-8859-1?Q?4Ier4iKghBzZ4eoDRnbM+oVVuUyFVTQZT5XM/Z67yfx9nM0zyR0ai67pZF?=
 =?iso-8859-1?Q?BsZjxFjo/+beQd00aDdg8cu04oLl2xVqejyk4d5woraloNt09oDx8ywO26?=
 =?iso-8859-1?Q?Xf8KC2CAFRFfC0tNoLawUDpLerQxpvJvKEPURV6GNqCq77uT8+3EC6zoPi?=
 =?iso-8859-1?Q?VeTDI54AiWZBQpvyFFoPa5vmtTgVgoNh4nyLh5JDAQa8TR/m4uae2U15kB?=
 =?iso-8859-1?Q?/4nj9cqrMBPwf3AC9YCYwnBuujdRX+Gp44QrVI8QQMppUL2bolCvx8iFm4?=
 =?iso-8859-1?Q?ZFxU319dvqcQur95pMBY9EvKpdGHitGOMl2nHQDGeijfuzfCgQjHbZyJyN?=
 =?iso-8859-1?Q?l34US95DHO+df9jjzzr/mQo/ln+PLkv4bdIOje695+pAmCb5g6svGmb5WG?=
 =?iso-8859-1?Q?q/fQU1mZDJHZ4oPzgkBytIu46Hk7Wmb9asTvdtrSJrYvo38o5cnJBQYwUE?=
 =?iso-8859-1?Q?qP8mVCZ6hV3ix6ZtWshC972Y7SQKrstlFh1LfNBD0Ee0PuxpuPoCrG7KRB?=
 =?iso-8859-1?Q?FhdlQ0L5MjVK+3CqHDzxBgFrzzTWhs5pugzcFyiVw7zxQ1bNCyujoRI59S?=
 =?iso-8859-1?Q?qto0DtKpzfNlFS7VQMwmLYrDjzK/4QqZig7t4zkFlT95NikelJ3KI2VKR0?=
 =?iso-8859-1?Q?yyBrE4kpNaO/+YeEcU8vinJcGSNzXbI89j3E8bZY6hlo2om7YP9F0NFqjW?=
 =?iso-8859-1?Q?spdqsVq3M6cuxF/KaZ4iyr/t51ygEauRNpiPts0pkNy+WmPfqhQdWgxsSO?=
 =?iso-8859-1?Q?4e55jFsGZbmhNTIFNWMsxnLUcFsBbXZzUtqMz9N/JKw/i1eVgechdGQWYm?=
 =?iso-8859-1?Q?H277hNmwChmjfusftagCSI83nfpQkp8eE2hSDr+MY8ZqZqVBOHuAdv37Z/?=
 =?iso-8859-1?Q?14O01w8/PAS0j18xurrb3BAfnH203ku0oAhTRQG99DOwsJEulOs2JB0nK/?=
 =?iso-8859-1?Q?xklGYFAQPAy0oVpBbX1r0/IvPyM0YakmzyopojQuiorokAaPfJ4RcLhe1Z?=
 =?iso-8859-1?Q?Omn0EsbmyB7HYmGZD9dll3Oz7kcCmDoBCywHvkoA04qVy4iFtr541wG/7C?=
 =?iso-8859-1?Q?HXdk1ZZ4BEMzrYNDBCDDaeVPjXfDki84VmJg8eWHMBw7+zhvQP9AlPab5t?=
 =?iso-8859-1?Q?0X2Ee7eikBdGpJWMytgUw9IucZ4KQmh6MU2LY2ghHD6JKOnMvk570UJcmQ?=
 =?iso-8859-1?Q?P+eda6WvSw8B6Qw638t9alNL0g8UwucJ6T5niKQInrzBnVWU8Wy37Wl8eS?=
 =?iso-8859-1?Q?Scz8HoQMijG1qErV4FOI/byPRIbCw04/wWhWCgtaY+epUggkVhMeIXgKfB?=
 =?iso-8859-1?Q?BxJR5rtGiNQEZFI+e4412o1PMq6Al9bnGtcpww4w/ydM3NAtk47/zy/aFb?=
 =?iso-8859-1?Q?A6du02oE/ZflHph09E3FVd2Utg7mx6ME9sBfyFQ/6o9j5qwFcHLXrkBWAy?=
 =?iso-8859-1?Q?cMnS4Pk8G4gqFjq/4WTD8HE0EMm33lWOTDse21hPZ/a3DzTjth7x6VAhcQ?=
 =?iso-8859-1?Q?q+5nAyvDLdQfBqgH0os3FAD2DzU0bozbJe?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f616bb7-5272-4238-1553-08dab1bac872
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 10:15:01.1144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khHTyb0uzMXUDZSk6lelngL0EROcf+uxK1GTKa8Ve9IWYQXxm0yx4U29/CpBcTb2NPDRVIrHLkuzJ3VeWTihH19EUjYEmoXl78hS10B8oec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P194MB2200
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Monday, October 17, 2022 7:31 PM, Andy Shevchenko wrote:=0A=
> At first glance I think this needs two prerequisite patches:=0A=
>=0A=
> 1) convert _TYPE from bits to plain numbers, so we will have room=0A=
>    for up to 16 types;=0A=
>=0A=
> 2) Introducing PCAL953X_TYPE.=0A=
>=0A=
> After this is done, the current series will be neater.=0A=
=0A=
Thanks for the suggestions!=0A=
=0A=
I have started implementing this change:=0A=
=0A=
    * Convert _TYPE from bits to 4 bit integer=0A=
=0A=
    * Define 4 chip types: PCA953X_TYPE, PCAL953X_TYPE,=0A=
                           PCAL653X_TYPE, PCA957X_TYPE=0A=
=0A=
The PCA_PCAL bit is redundant, we know which chip is PCAL from their=0A=
chip type. Remove the PCA_PCAL bit and the PCA_LATCH_INT mask.=0A=
=0A=
The now modified bits were also used in the acpi_device_id=0A=
initialization:=0A=
=0A=
    static const struct acpi_device_id pca953x_acpi_ids[] =3D {=0A=
        { "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },=0A=
        { }=0A=
    };=0A=
    MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);=0A=
=0A=
I do not understand what is happening in this snippet. =0A=
What should be the id?=0A=
=0A=
---=0A=
Best regards,=0A=
Levente=
