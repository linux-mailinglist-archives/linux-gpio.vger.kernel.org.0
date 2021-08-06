Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A283E2303
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 07:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhHFFt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 01:49:26 -0400
Received: from mail-bn8nam08on2054.outbound.protection.outlook.com ([40.107.100.54]:35009
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231405AbhHFFt0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Aug 2021 01:49:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCTwtJpmLD9PmEp7dXYKiupeyNeWrde4mNpiHryw/w7XASHA5Xcs/Md1LaNMYtEWlpPE+rJD0ZU1DOhn1/flJYSvB7z6tDiJk242lSgEPurRWVGnE00uH63mhOdDaaAWJbehBWFKIAsfAWOK8rGuIzcl6oCSrrmXBYLSzE1aYsUNcwJu8XruL8mU0is/A58H2g2YY363DxvYgQ5z1vDTQ3qt25UESF9EEB05MvAR0e+t0qZDnLwfB4oT4LHczN4WjzZ2GgH1vR/ZhSeSY2DDRQ+cQT+VVhMpT2yWxo9veV59xk0pbbQSsj/JW9Wrrv1+BBjErsHUIebJXkXShHINKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPUzcZXglj1d9XICYVRN9OsHXMBHcN86Epy4t7xvEH0=;
 b=FjU41RSLDCD6ktHX4nGCNzyTRfXTbbE5QV7IkSorcsW7qMUMvg3s1pE7fUaGwf6yqtLmgvcr7bX0LyMp8dlxBHgAYPbF6qGGoDyQKVAkQ+xrUDBGfPMWsyV09TyIM7PmG7SdPVetx4CyQOoswmHiT8++6Z7JeqxhhsP+JDxf78J4eLi1RZ8o0dYqBIJlWKW5UzXqlWc7w4CxdXNCi+ZEEtE1UzM25MCF3X0UVT4FeNS8pExmrxajncS3F1Kn9Xxc5VeGWUmjDUB/U8vbRwfUMftiz8wNM2F4nO1Bkyf/AR/PhGCj4XQEmRPROME6cyRJljSrXF8FVfMuPij+nFdv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPUzcZXglj1d9XICYVRN9OsHXMBHcN86Epy4t7xvEH0=;
 b=R23ynEkZ57c0gZy+96vypaQuH0wH8QrihcTL0D/Ry4EaaTOYTmcq79n7NyxlRAZT3eKmBxrZk6At/3bsdIlGJh8dEqkgKTs/iBlxOM3ntOiIEkJhqtZ/1xsT2xrGhokEG5l4RQDQfC40oCm2U/oHiOhEKdmm5FTH79FBYhlOa6c=
Received: from SN4PR0501CA0108.namprd05.prod.outlook.com
 (2603:10b6:803:42::25) by CH2PR02MB6773.namprd02.prod.outlook.com
 (2603:10b6:610:7a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Fri, 6 Aug
 2021 05:49:08 +0000
Received: from SN1NAM02FT0053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::3f) by SN4PR0501CA0108.outlook.office365.com
 (2603:10b6:803:42::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend
 Transport; Fri, 6 Aug 2021 05:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0053.mail.protection.outlook.com (10.97.4.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 05:49:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 22:49:07 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 22:49:07 -0700
Envelope-to: git@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 robh+dt@kernel.org,
 bgolaszewski@baylibre.com,
 iwamatsu@nigauri.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 zou_wei@huawei.com,
 arnd@arndb.de
Received: from [172.30.17.109] (port=46834)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mBsjB-000Duj-Qa; Thu, 05 Aug 2021 22:49:06 -0700
Subject: Re: [PATCH V2 1/3] firmware: zynqmp: Add MMIO read and write support
 for PS_MODE pin
To:     Piyush Mehta <piyush.mehta@xilinx.com>, <arnd@arndb.de>,
        <zou_wei@huawei.com>, <gregkh@linuxfoundation.org>,
        <linus.walleij@linaro.org>, <michal.simek@xilinx.com>,
        <wendy.liang@xilinx.com>, <iwamatsu@nigauri.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <rajan.vaja@xilinx.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <git@xilinx.com>, <sgoud@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com>
 <20210805174219.3000667-2-piyush.mehta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2cef2e97-18f8-9765-2600-27aa219fb2b2@xilinx.com>
Date:   Fri, 6 Aug 2021 07:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805174219.3000667-2-piyush.mehta@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdedfad-8d81-4e8e-8459-08d9589de87a
X-MS-TrafficTypeDiagnostic: CH2PR02MB6773:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6773BC715F8BD9C46BB65C59C6F39@CH2PR02MB6773.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H97kRNU/xEdrsJRuk9PYxxRHcdRn5oM1mMHA2qydFvSTzFCa6uYs8rmAAhORXJgs5VPW7kcH0ems1hzSot9svi0u0P+thFf5Xq9AZwGHgzeyCZ5FpmNMHbLQDzPutMi+Jq/GXiMNm3j+xbOqkRgbeYLphlCoCQX6EemqmycFwYmkCeYegei/tEmIng6nAvOKlPZivU5B+rejVru3ujyxXWrrYEgw4iJglDw8IxYb1AVj6rz0zoMq+Pc2Px+KZ5Ft5YYNn2DoCozzTu+ey11mUBH9epLT/ewur7DWP5FkezO5Phoj4pB7col97fHzvYSfaJqs+WxXuNkgoSGwWfL7SyOfQ6b50mHfLratM4PrxTrSvPtmxSQ7DqEGgn7SIt98F5MJLs5I9TPMUrkSqRUSCy6Dt1AURhh9IrsmS/jNiqM+j6VAgqEd00I5WPFBI7T1/JwdndlotFOVM7OYh0ovNde2iu3Re419AES8gNbb1J1kNp7Qh+TZNxLk1qflO9NK1T/k0BcyORXtj1ZmvcjSkVvpb14kOucMQhplxqirivI6OQQvLsogBI/7wEOdYxWHiHdxTCeKi/feBWDN9V2SJiQ/2Ohxykmf+1t3oCLBkJxGBBvyNgDEqJoL54twjy5REz84TjPuQ42noPRYwprT9Djktye7Coeks1Hlb8lfxqCGgwk4rW+P/KaQwtAl5xLST5kW3cjvdLOcUQSyghg0HEcmX+QC8M93DkyzqUlpFcTDBhc7bhvXr8+/uAhp+ZmwAV3Ah6Kas0GnkIfTNu/S+FLBHBHRgD2maEmZ55rWDHEWT8mAS92jDvvD0h3ckvipfvm3RHylbOVbz1hHwrGPeA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(336012)(82310400003)(8936002)(316002)(9786002)(36906005)(47076005)(31686004)(54906003)(36860700001)(186003)(6636002)(83380400001)(478600001)(8676002)(110136005)(31696002)(82740400003)(7416002)(4326008)(921005)(36756003)(53546011)(356005)(7636003)(2906002)(426003)(26005)(70206006)(44832011)(5660300002)(6666004)(70586007)(2616005)(50156003)(2101003)(83996005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 05:49:08.2199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdedfad-8d81-4e8e-8459-08d9589de87a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6773
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/5/21 7:42 PM, Piyush Mehta wrote:
> Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
> pins value and status. These APIs create an interface path between
> mode pin controller driver and low-level API to access GPIO pins.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> ---
> Changes in v2:
> - Added Xilinx ZynqMP firmware MMIO API support to set and get pin
>   value and status.
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 46 ++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h | 14 +++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 15b13832..0234423 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -28,6 +28,13 @@
>  /* Max HashMap Order for PM API feature check (1<<7 = 128) */
>  #define PM_API_FEATURE_CHECK_MAX_ORDER  7
>  
> +/* CRL registers and bitfields */
> +#define CRL_APB_BASE			0xFF5E0000U
> +/* BOOT_PIN_CTRL- Used to control the mode pins after boot */
> +#define CRL_APB_BOOT_PIN_CTRL		(CRL_APB_BASE + (0x250U))
> +/* BOOT_PIN_CTRL_MASK- out_val[11:8], out_en[3:0] */
> +#define CRL_APB_BOOTPIN_CTRL_MASK	0xF0FU
> +
>  static bool feature_check_enabled;
>  static DEFINE_HASHTABLE(pm_api_features_map, PM_API_FEATURE_CHECK_MAX_ORDER);
>  
> @@ -926,6 +933,45 @@ int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
>  EXPORT_SYMBOL_GPL(zynqmp_pm_pinctrl_set_config);
>  
>  /**
> + * zynqmp_pm_bootmode_read() - PM Config API for read bootpin status
> + * @ps_mode: Returned output value of ps_mode
> + *
> + * This API function is to be used for notify the power management controller
> + * to read bootpin status.
> + *
> + * Return: status, either success or error+reason
> + */
> +unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode)
> +{
> +	unsigned int ret;
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +
> +	ret = zynqmp_pm_invoke_fn(PM_MMIO_READ, CRL_APB_BOOT_PIN_CTRL, 0,
> +				  0, 0, ret_payload);
> +
> +	*ps_mode = ret_payload[1];
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_read);
> +
> +/**
> + * zynqmp_pm_bootmode_write() - PM Config API for Configure bootpin
> + * @ps_mode: Value to be written to the bootpin ctrl register
> + *
> + * This API function is to be used for notify the power management controller
> + * to configure bootpin.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +int zynqmp_pm_bootmode_write(u32 ps_mode)
> +{
> +	return zynqmp_pm_invoke_fn(PM_MMIO_WRITE, CRL_APB_BOOT_PIN_CTRL,
> +				   CRL_APB_BOOTPIN_CTRL_MASK, ps_mode, 0, NULL);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_write);
> +
> +/**
>   * zynqmp_pm_init_finalize() - PM call to inform firmware that the caller
>   *			       master has initialized its own power management
>   *
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 9d1a5c1..dc6f39f 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -68,6 +68,8 @@ enum pm_api_id {
>  	PM_SET_REQUIREMENT = 15,
>  	PM_RESET_ASSERT = 17,
>  	PM_RESET_GET_STATUS = 18,
> +	PM_MMIO_WRITE = 19,
> +	PM_MMIO_READ = 20,
>  	PM_PM_INIT_FINALIZE = 21,
>  	PM_FPGA_LOAD = 22,
>  	PM_FPGA_GET_STATUS = 23,
> @@ -386,6 +388,8 @@ int zynqmp_pm_sd_dll_reset(u32 node_id, u32 type);
>  int zynqmp_pm_reset_assert(const enum zynqmp_pm_reset reset,
>  			   const enum zynqmp_pm_reset_action assert_flag);
>  int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset, u32 *status);
> +unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode);
> +int zynqmp_pm_bootmode_write(u32 ps_mode);
>  int zynqmp_pm_init_finalize(void);
>  int zynqmp_pm_set_suspend_mode(u32 mode);
>  int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
> @@ -515,6 +519,16 @@ static inline int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset,
>  	return -ENODEV;
>  }
>  
> +static inline unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int zynqmp_pm_bootmode_write(u32 ps_mode)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_init_finalize(void)
>  {
>  	return -ENODEV;
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
