Return-Path: <linux-gpio+bounces-668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061657FD8A9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A86B2159D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 13:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70F421364;
	Wed, 29 Nov 2023 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qE31M3H4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A21CA
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 05:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7+A2+t9rz7gCFW3VXkp768KvJpxMqMsPuDZrCFUHSetuS8j9U4SOvPnJOlFxaLn9BVOShnn052QCOhhf6FQSI/vp6LFWCvqQBeSPMEvsmfrHGBec1uRu8U3nF+F/6ibEhGA/uPtzkaX/Nq1NgutkJPBO+dYM6YszyUPcn+0Ssmy1FUYNhYWGRBwxBlizGQOKhfRU/CFmTHvbEWG1KxljGCDB+ICb6LlF8Syz9LHgIzA0bz9cFuB5qBaI3jYBVN1g4HjN3ddSRWJmt1NEEQvfpBwD6h/3GqDKvk17mRu3l+ze5RTZkS3v+i4F5Ov6Bd56aPZV1Al5o3PuPZ1o1xpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpkss2jgGZc2U2Q3Hs4irT9ecf/U7yXX7w0zlZNq+O0=;
 b=AnWlboxUwWbJAgjZMip78QKzY5cSfhMLgWG/qD7EQuWbDdeibs+n2bWt7cqeRpCK29he7k4f1wIByl9WTYD/YnHQcXHUNsyDxj1fLEN+GHv05ar6SdmMLCJPaI2Xph+/hLvjbGlhpacQfcNC5utITvznj9iHT+161AoJepQ10/TNgXt+zZztiDxAWpMJ+fPcUYIFi+o66YdkzxQadmMIX96V9MYu0e7W54lV/To8bwx6Wa/SoG1BYJ9gHCWj+U5cnocmL6jpve3yFHJ+V581awWpYiW3FDB/+PPAfuNpC5skK90yL+q/ORTbqHRVYasCU/dIfzNE72TcC4RbC2dHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpkss2jgGZc2U2Q3Hs4irT9ecf/U7yXX7w0zlZNq+O0=;
 b=qE31M3H4o7/ykCFKJy9IMKsny2rMDaa0C8ilnjLPSuPT+9MM8hlBinkj0nLjsw65v8QJQR3Si1GLnUdTsVIJN+GtllfUUfaM9x7fjUJfiH2nmQQ9+r9+f45sqp++bbk2s+7QHTrvfDmpkYkU9jOQd4zMnA0J+HMaZbi+q7M47Q6zqdIPmZ7R0FoO1VzCcFDZG9x/vZ7Ut00TlSJ4ZyYoUx/emk3Jmu3MpWXTfbV5DV1nqZiiZy22pKPzByBviRWuLT6YdH9qZmP3tF+F/TyQOgB5z4cQ8YLtoSlyYZ519YDoFIQ33n+mCx/HUkqYqmmpXIt6Q3K3/YNjJu3LoP/JcA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 13:51:43 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7cf:41d8:783:8fb8]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7cf:41d8:783:8fb8%7]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 13:51:43 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Yang Yingliang <yangyingliang@huawei.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
Subject: RE: [PATCH] pinctrl: mlxbf3: fix wrong return pointer check in
 mlxbf3_pinctrl_probe()
Thread-Topic: [PATCH] pinctrl: mlxbf3: fix wrong return pointer check in
 mlxbf3_pinctrl_probe()
Thread-Index: AQHaIm1o6OwihPff+0ayCQDitpbDrbCRUWkA
Date: Wed, 29 Nov 2023 13:51:43 +0000
Message-ID:
 <CH2PR12MB3895B698A57D78952F84145FD783A@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20231129024425.4049758-1-yangyingliang@huawei.com>
In-Reply-To: <20231129024425.4049758-1-yangyingliang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|CY8PR12MB7313:EE_
x-ms-office365-filtering-correlation-id: c266b67a-d70d-4197-7c4d-08dbf0e2522c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lMIJUfMUJS/jlYMzXfeADXK33ADpPuORWs6dKrMKfvNuB9e14x5PZ3tx4PONEGuxKwZnsXW62jHc194VHwOm/7wuxeN2XUOibH7O6qrfEqW3LU9C8K2hM5OSWGc58yP/a0H96Lc710tv0zJcA5p/VnYP5JqIcAPfd9YSJ0nYt0LIK8U//vs0Ss52EBmdIzsVHjalkMJK37UTymkAk0eGHvUUKK6YgZqDTpJnBONay7gpBy3Kw0TCwQS2uUE5qBEesLG6R9Q5XQQpVsY9RwdhUy/58WfFboFLkjk1HCbKSEoN6QhfQIgOKewUpZqyfmBb8rqXACd2IFtRrQzJ/Zi9iwAZ931/nTwmbKLYjDS3xiFL+99Zs9nIkUmEuHnWx/day9C8w3nV2aqsTAILLl3qBnlOo4sIyyhs0TRb92oYWormLt7JjzkmoiZkv8Ym5bBTJ6s3a00NMmI8HpdVDWh8zofggzUwQ9limz8PGx2F0QNsIFyMk4tU5HpyyRkdx6vl5wAgtL56eXMqy2INJJ3/aLyQPkMGRfqfYZiSTLJLemuVPiaWNJOawxqoe541mYgj2sWkJH4dDs3PnM8+TWfRsSUlFZKRB1jxSJfTdxDFfAyUbkRSfZ32GILxBKnSGDkb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(52536014)(316002)(41300700001)(55016003)(53546011)(110136005)(66946007)(9686003)(54906003)(66446008)(8936002)(64756008)(8676002)(76116006)(66556008)(5660300002)(4326008)(6506007)(478600001)(71200400001)(7696005)(26005)(83380400001)(66476007)(38100700002)(86362001)(122000001)(38070700009)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PsmUoPrvU9/Icw4XMemRTql6LkRDeHyC4BCJXKYFumH95ye3BK0ZgzZ2jg7V?=
 =?us-ascii?Q?J4bjJW6qzO4ZML19k0Dd+Mrkz6q6QvEzUbpLZAm14dZz2k42Z/VJv9QMqXwd?=
 =?us-ascii?Q?95qzdOlzE7BcbObDg3B5htRpZVyj+MKm16XaoLvzMuoxntBDVySEItzaDTl9?=
 =?us-ascii?Q?NrnCEbfYd2xBtkKxcygEFnAhM7ixDl3Acia3XBlQ7P0E549zgrWwe+2OZTeD?=
 =?us-ascii?Q?zz/DXrhvjc74txRxXaWYlWqvspLtNccPxAy/Jj8SZsrdjUEsWM/sGSWTXLLU?=
 =?us-ascii?Q?H4aMcK6+ToKWJusuF39Lua3QevQskkbVmgG2NtO9c1/SEy6sq8SsZgun9bEp?=
 =?us-ascii?Q?f3GKYLQ7MTLg7o92PukBMsUnt+iDG/Jhef1m7upDdkNsyWsLXBDUyHtoWV8q?=
 =?us-ascii?Q?cNtmVjTVGbkvjdaCiR1k+m9FcortO7xLOkZ0i+3aMabJ35HKvyfCBJfy1yzr?=
 =?us-ascii?Q?6R1dDObAeFOPDapRkNwvNV7+tgxkC2JBLrJTgxVgjPsiXajJ7PXLmnWGKpPB?=
 =?us-ascii?Q?xRfNAxxA9u2O09BqpO3VPm5VT4XTuJWN/pEQA3g01VpYeAKpRflLuT7Lm4B6?=
 =?us-ascii?Q?Ul9FwTN8NAPlo4cHMIegDidQg9YFwcdMCzYyCdc/XH1p7LsAyCVweLHkWl+z?=
 =?us-ascii?Q?kQOw2C2V4aRZ5MKHui8ZTnKmicIquMpqPPBpbJuReZfR8dR5Bg6MlVgkTgiG?=
 =?us-ascii?Q?43SuqLcmPuK3vugUSmvgMcwSGdUYWcTVc4naqIddGKXDu9gaOVlP+a9Db0K2?=
 =?us-ascii?Q?Jy0WPXygt11y7owlGFRUZYfUgeYTb1zkg7lDUUDL4E6sIDDZ4IxgbbcMtSgk?=
 =?us-ascii?Q?QK/3qx/qPcXxCcMr3Uiow5CSxTDzCF6jEIrr6bfb2ReeU4soMe7CbuBbIloc?=
 =?us-ascii?Q?SlSBnmVZv141TDF1GFcS7vdf5kSy05QpvgyX5k9NsJ6jTyUox/7rHHT7/Dri?=
 =?us-ascii?Q?BJ3k0M0+Mx7g1Ad+ejfNM1HgCdYsnLswhDH3Qb7SLgEQ8Um0hiULP3WkOz01?=
 =?us-ascii?Q?Ka0ajT0r65xbAdBvCafkbxW7MPgZ6nSCuqhoKfWTfAz/gTrKfrdGlMMp2RWn?=
 =?us-ascii?Q?tkPYmupnIzpvVkeSVIuvQFnEhaf6oG7fp49iqg7+VNdIYuGEt3ewKtikkZL4?=
 =?us-ascii?Q?JZVSD7MkjAKBkfubJKUBRj65eTgrHIuevk02zGBjykUusmGTbC2h8KZVCNxB?=
 =?us-ascii?Q?f1ZhPBYeCAAYlXKv2tQz0YDQKYnYJp10MKHRrppLkfXsGy6OloRZFwmv3P4A?=
 =?us-ascii?Q?hJYMXKYAAvhPHl4KVp9i4Y2xbWSKLqLbd4oSeB+rQitVKstYG5wjjv4cLE10?=
 =?us-ascii?Q?JYMXYK9UOV9fjw8QXTesS9YzilDKMbcBAcHR2ng/xhCx+KV4vBmnXAn2IbBP?=
 =?us-ascii?Q?h3IFBxMZvUbzLdCe9xpBr6zcyBqNF4x+NTwPdhK5qzFgdhU6rzW1njwOKhz7?=
 =?us-ascii?Q?5LigHvS/iGBO4IVxVr+I8xM4EQhuIEqifn+xpYLH0azH5qZtFTqDATOZUfV1?=
 =?us-ascii?Q?V5m7fdDKkNvIiObp2X9g8L1jiwk8YY542DL8uC8QqKobN1n8KoeVjAPeiHlI?=
 =?us-ascii?Q?cp+5/oMlKC0pFrdSOI8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c266b67a-d70d-4197-7c4d-08dbf0e2522c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 13:51:43.4874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGSs7e5TC89I97FAxtIAX3R+YFzjJjNTez+fAUXiBeHHfWo22iq8VOaPSLkkC33Svf23UuHcZuY0VzMWJroi2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313

Acked-by: Asmaa Mnebhi <asmaa@nvidia.com>

> -----Original Message-----
> From: Yang Yingliang <yangyingliang@huawei.com>
> Sent: Tuesday, November 28, 2023 9:44 PM
> To: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org; andy.shevchenko@gmail.com; Asmaa Mnebhi
> <asmaa@nvidia.com>; yangyingliang@huawei.com
> Subject: [PATCH] pinctrl: mlxbf3: fix wrong return pointer check in
> mlxbf3_pinctrl_probe()
> Importance: High
>=20
> Fix wrong return pointer check after calling
> devm_platform_ioremap_resource().
>=20
> Fixes: d11f932808dc ("pinctrl: mlxbf3: Add pinctrl driver support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/pinctrl/pinctrl-mlxbf3.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-m=
lxbf3.c
> index 7d1713824a89..ffb5dda364dc 100644
> --- a/drivers/pinctrl/pinctrl-mlxbf3.c
> +++ b/drivers/pinctrl/pinctrl-mlxbf3.c
> @@ -259,16 +259,16 @@ static int mlxbf3_pinctrl_probe(struct
> platform_device *pdev)
>  		return PTR_ERR(priv->fw_ctrl_set0);
>=20
>  	priv->fw_ctrl_clr0 =3D devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(priv->fw_ctrl_set0))
> -		return PTR_ERR(priv->fw_ctrl_set0);
> +	if (IS_ERR(priv->fw_ctrl_clr0))
> +		return PTR_ERR(priv->fw_ctrl_clr0);
>=20
>  	priv->fw_ctrl_set1 =3D devm_platform_ioremap_resource(pdev, 2);
> -	if (IS_ERR(priv->fw_ctrl_set0))
> -		return PTR_ERR(priv->fw_ctrl_set0);
> +	if (IS_ERR(priv->fw_ctrl_set1))
> +		return PTR_ERR(priv->fw_ctrl_set1);
>=20
>  	priv->fw_ctrl_clr1 =3D devm_platform_ioremap_resource(pdev, 3);
> -	if (IS_ERR(priv->fw_ctrl_set0))
> -		return PTR_ERR(priv->fw_ctrl_set0);
> +	if (IS_ERR(priv->fw_ctrl_clr1))
> +		return PTR_ERR(priv->fw_ctrl_clr1);
>=20
>  	ret =3D devm_pinctrl_register_and_init(dev,
>  					     &mlxbf3_pin_desc,
> --
> 2.25.1


