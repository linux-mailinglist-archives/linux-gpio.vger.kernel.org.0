Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FD23D841E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 01:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbhG0XgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 19:36:04 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:41313
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232766AbhG0XgC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 19:36:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGUbtzmbPuI/4FtLVdZxTkwDY49wd+AVt5CsyStinHD6QTa4mYjtR+5SNOLat0RdHTzsryYmNMNTtxhze9efq+zjojdU5SWsn5WVL74HfkT5K9ZF6dUS7iyGlNsQiTRtCN18bt7SyMnqABmA05yD+V7CzxYJGSXk6BTePbLJclVEBrN8okr/hzwRMFUQvPtBpQSDHqsAaYd29ooqcII7OiGT1tsVVnHKMz8vgox1PJH2IXs8qrUgTf1mr58jevjUtqFtm7vN9ERz9vneP4sKFeD1QrXU5Kx49Af0ymtIjtNAVfL3vLsoVzJOJ8mqwpswtg8Kws5ZdVa2X8HTyKWzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHASP/ql+SXv7b+J8K6cJmf/eJ7bHH3voELYR431DQk=;
 b=iHWu/eaYpzdWYd/0UkkVutkO+z1BxoUZWidkMXF4/9DtK9c2Gahz4d1/15GYhGRrQooNMfIG37JY6MDEInrkDWNdEv7dl+7PSI/rORKtLBrAsWjH0YulShCTJH08R/YLMRq1f8n2AAaoJidCM/lkDpStKvSC6NF3u6WARX/OW6zvRvphSrIID5MNTFolDYrEpSow0FcRsCrFoLynQ3hovokcEq4wN2lcrnpBYDXhnI0wgqYd8bRiJbC6DA1ldeuTLqhKUfvtQx864STSAFpqAaiOOaTsluuJ7o7ZE0CHDc7AlTCpvh6xZAh1bN7mdIumveERY0aF6l8ff6bgRVPIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHASP/ql+SXv7b+J8K6cJmf/eJ7bHH3voELYR431DQk=;
 b=D1wcvElYwlUpprlRsQ/kLUW+qEOToOEOIckWSjIg1Ft96Tbbt4n/fwic5WuSENfiP3aPuYIUTXrTRCQZ2lYJjReFnX3xBmuPdFLSlewjbzR3W8qA79+fEkv/cePEHz53hDL00lv5xHzK2NHll/l1+ku1EvxO8lAsWFHfm3dtvn3WZRzdXE0iA4GFhjWaHqKvPm4St3lsvpIxk5f+ay1I2v+/7IR9LgdjScrVvlHYkx3t48oIh3ZXZFleTfnGWzw7ofpej1ZlmoEya++k5+L2aQH2j94WXZS7L3JSg4X8nuOJyLrkflmrl766FTY2b1okrC6nXPeAyRLWzwJ+T8KWLA==
Received: from MW4PR04CA0194.namprd04.prod.outlook.com (2603:10b6:303:86::19)
 by BN6PR12MB1635.namprd12.prod.outlook.com (2603:10b6:405:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 23:36:00 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::3) by MW4PR04CA0194.outlook.office365.com
 (2603:10b6:303:86::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28 via Frontend
 Transport; Tue, 27 Jul 2021 23:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 23:36:00 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 23:35:57 +0000
Subject: Re: [RFC 01/11] Documentation: Add HTE subsystem guide
To:     Jonathan Cameron <jic23@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-2-dipenp@nvidia.com>
 <20210704195528.2fdfb320@jic23-huawei>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <65cf5f8b-6be1-afef-9224-8a3b05bb932a@nvidia.com>
Date:   Tue, 27 Jul 2021 16:44:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704195528.2fdfb320@jic23-huawei>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d99f83-b741-4309-9519-08d951574a84
X-MS-TrafficTypeDiagnostic: BN6PR12MB1635:
X-Microsoft-Antispam-PRVS: <BN6PR12MB163590B4E395B758E9B64202AEE99@BN6PR12MB1635.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +nlO4SXke6kN39hB+BWFBsWPK+HsRa0sXz8c/0nrQQJ7WbtT9CPWbW+45SNYVnealKChrT/tZL6qqPUrOgKJBxBvvR/nWoCqEcPgGrxDv1eXjVoYNz0atnNWMLouz7/QDwuHMPluVAEfUOGQBgFEkGWFtIYGf286x8VGpZR594UWgFnmmtY8/dNuWuNLveDAfmWE6vJp2WUdU+Fe8X4Y9xPucIfKxjuq06wot5HmSePoF3BTSHyFgtoQq1kSVqy3ltF4M6o68DZb00uEMaqJ/oXPmi6cq0f+vroYWieVs+DZfSwxeFna36otH5yMtfATcB1P9thynRU1O4+J3UnRzQvbHnfNK1fnEhT9THdJQStdCJ23xtr4QAbcph0uIc2L+UKoiIO7Rd2NtGLGB2hN0JbMXvLIiM3ClUUc/BAgrdA/BYV5iR4U1ZrwOkHOCZ5JQLjA8+gLEB9kN4/dUFtJaUWiEMU+MPTSJB2/1BNqqs4VmL3lniHaRZnx1uGzSHbrZiRgFsGiGww4P0j0ZuqZPKg1v20ixuo1DECZV3lOICFCOu2tUvzEXUtcCwGgSETRFO6xAnv5nVqI30IeTWk2So/UqyaPM9Gv++SLEEjmq0XF8oQeM/w5BSLF4+SZET8ybH7MhWzcxYmt2Tdrh2IQhsemJw3Nb8Z/UCR+K7wj528AW9RAffEMggEdaPoOgIPjftlbkowjsFLT0Hej8Xd5bibFzX4mRAvPsorqx/nSlFE=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7416002)(426003)(16526019)(8676002)(54906003)(83380400001)(316002)(2906002)(82310400003)(5660300002)(356005)(36906005)(6916009)(36860700001)(30864003)(70586007)(336012)(6666004)(70206006)(2616005)(26005)(53546011)(31686004)(16576012)(8936002)(31696002)(508600001)(4326008)(186003)(36756003)(86362001)(47076005)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 23:36:00.2534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d99f83-b741-4309-9519-08d951574a84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1635
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/4/21 11:55 AM, Jonathan Cameron wrote:
> On Fri, 25 Jun 2021 16:55:22 -0700
> Dipen Patel <dipenp@nvidia.com> wrote:
>
>> Adding hte document which can help understand various APIs implemented
>> in HTE framework for the HTE producers and the consumers.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Some editorial stuff inline. (I can't resist even on RFCs)
>
> Certainly interesting. I'm running a bit tight on time today, so not sure how
> much of the code I'll get a chance to look at.  Will try to get to it soon though.
>
> Jonathan
Thanks Jonathan for the review comment and time. My answers inline.
>
>> ---
>>  Documentation/hte/hte.rst | 198 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 198 insertions(+)
>>  create mode 100644 Documentation/hte/hte.rst
>>
>> diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
>> new file mode 100644
>> index 000000000000..11744dbc6d16
>> --- /dev/null
>> +++ b/Documentation/hte/hte.rst
>> @@ -0,0 +1,198 @@
>> +============================================
>> +The Linux Hardware Timestamping Engine (HTE)
>> +============================================
>> +
>> +:Author: Dipen Patel
>> +
>> +Introduction
>> +------------
>> +
>> +The certain devices have the built in hardware timestamping engine which can
> Certain devices have built in hardware timestamping engines which can
>
>> +monitor sets of system signals, lines, buses etc... in realtime for the state
> for state changes;
>
>> +change; upon detecting the change it can automatically store the timestamp at
> they can
Will add above in next RFC version2.
>
>> +the moment of occurrence. Such functionality may help achieve better accuracy
>> +in obtaining timestamp than using software counterparts i.e. ktime and friends.
>> +
>> +This document describes the API that can be used by hardware timestamping
>> +engine provider and consumer drivers that want to use the hardware timestamping
>> +engine (HTE) framework.
>> +
>> +The HTE framework APIs for the providers
>> +----------------------------------------
>> +Each driver must #include <linux/hte.h>. The ``linux/hte.h`` declares the
>> +following functions for the provider:
>> +
>> +.. c:function:: int hte_register_chip( struct hte_chip *chip )
>> +		int hte_unregister_chip( struct hte_chip *chip )
>> +
>> +	The provider uses these APIs to un/register itself with HTE framework.
>> +
>> +.. c:function:: int hte_push_ts_ns_atomic( const struct hte_chip *chip, u32 xlated_id, struct hte_ts_data *data, size_t n )
>> +
>> +	The provider pushes timestamp data in nano seconds unit using this API.
>> +
>> +The detail about parameters and API usage are described in each functions
>> +definitions in ``drivers/hte/hte.c`` file.
>> +
>> +The HTE framework APIs for the consumers
>> +----------------------------------------
>> +The consumers use following APIs to control the line for the timestamp:
>> +
> When documenting APIs you may well be better including a reference to the files
> themselves and using kernel doc there.  The documentation build can then pull that
> in when creating the html docs etc (and crucially you don't have to provide the
> same docs in two places.).   Having them here is very convenient for the RFC however :)
You mean to omit description here and put reference to file like ``drivers/hte/hte.c``?
>
>> +.. c:function:: int hte_release_ts( struct hte_ts_desc *desc )
>> +		int devm_hte_release_ts( struct device *dev, struct hte_ts_desc *desc )
>> +
>> +	The consumer uses API to release specified desc from timestamping.
>> +	The API frees resources associated with the desc and disables the
>> +	timestamping on it. The later is managed version of the same API.
>> +
>> +.. c:function:: struct hte_ts_desc *of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
>> +		struct hte_ts_desc *devm_of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
>> +
>> +	The consumers can use above request APIs to request real timestamp
>> +	capability on specified entity. The later is resource managed version
>> +	of the of_hte_request_ts API. Both the APIs expect consumer to follow
>> +	device tree bindings for the HTE consumer. The details about binding
>> +	is in ``Documentation/devicetree/bindings/hte/hte-consumer.yaml``.
>> +
>> +.. c:function:: struct hte_ts_desc *hte_req_ts_by_dt_node( struct device_node *of_node, unsigned int id, void (*cb)(enum hte_notify n) )
>> +
>> +	The consumer can request timestamping directly specifying provider
>> +	device tree node.
> When does this make sense?

This is needed when provider has dependencies on other IP within chip, for example

tegra chip GPIO HTE has to talk to GPIO controller to fully enable HTE functionality.

>
>> +
>> +.. c:function:: int hte_enable_ts( struct hte_ts_desc *desc )
>> +.. c:function:: int hte_disable_ts( struct hte_ts_desc *desc )
>> +
>> +	The consumer can enable/disable timestamping on given desc.
>> +
>> +.. c:function:: int hte_retrieve_ts_ns( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
>> +		int hte_retrieve_ts_ns_wait( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
>> +
>> +	The consumer uses above two API versions to get/retrieve timestamp data
>> +	for the given desc. The later is blocking version.
>> +
>> +.. c:function:: hte_get_clk_src_info(const struct hte_line_desc *desc, struct hte_clk_info *ci)
>> +
>> +	The consumer retrieves clock source information that provider uses to
>> +	timestamp entity in the structure hte_clk_info. This information
>> +	specifies clock rate in HZ and clock.
>> +
>> +The details on struct hte_clk_info
>> +-----------------------------------
>> +This structure presents detail of the hardware clock that provider uses for
>> +realtime timestamping purposes. The consumer can use hte_get_clk_src_info API
>> +to get the information in hte_clk_info structure. It has hz and type parameters
>> +where hz represents clock rate in HZ and type is clock type of clockid_t and
>> +of CLOCK_* family (for example, CLOCK_MONOTONIC).
>> +
>> +The consumers calling of_hte_request_ts or hte_req_ts_by_dt_node APIs with
>> +cb parameter set, usually will call hte_retrieve_ts (non blocking
>> +version) after being notified by the callbacks from HTE subsystem. The
>> +consumers calling those requests APIs with cb parameter NULL, usually will call
>> +hte_retrieve_ts_wait API.
>> +
>> +The HTE subsystem provides software buffer per requested id/entity to store
>> +timestamp data (struct hte_ts_data type). The consumers can manage the buffer.
>> +It also provides buffer watermark which can notify (if cb parameter is provided
>> +during request API call) consumer or unblock consumers calling
>> +hte_retrieve_ts_wait API. The following APIs are used to manipulate the
>> +software buffer:
> Have you come across any devices that have a hardware fifo for these timestamps?
> It's moderately common on sensor hubs to do so, and then you get into a fun question
> of how to manage the watermark.  You don't want to pull from the hardware too early,
> but conversely you can get out of sync between the software and hardware buffers if
> someone reasons less than 'watermark' samples from the software buffer.
>
> Anyhow, it can be entertaining.  So in those cases it can be simpler to explicitly provide
> control of two separate watermarks.

The provider I have dealt with had single hardware FIFO to store timestamps

indiscriminately. I am sure this will come up in future in which case we can

expand it to separate watermark.

>
>> +
>> +.. c:function:: int hte_set_buf_len( const struct hte_ts_desc *desc,unsigned int len )
>> +		int hte_get_buf_len( const struct hte_ts_desc *desc )
>> +
>> +	The consumer uses above APIs to set/get software buffer depth.
> What happens if there is content when it is resized?

I have described in the hte_set_buf_len API description. To summarize, you can

follow certain sequences to consume old data if you still care. Otherwise this

is a destructive API.

>
>> +
>> +.. c:function:: int hte_set_buf_watermark( const struct hte_ts_desc *desc, unsigned int val )
>> +		int hte_get_buf_watermark( const struct hte_ts_desc *desc )
>> +
>> +	The consumer uses above APIs to set/get software threshold, threshold
>> +	can be used to notity or unblock waiting consumer when data becomes
>> +	available equal or above to threshold value.
>> +
>> +.. c:function:: size_t hte_available_ts( const struct hte_ts_desc *desc )
>> +
>> +	The consumer uses above API to get available timestamp data stored
>> +	in the software buffer for the desc.
>> +
>> +The detail about parameters and API usage are described in each functions
>> +definitions in ``drivers/hte/hte.c`` file.
>> +
>> +The HTE timestamp element detail
>> +--------------------------------
>> +The struct hte_ts_data, declared at ``include/linux/hte.h``, is used to pass
>> +timestamp details between the consumers and the providers. It expresses
>> +timestamp data in nano second in u64 data type.
> I'd suggest s64 to match with kernel timestamp format.
Make sense, I will update in next revision.
>
>> For now all the HTE APIs
>> +using struct hte_ts_data requires tsc to be in nano seconds. The timestamp
>> +element structure stores below information along with timestamp data::
>> +
>> + struct hte_ts_data {
>> +	/*
>> +	 * Timestamp value
>> +	 */
>> +	u64 tsc;
>> +	/*
>> +	 * The sequence counter, keep track of the number of timestamps.
>> +	 * It can be used to check if data is dropped in between.
>> +	 */
> Is this a hardware feature?  A bit unusual to have this rather than simple
> overflow flag to indicate we dropped an unknown number of samples.
Its software feature. I Believe having seq helps consumer to backtrack.
>
>> +	u64 seq;
>> +	/* Direction of the event, i.e. falling or rising */
>> +	int dir;
> Given an even could do more than that potentially, or indeed not be able to
> tell if it was rising or falling, I would suggest an enum to which we can add
> more options as needed.
I have two defines in hte.h for now. I can convert them into enum type.
>
>> + };
>> +
>> +The typical hte_ts_data data life cycle::
>> +In this example the provider provides timestamp in nano seconds and for the
>> +GPIO line::
>> +
>> + - Monitors GPIO line change.
>> + - Detects the state change on GPIO line.
>> + - Converts timestamps in nano seconds and stores it in tsc.
>> + - Stores GPIO direction in dir variable if the provider has that hardware
>> + capability.
> We definitely want to know if it does or not.  How does an application query that?
Its stored in dir field of the hte_ts_data structure.
>
>> + - Pushes this hte_timestamp_el object to HTE subsystem.
>> + - HTE subsystem increments seq counter and stores it in software buffer
>> + dedicated to requested GPIO line.
> Ah. So that seq counter is only for software drops if the fifo fills up.
Yes.
>
>> + - Waiting consumer gets notified.
>> + - The consumer calls the retrieve timestamp API.
>> +
>> +HTE subsystem debugfs attributes
>> +--------------------------------
>> +HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
>> +It also creates line/signal related debugfs attributes at
>> +``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
>> +
>> +`ts_requested`
>> +		The total number of entities requested from the given provider,
>> +		where entity is the provider specific and could represent
>> +		lines, GPIO, chip signals, buses etc...
>> +                The attribute will be availble at
>> +		``/sys/kernel/debug/hte/<provider>/``.
>> +
>> +		Read only value
>> +
>> +`total_ts`
>> +		The total number of entities supported by the provider.
>> +                The attribute will be availble at
>> +		``/sys/kernel/debug/hte/<provider>/``.
>> +
>> +		Read only value
>> +
>> +`ts_buffer_depth`
>> +		The software buffer lenth to store timestamp data.
>> +                The attribute will be availble at
>> +		``/sys/kernel/debug/hte/<provider>/<label or id>/``.
>> +
>> +		Read only value
>> +
>> +`ts_buffer_watermark`
>> +		The software buffer watermark or threshold.
>> +                The attribute will be availble at
>> +		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
>> +
>> +		Read only value
>> +
>> +`dropped_timestamps`
>> +		The dropped timestamps for a given line.
>> +                The attribute will be availble at
>> +		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
>> +
>> +		Read only value
