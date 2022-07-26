Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28016580AFB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 08:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiGZGMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 02:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiGZGMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 02:12:15 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2058.outbound.protection.outlook.com [40.107.96.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF0A1F601
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 23:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P66+HdryaTL4RlKoV4lHs/TnsBKXbZMgOJorADb1j0tckUyHIZGqK375S7EiGI0B0e5DcEMuEO33MZEETL5h4odnufV7YAUU/7F3mTJEVIGyWAdSDd145L6Lf4/53ZzTdc10pSkhOvlYrtdRgfirUXNDTHWS+wd+aN3W3m4CmsOjJJQl/u35sOPv4l9DeXcaUiYNCOufuJUVP/iww5JCsSK9jz6PpmMxmVP405UWSYMY23c/s6umzRooxlr7HVqFn8/2rrsEzgMzs0KWRB0dUgXbVL3zjuGdryETttz6fY2CwCJVqgTobqcHIDwXjOW6NaArOhzcnq1RtpnfhFim+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyWLdUjsSpjzG2vC6g4RfA5yHAhrjfpSIzkr/26Z+FA=;
 b=Do2tsfHuzVa588kGttkXm7OMjUFOltKPmD4tC1s0EmszkyD3z0AH7LpBFpOSuX1Uk6RQx8FKs8ELBDSJZW+By0Q19+4twhvkNQBVpsD5t4qkEeY+gQSIQSJACUdhDykQ4hw0Ap63EUQ1cDFD4B2P/r0TCzK2UwxYeQD3dJ+mjgYUYm2JoYQqFGbmwbI3+mUqvj3CktzA0uwaPPJo5p9cj198Had6QoIBv9uccgd4gNcUrsbMKPWeTr0aaZYGX7czhbfuWbnpJm11KgnEI7deNUamzAGQmHN3r+IdzSSkArC1asMlkC9MDTcm1hboLJbbjPF1FC/6dLYdFVhEPN5gNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyWLdUjsSpjzG2vC6g4RfA5yHAhrjfpSIzkr/26Z+FA=;
 b=OKSjqESdyWCeszpXLUaZfjZE29cRZDqESgNfDnzI8CGIhr+DMgvWQJCl57TTML347gODk27HUJ6mzpc79kT/P0SHBE3s0RnZ7taQ5mYNkpb0dhO9HzaSbpLgy1+v1GvuF1EQyuM2CuJDj5flHv5tY0J2Abt20VfT+N2Qs+qakM0=
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 06:12:12 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::2e) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21 via Frontend
 Transport; Tue, 26 Jul 2022 06:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 06:12:12 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 26 Jul
 2022 01:12:08 -0500
Message-ID: <65cfe4d3-c342-fcd8-8177-68a930ec38c3@amd.com>
Date:   Tue, 26 Jul 2022 08:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] gpio: xilinx: add missing blank line after
 declarations
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
CC:     <git-dev@xilinx.com>, <shubhrajyoti.datta@amd.com>,
        <michal.simek@xilinx.com>, <linus.walleij@linaro.org>
References: <20220721090021.17005-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220721090021.17005-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b3c9d8a-7b7d-4668-7c03-08da6ecdc7c7
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUVKO9izicXhcqCvc+VZf4Ah/106D4lzg+nSxcFoYGgmW0ENl8yRrCB25WpOoyoc0QjkbZSaml5DgsU+UxwP7s8MhmS+/JY59ZrBCeALnfy29SYmY+8zs28C4YcX74AHqFyG0fNVznwnc15RZJ5KjOjIaqxuXHaAc6+rsmswctgeJqXcVHM+sU14lj7w8bSBTKUlsxh2f+GVtJuVefqPUsl2+gE+NUV2FwK/UlnuG91YUhHeUXND0oz7yjoDXMOhAC7yFhFJ/dwjMOr3TzrqtlX2Jk8OXU1N78hQKtVhgrD3hcLdqZbLe+Ypsmq5ac8UdZcF9kc5w1aj0hEx7KGGed9JEQ7FHXCpoo4+XBUQ7FHcMnKqpH6n90GMnnHiJ3Svc3TcTjghQd/AU2BuFrNSDRMbyz9wMjrrVCRly1WiybEBR2/Iyd3r5pp1KtMAZHh5pngH1mHFacxz1GAs97+NVC1VFxxdZy6ZzOIEjkp6ZcDYPxXQ9RgSJL9kbw8LAmoiyYLOpFIyIWt5n9M1wvy7kli1iSSH/BcckBc3e3Z+2g93DPRn7nx/gohwyg5LrMj5JGzkLx2bapEMO+StME3Glt0zABWkSVnx40TGya54er0iAyzCvSPAXDfiQfdgQQtJJMxBfohRsDZS5FPzAlFi/bK5qwUL9xr+DPIo5zCVwkwgKYVZ9tpKnGej9bom1/C6xJXzA/zw8XV8f+sNZaqXRNSqzyVRwHKh+/jeytQUjT1O6kFDw76nTp6RA1EWqlBDg/u8I3C4jIeKjkajGmU0PmLeoAjNc4YgpKRUhgbcSSbt+sc11B85nTJvqCjdwJwYKLH/nH4TpNdFXsjXn/ZIFBqSV15agNEno+aYLhNfWihlqaLCcuH6oWYPWtNraH8n
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(41300700001)(83380400001)(2906002)(40460700003)(31686004)(47076005)(16526019)(2616005)(86362001)(336012)(426003)(5660300002)(186003)(8936002)(16576012)(40480700001)(44832011)(36756003)(82740400003)(8676002)(110136005)(356005)(81166007)(4326008)(316002)(36860700001)(70586007)(54906003)(70206006)(26005)(31696002)(82310400005)(53546011)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:12:12.4811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3c9d8a-7b7d-4668-7c03-08da6ecdc7c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/21/22 11:00, Shubhrajyoti Datta wrote:
> Add a missing blank line. No functional changes.
> 
> WARNING: Missing a blank line after declarations
> 128: FILE: drivers/gpio/gpio-xilinx.c:120:
> +       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +       xgpio_set_value32(a, bit, xgpio_readreg(addr));
> 
> WARNING: Missing a blank line after declarations
> 136: FILE: drivers/gpio/gpio-xilinx.c:126:
> +       void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +       xgpio_writereg(addr, xgpio_get_value32(a, bit));
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2: Update commit message
> v3: No change
> 
>   drivers/gpio/gpio-xilinx.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index b6d3a57e27ed..7f129e7eae78 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -117,12 +117,14 @@ static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
>   static void xgpio_read_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
>   {
>   	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +
>   	xgpio_set_value32(a, bit, xgpio_readreg(addr));
>   }
>   
>   static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
>   {
>   	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
> +
>   	xgpio_writereg(addr, xgpio_get_value32(a, bit));
>   }
>   

Reviewed-by: Michal Simek <michal.simek@amd.com>

M
