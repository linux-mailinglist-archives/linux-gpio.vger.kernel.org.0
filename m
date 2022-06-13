Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9595497B9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 18:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbiFMQXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 12:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240498AbiFMQWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 12:22:50 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E7D1C8657
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2022 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl3TLEfKeV8rBx/HeAK9Rbfk70RsZ9Gxh4IQLEyTe3XahH6RBsAajtcOMSatnmyLAk2kiprcsEGzLK5C71At7m62T8XRF6mN/A/kDqYOlwN6TfU2tiNnhDVHXvGthovZ6uEqv6GTbnyvj7W6fkB1RqjFdm9sLdc+3GySZmFvJnjoixPQ52D+ivWQy4JG3KKCiH2VMAR1X/dkiITmm4pM+ao/42hA0aYbrYlV/BK6bKPGizUMoNmbrTJEJ1R23wswLZcVPtsaI7QYuN7XucOTdMTNZMskHh1k9p2eugX5nFf4jtroFQf21H8tML1mNe+YpmH2Oqy6zB7r45DiI5/clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+piGHgC0EudIUHQEuJjC+ZlFaIdJ6lV1rFbVxTgTrU=;
 b=YUt62WmpEPv2l08+hF0v7PgJYoMkczX3j1rR1/6C8a3gtBn1yWPYWRWkGt/FP8aGRcUEdjuBG/juHfY4bjCMoEVKUY1Tj8tNPE1FPdzvL/5EdcfJJov+PL4GK4fQu38ud8rSUq2f+XD+a+l2ozGO2AEZriuqctCvQ1x/7MzkPsTV+O1Xf55LXF8gjsdO6gzRxktVrEvrCcR7UnXyx8j9sI5arIm1rx1PrnMd5QJkTYHlBqXuYUr2UbmA3dWSW0GhjRvWdwl52c06E9QTEoMOY8f5NJYbRm8LR/p37ERZojS7gHiGKxr9WOIGbaGZNbdeRSbpEic+hW/0mGLSbS4/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+piGHgC0EudIUHQEuJjC+ZlFaIdJ6lV1rFbVxTgTrU=;
 b=Z67XBfpu7OqhKEzzU8DHGvH8ICegSZet2qiJfOr3OTbQ49ETrpC2wl3jV55S55AM64oGPNaSNC/X6Kt1WvdN21Gi3JnZV2h3y2B9fEjVpZfeO5mQbqR4FS7Q8ASMSOroPLxoyxVFrJpTq21SsNkn3O1CD3Pq/J5GM/1XTPpR3X8=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB2812.namprd12.prod.outlook.com (2603:10b6:5:44::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 14:17:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3839:4183:6783:b1d1]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3839:4183:6783:b1d1%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 14:17:54 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Subject: RE: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status and
 wake status bits
Thread-Topic: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status
 and wake status bits
Thread-Index: AQHYfvDi5Ic0ku5dD0y7OsQXIfeNRa1NYoww
Date:   Mon, 13 Jun 2022 14:17:54 +0000
Message-ID: <MN0PR12MB6101592307B55649B8EFE47AE2AB9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
 <20220613064127.220416-3-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220613064127.220416-3-Basavaraj.Natikar@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-13T14:16:52Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=afe704f8-507e-4fe3-a344-bacd39ad3b2d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-06-13T14:17:53Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 37e8f47c-eb59-4df8-b923-e57117f71dd1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72f07922-b2bc-4bda-1ad5-08da4d4781db
x-ms-traffictypediagnostic: DM6PR12MB2812:EE_
x-microsoft-antispam-prvs: <DM6PR12MB2812023D244F0BF63138AC38E2AB9@DM6PR12MB2812.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AUVg00JcNSxZCkMokuozLuQuAuiF/TH95iK/BCGwMQTvh+6rjvs0lzcQDuYgrcqv9zWDgMD8ApUoubtqhRJ1fiV85FTmGHpA1FlP6cHSQJrEKqUVlNhr/mbBOAAWPylx24YAd+w0HozscFYyYAeQWpWnYpyCRT34QsPKQ9b1Mvi4h3bSz3NUGieX4+WjvTqdfv1ccJuexR3m7YDjLH4wFi9rPy73Hz+GUL0TwpPRVjUtZcI0WwZEvdptxLu5xP0CtOnFvZIJ2iUGKsoUQTI4O4q5NZSoWF+D6+zY7r5waAQs09SSWHXTaTlHNzduK2rVRblj6wr7Ae670BEKrkW5ROZijICX9C5z1JpQ7+6FN/cYT2RsFXoZZAWYD41l8aSxBGfN3pm2QhYvWsMQtHJf7IAaxgTwGnMU4mXdmUQqy0SVNDBq+cdsgMo8ElZHZut6NqbuDVdEelRonyYNKLO64OrqQ1qZJwShXL7pQyQ60Huy5IANQS+hEzxdvhTkNmUIrbCb+z6mChEMxbfnM9wBKzJftMlNge0Lc91HJh4yHMpIdoKspkJbwZZzP9oeRDfvAMPRa9oiP0C1UakQH6zNq5EtLvGFE8Qb2BNtAh2m5yWbdFOkh397dg6JcZ4Vrm+jIAeOgeeiauH07qerzONfyvUH96llC74/lURFXwtRJ/wVV2EyA94aW9eDxKnh3CTVzYFfpvDQKp+96lyakK3wTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(110136005)(38070700005)(6636002)(55016003)(316002)(76116006)(38100700002)(66556008)(8676002)(66476007)(64756008)(66446008)(186003)(83380400001)(66946007)(2906002)(33656002)(5660300002)(71200400001)(8936002)(508600001)(53546011)(6506007)(86362001)(9686003)(7696005)(52536014)(122000001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SA2WTqSMpwJUWAb+HqGrMzO8RpOTEUtcMozGwNRW3MnEzfSmKD68vwAUQKzy?=
 =?us-ascii?Q?nidI/u2Hh3hWXLJkg9Tuq8jowuCGcvmJ57QEiq7cQx7AHDntYgpWG6k5+v6z?=
 =?us-ascii?Q?f6Ndc/GRPEASPa4zWpoS/EoGXmmtT3gubKrQb1/l26lJMFuoZ3SNXxAXD/ko?=
 =?us-ascii?Q?B6z1aNJMmw+Lb+3feNCcFGL6aX5C8YAh75Wfd3bhzD+VyEem0JoRIT5ccG8M?=
 =?us-ascii?Q?nl+A4TcD4VnbuIbD3AdHXJUWzTpqwcRIiYRqMnI72sVsogHMXXsltUVWvfmB?=
 =?us-ascii?Q?Yf74bitJ6dXsHWwYyfTsksDwSo9/qRac7kvpTV5zdG/3bgOYVxR4L6HIRsDA?=
 =?us-ascii?Q?zysbeXhUvsGwfL2dODGg+IkDoBr3ImNFiggZTsoR/HuLsDKgfPx3MfB0+95l?=
 =?us-ascii?Q?ESZKe5mFyzAbo5PNVKtFryZi3w6lTf/1CvBgxe5fik0iZ2IAmeYMfd8tmAoM?=
 =?us-ascii?Q?f8sOxHBfVyK9hkA0rLXUww42Jk/UkzIXVoreBw3qF3RHFG2Cs64SO7voomhx?=
 =?us-ascii?Q?I9B2o8fhkl5TvzsyuYbI+eTKaKADoAUY95zw7gCp6qOsxc87QApFIYZYeA3q?=
 =?us-ascii?Q?Ylo4xbX0ZLyulFJb8O46AFrNSorVlpNk4EEYdpOaPrDfg4gZ2XnP9bbgZ1uA?=
 =?us-ascii?Q?wttMoCjM1GrVrGq5M+7OvlNlM0qI2BJZmsfZguxlz8IjYd4izIaQH7OrbFWH?=
 =?us-ascii?Q?Bqqm1TnKWtB3NW/SoaFz8eZ0qRBinPZwl+G2KWisKx0SD/qcQ+XXuqFltfMz?=
 =?us-ascii?Q?5iI54NyLAwRypJrHKJMGGUiYnvtZgfNA5qj5vpfoN3o4NlgqT642YMzlAAGD?=
 =?us-ascii?Q?J12UA1EHCKvFZwx2hx8Y6UvTxERXIcZ2oV5tQkYYn63WuubGzxvxfE4v/eZP?=
 =?us-ascii?Q?ervmZHiDrcj6kAI5Dteqr8Hn4ZleAOqKhBm0vOqIBxtFvr/c7k9S256wCEP0?=
 =?us-ascii?Q?MDdZG/8MzsAQXjG+KONyXBXIXSBPRDdPrHijA11nQNNeUfjaceCx8l1e7MGO?=
 =?us-ascii?Q?ZOs4v4ATozqRzS/CNlsqHFGcaj7ZqrRuXZaBvFj99IcySeee7JYxAi6jKx6N?=
 =?us-ascii?Q?YasMIZ8cidrLhMRZergtU8Kysf2yyvgthvBmqVUmfw8zYuUR6PODZrh1SBLb?=
 =?us-ascii?Q?DUMmUyfQhDrxF0qQV7QMCPDf1S2APy8fJJYs4MVRAYdtqMPa/vAVFl1CO4Dz?=
 =?us-ascii?Q?fiuWIuFpT0FydThxRck8qP8dwkEhxP4FyI84kUfXMdVY6uDUhRGiuYqYXEtl?=
 =?us-ascii?Q?/1w1uKN+w8ieBvpC5PH1I9ayAM3Aj7SBdqztgb4zeI42TC0yOReN0C6npCnk?=
 =?us-ascii?Q?qusoGgZiu1NeDY/wDsdR5CLHBvPAsaB/Uu35SaB2PrcI39RMQ8zX5j4j0CbE?=
 =?us-ascii?Q?/Sqsdk6c/9ScQvgDR5eBSIkY7p2eYrBp/odb0l+oJnhpSdAYj0YghYBOiPFd?=
 =?us-ascii?Q?90S4JjyYGO4/gcMeL4J+XwBLppklradOYQZPs592jrcrfT3JajL/jo1Rrhsm?=
 =?us-ascii?Q?g2owUZDkEh0C9THZ0F1nV7M3CBEKM1p0SogWaFHVtpRMNZzYx2c6FJI3s6aU?=
 =?us-ascii?Q?PMiHFUM5tOHvzJbkM/jWXWhR/dqJoUwGGGvuttwRpgcQLtwI1yuFGiFfFl/y?=
 =?us-ascii?Q?r8R1sqZgzmwKVKirWhMMqYf6viIRz30y9Fa0/rsqcbWz4rgbQc9nb+FnTJZn?=
 =?us-ascii?Q?Vcsmv3NOj7ANGE6pyYPOtJc8ClILUrV99JQfoRVQ1jvMkhpr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f07922-b2bc-4bda-1ad5-08da4d4781db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 14:17:54.2358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Arxmivne2J2JzRTdQ8GKQm3w4cSrGGgyfFm/IMYa2QoN3+GTXpym4rdpenYVk8ow2SzlTunuumcMZkSDeIZBWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2812
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[Public]

> -----Original Message-----
> From: Natikar, Basavaraj <Basavaraj.Natikar@amd.com>
> Sent: Monday, June 13, 2022 01:41
> To: linus.walleij@linaro.org; linux-gpio@vger.kernel.org; S-k, Shyam-sund=
ar
> <Shyam-sundar.S-k@amd.com>
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Natikar, Basavaraj
> <Basavaraj.Natikar@amd.com>
> Subject: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status an=
d wake
> status bits
>=20
> Saving/restoring interrupt and wake status bits across suspend can
> cause the suspend to fail if an IRQ is serviced across the
> suspend cycle.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

I think this should also pick up this tag:
Fixes: 79d2c8bede2c ("pinctrl/amd: save pin registers over suspend/resume")

> ---
>  drivers/pinctrl/pinctrl-amd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.=
c
> index ff3d0edbea48..40e23b5795b0 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -917,6 +917,7 @@ static int amd_gpio_suspend(struct device *dev)
>  {
>  	struct amd_gpio *gpio_dev =3D dev_get_drvdata(dev);
>  	struct pinctrl_desc *desc =3D gpio_dev->pctrl->desc;
> +	unsigned long flags;
>  	int i;
>=20
>  	for (i =3D 0; i < desc->npins; i++) {
> @@ -925,7 +926,9 @@ static int amd_gpio_suspend(struct device *dev)
>  		if (!amd_gpio_should_save(gpio_dev, pin))
>  			continue;
>=20
> -		gpio_dev->saved_regs[i] =3D readl(gpio_dev->base + pin*4);
> +		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +		gpio_dev->saved_regs[i] =3D readl(gpio_dev->base + pin * 4) &
> ~PIN_IRQ_PENDING;
> +		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>  	}
>=20
>  	return 0;
> @@ -935,6 +938,7 @@ static int amd_gpio_resume(struct device *dev)
>  {
>  	struct amd_gpio *gpio_dev =3D dev_get_drvdata(dev);
>  	struct pinctrl_desc *desc =3D gpio_dev->pctrl->desc;
> +	unsigned long flags;
>  	int i;
>=20
>  	for (i =3D 0; i < desc->npins; i++) {
> @@ -943,7 +947,10 @@ static int amd_gpio_resume(struct device *dev)
>  		if (!amd_gpio_should_save(gpio_dev, pin))
>  			continue;
>=20
> -		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin*4);
> +		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +		gpio_dev->saved_regs[i] |=3D readl(gpio_dev->base + pin * 4) &
> PIN_IRQ_PENDING;
> +		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin * 4);
> +		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>  	}
>=20
>  	return 0;
> --
> 2.25.1
