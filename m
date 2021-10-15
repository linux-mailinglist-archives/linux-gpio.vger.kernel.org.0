Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29442EDA2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 11:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhJOJaO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 05:30:14 -0400
Received: from mail-bn8nam11on2065.outbound.protection.outlook.com ([40.107.236.65]:50657
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236608AbhJOJaO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Oct 2021 05:30:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2z+gNK0loBSM/SBwbH2dmFEx26XIz1IkIVWS0AgZs+yUG4B0P9ZOZOJ2LurRw/dgrcaQlv35ad7HK5a7Z7WcA/ZzbKWmkuOydNCrwallxU4oGWqpGIGlIObY3/9bEPLDAnPBJGfJx7ZtN7wHIgaJzFAVkaJl80O4QbjOgpSQIZgxz1Ug7GXwM9Rkf0LtMphSW4cyDL/zYQJXXKzvyQuqPoMzboTfYAW7OBnHvn5gIUyWl3aSIGT7JRP+CmuAAXQ64rjJ5/+smSybY/jvTveLWDlD+Iijd97jR3Mk7o8vXP3tR+VeBwJq3R7Bnha4gPq+U0MKmbNOiaOi8XFDoaA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsV3VuYHBt+qSS+WXUKST5TWg4jXOAFSySWrALG1zXk=;
 b=gtNxc9Jn5znfu+hVPppysUrncltwGzn9mOPwPeUlqu+VpAb0aER3bggRj9nzexoiMoNPoqkkaK6KG2d5h7w7HBoV0wwzJyiXVgU0y4vdsaxnaupbq7eFDOiqKX9mdr2z+YQhERJ7nd0AibFzkTK6ZjJxmoumS9R5fqMJ3xnOsrrgY3nIljrbp7gIw9RGcbTTYelkpuHa9lLPL1dvZHJhDJrKo2q/UAyaTBmV8BwzQdY3V5Rcnfk3Py9KiYS81ZuqLF7ivUb8zXDNNyR5FO3nhiTAiUaxMOcl24b/cBIxm4Il7FQtA5blUdme0IABFFB2Lu8sgarvin+Ux6I/O2RZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsV3VuYHBt+qSS+WXUKST5TWg4jXOAFSySWrALG1zXk=;
 b=FZYazR2WnOzpTePjcTnOxMSOnKaQDDoOhZj4gJ56nURHeDDf8IEQCfS6OX7/fAlheVVCdCcbFNQbZc0eKRuHOf/irsauJUU+tnvEtcGC4cJLneyXtA5PbgH9sd2ASA75v0IQBnr0JMdh2ir2nTrRIQ5kboc7DpYgyHOJG6kwNq8=
Received: from DM5PR06CA0027.namprd06.prod.outlook.com (2603:10b6:3:5d::13) by
 DM5PR02MB2265.namprd02.prod.outlook.com (2603:10b6:3:4f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Fri, 15 Oct 2021 09:28:05 +0000
Received: from DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::2f) by DM5PR06CA0027.outlook.office365.com
 (2603:10b6:3:5d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 09:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT035.mail.protection.outlook.com (10.13.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 09:28:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 02:28:04 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 02:28:04 -0700
Envelope-to: git@xilinx.com,
 robh@kernel.org,
 robh+dt@kernel.org,
 devicetree@vger.kernel.org,
 monstr@monstr.eu,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 iwamatsu@nigauri.org,
 linux-arm-kernel@lists.infradead.org
Received: from [10.254.241.49] (port=53814)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mbJVU-000BKK-4D; Fri, 15 Oct 2021 02:28:04 -0700
Message-ID: <ab5de303-5b3d-caeb-7fa0-6dfc96576447@xilinx.com>
Date:   Fri, 15 Oct 2021 11:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add missing compatible strings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <monstr@monstr.eu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Srinivas Neeli" <srinivas.neeli@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Nobuhiro Iwamatsu" <iwamatsu@nigauri.org>,
        <linux-arm-kernel@lists.infradead.org>, <git@xilinx.com>
References: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
 <1634221864.213975.3295884.nullmailer@robh.at.kernel.org>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <1634221864.213975.3295884.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66c0a0b2-c730-473f-1de4-08d98fbe1818
X-MS-TrafficTypeDiagnostic: DM5PR02MB2265:
X-Microsoft-Antispam-PRVS: <DM5PR02MB226517A91F4830D9431AF5FBC6B99@DM5PR02MB2265.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MleKLS/LdFx2FOLM0hqKBDJRAWZ3Mf/xS0Cmdk7QIJw0ypBsEpIXTASdIVpFCghkcDc2wgp6J4KowsnLShRCBqVdwUZZ9Z034JRPqBnsbd7WiyFHkw+Ffy9WkrbD3JLnyT+iI+RhdLiadK8K1J+x9DjDUj0mOl/6qwdDX9tIEZA+YuxNY+dfoIMihQf3Qfgr+yeVMVC66n8vzDzvI83PqYfBYalAtZZzn9mQjqrZvNnTOMWoXykvf16vRmvlX/WEWpRdNKteYWeIRgSb9O1VWscQVbA1zFeiuS8MjhGCIleAoMzYzqTHHQUQhYfq8dHZ2Jab1rf25PFPVOddjiUYe/eKXejNHYRRP7U8YnksXkNiwyscwhWyRfQUvu4JZDse9H2qnjM7fIbGmxO54sxIJVtnrfJbxzfWutkRe508OL1MjMZWWjam/xSwpRlQDDC0jacSTWxdmSy5G+5+J/oaA/a9WrbCB6DQWYwGTx3sqhu1GuD6iuhvwkTppuA+BCAx2+JV1ZrpIgyfL7ycxVK0K+Zbj0auLVzljnlStIj9DFeCUIPsfiyVqb5Qz/9kilM60CIsYoZhSnMQ5C8h9QO8tvCcJI79LsVgDC66N3uE+LNHGa5yb8uLbld1bEoPMdqEGEBvZPwu/zwxXEtqLwqxPaQ9KQzImYDFy/mkPqFHefSORNiifeJAU60CXVjGRvhFLLa/v9chtT+7aElNKJyd9sfC8My7gyrozstrXm3N1+nikoL2EZWl5HSztC7f9fw/F5vk9ILO2RuHy/VfKu0NC+BU8HasyfBvRIbdJMh0yn16+LQLHP2sHMyHn3MNJQvzerzoK2YC9+ZxdQKrGtYWMA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(110136005)(31686004)(36756003)(54906003)(36906005)(316002)(82310400003)(508600001)(5660300002)(47076005)(53546011)(26005)(8936002)(31696002)(8676002)(9786002)(70206006)(186003)(966005)(70586007)(2616005)(356005)(7416002)(426003)(83380400001)(6666004)(336012)(2906002)(4326008)(44832011)(107886003)(36860700001)(7636003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:28:05.9518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c0a0b2-c730-473f-1de4-08d98fbe1818
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2265
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 10/14/21 16:31, Rob Herring wrote:
> On Thu, 14 Oct 2021 12:14:18 +0200, Michal Simek wrote:
>> "xlnx,zynqmp-gpio-1.0", "xlnx,versal-gpio-1.0" and "xlnx,pmc-gpio-1.0"
>> compatible strings were not moved to yaml format. But they were in origin
>> text file.
>>
>> Fixes: 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>   Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1540859
> 
> 
> gpio@ff0a0000: '#address-cells', 'gpio-line-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dt.yaml
> 
> gpio@ff0a0000: '#address-cells', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dt.yaml
> 	arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dt.yaml
> 

I sent patches for listing power-domain and gpio-line-names based on 
this patch.

Thanks,
Michal
