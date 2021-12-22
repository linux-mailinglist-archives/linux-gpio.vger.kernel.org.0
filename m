Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E229A47D797
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 20:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345170AbhLVTWX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 14:22:23 -0500
Received: from mail-dm6nam12on2128.outbound.protection.outlook.com ([40.107.243.128]:19777
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345143AbhLVTWW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Dec 2021 14:22:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJU1Z+NZZNL0opB+EzbzmQPf0WC7Mc7H0yvedvuU25uMEKagtaIfbUNU0ctz6HwwBVoS7ky85C8kCAmHmQiYlSXBdBmrTIxe/tyDcHuVmH/XgXNNQA6X8w0B0o1F7nEU3hXmj2eSGgtrV9CNBRuohCByr9X3SBTvIIjhfZpfkbIWJbH+cswM/JiGWkNnXzRIhbwElKIqEgUwhCAbDNep/uDqwneZZ3hV99zlDO5muIaIZeTsKLRmtgIADJGdr7LWWI68VGhr5YIURz4TFrJtKoxyMoR6bp1cK8sLglxdsJ25W7WgjFE/O8n8Q5abiHiE+52vFCwi4vNqX5P9r2pZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjDE6NoBaPbVYbzFUGr4cK+6yBwAwl9rcIt0Qquy71g=;
 b=aMgJFZbVUdMZ6Tqj4qnEUZPpNtU67Lxv4SLEcdEYkvAUQnHQUB8vnqmEuAb6yoOEqF3sJzSRBpKDL3dTq1LhIbIZAdhe4Z2GinXyfE1uaxWnoQ7VBuRv8JS5zfqEB1YuPMZFU/N4WVR7Zkh7aWOs1i6bf5TygZzlSWenJr1oc5It/6Q4JV/Q4+sc4/+eehPr43DYoDk8Tlhibjt3X7WxZ2n+JcnPHwy4TaELw1VF5QLHrz8pxZVXJtH7ZCUFaBaeFa75OeNCD8vvjJdzAN4w2EsXj1oOlMHkBn0E6eCz3aTtyT01RnoyPbh5pywRhwMtnP/8UhA/effw9dNbT352zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjDE6NoBaPbVYbzFUGr4cK+6yBwAwl9rcIt0Qquy71g=;
 b=D1OCBmoobvKobFKZL8wvpaqE9BPgU2A8jqIDIE2e5d00iCrPCTVakvbmpxug6Ec7S6aIykXbnMhEHcJtDdiBdcSyYdZa5yZXog9x1zeq6PgibR5qngojI4Ej1eVRJpv8DMNckBJ8g0sIuFtJAJ91K8yhUtxifjdiuXlxJglOPZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MWHPR10MB1277.namprd10.prod.outlook.com
 (2603:10b6:301:9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 19:22:19 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f%4]) with mapi id 15.20.4801.022; Wed, 22 Dec 2021
 19:22:18 +0000
Date:   Wed, 22 Dec 2021 11:22:15 -0800
From:   Colin Foster <colin.foster@in-advantage.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: activity status for pinctrl-microchip-sgpio
Message-ID: <20211222192215.GA21356@COLIN-DESKTOP1.localdomain>
References: <20211221190459.GB13192@COLIN-DESKTOP1.localdomain>
 <CAHp75VdGXAxBQqYy9kHrqHYytXeP5ackdZBBUrBVVwt38B=XGA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdGXAxBQqYy9kHrqHYytXeP5ackdZBBUrBVVwt38B=XGA@mail.gmail.com>
X-ClientProxiedBy: MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc70ea93-02de-4845-0c08-08d9c5805ea1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1277:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1277DC23A0CE8EC5578FD801A47D9@MWHPR10MB1277.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zmo0VMYJUfpIlDPhvSPwfEYGE6cxsxoYnvv2ldn2zATPT61FhQvm47kNCskatNBcHsMkrAX2M1rkTuQG+dZBfs05VRRp74IjsApCQkYkOp+egWfQ5MI8DodMe1XAWsSSHMHFj1vYBJt9MiFcKri4oxXk3FHuD3QrayxpuwsoXacV/fADCAkojpDsDkNTMAHF0s2wURZwTaBlti+46RKrPis6nUhNeJy2P4NMF9lFFnTOVsdQMSdMMpGgcoDLw44RUNYJArr8sghnSHDj8Smq+q++det0O/CmNHw5USoqGDBgt++GsFzx4LJnwjWc8l/Oe9gj7TMRH7rBK26MYQv4oXmhclMXvD3KZXRBOOWaMlnnnyz+Qn+77upjiikkqg2dU44T5jdA7GzixaPF/YdrQ73olPwH0dzOtpMH7XqhYUz1wlOFQ7q3r95/Qkww9kRlw5qn4cXD372tXjKIqwtdiDNFpyCOlHzEv6NqW9MmGiSnJzvLV4BJZXWzxGxYonBNjfdvcX8p7h7RFy/WddBc1ES7ikTy3Y161pr9OjfIOCVkcZqun1Dz5OhQh1q8l6YZxMQ26NZ6ckmXYhCVryXmTYHBpeCX6xMbUqgX2xzlJ8RxEdkKY94s2Lm+gachq19yQmDTCq79WTu2DORgYMqEVoEAAQlgfgRX+jK6IC+p6kWN+gQzEmXI+eZh2rb+gmhXzg60aFSZqEMKYkrXyegd8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(346002)(376002)(136003)(6916009)(66476007)(186003)(4326008)(5660300002)(33656002)(508600001)(6666004)(6486002)(66556008)(1076003)(53546011)(8676002)(9686003)(66946007)(6512007)(44832011)(2906002)(316002)(54906003)(8936002)(86362001)(26005)(6506007)(38350700002)(38100700002)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bg/1iAY/zB1zUxc+vhK0oX3th7WwM1LGNnjkMMEGSwPsEDmHaTr5EYtg76C+?=
 =?us-ascii?Q?sWfI+iLmi0wJBf1Bbuc828Py5LlQL23bcM0H47Qk2fEDuAfV454uqAPocLCS?=
 =?us-ascii?Q?lFu1ol+zU67EOakR0tRsJAweExKFMlSXL4lW9hwdQG2b4nqd1+qIpNMZ0HqJ?=
 =?us-ascii?Q?g6gkoNAZm+5Lwo3VQ+VwCcP5tePoTE7nMXv+3C8l0PsV/cusJoB8qIVxjx/Q?=
 =?us-ascii?Q?0Q1C3yAnVkuuR5UbuxeUQTGISXihNxDas796rgcTBjnOzfZTx7UK1/YLoVkZ?=
 =?us-ascii?Q?vIfVxPSQfjbTSCoeI610s9nK8dUaiCj8jD8zzLb7nmM9fhIIu/H5NyWI10VA?=
 =?us-ascii?Q?REg97aOIYYkGQkI+Ldt3iNfJkcqJjBa1gseU/XBCVCZusoamqi5SnZCLqGU3?=
 =?us-ascii?Q?m/0UbkRgY1SE3bHvy6NtAn5BXmyRBTuSGMaWG1mJWTSuIAdfSmeA1aARSzCu?=
 =?us-ascii?Q?BL9NzJ4k3E8MOAD0F63taDRrPXBqeTS4gUIvHxMydTd0AjWCeWmwQrxEOVZS?=
 =?us-ascii?Q?A+WHXUMpNkvbyQ6c8ayT6TYYhUdbYZxBxQ9FWbjFjSwaz0UY8MWEjwNTx7Lt?=
 =?us-ascii?Q?ig2yMNqi440eaHq5rlTF8gz1wgHZ6xj1YyA21q5crAb0RrCw4tMWs4QLOkov?=
 =?us-ascii?Q?daoOMOp063FTgPowPjMmKBnRAIvFD5yMUgYHh/fTsQpB9M7ZzXL467ikXWoj?=
 =?us-ascii?Q?lQXiQnGckyeBA3mzeoU5SZag8kAXxBjSVAGTYv0wPVmtqUaaUx/5jiXzNXZv?=
 =?us-ascii?Q?OFz0vOE0q5lfhP3/8hzVBg39pztDLZrcyP1HmiKDPiHsi4JIU3E+VuOibWtZ?=
 =?us-ascii?Q?3qHvzd2jZNuWjvyNGWhoVJIrtq5zsChBoZ7jL6noxIQvM8Ir3T0KtML11JCS?=
 =?us-ascii?Q?+/3wZeG/Sz3LCXeOXrHw/iDu0q7JBRCwdZEBfY/dBhk9mY+d040kGCAYGvwO?=
 =?us-ascii?Q?uIVZU8ovYiZ2NVieW6BSoicgqKF2Jv+uRI9Sysho/vYCbJ3fIs3IKCMPYnYQ?=
 =?us-ascii?Q?4LrumPSKpqkTPTAItLMjjDuelmhMElMlxDLKql2htufUSHIXaku5goZyYtWQ?=
 =?us-ascii?Q?bQI1OiAIwaZT7RD8GoyrNwXBTm8nXdGdhO3DniFb+IvJ55W/09SMbpKq4d9m?=
 =?us-ascii?Q?IeTclD6+a5U0yzLDhe0U8Duwf7j20N2rt9iC2PHaGLx6mJfEAwxpXjy17dd7?=
 =?us-ascii?Q?C23a3vz2wq/Z2xByGq8LH6yMerIskamtQ0EshjUcKtQl2y/uOaZZ9nKkjexC?=
 =?us-ascii?Q?kBJf2OajGse28qsiAmMQLnf9UhIeuruG9HQZhleFa4e9QOVZBhbAB4hkXZwX?=
 =?us-ascii?Q?82uJIM5vIK7PlkhkzQvRtG8WJhJFFl3b1cg4EtSQyTHREAcK6aMYiT9yLEaL?=
 =?us-ascii?Q?obtqhgUQuo+THf0N9l86+0El+uIWG3ognQwt7UCNNaY75hyQzKvZnhRHS+T4?=
 =?us-ascii?Q?NbxvtxzE660C+F/McdgT1+I5I6aTN46TSo8cVwTlbO1/Lex05Hr1WQIBX7LF?=
 =?us-ascii?Q?ItDNursm0x6CUmzU8moyLDSxL0M/icVD5ZAqea6v2EtMgbQBW8rOZMQhx2yY?=
 =?us-ascii?Q?sy41YwbNYUhjynudDH3oP2l8n7XiTIotil+U0xo9NTiDLlxMUIBiOsnpSh4g?=
 =?us-ascii?Q?h/Wa6+zDKTWmRsWZ/N5ayAhH1CQehV/KuQ7tNFrg8MsfHOYIMc5yA9C2iEKw?=
 =?us-ascii?Q?0eNCkA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc70ea93-02de-4845-0c08-08d9c5805ea1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:22:18.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beZFoKtayeZcEl7AfG9aQXnxjCKV/7DjfaN35zuWyGg53rijdYo0BEeryqEUSWsO2qoNBAB43pYqpaebZqueoz+RhCWhinxPqTF7usRatFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1277
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 08:47:25PM +0200, Andy Shevchenko wrote:
> + Linus and Bart for the starter

Thanks Andy.

Updating this thread with the current information from a side-channel
email with Lars Povlsen (paraphrased)

> 
> On Wed, Dec 22, 2021 at 5:58 PM Colin Foster
> <colin.foster@in-advantage.com> wrote:
> >
> > Hello,
> >
> > I'm taking a look at the pinctrl-microchip-sgpio driver. After
> > converting it to regmap, it was quite simple to finish support for the
> > VSC7512 MFD RFCs I've been sending out. As it currently stands, I expect
> > that patch set to get chopped up and submitted for 5.18 due to
> > end-of-year schedules.
> >
> > I don't know how the other chips that use the sgpio driver operate, but
> > the primary function as I see it for the VSC7512 is the activity LED. It
> > seems like that functionality was initially planned by way of:
> >
> > static const char * const functions[] = { "gpio" };
> >
> > Has there been, or is there expected to be any work to add this
> > feature? If there is, I'll be able to focus on PCS ports next. If not,
> > I'll spend some time on activity LED functionality.

Yes, this was the intent. It doesn't seem like there is anyone currently 
trying to implement this right now, so it s probably a good task for me to 
pick up.

> >
> > Is this a feature that'll be desired for SPARX5 and LUTON? Or just
> > Ocelot? If it is Ocelot-only it would seem like a flag in sgpio_priv is
> > necessary. If it is for everything, then extra parameters in
> > sgpio_properties.regoff[] would seem like the way forward.

Implementing this feature for all products is desired. I will take this
into consideration during my design. 

I'm sure there'll be some optional DT parameters needed - duty cycle,
blink mode, etc. I'm not sure if starting with "50% duty cycle, 10Hz
blink rate" is enough for most use-cases. 

> >
> > Thanks,
> >
> > Colin Foster
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
