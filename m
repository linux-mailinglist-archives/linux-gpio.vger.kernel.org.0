Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9FE3D95EE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 21:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhG1TRV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 15:17:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32378 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230443AbhG1TRU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 15:17:20 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SJG67j017214;
        Wed, 28 Jul 2021 19:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=UME44454MB6hR7a9Gj2Uz+P/gdzJjNWeDux+y4C2ZFA=;
 b=LGVWNOoToGt1io7jXIjHhfO9QSdzhuoon3YLEnjRdN3Ka5mMWgOSDEQkSdQ9aTsrKvQc
 uT035v8kFWmxn4KG08x3Gj7XaUd9emrpb2eA2hMqAEFrRDCqNtyiaKl2f3ns5YCbnBWM
 3vBHnWHGsKHRSkRJ4l0Bt5Pst6bVgGlxISh/cs16eiDBhelUVBzgbs/eboczF0joTxaz
 sPOeCo2DUCpBvhjuqyZAkbMWtF4Y7PAgeJ6KE3O9iehPuHOd24FkFFdam2JQcv2dzvzt
 0G4yLF+A/jpr+CwGNWzgBZTkEn7CvKcc/trRIe+Lt0oeleww4XllCv6nAlms9cOY+17M ng== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=UME44454MB6hR7a9Gj2Uz+P/gdzJjNWeDux+y4C2ZFA=;
 b=FS705G/B2p0T+LcV0sur9tN5k/Z11YivyBJlEio8RWdxtnW9Q26Qz4AmMRxGgzmfpRKW
 vfqoGt8EXRMy4mvNf/hu1KzxghhbqADXkN2Y3/V8I8m1St+53l2bkZrJ+KaaRF6Z/ipJ
 wQ3hRCtDrr4Ubt4JTGHCZGb9GWM7ZPA5v03tl0pGKQFUdMiwCbXAof0GxlagFGAalZYp
 eC0sC3uYJ/ZxlFzYaUM88KR6GNEgFVZAc6YTsXNFJE4qoPsgJRYeohvzbTCHHvA2lqor
 MvgpomuVioZazMyp4HA6DNv1imJiSGRJD79bfiNtsYHQRxfUgGPCr8aI1gWcXTnWGCg5 Og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a2356natw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 19:17:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SJFlV8096712;
        Wed, 28 Jul 2021 19:17:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by aserp3030.oracle.com with ESMTP id 3a234d2epb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 19:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4ZcTxaYTF5gbwMHnjKAIii39AD9IwkTLXK3btk1Iw5ZQ5dMW0lV9u9FMsRG+i1Lye360tz/ZoxFo30J4VwnPxRcfSqpNID9kp7lvEFOWLopOZ9Jbp6ryA+7AguEX/WenkImXN3JtgjRX00Y/MK0rTaxXjzQvmAnv12xrJkTcuU+Yc4MVvIuPOkQXeepSHvD9cYQH29u86Vorr/L8cpRFX4oCDlGt0i+pKMSimb8WK8EiV1WQo6gEun9/z2rfwkT2WlkhFcvsYhlUtKCeFQ7KtqOyBwfQxhLmXc/2+U06k1JZzHZIe5dcMhAtXbN2sSmL9E1pET9wU3ZLLoRF+hIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UME44454MB6hR7a9Gj2Uz+P/gdzJjNWeDux+y4C2ZFA=;
 b=FdITHLUqXilbznDG03YGV4IOojlrvo9QP6Duytcc2Xndpv3AJlrYqQ3aAfX4/YRd+O4xdbT21OatzTBXZBJtkvxG9Twj2nfwiQqQlubGH0zu1gw1uh0nDbBVBL/LPwWIZ2oBTCrxwXQx3lIVn/KRiSwGorJ+00YfOpzUabWwDFq0Nd1dPKFm5HRRJgezudgwWJuI4mS51VyrtcjR8pqDAoae+HApEx/TGwbtukrZ4puJ9qNBJy8Gs8Fc1dr0IHEA7gY75fVkLMYhTV+cEPxATJudTr/2Ndqz2yFEQf6dK0NwnSLunhfGcihNpHEGn3nEEh9+PNSFflPFivb79ADiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UME44454MB6hR7a9Gj2Uz+P/gdzJjNWeDux+y4C2ZFA=;
 b=lJ3O0wQdY/lG5q2+cmFRq0QYzNdwyQtV0V3PJ5SVXOa6PulWJVSyQPvsPeKsuCHx47xEQpuGxj+Dkyc167Q42dASDx/du4cSPtD6qTVwlEqc2srq3dv4tFLlaWZLSLN8zqIa0WI1D+JovlvCme3aqmxt+R7ZBtWI4JBwBDeYnG0=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2327.namprd10.prod.outlook.com
 (2603:10b6:910:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 19:17:11 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::856c:c91e:aaf8:11d]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::856c:c91e:aaf8:11d%3]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 19:17:11 +0000
Date:   Wed, 28 Jul 2021 22:16:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, lakshmi.sowjanya.d@intel.com,
        linus.walleij@linaro.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [kbuild] Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl
 driver
Message-ID: <202107290246.hNQDlfoB-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
Message-ID-Hash: 77NVOW5KNXVXQRSLXUGR5BN3766AKPJZ
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::36)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JN2P275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb44b2bd-7dfb-4733-ccdb-08d951fc4c82
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2327:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1001MB23275CC6B6CF2BD24D95F1D88EEA9@CY4PR1001MB2327.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NvwEOsK9FFrFagSIYq66ukN2woG4ZkpvMRqrgyOYYtxdIwBzwyNu5FGKyNHR3XsJCQUVOUbVGOQ7LWjdfu+PspOFB4qy/q+UpuD+GKbiF0uw1+FjV4/sXj0gAtMjxHIkF0Qh2fd8dwPR1xTfhQ6YUX3nlgC6GXA+O7ZJMlJp7s87yBRdBp4UWTwrQOhZW4+x1toOSNs9cRi6P+vHRWncaRTR3rLPnVwxSpnzlbX69B/n9w7mfS0RUJne/6qUpmIkZLxGkoe0f5WcgTbld4IBTdtSUNR21htNEkx/4lQNDCtvGEiMKUZgHY29TMnOAHA6NCAMHnshcwWbYJeuIQPJ0Hrs/ybQe/TLwNlXz6TS04LBCHLmdEygL4wLl/vL/qUPuYOdLWZPjZcTSaD2fjjEuEJICBsG6Pr2HENCyC4qyOPnWWsax6fBIz/vt4662p0HGFCMAMca+b0qTPwa79YFu4cbqHsSP96ooV0bGIjNywSOnSADS/U6nwhf+JgKb7yYpL3hzk7vpJNc+Wb/ZLl8h9Rd3YRFVwZT6HCGv/d1JmDxLjDpRQewcFVKkUiCtQK18tbvK/0sVNjV+SYqYXG09F0phrQ2bn720Ccwurz2MWKiw86PW1ss5kpf23XIv3f4dklBdiUg172qs0voKmTwQs4butuVPJZDQRedXFY81qdT51wtBjSJEMtegAtV+DPowt+m7EwjDF6gp4k2HI84qYBDvZUUSDqe6qpZ3PUTJ+QaJt4K+Vw3aNzZe77ncRVGhouAwCnBhIBX6gM2UtYK3e2TEBfh4Pxox7WG136pPnpxZKXBDiXpCd0IIVvZPGydZltEUA7iJflKIOMeE9jUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(39860400002)(376002)(2906002)(44832011)(966005)(86362001)(83380400001)(36756003)(38100700002)(38350700002)(9686003)(6486002)(316002)(66476007)(7416002)(8676002)(4326008)(186003)(5660300002)(66946007)(6666004)(26005)(8936002)(6496006)(1076003)(52116002)(66556008)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dk/126DbBr9zXuTRQVV5QD8ZDgzLhqfvzI47vEQbARdFFPwVi3lr9wklsV2a?=
 =?us-ascii?Q?F95vwiRA9Jl9xi1TZYM2on+eIBFHvZ3a+A+Vk8lqwAS3UsDDNF5GZ0jTTVR+?=
 =?us-ascii?Q?pWdeNt/DHG0wJvFjXJjixf3zrcFJw2QQdAlqOmYB8202ndOz7kZd9ToRZJ4L?=
 =?us-ascii?Q?YBsSS7EhjHdBgu7IjTqJfeaTsBu0oSuVNdhNvp6O/nnujQh967Q4/mL6YMcW?=
 =?us-ascii?Q?bO6tMNLgbcEO17+nrSUC+mDUJSRo2uginl+GiHp25pmxTsw0tl3uqFl4MfE7?=
 =?us-ascii?Q?10mT8pLhAv67Z8FpgbHrRFVau2TFZttyJp4Ar8oEegA96kNU636TZvJbe6De?=
 =?us-ascii?Q?+CnEST0UiMgcXqbHx+6/41hhfxOcDmFPRY+DYzwck4ymP/L+gcUADSkRynL4?=
 =?us-ascii?Q?+OT0f8p7KK/swfMEaMr4wLy/OP8dy4l1tgurDOnhMbLGItCMKvfoFDe+hAjm?=
 =?us-ascii?Q?FCwlFHKyisCqMf/qJ+DAKhpze97qdu19LARMyqLT5m2tGAeyT42gzGDklUmI?=
 =?us-ascii?Q?hp0c2R7Sqj8zfaJJ3i0k3y1unYEDNuSWENpN6hAszhOjDWU9vNh0h9HOrAGR?=
 =?us-ascii?Q?8nuzua5HPf9NY2eR+02VZyIeBEgGYK9uAxUVe2JDcfdT+G/KSTGVgMZmWHnN?=
 =?us-ascii?Q?NkZt52HdHfouZvV/KAy7kdOhNrvmCW+vDoJSjBdCZyWJyHB/tPNTzMwKKAmK?=
 =?us-ascii?Q?1saYXi9/ad4+d7ccFp32+8+GSHqZSx+CklQ8mj8+vbHvWZaSwmhV2Q7zLiUW?=
 =?us-ascii?Q?aoX/qPlGJ005YTlqOxaLAAru9T/xRQepoifknLP3A/zQmYeumdMA93egs1dy?=
 =?us-ascii?Q?A6sXpL1WJH+NRH7GK9dsJPghbteVIBJsQTfkiHBXX9ePdWAWCeHJds3Qkh4a?=
 =?us-ascii?Q?iNm9tSW6dHdEWu62QpWyosy6pdF2bYqa/dEm72g550efDPECxNbBDewt+BUF?=
 =?us-ascii?Q?JqW9IdzBHyN8xufNIMQKRKSW4uxlrjoW+7KBGMIQaHPhUR1U+Blfski2cwTA?=
 =?us-ascii?Q?ke205w96EcZw/NonJL7DV16Mc0aCJR5mX81sRpff+F8UKBIHyx6W2JBrpfn+?=
 =?us-ascii?Q?O8ZFkLS8qgM5EA/QlALfQC9keylBQOTYPV0QBZZba30X33H2Oo6OC7xfDR1R?=
 =?us-ascii?Q?i8VUS3uBNZBEPhfo4FHIXvPN/CrrxYGZlhilUfliuf3L3lh4XzDe/csaQrMV?=
 =?us-ascii?Q?3dMRThUNaG5R5rd05mw4So5sxJ9RVdNHHy4YhiYfatxd1ZecVcCZ4oVu6mf5?=
 =?us-ascii?Q?46LNXD2xewUxcJtODYqpN/FnRTdfQlWKsvmNZTTyE8HVwEnqHJ3Tmsq0cOW9?=
 =?us-ascii?Q?bwx8GnG8H9SRFGePva8Km9AW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb44b2bd-7dfb-4733-ccdb-08d951fc4c82
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:17:10.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6ZZhLYa6tG4PtkYV6bBUwHe93Q/pke6u/qZ5Yib8PBTTgf3KIjP2EGEmmqsqMvlszhqH3fhBcdRd0bvLYUANdSRa5Y3Gk33HZABZFCDEK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2327
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280111
X-Proofpoint-ORIG-GUID: pGBjJ8-r-OEp4drpkgTfwCcjnmLH7l_x
X-Proofpoint-GUID: pGBjJ8-r-OEp4drpkgTfwCcjnmLH7l_x
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

url:    https://github.com/0day-ci/linux/commits/lakshmi-sowjanya-d-intel-com/Add-pinctrl-support-for-Intel-Keem-Bay-SoC/20210718-112204 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
config: arm64-randconfig-m031-20210728 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pinctrl/pinctrl-keembay.c:1147 keembay_pinconf_set() error: uninitialized symbol 'ret'.

vim +/ret +1147 drivers/pinctrl/pinctrl-keembay.c

57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1097  static int keembay_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1098  			       unsigned long *cfg, unsigned int num_configs)
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1099  {
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1100  	struct keembay_pinctrl *kpc = pinctrl_dev_get_drvdata(pctldev);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1101  	enum pin_config_param param;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1102  	unsigned int arg, i;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1103  	int ret;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1104  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1105  	if (pin >= kpc->npins)
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1106  		return -EINVAL;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1107  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1108  	for (i = 0; i < num_configs; i++) {
                                                                    ^^^^^^^^^^^^^^^^
Probably num_configs can't be zero, but that's what the check is
complaining about.

57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1109  		param = pinconf_to_config_param(cfg[i]);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1110  		arg = pinconf_to_config_argument(cfg[i]);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1111  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1112  		switch (param) {
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1113  		case PIN_CONFIG_BIAS_DISABLE:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1114  			ret = keembay_pinconf_set_pull(kpc, pin, KEEMBAY_GPIO_DISABLE);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1115  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1116  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1117  		case PIN_CONFIG_BIAS_PULL_UP:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1118  			ret = keembay_pinconf_set_pull(kpc, pin, KEEMBAY_GPIO_PULL_UP);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1119  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1120  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1121  		case PIN_CONFIG_BIAS_PULL_DOWN:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1122  			ret = keembay_pinconf_set_pull(kpc, pin, KEEMBAY_GPIO_PULL_DOWN);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1123  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1124  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1125  		case PIN_CONFIG_BIAS_BUS_HOLD:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1126  			ret = keembay_pinconf_set_pull(kpc, pin, KEEMBAY_GPIO_BUS_HOLD);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1127  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1128  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1129  		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1130  			ret = keembay_pinconf_set_schmitt(kpc, pin, arg);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1131  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1132  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1133  		case PIN_CONFIG_SLEW_RATE:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1134  			ret = keembay_pinconf_set_slew_rate(kpc, pin, arg);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1135  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1136  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1137  		case PIN_CONFIG_DRIVE_STRENGTH:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1138  			ret = keembay_pinconf_set_drive(kpc, pin, arg);
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1139  			break;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1140  
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1141  		default:
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1142  			return -EINVAL;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1143  		}
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1144  		if (ret)
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1145  			return ret;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1146  	}
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16 @1147  	return ret;
57d6783f95085ab Lakshmi Sowjanya D 2021-07-16  1148  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

