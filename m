Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0166858C662
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 12:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbiHHK3Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 06:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiHHK3P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 06:29:15 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8EB273D
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 03:29:13 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278ASrui006627;
        Mon, 8 Aug 2022 10:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=9/a5CDdpv+ZhkaCVl3IolKbb3h4adWIJeoHwIJeMnjE=;
 b=ECPqEoG2W3JFWZ3Sw0F4qnBNSffzvMpk0rrYekGveW85/39dQeAgRK+SZBwNLO/Qln3N
 5DTOa/rrKnX725eSfYo86+ZJQEdUPcsH7W9YhfcIKmskJBkOb/3l5TS9EaCIvR00bpuE
 lSoWL/P0c1kPtsrM5Iiw6N9vELL4kJL4pIiSeB7i3zTHkOg/wkZqxVQeqcUS0RCTXPo1
 4GGSIfg5eOm8y90KEZysdZH8eFkoWcZX/E4meD4ojdtQ3f0jklhEnrGKHuk5S8HEoBgd
 5ffrlltLwbmeULmgzDSNCxoridJrpt4lfU+rLkOdXgTGqCieU6h1DISH91kXMTmbR7uU kg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hsew135cm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Aug 2022 10:29:12 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 278AI8iL012533;
        Mon, 8 Aug 2022 10:29:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hser7uddy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Aug 2022 10:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApTg028RtRUzqKxQFeIQGmjpK4PlJX63ePp+2iW52NlXI4ZKAOmCUHJKM37SdSMXtNG+HtItzRj67SZeO+a9dDPUhXP62VWmrziUZ1wZZho4ay1tfQgO+ZsWg+0+pAtu1B8IPJ4jMQ8qITII6e1zi4up2I0hwEj8kZE+/fszY6rW4m9MRj8ugPea58vvg9jQf83B5luiSzaPPDymUC7sEFWc1U7ywo41+ts3C/owTJ6VBYWk1kZ2CDH87u1vzLSu6hTsK0mcIJ9687FWpBD1lIRK6cE+C+wdOrvIkuN3OBWxtSn6gAjHYsGHscAje4eM/Skt1gzY3C94c09a8r8hGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/a5CDdpv+ZhkaCVl3IolKbb3h4adWIJeoHwIJeMnjE=;
 b=I2QJhBinyrQDRVjONcVPVjcTCvwODF3PteA20TlEx0WpRJ1mqVh2Pyw7WurxiQcXrf0qmRCNRQWiIiS8S1spnLTgCi1z3lmi3Lb9Rovf+XmNgU/5o88NGdDOEIi5zHL8KykJwoE6+JsjQ5xKAw0hmebcC07uDI9hX2d0TyifC6jMm8glfijBM6ObIbTIkY7Ls9DbvsP26mF5wwkAGdc10aLzpADvhHQ3fW67XBMEIzFyjXHNoGXB3f+flhAu/V21lCA80BY8Z2J3E3EY1OX+Vuxk991L2wZTVQncHyNwZ25aWD5P5feNciR89x41VfEAYzTvnitc7z4uZUDTat9ODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/a5CDdpv+ZhkaCVl3IolKbb3h4adWIJeoHwIJeMnjE=;
 b=hYJfwsSjchp3aWJ7eFV10Sdzd5TYPKzkV7OAB6WQnN1GKtK9o27JBGfr8n5hUWmTAW9JUkJjjEOte20Oz2lsEKNm/iwaGjKtfKejvVzKvbQVVe7YwIuO3pf++OcwfhuHosxd2CNa2iKR5G82Soqq9VceOJKAYeZzpmhFQRtfjcA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2618.namprd10.prod.outlook.com
 (2603:10b6:5:ab::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 10:29:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:29:03 +0000
Date:   Mon, 8 Aug 2022 13:28:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mario.limonciello@amd.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: amd: Use unicode for debugfs output
Message-ID: <YvDlZaydFKN5loe/@kili>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76be316f-ec58-49fe-6ee1-08da7928d09e
X-MS-TrafficTypeDiagnostic: DM6PR10MB2618:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAfOyvCSiVkkqZdUalBAYkRM3ywOEnVFZZvATs/bLQuFllRplikD6lyDmbmLs+udZTa+IbhT21nSCB6sykP3tQw9L76WRCb+Zf7BmJdOtejJ1oAKhjlzRjqWIBuizJnjmvGhI9mlm7Q5US+SHsCI5KIe1+PIDMvUasVtHkZMpY/AbWvuT//97aDFWS607n/xQF5WQpJVAVhvkLWGqGYvXJZ9vTnX5hoCFrganbij+VmRWKszU1g/NzxCyXdyWWa/Dbg7/wHWEXxKUfhOh5rnoYnxyGdS++F1hTYKuJ6bCcL7HXoTy2wQsS+QHOoOMmdPcs6ybSfF7hhfXSb64GlTH86Z+qPMI29hLrrLWTerbHk+5u8zHXsXhQiLFBea38Cy237C2PouDpRtY08i0WHk6iL0AYzU9gP04X64+rmxIoFiaYyFDaWnNnJttA1BB/zxbelwwKQMfPJjfddvrqfJxb7f9qcAkssxQ5iKtW58eW1zuD8KV5Tg4zK7m8fX4lHwsiO1KeJOqk/QbA2NWQ7qbeeuZSdVTY5mYLJOGdqWl5vIwYWObyLjPmjCEo/KVCVxJns7GtmUEa3ojch96Uf7Ku5tCBhxEXdRH7eaF37HIzIv8qlYeFdq391Z2TIsIEqhwKNE7zRi8NdqoEm354VeHSfs4B1zZEGmFnEwzHFh/zG+gptmIGl230ZU38azuOT9hUDslUFfYmaqtyzCGRdCaLVICwRuxnpr1XZKBICk+lknex+MN88GLHkPy2hufdCfwInsY+8dTdkR4kFz14Nz94z+Ivz/1CHjvBgDGdfdG6p3T4VIPfLIql0htvhzNrRv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(38100700002)(38350700002)(6486002)(186003)(26005)(6666004)(6512007)(41300700001)(6506007)(52116002)(9686003)(478600001)(86362001)(33716001)(8676002)(4326008)(5660300002)(66476007)(66946007)(66556008)(316002)(6916009)(2906002)(83380400001)(44832011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFpMXl1anRJWXlLTVcvdEk5UEpCZVJJZmQ4cEhaRkVIc2hXL0gydW9vVjNL?=
 =?utf-8?B?R2VJMnBIUlRIOTJObXdoWWwvV1UzRGptZmpGaUtBQk5KZWZmYURxeVRUaGxp?=
 =?utf-8?B?S2p6bjZ0Zk9HcnRtbzM5RVM3eEhYdHIwRVBjT2kvOXd4VzBpV1pXaklKRlZY?=
 =?utf-8?B?R2Z5am0ybTlMeUlYYmtaRjJNSDdzZGl6UjBDelN4WUhOc0J5NERxZWd0VDIr?=
 =?utf-8?B?WFBETUtvTXdHcmRSSWNwbi8yeG1KcFhoZXN5VXg5ODdIVG8wRkczRldnNE55?=
 =?utf-8?B?QVRrMTNUVUg1VllnUEdobjdiUXMrbUVudEVvZGo3YjJPUi85M0dXMGEzbFhw?=
 =?utf-8?B?S1A1QkFKQXN6L2t5dDQ0RTlNOUdZdVNWSldkUE5WVUlDYy9SbmtaWlZ1VGFo?=
 =?utf-8?B?M2ZvV25YWjdhaFQrRmNtekRseitQQWpDRmN5REVRenIrR0E2dm1GbTZNY3lx?=
 =?utf-8?B?NTRPQW43UmtMZCtFcDZFU2t2dHRadlNvc2hLOEIrb3lVQ0JaVDJkbFQrOE1X?=
 =?utf-8?B?TklTMjRUeGVEVHl4djU0ZFptamwvaHl6bERGTzBwWTNOOVRYTGw0dmtpdU53?=
 =?utf-8?B?QzRrRmJjK3V1dG9BVjhZdWVSZXVUaVBkSHp2SGxLTTZ6bzIzNnJqd3FqcUFj?=
 =?utf-8?B?N1U5TGFCRjh1aG5rQllTSDFMRFg5cEFoS2tiN09namVTdU9OakhheE9uWlpt?=
 =?utf-8?B?MmVkTHZ2NmlNenB1Sm00b2V0bkdWL3lBOFU1a3ZWeTZqV2RKQllENGZrbEt6?=
 =?utf-8?B?QXZ4TDQ4NUQrNkt4ZkxlUFJjdlhJcXZaaGE1RGwrN2dlUVk3Y3M3RzRHamtO?=
 =?utf-8?B?QnBPZ3JaZ3FSWEJyR2NJWUp4anJydkFPK1dOSmY5b2EwbXZpN01jWGN1YWo3?=
 =?utf-8?B?a1dFSStmSWFncHcwdDlLazNDbFgya1FreVNvN1Jrc1lHeWRsSVlycHRPMmpS?=
 =?utf-8?B?clJFbGNjYWtYK3ZKSFR3bmhIV1kraUpWeHZlNEZBcEJtRTgxVFZvdmpnYnRu?=
 =?utf-8?B?Z2NZVkhuWE9jZ0RUMTZkZmowc1BlZnVHZjJLRTZuWTNPVWVNQ010Nm1IMkJR?=
 =?utf-8?B?MURtTnN0K3hNZmVkVExnRTR1UnlnZ0kycUkrdVo1bGYyODNZQTlXUG10R09G?=
 =?utf-8?B?ZWZTSEN4ZndPTFc3dWhZSlAwcEdia0R5TjJrZ3dzTTJGYmtiUUJycE9LczMz?=
 =?utf-8?B?TWo5aEVONzhmdWlLUVowZFgreFNNK0xhbkUwcXhZc0ZjaS90cWN6SzhIK1hX?=
 =?utf-8?B?Ym9nc2ZPMi9FaDZZR0VFaDA3YVdWejJZd0RBU2RCZmdoWEJoTWF3eEFKa3Jv?=
 =?utf-8?B?TW9uUTl5LytXMndtb1VUdEpSNitrYmNpYVRHMEJYVy8rdzJUN2JMYXA3bnd0?=
 =?utf-8?B?RDlUcDcwYkdPUjM5VFpTSDJmK085OElQem9kVHhZQUZMUGl1dFdUN2xmVkx0?=
 =?utf-8?B?SVZ1ZDRjZkJyY212blJRRDBVSk9ab3orZUZwTVZzdHIvaGluMzh3TEdJUE45?=
 =?utf-8?B?VG9qRHdLZkJKb3BpeTFNOWdmUGZoMVEramJKbERzOTlNdTVtM3laOWlpRVJM?=
 =?utf-8?B?SUVDMTJEdXo4NWUrWnVpcFkvTnplYVRHS1hJNE5lVkxPVmZyZWR0bC81aDhO?=
 =?utf-8?B?WTE1NU4ydHZ6c1hOQ3UvTTVONXlBR1oyY0lseXp3VHNXb3ZPVXdMREVLREpl?=
 =?utf-8?B?dXlvZDNGSDNiVloxcTRCQzRFQ0RoMC9RckVqNmxNb2V6Yk1LOCtpQ2lFREhD?=
 =?utf-8?B?L3ZUaW5BV2p1a3VFZVZZYytSY3h0VFpaaE9rbWJPcTNHQmRrWm9UYkpQcnRD?=
 =?utf-8?B?SEZpS05vU0NldEIzTE9Ga3NIUWhueUU4NWxoZWt4WWZSZ2hFdWFPS2FqTVR6?=
 =?utf-8?B?d3FMenBpcHY5NTA5d1hQU1htd1dHd2Z2VTloRHJFcW5wd2dweFhteHdUREpY?=
 =?utf-8?B?QlhSL29sdVJWUlhHWlp6NXUzTjFJSmxsL0k5cXFrNWUvSzNnUTBQUjhYZ3JO?=
 =?utf-8?B?SjQ4STRmdDQvY0FxU1dzenU4UjQ3Y3lnQjcyOXAvbXBNTGxQcUk5THRiMVdx?=
 =?utf-8?B?NXZNU3k3dXhsUk9qN0dJMnluMWpIMjN2Nnc4anR4ei9hT3VjMmlpZmkvSWtq?=
 =?utf-8?B?Z3hDRWIyV0pvSjQ3Mi8vVzhkOTg4eUxyMEZ4MFJReTRULzlRMEtSTFhmQ1lW?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be316f-ec58-49fe-6ee1-08da7928d09e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 10:29:03.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZH1eX+0XtyLAzzCEAsgMxKD/2MHbA3lBkMp5B+t/XEJUZZgy3JpSrqjAE+KRXCbnsjW9HvZQvFl2yA9lJoUZ8qwVjgpxDwzE/bXgAMvb10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_07,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=979
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208080052
X-Proofpoint-ORIG-GUID: KPxKi5zLesnVoqFk2PzK6Fyl49-yuu_N
X-Proofpoint-GUID: KPxKi5zLesnVoqFk2PzK6Fyl49-yuu_N
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Mario Limonciello,

The patch e8129a076a50: "pinctrl: amd: Use unicode for debugfs
output" from Jul 22, 2022, leads to the following Smatch static
checker warning:

drivers/pinctrl/pinctrl-amd.c:249 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8c'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8e'
drivers/pinctrl/pinctrl-amd.c:294 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
drivers/pinctrl/pinctrl-amd.c:300 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
drivers/pinctrl/pinctrl-amd.c:306 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'

I didn't add this Smatch check and I don't know the rules for this so
when someone adds something that basically looks sane, I don't report
it.


drivers/pinctrl/pinctrl-amd.c
    247                 seq_printf(s, "GPIO bank%d\n", bank);
    248                 for (; i < pin_num; i++) {
    249                         seq_printf(s, "📌%d\t", i);
                                               ^
In Gnome this looks like a thumbtack.

...

    279 
    280                         if (pin_reg & BIT(INTERRUPT_MASK_OFF))
    281                                 interrupt_mask = "-";
    282                         else
    283                                 interrupt_mask = "+";
    284                         seq_printf(s, "int %s (🎭 %s)| active-%s| %s-🔫| ",

Gnome emojis seem difficult to read.  Theatre masks and a water gun?

    285                                    interrupt_enable,
    286                                    interrupt_mask,
    287                                    active_level,
--> 288                                    level_trig);
    289 
    290                         if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
    291                                 wake_cntrl0 = "+";
    292                         else
    293                                 wake_cntrl0 = "∅";
    294                         seq_printf(s, "S0i3 🌅 %s| ", wake_cntrl0);


Sunrise emoji?

...

    369                         snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
    370                         seq_printf(s, "debounce %s (⏰ %sus)| ", debounce_enable, debounce_value);

Alarm clock.

    371                         seq_printf(s, " 0x%x\n", pin_reg);
    372                 }
    373         }
    374 }

regards,
dan carpenter
