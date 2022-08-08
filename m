Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936E858C893
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 14:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbiHHMr6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 08:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235645AbiHHMrx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 08:47:53 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F880B89
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 05:47:52 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278CTOdk005670;
        Mon, 8 Aug 2022 12:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=m7+cp+eEHExPorhgtm2Dsm2Iaw/uBavgVBhlPM5r8Ms=;
 b=rE3osQroAN9p35o049OXyVtLxRFtOKqq0nbXxz5ptjO9TnsrK9PNmx6XYyhHM2ThYuin
 z0iqxcoqnv4dM4Pr9ncFMUw6VYsNbOpBLsDWpYaGB9HGVVU27I5ABaQpm/pzDL1W4+oY
 M8Is3QnxSY7/hQmnU7uZa3a6z8t+PG8kXO28SFy4iowY0hD/W2f0G+yL7VmYUj4qmrzS
 TnGpD+qY0R7P318FESWH8PZv+BmTLkCs64HmIB8rLIfli6iq1+tCn7/5+1s5sdoZU7Jl
 sGOVb1l8oRD1etOe+2Jd3ABCVUlWd1M+nbAu8w+Bn6scm+wdOE27JSgXrDAGfpdi/i6d 8w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hsgut3cpr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Aug 2022 12:47:50 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 278AI9V0008932;
        Mon, 8 Aug 2022 12:47:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hser1ps5x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Aug 2022 12:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0Kp9xQD2GZ5h/Ny72Knrjnd9muNkfejviCB4E3LOU2ZyY9XehCkYnEffrHbAV5wsXhXlD07ylg9vYl297UTxDOFUbl1Q3CnWQTdS6nMrW2Le2kXfvo60HjqqDdXu83JIb9/S2JCU5a8GVgJjYv17Hm0tNHffNgRz7+wbRuT0vk+R2mDHwMSKSQnD3j0ZbcN2+bGYdGZfr8IXDUf8iQHrJVJlyhG/G5Sjvrwm15e2k9ywXRHMLseHSGaE8g33I7OsjOnAU334b1Jq/HxnSXw7jsFgIdR+jd8mq2X42LelDJI5npNqnKZGtK0IEyfPtVuE2Ao0dBk+awD+8a6dI6rXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7+cp+eEHExPorhgtm2Dsm2Iaw/uBavgVBhlPM5r8Ms=;
 b=FAUNMYk6ORrxQ2gHls12Rj7b3a0VltXqq4MXiNdhACd4rvK49/XKEiEn4YAeUqdqfx0Dg5umBl9CM6FrBAXkd1YdVbLdor/2xtKNeqiJQBXc1NGjby+UCNchD4lcROLxz/qvxSa2L2DpmP+R6YJf6+s/uNVfFuEvc+mhqSQfL55PXYaMM0W39tnpjGPqc0yFa3M/NCiknhfOCBN2a+SbzO+nvL+E7ISAdTG3W/+DM/W9w/evRSdiw3QCSvRmhFqJkEihyUt+ZLjyK/VnsuZJ8lvJv+IoRpVjEWf/YqRINyTEwmmIUUgYY0hVMg7Ehzqr8N5LPE08XNhNM64i0Sb54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7+cp+eEHExPorhgtm2Dsm2Iaw/uBavgVBhlPM5r8Ms=;
 b=Fd8eMzTF2CaZDR8BRT1upBFc/WGXg1/8/ZwT3IjOnV0noGorYYiaIMN1CfisxnLuJIHA8DwXIlEClmQsxq455vqHex713AkkfKKnJ4mJA+GG4/d7Ol5raJsNXtrRZ77ea8+2hfLXjrQx//+Ou9ArFgASse3dxIDDjZEwmn0T6EU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2718.namprd10.prod.outlook.com
 (2603:10b6:805:41::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 12:47:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:47:47 +0000
Date:   Mon, 8 Aug 2022 15:47:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: amd: Use unicode for debugfs output
Message-ID: <20220808124730.GQ3460@kadam>
References: <YvDlZaydFKN5loe/@kili>
 <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 822df9ce-ed54-4ba2-0d52-08da793c3232
X-MS-TrafficTypeDiagnostic: SN6PR10MB2718:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wy8NdpdoDhb+Si9gexUN8QoGO0BBRCLeqgN7aKg0kHkMXn6TVGeKU8oa6szMPR5qRVbw3dF4x2/QQW/KwoOv3tStq4UpfXz00hszKUlaYQ1N6MLECDMiDuvxd/iWfFdQFRPOzco7GGhFfkMtYGhSS3SZ0k4VrrD7dCTzoC82IsGYXl5u6YiiPpQ4eBBVnM+QuaqFUcjM/w5RaFFR4zSQuhujn7ldrQ8qARmnowGIFTPzOSg7TinbCnGSjJmZWpST+m1UY9QlndHuPMDva99GSORHtV7U3DCwGx6MENXEOR4JCzaN3+gsxjA3c68D2/AaUC/GG5myJ7vUYUONzGdAthS6BM23vw97JiREjpYF43XS+EgD1Qk1GG645pV2h6CKPGLpQRChbjdejcd/7qRIbD7uH4Mw4OkDPe6sSyVCgnR/4ngbXvqB1xP6ZhxUEgTn5kEMxstDR9ejgDrw3Zz2/TSIA9OMaWeNzO8tZKFh6LaLW7OJQ8qjCuhfJ0aGhr/YPSsSv+CvA/xITirToQBbycvxL6VGu1L89qDx2Cf1RqH7d4CRmymWHNGshaTHgbH9NmwhX+y7IRH2547Z2K1PfOkaJGB44Mt3/UraZiTjqVavrcIQ/PWUTEeDgACm7Bt5ntT+uLb3/ozMX3bvbevVhX0GLltaVpsnMUzvTcVbuAE+pkOLC81A1wHIJbCiyz03RumLPupjwlXwzgWqsC5+fF+ZHQ4fX1w8wkk4UmgkhGMR1FLD+VVvD486jSqOp4RAuNuzZXrDMEEv3pWY+RTCAYoy0bndpG0bdnIFbUcbLfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(366004)(376002)(136003)(346002)(396003)(52116002)(186003)(5660300002)(6486002)(1076003)(478600001)(66556008)(66946007)(6506007)(4270600006)(8676002)(26005)(9686003)(6512007)(66476007)(86362001)(558084003)(33656002)(6666004)(41300700001)(44832011)(33716001)(2906002)(4326008)(8936002)(316002)(6916009)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MoXmNpLvBRtkNJQuIInyqyipamcJL8aPgtLzHnL2ZTUUy4P+iuFP86Tf3Aj0?=
 =?us-ascii?Q?VfJTzH4KxkySor3EThjaGiB1/BmAvhXnduhtRO0K5hXxcfFLEo3O4PreBNY4?=
 =?us-ascii?Q?nwxP7cJC3Ln/VbuNUCLaJzNMh5ZuoMQcVnIX4UBw11DfjRgsqRpAFo8slpL6?=
 =?us-ascii?Q?8/M2vPs9vdFHc1eV8Dzs7YTFAbTUoZLHNZcqd5QRAwHugmwZJt7F/Bkv1Zm7?=
 =?us-ascii?Q?qrwjk+VjRL9yDiF+PdubOTeJvO2X3ocvz31A3jRN4KdJ4zHF84ZfcKeG7whv?=
 =?us-ascii?Q?UeaNAURaPCIYKPpO9UaKrw6C7Oo3/0DlGJCzoIdTAjRbSf2Gsd3j1KUzSIbN?=
 =?us-ascii?Q?TstDvchcwXnoWTkpCan1Jdv5mb8/rm4wloiCqb8eMyY/P42GQvLi4LTFm88g?=
 =?us-ascii?Q?S5QWsEK9xFgqTG4txUSxmq0ZZj22iAPzc4zwfhZOPdClDXR36CX28FgiPu2f?=
 =?us-ascii?Q?/IbueX2vIToE8jeTo6GMLwGKRjJ9HDNZtT+6FsW9fsszSvsPxufWQfrBlcLW?=
 =?us-ascii?Q?0oZ/lDSx9hjcTQScsiPt0JXR4IvYUZKd/hSpzX0JylnyT6uAr08fqJdbYpyd?=
 =?us-ascii?Q?vQiZxZJbaKSj1uYNhCUWntn47sddWZa7zRW/TzhD3YT1m6hivseusYuCpuZM?=
 =?us-ascii?Q?vM9F9oQrCd7fRVytdSxluGHprSjogOFmTfq1q03U+8kYxkbRc6lJiePE/epc?=
 =?us-ascii?Q?eQAZL7fQFKavMZj0DHv6MNf6YrvhSIjDLOT8mJD0GViCUNdWzdjpIsLTk/Zt?=
 =?us-ascii?Q?4dKZmzb8pmoHClqFmOy4k1K0qKkP6gyxBzIwam17zAW2n9Eg3YqoescYM2l/?=
 =?us-ascii?Q?DLYNsgF+OD8B8U4Giom/0FDDnohIpBCUKqQLelH1gSOiei6OioX8jg35nOPu?=
 =?us-ascii?Q?DEZmhJN96Kt/fGz5K2dBTycDnDPCqq8k9ZB2Tvf2GOIwx0jE4JeJYDuJnKgI?=
 =?us-ascii?Q?MmjauhIKQt/AdNbjmY+K10nkT/bnATB3jfGNuXKclQo2pGzDViH/1hbJm6jM?=
 =?us-ascii?Q?yCjYPS3im/OW5haa/VO+8uRCutIFpnHgx+4h+f2VQwMsOHyzYt+GONuj/Wgb?=
 =?us-ascii?Q?5FGqsSIWTQO/cmscB7eZk1dhMZ5ptli6Zk0IG+9+yrqBVcw9/VZQdAC154WE?=
 =?us-ascii?Q?CZ9DjWS2SDlLE4cBXyXioVYcBebqlv4XqTZ1Xs8hgWwcxuKVNZ49YJQ1gA/W?=
 =?us-ascii?Q?KW3K2gaIrEk2qa9Zo141epFmNO4i25gzNoiimXa0LDobsxfSG8z2AX2jp0+k?=
 =?us-ascii?Q?NA/mF/gBlq1Vda4kG0VMTNQYBwOvqgEQhl5IMBk2tdqvIzOJAQxXJNVAV+9d?=
 =?us-ascii?Q?/84BR+WJKefBE+b6ltWeBPvngrmdJIE2nrCLz5j8hAsDMBrupuCiL+NKA0Ys?=
 =?us-ascii?Q?cZ5eGMWtAlidSLclP6INMiAiv5amRa8FwaDcB/8AkKpmPYopMs7yq34GoEPg?=
 =?us-ascii?Q?PDxbYYaGWNN5/1shg4ZDHQVxVax3FMk17YdOyQywmMHr7wY+GjyCwUmEz23x?=
 =?us-ascii?Q?0iy+FniVjgqzH68srmUsQ9ZoLoPSIn+ggy0bOJK8wc5zcqVESr6v4f2aMo5R?=
 =?us-ascii?Q?0Q4Pr1jPyl6XeiJZ2FifPHqut7VnPPmhzQgykVQUFgXzOUHs3xSPzNtAXYEM?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822df9ce-ed54-4ba2-0d52-08da793c3232
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:47:47.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbppQtoRK4mE04bu0tkg/JCOEXblF5Ivcvt8+eZWoXc3A51RShP6cTGN2AXnEGkiqfIdcKHo9XYNb0o5+wpyTpqtri7fYTouxxbsxzGNwBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_09,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=920 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080063
X-Proofpoint-ORIG-GUID: 315w3U5uLd3UOdsyNNg4sssMHjPWsdar
X-Proofpoint-GUID: 315w3U5uLd3UOdsyNNg4sssMHjPWsdar
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All I know is that I have become old.

regards,
dan carpenter

