Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE9D77C804
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 08:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbjHOGox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 02:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbjHOGoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 02:44:32 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5113810C0;
        Mon, 14 Aug 2023 23:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmyhk0D1xzdr0LfJalmBvyd0ejzbGC4zvg1rubJchiut+iN0IZCiK0vqahXY95ghKs5dNSB48Y96pBvElWXo5WhCDVfMtDsmf6M5OTRIS/ibkJCMT4Pqcj//rBDeeyEWFqh80Ec5PQR9kZqUtIQ3CxSeqgOizY76QJ8DYKFzvdfQTnnZlG7tn8IqvHzNK1/lcVYyhlZnLDL8DZuJCVs0w9R1cWR7xFQEeq89XXNlFkbws8iE51rRtTVjd7XylU8Dz7H7mLLuX7lVXm9hHinNBJC6V/XBnmenE34ahogim0DLKfgEI901YbD/Nwg9tLiKMpBQ7UmWcOKCzU3nvqpBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4m5BT0t+b/5331hOfoCOeXBrbQX1bYwO7xvNkauYad8=;
 b=WpculqHfoCmevvQakkx+Aa82yZSgkJRvNk8R5SQx3b4tMpOmrBrKpNmKJs3qe7BYp2GjJftpDZNtcFTNJGuDaaAxPhoiOztKDVKWek0fv3WNv4Pd6WuqtXlY//3VL4DTAVO15PjLl4NGupDlLNGDoMslOernOCTfG5bO7PFg1NxX46Hx7L8Z3+IDxyP+p0ZBUdLh1/kX4ylDiFsXZwga1SCLatwtlYIGiGfBvdhpRr7YTGFeQdhaKWWEV/N33KRU6nMOQfJ5vc7aVMKAkbmtMUvMr+/KAAy5jgt7+ybF4HuDRG36OwhXszAZkeqCM6WNdxOPn/rpAwdCrfz/9FyRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m5BT0t+b/5331hOfoCOeXBrbQX1bYwO7xvNkauYad8=;
 b=Se0EzyCpINpr/RYsyfvpqhRlsnRo9CkUCLlrczqEe7Wy3Sjfp+Vk1Ecqi+ZyUzJk/pzPvQSYDX9+avBj079gFQxlo22/gjbKUFX/JS2vaMm/R+1czBfuwR8XJzLZV5WTAYoLUWsRooLcWAdY6CN+ar3E+3NS8QfRLLvoIuk0Rkw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSRPR01MB11423.jpnprd01.prod.outlook.com (2603:1096:604:233::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 06:44:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 06:44:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference
 in rzg2l_dt_subnode_to_map()
Thread-Topic: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
Thread-Index: AQHZzoBnsm/pWpI5Aky3HO0TXCjGta/qRIsAgACj0QA=
Date:   Tue, 15 Aug 2023 06:44:25 +0000
Message-ID: <OS0PR01MB59222159C2B7AB4C41E9EE238614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
 <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
 <ZNqTRrf2iC6xLvR7@surfacebook.localdomain>
In-Reply-To: <ZNqTRrf2iC6xLvR7@surfacebook.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSRPR01MB11423:EE_
x-ms-office365-filtering-correlation-id: 381f2a59-042b-4a5a-87af-08db9d5b1141
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DnBK4lZyNFoE1FHo3EaIrbccWW2iVKVXzyBlKGIk+DIoWE9fX/zfCxF45ZTSZKrENI2J30u2rMgetv+2nUljgV3xigLL89E7MYlgJVwrfbMAxdNfkYZw6rRnm25wIRcoxAkkJVg/jyq8/aiWXtoOv8s7K7ObFRsJrAWT2TE+bXAByr3siQJ2CihD1bWsZ8ihTPiCitseHokt829DwKv7XHwFXpdnidr+BBxu0zwZp6b+Dlz5NlixxaLhwm2fZZxYm80VA9Y/iqfRF9zPlOWeK952tN7sA0YO9Xjs0OpmHjkYmME9Sx6MU+g+14mnaPKj0en460hNklkD2a/6Xcll4TkyRJnS4WdvzsGYHd+ggKAzX78bKvaR93wfGZRyXmUde8XaXBKjI13ZTQoyi/RZW8nrJnXz9c9THZEMLc/P//+BunmMw5wrfrPmgZDrBu05PBoTYozWEDTjG/lDsE03mCZ/Mt4VjdDY3GgxmjX4aANvQihZ2Ahp8/IvuEO6HF/zREJHaQy3+x8EhmhnFqBUMlam8lB887szU0kXl37N6hReUd6US0YwPuVurMho591/znPUQvZgUi1nVv2Wn04VBPNzkCdgrDnWbBsC7D1kJow=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(1800799006)(186006)(7696005)(71200400001)(9686003)(966005)(54906003)(45080400002)(478600001)(55016003)(107886003)(6506007)(26005)(2906002)(4326008)(316002)(6916009)(64756008)(76116006)(66556008)(5660300002)(8936002)(66946007)(66476007)(8676002)(52536014)(41300700001)(66446008)(38070700005)(38100700002)(33656002)(86362001)(83380400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CZH2nIW4NA7begipWZ7INq19oSWUy/K0EDOdkZsLoZQxaqJ+FBshBotDEK7I?=
 =?us-ascii?Q?X3n83VRPKtRQUpMpZhp9kauYlfwd+/PfXEZAOtEO7jlMfSBDEcWF7n9g9P3R?=
 =?us-ascii?Q?Mo3H36ZXq1PzvEjnyO7JW8C/utYdVlDkLWoWNXRu0a8Y0SkhVTetYlEihPGN?=
 =?us-ascii?Q?gYSnzaSXuycdr88g4wXz695wfaYO0WZwYQ6O2Sw42HRnO17RvWvNKYzyoMFW?=
 =?us-ascii?Q?bpgQpuQVZZE9jabZwxr60UxyRCnV5qNJ7jvF42b2sCY+qKN6lYejA1TyDILb?=
 =?us-ascii?Q?JMoxvnKQbE9vpdfUEEWFeVxrH6sD/rnyuuXTLe4qVIN+HoIhdpGK5st3NM09?=
 =?us-ascii?Q?PilJw5/BamODkQYMjKZYXEq2AGDieKO3bDLyvJDDOTAXNtIpFEb8fVCaBaZ/?=
 =?us-ascii?Q?qrGUvUvnvM27GGScl3DKu02AZ+Slzmjv2BF5K3KMmg1SDGnM7LJW/urJ13MK?=
 =?us-ascii?Q?vbH7P8Mj+7i+RV2tE/FnRQf/fnqfTfNUXwOr5PT+HwMXuq7ThNyy4TEzgJGA?=
 =?us-ascii?Q?9A0yzY4JcLldR/z1hGa91g0w1QpqP1AnnRYRW9aohkUd4YVEu+fkqQZfbnCT?=
 =?us-ascii?Q?pv5Ek664n9irssdjXB+9fcP1L4bs0dwa6q6oXSIv+7GB5D6ow2z8AZAmDSOz?=
 =?us-ascii?Q?MfnKC9xBFb7+jx4p7BuDsHhQD08X7nEcNrt8j94OwJL5/ivzYAWUhhauk0J6?=
 =?us-ascii?Q?6z4qRnF3aNEgESZIf7OgesJrOxKszNNFAsimFK8Xe0NDSjBGwacNGu47PjgC?=
 =?us-ascii?Q?8hQ/grhC1YbyKfStJ2Flxd+lATC1nUwAfdVOaOOtv/j5FUQokKAbZWbXOKEQ?=
 =?us-ascii?Q?5Wj8kdi3+e9bcvy6/sq1LBga2r0Lvabc+A0Dym/EdkgNImX2cP0wIdQEsmBD?=
 =?us-ascii?Q?xFU0gS5T1nQw4E+Ei8DTw+lJhztBO320YLmMUpARMPSebv45QxAXX19MYdSX?=
 =?us-ascii?Q?UOZIi8oyisRUd50m2e0qtFflW9N0AvLDYEWS486Fxmwio5y8ijLAplut50Uh?=
 =?us-ascii?Q?iW9LRdsl4/k+Eusms4ahAC79rHtdKqlCDmicLIOICRWQLRVXRV64gjyXD4Ze?=
 =?us-ascii?Q?PKPdrKem4kfVN/jIZcOR0+3QqNqftEJxwD16UrrRCE/fE6LRMrbvyzb1z4uz?=
 =?us-ascii?Q?CxOZaT/7agU42Wvw6QS5WyXjLFO5V4z8YVrgYp/vGUFtGCNWyoF+WFlzKMNZ?=
 =?us-ascii?Q?thSkFNGa7NG/YjlfegcjmSfeITJfc7UNxcUoEuZ2K418vb4oyebQ+xgoxv6i?=
 =?us-ascii?Q?4gApz4mN4Cc8K6IaplZDyPwlrbNKY0JXTXpi1ntY+xUyPuyzmd+HjHcWTl6C?=
 =?us-ascii?Q?Qaw3rivjcDBj4AFwQc0jOleOFp2IBZ9o1B6UqYVdtVguIbg9OGfM1COUwVTI?=
 =?us-ascii?Q?NXSuqykDhZ7+rQ/l85mTcnbFnQLpemaNk/+Km9d057fLhttk1MGIUDUmyQnk?=
 =?us-ascii?Q?niEuvcDArrGdvTjWFDJ7J8IkaMxUtSZGtwZtDc3hhzx+VXZbLyZCH9SGOWzg?=
 =?us-ascii?Q?BL7H8ZmABNI7GCzDHr5Nj+fL8kshOh7CKheVs3IZDEcPzVKJQV7ChKeNH4vo?=
 =?us-ascii?Q?UPiRCxyOdYkqpL/tr47n/HPVRuekg7ySJwG+AL3P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381f2a59-042b-4a5a-87af-08db9d5b1141
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 06:44:25.9849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4XFPTQfOT31+qi91OyqwjR7LthDMRuXoNBy0bnAAhgKggZI95QFPTLkR6eYAS1rdAnGUVeOiQQhrhx1xBgiMYC1QAL2E/gCeWXdIYXQOfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11423
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
> dereference in rzg2l_dt_subnode_to_map()
>=20
> Mon, Aug 14, 2023 at 08:24:34AM +0100, Biju Das kirjoitti:
> > Fix the below random NULL pointer crash during boot by serializing
> > pinctrl group and function creation/remove calls in
> > rzg2l_dt_subnode_to_map() with mutex lock.
>=20
> > Crash logs:
> > [   15.310036] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> > [   15.354291] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> > [   15.870714] [0000000000000000] pgd=3D0000000000000000,
> p4d=3D0000000000000000
> > [   15.939989] Internal error: Oops: 0000000096000004 2 PREEMPT SMP
> > [   15.946285] Modules linked in: drm_shmem_helper rzg2l_mipi_dsi
> videobuf2_common display_connector gpu_sched mc drm_kms_helper rcar_fcp
> drm rcar_canfd snd_soc_wm8978 rtc_isl1208 can_dev rzg2l_adc snd_soc_rz_ss=
i
> renesas_rpc_if spi_rspi backlight ipv6
> > [   15.969077] CPU: 1 PID: 117 Comm: systemd-udevd Tainted: G      D
> 6.5.0-rc4-next-20230801-00013-gd1819ab30a54 #986
> > [   15.980351] Hardware name: Renesas SMARC EVK based on r9a07g054l2
> (DT)
> > [   15.986857] pstate: 40400005 (nZcv daif +PAN UAO -TCO -DIT -SSBS
> BTYPE=3D-)
> > [   15.993797] pc : __pi_strcmp+0x20/0x140
> > [   15.997647] lr : pinmux_func_name_to_selector+0x68/0xa4
> > [   16.002876] sp : ffff800082d9b5a0
> > [   16.006210] x29: ffff800082d9b5a0 x28: 0000000000000002 x27:
> ffff00000cda7080
> > [   16.013338] x26: 0000000000000002 x25: ffff00000a1f26c0 x24:
> ffff00000cda7080
> > [   16.020456] x23: ffff800081224960 x22: ffff00007fc2e598 x21:
> 000000000000000c
> > [   16.027571] x20: ffff00000b6c8840 x19: 000000000000000b x18:
> 0000000000000002
> > [   16.034686] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> > [   16.041799] x14: 0000000000000001 x13: 0000000000068a68 x12:
> 0000000000000040
> > [   16.048913] x11: ffff00000b092ff8 x10: 0000ffff803d1a68 x9 :
> ffff00000b6c8888
> > [   16.056028] x8 : 0101010101010101 x7 : 0000000000000000 x6 :
> 0000000000000000
> > [   16.063142] x5 : ffff00000b092ff8 x4 : ffff00000b093078 x3 :
> 0000000000000000
> > [   16.070256] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff00007fc2e598
> > [   16.077370] Call trace:
> > [   16.079807]  __pi_strcmp+0x20/0x140
> > [   16.083296]  pinmux_generic_add_function+0x34/0xcc
> > [   16.088077]  rzg2l_dt_subnode_to_map+0x314/0x44c
> > [   16.092682]  rzg2l_dt_node_to_map+0x164/0x194
> > [   16.097025]  pinctrl_dt_to_map+0x218/0x37c
> > [   16.101107]  create_pinctrl+0x70/0x3d8
>=20
> Submitting Patches says why the above is too noisy for the commit message=
.
> Please, amend accordingly.

OK, got it as per[1], this should be.=20

Unable to handle kernel NULL pointer dereference at virtual address
Call trace:
	__pi_strcmp+0x20/0x140
	pinmux_generic_add_function+0x34/0xcc
	rzg2l_dt_subnode_to_map+0x314/0x44c
	rzg2l_dt_node_to_map+0x164/0x194
	pinctrl_dt_to_map+0x218/0x37c
	create_pinctrl+0x70/0x3d8

[1] https://docs.kernel.org/process/submitting-patches.html#backtraces-in-c=
ommit-messages

I will send V2 with these changes.

Cheers,
Biju
