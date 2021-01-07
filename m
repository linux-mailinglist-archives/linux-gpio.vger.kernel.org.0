Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E1F2ECDD0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbhAGKaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:30:23 -0500
Received: from mail-bn8nam11on2065.outbound.protection.outlook.com ([40.107.236.65]:10337
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbhAGKaX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 05:30:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb/hHb8skURvbXmF9JjHNWQXe/aSPZGGkCfXrXi+8igk9uoDcaVsTAFS4Hn8u2MvBCB1YGdM+1YdFRaR07e7GY3JasRPYXfiVQo00pbsgkwL4XrY2vx5XFtQVYhjjQA+lIcIuJ2aA4J0Y4+sqyCmccd0xzIxO/0uzXxCtM9i7/DzyViHbaXNrbS4vpXX9BPZdsnlgcreAHpP1y1EQ7uEXfRPn8aJkepncJRdjJdmRDGpa0Wprs7JD7bpU6P/QIVEzNx0vL6Zv8addq6idgKezBJ9szl6g73MJieaZAhVtrQtwq6w8hekqS5NSLAnbbjtft3N66kN9Cv4BQSqVJa76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FnbczL2GW0LJk5saROEKpy5sZmwuMkfktorlTYWgFI=;
 b=CnyBDNHpnzEVCCuOHPHRz+lmo4ZRoXWas7ozmOxyhyuTQNf8GVeV9uNp6RepWd5H4y3ww781kMBRLNLkI024Hqv3Nf7Okm78D6QnYMfnEOEF908xMmN73VvIE9sXjqJK0h1ltgxNYt6rTQK+mGUJJze4+Ps+UFiMKa7APBOGBHzCv58z18uuAyw4wEheUskFuIs8aQ11SyS/MQuvhd9KszWks0/TIDN1dLwysEmq0ajPZcW3KynMWipT4HSM8cIwOBiPvC231jbFzApqShuAW+RRXiKgtrvSznGvmPBE/CvSN+WTMKKXOSbYp9EZ3IYMGVGatAlsWmyRUCHG1ZNLkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FnbczL2GW0LJk5saROEKpy5sZmwuMkfktorlTYWgFI=;
 b=r1mggCDQnzLUIpt4zHpaVQtkGMLXh4AL9EcmsElH2hmzDyYvQ5HJrnNV2g+0fYuzVugd3jHPtbrC60U27ipwb0Ui1v9qVpbBgdJtG299Ut1/e4UR6/VimaclMXIFAiXZ1yCHp9ZW0OV4TpZh5Ke9kNPdbcHLeTniz+TrXYPO3H0=
Received: from DM6PR02CA0165.namprd02.prod.outlook.com (2603:10b6:5:332::32)
 by BY5PR02MB6834.namprd02.prod.outlook.com (2603:10b6:a03:211::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:29:30 +0000
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::9e) by DM6PR02CA0165.outlook.office365.com
 (2603:10b6:5:332::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 10:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:29:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 7 Jan 2021 02:29:13 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 7 Jan 2021 02:29:13 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 syednwaris@gmail.com,
 vilhelm.gray@gmail.com,
 hancock@sedsystems.ca,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=46548)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kxSXY-0000oQ-Mf; Thu, 07 Jan 2021 02:29:12 -0800
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <git@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
 <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
 <CACRpkdZrBXJSo_kicWKQ_wtFTZvkOUNyjP6UHZfY7xwRSNZBRw@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH V4 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
Message-ID: <11abb0f7-407a-3509-ad50-cc7698147ee5@xilinx.com>
Date:   Thu, 7 Jan 2021 11:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZrBXJSo_kicWKQ_wtFTZvkOUNyjP6UHZfY7xwRSNZBRw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 295dfdc6-b3f2-41ef-b19a-08d8b2f71d96
X-MS-TrafficTypeDiagnostic: BY5PR02MB6834:
X-Microsoft-Antispam-PRVS: <BY5PR02MB68344B0889EF4DD43924345CC6AF0@BY5PR02MB6834.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWIYWwpdWLRV3WYx1RON3H17NJD5g593VZn+VnfB8TfgAs0hBSjGexRsDTe5CwCbUiHxDEIyoCSv6uzFDYM+KQWQx0SUqF1dsAJqmE26FCKBVyOtjz90ISE41N+pwddpZGDUkjYjts82DbIjwABOezBCLdLw+jVLVCO3ukZCpZMQHKMg6BXM/icKgS4na6/iQsA6CWRgeGGQ3i5wQN8lRN+CVSLOjeM3Wt5viZjqqrJlG4mldmRN7iaZ7DJfW71fKYruGLOF20TSEsxLtNT6e13F0CEaR+lAof8bwmqTrcnvxGe/vmMPoKF5vKUTpCYho112CZUOhpghQjME3SZVcDWMevPTFIgrjMzQGlvw7PNRfnuHiAEIHpHxwTy0N61RhLHcX5b4X7UwwzSmnscSgVr3fFwJ7ChPwcng84Ly5BiHiEr79Fr76q+9Nv0E60XoUYlCCE7VN0sQtGKCZzHwQBvPrAujmcDwLcO2PzyiGzVQhes9bqAhz0qZb151qiCxXJRpYcXq/zRvkvV7IVbZBNqtuRM9gFQj9uej0vgWDeY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(8676002)(31686004)(8936002)(6666004)(5660300002)(36906005)(47076005)(70586007)(426003)(44832011)(186003)(83380400001)(26005)(336012)(107886003)(53546011)(356005)(316002)(2616005)(82310400003)(478600001)(31696002)(2906002)(82740400003)(36756003)(4326008)(34070700002)(6636002)(54906003)(110136005)(7636003)(9786002)(70206006)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:29:29.5386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 295dfdc6-b3f2-41ef-b19a-08d8b2f71d96
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6834
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 07. 01. 21 11:17, Linus Walleij wrote:
> On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:
> 
>> Add check to see if gpio-width property does not exceed 32.
>> If it exceeds then return -EINVAL.
>>
>> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> 
> Aha
> 
>> @@ -591,6 +591,9 @@ static int xgpio_probe(struct platform_device *pdev)
>>         if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
>>                 chip->gpio_width[0] = 32;
> 
> This xlnx,gpio-width seems very much like the standard ngpios property
> from Documentation/devicetree/bindings/gpio/gpio.txt
> but I guess not much to do about that now. :/
> 
> Do you think you can add support for both?

support for both is definitely possible but we need to handle also gpio
width for second channel referenced by xlnx,gpio2-widht now.

It means we could end up in situation which can be misleading for users
where ngpios will be 10 and xlnx,gpio2-width another 10 and in total we
have 20 gpios.

I think that it is better not to start to mess with ngpios property not
to confuse people which are coming from other SOCs because ngpios can
suggest all gpios assigned to this controller.

And in second case where ngpios is total number of gpios and if
xlnx,gpio2-width is defined you can find width for first bank.
But it is questionable if this improve situation here.

Please correct me if my logic is not correct.
Definitely this should be done separately out of this patch.

> 
>> +       if (chip->gpio_width[0] > 32)
>> +               return -EINVAL;
> 
> This looks OK.

Does it mean ack for this patch?

Thanks,
Michal
