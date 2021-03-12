Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB72733869F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 08:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhCLHeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 02:34:01 -0500
Received: from mail-mw2nam10on2065.outbound.protection.outlook.com ([40.107.94.65]:3872
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231349AbhCLHdb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Mar 2021 02:33:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQwc5AlrPWS11DkC0wKMumHMNgzQkclCAgGSvGhCVND8mKXEA3FQ3fHRKoAWdzNvBfSfrlbpinQ/h/0MncafvJYlaRHE2MJLn0TO8JDWGpk2IW/jz2INZkZqz+Nxt+rWbATM7J0VUu5vK59bkg3AHQTdeRQv/56aQRXnbG+f1vVkyAya+IVhvyU0ZHYsC+J6t90q6xRVzlqXevKPS5PHkBT47nPn5qsQO7uJ79fjYzuCyGGVBJ0psIH/qb+fSo8B7bdAOh5EvPXYB7r68M67M/18hD8vS1TyV8opKs/2aBN7b2k+Ku7qvpN/e6C8pWpF6IkCigZxyjrSmsDrtL3ktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSv/buvKaOIVpTj7doNlMz7IoHofJIGxXoQSsurQJr0=;
 b=O9FCQFtgz6b/MvgIFnX1aKJqkFhHNsHQ5dFCK4gNOO1N8QgK5KT1nHVxgIHXvvJlydVfNUC6qLnjbKuTy58hpQLzGAYYOqlr0Vs2xQ0zJF4GkJ2Q5Ktd4PkESaGeab/M9s5rsWb3APGmAo5l7cpISC2Z2gfJ5IsMsysezh1Dkk8ib/xfwlKN5xVKkEXadGVTo6rs8dfvij4VNqrHkh11dwFNDhXqDr0DV+ku6Y3cDO+93dwCeMPcU6UIdGiAq7z+pyseW7d1a3YcK/lBO1+j3afZ97StUfskpc62UBkya8GMs2h8jD57CLRRnFNkcZ8yJTkvdl/K3jPs5jL1t5TwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSv/buvKaOIVpTj7doNlMz7IoHofJIGxXoQSsurQJr0=;
 b=jdvgaEu8Ir7Dap+Q2OjusC06KLiOHwDIDn8nqaNyzOaGheRRxDe9coxnma1L9n+sQhfRLzQwkQ5OpzGEIjRJy4eS0weDwdmXtGckvG1Fg0C48cl8PaF80RXD+Kl5qyKWlB2g7vlUh9brTUBHItTQv3nh7fZ96mCNkhZO/folgRo=
Received: from BLAPR03CA0092.namprd03.prod.outlook.com (2603:10b6:208:32a::7)
 by SJ0PR02MB7662.namprd02.prod.outlook.com (2603:10b6:a03:327::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:33:30 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:32a:cafe::f2) by BLAPR03CA0092.outlook.office365.com
 (2603:10b6:208:32a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 07:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.25 via Frontend Transport; Fri, 12 Mar 2021 07:33:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 23:33:19 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Mar 2021 23:33:19 -0800
Envelope-to: linux-gpio@vger.kernel.org,
 colin.king@canonical.com,
 dan.carpenter@oracle.com
Received: from [172.30.17.109] (port=46142)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lKcIR-0001Nq-Kp; Thu, 11 Mar 2021 23:33:19 -0800
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        <michal.simek@xilinx.com>, Colin King <colin.king@canonical.com>
CC:     <linux-gpio@vger.kernel.org>
References: <YEsPXZ40nXAHnm4O@mwanda> <20210312065637.GM21246@kadam>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [bug report] pinctrl: core: Handling pinmux and pinconf
 separately
Message-ID: <700ecd31-1193-a35d-d9ec-db7b999e2982@xilinx.com>
Date:   Fri, 12 Mar 2021 08:33:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312065637.GM21246@kadam>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084a799f-c972-46a8-b5e6-08d8e52921d7
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7662:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7662E8BBE54F26387E03BE15C66F9@SJ0PR02MB7662.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gya9Y6ZSkGSH0sKLrEISIE7zxXlABTLsBXr0wgcg0sjA4wNsT6GzhtBTLB94Hqfpws6tsYm1OE63r/LdC9VRZCdbFOKu2w5TF1Rga3kf9GdVa3gyxc9vLAc/lcrFU5VPTgagJnNc+1HDN9C/OWmp6cm9F3o1dAyc0vgKs8LI6M9oTiTnz3WD6VSpenW7tO2tQ3trw2KAppahd9NhjK7PkYQsgFE0ORcLJoVfyA5LnR2PbrDsL14EmufDDN7gJ0lTcXuiGgh2eLg1iIU0hY/WGOcpMdiZyWii3n6Kx1UPfDy67kDYdELtepf9Sx4Xttsnb7rIpoKLCXXJ1WEYaFnpTW/gZ5IiQ0U5dRtZzY4fUp1po0u/hrJBA+7Uj9PqHQkjIEfJ0caFHpiE/HbqjZLK0DGn0YuSqcZBNkv2COILCE1rchLf08FZmyghGvzQf+TGBqJOZLldvI4ZkHVShVZafOxgoP6EVSZz+qOeiYak+u8urmYrWPGReuQOqrc3+5jv5sXcdevNpjaZAveipDf3eujYKvHcl9w1FNib2zvPD0nzAw/4cSdpBzuq34L3XDHTGr+h6AXgNJjBQhXytD7eI/rIhppk4mYHudPdeDNbAnYATtpg+H969zG+e6mDk1IiNgGKgYPL4jxKD0XAr1JA16y0mdxdcG44aO9H0b6nq8hX7YQAdDo5FoSjuj7J9s6ZPUk6fA8AkVG5vzzdRq25qg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(44832011)(36756003)(4326008)(2906002)(2616005)(356005)(36860700001)(70206006)(47076005)(8676002)(8936002)(7636003)(82740400003)(82310400003)(83380400001)(426003)(36906005)(31696002)(4744005)(53546011)(70586007)(186003)(316002)(110136005)(478600001)(5660300002)(31686004)(26005)(9786002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:33:29.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 084a799f-c972-46a8-b5e6-08d8e52921d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7662
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 3/12/21 7:56 AM, Dan Carpenter wrote:
> It also complains about the next loop but that's a false positive
> because dealing with lists of data is tricky.
> 
> drivers/pinctrl/core.c:1297 pinctrl_commit_state() error: uninitialized symbol 'ret'.
> 
> I saw these two warnings initially from zero day bot but didn't forward
> it on because I only noticed the issue with second loop and not the
> first one.  #LifeLessonOrSomething

It was reported by Colin yesterday.
lore.kernel.org/r/34c61597-a90b-5d90-f9fb-4ede3ece3b4c@canonical.com

Definitely thanks for report.

Thanks,
Michal

