Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB6655757A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 10:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiFWIbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 04:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiFWIbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 04:31:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8F94889B;
        Thu, 23 Jun 2022 01:31:07 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6k0De021526;
        Thu, 23 Jun 2022 08:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=BSvIWUOr/fq1hovwX0lQ+gmufXh/2zeaV3fc+YS1y2s=;
 b=byX0giS1M9Nd6jchLXhaHYMIYbsTqkHg7TS/h3MASxszpOVtsJomUH87/YbKDa0AT4zf
 QAFTXruzsDG8InbWHk+7BpmZk/bK+HWnPiP4sPo72Kh9jLEzie7WOYdkrVvnND0CLkqA
 D8EWFUunnaahQPtbGmkS0v3Ttta2k6LlKEvnGqRnJu01EKRNShMEQyoDg08k0fdo9WuW
 XH9IsM0i4mFUCrGlFTuvVR0kABAGIxnjO1EY/NjKZXzou9Btzf/QzJ/qO4N5aB1yMD9H
 ago5t+w7mACqVFIBZXANLtOBAcZzRQaYSSDG57T7NI7sjZ7VQUijx3bVnF6yBuUs7Ino CA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6at2gps-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 08:30:01 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25N8MAnA012817;
        Thu, 23 Jun 2022 08:30:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtkfwe66d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jun 2022 08:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCH8ZUJpXPo1iIyb9XdifL9vOLNmlmwUkHyb5+A7EQ0fUHzeQ8LAFCTglbsB/F8d+IgFCDhfA1ak5hL2FPR16pfQ+2bJV+3eBqvTNgUvTW042ih4u1zupeBGdQKZIf4VMBUCz4TFsn1xgOZE8XdHIRZIAIxI34FzyuiETdUmjo/8Y1s31eCW7/rpAMFCcR5z+zTubGsiTtCwDq1DQ70IJINyicT0tbZ1kMG8Ha/9LqgBvLe89vF/HFscCCzmVCZ/wKpkzMr9IUwV9pR35JIWAmDUxDMF7e9BgONcOcNswcP/UuZ1W1Vafg+KT7eBZrjHtMFEVd/ZRLsmFxdkx9bktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSvIWUOr/fq1hovwX0lQ+gmufXh/2zeaV3fc+YS1y2s=;
 b=NnQq93CIFQ4QM0mMZMoTqyUqkFwMXtJu2K4pguQocpYHKwNwRXxJJaE5Gl0vg9rFfUDfnXbP94koXen27mXkzPQ9R/TZK+h4zLEUg5+0H40fgJfRv2SnJUx2f443TBO60XPUry3a6hqjiQgGZW/cTeobKX5cn3wmK4XRxhuAF8hE1aAyJKrIAxUhOiIiuxqtCmyCB+6XHOm33u8167hjkhKiJnvzp/D+C/9NxHFcQWsqmelpcKaONbG/Qi2s6Ou50FdZAd7NoE25X9baYUDT5lCPZUd23mizXUkNLvXNbsCPvQf+PG+vCxF6xq44sk8fQguK3cHgm4/MYqhjTCgNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSvIWUOr/fq1hovwX0lQ+gmufXh/2zeaV3fc+YS1y2s=;
 b=GSHzHoFWxQWb9ZFmrkI+7g9kPAvH9BZoFMSHm9mAE1QkIz9RIs9elTYgpTlf9FcPvTyTsen2vKp5AICGKLn+QvJdQgX1NpzLYfXiiti8907EGm7ucHkzxyGhjAOZCwU/AkEaqQLJG0ESnwS9znmWwx4pTWLjIU8IlYiTdra9Inc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5358.namprd10.prod.outlook.com
 (2603:10b6:5:3a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:29:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 08:29:59 +0000
Date:   Thu, 23 Jun 2022 11:29:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: winbond: Fix error code in winbond_gpio_get()
Message-ID: <YrQkfBuIHArxHSNr@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0171.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efc8b929-2818-4cfe-b901-08da54f28f22
X-MS-TrafficTypeDiagnostic: DS7PR10MB5358:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5358136444CAB933129BC2B88EB59@DS7PR10MB5358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYt9pj74w0Nw2FzrCaD2SpOhwgjXNcOuagy3cyW/kOuFEu1jAj2BaS5ONtTm2gsUhduy3xGawHVqcKLmnH0Rtw9VgzcS98vpoLqLedyJYvMaPYrK2XnhGFj7D7vj3hh+EfCeFxknPk4kwXeNRCTdj0T7nDnLAmOeW+loXgbc3eBcTd+5bwfysdomEIimBNaNrrMUyDp9BFeXFkSsbaSs9Q+3gJrihwzWjtpDHYz8e9YjNhabg5KpyBOOLOlsTZBwzf9+m+uARh0pmiJyiigctu/Sbg0eiFFBYrP2IVEIuoGIrjkJfzYo32cvlUmdIFPrWI9v8p7/Kq2FdDgJ2cN2LSjsdgunUeY1JzRCjdz9B1R9bgIJWM007PgNXekytE3TItLXI8rYSdsjzMUSikXxv/4WNY2aOwkiWEwLZ7sN3Se6uH28yMZS2XK2mRZEN3yX4VtABDezNhwjct9FN/1wFiGPZUmj+0WDCUudteiVrr88vx4MUXGjhOVKlAYqQaT0+oUYQ0Km7qQ97eoEYzAa6wgMwbzeiMa2raahCDYyGcBTZt17/KumBQR/Oc7INeZ5Yhi7YvKWQfKO5Ar3I7RSrawFDhnMLCpKJTkDkA8XOzizaUAVd8jTNZOR6B5es5GrBt1OYCVf5I4rH8dlg27H2tIzRqS6WPUnBSGEWTZExymYkbNuj8xjWf/RYn0aNhv0zJrLZM4fvgmDQsxpPSAE1XIVhNgw4JIIivB7kFEXp0Q52JS3gSl1ia4U/5oTZvII
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(396003)(346002)(366004)(376002)(39860400002)(8676002)(6506007)(9686003)(4326008)(26005)(38100700002)(316002)(41300700001)(44832011)(186003)(66946007)(5660300002)(478600001)(6486002)(2906002)(38350700002)(8936002)(110136005)(6512007)(83380400001)(6666004)(33716001)(66556008)(66476007)(86362001)(4744005)(54906003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7w8I6x8JKd55EL+TaGxhtztzL99QXpAoOf0ORPH/ci92XqECnyAO87NOJEx2?=
 =?us-ascii?Q?fRYfbr7P9CHbTxFpEQNK5ifhXK7Qk14035Ovt8M0ZbQfE1yPNaQL+GHg3omZ?=
 =?us-ascii?Q?iK7rIqJyg67CAepNBFGEZeR0S9xIZcFITAjkmNSVWJd2kK0TlNn93O8+C2aW?=
 =?us-ascii?Q?9Gv2T6NXl6iqKMXucW6RrY0udxgwq3rgR3soIq862xt92DV9Ay6drUhFRboJ?=
 =?us-ascii?Q?NIbRCwK/3GajSdfe4XLlURs1sNxRjsaf5lEvYYtheyjlLqm1k1MGoyOO935T?=
 =?us-ascii?Q?AySWAeKrYzDVV6QY+PQovIBVr7iu8jr5UEG93CtVkLPAVN8dpvcEHFZgagq3?=
 =?us-ascii?Q?w2f7/FbRsmQXaRV5jl4UT2TSNtBpO8JIzSnjpf3R3IE9NnFeCXhzvuWqBdb0?=
 =?us-ascii?Q?Bye4wjZPxeConuIkSLO2Q4vYXipEL3hz+a1TR+Cw+tW00F5aB2FBq8ID8gSP?=
 =?us-ascii?Q?dWkMpGVL8xnMCOJdfdyiQfrK1bZOOpqmw/VOV6OgYTXwmyvatmG3SknZNZ9/?=
 =?us-ascii?Q?DJZ+6lVNWboU2EDh2frzgtrauyvQ0vyD1eCUEWxclIFL5WT9MHYJhtXkLe6V?=
 =?us-ascii?Q?cNaRdjyc97YYBj3rgH/JRrjHqp23LILRTE5CESshWRfHpjzncoWVw8pUe6O7?=
 =?us-ascii?Q?Hc7vTMJrUdxJUgI/OvlhBYNaMeKXE1iwMpBpvQzfY9g0tteI+y57rcsyE0Hg?=
 =?us-ascii?Q?EbtMx7MJCF8zkwenRMDA8dRYmlC7xohT5x75T+5WBsTX/104m8k4rdPIGXYY?=
 =?us-ascii?Q?9VInoHCE43h8eH1HCWIt7TuFvWSYZ8IjFv/D0SVycm/xb0frF8LadqMM3i2Q?=
 =?us-ascii?Q?JyJtL+nb9/rH7LdguQ7yNMFC10uBG1m+f9hWVdorhXmoxC7CgMiVqduSgtYh?=
 =?us-ascii?Q?xWf0JOdSeJuE5L3wGb+54OoJu0VPjBkt9kqr8wk8XG0nSSj7vHdd37OcYngM?=
 =?us-ascii?Q?lw3ER7aqdJj4Nx99CYBOTNFc1zNf8TCqU7DdqzYQiKhs/avQ+0WLHv8tSuGz?=
 =?us-ascii?Q?VQHOeZbbC/oGEKMLcMQYWy65ureweOWWti8vD71BL1WafyX04e76rUgrKDyw?=
 =?us-ascii?Q?jt0B4DxNBtxoLinz7bpSerDTKChkmHqcvPe4QKEZ6fXzwMeUuHivRK21VhiX?=
 =?us-ascii?Q?1jACDMmPAKQzPXoQliTzmDTDd6bCb/+ZzxBlYrje22PxgJAS/FkRkkvyNMHs?=
 =?us-ascii?Q?33kLSFSfgGyWpOtt4XbK/ZAf1xVvjpMzaGJYfMgh+yXhctbMscpQfS06L+Uc?=
 =?us-ascii?Q?i9BOyYMdiYNCaufqOPv+Y8v4elOrqfoQ2Gt5Qr6BeQj+L2GFSl4srWovXIJk?=
 =?us-ascii?Q?Wd+cb/EtZbUIQ6qOC6Er0ozcgztF4DOq/dssvbY5B5sjsr3CZTJgZ+1TqCzi?=
 =?us-ascii?Q?l6k/HGc3uvASM8oJW0qS9yafvPOLy5Recf1U64dMZ4ylruPk21EZHIhFp17O?=
 =?us-ascii?Q?DnKssF/H8opi1WNwMw3QQVKjkW+WJ+0uoOI0owbUaMgS7IdMaD/tybRyK1yu?=
 =?us-ascii?Q?UmpbG0NvynnI8N8qitQ3wibfn8hHmZkHhB1TW0nQ0f4xS9WTHXaHcfSYtAQm?=
 =?us-ascii?Q?OboGmgHy8qvBE7UmzKOi9IMCxmDs4ad509SdUrarv4IgP8TpzFWjFKk9Y17D?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc8b929-2818-4cfe-b901-08da54f28f22
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:29:58.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i+XfJYt0+S2twvuqexmEmbuBb62Lo3rlFTrvyE7NxfFXa8DWesQpm6h07/3K6IEeIp4tQc+lGsOGoj9HA4iwdaqGNWnY3+7Ynq8JnKOIjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_04:2022-06-22,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230033
X-Proofpoint-ORIG-GUID: EJGH1ESO35YxmcaE3Qn8Dr-8evfS0r4X
X-Proofpoint-GUID: EJGH1ESO35YxmcaE3Qn8Dr-8evfS0r4X
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This error path returns 1, but it should instead propagate the negative
error code from winbond_sio_enter().

Fixes: a0d65009411c ("gpio: winbond: Add driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpio/gpio-winbond.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
index 7f8f5b02e31d..4b61d975cc0e 100644
--- a/drivers/gpio/gpio-winbond.c
+++ b/drivers/gpio/gpio-winbond.c
@@ -385,12 +385,13 @@ static int winbond_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	unsigned long *base = gpiochip_get_data(gc);
 	const struct winbond_gpio_info *info;
 	bool val;
+	int ret;
 
 	winbond_gpio_get_info(&offset, &info);
 
-	val = winbond_sio_enter(*base);
-	if (val)
-		return val;
+	ret = winbond_sio_enter(*base);
+	if (ret)
+		return ret;
 
 	winbond_sio_select_logical(*base, info->dev);
 
-- 
2.35.1

