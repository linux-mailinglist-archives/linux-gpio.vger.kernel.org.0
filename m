Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F0645FF0E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 15:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355263AbhK0OO2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 09:14:28 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46560 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244123AbhK0OM1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Nov 2021 09:12:27 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ARCs0v0000960;
        Sat, 27 Nov 2021 14:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=WTZ/tiBoUwxaMKzvQOaNuDeG9RMDaZr3VJaqEc35fqo=;
 b=G7sEnzI8MpDEN/6liHbu3OTQloP48DRKoabHeQ+tIjSe6qBfUUjLKOizMH6whElky6Ud
 394lWmt1iUU/JWeolx31xnE3SwlUlhWQZLca4/9nV9CotBDKUegueUK7WtfnFxHpSiG1
 DtDpgNse8mryHfkuBTWZPVwWEOskeOSwbgAgrOFD8ceWaWZySrYecq3qN7x3l+RThsRr
 nnIUIXHMslaaAjVNJGlCPZrXgaqjMt/HU9mCY+EDP42tGAxtBMBMygKbhLXBn1XFc6U9
 cQG/ObuwEpGTapXahAMOs7GaGPU5Wy6gPZAZ7uOZEC7rggJB1iGyumm757SOqIZNMMZ2 kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ckb9gh2fa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Nov 2021 14:08:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ARE5V1N105145;
        Sat, 27 Nov 2021 14:08:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by aserp3020.oracle.com with ESMTP id 3ckcg16usk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Nov 2021 14:08:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZvn5Z4e1Wo3Jyw3nBYzaLiYZyd+zam0y4Y4DXx+FpHA8al/XE+jViNI3nUSHsCxmyxjF5DZxxcgm391gW/lUcGDV+2kiYEVcDizvZeFUlkpWig6acf8YlLSmbnevkOI8TxuxGCTe3z90EMxYZcq4k+7oRNUkn/RjwqbYIIIn442VCHHDY9sWs7zqh+cRNFKXvexZdimiVnIb/XMpfmTjnZ0oakkVv0wKF7kIkE+RHIpuzRr/hhggBpptgf65VZ3V0l3OiwjvmICTNRuA5larvYZmFnIk4nTDtm52ONpwhSumXno+ARf7ztaf/luLooPo9S16571zARw0j4IBGHDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTZ/tiBoUwxaMKzvQOaNuDeG9RMDaZr3VJaqEc35fqo=;
 b=hFQhbdH/ddbdmN1orwzFUkJ3nW/kN5w+Za1QQ+kxh6qtYDLH8Qbxv9HnvGQ6dA1oJd/SDFqaMQBqOiLXcEdPdr81ZHBNqok851tb4Hwnng3KsUpIgHxX60shB+CI3OpAZS0Ho9+EXNdS/YU9NS9ACcYVbE5v3qixqxN9LPU3jFL+RNCjsLfzv5Uix2/GJu4o5T1VV2EKeoUeuyXpAKtWTpEy02v2Hfh46AlsOKlw5Oc5cJchdEiBpK9K17G7OCRgT64VnZKu6DkPRHa1ddkxDKcFH2m1gwMUoLhZMx8dqFgyeDqNWEsHUhFbhXWuymWd58d6ZUKITT94FZNVohhAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTZ/tiBoUwxaMKzvQOaNuDeG9RMDaZr3VJaqEc35fqo=;
 b=rJ0LMUp0MzbZnE3GKHKZJRTTfXmh1//BRBHKcHmLxw0LYHncjJsMVHuWuyWTqPNpYqccGinkU7+oH9GdSpKzuzuZFe88l4eh+DYtHsmb3omiKJXY/1b4REyqj87XeL1dtcWx5i+SaVprbaiw0REwTFW9hWu5/KZOZmxZA3/N0GY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sat, 27 Nov
 2021 14:08:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.023; Sat, 27 Nov 2021
 14:08:54 +0000
Date:   Sat, 27 Nov 2021 17:08:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: add a check for error in
 mtk_pinconf_bias_get_rsel()
Message-ID: <20211127140836.GB24002@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend Transport; Sat, 27 Nov 2021 14:08:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8e3afc8-8f68-4d38-bafd-08d9b1af721f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:
X-Microsoft-Antispam-PRVS: <MWHPR10MB182457D4BB785770EB7F18B28E649@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwAEPEdMTcX8o7v3Fh33YQvUSC4UpXVk+m2JAQCFb38FZ0dSG3IbxWCh84HjnNxRNK6Zr1VGUBmhTLz4tDrR1UBUbNurimco2HE1+jQzbl0jYpyCcYuo7Ns1kLkGDEQrXYWr22pJbdyY355glYZGDaMHV38Wnn6xqAdwSj1nJqmlCfXOe5JkH8oTMNjOmjspOc9vN3Db+FnnXOXeC6+T71o45HkiUsTBsZbNS2fB7HNE3KOkaLljG29GdzkTwiT7xyqp2oxYUbEb50khywkhF/C8Z3tdbFWyxKuBlC39enxyFK8T/pAOHSE+9AqcZJAraJjapLm0gVdf1vko+Amm17SF2OY8YLEF/dPx2freee29YNcN33ncSooCU4aKl4UgCW0EQf1cyj0oEVzavcVV60qAQtfycMB8+u8i5ctH8crjLbYBCuRiEgARYxl9BStmZMPUiQ8+eEEulG5zb1o8d6Tdp1FDInFKmwYquOP0NVBVRkmtcvM8VxP3NwJgCE5jU4PkS1FtafGVsi8kUyvLdsbZh7TbmXhiG2wvU17SlO9DQIwmGlH4mIco9JX378ajnS8rovtCDAMEUvLxJqIhi4eVNmY6ivO0Hid+Y+oxtIl8hT71tvn5/I2YRDJGcy0J8zLSG9pyirlYIHjcg7vw2nW3mfWDWagGoOMP+6fqLg2XJeOrPb1MsPOwQWHTXhBKT/Ta6/4t8CZGEGbRv1m5Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(52116002)(38350700002)(38100700002)(33716001)(86362001)(2906002)(186003)(6496006)(54906003)(5660300002)(33656002)(508600001)(44832011)(9686003)(8676002)(9576002)(55016003)(110136005)(4744005)(66946007)(26005)(1076003)(4326008)(6666004)(66556008)(83380400001)(316002)(66476007)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Ior8Kxy2aSWa0m47N6U2uzjQICzeP//9rIeJG0Yf1oL5oknh2eoCH0M1WZ6?=
 =?us-ascii?Q?DviT9bsJl23qMAly7lcCmPh3KPZyP06eGaHlKp71eZFheXvSSiditYavFQ98?=
 =?us-ascii?Q?W3x0Zlc7Y0W6sSXjsx1st+4o4hlV3c/CVhCZceV4VVTqD45+c9wrTREJM1Ql?=
 =?us-ascii?Q?+KkC6GyE9o3HvHaC0w8dM1/clLXaiOzznbNZj5yX8SOqm5TTSx3nd7gLZqHJ?=
 =?us-ascii?Q?dtaxkYtvhRa/6rblWWbU4nykJIIlxSHWrvj14WtIeWe5SQZ6HypK9Oa0mec8?=
 =?us-ascii?Q?acX47Yi4JMHcLcAS3kdlrTVlgJcLqjEHe5yiQimXj56+oByHFO5SLd3f+tny?=
 =?us-ascii?Q?OIWJdOKqxztxE6dt5KiaRNOJu8whZ4MOAxFGfvRwjKPl9OfTzaQ579UTADCM?=
 =?us-ascii?Q?zhceS5COuHQGbbMu+FaBMDS2RKnfWSJsmOrZqTIwVZyki9MbX5rsi9ccbrZm?=
 =?us-ascii?Q?jtm0rTtOjvD8ZiO/m7eFf5Z7hSjX9Qq+6wSRBA196GU6iu3u+D/++7Gg5V+j?=
 =?us-ascii?Q?y+Ddp51OvjpyR5bv6Q3gGr7XwiOIZQz6hIchpUfMwueyY5cP2aY2cNaFk4Sx?=
 =?us-ascii?Q?VRJ2r7PDp1hXLCSDzntDve9gWJ7fRNhBC5yDqiwplaXDGvwE12arpLRgwk65?=
 =?us-ascii?Q?X/iMXBZjv4O1ZWw/ZtD0u5W6N75Ulf/JSWMnYTZc30Jpgju3y0uXYkF1jWqY?=
 =?us-ascii?Q?no952UAGZdXzuqWW9B7E+8/4ggUH8f6O2EQrlzDMYoPM1LSWasXl0tmjBZby?=
 =?us-ascii?Q?MPEkNucmyMyXT2Iy0x11vryBXm8+/xTsnyf8hz431J4V1rWD4yaMcDS7XeQq?=
 =?us-ascii?Q?Cny00UjbAHcxWQ+xlVHDsW1Tigz4XV6qsfH8TyI6ScuAHTQKXFdZ+1MZlbj8?=
 =?us-ascii?Q?Zg/7GxFLIxXmZSUYjbBoB7gdqFjTOfGTmt5POa/YlPnRIQ2WzzM34QGnOi3r?=
 =?us-ascii?Q?TBqEfprlAvmQ5jlwa4ZrRA6lvrVaPcxu7YCkvdQ9QSzhODu08yIzkD+yh6L/?=
 =?us-ascii?Q?XpWkdGjpV4kIDneEZiONrPUFMEtVL6wIqw+Aaz9NdzUr+xOLFjw4UZGASawy?=
 =?us-ascii?Q?dWGh2EsuR118O6BlHm0pCRqTNuEX1Z5GoczSC/N/PwXfsDOYLDjavYY3UbsT?=
 =?us-ascii?Q?rjAy+yeu53beRBg8dZIimNAJl2umgIZXRbKBXscy+2AwRARJkJgTGff8L59R?=
 =?us-ascii?Q?fbykgj+lP057ejZkQBTcu4AZcNVRAVpIUH0iwSVn9+k7ZkPVYOkwc+g7LHIh?=
 =?us-ascii?Q?Q+Kjp4Q7nukBKKFsFkcxprTqyGzKE7ewonFW2Twg2aE64vCuSKYYHmdHVqD9?=
 =?us-ascii?Q?c69YNNdYAR3ixVa5OPfX3WSEtANpBqt65Cu3K/R7RFgzYio1/5nBZQrtgM+m?=
 =?us-ascii?Q?NXbAKtpTE0g+gdv9lOGnLh/eXzHAC0NqrIq2fyS/DwxOJgvizAPsJ3cwbwUn?=
 =?us-ascii?Q?wanUDP9qRC5IZQe52iIQ7ObNZc4UrN48AV+MyehpT59+rOcIzcFXdaq2GBYM?=
 =?us-ascii?Q?yQ+dfVFyoffwrPsWFyYS4t7iqAN/cOReaoPbnVQSpzWmw17zgTWFUX8+LEdF?=
 =?us-ascii?Q?LRmSSzwZVLNBDJvS3mELgqH7X+vab+nXA9LWr7XsptQfENMQusLcEcnfBdx8?=
 =?us-ascii?Q?JOsUJWuqwXVAi1VYSJ/o19/bNW6uZXWTKQ6djcfItPJ+HbjujQTv5fiDTzs2?=
 =?us-ascii?Q?pYWxEnmzzPvgo1lOzbtYBogpIAw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e3afc8-8f68-4d38-bafd-08d9b1af721f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2021 14:08:54.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/jPj6FsTR5sgsJjU/DC0QcIGv6LQ+QrOmVlHOT8Sd4iMsRUcupGWWcU/SPqg3gdILXMKd6JMhPcF5mpWNIhZpMUuesKOHTPauCpd6FQFvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10180 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111270084
X-Proofpoint-ORIG-GUID: ktOZGaLeDFduYFtGaTGuvKY-t3G4dVV0
X-Proofpoint-GUID: ktOZGaLeDFduYFtGaTGuvKY-t3G4dVV0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All the other mtk_hw_get_value() calls have a check for "if (err)" so
we can add one here as well.  This silences a Smatch warning:

    drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:819 mtk_pinconf_bias_get_rsel()
    error: uninitialized symbol 'pd'.

Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 53779822348d..e1ae3beb9f72 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -815,6 +815,8 @@ static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
 		goto out;
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+	if (err)
+		goto out;
 
 	if (pu == 0 && pd == 0) {
 		*pullup = 0;
-- 
2.20.1

