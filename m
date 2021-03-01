Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1930D3281C8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 16:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhCAPFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 10:05:41 -0500
Received: from mail-bn8nam11on2072.outbound.protection.outlook.com ([40.107.236.72]:3651
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236802AbhCAPFY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 10:05:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsRBCKx0XOjSM6O44ZZGgGGx5lbmwTTIIuf/0Oe04X2Vi2Iq3sqcqQAcYI9wIDd1ACZlLW+ZunlHs3MXgz1iIPKLc0Ab3MHHQTkqh/2kmYl8bwCiLjIGTLul3c6kmZ5447oP0CQJ8tMKC4f1+CeQj1xgSb1nSZ/Ux+7JgdvXzwWePIOo4NWOV6OvN7G4xJHXkJ4lc66WlVV7H0HBowLvNzTu2tNWy/bfWlSoOOBlqtV6vngfDkr+ztLkK5t0rWXKLZCLF6I0pne762Nm4d/yFvp0Ctc+We1lNVdyhQVB7j+19ZSJyc3zvD8m3mnUPZkq5+h4Bjw6UfHyLiaIv96mZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxPupzbl1G3E+TUxv32ZgRflszU8OAGWqKYKaUrJcXM=;
 b=HAAEC+bDJN60wL5strMpggrLOAAVjvRjB/62bw0fOLnefmSR+sIVmJO790GvOWClBzDSj8kXBrCWlNNPnwoIgaf6+JFbe78HcS+Q9nilAwaFquVbEXBuB73wZyaBK0xmSFqu2U+EkCqsOWpDi3r70P1rVXK27SS9dLaJJ7zCMxKoUZu77UBM7kNXxfKBfhsE2QA53k0JHtCGzz5Wh3mcWm+ELHpTrX5GLq9oQ+azfHqgtCTk6HwUJXLlXDKO70oIfJg8FsqcQsFF/4ltSffGWFSP48epeqSqUMFOJKlWI+E0O2a6NYb2KEUQsQu3L5MNz/RXaF89X9qtOHx7AdhtMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxPupzbl1G3E+TUxv32ZgRflszU8OAGWqKYKaUrJcXM=;
 b=kqwpVneN29j5mTR4yj3VXJWIFvOK8OqvcM84Spp94Eoif0tzRt0YwAAj0vW62yY1cK0eloR8znONEybQ5H6/gvu9z9j4rOAlyXXHY2tGYE5T6hY1FRdBv1c/mogcpmfHuc4Hfy+rL2DeCo5HT6+4JQ373dfbCXarCchyxCV1fXE=
Received: from SA9PR13CA0130.namprd13.prod.outlook.com (2603:10b6:806:27::15)
 by MWHPR02MB3197.namprd02.prod.outlook.com (2603:10b6:301:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 15:04:29 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:27:cafe::59) by SA9PR13CA0130.outlook.office365.com
 (2603:10b6:806:27::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Mon, 1 Mar 2021 15:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 15:04:29 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 1 Mar 2021 07:04:28 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 1 Mar 2021 07:04:28 -0800
Envelope-to: lakshmi.sai.krishna.potthuri@xilinx.com,
 michal.simek@xilinx.com,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=44550)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lGk60-000773-CU; Mon, 01 Mar 2021 07:04:28 -0800
Subject: Re: DT overlay applied via pinctrl description
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
References: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
 <CACRpkdZEYqPU6Zr+a6fivZiz-hKx6-KVdYVR7j--y+k2KXZaPw@mail.gmail.com>
 <45cea3bb-6e5d-4005-ef2a-67b08772e0d7@xilinx.com>
 <CACRpkdY=17xTdByUMdKfqCPS0ZcwMPC4w5EBaPrHgnEmkKYc-g@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c89112ab-cb26-e90b-4ce4-490daf9dc43d@xilinx.com>
Date:   Mon, 1 Mar 2021 16:04:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY=17xTdByUMdKfqCPS0ZcwMPC4w5EBaPrHgnEmkKYc-g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd87de47-5c17-475c-0b61-08d8dcc35013
X-MS-TrafficTypeDiagnostic: MWHPR02MB3197:
X-Microsoft-Antispam-PRVS: <MWHPR02MB31976693E595ABA40F77E43BC69A9@MWHPR02MB3197.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ar61xX01k+AYaP/5tun32PONycvKQF4Muvb+gJmy24HeiNrcaWU9cb4eEgAGrsTlo1BhAyu+NDnIjRnK+o8XAuc/BeScv9HUNjhBhZ7kJfobIs+lWQadvI9qQ+gnrhyxPfOAY08TVr1fvLzGOpnPdLZFOPo0YJ8RehZ1EYGmHaHeYPrQfHWmU3CjeD009HDUFi/EjIgzwflGjl8jtUn6WM0cQC5s0RdlgUxy/YEE183Tj39hLcJ5vMps4sLUI+TZbgrFUmEn8lhKvDui4AUv+SAQx0STTLdkmjDavYovHJHI7ZLS5SMV/BCWTGh0zDB5o2iBdPdEw7dy6QldGUPndJYvHKuXXwDv+9SjIt0Tq12mBD/V3lnjbH+OglmkigvGkkLv27aM0QLIB9L8KAx1sIHZCFo9d7W/6OFKh7vexvuDL4hAe32e0oane04psonW9boOpJbce2bpUrfyw7G35xgYeQjazt0+veY7oUzfua2YQi4NxLnXr5GPPQVwth27tkOOJ59HwDymyTJKLbbbx5WyENG48AJt/+SpehJF0J4lgEz3d3Znq3CUp7kROVNmA1WGZhQvr8sNla40kmq15Zy35VrHeXSXLUCL2Emq5QDWbqNT0fnmlhevxeOcRk5M1WP3uoHyIjZiktb+2dEwq1GzycrnprtrGaIQLsm49amx57ztHL2D2Mvj2JZLixSmyex70WlAdtsmnMqRHbQgwA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(36840700001)(46966006)(5660300002)(54906003)(26005)(7636003)(36906005)(356005)(107886003)(426003)(2616005)(316002)(31696002)(4326008)(336012)(70586007)(110136005)(186003)(70206006)(36860700001)(4744005)(8936002)(82310400003)(44832011)(31686004)(478600001)(53546011)(47076005)(36756003)(82740400003)(8676002)(9786002)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 15:04:29.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd87de47-5c17-475c-0b61-08d8dcc35013
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3197
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/1/21 3:13 PM, Linus Walleij wrote:
> On Mon, Mar 1, 2021 at 10:31 AM Michal Simek <michal.simek@xilinx.com> wrote:
>> On 3/1/21 10:19 AM, Linus Walleij wrote:
> 
>> Does this mean that you prefer to fix how dt overlay applying instead of
>> fixing code to apply mux configs first before conf one?
>>
>> Something like this? (just c&p patch below)
> 
> I think your patch looks correct! Can you make a proper patch,
> make sure it solves your problem and submit to the mailing
> list for review?

I will check it on our platform and will send proper patch for it.

Thanks,
Michal
