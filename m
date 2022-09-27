Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3FB5EC26C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiI0MUm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiI0MUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:20:05 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA34E62DE;
        Tue, 27 Sep 2022 05:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuzW5uOGCmxfoM8BrB6fsKFX89N05b7fuTBh14I0Qm5EtsbldWB+5VaPbGhG1Z4Nf2GvPl7Rroj1w9JzlCXcPpio3mYbZLGHODpIZHIt6dNSxo6kYV1nMIjPiy0jDDRU8I+wdyIgOv2/vsU/5lIaIKZRXfYOQpWGNLL65phprrDT6vbXuSGUJQFxIOYlpCDRNGZ3rbSDEmea7q2oJl4WxXXlynbmMgI9GJAwTp94v6E8/LpgtL/VKk8+o1hxspTE7fPrRFvxcsPRKKqsnlFWdifbfkaqAScolv9SRY7kHVD48KXKVT46hQ2XofJ2p8CLtNQblHxKXkXAXWyP3OLyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DSE1BpJFpmdQcN8BJAmi+nBP0Hhc1iz+Pm9qJ1dAX0=;
 b=GujXD8tZN62Jh7Sta8qAgxICQqwJzEmwhkfFpc8F9+jV1g96pv2CRo5Lp4pg9tQvYjshIFm4VLEbKX/9N3e86LVMe3GQKw4XjwXssRhRYEL8FyAbthITURGMd2ONACXnkAU3hHtxCm5kP/iDQV8W0mXg7Rm81s/lf4Xq0xcjzzdCJy38nlv5y4qA9dZ8OG9LLSjhfVPBEjTORCfjrndW8vrP9Tl/h3tTVoFB33EBlE24EaKlHQNBZ35N9D2BdI4WMEvU1cotAMikMsqkwVIMESN1Q/eXp0lqVwL6fpvyuaag9hWuImTQgLQBCY9azF/Cevy1DOGQh9bd8lXs7ICvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DSE1BpJFpmdQcN8BJAmi+nBP0Hhc1iz+Pm9qJ1dAX0=;
 b=iyfLBnRhVqF8HxgP1rQoNRx4p6J7Bj+yt8FAANB7p/OG5v11cYvk6X8aulf7x8Y4EbpE6XWCEGSmu6LyRE7wdKd4DmvpYD0SHMGxVtt0oOneAIsHAwd5fdxVRtI4GQDillOYdyAcstk3/CqofpU3eIFEI6NTUk1hqaNxf4tCUt4=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by BL0PR12MB5010.namprd12.prod.outlook.com (2603:10b6:208:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 12:18:31 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::2ddc:85fc:e44e:93e2]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::2ddc:85fc:e44e:93e2%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 12:18:31 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "git (AMD-Xilinx)" <git@amd.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: RE: [PATCH v3 0/2] gpio: pca9570: add slg7xl45106 support
Thread-Topic: [PATCH v3 0/2] gpio: pca9570: add slg7xl45106 support
Thread-Index: AQHY0W9QHNPhS8mnW0Siss1DfVUFzK3zMdig
Date:   Tue, 27 Sep 2022 12:18:30 +0000
Message-ID: <BY5PR12MB4902F9A8F97478EB8A870D3181559@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-27T12:18:27Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=688324a2-88e8-40e7-9299-c510089bfdd1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|BL0PR12MB5010:EE_
x-ms-office365-filtering-correlation-id: 422ff69c-e958-4e3b-eacb-08daa08263f6
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zb0k4/mFJmb80EyLpK0qS+2pZ5ojaM8fZOGcLC2ExVT93edokaBAB3ka1gyoMKlWufvVA0wXEbHZxBmiYbSZOlSnlEfOe10HB5LKh8XAir7yqUIfkbmD9/9wbFhYaBMyLSWy4e73GxCHOOswFjlNc9ND/DqL6RZInmWliT8u6FDYQjHmOBPmZAIoyNMaN6qDG96IweuC6ZRKS9RJoECmcuoLmnZq+q6jviIr/ky0cBVZftqOvIDke+BmUF1uXeJO2jiST3GDIYuHd2T5qEIf2m4xGH0cN9zOHHkEM4zOwivpSbh2m3x+dC1PMdBXccQv8s/I4ldTMkmoYfEk1a7d3vyDtZcAvm2cvQZ29OzYKdEHbEyeSfWJpjipssHjnIfw++nPcKeTx9v0lOATz85Z1EKXoq01+mGogICEEOMduQO7g9EbuH1L/qRxhlfzNzytS6iHl8EotTzobnv9E/y8IOLBZ8jaYv1YguDLzyD+mlRF6fgD3dWWovbkCuhfxYrBcirQLa4s2JlW//9grYVBmBpRr4BNNeUKaDFjbMlkU1ZMV4YZWb4xQxCbb0+OWJj9gV8ZwpLHoaeNZ9q+qAc4qOkYnk8D3eF1Eqz3PdQbk/nUxjwIjzDKosqIgp0V6K+0EFFt/raY2DpXg9LtwKlEeWFdQel1KfXJ5O28k/JUj/NvGUsUrszxo9rWxF/RHry8CL4LcnETQdZljuzObqS4oFRknZKFdmsbHyAkUpUZjg9Govsai7edKJ/nPf+B3GrENCHriM7nE5Qyu+MaKzq+0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199015)(316002)(64756008)(478600001)(8936002)(9686003)(52536014)(110136005)(41300700001)(54906003)(66446008)(71200400001)(7696005)(6506007)(2906002)(26005)(4744005)(53546011)(5660300002)(38070700005)(33656002)(38100700002)(83380400001)(186003)(76116006)(4326008)(66476007)(66556008)(8676002)(66946007)(86362001)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vSR4QhUkXhoM029mi3WamzgJBEm4PDjF2pfedEocwER44QDqDQ5THyWQ4Cml?=
 =?us-ascii?Q?HtSnCZEBu39t4olQHWh9OwOzYcgsulQysGmHMi28yA+7+h/hGoU3la+Q8+8C?=
 =?us-ascii?Q?5BP14UIlbiEHnjNDJIyVxmDtTzzJexc2UzdQ6extKb827uJkW7+MpZa0HyEm?=
 =?us-ascii?Q?heX5xeoCBQh1LWghLFLRonrPa4eRli9FPwNtk9OO39xLjPmmQiuPZ3MeYWUJ?=
 =?us-ascii?Q?8TtaG4tRiOPqib1mDsaXkBYxb6cb+TzrC6Jcd9pmFFNACgCiBRnAIUa+vu95?=
 =?us-ascii?Q?vRz2XV5YWk+/HB6NWRv9NX+KcbHb4fUtDOIS+KeEMFEIzpVt/pk92ooH3nXn?=
 =?us-ascii?Q?cb79NQuyz/QjUSfjJq1xZzLXTVXmKFInZYFHWcndNlFtpQ9zi+udD4dM+24m?=
 =?us-ascii?Q?U3DyWkHafySXKHXQNrb22ha3Lo0XTCEDl5qO0CKHcrTAyGFhWeQdlrKMFHrI?=
 =?us-ascii?Q?TvJPu0SrQGNhoY/NV/RdTdVcEXHvs4LTfvlAoi53hQQhwhgvsLJhVzgrmlqq?=
 =?us-ascii?Q?iJ+tAzd8mRzYKbbocd6jdnk4E4cF3iXFFPDOkqTk25KHoALnqSzmQvDJYQAX?=
 =?us-ascii?Q?WiN6/gfUJEJjS0eP1KAzDYTmLGkPG3ahucJuUMmpdPToc607BYFAc+MVwfx8?=
 =?us-ascii?Q?vd/dPUFIz6csZNPlZbHdQYIgkqRaDbxlLIB4D885yIpBofsQHtQiFJg8E6c/?=
 =?us-ascii?Q?yb+yhkgD+JFaPJXre0OGdwK5wgjmRI626BrExgvOUEsktj6CzsZIOwAsAGzK?=
 =?us-ascii?Q?yVVcp184w1tYdikG/pN4layfFp2m3P0G0rOOmq7kM9KIchUYJMaNCr/P95Nt?=
 =?us-ascii?Q?30en98jSLNMpz4ZCnH7Jbb34Cxi0B9sOqyXwmjCv5fip0tuCtJtQwsMCxGC8?=
 =?us-ascii?Q?/qDutW8Xt7/6JXACZP4DU77+WOlMBRSORdQiAZPP6t6oNa/x2/lmDLVgtp6J?=
 =?us-ascii?Q?iYpFPV0irK7twNEvntYvTz6KgN1oSJV+6etqi0Ig9YKSnuLXv6EOj1i2dW95?=
 =?us-ascii?Q?iVLGpp4j7agegePZAzODMAI9MGk/9xPcAGeN/hbPXnaqXoms37AU8Xb4O38w?=
 =?us-ascii?Q?EQ5+qQSoI2mnqHGMcHCZJ71W9ZhuWwd/8WgKAv5z43p/hgzhgsK2I4B8yiKo?=
 =?us-ascii?Q?8qDevnWY7yD0QAk+YSs0+FVMRma4p5epn06OMrHBTSF+SLU8B45Ond7P7bZY?=
 =?us-ascii?Q?mKt3Mttb4W32APw9S8S6C1OMixoDg2xLJREJQF+TxDdPr2+oTtMx/HZWO9X2?=
 =?us-ascii?Q?eHFISLJFXkL1jj9QCEWundTCCzj4IhwC6aB0rjXV8PS+jl27EXYsE6FPFxBB?=
 =?us-ascii?Q?/oEpM9ZSbjcvufgJD82EuRXJ7Kulv3o9Cbjmszm0e1agaqka8AxedWcoHYK9?=
 =?us-ascii?Q?on9XqCSvon/ucS0jUATwuXLaE0k8s2+v7s2nPGZaxo5NhLTEL959XhH345Jz?=
 =?us-ascii?Q?GQ4/6oOYcJWfLg1G3/pPokXXaa2VDO2kSNn7Cu+tYcJ/SdE51jdMxYlcp1An?=
 =?us-ascii?Q?gU9U4sqKOVkDYunqad7Ujk4o8ACDTXQW7S/kkO9gzI00A0kp9RBWcZI9enns?=
 =?us-ascii?Q?ApdE0SFQDWUePF+4wPU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422ff69c-e958-4e3b-eacb-08daa08263f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 12:18:30.9509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzXR8gZskVDm/8yUpDJpQVCR0tg7blOtDL47xV3bO+cOAfpCSRFKugyHILlVo6fD39Es4g/1urJZ+q2meFqPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5010
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[AMD Official Use Only - General]

Hi,

The series is  sent multiple times .=20
Please ignore will resend.


> -----Original Message-----
> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Sent: Monday, September 26, 2022 11:43 AM
> To: linux-gpio@vger.kernel.org
> Cc: git (AMD-Xilinx) <git@amd.com>; devicetree@vger.kernel.org;
> krzysztof.kozlowski+dt@linaro.org; robh+dt@kernel.org; brgl@bgdev.pl;
> linus.walleij@linaro.org
> Subject: [PATCH v3 0/2] gpio: pca9570: add slg7xl45106 support
>=20
> Add SLG7XL45106 GPO expander
>=20
> v2:
> Use the platform data check instead of compatible arrange alphabetically
> rebase to the latest kernel
>=20
> v3:
> Reorder the p_data struct
> Add ack
>=20
> Shubhrajyoti Datta (3):
>   dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
>   gpio: pca9570: add a platform data structure
>   gpio: pca9570: add slg7xl45106 support
>=20
>  .../bindings/gpio/gpio-pca9570.yaml           |  1 +
>  drivers/gpio/gpio-pca9570.c                   | 49 ++++++++++++++++---
>  2 files changed, 44 insertions(+), 6 deletions(-)
>=20
> --
> 2.17.1
