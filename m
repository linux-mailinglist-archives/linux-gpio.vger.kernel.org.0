Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDA63DB28A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 06:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhG3E7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 00:59:22 -0400
Received: from mail-bn8nam11on2052.outbound.protection.outlook.com ([40.107.236.52]:55616
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229696AbhG3E7V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 00:59:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMWQjgLlqIfpsPXQcw2bzRojStu2oFCGeI8skrY0bUejTOw0UCgFAa7AfDMOpN2st6CyEgPqxoZrc0yWNoa0S/WMZWJtY3WiyY7/stPbOw5NTNWOi+m4rD+T8yRNqOaVvfSGzzonMHtrQEyDJdiLTW4F6zoACCk8Fu3XYjFHNetj7Ro89Ds5O949jltpY8IkGwr4JPh6LYSEOrgR+QaU8i8Cy3ORkbx+lINkh9vcibGCuYncA8bpom8y5hmVC/jg2ZTUQRvS9MDTQ6nBX5aiSXzleZGQSSLgL2KP3L0vQoz66kr8nYTKg4rEYfrxuoq/mtmxOU/4Z9xeTQy2ztl53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te2jgOFkUxTP1Va9Wr+aKyUEztXJoR0L/Uen+TdcWrY=;
 b=gARKPHyukHC5MhNDhNXZN7shbiCZddce71Avz6ZrLTK87VStuHBpILFb0SAgwvHTxr0iYHQ3skb5LqJaXqFfScU/Jo+gTPDJTHlAsnCutq8DLtFEAB21vWR32jNXlLQnPI96bdzxKNUceAczqNnBTUPHD+sYBs85010AeuVBmZNwSnY7wxg018qYoRy09FP6dBtpca2aIT1wy43O+ZOsbY1kz6EbSTTkfOWS9KOwzVxh/63ebW+j5gUnvRFhaWZxMAt6bqDga3pIr4WMQtqHROf4LqRs5rSijJtfHDa2c0OJ1PE1fGivAHrXFVOYGpxdeM0KZTeU+nqlZNe5/qjV0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te2jgOFkUxTP1Va9Wr+aKyUEztXJoR0L/Uen+TdcWrY=;
 b=lkmML6vB2IJELn/3YN1DGGMZr4fYh2HAl70oMa9m4NBMvmwKvxg4qs8v6txuKEGcT6e6xINO8zh8h8pgn/lS5xgjl46GvvlkWuLTy5cisYh16EckwPZ85vA84MhEk0B616aqPy9OthERwasLQbyYdr/jIcDLPj4ipP/RdZt29mg=
Received: from BN8PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:d4::38)
 by BYAPR02MB4647.namprd02.prod.outlook.com (2603:10b6:a03:11::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 30 Jul
 2021 04:59:15 +0000
Received: from BN1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::8e) by BN8PR04CA0064.outlook.office365.com
 (2603:10b6:408:d4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 04:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT056.mail.protection.outlook.com (10.13.2.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 04:59:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 21:59:06 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 29 Jul 2021 21:59:06 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org,
 linus.walleij@linaro.org,
 robh@kernel.org
Received: from [172.30.17.109] (port=48880)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1m9Kbx-0005vE-TP; Thu, 29 Jul 2021 21:59:06 -0700
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
To:     Rob Herring <robh@kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <bc5185eb-8051-89ca-4a5f-c4e5fc90a7f2@xilinx.com>
Date:   Fri, 30 Jul 2021 06:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa6f689c-e186-46d3-2d7c-08d95316c790
X-MS-TrafficTypeDiagnostic: BYAPR02MB4647:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4647733C8A47E1E0D08A3511C6EC9@BYAPR02MB4647.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gU/KpdkGKbwy+j/7pqUGjRXtxVuw6+p2Ah5gDdjzEGqNBDMYgwU4pOgrr3Re4cocsmtX1yhQCBDTJRxSPqXYN2bEgYnFEXCRfeuKy3PAnpviz8ecxRh5F1ougY7GKlYHv7xXIm1S7cQg9kNBmVdImZ1i6PSkQeUVH2PDtx5suIWUXZqP6F2O5rjtD5KHKTSLrENd4Oth7+kitF0KjyVqBY7jw2bzWpT+hI9JXX9rfEazhI/6JTadMvQ8524UXoNkB4g/qYaJrBqWL2OtKkiYhABWaALZ9AUiWASKu3Nz16/YaU4L+vs+AY0GwQu1qgRjF03C7UXCD6kzWB1WzluHx7idZg/ehk893Gs8fNxw2wf+4M/BJOsM7Lv1IIGr3X1/CmL6JtPXabkUqlX40Q2wbgom0S/vXzYUqlWtL0tnlBYIriGFSKUHs3a5tIlRpE8BGiNZJxgmjFzL/wKpDhRWI7dYIWVQQpVghRgu1WfqtsrOJG11Y9L3S4YbHpVijk3TyM1oihBnBADYx6vrmhBz/yeRl2IdThUwmiEF4IR7U4DP4cP+8Fm8+rN4Bxzjgh5dYGz58wvTnp3QaCmj+TQz7QEPIJ5HgTA8KdQow2k3e+2JUqeUGXIw0xVJH1l4az58yKVXZBBu6PcqVq9CAhY85poBl67wNUmiffagYF1a70JUtiYjhe+uwYraHxE5R5/OdB8MUUEuAalPkM6JTTiG+m2B63sRC1G1Y034o8XvLRA3Krml6/o3UaOs2/ExQlBKuHLHoI72vVp49ns4XCpEgQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(36906005)(9786002)(8936002)(82310400003)(426003)(82740400003)(110136005)(4326008)(2906002)(2616005)(83380400001)(7636003)(336012)(44832011)(6666004)(5660300002)(478600001)(36756003)(31686004)(70206006)(186003)(316002)(70586007)(53546011)(8676002)(36860700001)(54906003)(31696002)(356005)(6636002)(47076005)(26005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 04:59:15.0807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6f689c-e186-46d3-2d7c-08d95316c790
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4647
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/29/21 9:59 PM, Rob Herring wrote:
> On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
>> Replace 'io-standard' property with 'power-source' property in all zynq dts
>> files to be in sync with Zynq pinctrl driver.
>>
>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
>> ---
>>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
>>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
>>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
>>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
>>  4 files changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
>> index b0b836aedd76..be7eae611fb7 100644
>> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
>> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
>> @@ -57,7 +57,7 @@
>>  
>>  		conf {
>>  			groups = "gpio0_20_grp", "gpio0_32_grp";
>> -			io-standard = <3>;
>> +			power-source = <3>;
> 
> This will break using a new DT with a kernel without patch 3.
> 

What do you suggest? Not to update any old DT?

Thanks,
Michal
