Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5846C443C66
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 06:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhKCFGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 01:06:55 -0400
Received: from mail-dm6nam12on2045.outbound.protection.outlook.com ([40.107.243.45]:11811
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229650AbhKCFGy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Nov 2021 01:06:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp01phGxlnHkDrjW0tTDCXrr+iz7elUGDN9/YXJbzChlm65F5czdAie6mWgDxv5GoDjJNnqBpQw0COChopcPU14YcrrO7CBHK7ld+k3UbGllagEITvfCq/qx/7nTfHwBRN0+ka1IUyB268qwZTPOjgdGNAWTvPyIUAnsC0iS3ily1mKWy0qb+NcRTIzKMgWMyz05ZUZjgFvzMiXobRQl8dllVTiSNXVSobUoMQ0bvJhuvkncJ5uOHstQsdzQ+S1gOYCY7Wubw2MFelr5xJf/NH5QoEVLzSl+YeTnIt3cKxpP3sG4OlY5Ael20EVyIZeEpAd+n+YgRXwHn6YobG2vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7pkbVCzF1v3bx4VkUgnjoV53CKklNq5GhpmDnjGFe0=;
 b=DmVOYp8o9AOrMTNon4Tm0pEipk2mEKn0JTXwRllKhcYCCQtPkSu8cDuypb7+hB0ZAvL24CTbgn2iRMpfRqVx0XFm8vCsHYRL2ykV3qgjqd+wc1vJ9qYUpD2JDLIud4uTqolzGK7INTIwicaWqe8xNX/AlK0NnbP/0lE7z5qNA/OTKycUQ1Jfzw2oN9Kf8q0JRq79CetuBYMsB5wc7JjHmqNtPR0HQFq66c3Q9V5ibVuCetyY+vzDrKuBW7xZR4PzMS+6u4aaIjAt/EnVrvWkEj3I17MPzaKKXLAfamxawvsrJJqf6xfHbtauX4mKhg9yyHCcV2gIHj8Z5wndWC2pLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7pkbVCzF1v3bx4VkUgnjoV53CKklNq5GhpmDnjGFe0=;
 b=baihfyzcDT5QwXLbDSjZh2MFGNidJGR0arfjTcV18C2zrwimJRHeUPOVT8VtKrC6InyY2R1tCrObK8zomlBaq7aAkG6y4GRTorzdxE76o29ZImh/pzyBgmUxVuKEDVBhi7ESx2I8FKnwOHZ2CthLHfWZwSRc+CaRgaJPe4Bw3CZCQElj8rp8engqKkdVGZKarNISTIZ9LJAVQ8CDHAq7/H13QIAQzHxcP7s0EurK2VI3v/BKQrRwOzWL7EjRjnUtMwV3hWIFWqNrUPbeh8j+dal7tCnRVXU44biAQ5p7e1H+HR69OD6vekn7/HVQwwu37JKcX4DOR0uLI9jOwDMpxQ==
Received: from BN9PR03CA0149.namprd03.prod.outlook.com (2603:10b6:408:fe::34)
 by CY4PR1201MB0136.namprd12.prod.outlook.com (2603:10b6:910:1a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 05:04:15 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::94) by BN9PR03CA0149.outlook.office365.com
 (2603:10b6:408:fe::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 05:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:04:15 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:04:03 +0000
Subject: Re: [RFC v2 07/11] gpio: tegra186: Add HTE in gpio-tegra186 driver
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-8-dipenp@nvidia.com>
 <YWDDJbnbTea397I8@robh.at.kernel.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <846211f9-0f46-7b47-befa-b3be88e81fc0@nvidia.com>
Date:   Tue, 2 Nov 2021 22:05:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDDJbnbTea397I8@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a340f71-26a8-4b17-10f8-08d99e876262
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0136:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01366B0E22F6DB47B5A08F9BAE8C9@CY4PR1201MB0136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWQDNBLB/MxqNt3b7JpJnIPqSc2ls/E22o6q+JmShBu7OufUxwJydnDwYkBKyPkg5IIOFh59tfmtNAwN0hR1ShFkU2q0f+FX/DXZ4ytN0LEhvgqEt2w0HT1zD/6CUL7G90nVnbIzw0ADOpOP2uTLna2/bnk0ekrAvOJvPZGikd1L0U+hfFwJtxUFGQny2jyDGPziWNjDTR2NACl1B/aBjJCW6ti1ytTYEkXWPnAdE/8XLisO69gCrOLeOXuVOZOvS/5rnwnMtk/VVfMvhAoUu+l5rcLv//t3XKJGqMBD+P97B82rfee9+dF7CAabEiH5BdsQvEJauv6Mijxg1HIOCa6nu5/mcbmZhXlPyTbWaQsHLsi8GJH2bFLlKptyr0CZO1H15FLfmifk14h6hlAJYD6zYbN4IytejmNWtt7luH7kgfheIaHqcE0xPtNvkwVGIzVqZ59HiE2HvJxrUE2BpcvJZ0YHhB9PMPVBV4IAJ1Q0kTT/VnWysxoqGHryJGZdhWcoRoboZ5KjWrmh844Hf7OKcJ6g34tZV5aJ4fAl+lO4fAUfF0jwkmUWWsO7C74MWHIvzQd4RBRrHaeG4/xIpUFz7BhPW8NiRXydwkKBLZxeqERtZHSGZkjc3szcTz0r3vTU6+6EPZtXf0bDNZOQthFuzP9tU11w8IhqiG2sDUQLSRwZZWbSliR/utGWCca4b2/lYcjIlfar97cFQ0Bl4JGTCv9ATn3XBUJJ6/2xshc=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(36906005)(8676002)(47076005)(16576012)(31696002)(6916009)(31686004)(356005)(316002)(4326008)(2616005)(7636003)(2906002)(426003)(186003)(70586007)(70206006)(26005)(8936002)(86362001)(36860700001)(16526019)(336012)(54906003)(82310400003)(36756003)(508600001)(7416002)(83380400001)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:04:15.6244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a340f71-26a8-4b17-10f8-08d99e876262
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0136
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


On 10/8/21 3:16 PM, Rob Herring wrote:
> On Thu, Sep 30, 2021 at 04:26:13PM -0700, Dipen Patel wrote:
>> Tegra194 AON GPIO controller with the use of its internal hardware
>> timestamping engine (HTE) also known as GTE can timestamp GPIO
>> lines through system counter. This patch implements two callbacks
>> which are essential for the gpio consumers that want such HTE
>> functionality. The callbacks details can be found at
>> include/gpio/driver.h.
>>
>> Since AON GPIO controller depends on HTE engine, it creates hardware
>> dependency between controller and AON HTE provider. To express that,
>> the optional devicetree property is introduced for AON GPIO controller.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  .../bindings/gpio/nvidia,tegra186-gpio.txt    |  7 ++
> Bindings should be a separate patch. Consider converting this to schema 
> first too.

I will create separate patch. For the schema, I guess converting is out of the

scope in this patch series. I believe its better to create separate patch for that

task.

>>  drivers/gpio/gpio-tegra186.c                  | 89 +++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
>> index adff16c71d21..00a3e47ab560 100644
>> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
>> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
>> @@ -127,6 +127,12 @@ Required properties:
>>              - 8: Active low level-sensitive.
>>              Valid combinations are 1, 2, 3, 4, 8.
>>  
>> +Optional properties:
>> +- timestamp-engine
> Should be in the common binding.
>
> But then when do you use hardware-timestamps? This property seems to 
> assume GPIO hand the timestamp engine have the same numbering of 
> signals. I think you need to be able to map GPIOx to timestamp y. If you 
> want a short cut for a 1-1 case, then that's another discussion.

The mapping is done in the GPIO HTE provider if its not one-to-one. An example is

hte-tegra194.c (tegra194_aon_gpio_map) in this patch series.

>> +    AON GPIO controller has timestamp engine which can hardware timestamp
>> +    GPIO configured as input and IRQ. This property specifies hardware
>> +    timestamp engine (HTE) device-tree node.
>> +
>>  Example:
>>  
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> @@ -162,4 +168,5 @@ gpio@c2f0000 {
>>  	#gpio-cells = <2>;
>>  	interrupt-controller;
>>  	#interrupt-cells = <2>;
>> +	timestamp-engine = <&tegra_hte_aon>;
>>  };
>> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
>> index c026e7141e4e..6d1f15167529 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/hte.h>
>>  
>>  #include <dt-bindings/gpio/tegra186-gpio.h>
>>  #include <dt-bindings/gpio/tegra194-gpio.h>
>> @@ -34,6 +35,7 @@
>>  #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL BIT(4)
>>  #define  TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE BIT(5)
>>  #define  TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT BIT(6)
>> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC BIT(7)
>>  
>>  #define TEGRA186_GPIO_DEBOUNCE_CONTROL 0x04
>>  #define  TEGRA186_GPIO_DEBOUNCE_CONTROL_THRESHOLD(x) ((x) & 0xff)
>> @@ -81,6 +83,7 @@ struct tegra_gpio {
>>  	struct irq_chip intc;
>>  	unsigned int num_irq;
>>  	unsigned int *irq;
>> +	struct device *dev;
>>  
>>  	const struct tegra_gpio_soc *soc;
>>  	unsigned int num_irqs_per_bank;
>> @@ -192,6 +195,86 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
>>  	return 0;
>>  }
>>  
>> +static int tegra186_gpio_req_hw_ts(struct gpio_chip *chip, unsigned int offset,
>> +				   hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
>> +				   struct hte_ts_desc *hdesc, void *data)
>> +{
>> +	struct tegra_gpio *gpio;
>> +	void __iomem *base;
>> +	int value, ret;
>> +
>> +	if (!chip || !hdesc)
>> +		return -EINVAL;
>> +
>> +	gpio = gpiochip_get_data(chip);
>> +	if (!gpio)
>> +		return -ENODEV;
>> +
>> +	base = tegra186_gpio_get_base(gpio, offset);
>> +	if (WARN_ON(base == NULL))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * HTE provider of this gpio controller does not support below gpio
>> +	 * configs:
>> +	 * 1. gpio as output
>> +	 * 2. gpio as input
>> +	 *
>> +	 * HTE provider supports below gpio config:
>> +	 * a. gpio as input with irq enabled
>> +	 */
>> +
>> +	if (tegra186_gpio_get_direction(chip, offset) ==
>> +	    GPIO_LINE_DIRECTION_OUT)
>> +		return -ENOTSUPP;
>> +
>> +	if (!gpiochip_line_is_irq(chip, offset))
>> +		return -ENOTSUPP;
>> +
>> +	hdesc->con_id = offset;
>> +
>> +	ret = hte_req_ts_by_hte_name(gpio->dev, "timestamp-engine", hdesc, cb,
>> +				     tcb, data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
>> +	value |= TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
>> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra186_gpio_rel_hw_ts(struct gpio_chip *chip,
>> +				   unsigned int offset,
>> +				   struct hte_ts_desc *hdesc)
>> +{
>> +	struct tegra_gpio *gpio;
>> +	void __iomem *base;
>> +	int value, ret;
>> +
>> +	if (!hdesc || !chip)
>> +		return -EINVAL;
>> +
>> +	gpio = gpiochip_get_data(chip);
>> +	if (!gpio)
>> +		return -ENODEV;
>> +
>> +	base = tegra186_gpio_get_base(gpio, offset);
>> +	if (WARN_ON(base == NULL))
>> +		return -EINVAL;
>> +
>> +	ret = hte_release_ts(hdesc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
>> +	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
>> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
>> +
>> +	return 0;
>> +}
>> +
>>  static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
>>  {
>>  	struct tegra_gpio *gpio = gpiochip_get_data(chip);
>> @@ -821,6 +904,12 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>  		offset += port->pins;
>>  	}
>>  
>> +	gpio->dev = &pdev->dev;
>> +	if (device_property_present(gpio->dev, "timestamp-engine")) {
>> +		gpio->gpio.req_hw_timestamp = tegra186_gpio_req_hw_ts;
>> +		gpio->gpio.rel_hw_timestamp = tegra186_gpio_rel_hw_ts;
>> +	}
>> +
>>  	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
>>  }
>>  
>> -- 
>> 2.17.1
>>
>>
