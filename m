Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7547740A612
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 07:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbhINFpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 01:45:16 -0400
Received: from mail-bn8nam12on2062.outbound.protection.outlook.com ([40.107.237.62]:35297
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239398AbhINFpQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Sep 2021 01:45:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSyDP0bF+twO10Hy4xBZEJ+jI2rvUoyjwqkO0dwFxq2JEh0mFReNMIY5XOY8DJIPlWd/i3C+oGujLhsChypVbpoEEqnkspaPp+jVFlUlR6po0oxgR25zirpoz6FJO9mbv5RbpV0sximSL1cbF0/AXkWhyPi91UkmQ2+KKDzXcepNRfzXSdOrShCQPqJEOTvxkLyA3J/Pn73qTuUQTgIX7wySLdBV3bCoB/T1GAKY2jkrj8uJBpXkmaNPy61I1yPyA2gkEBUdwNutRVHCBeSM3F1JcNfilmSKm/JxmHtfaXg5Xrjf162PeY2JFzm/m9D6S47LyR2Ngn5iSJhLpv8Lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0MOZXa6AsGBcWRHibDT8dGh9PRIqHrJ3ttRYnKg/HvY=;
 b=hW7PvOMuOqH6/xnrWKNe/BnQzgdhnSru7xpHBftt7TSojvWIyQiuIani6NvtiuLhaBUDzYAmDpaDncoZN2uN1WYtWEA4kO6SsLRC1+YXIHXTiAwMUMAegiddP8s2FVeH30V0OQmWi3TU3K9nCeIsHic2ge1mKUHYjV6yMhRe5cz4qVdu3EU21aX7eeIsw1hRNNrq5M9xGQ6Xyx5b2CJQVdS/NAutBRT4WKHHT1E+DWEdjTbpZKN0VVrgGb0BXzHEEUU+UyAvozeo0VL/zp2WFGsKd23t6r0rWo4hLyYqeWItG4Wz47ABajUyrMte9J8VPFgUP+UWeNcVedd2dTWlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MOZXa6AsGBcWRHibDT8dGh9PRIqHrJ3ttRYnKg/HvY=;
 b=sg2bZE/kjBVPYYgH8J/rK7fM7KBrBRqbyBxUEOEC3R3JixCwXSWtkUK12DAkryPQyQzcw9g546v7ncJTEDwKMTOfC1qQiZ0ShVxa5WXWracAvIiN0rFvmiBG2Fx+E0/8s/lpo9QidaEtohHCT/tyYaVPsC5JRsi5Q5K0nEthphI1ViHZUftMS//uPE1W/7r5Vt6nM8OztUYvbVEm3amlq9LOfSq62oL3sUQununI1QtaRXnqWrAWAZq2DCl7uX8GizREH9wc75l3x/+jqQVt490NDA/VUvOwzP4CdD/sDZkD2gHXPu4kbvh6m327jLrPFg1/Gr5QxkyaOAXSUWk8fA==
Received: from MWHPR1401CA0017.namprd14.prod.outlook.com
 (2603:10b6:301:4b::27) by CH0PR12MB5234.namprd12.prod.outlook.com
 (2603:10b6:610:d1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 05:43:51 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::bf) by MWHPR1401CA0017.outlook.office365.com
 (2603:10b6:301:4b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 14 Sep 2021 05:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 05:43:51 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 14 Sep
 2021 05:43:50 +0000
Received: from [172.17.173.69] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 14 Sep
 2021 05:43:49 +0000
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
To:     Jonathan Cameron <jic23@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-3-dipenp@nvidia.com>
 <20210704211525.4efb6ba0@jic23-huawei>
 <52ecf0a6-07a6-ec43-4b1e-fb341ad969b6@nvidia.com>
 <20210801171304.6e8d70d9@jic23-huawei>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <91744e4f-b1b8-399a-b521-aba0215a5dc4@nvidia.com>
Date:   Mon, 13 Sep 2021 22:43:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210801171304.6e8d70d9@jic23-huawei>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7ee62bf-f69b-46af-73e1-08d97742a192
X-MS-TrafficTypeDiagnostic: CH0PR12MB5234:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5234CB733D53067517A387EDAEDA9@CH0PR12MB5234.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lc7jJrXbxCE8xzkFpW7FjhGQdGrSHuN4Ig8WpJqXXwc9JY0aL5SaWy2HLo8v/upNsGap1qkZpuF1Zo1BA7FVtXP5Ln8bbfW8zeRNCJpApLNHi4hwN5tICKoBFiO7hKzfFzJsButEAwcGZAOhKr5p9WKTCob5MfqGkJ+bEJ+w4m+g8hqVJ1hVVNqa54GPsG8yOZTw5rcbnIpm1nW8h9VrgvxUR0YVhTq/E+6UyBczQbTcXLzSxl2wclrswP/FAa6JNEt7WXTForz2pFvNqK03afpQHfawoh3t0jVIE3LsbqH8UgVlKddvs4hYSbCK5OonsyB0aWJyqg1/VPfp0TPY4xCJnwkoqxMaumFhXDEpzDFwPtALKnXUGfQG3yPs1gL/AF4OtYXPbJvxQLsLzBKKqJ6/878jND+wGUxZHzGsgivJbW0zbu0vxSQqIa0s88lI6B81Q3mt72+xg0vXsCvEziJoiA/6lgQ5aNBMqc8rhu5rWXgxmcCJ3KqTj2xfgAQ0pUYNSWPiHPJkb/u+lVURdtSvemePenADMJjO5+MJIpgpSqMBGar6iEzae8OaCHXG8is4WB6KQ1ucUUrffL+HYDfWm+I2RG/9CM+d+U+GGfW5CjSjOvyV907+2c9S3oRDnJtvJi9EcN3VMBijNq1BWIEpGWyGKwf/L4GZqykSqJbtf3G65xQOobXMO/9NdKns7I6Rz+3jLLxkQj7kdIjMXJR1+v2WHEzxNpznu0fEP/A=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(31686004)(7416002)(26005)(8936002)(53546011)(7636003)(6666004)(8676002)(2906002)(70586007)(4326008)(186003)(2616005)(70206006)(47076005)(16526019)(5660300002)(316002)(508600001)(31696002)(86362001)(83380400001)(356005)(6916009)(36756003)(82310400003)(30864003)(36906005)(426003)(336012)(36860700001)(16576012)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 05:43:51.0789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ee62bf-f69b-46af-73e1-08d97742a192
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5234
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jonathan,

I got some time to implement RFC version 2 while doing so I have a follow up comment

inline regarding clock source comment of yours.

Best Regards,

Dipen Patel

On 8/1/21 9:13 AM, Jonathan Cameron wrote:
> On Tue, 27 Jul 2021 21:38:45 -0700
> Dipen Patel <dipenp@nvidia.com> wrote:
>
>> On 7/4/21 1:15 PM, Jonathan Cameron wrote:
>>> On Fri, 25 Jun 2021 16:55:23 -0700
>>> Dipen Patel <dipenp@nvidia.com> wrote:
>>>  
>>>> Some devices can timestamp system lines/signals/Buses in real-time
>>>> using the hardware counter or other hardware means which can give
>>>> finer granularity and help avoid jitter introduced by software means
>>>> of timestamping. To utilize such functionality there has to be
>>>> framework where such devices can register themselves as producers or
>>>> providers so that the consumers or clients devices can request specific
>>>> line from the providers. This patch introduces such subsystem as
>>>> hardware timestamping engine (HTE).
>>>>
>>>> It provides below APIs for the provider:
>>>> - hte_register_chip() -- To register the HTE chip.
>>>> - hte_unregister_chip() -- To unregister the HTE chip.
>>>> - hte_push_ts_ns_atomic() -- To push timestamp data into HTE subsystem.
>>>>
>>>> It provides below APIs for the consumer:
>>>> - of_hte_request_ts() -- To request timestamp functionality.
>>>> - devm_of_hte_request_ts() -- Managed version of the above.
>>>> - hte_req_ts_by_dt_node() -- To request timestamp functionality by
>>>> using HTE provider dt node.
>>>> - devm_hte_release_ts() -- The managed version to release timestamp
>>>> functionality and associated resources.
>>>> - hte_retrieve_ts_ns() -- To retrieve timestamps.
>>>> - hte_retrieve_ts_ns_wait() -- Same as above but blocking version.
>>>> - hte_enable_ts() -- To disable timestamp functionality.
>>>> - hte_disable_ts() -- To enable timestamp functionality.
>>>> - hte_available_ts() -- To query available timestamp data.
>>>> - hte_release_ts() -- To release timestamp functionality and its
>>>> associated resources.
>>>> - hte_get_clk_src_info() -- To query clock source information from
>>>> the provider
>>>>
>>>> It provides centralized software buffer management per requested id to
>>>> store the timestamp data for the consumers as below:
>>>> - hte_set_buf_len() -- To set the buffer length.
>>>> - hte_get_buf_len() -- To get the buffer length.
>>>> - hte_set_buf_watermark() -- To set the software threshold/watermark.
>>>> - hte_get_buf_watermark() -- To get the software threshold/watermark.
>>>>
>>>> The detail about parameters and API usage are described in each
>>>> functions definitions in drivers/hte/hte.c file.
>>>>
>>>> The patch adds compilation support in Makefile and menu options in
>>>> Kconfig.
>>>>
>>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>  
>>> Hi Dipen, this isn't a particularly thorough review as I'm still getting my head
>>> around what this is doing + it is an RFC :)  
>> Thanks for the review comments. My responses inline.
> You are welcome, some follow up responses inline.
> I've tried to crop this down a bit so only kept the bits we are discussing.
>
>>>> +
>>>> +static int hte_ts_dis_en_common(struct hte_ts_desc *desc, bool en)
>>>> +{
>>>> +	u32 ts_id;
>>>> +	struct hte_device *gdev;
>>>> +	struct hte_ts_info *ei;
>>>> +	int ret;
>>>> +
>>>> +	if (!desc)
>>>> +		return -EINVAL;
>>>> +
>>>> +	ei = (struct hte_ts_info *)desc->data_subsys;  
>>> As above, no need to cast - though it rather implies the type of data_subsys
>>> should not be void *.  
>> desc is public facing structure, I wanted to make subsystem related
>>
>> information opaque that is why I had it void *.
>>
> you can keep it opaque, just have a forwards definition of
> struct hte_ts_desc;
> which just means it is defined somewhere.  You can have that in the header with
> the definition hidden away.
>
> It will only need to have a visible complete definition when you dereference it inside
> the the core.
>
> Mind you, I'm suggesting allowing it to be embedded in another structure anyway which
> would require you to have it exposed.  Perhaps this desire to keep it opaque is
> a reason to not take that suggestion but it isn't relevant for this one.
>
>
>>>> + */
>>>> +struct hte_ts_desc *devm_of_hte_request_ts(struct device *dev,
>>>> +					   const char *label,
>>>> +					   void (*cb)(enum hte_notify n))
>>>> +{
>>>> +
>>>> +	struct hte_ts_desc **ptr, *desc;
>>>> +
>>>> +	ptr = devres_alloc(__devm_hte_release_ts, sizeof(*ptr), GFP_KERNEL);  
>>> Superficially looks like you might get way with just calling dev_add_action_or_reset() in here
>>> and avoid this boilerplate.  A lot of cases that looked like this got cleaned up in the
>>> last kernel cycle.  
>> I based my patches from linux-next/master. Not sure if that has
>>
>> dev_add_action_or_reset
> typo on my part was meant to be
>
> devm_add_action_or_reset()
>
>>>> +
>>>> +/**
>>>> + * hte_req_ts_by_dt_node() - Request entity to monitor by passing HTE device
>>>> + * node directly, where meaning of the entity is provider specific, for example
>>>> + * lines, signals, GPIOs, buses etc...
>>>> + *
>>>> + * @of_node: HTE provider device node.
>>>> + * @id: entity id to monitor, this id belongs to HTE provider of_node.
>>>> + * @cb: Optional callback to notify.
>>>> + *
>>>> + * Context: Holds mutex lock, can not be called from atomic context.  
>>> What mutex and why?  If it is one you can check is held even better.  
>> ___hte_req_ts holds the mutex lock to serialize multiple consumers
>>
>> requesting same entity.
> Add that detail to the comment.
>
>>>  
>>>> + * Returns: ts descriptor on success or error pointers.
>>>> + */
>>>> +struct hte_ts_desc *hte_req_ts_by_dt_node(struct device_node *of_node,
>>>> +					  unsigned int id,
>>>> +					  void (*cb)(enum hte_notify n))
>>>> +{
>>>> +	struct hte_device *gdev;
>>>> +	struct hte_ts_desc *desc;
>>>> +	int ret;
>>>> +	u32 xlated_id;
>>>> +
>>>> +	gdev = of_node_to_htedevice(of_node);
>>>> +	if (IS_ERR(gdev))
>>>> +		return ERR_PTR(-ENOTSUPP);
>>>> +
>>>> +	if (!gdev->chip || !gdev->chip->ops)
>>>> +		return ERR_PTR(-ENOTSUPP);
>>>> +
>>>> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>>>> +	if (!desc) {
>>>> +		ret = -ENOMEM;
>>>> +		goto out_put_device;
>>>> +	}  
>>> Pass a desc pointer into this function rather than allocating the structure
>>> in here.  That lets the caller embed that structure inside one of it's own
>>> structures if it wants to, resulting in fewer small allocations which is always good.
>>>
>>> It's far from obvious that the caller needs to free desc.  
>> Are you suggesting to shift burden of allocation/deallocation (static or dynamic)
>>
>> at client/consumer side?
> It's been a while so I've forgotten how this works, but 'probably' yes...
> If a function creates some sort of record (of fixed known size and type) then
> letting that be passed in + filled in by the function is normally more efficient
> than having an allocation in here.   Chances are the consumer will just have
> it embedded in an existing state structure and not need to do any explicit
> allocation / deallocation.  Disadvantage is you can't keep it opaque.
>
>>>  
>>>> +
>>>> +	desc->con_id = id;
>>>> +	ret = gdev->chip->xlate(gdev->chip, NULL, desc, &xlated_id);
>>>> +	if (ret < 0) {
>>>> +		dev_err(gdev->chip->dev,
>>>> +			"failed to xlate id: %d\n", id);
>>>> +		goto out_free_desc;
>>>> +	}
>>>> +
>>>> +	ret = ___hte_req_ts(gdev, desc, xlated_id, cb);
>>>> +	if (ret < 0) {
>>>> +		dev_err(gdev->chip->dev,
>>>> +			"failed to request id: %d\n", id);
>>>> +		goto out_free_desc;
>>>> +	}
>>>> +
>>>> +	return desc;
>>>> +
>>>> +out_free_desc:
>>>> +	kfree(desc);
>>>> +
>>>> +out_put_device:
>>>> +	return ERR_PTR(ret);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(hte_req_ts_by_dt_node);
>>>> +
>>>> +/**
>>>> + * hte_get_clk_src_info() - Consumer calls this API to query clock source
>>>> + * information of the desc.
>>>> + *
>>>> + * @desc: ts descriptor, same as returned from request API.
>>>> + *
>>>> + * Context: Any context.
>>>> + * Returns: 0 on success else negative error code on failure.
>>>> + */
>>>> +int hte_get_clk_src_info(const struct hte_ts_desc *desc,
>>>> +			 struct hte_clk_info *ci)
>>>> +{
>>>> +	struct hte_chip *chip;
>>>> +	struct hte_ts_info *ei;
>>>> +
>>>> +	if (!desc || !desc->data_subsys || !ci) {
>>>> +		pr_debug("%s:%d\n", __func__, __LINE__);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	ei = desc->data_subsys;
>>>> +	if (!ei || !ei->gdev || !ei->gdev->chip)
>>>> +		return -EINVAL;
>>>> +
>>>> +	chip = ei->gdev->chip;
>>>> +	if (!chip->ops->get_clk_src_info)
>>>> +		return -ENOTSUPP;
>>>> +
>>>> +	return chip->ops->get_clk_src_info(chip, ci);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(hte_get_clk_src_info);
>>>> +
>>>> +static inline void hte_add_to_device_list(struct hte_device *gdev)
>>>> +{
>>>> +	struct hte_device *prev;  
>>> Needs to take an appropriate lock as you may have concurrent calls.  
>> There is spin_lock held from register API from where this gets
>> called.
> Great. I'd missed that.
>
>>>  
>>>> +
>>>> +	if (list_empty(&hte_devices)) {
>>>> +		list_add_tail(&gdev->list, &hte_devices);  
>>> Needs a comment. I've no idea why you might want to only add it if there were
>>> no other hte_devices already there.
>>>  
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	prev = list_last_entry(&hte_devices, struct hte_device, list);  
>>> Why woud you do this?  
>> Thanks for pointing out. I definitely missed cleaning this up. Now, I will
>>
>> remove this function in next RFC version as one line can be added directly
>>
>> in register API.
>>
>>>  
>>>> +	list_add_tail(&gdev->list, &hte_devices);
>>>> +}
>>>> +
>>>> +/**
>>>> + * hte_push_ts_ns_atomic() - Used by the provider to push timestamp in nano
>>>> + * seconds i.e data->tsc will be in ns, it is assumed that provider will be
>>>> + * using this API from its ISR or atomic context.
>>>> + *
>>>> + * @chip: The HTE chip, used during the registration.
>>>> + * @xlated_id: entity id understood by both subsystem and provider, usually this
>>>> + * is obtained from xlate callback during request API.
>>>> + * @data: timestamp data.
>>>> + * @n: Size of the data.
>>>> + *
>>>> + * Context: Atomic.
>>>> + * Returns: 0 on success or a negative error code on failure.
>>>> + */
>>>> +int hte_push_ts_ns_atomic(const struct hte_chip *chip, u32 xlated_id,
>>>> +			  struct hte_ts_data *data, size_t n)
>>>> +{
>>>> +	unsigned int ret;
>>>> +	bool notify;
>>>> +	size_t el_avail;
>>>> +	struct hte_ts_buf *buffer;
>>>> +	struct hte_ts_info *ei;
>>>> +
>>>> +	if (!chip || !data || !chip->gdev)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (xlated_id > chip->nlines)
>>>> +		return -EINVAL;
>>>> +
>>>> +	ei = &chip->gdev->ei[xlated_id];
>>>> +
>>>> +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags) ||
>>>> +	    test_bit(HTE_TS_DISABLE, &ei->flags)) {
>>>> +		dev_dbg(chip->dev, "Unknown timestamp push\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	/* timestamp sequence counter, start from 0 */
>>>> +	data->seq = ei->seq++;
>>>> +
>>>> +	buffer = ei->buf;
>>>> +	el_avail = buffer->access->el_available(buffer);
>>>> +	ret = buffer->access->store(buffer, data, n);  
>>> If we are doing this from the hte core, why is buffer definition in the scope of the
>>> drivers rather than the core?  That seems backwards to me.  
>> I do not understand this comment. The buffer definition is in scope of hte core
>>
>> as it is the only entity that manages it.
> I think I figured that out later and forgot to come back and edit this comment.
> However...
>
> In that case, why is it an ops function?  Don't introduce abstraction
> until you need it. Will be simpler and easier to review if you just
> call those functions directly for now. e.g.
>
> 	ret = hs_ts_store_to_buf(buffer, data, n);
>
> Chances are you'll never introduce another buffer choice.
> For a long time I thought we'd have both fifo and ring options in IIO
> but it turned out no one really cared. We do have an ops structure, but
> that's because in IIO the buffer interface is used for two things:
> 1) Pushing to a kfifo that is going to userspace.
> 2) Pushing to a callback function owned by a consumer.
> and there is a rather fiddly data demux on the front end to ensure each
> of those only gets the data requested via that path - at least with timestamps
> there is only one type of data!
>
> Hmm, thinking about this raises an interesting question.
> Why do we want a kfifo here at all for HTE?  You could
> just call a callback function registered by the consumer of that
> kfifo directly.  If that consumer then wants to buffer then of
> course it can, but it not (perhaps it only cares about the latest
> value and will drop the rest) then it can chose not to.  Maybe
> it's just gathering stats rather than caring about individual
> timestamps?  Probably lots of other things that might happen in
> the consumer that I've not thought of.  We need a buffer if
> userspace becomes involved, but here IIRC that's not (yet) true.
>
>>>  
>>>> +	if (ret != n) {
>>>> +		atomic_inc(&ei->dropped_ts);
>>>> +		if (ei->cb)
>>>> +			ei->cb(HTE_TS_DROPPED);
>>>> +		return -ENOMEM;
>>>> +	}
> ...
>
>>>  
>>>> +
>>>> +/**
>>>> + * struct hte_ts_data - HTE timestamp data.
>>>> + * The provider uses and fills timestamp related details during push_timestamp
>>>> + * API call. The consumer uses during retrieve_timestamp API call.
>>>> + *
>>>> + * @tsc: Timestamp value.
>>>> + * @seq: Sequence counter of the timestamps.
>>>> + * @dir: Direction of the event at the time of timestamp.
>>>> + */
>>>> +struct hte_ts_data {
>>>> +	u64 tsc;
>>>> +	u64 seq;
>>>> +	int dir;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct hte_clk_info - Clock source info that HTE provider uses.
>>>> + * The provider uses hardware clock as a source to timestamp real time. This
>>>> + * structure presents the clock information to consumers. 
>>>> + *
>>>> + * @hz: Clock rate in HZ, for example 1KHz clock = 1000.
>>>> + * @type: Clock type. CLOCK_* types.  
>>> So this is something we got a it wrong in IIO. It's much better to define
>>> a subset of clocks that can be potentially used.  There are some that make
>>> absolutely no sense and consumers really don't want to have to deal with them.  
>> Is there anything I have to change here?
> Yes - specify which clocks would make sense.  You might not need to explicitly
> allow only those, but that might also be worthwhile. Otherwise, the chances are
> you'll end up with a bunch of special purpose code in consumers on the basis
> they might get CLOCK_TAI or similar and have to deal with it.
> As for exactly which clocks do make sense, that's one which may take some figuring
> out. Probably REALTIME, MONOTONIC and BOOTTIME depending on whether you care
> what happens when the time of the system gets adjusted, or whether it carries
> on measuring time across suspend.   Very application dependent but there are some
> you can definitely rule out. Don't repeat my mistake of leaving it vague
> (which incidentally was a follow up to picking a silly clock to use for timestamps
>  before we allowed it to be configured).

I believe your comment is under assumption that providers have choice in selecting

clock source to timestamp in turns clients have it as well. For now, the provider

I have implemented has single clock source and hence I only implemented get_clock*

hook that provider implement and client can retrieve that information. I guess I can

always implement set_clock* hook as well for the future providers which support

multiple clock sources. Please let me if I missed your point.

>>>    
>>>> + */
>>>> +struct hte_clk_info {
>>>> +	u64 hz;
>>>> +	clockid_t type;
>>>> +};
>>>> +
>>>> +/**
>>>> + * HTE subsystem notifications for the consumers.
>>>> + *
>>>> + * @HTE_TS_AVAIL: Timestamps available notification.
>>>> + * @HTE_TS_DROPPED: Timestamps dropped notification.  
>>> Something I've missed so far is whether drops are in a kfifo or a ring
>>> fashion.  I'm guess that's stated somewhere, but it might be useful to have
>>> it here.  
>> Dropped are from kfifo if kfifo does not have space.
> Ok, perhaps expand the comment?
>
> ...
>
>>>  
>>>> + *
>>>> + * xlated_id parameter is used to communicate between HTE subsystem and the
>>>> + * providers. It is the same id returned during xlate API call and translated
>>>> + * by the provider. This may be helpful as both subsystem and provider locate
>>>> + * the requested entity in constant time, where entity could be anything from
>>>> + * lines, signals, events, buses etc.. that providers support.
>>>> + */
>>>> +struct hte_ops {
>>>> +	int (*request)(struct hte_chip *chip, u32 xlated_id);
>>>> +	int (*release)(struct hte_chip *chip, u32 xlated_id);
>>>> +	int (*enable)(struct hte_chip *chip, u32 xlated_id);
>>>> +	int (*disable)(struct hte_chip *chip, u32 xlated_id);
>>>> +	int (*get_clk_src_info)(struct hte_chip *chip,
>>>> +				struct hte_clk_info *ci);
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct hte_chip - Abstract HTE chip structure.
>>>> + * @name: functional name of the HTE IP block.
>>>> + * @dev: device providing the HTE.  
>>> Unclear naming.  Is this the parent device, or one associated with the HTE itself?
>>> I'm guessing today you don't have one associated with the HTE, but it is plausible you
>>> might gain on in future to make it fit nicely in the device model as a function of another
>>> device.  
>> This is provider's device, could be &pdev->dev or any dev provider deems fit hence the
>>
>> generic name.
> Ok, for now this works as a name, but I wonder if you will end up growing another
> layer in the device model as would happen for majority of subsystems.
> You may end up doing so when adding support to query the provider via a handle
> in the dt of the consumer.  It could probably be avoided, but throwing this into
> a class might make your life easier as you can use more standard infrastructure.
>
>>>  
>>>> + * @ops: callbacks for this HTE.
>>>> + * @nlines: number of lines/signals supported by this chip.
>>>> + * @xlate: Callback which translates consumer supplied logical ids to
>>>> + * physical ids, return from 0 for the success and negative for the
>>>> + * failures. It stores (0 to @nlines) in xlated_id parameter for the success.
>>>> + * @of_hte_n_cells: Number of cells used to form the HTE specifier.
>>>> + * @gdev: HTE subsystem abstract device, internal to the HTE subsystem.
>>>> + * @data: chip specific private data.
>>>> + */
>>>> +struct hte_chip {
>>>> +	const char *name;
>>>> +	struct device *dev;
>>>> +	const struct hte_ops *ops;
>>>> +	u32 nlines;
>>>> +	int (*xlate)(struct hte_chip *gc,
>>>> +		     const struct of_phandle_args *args,
>>>> +		     struct hte_ts_desc *desc, u32 *xlated_id);
>>>> +	u8 of_hte_n_cells;
>>>> +
>>>> +	/* only used internally by the HTE framework */
>>>> +	struct hte_device *gdev;
>>>> +	void *data;
>>>> +};
> ...
>
> Jonathan
