Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775FE4946BD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 06:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358564AbiATFUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 00:20:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27102 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236290AbiATFUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Jan 2022 00:20:37 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K59tmA031235;
        Thu, 20 Jan 2022 05:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ozfPFa9udw9ELycAeduBS13bkm6iK6neRP8IXJ7GQJc=;
 b=ocfcAPaSUWKsFP3vBt0CCeW3b+l0ILF3/nrbvPT/Q4cRAcOnhN1So7fm4IJvQQwpYvGd
 Pnd9LcZgD6ffXKCZeRUkROHjolI0LcIo4TPfBSIQGUI7vlN89ZMXcK3ca3k83HHY0r3k
 3AfXnnj34siVb0E/G4nhCa35c8FNyfxwAs/qFVX3terorECuDfRflOWekTpfxyvYuaGs
 k3FxhT8C+Ra7ixtP4e0n/uS3itDgex0DKv8ghv2796anq9ivpA2YvF+bLuNDwho0wQs/
 QuYpoFUOhmqxfvsACnr3wH2NdyRO9T05gDSLeJ5cANy0dCqpKLYQe5D5WODTCJ+MNNSO iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnbrny22c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Jan 2022 05:20:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20K567JD082653;
        Thu, 20 Jan 2022 05:20:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        by userp3020.oracle.com with ESMTP id 3dkqqrrsve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Jan 2022 05:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hACyMpXQ6SNGh5AL88A8Y36ahrJJbRB0ktrOeGyxWVV1VRe2yCqNJ/Vbt5nTCNyakWWajZnG4mswbERju5KT96xZePub1sIjdJ2U1ouuSryRNHuK04xjPs4BU/Ej2uqg1ZM6C09/v8jq9DKur4UhCvTV1BYhAffMgDeyEJ8BDCJxMfg5GAcn581033bC30vyXsx3oRTRMSSQL0A8ET+m0MnzMnfGstjLmL9ZdfdAsM24NuuuNOLp4/UqAW16Qi5Q1+ysnjESWWfhF7Yrz9vDUyNwTfanFvYCnM2GdsLXzwSmoV+vSQRaSWoaXUZkn79Q1BXu5iklKzMdNiyTBAfMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozfPFa9udw9ELycAeduBS13bkm6iK6neRP8IXJ7GQJc=;
 b=eFRD0cP9pfuF8/aIFaANxQ0Xzeh1xEh1SO82z4uJsTEgXHA+2NPz5lfY2Y8c2mblGWXYAehB2xuS7iAzAntXH0ugsXlFe5YRwFuzutmFSOVkLLaQxk1bWmNP1rM2LFOqmdNMLkMoJqdrt4BSfmOzXdtYr0nM4PnQaG0wd4rtswoKVByfOJi1vhujRyH/iO1uU7/lsGqXW3aih2n2q2yEBFzWbPicFvvENMigDVnn7ec98+UsvjOk9E1PtwcilXXZFp6pQ4alUTvTgFtUkWOPupwD7mJTvb1aifKM2VAuwZzSUcOQPD1CmUBHtF82eX4pYjqagNCBxhr6Melt2YLehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozfPFa9udw9ELycAeduBS13bkm6iK6neRP8IXJ7GQJc=;
 b=BXW83z2HKwqTloJmEiZyejsvN07JjnaJMUmTArJ2FzSNd/z9Z0BSkA345ouqaDdBPyU9m7z4yMbM1M0ZUyeEMeC3LVvUnca2OKqJw6o2/+5CDu9ZzeXHHO3xZjXk1Dr+Ia6+HewtRwlH+/hozWcx2b4dTh6kuNoPODjMI/Qezpc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3668.namprd10.prod.outlook.com
 (2603:10b6:408:b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 05:20:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 05:20:30 +0000
Date:   Thu, 20 Jan 2022 08:20:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: idt3243x: Fix signedness bug in probe
Message-ID: <20220120052018.GA9384@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e716a4-b84e-4685-1fce-08d9dbd49342
X-MS-TrafficTypeDiagnostic: BN8PR10MB3668:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB36687DE10198BA65DF2BBAED8E5A9@BN8PR10MB3668.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLf2wFuHAqpy56l3CH824TQxnWOd06Z+aEFhRReD1OgT6aUWljJe8tAMraGqET/K2Yl5P6fYDNXxyWvyaWw5jYOnzHVH+au6uzGtVVMhRMz7eMKV8iAHgrZr/YZeDeRdbafz5gaXuf/TFLfx7PaMJVYj2DNtUwFROpvvh7CfLa+0j32R6RYv2blJWanGrfKCwgfFHLOvH6U2MSm4edxgfEUdOiJXHFsoCsnsL9lvs412bsqTxLzjO2ZzASlhcZ2cb/bJSwKgQ8SIQoMUHO8yIP/hHVuNQATQNdnnVDu+C9NVI2jTDOrCj82kCXcvP8ScXifdlCdxlMWDfzEn0/siZCiyT4IkqbH3UK7x8K74+/fMXL6LsZy9EEVqzT/kFWlmNGcAP+btHReyiRPZgjrp7ZTMcWoh25lG7kemwmxYlbog3lu5GZ4plfTKYzZ6i0VyrbkZ6l94b0tVug4lMRFgjIPBFY4XFlin8+QkjRuiASkGIf50VBrk4qhP1Ea8Yop1kMk+0fgw1evQq7qOMkZ5pei5XBm10ViPXawzEIpbVpfN7OxBM3+h0wFnlZdiuwZMC5fEcy3ZDUeLg0RNqvVgU0bfPQ2Og5PwbZpVvmqz1o5ybAg8pd6VpOzkSpWx7JEJrsQeXkvnkqJanMc81SvR8TUqeuZJxLujPcssGpYO4t8ugWT5UDqiFFqpEDG5H+8bxCPjrJ8knrwpG7bzzBKOzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(110136005)(6506007)(2906002)(4326008)(26005)(52116002)(33716001)(9686003)(4744005)(33656002)(6512007)(6666004)(6486002)(8936002)(66556008)(44832011)(8676002)(186003)(66476007)(66946007)(86362001)(508600001)(1076003)(83380400001)(5660300002)(38350700002)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fET+ECoIwyxN+23GbKoi2/xKmUBMF8buQwTfAc6pHQz76I8qm6962hBZD+JI?=
 =?us-ascii?Q?iXXgoSYDWvIMSvN52ycxI7WsCIRGyNsAzS85TZnybteia3Dqx4Z+EjZHrwxK?=
 =?us-ascii?Q?SKo7eMkAY85x8cQG/gaTyzbVe7b89vprrufdQ2LvFxy1E0j394QKbsIjnTI8?=
 =?us-ascii?Q?jEnHYoHomIeM9EvRxIPJnbVeXRlwW4mr6nZLlPwBNvQW3zFHhQbxHMAniJdh?=
 =?us-ascii?Q?mUX6zWcSqVzebtGRtVs2bPKrcaYH8PcJGUDJoluaTwptSED/0CZpjLDW6vO7?=
 =?us-ascii?Q?e1ErSOOIkZMBhl5QY7dqqNGzHf4Ofl3mXtywqaM5cBeB9PRVcED0jMsJeqe/?=
 =?us-ascii?Q?4VLnRN7MnmZeOf4KL3U+FRtymvdWjgIIfMafJtkVY7Rq64S3A9mRViytRdEQ?=
 =?us-ascii?Q?avOr0WXLnbzA9lmvV/QSp6GseGsntucNAEm570sKgrXbK/YyNwq9ijbH7nf0?=
 =?us-ascii?Q?RQsBcORxAC9j+rcAoIF/ysBWd35hsuIBFI1mwL3TQwFFXtoCCRq8sTzvaisa?=
 =?us-ascii?Q?6G5cHcTG9yw987Pq86+89HSbVJlvIccXDw81jgKX+G2P1hUhwYd33pwONw4H?=
 =?us-ascii?Q?Vip4YVmRfOw6zC/JV1ldyizchs26U71cB+ZX60vENN8iMY0m2RHqtTdXe8Ga?=
 =?us-ascii?Q?FoVr2wAORUBdpHvCB16YEs6ZNRcE1po07/8P549alcboa2KKCrUQ7yZ2SAU6?=
 =?us-ascii?Q?fJ9UrGT9pmdUm4Gb2NhA2OaoAxKfjiyKeCkbm8yi+d3zq0F9rEhUwLhVwtnL?=
 =?us-ascii?Q?jVZkLJ7BCB5+gnoSY11BMs3So+lHUv+ouyEewhWFUCGfVUSJuIP3aarNAUgM?=
 =?us-ascii?Q?6EpkzPQvyhWl7Lm6zub7xjOjDOhvG4fx8Ch9yd6TjMCnGKn6bSupgPZNt2WA?=
 =?us-ascii?Q?BBfAXegzhbhKnen8Je+lYSVfez9XspEfYEciUWmc+Lq/fWH1fK8hAoeEUSZ2?=
 =?us-ascii?Q?T9Rneur0XBG+Wk25SbvVe7BccBKyQwrRLqr3XgNJ83+nNR5Oo1+Fegr3mnZ1?=
 =?us-ascii?Q?mUjqOWvst81l2b+/LFYy2ukDbUf+EX+mXgg0+9OA+0n9gaYkz5UccqqG4f66?=
 =?us-ascii?Q?w8X1+3ws7ewB+ACf03qybONLQieswW44C7byaRTdC9YgQZ24ol43Ncxqiw9B?=
 =?us-ascii?Q?y9/MXnLdpNzS6o3FVCwmLHhD7q0X+ABoQBSIfp4OEGSEUIXfRXfwoUYQeDKh?=
 =?us-ascii?Q?7Q//9Eq93edzwTPvQVCbGIPxTVN19pvq7Pr/Cp5SxC6+jRue2IszlqNPEEqG?=
 =?us-ascii?Q?YwI9xTV4nELtkiMI22/bomd+l5Z/IoBdbAht1Ey56hOz93Mfze5KMKDNujuJ?=
 =?us-ascii?Q?CsZimp0h8YMZorzLE2lRD6Br5A/O0UN5ahb17y1kOWFaW4zxumkHgNUkCLc8?=
 =?us-ascii?Q?PgLNg94l2FxfJFI+4qi/QCYeFa1bq6w2m9mQHjgsf5mKxzsVUSV0FLvMz/1R?=
 =?us-ascii?Q?NZFt56P2/662hhtnQTdhe5X4uE5AvMNX58v7rZp+x0sBlgS5DhbQK9pAXztE?=
 =?us-ascii?Q?CFFF5faSn6ocKJp4WGsZp0otXgIQBvpnD5aohVdTQQSY8Oyw+I+A9aztrhLB?=
 =?us-ascii?Q?U/PylpdsghlzBWCGy+Xqp2hJOGxlvHthHNyVhcNYTXQ3xgUF8jfRm9XRpZ48?=
 =?us-ascii?Q?n/7DoJzCBD9Scsbiuc2mvCmLBJAuy2Equ1WJhAj4MlreO99Ivh2Ns95S+RDs?=
 =?us-ascii?Q?R9fXi6rdYVEzIAn7Apn9UPfWWZs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e716a4-b84e-4685-1fce-08d9dbd49342
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 05:20:30.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giTmd6lTQwDjuhPMNKAK0Y+TL3g1dsAAkG+QkseTr1qcK+04J1eQdobffgCSyiV6eJW9Iavp4RgDUsVdmXNd4sg7Bi+7T970CHh2ZDmOrso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3668
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200027
X-Proofpoint-GUID: MvXkNYCyh0Cq5BMf0Pc-iRCRmDav4J2L
X-Proofpoint-ORIG-GUID: MvXkNYCyh0Cq5BMf0Pc-iRCRmDav4J2L
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "parent_irq" variable needs to be signed for the error handling to
work.

Fixes: 30fee1d7462a ("gpio: idt3243x: Fix IRQ check in idt_gpio_probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpio/gpio-idt3243x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 08493b05be2d..52b8b72ded77 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -132,7 +132,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct idt_gpio_ctrl *ctrl;
-	unsigned int parent_irq;
+	int parent_irq;
 	int ngpios;
 	int ret;
 
-- 
2.20.1

