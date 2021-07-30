Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5E43DB19E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 04:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhG3C6W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 22:58:22 -0400
Received: from mail-mw2nam08on2088.outbound.protection.outlook.com ([40.107.101.88]:36535
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234733AbhG3C6V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 22:58:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXsfk5DVImNOEjwtAl2dNiVIUyzZQ5qt6s/FvD22tyzDwok95ySnh3oSe8XasWPUrYuJ5hXiIRkknWqOZfVgXsuChtiTggYRQnKapOPC3a5lKT+ewnLDpJZyNg34YLE2kke2RQtprONLPKnbabqAcZY0X7rbY3I6bgs3ckFRf9LzSbylt3M75kq8+VZoQqbGG7ex09Gj5Sus1DlHZuh1f4RJT5J/G0UOsEkvZ4kWz2nunytX92ZBdDLg3FjTpc7T/9IZKzs5wVcqpYbR7xqT+ZZRLZFkS3IoZbm6IkAlACRyTM+CKtzhwNSb0ItvBbpEzbkb/uauAvf6grC5nta7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmRxosr4SoBumIyrrwHmUqpCLpIgk1kdnbCONsUc9H4=;
 b=ierC5rtCV8+I4x68pn755ddaiigB5E7NzXXsvM0j8B2PqA9bR71lE1g4ARQdyXw/ooS8/pxpegL8QI6MHvxhACHF4o+2UtNKr+STPuUFHVo/lzT0BMIDy6OoOZ2k+K1Yjg48auUUr+uNSfUKXOCibEC4oQqrTeW4bvB/Gyu/0L3QN649p9NoblEo6Snx+89oXhISn7+uV1OiRppBEtxrnHyiaEQTGg4LSrgJnT2jccOTIiCLiibOklvaGk3c6Jidek6OD7hHFoQnrBSoeBwwfA5Jjgnbe9KvCeCkKqWRfdtaF5q1lrDcVdyLdSv4nigw6r4Iy+gYCaQAVO/49bV1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmRxosr4SoBumIyrrwHmUqpCLpIgk1kdnbCONsUc9H4=;
 b=rUorNhMhfeX54wGQW3CA6rD53yRkX59ZNhWsD2ilLkd8CID+NJW0QJD2Af2Wt9+VO8IyeknBCSN88yLqW7QpS/i9YuH5JKILRMNI7M0ORJGCMwuiFp2VWqnCqb7kdS4tjEsldY0rVexpRZB/1+6wf0z4GGOwdMocczYQANqW2SgELqd/OYzXa+b2H7QT0SqUVM/l04kUIScDYbyLXDZbF862hcEGmsdSj1KMOCrH5Ms4HvLMCqLXrt0ke+WzEd+740vuUC9hBj0Ie9yFl4JP/ZZvRBRb26+UAFxZ5Num11mCxy+FCYoKOnEUERAA8DeYkWUgwosw1YMkXjOs2uBL+g==
Received: from MWHPR18CA0039.namprd18.prod.outlook.com (2603:10b6:320:31::25)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 30 Jul
 2021 02:58:15 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::32) by MWHPR18CA0039.outlook.office365.com
 (2603:10b6:320:31::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 02:58:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 02:58:15 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 02:58:14 +0000
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com> <20210701142433.GC34285@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <ba32de51-0639-36e2-3575-1f7915542a19@nvidia.com>
Date:   Thu, 29 Jul 2021 20:07:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701142433.GC34285@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1751b33-6881-455f-b156-08d95305e058
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4947CBA806E0C5377BF8CE3FAEEC9@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3DjyXnaLkqZr9xdgD4uOiiwadtJAIRJHdFxP3A2IUTFJA9YI0Io8k6P7e2bEMSN435MuJaefvMsGj4CClmgK8FKSzwRyu2uUfMu2jC3Cr76nFuEHgsMQqxlLqLyzi+d4muk5h2nXXuGAQZNW4AHZ5s+PcYyuZiTwPbw8nsz33ZKPSEDd+MyJnnz6p5OTeEyX5jlfc48a8KeZQ/OK6pHsRqQP9MTCHqu+ZpgdmQMkimXpoHu6WoAeCZU6xs6JGumLPMxrnbIdGtpnL+jhXq9JWrgsZvj/WLtEaU0W6xQ6elkh2y7FXwdY6AArmGPWOTbAtP4xwM8/qpJ0ISM0YiQeB845cPCmuwG1pde1oIJHOFPSi/KPcshsbKQp+6VDoRT16s6XkcN0tV4uNs1RPjF6BtkK1vBFS57gc/XMA53b69YUw/8Txx44BVuNq8QybyZNdGZqSwxRKUdzj7MrPE58t6op1cjHFM4o0AHuOSwJoOPcl7fYq3IF83cdiXicwHCgyR3fIWPUPlCf94w+4NxQOWuGKmc/PxjwbA1JMUd9uHLU+cVhFQYYsS0ZVDSQaSI/NRudkHwG1VVYpBcPakOq+BFGlA4RLiGL4bnQ2yxdHA4RcL9ICe13uSeVxgZWHS1hiW7ckg4QHoZezKWcGAqaQJ0ZSleop5Ew50aaN4Pr0XZip5m9kC5eAJhGmxei7JdctOAnapTB4IU2W7Ioq8XIUWpYdtAXdampepnNxK5NIg=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(54906003)(8676002)(5660300002)(53546011)(16576012)(4326008)(70206006)(36756003)(316002)(70586007)(7636003)(36906005)(83380400001)(356005)(26005)(31696002)(426003)(2906002)(6916009)(478600001)(31686004)(86362001)(8936002)(82740400003)(82310400003)(2616005)(336012)(47076005)(186003)(16526019)(36860700001)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 02:58:15.2127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1751b33-6881-455f-b156-08d95305e058
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/1/21 7:24 AM, Kent Gibson wrote:
> On Fri, Jun 25, 2021 at 04:55:29PM -0700, Dipen Patel wrote:
>> This patch adds new clock type for the GPIO controller which can
>> timestamp gpio lines using hardware means. To expose such
>> functionalities to the userspace, code has been added in this patch
>> where during line create call, it checks for new clock type and if
>> requested, calls hardware timestamp related API from gpiolib.c.
>> During line change event, it retrieves timestamp in nano seconds by
>> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
>> it disables this functionality by calling gpiod_hw_timestamp_control.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>>  include/uapi/linux/gpio.h   |  1 +
>>  2 files changed, 64 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>> index 1631727bf0da..9f98c727e937 100644
>> --- a/drivers/gpio/gpiolib-cdev.c
>> +++ b/drivers/gpio/gpiolib-cdev.c
>> @@ -518,6 +518,7 @@ struct linereq {
>>  	 GPIO_V2_LINE_DRIVE_FLAGS | \
>>  	 GPIO_V2_LINE_EDGE_FLAGS | \
>>  	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
>> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>>  	 GPIO_V2_LINE_BIAS_FLAGS)
>>  
>>  static void linereq_put_event(struct linereq *lr,
>> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>>  
>>  static u64 line_event_timestamp(struct line *line)
>>  {
>> +	bool block;
>> +
>>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>  		return ktime_get_real_ns();
>>  
>> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
>> +		if (irq_count())
>> +			block = false;
>> +		else
>> +			block = true;
>> +
>> +		return gpiod_get_hw_timestamp(line->desc, block);
>> +	}
>> +
> Use in_task() instead of block?
yes, will change to in_task.
>
>>  	return ktime_get_ns();
>>  }
>>  
>> @@ -828,6 +840,7 @@ static int edge_detector_setup(struct line *line,
>>  		return ret;
>>  
>>  	line->irq = irq;
>> +
>>  	return 0;
>>  }
>>  
> Remove gratuitous whitespace changes.
> If you dislike the formatting then suggest it in a separate patch.
I will remove this space.
>
>> @@ -891,7 +904,6 @@ static int gpio_v2_line_flags_validate(u64 flags)
>>  	/* Return an error if an unknown flag is set */
>>  	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
>>  		return -EINVAL;
>> -
>>  	/*
>>  	 * Do not allow both INPUT and OUTPUT flags to be set as they are
>>  	 * contradictory.
>> @@ -900,6 +912,14 @@ static int gpio_v2_line_flags_validate(u64 flags)
>>  	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
>>  		return -EINVAL;
>>  
> Same here.
>
>> +	/*
>> +	 * Do not mix with any other clocks if hardware assisted timestamp is
>> +	 * asked.
>> +	 */
>> +	if ((flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME) &&
>> +	    (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE))
>> +		return -EINVAL;
>> +
> The comment is very hw timestamp centric. It should just be something
> along the lines of "only allow one event clock source".
Sure, will change it.
>
>>  	/* Edge detection requires explicit input. */
>>  	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
>>  	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
>> @@ -992,6 +1012,8 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
>>  
>>  	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
>>  		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
>> +	assign_bit(FLAG_EVENT_CLOCK_HARDWARE, flagsp,
>> +		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE);
>>  }
>>  
>>  static long linereq_get_values(struct linereq *lr, void __user *ip)
>> @@ -1139,6 +1161,18 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>>  			int val = gpio_v2_line_config_output_value(lc, i);
>>  
>>  			edge_detector_stop(&lr->lines[i]);
>> +
>> +			/*
>> +			 * Assuming line was input before and hardware
>> +			 * assisted timestamp only timestamps the input
>> +			 * lines.
>> +			 */
>> +			if (gpiod_is_hw_timestamp_enabled(desc)) {
>> +				ret = gpiod_hw_timestamp_control(desc, false);
>> +				if (ret)
>> +					return ret;
>> +			}
>> +
> So if you fail to disable the hw timestamp then you fail the set_config?
> Does that make sense?
> It should be impossible to fail, as per the preceding edge_detector_stop(),
> or any failure in this context is irrelevant and so can be ignored.

I am planning to remove is_hw_timestamp* API as it is not needed.

I will also remove ret check from timestamp_control API as it is not needed.

>
>>  			ret = gpiod_direction_output(desc, val);
>>  			if (ret)
>>  				return ret;
>> @@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>>  					polarity_change);
>>  			if (ret)
>>  				return ret;
>> +
>> +			/* Check if new config sets hardware assisted clock */
>> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
>> +				ret = gpiod_hw_timestamp_control(desc, true);
>> +				if (ret)
>> +					return ret;
>> +			}
>>  		}
>>  
> The error code here can come from the pinctrl timestamp_control(), so it
> should be sanitised before being returned to userspace.

I do not understand what do you mean by sanitise. I just followed what

gpiod_direction_output did just above which also returns ret from gpio

driver code similar to timestamp_control API.

>
>>  		blocking_notifier_call_chain(&desc->gdev->notifier,
>> @@ -1281,8 +1322,12 @@ static void linereq_free(struct linereq *lr)
>>  
>>  	for (i = 0; i < lr->num_lines; i++) {
>>  		edge_detector_stop(&lr->lines[i]);
>> -		if (lr->lines[i].desc)
>> +		if (lr->lines[i].desc) {
>> +			if (gpiod_is_hw_timestamp_enabled(lr->lines[i].desc))
>> +				gpiod_hw_timestamp_control(lr->lines[i].desc,
>> +							   false);
>>  			gpiod_free(lr->lines[i].desc);
>> +		}
> Potential race on gpiod_is_hw_timestamp_enabled() and the call to
> gpiod_hw_timestamp_control()?
> Why not put the gpiod_is_hw_timestamp_enabled() check inside
> gpiod_hw_timestamp_control()?
>
> And the gpiod_hw_timestamp_control() call should be moved inside
> gpiod_free(), or more correctly gpiod_free_commit().
> i.e. whenever you free the gpio you release any associated hw timestamp.

I am planning to remove is_hw_timestamp* API, that should take care

of race condition. For gpiod_free comment, I had thought about it before

but then ruled out as it would mean that for all the clients who did not

register with HTE, during their gpiod_free call, it has to make unncessary

call into HTE, however HTE release_ts has necessary checks which will return

without doing anything. Let me know if you still think to move it in gpiod_free.

>
>>  	}
>>  	kfifo_free(&lr->events);
>>  	kfree(lr->label);
>> @@ -1409,6 +1454,15 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>>  					flags & GPIO_V2_LINE_EDGE_FLAGS);
>>  			if (ret)
>>  				goto out_free_linereq;
>> +
>> +			/*
>> +			 * Check if hardware assisted timestamp is requested
>> +			 */
>> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
>> +				ret = gpiod_hw_timestamp_control(desc, true);
>> +				if (ret)
>> +					goto out_free_linereq;
>> +			}
>>  		}
>>  
> Comment can fit on one line, and probably isn't even necessary - the
> code is clear enough.
I will remove comment.
>
>>  		blocking_notifier_call_chain(&desc->gdev->notifier,
>> @@ -1956,8 +2010,15 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>>  	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
>>  		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
>>  
>> +	/*
>> +	 * Practically it is possible that user will want both the real time
>> +	 * and hardware timestamps on GPIO events, for now however lets just
>> +	 * work with either clocks
>> +	 */
>>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
>>  		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
>> +	else if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &desc->flags))
>> +		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
>>
> If there is any need or intent to support multiple clock sources then
> avoid creeping API changes and add it now.
> Either way, drop the comment.
I will remove comment in next RFC.
>
>>  	debounce_period_us = READ_ONCE(desc->debounce_period_us);
>>  	if (debounce_period_us) {
>> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
>> index eaaea3d8e6b4..d360545b4c21 100644
>> --- a/include/uapi/linux/gpio.h
>> +++ b/include/uapi/linux/gpio.h
>> @@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
>>  	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
>>  	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
>>  	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
>> +	GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE	= _BITULL(12),
>>  };
>>  
>>  /**
>> -- 
>> 2.17.1
>>
> Cheers,
> Kent.
