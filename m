Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB374946C0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 06:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358566AbiATFUx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 00:20:53 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44356 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1358565AbiATFUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Jan 2022 00:20:52 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K4LAqt032601;
        Thu, 20 Jan 2022 05:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=j3CvRGcqCv6f5YW5EOdLHaPa61aV//e5wYxz4Bjkkwo=;
 b=gB6BtNh5aJJxxeAv3VSfMZ2QmDbaljOUKGYaSeBVpVf3AlRkBeHFNe1ecWMclnjDWh4m
 visrGcN/K0pr1b0AAqZZp7vVtBIajrVYqc/8Jz6GMZUSmy2AZZYDerqHbcn7LSC+IIeB
 yCvdRwJ0Mdtd3rGD7Kx9wRHTWew5UN5qxPr2+INM0vIveFQOmFODMxVNfrxfwIs9vf9e
 PGfQLaa2gpJzWF2z5zCcWah61b4vgXVGILGNK5jqAvOuYEGtoYPOACHZOTpHqhcPsMlS
 11aFWNo1mWixHTvLl/9TNpl0jYztvxe5yGM2P22HOHGu8lDFguj89XaDt5ArMla0wp3m pg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q7a27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Jan 2022 05:20:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20K56Skg174094;
        Thu, 20 Jan 2022 05:20:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by aserp3020.oracle.com with ESMTP id 3dkp3731tv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Jan 2022 05:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmUJOJH37q8DT1QpZEwCncxqtXXfqOJvNT74qFghNckN5olvRYag7dwo4uz70X6ClcKhuVuijVxo5tIhKWC7w8Ud3bZlSQw4QrJQUSfUnjOJPkw39UT2Zpadwmum8+6yHcza0g9UUw/3AJJs5v8Gceq39DrvEVvi/R+HsvuL7g8vvUjVQxr6go2cVtRGenncUHOOmpDjbyleOhPbrz4zWDkfusQFypCGHMtsks1r0xaLY+/YNvuKv/8ydMHHo8kjz4sDSK3tOal0M7Jd59zOdSDaQUhM2ZnxCX9j3euvGJg41yjxeO4Dw+K5iunGiCl5zww94RpTwk+u0Vgqo9c08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3CvRGcqCv6f5YW5EOdLHaPa61aV//e5wYxz4Bjkkwo=;
 b=bs8/7ljGL1BrVZJiakPFScMwUnzOlx0g5AWtFV1sV56vrmtONo9pxtJitqv20tjr7aG//hdN312ukQ0nDQeOXGfskVt8JmqmOZ3lIH5GtEoW9U+t0u8Kabr4m34zki/rOPjxTTU7orspSVVk+T6R/BpNYXBMhYexMdvmbKg0JDNYAZsLeHrjOflJhWSQh7bTQGoGDoX0e4jMs7Y+Fw60g5avFsa4w16uw5GrOV8xCvCLxjwFhwEd05xSztvjEfEh2S350v9dL+ntmEu3kH8mLl8qbpK1IJx5c6ueEIpTAdVz46LbAcDD2yP9gEM6cIonqcOReNVPM8BA9evL+sGztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3CvRGcqCv6f5YW5EOdLHaPa61aV//e5wYxz4Bjkkwo=;
 b=A/vqX3Ug27c/J9UwR0E7XBrDacGpX0K1bnpqgRIlpqW+2BQzq1CIQgI0gwkQq5qLdyt0I0J6PSakBNiqDk9YKPt18KQhL0aonxY4GPJpPF4tmfvYXjYWkj58dVV1JQD6vFUHE+Dy93uA4W9kcPQ5uuWOzjKjZQTWm5UCrTLWgag=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3668.namprd10.prod.outlook.com
 (2603:10b6:408:b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 05:20:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 05:20:48 +0000
Date:   Thu, 20 Jan 2022 08:20:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: mpc8xxx: Fix signedness bug in probe
Message-ID: <20220120052038.GB9384@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0100.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e09d7a-090c-4a27-c927-08d9dbd49e29
X-MS-TrafficTypeDiagnostic: BN8PR10MB3668:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB36686DCC97FF4BE5732D8A468E5A9@BN8PR10MB3668.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKLzsbBnrWshUH/C4owMvxu4EgMes7qvBJVLC/XJar4LW0SqvxWbVOIQZarxU3iLh2cUSS2S5hrWtEgRkq8fCGPmNjsJLQVMJbPFgq+20mamHZleX8NbCJviJOhQDypTUXhJnlyS2iqB4N3v5WEefh+WVPRKRTH+waY9nGsXQ3+wOqRBfEGITfsVIw6nBSHUAFaKImr/YQwZm0ZrtZ4Gxl/xYebM/aTh4fblGfkg7a4NjjjYErPsZjd8cVnDKCTlHVTl3znR8irXK8rqa/uTXhqDYvp7LvbPFvptfp5AgFywjV8RsVqCp2/aOTZpaC8Qd4Vx4FW5B9ER/oFlz2xUOXyOW77Z2tvhiB8XPDuh0c7hxCRYpPigS0MVkV2YVXE5Q34aWlPZjI8WtQfePFYNNyqtWwA9YZpB3kGYKbknHZB1Tp50zg+P8s6g9PJoKOosputvNu0Z8ZSyeMoNSuNij1vRTR8TZPVDj7Z7u1O9DIj84TRUG1Gh6PuXOdl3F+3q17MAgyEEr6bC6Gr2gIQy79NizeYua1QT/2239OoaqZbNDV7e4vnQ+27OMgwENM637QCTJNfi3polf5TtFemJW9C555S5PBVob4vypfj/X5esRE2bAMy+aTzLluYk+iE1J9sG2FIm3gzgnGolrN9O/8EnHqbq4jMDOicXoTZduc2eFx9aPDprzGIn8nJOJv9hj36TfTwkc/mdrnCh10ZLN9p5L8FbRww16No8I5Re/R0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(110136005)(6506007)(2906002)(4326008)(26005)(52116002)(33716001)(9686003)(4744005)(33656002)(6512007)(6666004)(6486002)(8936002)(66556008)(44832011)(8676002)(186003)(66476007)(66946007)(86362001)(508600001)(1076003)(83380400001)(5660300002)(38350700002)(38100700002)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxhPRYv6gGpfh3r6We4z+Vt8haHNocJSwh8oK4Bbo8KeqzNEU7aZ1vxmlP2h?=
 =?us-ascii?Q?DGqJfTKKtawOCgyg6fyqXT85GWpmFmV5TgMHhGBDSZNJ9RQjoHkrUqATMtt+?=
 =?us-ascii?Q?0eCd4c/yYCMI2jom5tS3sT9X/H2R3SHdMAYW/QKWpo8OgQE18/YU0Ss1PZLv?=
 =?us-ascii?Q?np9eK7iEx+LQ9/93l0qT49cLqfZR4ewWI4KFAhYL/pnlMK+y3O2hcYTVHk5o?=
 =?us-ascii?Q?maMAiA1fioOAUm3964QKpCv3rjIF1ELer602q5KNrPPmhGlNknTVMRJ/8P8q?=
 =?us-ascii?Q?ZSaw4YiqNYLuxyUUr0f/m85KYzNj8qS+EuIc3xdRIaTQk3UuK/p2fQTNLLUO?=
 =?us-ascii?Q?eamFDPCBpkK1vsyBePtFk7UB+NpbpweHSMVd0r5Kn3gV/IC0gHd0Gp719w5I?=
 =?us-ascii?Q?cL+IAlYMK8Ffw4kWyS1oOTm2Bn+Ge2kZOL9DVYdFi5+jHt2022rUGNBqZXMb?=
 =?us-ascii?Q?ViPGF38QR203OdIpApRwj7MTQY+TKp1ZEVtY3nYJo6SjPfD4XiHOZm3JDgA2?=
 =?us-ascii?Q?sBvWb1tFhSeBzYFi0yhJJV/K+7pNThYFodDLqMRYCxXVXl2yJL3fmDdmr+IB?=
 =?us-ascii?Q?+grPpn04BbpLFrVlmbkBeXC5kAN2uyfrr24SMkwAQeFnT6s+DsEyoXnYUhSa?=
 =?us-ascii?Q?EVjibXsFaQDuVkfzuYBd1Qe4zgsVyvztYJ5Ds7nLtwirebPyGk0yitdLF9Dh?=
 =?us-ascii?Q?aDu7TkTKRx3Y1jENgA63W5VoUXLEni+xISYoKnXS1IOlyc8Rd0BSADcRoOst?=
 =?us-ascii?Q?sI1sl3wZ4kuD8LL8O+8ZhDZ1NC9/DEQnyP7TefuzZesNMR/grFqwva3pcYsz?=
 =?us-ascii?Q?XNx3Fo0LtecsnM+pM3QGIvFdMMStZ3lTExeJ+ytbobEZM/iCNS2U6fU4w0Dn?=
 =?us-ascii?Q?/ENsyrp2AHzli2gpUD2P0mYS2ipoEVdvQnWqurgHUG0KUVEBrtuX4T49THxa?=
 =?us-ascii?Q?bZz+SuCArLAlZ2Uf4qv+hq/xuyLs+ANUZR+I0f/5daszufKQLaQoZidge1JH?=
 =?us-ascii?Q?teXCIirF86o73J+wXH51t2EOSi9abLmdAsKgHdFo42BGbkrdhLhJ7yv8LSUH?=
 =?us-ascii?Q?+mRtdBIoDxkNVQBwPfQx13js3aR6+cu81Zt2W1PXjrOA/zl8KTYY6LNU0vco?=
 =?us-ascii?Q?LiH0e7DTWkyxqrqyNqGpVRHkFAm6DKc4m0om687GpNFFlSIIf5Zm0sX53rM3?=
 =?us-ascii?Q?VCLzUjtlYQLTezjdEvWvzdo6Ihxj6iagbgEgdYB5bZoKeNefF198rwX0QcHP?=
 =?us-ascii?Q?SQ+dGHQtGXeM2AbtP7SxI+YzQOCHM09i3Ojlvfja0WdCLQWPI/6jyYNaNJUs?=
 =?us-ascii?Q?iHtFvWOya/O+A/oK4vuhlDXTpSh92VgPzzjzwW1JLuGwBG3V3fArE9agsHN4?=
 =?us-ascii?Q?960bBBRA5j3nCSQzZIknhvCZLsA7iO5hRNYlJ3UyVsvbBhhcqIQgvR88CHHJ?=
 =?us-ascii?Q?ujAUZAjMlTcN2MRJ2owNoc/nrWltYFKQh9AqV8N7PQjiKqCD+uWk9qVam3jK?=
 =?us-ascii?Q?Oa8pXSFVxb4RspvUrA4KoykGU9ANOZBWH1QVLOnfg3YZ9F35RmolofU2wDc9?=
 =?us-ascii?Q?8sY5QVzsZHF8gH2QVfrzzLbgzs+A2YyGf5l06DImPvCqcEzvZkUMw5LbiZdE?=
 =?us-ascii?Q?nyDektwwNPiasMe/Ns9hBPXNcYerDARDfe5PVDVF2vwyOq3Tq34AAxERqVY9?=
 =?us-ascii?Q?KLoAD2TFbUhzoHQ/PLQaGZuyomA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e09d7a-090c-4a27-c927-08d9dbd49e29
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 05:20:48.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTreP8MNHKR2srFZoPNhvnN3k7BpIioWQWHxALvtZEsPCJIZFQap6Bo4GHkaES7IevyQfFAlEAn6Diaio0Gx2Nvw/MBPmT4FzuhWuO1I0AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3668
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200027
X-Proofpoint-GUID: k58QjSOuTHQ7fdVIVbGUUNqLj29Vb4c8
X-Proofpoint-ORIG-GUID: k58QjSOuTHQ7fdVIVbGUUNqLj29Vb4c8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "mpc8xxx_gc->irqn" variable needs to signed for the error handling
to work.

Fixes: 0b39536cc699 ("gpio: mpc8xxx: Fix IRQ check in mpc8xxx_probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 01634c8d27b3..a964e25ea620 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -47,7 +47,7 @@ struct mpc8xxx_gpio_chip {
 				unsigned offset, int value);
 
 	struct irq_domain *irq;
-	unsigned int irqn;
+	int irqn;
 };
 
 /*
-- 
2.20.1

