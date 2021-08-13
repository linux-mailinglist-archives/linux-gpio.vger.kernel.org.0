Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7E3EB5AE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 14:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240266AbhHMMmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 08:42:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47192 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240145AbhHMMmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Aug 2021 08:42:38 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17DCg1BW010488;
        Fri, 13 Aug 2021 12:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=6Y5P/v7eG2wHm/3/KjzVlyyI4zS/X04RlI+9SE6VdlI=;
 b=J9M00+o3i3Wd92OD6Wr+WDL3L5ecXqtn5UspmeVP2xoLgN6T9DCDCBWA0/s1M7XluqyP
 Q+ac0P47Um5YArwuHhLPKD3dnqwSQOcM43JabT3sO6SZQI4ZIQhfQOXuAtdPbWxMath+
 vJ6DJdalR7iJEFSA/WPj+c+plvmRb5vwAWkInLRn8YgUlNHITaePdGDtoPf1aW5UOLwf
 AbSJZ/ZnZdn/ky9YMCJHDbbeeqW7eVKLtq9kwFYt010gz22tNrAmqfghXpD2pkHFsPHY
 hHiHPheeXfHqh743xbrX5rqnE4u7Y41lhsvRVckJSNk0dP801JwAZceB7/Z2DTlTVxAL NA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=6Y5P/v7eG2wHm/3/KjzVlyyI4zS/X04RlI+9SE6VdlI=;
 b=DuKzUqgT2yE3YELHSvSu23nWRn7v9nFlWi+zx2z2KDfaFnhzCiAf4Q3+I1dro2EQxLf3
 2al3rQy/bxtZ0NOELKmF4L7eLM3pY3pJ8Nm71JqrzoXBdeZWtmUfWyO1vuYFHm4v4KI7
 e4mbEaxpwuNJZi/BtP/GD3jUw89ozs8zDuPULzb/4Y56+tKIYXEHEScoc+qL7tADAKYb
 xUmD6ii0yzGkTr4BOsTdASvEFh5rIHmq6mNRbWqURWnLZkoWHRNjYsIcLv0ZqwzSWEUt
 xikjfVKDbBIGtoYJcWe8/YQQ3mOsGelTNgzAlDvtYeBBlm5Vd8mbxSoPtmewPH8buekl GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3adpu9r80k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Aug 2021 12:42:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17DCelSP132638;
        Fri, 13 Aug 2021 12:42:10 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by aserp3020.oracle.com with ESMTP id 3accrdypna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Aug 2021 12:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvac0m4b7KVZArlejA4buhibBLcbSlu5DS0ztwCkhnT38e8CdOrIxyeLuyoNBKJpwPwPuq8HTBQr+SkWhanUsNks2MpO56tPRO2QORk+YKKrG9r+lbMT6SpnLDaGnqbNaMDYSrLmhE/VVVHCy4gYgnwI3M9dlI98tzT3Zq97S1I36P7L9IM2x5frKPMTTUmHrFGuMaQY1Lu370ONvupnKF4ZhUvCJjH2rg9+pnyI7Wky1iax05Q018b/j2EaiGZU7Yetylk+hfe/deOlL3hHJmDuDdkcPkiSoCDQ5JQ095iFufdjv9wNtL1Dj7t1hOtWhVDJvTR+RuZe4xAp7yq4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y5P/v7eG2wHm/3/KjzVlyyI4zS/X04RlI+9SE6VdlI=;
 b=fywXFxfrqU2u2weZ4KsS+GTjTLZHinDlFvfEmL/M+mFP0XJ40TD1IyfDFYav/XruvKov2CLrsqz65X5jVUAm9A44tV5ovT+q3feot1VNkFQzTGggTvEbI31HMgcZ3QtkUib9R8uPfcYrFSGISF2ruhufXeO4O+w49hgxO7WZ7chjhi2uuAFrfZWdnqM71v5XaUdw3H4qd6YHQykEFTBZ9O/Uw6LWiNPTXKiRYSPEqkLvpzonjLDSuzX4uu2doiErJGCDkC1d4YiI1eGgaZYpIKPVPJRixaUMwXax4xjqQ9+kTX8rFgIz6tMmTDAEzUqKGM0kNHIRZc+Mqxft0TRfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y5P/v7eG2wHm/3/KjzVlyyI4zS/X04RlI+9SE6VdlI=;
 b=t3DJLvz+X3tredeA7PbOdKpk2a6408pFJ0SN4DitvpNCz9+cQF8/x17hdLCDlDFkPnB+HmZNM5S7wcSE40UbqGwdqwfS23qtpPAM9DtNmNAVgOAd+eyQGnggrMO5LSbyThTfj/SlEBTSaOnfWdaUM8iKq40qU+3SiGKWywQxge8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1549.namprd10.prod.outlook.com
 (2603:10b6:300:26::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 12:42:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:42:06 +0000
Date:   Fri, 13 Aug 2021 15:41:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] tty: st-asc: switch to using devm_gpiod_get()
Message-ID: <20210813124155.GA7367@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 12:42:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72f0be48-d678-454f-6527-08d95e57c20d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB154938D41107A072603BFE678EFA9@MWHPR10MB1549.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZbFPFzl/VzylD5pPAkR6rsRcntx618H9NyPE5uxJZHhgkEgJZqTiOHEv1w9env7wqRZigHvxkoN8jt7bbqsWipapAle5ZB8DYTHsIU3MnoR91VExZfiYHoeem3403V2NoSNCRK6Qis8Kc6LEb1cBIF0l90R4wvzU+YWufGjnsUAQLXJTx/zp2wEOUYvyO5q4wFUOltifJ5KxGLbZ7/4cq3ZhG4u0fjMscfe1OJZ94R7r1EQye4/efzJUMMDh440qfVaJdoAIcdI2NTwjlizDOonljcDoNv0h8d7exp4esI8CZ8HsPH1lppLKKOvKk7KHTskTSnM+TCIY9uKk6hQGvUz33v2+YyO7onI4tPm+w2X0P2AdWe5moLK1meOsml0NOU1oGYJTMYsu9SPWR98Ii/d/1Zz+W4FbUDJ6obAolMdnB2SOypBQxt+emXZ19se7wu0myaNkvHSmRrwDkda+zVWJ72lFGzwt+I3jfIDO62x/+35HCm/18I8jKXD4nJBEMtMaiCgbwiNGSdJm63EMIQwyM+/m2cK1vhM2LY2Iorh6aUaQejBasEyr/MmwqlZdqfPpDzsDXbsd7/wlK0goc+yD5nNSavy3sOeFgAnGFZEy9ENaUd1xFBkn/8a+GQ1hErxZY0BUPhcuQ1NOj45ggTKJqALKRXMxfMULQqT6G+BUYrKR1Mfv0i+0CFhw3hpmf53BUVkIVel1oLbylNgDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(8676002)(956004)(33716001)(86362001)(508600001)(6916009)(6666004)(186003)(26005)(9576002)(66476007)(66556008)(66946007)(2906002)(4744005)(83380400001)(38350700002)(33656002)(38100700002)(55016002)(6496006)(1076003)(52116002)(316002)(4326008)(44832011)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gilNNLVVfaOI3KJaOm53gnM1oZfHmJWSCaN5o3A4mTzxmqsX1+Q7QSw7dC3d?=
 =?us-ascii?Q?W/vT0gqGJBuKdAvEBeG+3zuHJuCIDPErHpp5lPi6dLztNzrC/YehFcAAhCJH?=
 =?us-ascii?Q?a0hkgxs2BPubaJh8c9Ajfs2VwsmyXOGW19Q3KmA/XxF3D+3qVrX2MSVEjjTp?=
 =?us-ascii?Q?rfB4yunyY9ZK8nls+p44obCRAyrId+rWnkFWiBAixr5RH9CQyIhQil+PQu18?=
 =?us-ascii?Q?h63k64Q02nuHpeYQdvnO/32UkLy1paMF8Aa/rNk1XpFI/sBF2kKjXDmUAssw?=
 =?us-ascii?Q?MDZWXRuuV62kSam8VdbOFau8bSEw7i7VGFVQkRj2mR+a9gnnIRSRaIMbnllW?=
 =?us-ascii?Q?wrxqvMZP+OFTdD2lfs8C0z4Dxci8Cy5U16bDVf4DydZehumcXhUOO3RsWLl7?=
 =?us-ascii?Q?1qcx5XGFHV0BBCWvxAXMoZ1eZ+sasFjDSM07WzZn2u74ZLfw3vrCy6y4Rppj?=
 =?us-ascii?Q?GcXE5TmVOTUXal7VbvPBbXFDvDfV+yjnURWC+VRYbjpUNUKWFba1UNCi7Pbb?=
 =?us-ascii?Q?AHUw16RqSSIyymaPR0SItPzzENzug6KTkeEPuoOqP1gKwobfQmRtniV83hln?=
 =?us-ascii?Q?Daki0HiIMqoCtTH90qPKy2eeMGVcbMKoRfUNPp0ITYzcDG4mT1dy0G9AXxkO?=
 =?us-ascii?Q?b5BNoKZZAdHggPjFNw/sNai7MDPGaM05FbSlnyoGdulAJ2Gr1IQ5D+rtjnGO?=
 =?us-ascii?Q?+rRZ8APZDvmXkqNMbNYe7q/9FoERec635mJLfsoUw4Hu1RFeFzstZpQD7l9F?=
 =?us-ascii?Q?q7ni/YAUQmji+6dTMAAMOsySrYaCsUHeNvvLpZ8TTURrSzrV+I93eB1XDMJZ?=
 =?us-ascii?Q?Pa16m6Rph6wnnBUWGXwH+XA4lMxsDFz982+OTGPKmL8ZB5Y7wJOh4uBcESoz?=
 =?us-ascii?Q?Fd7Zor1ZrLU0Bl35vCnGOTFPoyxrRUTQ8OTEuIDxojEhiRA1agkDvFwYGmKQ?=
 =?us-ascii?Q?JW5SM3X8d49P/wvvAqJHxkVAU/S7iOQm8mLV9mqiCehm8RkP5CviV9rtgzpE?=
 =?us-ascii?Q?seD+V3qGYNYLIeWlPTqQIeQitT0Fz8U4O/z6dYPUzNh6TDDVZGtyL659J26C?=
 =?us-ascii?Q?xIYa7adviKGBVVGk3liMsv34yXzyBvFIzU9VQZe099Ycfi5KL7+CBSj3RlYO?=
 =?us-ascii?Q?6r4pmi3C1T+g2vgkSswGk0k/YSjPhNOx3f90THN8r5wgEPq1rSQ1ljcL4fLm?=
 =?us-ascii?Q?/OTsKUtxjbapo+Qc+5LkO51XIUAa/1FUuk7g7pV8jAtdBeppb4cvGflQBGGh?=
 =?us-ascii?Q?wZi8REwV0zo9n5j6Do0RWtgrWwLgr1Z97e1WnRsfQxaj/0ezaiGgzx3NfR+j?=
 =?us-ascii?Q?mmY0CV1q7JvFOvXg9gOOsEf/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f0be48-d678-454f-6527-08d95e57c20d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:42:06.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ax2NvHOChr0luV+5zwV8DvJoPPit5ygcrN8/J3LDeuKhegJq381IOngp1mh00vRNHAmx60nTlyps3t1nIxc9LH8AYktcpcD7ZHNEYrqKujA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1549
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10074 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=851
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130077
X-Proofpoint-ORIG-GUID: t4Jo6jv_a8iBV6g6bzOwEZe3o_u3D5iT
X-Proofpoint-GUID: t4Jo6jv_a8iBV6g6bzOwEZe3o_u3D5iT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Dmitry Torokhov,

The patch 8c44f9b566a3: "tty: st-asc: switch to using
devm_gpiod_get()" from Jan 4, 2020, leads to the following
Smatch static checker warning:

	drivers/gpio/gpiolib.c:3066 gpiod_set_consumer_name()
	warn: sleeping in atomic context

drivers/gpio/gpiolib.c
    3062 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
    3063 {
    3064 	VALIDATE_DESC(desc);
    3065 	if (name) {
--> 3066 		name = kstrdup_const(name, GFP_KERNEL);

asc_set_termios() <- disables preempt
-> gpiod_set_consumer_name()

    3067 		if (!name)
    3068 			return -ENOMEM;
    3069 	}
    3070 
    3071 	kfree_const(desc->label);
    3072 	desc_set_label(desc, name);
    3073 
    3074 	return 0;
    3075 }

regards,
dan carpenter
