Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7C7457788
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhKSUCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:02:48 -0500
Received: from mail-dm6nam10on2137.outbound.protection.outlook.com ([40.107.93.137]:31457
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236230AbhKSUCn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 15:02:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMDIdjQHO9x/R8vi3LaZDvjHn0RkGuuWiwij/0RJaXlP8XwdJMGRQd++n+Ote7/Z3lp7W671U+BkKgmSDblZZuUpurtHFPZLNxe64LKNkWATrRqS5jQoj5kBsq3sgiqdUi2fmBTDmEPmvQ1aQpB4STvWzxQdbnM63uYIEdkyUgHHKdsS4jbnd0GxIyQnzS90+gJITBd/m5uP1gkFvhUZC+I0cBoUO+eIA0II61FG2biH1wPO75I1h2ct0GojJ8hAqe09ZFjIlKqdZngR/zV7i0q1ISzuRiULTtj7jGZHRBRn5PHsDpSbukvwRVZufAIOF+RMxPwpQlbqqdYRBao3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j8Xxs3rlAchO4GZw1TCeHrd4wZkrgjHFAmPbYqkgkk=;
 b=Dr9FgPdLgbMhI0GrOnnTopXOnZSG0hehY7Z4iFj50/Vqcc+6CJ7LLQyxsNT/QIo9Q8xM45h7j7pdaKREwMGStVekPyb6PklVUPCC49i1yLNCFrcnrMezXBxX3v4y8BnvM/vMZEzMaoj+HsgpHJmBdH1VurTtBdwvg+/PHKcpEG18tC+kFnWtWSuHyKiNEKkbK/pDx+n4y/j1DB+93T9cEbSoPr9up8GUMxzv4vp95dpmJi5br2jQJRhyEO2o1exC2ddF0gVMlNl2OUasCBD6CWrluK1OIi5W5hBnHTJPRNvFIGGLQ53wERrp7tMUmSVd9/391bo3rElbfOcZrsyAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j8Xxs3rlAchO4GZw1TCeHrd4wZkrgjHFAmPbYqkgkk=;
 b=apcUj+0NrThBWz8h9mrGixbDaobyPLe1B5oZwHaWQGBn6DINsbiZjLZdtLsDSde4b8Jiu7aLaAxoblqbNbpK4D81+Sf7FOxKNiwhu1T2TvtV54Kn92pC9+TNzs3c9u9TPQx26AP/6udKqXNC7X7gIWPlwBmrOGSAwmWSf1vyTQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CO6PR10MB5651.namprd10.prod.outlook.com
 (2603:10b6:303:14e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 19:59:39 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f%5]) with mapi id 15.20.4713.019; Fri, 19 Nov 2021
 19:59:39 +0000
From:   Colin Foster <colin.foster@in-advantage.com>
To:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH v1 net-next 1/4] pinctrl: ocelot: combine get resource and ioremap into single call
Date:   Fri, 19 Nov 2021 11:59:25 -0800
Message-Id: <20211119195928.2498441-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119195928.2498441-1-colin.foster@in-advantage.com>
References: <20211119195928.2498441-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
Received: from localhost.localdomain (67.185.175.147) by CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 19:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d3e0d93-cd74-4a4b-7abf-08d9ab971ec7
X-MS-TrafficTypeDiagnostic: CO6PR10MB5651:
X-Microsoft-Antispam-PRVS: <CO6PR10MB5651D96860D20E2DEC0220FAA49C9@CO6PR10MB5651.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQmKQptJ8jZa1F7YzJbLSBTcUDmjyBDSYxpD8IqDJ1Kom3TBxnKNPkguoDvX8Q4eDaWz6Qxadt6NF51R5wlha4yIdT3nOdDV6oPQAEZaOb3uUWDb8gwrcvRXQqU7IRjqthCNOcC0pIEz/z+Li35eWpKy0gFfWGPO/O4n2SFw+0fTdBn3ZmoLfHiRfmF35ycUgyOIMMBiVV5b/FoAH2yxJvaP5t72/uC5eAtD2w6vGXn1fFPjffKHeE7jHgBRPw2RI8heNSflq0LWOszr9yxrivovLfol1IGuDCYHUNUPZO0hRG/evW/fec1hEPxyzdYu2Y+EuwYqrmAg2calKckDUFw51V4bI1tJYJsTSECYmyoIxGBv2h+V2ivrQ3DOuE6QLpLg1DZxtSIJpI4IFMtRIW0ycQ7WTP5OP4hg4fdY1p9P7lMIcomOzmLnNB3OmD2/JpPh8WkWlcaOuEQIFdWQ0C7yNcCTK8CWG3oRJlFVs3NZXerV268UBgPAF2b3aPAIlpPHuZA4e0hNL0NZ+PkrAOwvt7UyplMEo+cimHWMPmRuHyx0dAHmUvIS4scVh0MBvWu47ijg4dIYlkBljrTMlvx06K1piTbOIoNPKNC95q0YlYoc5N544uO6ikGMBgeAKrJn4WDi1OHSrJ8jsP1uGaXACmt01texkltM+mSHkUMDMtSgF1INOwe06XdhsFwANMj0+GnClB4lJV3sjDdAyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39830400003)(396003)(136003)(376002)(8676002)(26005)(54906003)(86362001)(36756003)(6666004)(6486002)(5660300002)(6512007)(66556008)(66476007)(186003)(66946007)(2906002)(956004)(38350700002)(52116002)(38100700002)(316002)(4326008)(8936002)(6506007)(2616005)(1076003)(83380400001)(7416002)(508600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q24DraNAlYKl7KO5tbYxF+hP2jzz7OXJVRHGkYYlXbxtyWZi0wiXOyrGVFtW?=
 =?us-ascii?Q?LPHi0yOe5d8KkmP0ATyHRTFZupRwybGgWFtFchgwVpCkbUT1NJ8hHZoft5NY?=
 =?us-ascii?Q?VOVNyKr11f1H4LsASwdzrbNIZa4QGoGBKB4GzXUGpRbUhUYfhkBdVaLTCJhP?=
 =?us-ascii?Q?d0QUQq03LYFWxakt5hI8eXSKyPJzdJyG6g9ZYCModSlNsDT9pnAmm+HtoLyU?=
 =?us-ascii?Q?gqMXbFVzQgHbqFk52BJsHWtYZlXpXA2pARlLldiOsL1yn3549pv5mXNozsCX?=
 =?us-ascii?Q?Jqj3UrRU7oETuiIAXtloiUmMPBimQXc9r/PZ5gNc44BGWII6SPwwqiH9DzZO?=
 =?us-ascii?Q?+YM3bMmAezimxiQUOBacLWt9bqnLXxV+FzhWEZep7rwd9fSp5VpMLMAIWL4Z?=
 =?us-ascii?Q?DbBrwnTvpwgXU9HOYsIQnp2hMgnfp+UbhGjlzfrNg1D5MvQgIzBk0tSmymru?=
 =?us-ascii?Q?jhL8fyKhke317YPNhhXnRCVBFrMJrLuVRvAayT74PT1+Pt1TNJEc4tOil84i?=
 =?us-ascii?Q?ZGn37YfTATaaNGYNXk53KrWQbIEp38bM+8TkZkSIspc72sR/I/6thZp5puOJ?=
 =?us-ascii?Q?TLUkKCyshgeyb9ZrspJajcR6KeZpcHZxPWfohdywsZ7LGCo5pY7I8cwGclXv?=
 =?us-ascii?Q?s8Rpb5yh9sqOhxNpQCMmozuw8xfYefvlbV6dDC4eUfp/NvaoSrPKgQmvH8KL?=
 =?us-ascii?Q?FiGmVi3XH3jYjrHrYxpG5FvwqosEKAJe6hDG+pxSW/2sUqa7GR6oWkUwpOZB?=
 =?us-ascii?Q?41JkxonvOpZkc49JqwK/Kq8JxsusTJ5YoLnfHI8Xyz+C4PMtBBHIKspngdnw?=
 =?us-ascii?Q?CdLmQCwMQlMbK3pGOngIvlVUSDEdg4g7s3MAYOOIujOGaHVyCW36cU43JpBG?=
 =?us-ascii?Q?qWsBW7SW6sIL8Bj+zO9218rmOQyJV5YFay4ziR5ZCm9//3qDNOUzqXfLpSlc?=
 =?us-ascii?Q?JlvxC/l3SlovIui3doMMqN1JQoks/nJywIOrJVMqfPf896MSEK2NmBgsnL4d?=
 =?us-ascii?Q?l5DoN1EddnvwU1CA+pyfyTCmregYdFs+MzDfF/6cHcxQ979XR/FhTiX+NXgh?=
 =?us-ascii?Q?kOB4+kK309YFlMIyZhvUBjHa3qL2AH3Uut0PNr3cTqnEmqAgJTIxBIGRIRHv?=
 =?us-ascii?Q?ZmlyZJASf3e75xuxyNf0jtbqJH3Dly2QRQheMEPJ0DYzB2zyNvaSCG7p1uKz?=
 =?us-ascii?Q?DeHG4jtZ2G5RbLgV2MgpRIFbF1AnhU54uaDkG1+qvQk8XMw5WiFBzD+s8/4i?=
 =?us-ascii?Q?7SSv7VhJte6KTbokc77hXrb7B20vM14zeV4LiTnzHl1oYPwunSoFlE/92GWl?=
 =?us-ascii?Q?CYuZeULKqvn6IYzbm2K2obSTVaglKxGTL1YIMCwtccxE6A3eVLkk719Pej2E?=
 =?us-ascii?Q?apgHOEVhwMmVJ229HeA4CMjLpvisOn+iNy7CmQ7/8DktyK4I2U28zxiosC6b?=
 =?us-ascii?Q?JvyoAGhlefdlUMhLmcdRWvvKaBiS4CnaznmD4nBwXilHUQc/zwU2cfAH3/aM?=
 =?us-ascii?Q?HgibvDPZM8DE5BdSmP7+I8CPk/ELk/eYwWPYjq9HRwG5AHq9AZqmxbtAV7jB?=
 =?us-ascii?Q?o3K/DEN0+h+WuN9DNU9W+3XgfUMrLKuXbgtcRjMwtZHPivkDbLeMDGLOVZdE?=
 =?us-ascii?Q?pM/RAzmQ3DEOQJ+QqzE9bpQJ/LeGMaSYaaeXW++FQiJHK0l3YRQXFiGjKh07?=
 =?us-ascii?Q?JcI9MQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3e0d93-cd74-4a4b-7abf-08d9ab971ec7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:59:39.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MofasaV69iT1+esWwmUZa8eJx/PInPLeFryGFSpyEpNU9yfWry53HXSVfff5K0/a6emN49L7c3/5hQreoR3S/sbOiIhv5pBuAKjfBMjc3rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simple cleanup to make two function calls only one.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0a36ec8775a3..306293314069 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1345,7 +1345,6 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ocelot_pinctrl *info;
 	void __iomem *base;
-	struct resource *res;
 	int ret;
 	struct regmap_config regmap_config = {
 		.reg_bits = 32,
@@ -1378,8 +1377,7 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 
 	/* Pinconf registers */
 	if (info->desc->confops) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		base = devm_ioremap_resource(dev, res);
+		base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(base))
 			dev_dbg(dev, "Failed to ioremap config registers (no extended pinconf)\n");
 		else
-- 
2.25.1

