Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817DA3EFA79
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 08:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237892AbhHRGAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 02:00:48 -0400
Received: from mail-co1nam11on2049.outbound.protection.outlook.com ([40.107.220.49]:48736
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237805AbhHRGAr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 02:00:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYRUTkRXaHXuMj+Hejk+JavVHfyTA2jnLwOu1MO7KGkyYJHR77H1X03gFlTOmXgdq8L2WIQWffg+iqEko7GLhApImQeTd34FPGQa5FdfOI+pl92VGQ6KOmjRTvtNleLqTpN7w4pd87Rg26xoZdO8ijJFNNmG2wKiC7mogHNsH+nYBgkWZCSZDxEixcVZw3C2PgsHViKeeyo+d5Baoh0cDAX5wRw5NtrebwnXPaqjQN6oaUhuJ3LBxiqIS6YBJ91XzMz/sRpfHUUxpNnRnOWM0W4v9DmdEXFxnYbcCjXpvE6yPpUQSTVGizEYBknD8USFtouBSpTiiqpdCpOoItnucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6iz96RZ0Pu2UNOzkbFCbLO8MECiBtoxEqHdTXtHjDM=;
 b=kcRdbyk8drdsPRXDGjyJuLKALJuWf2jKjMbG9kI/Y054DM2LaUFHhxpFrVZmwLc6FB+sAG97rfENEEK5wmz9Q3YgKD9umt8FwHITNGxO4cMYx8O6X+PFa3nf+zDQHZFbEKGR49k+s6ZIVBGLAj0BaiZ2Imef4SIA3csBAjd78Ig1IK1Y6zL5qkmsWbVxHDrL/8+aeh19sjdR1KY7bfxfafcrp0+0C7Cc3fdPqsEPiEfWxGMTNxGZW8yeYGs2mfv0crpknOFmEXEjtsDTTdPuKACfBl9dSWzAQ0dZPHUps752GHglrQbggsc7m8Bh13yuXLNPPUqe7lJXVO/glsNcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6iz96RZ0Pu2UNOzkbFCbLO8MECiBtoxEqHdTXtHjDM=;
 b=Oxxevvgf1G5i8W1tCB2YhvosmgIz7E+17CToMDVeGY90FXBWraDbeEIf+Ci04autL1sjkjefudxwRhjn5SZFsno9Fugde9lSI79fCbuvEF4ZlR51itMYSGEiN1djsT2PR43nZyhVYfvwnBA3e/kHlnNGYhHYy9zwqAS9ltmGMQE=
Received: from DM5PR22CA0014.namprd22.prod.outlook.com (2603:10b6:3:101::24)
 by CH2PR02MB6936.namprd02.prod.outlook.com (2603:10b6:610:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 18 Aug
 2021 06:00:12 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::b) by DM5PR22CA0014.outlook.office365.com
 (2603:10b6:3:101::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 06:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:00:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 23:00:07 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 23:00:07 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=44820)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mGEcP-0005rr-8y; Tue, 17 Aug 2021 23:00:05 -0700
Subject: Re: [PATCH] pinctrl: pinctrl-zynq: Add warning for not to use
 'io-standard'
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <git@xilinx.com>, <saikrishna12468@gmail.com>
References: <1629265999-33358-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <447d7205-f562-72c2-8317-031cd733d60c@xilinx.com>
Date:   Wed, 18 Aug 2021 08:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1629265999-33358-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550fe484-61ba-4546-4072-08d9620d70f5
X-MS-TrafficTypeDiagnostic: CH2PR02MB6936:
X-Microsoft-Antispam-PRVS: <CH2PR02MB69365A58ED0A910BBC34E7C1C6FF9@CH2PR02MB6936.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUiLyattBjq9iqfvJPKW9yU8NzQGiwLWgdXdukoGPveS8zKHmVxk9SAzVzzuM/AkWYC22sV0djtyUXSB12zV8W2l6PtqWFuO/IcmysjlEULGhiQDRLYvXyPjt9WU1Ic3rJtWBFrfpenYFM3lcmVTiEf3fQzhr7skmoLQI+frgnncaqJWxh4JMPtaORfNEJ76F5EfiTH85PnDSQBbweQ8gMPGoeafH7F2NvSNDkFqVQQBuU59+EcHWp+FC7xg7RL2Z2RdJnGclPexB76GgCU+1trBlSt6WS+7qtiJwswufzuG3Gy+T+RXs/Rj6mT7dDoC466RCIi2A85K6YZiEX0T7U0RXvDrPIRN3ywRr1cgRbHzF2mqti/sROg25LgZNs2QtgkSUL1edXwKbKbdo/08lPqYt6aIMyj5czBh8CUrG9mDcyKlFEuYRnSc+3I7rkMlitm3/znIJpHJyz5I6k3HrbGg8V9PEzK7VPsuq1pbGcVqj++K/LuB9DbBWft5zAp2pugOZa4+wH3R/fGpkv/Z8pHDHSSdYmE43C+aJ3QU+mp8iTK95iwu5hQIDblLvGtlN0iLKBtaIj2VIBNtIxV0KlsgWR9WHVn8GqDog7u22qc5tt7K/4zfYgDs6nhLprkAtOkdujcCXDi96kDQgobfA0CMTyPk19BU2nnGhAfxYXR203sEeUWh92rAssRfZNkNrnzBqIgWGiC6JMoTUfd9UrNO1J4PfEIIsvZ7WX6tP2UTjswbUCabBRYDyMvqV1y17OSo4ZI4N6ME4NedfM6GhQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(36906005)(82740400003)(83380400001)(2906002)(53546011)(8676002)(47076005)(426003)(478600001)(7636003)(9786002)(8936002)(5660300002)(54906003)(110136005)(26005)(31696002)(70206006)(70586007)(36860700001)(4326008)(356005)(336012)(2616005)(44832011)(36756003)(31686004)(186003)(316002)(82310400003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:00:11.7954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 550fe484-61ba-4546-4072-08d9620d70f5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6936
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/18/21 7:53 AM, Sai Krishna Potthuri wrote:
> This patch add warning message saying 'io-standard' property is deprecated
> and instead use 'power-source' property for configuring power supplies.
> This gives an indication for Zynq pinctrl users to migrate to use
> 'power-source' property.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  drivers/pinctrl/pinctrl-zynq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
> index a96af8a..5b269b6 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1028,6 +1028,8 @@ static int zynq_pinconf_cfg_get(struct pinctrl_dev *pctldev,
>  		break;
>  	}
>  	case PIN_CONFIG_IOSTANDARD:
> +		dev_warn(pctldev->dev, "io-standard is deprecated, please use power-source");
> +		fallthrough;
>  	case PIN_CONFIG_POWER_SOURCE:
>  		arg = zynq_pinconf_iostd_get(reg);
>  		break;
> @@ -1079,6 +1081,8 @@ static int zynq_pinconf_cfg_set(struct pinctrl_dev *pctldev,
>  
>  			break;
>  		case PIN_CONFIG_IOSTANDARD:
> +			dev_warn(pctldev->dev, "io-standard is deprecated, please use power-source");
> +			fallthrough;
>  		case PIN_CONFIG_POWER_SOURCE:
>  			if (arg <= zynq_iostd_min || arg >= zynq_iostd_max) {
>  				dev_warn(pctldev->dev,
> 


Acked-by: Michal Simek <michal.simek@xilinx.com>

Linus: would be good to know how long we should keep the support for
this deprecated dt property.

Thanks,
Michal
