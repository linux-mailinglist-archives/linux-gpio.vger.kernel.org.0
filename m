Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6BAF3DD6CF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 15:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbhHBNT3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 09:19:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15272 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233621AbhHBNTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:19:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172DGtH2031177;
        Mon, 2 Aug 2021 13:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Pg758WhgyCipD2IUDw6ge24gF/qSkxZP0MF1NNbTuj4=;
 b=fWzDSkQ1LZzT+eHXI1jVRMmNHRQ6m5uXmUpGEHt6RwKDoHJbjg3Q7/bFBVDRKZf64aLz
 fD1qRkUVUBZJzhFDVVgIR/s2hgTqFJCUn809wTxnRVvhTLHS2JrF69VT7eOaQrXXxA3b
 JEXGvVtL7Cd6l+5tA0OIW6PIROfr52SRBvxxAhEagZUvZqCBthgp+uleKwJnb/KnGWfI
 wlvt8l+pN4RNCAr11gjwigETNguF1kXuWuaMkicWQX5kWDE8/TQHxYmT3JzBraYs1I1i
 bLdBNbyt0mcSd4QzkOP7gBmCVguR+xABLXwI/9q3Zx3BexdWE8BsdeQWcfvKQyB7OFBN GA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=Pg758WhgyCipD2IUDw6ge24gF/qSkxZP0MF1NNbTuj4=;
 b=Ubd07/RnPjCOvVOqi9m7LVRPzXMduniJTNFMwVdD0nTHiv02qmhOnCEIl1Yv/y+Jk+JK
 aLI3CMvQdl2EHsZj3rSFizcDDRnSd2yZLIItX6SxadG474AnXM2YtwehfpJgaf2ENxbr
 NMW4xnhCcf7s7LLLC0fhlFpDylBmgC+KySYS3jBuzwn8ABimWOZUa531Chk0CAz/IByG
 f9bLMKJp2zQxSB/RZwKE0jmcsDOUBtQMAGUVsimaN4oeIiJ2yyUK/vQ9OrIPGVjk5rEB
 svLJsQfBRaNtl/ee0Tq5XWle71bSfvpPHcmx38pzAwT3VT8Afr3yTG4FEi4iE90FVgfw +g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a65eq98kw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 13:19:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 172DFo0R061469;
        Mon, 2 Aug 2021 13:19:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by aserp3020.oracle.com with ESMTP id 3a4xb4v8e8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Aug 2021 13:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIe26PZAYrm7HI1qRQxqzzGtvyp/JMbWI4FuW6v2OsFqZWp/czLa6SHVq5jTsuYH8w7yVMgUHkS1wsAzKuqsv4eutkxbHJkYiXvDLzMCkhPYfa81yDE1YnBTwUlag8ipwr0xNnjAo9Pt9vl8Ca2iFscMGe0BLzHn1swG6c54oHTXyF8bda32C2UbwjcMGQOOIKCfMTXXMYg6932fmkajk34vH0vQ6xbsU9e2QzHebnRLLwMn9MEWY36WadVPKXGXqST9jTTYanu10OvYUw7tY3o9jkKfMyWeDlg5ZaIQEpRT5Mu91J4orw84A4Br5+a3V+cpxKZpP3/0BIRnKZGF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg758WhgyCipD2IUDw6ge24gF/qSkxZP0MF1NNbTuj4=;
 b=kq5wBzarJpRnr6Fhi2lrVUphhGklWJEtAV3IQkL9MnyqR8nAsiMn1Hg4YFEMyL1YbyCMvq9EPX7cmhvyVcaJ2Ow6HYL8rFZzPVZkBXWXK1/+G6Vn+F6Bhsqo+H2tn5yTAW0zmm8JFRADPAaBiWdhsHNGRBqglFlgegd32BqYYjPjEQvzw4lnfCwcafY35jBC/7h+2Vz1W2s5dJk7kfHLrK+xUHTrhylsokFaqu07UKLcOOS1yrT++iCrqHrHtrsTVuNaAbrGYNTcJ+ZhevREpFCGW07bqDYKSU4Jbmx6d3aAPGEMCbPyRvFHP+DaHUzr9qGhOLLeGA2pFljLTcuWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg758WhgyCipD2IUDw6ge24gF/qSkxZP0MF1NNbTuj4=;
 b=gjOuV0m6v4tsvCFUl0OH3QiaMop8I+CEAYns7wcAgkowHph7sF+UBX1yb6ZyVQjKPEzE/ImiPPkIvpIxg5bVmZguHTHxWW/HUyvOPF2kyP+cDCCshozLfiZDvlhIfpousRHWGoQ//Y3OWckAx/OO6TlxcnHw+HFRZlnEuVWBm48=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4436.namprd10.prod.outlook.com
 (2603:10b6:303:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 13:19:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 13:19:02 +0000
Date:   Mon, 2 Aug 2021 16:18:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     miaoqing@codeaurora.org
Cc:     ath9k-devel@qca.qualcomm.com, linux-gpio@vger.kernel.org
Subject: [bug report] ath9k: make GPIO API to support both of WMAC and SOC
Message-ID: <20210802131850.GA2459@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 13:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4126c44b-9776-4094-4cc6-08d955b81899
X-MS-TrafficTypeDiagnostic: CO1PR10MB4436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4436A3F14FB6808969AEE5E38EEF9@CO1PR10MB4436.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4zUoQc2V8a1GiAHpDMAbQOuMhvjvD0qbx5y+E2LOUXi/Odi+SDWuWLehP9tmM/eNbcnOEIacMYtfUVOA9DAYJ3QMQhc+UK8xJEnfkmXNK/SS87q5U1C+13SfxL0qiEfTeOosSQ215WNVdP8vnotgRsG3IihrKpxyyiaPzKLByTdA+cKfeHCQK9FzlYD1C4ChY8qxMRVI9Fl/3SRvYQdyyvv1pcG3br31ZPqcTWHYuIRhoO416amP2TTygvmdeQhb1U6kXwyeYVBwXmZYx9guVbWZfCtEZ0nGmMn5uqIgrtBesDCKnyWz8KmooZIAAY//7ERzHhUzE+NG60TNLc995fTVHWejPy5X0KDfV65KqfcYEItv7C6igcwzjOuMy1DNCGY3CpG4vxWh4k9aW0cygp4+19X19bR+dK+k0nZFNCM9DgfDJ2EMPTtt1HRHxBXbfRISRutsHmdHzqZjlOPAQRJfuCPj8v6q5ckfKUjBsw+bZYzL/aNWKkzbT3aW1O/ks+DzKbcMKRdDB2DOixU4MM586htpPT3Kq0viyZnyw/tRf9jvgAwjsUhcs+Q6jDUPshbb7UY2ffaK+EMPpVXBRzNXw8GrnvtA/d7clamOOSO1S9lwiRSFCQY2/dK8H+L61hhzWng65ZKqmKc6ud0X3rQD7q+3Yh2DSuUPKpSfYp2RJ+YUw6OkCiLoxGzAa4kXGDWoR3C0VdN9+bS3EFvWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(346002)(136003)(396003)(9576002)(33716001)(86362001)(4326008)(5660300002)(83380400001)(44832011)(316002)(956004)(6496006)(2906002)(478600001)(186003)(1076003)(33656002)(8936002)(38350700002)(52116002)(6666004)(38100700002)(8676002)(9686003)(55016002)(66946007)(66476007)(6916009)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vL6y8OO0NvRNEUOft13QXycfYuBkDmoiK8yfKk+f4nQKryZI8dl6mUV5cys?=
 =?us-ascii?Q?VQWielP5h68A49UE7jugZZLhM7w9EJ6n+xBYdoRUpEyBjjEm2u11EMnyd3K9?=
 =?us-ascii?Q?qfteACXUO2ASmZiTKdbhOav37C1iu1agBQlS4ec++0sC42yhFGw0bpnCUH1m?=
 =?us-ascii?Q?K7E6cXnlJ9SjUmmi+5DQvsqNP7siRV2tOQywqBZ6HphFrP0xOZ2ihwMs5/ZY?=
 =?us-ascii?Q?zesKtARRp+e6FFXLvXjQG1lFBOixb/OXCWtYfaRnlf2SXjYyn0mo1m1urEXh?=
 =?us-ascii?Q?Gc2iHkL32Zw0EMAwS+7VX3XhteNUzd4Uw3oi5PikWeGJUG+F8Je/3370w1qe?=
 =?us-ascii?Q?5Kb1esFiTVyIK0PlK3JtIoWL37K5aNGPWWIatXJ1mGlEhdODYCxofCpvbGx9?=
 =?us-ascii?Q?5Jc/jDhPR+sOHArygOgLgHKbOcxsPT37kNaSy5j8TxQoO+hHVrMYjharIkwx?=
 =?us-ascii?Q?o0HlbAghI0v4QADAHTPlkcY63fS6OQUD2+msXRCGEmb9DtMKAqua4yf3GfGs?=
 =?us-ascii?Q?aLXs0BdF5m71G7sZgFkeBaDdSbB7wO9sIFHijYjQfxpE31htuPGx5hr/WWJt?=
 =?us-ascii?Q?VTZcV9B2foWWwHlO+iqBKv0jF0z1nQltGL8e7r3bZp9tjrCTSe2A3+p2oOhD?=
 =?us-ascii?Q?lBdyJ9Z9QylJAwuXKV3+r7H8bBAqHA1Uol3A+luOsA/eLteYvcyVMIFx7xuE?=
 =?us-ascii?Q?z9FcwztQcO9FGPwJSrTS3uOtyFDiPE9RnjanUzoV+odCML5lINFW0W3CkEfl?=
 =?us-ascii?Q?DhPfXba5+DSwrH+bW2Gfoqp+L8/RKkA5znk9bvr7Mx325RnOQ/k0Su/6ePMc?=
 =?us-ascii?Q?8uSdsyreNYNVRziJO5rlC4QVAmAAAsN41rIviiWe+UWuI4JWHedek3HE22IX?=
 =?us-ascii?Q?6U+e86CtlzXKVUHiYQpFJXAdANeof9AG91Sot7oSQ4K2yafWqTwd7YasucDp?=
 =?us-ascii?Q?C5v0gN7KDx7w5VgdWE3rIzTGVU0wAXxz/KfAh86Vx3ZtwMI2O0NE1xIGpx6m?=
 =?us-ascii?Q?ALRiGP4hSeliBSZW9gEls0G/lMYfl0QTRJvac42qf13Ge1GUxC2HcFF0axIv?=
 =?us-ascii?Q?m65so0kuEjc7Oa/Qmm+IwmduytWeP/xWUvtRSE3emKmLvpLiO9eBfCnJAM1v?=
 =?us-ascii?Q?bV0WI8Piv8tywh/VMnw1R3D4q7Hwtv02LO3uavOrHDpQn4EMLO/UfEEzapu5?=
 =?us-ascii?Q?BpkKNcFMS9ARwtBS3woeVQa5GPEYVG75XmKRP7Pz80ClIUybrA3G6Y/HzUDN?=
 =?us-ascii?Q?adfHTJJLT16YUU4knGTQOgMTNcSipHGqc//r+ucmLEzMan4E3x1Rp8Ws+In9?=
 =?us-ascii?Q?rdo43E4hmvt0epGtJDascnfw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4126c44b-9776-4094-4cc6-08d955b81899
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 13:19:02.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0bYhoWCjKiST1HlG2/ZbOG2tNTr3qXl8o0f0jL36I+m7pl3Cylw+EUphhhYS5Vn78rP23XeNLkl0GHfbV6FCvOOdFPkYXvv+EwdNNaZ8po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4436
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10063 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108020089
X-Proofpoint-ORIG-GUID: bxzZuGM3h2vo5y5NO96IN1Ff0PjeO4A4
X-Proofpoint-GUID: bxzZuGM3h2vo5y5NO96IN1Ff0PjeO4A4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Miaoqing Pan,

The patch b2d70d4944c1: "ath9k: make GPIO API to support both of WMAC
and SOC" from Mar 7, 2016, leads to the following static checker
warning:

	drivers/gpio/gpiolib.c:1960 gpiod_free_commit()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath9k/hw.c
  2728  static void ath9k_hw_gpio_cfg_soc(struct ath_hw *ah, u32 gpio, bool out,
  2729                                    const char *label)
  2730  {
  2731          if (ah->caps.gpio_requested & BIT(gpio))
  2732                  return;
  2733  
  2734          /* may be requested by BSP, free anyway */
  2735          gpio_free(gpio);
                ^^^^^^^^^^^^^^^^
The problem is that gpio_free() can sleep and the cfg_soc() can be
called with spinlocks held.  One problematic call tree is:

--> ath_reset_internal() takes &sc->sc_pcu_lock spin lock
    --> ath9k_hw_reset()
        --> ath9k_hw_gpio_request_in()
            --> ath9k_hw_gpio_request()
                --> ath9k_hw_gpio_cfg_soc()

  2736  
  2737          if (gpio_request_one(gpio, out ? GPIOF_OUT_INIT_LOW : GPIOF_IN, label))
  2738                  return;
  2739  
  2740          ah->caps.gpio_requested |= BIT(gpio);
  2741  }

regards,
dan carpenter
