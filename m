Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5343DB110
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 04:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhG3CQn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 22:16:43 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:50945
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230133AbhG3CQn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 22:16:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPEMGxAjLeHP9OzQoZI3mN0CHRrj7O9umlfZwhn2G26EeAolem7RcD+g51cl/IVU3dOdOimvviNUoHsZx+w2sD5DQc/TvuAEy+ExLd8bFUv3LlwsMsqvGf+ZTbKYWdl0H5U05pwS/XRQkMsTY/jHMXJVsGTfyqSDk4+itnTKvb6sgMNvy2NZPxEYqZBWuLSMOEkhSfe/NoHJh5vueZWaVZJqlCUG3ZoPL9XTo3Yov6Z4irxjYQ8k5pGqr0mTKI5aoHz78JSpiBBeSAeYohnW4S5zBdpmnhUHa4EOM47VqQ5/jsfCziPJuqM1cjfH6BvWwQ/Fo2s32/uI1w40Nl8ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtWTzmUOODt6rjbcwJBSGpZKbeKtNIUNOXaYJyLYiDw=;
 b=XcIvO/rGNDc0+EcQZ8N/EE6ftkjfqsnB1Qe/MAl5v2xZk9NWnFZPuGtdcIhFx9U51uRGfIKzgfTLXvSBl5gABgSaVOKs7PlEnF+oj7iTfKx6yQPSn55sqWXpoHLucbXjvVujJgoeU7tfuS/sbhwnpDb1NY8fchPtRmczmQSO0nfFt9zvcqlmnYzGzk+kq13mA5W4lyx3r2xYt7vJySQOyvmYW5Z+22jYe+ZaI2kWWH238dqZIyyJB0TAG8uaBtOlC1MbIkifSN/34LBT2IYwFQ58xGmaTczAVpzwhPRoPEBOKpPuu28KU9ztB51BQM4NUhgjbej/CW4h3vwsMTZKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtWTzmUOODt6rjbcwJBSGpZKbeKtNIUNOXaYJyLYiDw=;
 b=X6Ql8fNtVVi7e879lxUk93pLhFh8ptzTZ4FdsYGe5TqqQfZwuCXgRzZXTyCxCf86LcklbLpuO3k9d8aOxoKbMKEN7KOLdByMqixcfamT87jMUlFZW8E4jXbilk8oVoySmwd43d/XZmwAXCwOXcxzkPk/O4NPTjz4y6ePfinJnR56MrWv2ofCxpiIMajpQ2Y3zlQG9bG2ZRx/9RU2NUIEgZPcEuwTtzkU/O3kS+S7BfuDTH+vB3CgVwg/hlO7G1yeUTGkPQX+WFYfDEmpnslC6OUOKXjn9KuEB+FDpbgefqNpsy0Q9pFIOxAaEjFiyncciW1LzfCJrXe3SLqPSJuEKA==
Received: from MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::31)
 by BN8PR12MB3220.namprd12.prod.outlook.com (2603:10b6:408:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 30 Jul
 2021 02:16:37 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::22) by MW4P221CA0026.outlook.office365.com
 (2603:10b6:303:8b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 02:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 02:16:36 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 02:16:35 +0000
Subject: Re: [RFC 06/11] gpiolib: Add HTE support
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-7-dipenp@nvidia.com> <20210701142414.GB34285@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <5ed6ca9e-ee1e-23dd-5f2c-d674c74b3ea3@nvidia.com>
Date:   Thu, 29 Jul 2021 19:25:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701142414.GB34285@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7b0230-69da-4b1d-42ef-08d953000f42
X-MS-TrafficTypeDiagnostic: BN8PR12MB3220:
X-Microsoft-Antispam-PRVS: <BN8PR12MB32208F266571B53BE8498677AEEC9@BN8PR12MB3220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E9q+fpTN66bYRX/1gpB1mgGkuyJ5EJkmw52bBQZe449Wrwsaf75MDPcQGU+ngcUjdrvcjEuztys2Hm9TTzOSbSwlj7CJUdwoZFV49fSkDMbJde5GLx0a+fLqVeNmBlLiJrIingxaHY/koK+kb3ExAlERMQ7nzQ3Y7JRNfteALEDY+HDcaHbjlgwWP8MkkYtmneVm78Fqw2v1VDpUID8mmxQ5QOkRImU82O4L4gQMNai6Yn+OREzFF2h5zWjQjFpkrgmOISY7pz8xMSMbBqQJxwZui/R2VKv3eha8s9NCCUNUxBXSq5onYNDUIKA0FyO4eyjzfy8IS+v6HFjBW/zN42pFnH+s+sthDlH/i2X9ySbS5VH8enQlMT5iKMKAEzYRKArOTUlNdrY6/zncfJCjrQzPo8PTAAvW6fTa0RNgAo/SagQ31heRgFANb8YybvwpqUw2hV+1i5kAJlXdclI3/it92Bws7zvY9aK1U119m0m3Uz4nLUOo3ybYNCFiIhLdSqjGVvQIdI5DPAnFVJRGt07Q4HPwxcl9lpSiHG2X0Lqq0AWT8YjdGe1clIChjyfmAyuatp7zzVKm5WSV6P2zv2cWm7f/dzUQn5K6/zxzonUIzq+5qZvRtE89beiaft4zNMjRByFjkEVQiH5bLje8fpixNmqcyEe/IEeWg6q4MLN6FWoLD6vv66h9akrmTTkcFn2+PeI+vXNM8RFpBxOiaOE4D8DW4c1mfmEXHzOBkV8=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(70206006)(5660300002)(336012)(36906005)(4326008)(8676002)(2906002)(356005)(53546011)(7416002)(47076005)(36860700001)(16526019)(478600001)(82310400003)(16576012)(26005)(2616005)(7636003)(82740400003)(70586007)(8936002)(54906003)(186003)(316002)(31686004)(83380400001)(36756003)(86362001)(31696002)(6916009)(426003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 02:16:36.9762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7b0230-69da-4b1d-42ef-08d953000f42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3220
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/1/21 7:24 AM, Kent Gibson wrote:
> On Fri, Jun 25, 2021 at 04:55:27PM -0700, Dipen Patel wrote:
>> Some GPIO chip can provide hardware timestamp support on its GPIO lines
>> , in order to support that additional functions needs to be added which
>> can talk to both GPIO chip and HTE (hardware timestamping engine)
>> subsystem. This patch introduces functions which gpio consumer can use
>> to request hardware assisted timestamping. Below is the list of the APIs
>> that are added in gpiolib subsystem.
>>
>> - gpiod_hw_timestamp_control - to enable/disable HTE on specified GPIO
>> line. This API will return HTE specific descriptor for the specified
>> GPIO line during the enable call, it will be stored as pointer in the
>> gpio_desc structure as hw_ts_data.
>> - gpiod_is_hw_timestamp_enabled - to query if HTE is enabled on
>> specified GPIO line.
>> - gpiod_get_hw_timestamp - to retrieve hardware timestamps.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  drivers/gpio/gpiolib.c        | 92 +++++++++++++++++++++++++++++++++++
>>  drivers/gpio/gpiolib.h        | 11 +++++
>>  include/linux/gpio/consumer.h | 21 +++++++-
>>  include/linux/gpio/driver.h   | 13 +++++
>>  4 files changed, 135 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 220a9d8dd4e3..335eaddfde98 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2361,6 +2361,98 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>>  }
>>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
>>  
>> +/**
>> + * gpiod_hw_timestamp_control - set the hardware assisted timestamp control.
>> + * @desc:	GPIO to set
>> + * @enable:	Set true to enable the hardware timestamp, false otherwise.
>> + *
>> + * Certain GPIO chip can rely on hardware assisted timestamp engines which can
>> + * record timestamp at the occurance of the configured events on selected GPIO
>> + * lines. This is helper API to control such engine.
>> + *
>> + * Return 0 in case of success, else an error code.
>> + */
>> +int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable)
>> +{
>> +	struct gpio_chip	*gc;
>> +	int			ret = 0;
>> +
>> +	VALIDATE_DESC(desc);
>> +	gc = desc->gdev->chip;
>> +
>> +	if (!gc->timestamp_control) {
>> +		gpiod_warn(desc,
>> +			   "%s: Hardware assisted ts not supported\n",
>> +			   __func__);
>> +		return -ENOTSUPP;
>> +	}
>> +
>> +	ret = gc->timestamp_control(gc, gpio_chip_hwgpio(desc),
>> +				    &desc->hdesc, enable);
>> +
>> +	if (ret) {
>> +		gpiod_warn(desc,
>> +			   "%s: ts control operation failed\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	if (!enable)
>> +		desc->hdesc = NULL;
>> +
>> +	return ret;
>> +}
> Last I checked, pointer accesses are not guaranteed atomic, so how is
> hdesc protected from concurrent access?
> Here is it modified unprotected.
> Below it is read unprotected.

The assumption I made here was, gpiod_hw_timestamp_control will be

called after client has made at least gpdio_request call. With that assumption,

how two or more client/consumers call gpiod_hw_timestamp_control API

with the same gpio_desc? I believe its not allowed as gpiod_request call will

fail for the looser if there is a race and hence there will not be any race here

in this API. Let me know your thoughts.

>
>> +EXPORT_SYMBOL_GPL(gpiod_hw_timestamp_control);
>> +
>> +/**
>> + * gpiod_is_hw_timestamp_enabled - check if hardware assisted timestamp is
>> + * enabled.
>> + * @desc:	GPIO to check
>> + *
>> + * Return true in case of success, false otherwise.
>> + */
>> +bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
>> +{
>> +	if (!desc)
>> +		return false;
>> +
>> +	return (desc->hdesc) ? true : false;
>> +}
>> +EXPORT_SYMBOL_GPL(gpiod_is_hw_timestamp_enabled);
>> +
>> +/**
>> + * gpiod_get_hw_timestamp - Get hardware timestamp in nano seconds.
>> + * @desc:	GPIO to get the timestamp.
>> + * @block:	Set true to block until data is available.
>> + *
>> + * Return non-zero on success, else 0.
>> + */
>> +u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
>> +{
>> +	struct gpio_chip	*gc;
>> +	int			ret = 0;
>> +	u64 ts;
>> +
>> +	VALIDATE_DESC(desc);
>> +	gc = desc->gdev->chip;
>> +
>> +	if (!gc->get_hw_timestamp) {
>> +		gpiod_warn(desc,
>> +			   "%s: Hardware assisted ts not supported\n",
>> +			   __func__);
>> +		return -ENOTSUPP;
>> +	}
>> +
> Can't return an error code here.  Return value is u64, so this will look
> like a valid ts.
>
> Just return 0 on error, as you do immediately below...
yes, good catch. I forgot to clean that up.
>
>> +	ret = gc->get_hw_timestamp(gc, block, desc->hdesc, &ts);
>> +	if (ret) {
>> +		gpiod_warn(desc,
>> +			   "%s: get timestamp operation failed\n", __func__);
>> +		return 0;
>> +	}
>> +
>> +	return ts;
>> +}
>> +EXPORT_SYMBOL_GPL(gpiod_get_hw_timestamp);
>> +
>>  /**
>>   * gpiod_set_config - sets @config for a GPIO
>>   * @desc: descriptor of the GPIO for which to set the configuration
>> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
>> index 30bc3f80f83e..5393e1d90f61 100644
>> --- a/drivers/gpio/gpiolib.h
>> +++ b/drivers/gpio/gpiolib.h
>> @@ -15,6 +15,7 @@
>>  #include <linux/device.h>
>>  #include <linux/module.h>
>>  #include <linux/cdev.h>
>> +#include <linux/hte.h>
>>  
>>  #define GPIOCHIP_NAME	"gpiochip"
>>  
>> @@ -117,6 +118,7 @@ struct gpio_desc {
>>  #define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
>>  #define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
>>  #define FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
>> +#define FLAG_EVENT_CLOCK_HARDWARE	19 /* GPIO CDEV reports hardware timestamps in events */
>>  
>>  	/* Connection label */
>>  	const char		*label;
>> @@ -129,6 +131,15 @@ struct gpio_desc {
>>  	/* debounce period in microseconds */
>>  	unsigned int		debounce_period_us;
>>  #endif
>> +	/*
>> +	 * Hardware timestamp engine related internal data structure.
>> +	 * This gets set when the consumer calls gpiod_hw_timestamp_control to enable
>> +	 * hardware timestamping on the specified GPIO line. The API calls into HTE
>> +	 * subsystem, in turns HTE subsystem return the HTE descriptor for the GPIO
>> +	 * line. The hdesc will be later used with gpiod_is_hw_timestamp_enabled
>> +	 * and gpiod_get_hw_timestamp API calls.
>> +	 */
>> +	struct hte_ts_desc *hdesc;
>>  };
>>  
>>  #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
>> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
>> index c73b25bc9213..476ee04de7d0 100644
>> --- a/include/linux/gpio/consumer.h
>> +++ b/include/linux/gpio/consumer.h
>> @@ -112,6 +112,9 @@ int gpiod_get_direction(struct gpio_desc *desc);
>>  int gpiod_direction_input(struct gpio_desc *desc);
>>  int gpiod_direction_output(struct gpio_desc *desc, int value);
>>  int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
>> +int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable);
>> +bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc);
>> +u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block);
>>  
>>  /* Value get/set from non-sleeping context */
>>  int gpiod_get_value(const struct gpio_desc *desc);
>> @@ -353,8 +356,22 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>>  	WARN_ON(desc);
>>  	return -ENOSYS;
>>  }
>> -
>> -
>> +static inline int gpiod_hw_timestamp_control(struct gpio_desc *desc,
>> +					     bool enable)
>> +{
>> +	WARN_ON(desc);
>> +	return -ENOSYS;
>> +}
>> +static inline bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
>> +{
>> +	WARN_ON(desc);
>> +	return false;
>> +}
>> +static inline u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
>> +{
>> +	WARN_ON(desc);
>> +	return 0;
>> +}
>>  static inline int gpiod_get_value(const struct gpio_desc *desc)
>>  {
>>  	/* GPIO can never have been requested */
>> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
>> index 3a268781fcec..f343e8f54b08 100644
>> --- a/include/linux/gpio/driver.h
>> +++ b/include/linux/gpio/driver.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/lockdep.h>
>>  #include <linux/pinctrl/pinctrl.h>
>>  #include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/hte.h> /* For hardware timestamping */
>>  
>>  struct gpio_desc;
>>  struct of_phandle_args;
>> @@ -304,6 +305,10 @@ struct gpio_irq_chip {
>>   * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
>>   *	requires special mapping of the pins that provides GPIO functionality.
>>   *	It is called after adding GPIO chip and before adding IRQ chip.
>> + * @timestamp_control: Dependent on GPIO chip, an optional routine to
>> + * 	enable/disable hardware assisted timestamp.
>> + * @get_hw_timestamp: Retrieves hardware timestamp. The consumer can specify
>> + * 	block parameter if it wishes to block till timestamp is available. 
>>   * @base: identifies the first GPIO number handled by this chip;
>>   *	or, if negative during registration, requests dynamic ID allocation.
>>   *	DEPRECATION: providing anything non-negative and nailing the base
>> @@ -396,6 +401,14 @@ struct gpio_chip {
>>  
>>  	int			(*add_pin_ranges)(struct gpio_chip *gc);
>>  
>> +	int			(*timestamp_control)(struct gpio_chip *gc,
>> +						     unsigned int offset,
>> +						     struct hte_ts_desc **hdesc,
>> +						     bool enable);
>> +	int			(*get_hw_timestamp)(struct gpio_chip *gc,
>> +						    bool block,
>> +						    struct hte_ts_desc *hdesc,
>> +						    u64 *ts);
>>  	int			base;
>>  	u16			ngpio;
>>  	const char		*const *names;
>> -- 
>> 2.17.1
>>
> Cheers,
> Kent.
