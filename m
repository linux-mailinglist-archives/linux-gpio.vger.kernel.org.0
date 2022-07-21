Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE7D57CDBB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 16:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiGUOdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 10:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiGUOdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 10:33:51 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AC184EFA
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 07:33:51 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDnAnN026464;
        Thu, 21 Jul 2022 14:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=1x6aTYfFQbZgQTWZVx/xdVZ1U7vruzVBNlTv+nK+Zwc=;
 b=G9FcZXrfjBJx/MfwAKxNpjUoMDuJmGRUsLZlvsTk/yh40Sy8G4AogzGwXA0xsuSXLFlI
 420LrXAPkZCy+GNUCDIxRgKOLzM52kFMV0Q+6xuiMzEoApGzM+xr+dY1a3M+mmLnSLdS
 sozypYml3HwRh5+LlEAiVekp6JdhJqfbAcscUrOh1JFsMpVss4ZbNvGFUVctEgsuZX3V
 6Z/98Othvy5raJGW9xHV0lW8ZCs255oObA7En8mF4oCqwYNDQwkGc8GO2Aog9ZvduHQS
 GI57UVCjZyPTfvNbw1cxhBJThiz4hCPhmL1r3bsXH8g2nd2+sHv9pCgrjb1O9NTlv9CJ XA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbn7acf9p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jul 2022 14:33:50 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDFgGW016474;
        Thu, 21 Jul 2022 14:33:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1ephd1e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jul 2022 14:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4di6ZSHLBoIBB4jIjZrtClTqPyBfsvehtiydIHmEAojdDaIYB/+7x5YDJ/gBZnMguOgfSYfZ/uvfGjYcBe3jRy5fXZtxtEJPvexSxVcC+ipoCvgdq4hlRpZnDbKEmff4EaKIPCqdg5b50+7tfMu0P3/bWmxGTqmVpr/XlqYciEGwbqy1iIFMy4XuzzvU5K2XnsuXmEN+lNNJi1YSaWubMcJoyJGD3gIkqOalyV0NbdXGh/B575YGb1nIWyJ4Cve8iDLK9mjLVpvokY0AKFxHuZZM0CEjlwRHRBj1nmiPFHkOT4cbe3VUGhxp60EaHw4REeG7x453X4RFfzVMZuyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x6aTYfFQbZgQTWZVx/xdVZ1U7vruzVBNlTv+nK+Zwc=;
 b=YMhHV4b+oLLcqiibVGQR0TZbXJtmIFMuFUzxmKAOcVrTsYmPoSJskbhR4Mw7jamlM++uEi6xbvL9aYmeCHvAfLPnCNyR8RDoHG9o2ByWbtwseM/qySTRKD62x79PkvLVb6JaNnoI3VpLCGkidIH1aXP+3in3itihUizIfdjtQxgKac9Bgr29OPG8DcsJAlaHgnsRoi0aU7CJVAxF/cQy2Jit8OKldi/tOQ8KtFMbMu2GR1W7C50Uo1GpLWG2fJp50XCMn5OijviwraDaezQIrMPgcLBrRqtHzJFaD8AQVv73bqUSxfkH/7HReBNZd6X5P0poGHXVxP7/J45mXBvXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x6aTYfFQbZgQTWZVx/xdVZ1U7vruzVBNlTv+nK+Zwc=;
 b=u2WGYpT7Y8Nkv3GFBJNVZbJm1Ei81XJCCkRpK9bUSDZUlT/ZkiyPK5+TiNlrq9nlJl7ars4csWkotb+O3dpnIxQS64T/7ewwSQUYr3RYZBPJRNWGQ0NKvJ8Iavdwh1zLWh+o8ZAi8mDPb3xpQkob3pA80uOl4a9XfpM1yfGO6n4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY5PR10MB6069.namprd10.prod.outlook.com
 (2603:10b6:930:3b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 14:33:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 14:33:47 +0000
Date:   Thu, 21 Jul 2022 17:33:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     andriy.shevchenko@linux.intel.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] gpio: 74xx-mmio: Check MMIO_74XX_DIR_IN flag in
 mmio_74xx_dir_in()
Message-ID: <YtljwoAB8nrm7+zs@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3838e8f3-b6d2-475e-6403-08da6b2605b6
X-MS-TrafficTypeDiagnostic: CY5PR10MB6069:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9c8ACbPMwYKXBVB24dv0o21c1W8S/tlaSgysnt7KX/B4hPi4F4hWs8S3ctyW9qzOefVk/W3KMPuqHSJduq5OlW38oY2JpMYUOB9FSZnhD695rSINaqIaCGR+rRprlArU76Q9sIkkdTFXFiqej3aT41tOSpVsXNSjW5+EGW1CXSfB3xW6nGKGVRCs0HcdaxCNpJHHv9OZPoEDQUZHxtTaX5Kj+Z3I20pmCc8b+gMISEHJnW/Kz9w4i3bkk76kv7KNDTLCv5AyHKZaCuzHyBXbv4UTk9H58uR8dP/Z8XOYuHE+uYuslzCwMAs3OiX2TbRcE8BegJJrOt2qTG6O/MiF4bo7J6Al+RhM0UBgPgsJWKNZ5Z9sNYJBlplci4Yky3gc/6Q23xLgJXMkbwngKIFJ5bOTaxJGR8bxzZYqqF7y4FfaVHL0/TsqITod3FYmi/pZQ4zokfgZLNlo3KPW1zUhecx1JhO4zHdit7zqGnx/03NPwJZJjMj+xUDlsVub/ybnmEX/6Xm9P91P/x1puWkDr1EDvnPxTJPrSPpNyXavxjbV9aG+mh0ikCqm2qOoWZYXBEjCv6kKELGT0Je2JVWywlqEOAMMfmzrTD+xTCQ2SWEcZjxCCvK1G4eI2NAI+SB1oxFSbYqMgHVcP4LoqUG/IsSaXbErlByL1+TdJyI45iIwjXGm+KdSZbi7zDUhSwNdGnEv4yetD4nSLHZb/LloQu3VVahkapzWJXwuff72Ir2T1zgLFyELJ1emnbmR1ScRiVmW9IwIL2ZvHHKw/gd2i0rAppjxTQ4vu7sPoNTSC6eFD+Y2f1n4OTq9UposW0KsEjAUCNb1+ja8v/uzigF6qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(39860400002)(376002)(346002)(396003)(366004)(38100700002)(38350700002)(86362001)(66556008)(8936002)(66476007)(66946007)(4326008)(8676002)(5660300002)(33716001)(83380400001)(2906002)(44832011)(52116002)(4744005)(26005)(9686003)(6506007)(6512007)(186003)(41300700001)(316002)(6666004)(6916009)(478600001)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T0x99+cQ9hRbu/RFJSmrOQiPGAnJXseuH/a3u7pMPRhddKrSerphj51uoOM5?=
 =?us-ascii?Q?NsjBdr5oRINZb8C9WK7jjD9pTLDLdWBf1ck0vDOmKRFS9RAIKQzHf+rzGHWL?=
 =?us-ascii?Q?5uLKhjLDa6qA1MrQMKBijCClJrkigUhiASAaIAtc6NgC8gn6xi1nuU3BGChJ?=
 =?us-ascii?Q?WLQr+Rm9EOZpIPRHPldxSxUIoJ2xO/48+TrUvM2MZbuL1cVzfQ3pRSKUnzje?=
 =?us-ascii?Q?70usf2ol/qyFvzDiool+OCG3GOnHm3kRGB4HYP3z4D0r6YnjwQAHiEGju+Vq?=
 =?us-ascii?Q?FF3IPg1joJIcfWOywwvgdMTazX4hDYSDAG5/vi/SJPH+t9vrmStZNRQjCNYX?=
 =?us-ascii?Q?cMRv3OlK8MYovh+dA4BwLEQOSaSB3mmpPVo6o2AejSTOo01MUB0+Qku/K4xO?=
 =?us-ascii?Q?pTsm+8OcivlgSYaPlxaSbvZNR3emFNRKNU42GaC4TQ44nKBm1Yf53Fab8yNh?=
 =?us-ascii?Q?537BYi6ZIlX7LBh1xpx+IqiDWuo6Ju8QflvUQ0II/I9Ry/tfvCSMslpNnFzF?=
 =?us-ascii?Q?arhAmKVEujNroGkRIqZr9E92N5i7oSoBuDEzseOxkG43HqVIcNBEounmwHvk?=
 =?us-ascii?Q?oCT8oQgC487rTR5lDpjpQt6isN8WNqFNF5+XEnIrGo/zgxEbo6IusrkaktdY?=
 =?us-ascii?Q?cqIMfjQOXjB059aOip8jPjekKgG9AdYtiBmDOsQpqrn8uYqsJU19JkY8W+1i?=
 =?us-ascii?Q?qoIaNNiVQp5eY8zYfcvhtAUuj6poCO73FnBZbZB73rjkB3oGVAUj4udxr78E?=
 =?us-ascii?Q?MHWk9GQEci75Nef+caKJIaYxvbPoukyyf4aLet3j/71WttqsyWhLCDx0TekL?=
 =?us-ascii?Q?XEgh2hLuctc70ZSCB5YHgTgEYSvNDFmM2RtPHVYkwL/1Pe4DD4faUz1VzMGy?=
 =?us-ascii?Q?djkMff7cwNEe6E3RRkrFoQTFOCKkcZWbZF89+ngkfvyZ7MxPIjcgR6HoIEWC?=
 =?us-ascii?Q?L2cCC2CzTKPXU31iGu8uZ3QwTBglUunxI6krIGQT7ziSEJuspjd8Zo7ovvmZ?=
 =?us-ascii?Q?SsqGbpfhBCwdUeALjyF4HyrZz7rZQkIMrye0Jy3VN7aRJ6yrL1Gj5dKHJs4D?=
 =?us-ascii?Q?HohY1Dw00Qzwirdkc5nhI8FJmwbZPBpdiZYGuh56G1R+gyDhMzA06KulJXXo?=
 =?us-ascii?Q?wzQoApicMMWtxVBchHDK1pU6Jy8DqYEZtjtRKhmjiolmhTYQpkAuSM5P+p1/?=
 =?us-ascii?Q?yEWiFVhsMX6YSUS6LbOd62pfv7Z+5Kqkferrz4EWvqFQLMeFulwyIHW+M4nF?=
 =?us-ascii?Q?Xb19njavGD2/fUEPxitykW5gB8WdfPRUHDf2mSE136e5s6AkX0ro1ZyNIhYw?=
 =?us-ascii?Q?3QjQmm45yajWpfnHg0VNSr8Op03bqbJpjRaOMJ2V1gSdMXNCqfu+J0zYeoNW?=
 =?us-ascii?Q?iNlRBSNZT8BH4B96PDidr38E0aaIZLXjyDD6ZsjJyaW6SWHthTGLujOfHNf5?=
 =?us-ascii?Q?JYjve94qErwcLlId12F857erXkZ+IeY7BenmyEXbUaQN1b0tHUHZwte6FLVg?=
 =?us-ascii?Q?JngIVPO0Prvn29TIk3Is7V0Tgb18MW8YIzUhq6UHgYmWrYXtPidQcxq0DJXc?=
 =?us-ascii?Q?0R/QTuR/nh+WXj1ecK6JRoTNymS1UNaPBAg4iBiTK63smcQ6sPxnhqGAxcgo?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3838e8f3-b6d2-475e-6403-08da6b2605b6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 14:33:47.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoh5+QxQ/1zwJbNwsW/LDC1vgxmiTIEcfeZXtyt/y2xtwuxylHR4cCnJHOh2dpAoBGgeE8MeCEcu4NBp6qOpfG6GBfRMYUDat5nZd7eKe0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=884
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210058
X-Proofpoint-ORIG-GUID: ScG0Ay5UU2QBsIgXtd2thvCdJxKvcemr
X-Proofpoint-GUID: ScG0Ay5UU2QBsIgXtd2thvCdJxKvcemr
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy Shevchenko,

The patch d3054ba1db62: "gpio: 74xx-mmio: Check MMIO_74XX_DIR_IN flag
in mmio_74xx_dir_in()" from Jul 19, 2022, leads to the following
Smatch static checker warning:

	drivers/gpio/gpio-74xx-mmio.c:92 mmio_74xx_dir_in()
	warn: bitwise AND condition is false here

drivers/gpio/gpio-74xx-mmio.c
    88 static int mmio_74xx_dir_in(struct gpio_chip *gc, unsigned int gpio)
    89 {
    90         struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
    91 
--> 92         if (priv->flags & MMIO_74XX_DIR_IN)

MMIO_74XX_DIR_IN is zero so this can never be true.

    93                 return 0;
    94 
    95         return -ENOTSUPP;
    96 }

regards,
dan carpenter
