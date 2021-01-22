Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BEF3003B3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbhAVNB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:01:57 -0500
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:19123
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727280AbhAVNBt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 08:01:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Md/GhxzlNxb5WEHpZowEGSNjKVATfxg/UVzjXG0SSDB3EOW6s7gCBkHHdrRjrSp9ZcWoXOetagxINlCNHNvzwtkEB9HqYr3GJI0RJhTwcLCNJALU3PiXZ3tRIGyfkHM/mHYbVKue29PJ04wwBGfBgyZUw73GaKXGDBtv4kn81CFtv1koNyOh/T/JjMYwFoCw+Io4168tNQhtQtYNFjrW7k3t8iuZjrdFSSm7MnWaicWGHX+38ZMT+VY/s8MB47Zty/5+NMi1Sb7p/GNxEac92bkkviypf2AFjdlHxJFSF3jyzMYzPbo2dtbFmCwtvJINu8uDsWYg5NMzhnGsQwkz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNiMaO9n4BBApteukGPPmEIi3lrJT2YhUqoWvzuIQ5s=;
 b=WsDzQ2Bsrjnaeo0BwlI1Ct88kojSZT3tUZlYy03y8HvZxdskrxM+a3itICk1p4j2Rhmdp6OvFdB8XnCBcW1+PjqiPcZtw8+N4fy9DuKvX97e+1DAWBHHOm3rBy5OMmDDi91eavBNDOEy2jyNwCmU5SJa1Z1IK61FOmAZgTaJBdEwztzdLSb6TlVT3sr/E+xqusflmA9We3MBfD+VFe0+3QBTWlywEq8Un1FpmQlWf1YrEuxL1bU+jb1fABEKeCHpAZtls9o0pubPLWRw25zbspLCKm7R/TTtmfMPMD+68nRcxPZwWvbRE2iRJ0tT62QNxQo6Rk+1i3zDqLyBVZXGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNiMaO9n4BBApteukGPPmEIi3lrJT2YhUqoWvzuIQ5s=;
 b=AgB9rRqoThI6h+v4/FAymYe9wj7lp4u5lnyiHNpmQykrlmxzhTd9YeHrg6C0IpsT5mQDpCyjaQ08rlZ5bRaS5zmJwksxR5RG/CWTw2FNhMfTvcG9PmWV8PfAZCMmi+gc+pwT2v0WUuZ1dx9Wgxh2pi+t2Y3ZipmuvGl5VERe0Cs=
Received: from SN4PR0401CA0044.namprd04.prod.outlook.com
 (2603:10b6:803:2a::30) by CY4PR02MB2759.namprd02.prod.outlook.com
 (2603:10b6:903:11a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 22 Jan
 2021 13:00:32 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::24) by SN4PR0401CA0044.outlook.office365.com
 (2603:10b6:803:2a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 13:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 13:00:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 22 Jan 2021 05:00:07 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 22 Jan 2021 05:00:07 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=43336)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1l2w2m-0002j7-Sd; Fri, 22 Jan 2021 05:00:06 -0800
Subject: Re: [PATCH v2 1/3] firmware: xilinx: Added pinctrl support
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, <saikrishna12468@gmail.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CACRpkdYH_ZdwF_aXTrp-5rYCifmHF2X8172513q9P+t4vy_RLg@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <aa09f5e1-ad52-4ae4-aaae-7a2e70054236@xilinx.com>
Date:   Fri, 22 Jan 2021 14:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYH_ZdwF_aXTrp-5rYCifmHF2X8172513q9P+t4vy_RLg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ad2cd72-3269-4c4b-32fa-08d8bed5b36f
X-MS-TrafficTypeDiagnostic: CY4PR02MB2759:
X-Microsoft-Antispam-PRVS: <CY4PR02MB27599455D701B97836385B19C6A00@CY4PR02MB2759.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTV2C1XCSOOq9EQV+TiIjq6aibjm0KHo6GqIobTJsmOhDw8ZwGVoo4H9r/t6bGR5/A4tn+7jbTulerV3QkOebJESwDiq2vJgrYLKJfb20Jhd9NdRbfuHcp6sKUVt0EcJx9BD/oLJ0APLk2sRKT4uuK24jzFAVMvPSNWwLLgGhbPLvjVaC6/RKnKdSJZ549PTxN867NoLKQeU3Vja1Qlgqe7wKHGt1rLpmN+ObBJyHEi9U3Eqccm0xW7TQNepOIaAlBn2uG7St6W9WeRE7dAJRu26khTsPjDcz77mvCvH087p8a0QVjnExiOdsw6N/MUWtq+jcljT2pnkmMAcrzuJjiRgyT0U53mrfs2BEhxb+WbGGBWC7j6bfAXVbj8o+/cQnL00wb75JlJbnWlpDZyBs0GqV3EMDgw/OKqNPnSqdaqbgq1EwzJbfNkAn0tcIsuXzPfuPz4QFpU/mljJFdv3WvB8opZqcS5zmi/vrSZ1Z0wa6xmAz3GqNmqNkMgJNZ+spjJCquNG54gaFE88LTtThg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(110136005)(316002)(54906003)(36906005)(8676002)(82310400003)(5660300002)(6666004)(356005)(8936002)(36756003)(4744005)(9786002)(336012)(53546011)(2906002)(44832011)(7636003)(426003)(4326008)(2616005)(478600001)(82740400003)(31686004)(186003)(47076005)(70206006)(70586007)(31696002)(26005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:00:31.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad2cd72-3269-4c4b-32fa-08d8bed5b36f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2759
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/22/21 1:50 PM, Linus Walleij wrote:
> On Tue, Jan 19, 2021 at 6:28 AM Sai Krishna Potthuri
> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> 
>> Add pinctrl support to query platform specific information (pins)
>> from firmware.
>>
>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> 
> I need an ACK from the maintainer of this file to merge it with the rest to
> the pinctrl tree. I suppose Michal?

here it is.
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
