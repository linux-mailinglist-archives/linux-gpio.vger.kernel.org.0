Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B433318503B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 21:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgCMUY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 16:24:59 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:47040 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726480AbgCMUY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Mar 2020 16:24:59 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DKFKNn023814;
        Fri, 13 Mar 2020 13:24:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=UUnLFkCcuMxF1RmFJ1fPp4NU9mVe5q6fRZm7ih8Rb5E=;
 b=rvLZu2ZBWyGisSNqjjSfEiuK8Daq70YxlGcmJx1DFwDjyOyvNr5/UCngex2UZWCk7Dcd
 ZdZVjR7MkS5GpZzAsMq6FzHMuYXb/H4lv/iAOOdPnQKh1on1ZIlg7+xi7/Zj3PBEgVKe
 h/7eRVDGJgOZsz1WanobtyvP9t4yVwORAHznice0tLtwz2EekHsZSMMmcllpgmYy0PSH
 WU0H42LxtpjRdKEhOcJNK/MO/zJK016FVYH0VL39azHw6VMHIxDnMo6RDvdRAFrkbqMx
 4OxVDuNYVLt6BLkNdQfx7yakCN2aC8lW1Z9bi3tr+AkKK8uARVHgpTOsIGnpYSqyemx0 ZQ== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
        by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t5h0u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 13:24:55 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 13:24:53 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.59) by
 SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 13 Mar 2020 13:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvstFpgPP7Mm80iQ894QYTZ8N5S+M6TVP9VSnO0mhMTg3oW91Welm3C6lFqXZVJ3d9/6W/H4gDsd0gK8GNQ4xOzwQeC8ySwIuPv6FJg5djwcrLWqzzvrRNlfYaRzAS+p33yCUwt4Prf6hUSQpr3C9qmLYEVxuLd702yjwUXPtTmasKSvj/9418zOqOTt/wE6k0C6UhFjsbsaO48qBC/p7uPea0QJHygEAot8P5F0SNEewyydG2KpZmapd/OGPlbw+ivFos8/Dg73HIkyI1XxipoK2pxjSZcqxyriAC9opkaPeBl1kQ5u/lA+4CHtwq/WV/ybnNjIr8cABxjleVzi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUnLFkCcuMxF1RmFJ1fPp4NU9mVe5q6fRZm7ih8Rb5E=;
 b=CldTRbXHP50B7WVHYZeWNb0p3jK4ZgsLs2et+Z3Nx7wDr+79NJ97V4XXXBNjju8QzT+WSuBBsK75dyHFXYzUpw/3hTBLlltVOzCD55uUA7eI6YHffbU1RumjzqnfdGDxNOv2jYkBYjt9xuqzT/cq+gvvIjbe8jYY/iqmQA48as0SLsHK/FdmuyId/LEJwpXErBgyQjFmBihj2PvgJCj19H9Dy8Q1HypM5RuOxYvQ7DHfu4TUNSiDaTrp4sGofO3Wz3FPpHQ+Tz7B+wqRpn23wV+4sr9GPqerTONnUNXGuM9B450O6IjkYwWW1AF2FcNLv5PpIYUIfATGwX37ieASSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUnLFkCcuMxF1RmFJ1fPp4NU9mVe5q6fRZm7ih8Rb5E=;
 b=pA9Ab9NUvlIVUczuDhucpY1e+XOTAdvphdyyfyYCLZrha64PaiShgut2qZsQQ6ZPaysHKnH5rmJLEmfYRCyJRthOJCu+LFKjI+Yk6SXgGX7dJkEosA97QyAkE8H90HgZV67mZRiFA+6uWpAwerX/0vosZhNEVl4ghJqbNk3FojU=
Received: from MN2PR18MB3408.namprd18.prod.outlook.com (2603:10b6:208:165::10)
 by MN2PR18MB2878.namprd18.prod.outlook.com (2603:10b6:208:a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Fri, 13 Mar
 2020 20:24:52 +0000
Received: from MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff]) by MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff%7]) with mapi id 15.20.2814.018; Fri, 13 Mar 2020
 20:24:52 +0000
Date:   Fri, 13 Mar 2020 21:24:44 +0100
From:   Robert Richter <rrichter@marvell.com>
To:     Tim Harvey <tharvey@gateworks.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
Message-ID: <20200313202444.vdfdowbudlsxmqsf@rric.localdomain>
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
 <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain>
 <20200313191230.qrrlo7ht24fhfhvj@rric.localdomain>
 <CAJ+vNU0q7wW8JPC8FjEkD4a-ZJc1QAmVNne0w1T4MX9pd4bCyg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ+vNU0q7wW8JPC8FjEkD4a-ZJc1QAmVNne0w1T4MX9pd4bCyg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:7:67::19) To MN2PR18MB3408.namprd18.prod.outlook.com
 (2603:10b6:208:165::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:7:67::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.6 via Frontend Transport; Fri, 13 Mar 2020 20:24:50 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6599e0df-a7d0-49fd-a772-08d7c78c95bc
X-MS-TrafficTypeDiagnostic: MN2PR18MB2878:
X-Microsoft-Antispam-PRVS: <MN2PR18MB28783A716AAA38DB45BAF3FED9FA0@MN2PR18MB2878.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(199004)(478600001)(3716004)(2906002)(55016002)(8936002)(54906003)(5660300002)(86362001)(316002)(6916009)(1076003)(7696005)(4326008)(53546011)(6506007)(8676002)(66476007)(6666004)(186003)(66556008)(16526019)(956004)(9686003)(81166006)(66946007)(81156014)(26005)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR18MB2878;H:MN2PR18MB3408.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oiOM4OFjeX3WMnvrTzGc69GBWwZ/jX6EFlzxzGHbQP3sRuyF1uka02ee6brDb6IXQidLLjXhNt+40M8LMlcdW60N1feVY2HUopCjZ0nedZJuS60oVwBKhIc6sAZfDOJsassSX2U8FPGKdfH9emJtfOeKHjyR2UApoltVA6U6sM4m2y2BixQ6B2d83jYqfCDcoUEqHJLFp/RX1CMKFAeEzkA66JjNhUMEnaJoZtxHxhdA211lekwwHezVjC6ur7q9ew4j3+9TItrarrW3XI3q5ANWY5lynktgS5P/Axg7Fd1AZL7WAJZHwDC2Vj4ALBym/9LQbJEsaTRBXfBhaUiaiaJcGKryIE+y6PxaS12upDVd3hvv8vfla3U8iAjvVHweDsRtWBL8kF8OhusS+nFtdIZ8S+xdFIaRT3IzD1cV9TkrN6BPKLfjRxAMo9HV5cBy
X-MS-Exchange-AntiSpam-MessageData: BGfZMB+7638XqjY2pM1ejtzBwsc8DS85oy/StzTvjLI/9BslNiykK8rCHUsuKByWVB6nDrPI9UM9p36LdamG/wgtcxDNN7gZebvfS2H84lyStUaXJekTgeHLO3Y6HbBOUerpI2d2HNlMcbNSf7b6tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6599e0df-a7d0-49fd-a772-08d7c78c95bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 20:24:52.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA5LpWrggsF+bMA0MTiWIGl6jY2TjtiirDCsi4e0v9Qp076RfModojlr5tYZhPelwMTkh/wI4Skk6Zs4rk/ECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2878
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_09:2020-03-12,2020-03-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.03.20 12:41:19, Tim Harvey wrote:
> On Fri, Mar 13, 2020 at 12:12 PM Robert Richter <rrichter@marvell.com> wrote:
> >
> > On 13.03.20 16:31:51, Robert Richter wrote:
> > > On 11.03.20 08:43:53, Tim Harvey wrote:
> > > > If there are no parent resources do not call irq_chip_request_resources_parent
> > > > at all as this will return an error.
> > > >
> > > > This resolves a regression where devices using a thunderx gpio as an interrupt
> > > > would fail probing.
> > > >
> > > > Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> > > > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > > ---
> > > >  drivers/gpio/gpio-thunderx.c | 9 ++++++---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)

> > Looking at the original code, the parent resources are requested only
> > if existing. So the change is ok.
> >
> > On the other hand, the overall change using irq_chip_{request,
> > release}_resources_parent() became pointless now. It is unreadable and
> > more complex now. Thus, commit 0d04d0c should just be reverted.
> >
> > The function interface is limited. Instead of letting the child device
> > deal with the parent, parent requests should be handled directly in
> > irq_request_resources(). Another aspect is that the code for this
> > driver has been already removed upstream and ti_sci_inta_msi.c is the
> > last remaining user of it. This speaks also for a removal by a revert.

> A revert does make the most sense to me and it works for 5.2, 5.3, and
> 5.5 but the revert fails for 5.4 and needs some manual intervention.

v5.4 should additionally revert a7fc89f9d5fc ("gpio: thunderx: Switch
to GPIOLIB_IRQCHIP"). v5.5 contains this revert too (a564ac35d605
Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP") and the code in
that area is the same then for all kernels from 5.2 to 5.5, which is
basically a revert back to 5.1. I think this is ok.

Do you have a particular test case to test the driver that I can use
for my own testing?

Thanks,

-Robert
