Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1D23DCC41
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Aug 2021 17:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhHAPV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Aug 2021 11:21:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231940AbhHAPV7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Aug 2021 11:21:59 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CC9461078;
        Sun,  1 Aug 2021 15:21:47 +0000 (UTC)
Date:   Sun, 1 Aug 2021 16:24:27 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
Subject: Re: [RFC 01/11] Documentation: Add HTE subsystem guide
Message-ID: <20210801162427.40d619af@jic23-huawei>
In-Reply-To: <65cf5f8b-6be1-afef-9224-8a3b05bb932a@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
        <20210625235532.19575-2-dipenp@nvidia.com>
        <20210704195528.2fdfb320@jic23-huawei>
        <65cf5f8b-6be1-afef-9224-8a3b05bb932a@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 27 Jul 2021 16:44:30 -0700
Dipen Patel <dipenp@nvidia.com> wrote:

> On 7/4/21 11:55 AM, Jonathan Cameron wrote:
> > On Fri, 25 Jun 2021 16:55:22 -0700
> > Dipen Patel <dipenp@nvidia.com> wrote:
> >  
> >> Adding hte document which can help understand various APIs implemented
> >> in HTE framework for the HTE producers and the consumers.
> >>
> >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>  
> > Some editorial stuff inline. (I can't resist even on RFCs)
> >
> > Certainly interesting. I'm running a bit tight on time today, so not sure how
> > much of the code I'll get a chance to look at.  Will try to get to it soon though.
> >
> > Jonathan  
> Thanks Jonathan for the review comment and time. My answers inline.
Hi Dipen,

A few follow up comments inline.

> >  
> >> ---
> >>  Documentation/hte/hte.rst | 198 ++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 198 insertions(+)
> >>  create mode 100644 Documentation/hte/hte.rst
> >>
> >> diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
> >> new file mode 100644
> >> index 000000000000..11744dbc6d16
> >> --- /dev/null
> >> +++ b/Documentation/hte/hte.rst
> >> @@ -0,0 +1,198 @@
> >> +============================================
> >> +The Linux Hardware Timestamping Engine (HTE)
> >> +============================================
> >> +
> >> +:Author: Dipen Patel
> >> +
> >> +Introduction
> >> +------------
> >> +
> >> +The certain devices have the built in hardware timestamping engine which can  
> > Certain devices have built in hardware timestamping engines which can
> >  
> >> +monitor sets of system signals, lines, buses etc... in realtime for the state  
> > for state changes;
> >  
> >> +change; upon detecting the change it can automatically store the timestamp at  
> > they can  
> Will add above in next RFC version2.
> >  
> >> +the moment of occurrence. Such functionality may help achieve better accuracy
> >> +in obtaining timestamp than using software counterparts i.e. ktime and friends.
> >> +
> >> +This document describes the API that can be used by hardware timestamping
> >> +engine provider and consumer drivers that want to use the hardware timestamping
> >> +engine (HTE) framework.
> >> +
> >> +The HTE framework APIs for the providers
> >> +----------------------------------------
> >> +Each driver must #include <linux/hte.h>. The ``linux/hte.h`` declares the
> >> +following functions for the provider:
> >> +
> >> +.. c:function:: int hte_register_chip( struct hte_chip *chip )
> >> +		int hte_unregister_chip( struct hte_chip *chip )
> >> +
> >> +	The provider uses these APIs to un/register itself with HTE framework.
> >> +
> >> +.. c:function:: int hte_push_ts_ns_atomic( const struct hte_chip *chip, u32 xlated_id, struct hte_ts_data *data, size_t n )
> >> +
> >> +	The provider pushes timestamp data in nano seconds unit using this API.
> >> +
> >> +The detail about parameters and API usage are described in each functions
> >> +definitions in ``drivers/hte/hte.c`` file.
> >> +
> >> +The HTE framework APIs for the consumers
> >> +----------------------------------------
> >> +The consumers use following APIs to control the line for the timestamp:
> >> +  
> > When documenting APIs you may well be better including a reference to the files
> > themselves and using kernel doc there.  The documentation build can then pull that
> > in when creating the html docs etc (and crucially you don't have to provide the
> > same docs in two places.).   Having them here is very convenient for the RFC however :)  
> You mean to omit description here and put reference to file like ``drivers/hte/hte.c``?

Exactly. You can cross reference to kernel-doc from within the rst. That means the
documentation will be in the generated html etc and available in the source code,
cutting down on duplication and chances of them disagreeing.  The disadvantage
is it isn't quite as useful to provide an easily reviewable single document when
discussing the design.

What can be useful in a docs file though is to describe the 'flow' of how these
functions might be used.  That can be harder to do inline in comments etc.

> >  
> >> +.. c:function:: int hte_release_ts( struct hte_ts_desc *desc )
> >> +		int devm_hte_release_ts( struct device *dev, struct hte_ts_desc *desc )
> >> +
> >> +	The consumer uses API to release specified desc from timestamping.
> >> +	The API frees resources associated with the desc and disables the
> >> +	timestamping on it. The later is managed version of the same API.
> >> +
> >> +.. c:function:: struct hte_ts_desc *of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
> >> +		struct hte_ts_desc *devm_of_hte_request_ts( struct device *dev, const char *label, void (*cb)(enum hte_notify n) )
> >> +
> >> +	The consumers can use above request APIs to request real timestamp
> >> +	capability on specified entity. The later is resource managed version
> >> +	of the of_hte_request_ts API. Both the APIs expect consumer to follow
> >> +	device tree bindings for the HTE consumer. The details about binding
> >> +	is in ``Documentation/devicetree/bindings/hte/hte-consumer.yaml``.
> >> +
> >> +.. c:function:: struct hte_ts_desc *hte_req_ts_by_dt_node( struct device_node *of_node, unsigned int id, void (*cb)(enum hte_notify n) )
> >> +
> >> +	The consumer can request timestamping directly specifying provider
> >> +	device tree node.  
> > When does this make sense?  
> 
> This is needed when provider has dependencies on other IP within chip, for example
> 
> tegra chip GPIO HTE has to talk to GPIO controller to fully enable HTE functionality.

I'd expect that to be done via a device tree handle at the consumer end.  So you'd be
requesting based on your own struct device pointer (and the firmware node
underneath though that would ideally not be visible in this interface).

Similar to how regulator and other provider / consumer firmware description works.

Whilst it's not immediately clear what this would map to in other firmware types, you
should also try to avoid exposing device tree specific interfaces, in favour of
generic ones (see include/property.h)

> 
> >  
> >> +
> >> +.. c:function:: int hte_enable_ts( struct hte_ts_desc *desc )
> >> +.. c:function:: int hte_disable_ts( struct hte_ts_desc *desc )
> >> +
> >> +	The consumer can enable/disable timestamping on given desc.
> >> +
> >> +.. c:function:: int hte_retrieve_ts_ns( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
> >> +		int hte_retrieve_ts_ns_wait( const struct hte_ts_desc *desc, struct hte_ts_data *el, size_t n )
> >> +
> >> +	The consumer uses above two API versions to get/retrieve timestamp data
> >> +	for the given desc. The later is blocking version.
> >> +
> >> +.. c:function:: hte_get_clk_src_info(const struct hte_line_desc *desc, struct hte_clk_info *ci)
> >> +
> >> +	The consumer retrieves clock source information that provider uses to
> >> +	timestamp entity in the structure hte_clk_info. This information
> >> +	specifies clock rate in HZ and clock.
> >> +
> >> +The details on struct hte_clk_info
> >> +-----------------------------------
> >> +This structure presents detail of the hardware clock that provider uses for
> >> +realtime timestamping purposes. The consumer can use hte_get_clk_src_info API
> >> +to get the information in hte_clk_info structure. It has hz and type parameters
> >> +where hz represents clock rate in HZ and type is clock type of clockid_t and
> >> +of CLOCK_* family (for example, CLOCK_MONOTONIC).
> >> +
> >> +The consumers calling of_hte_request_ts or hte_req_ts_by_dt_node APIs with
> >> +cb parameter set, usually will call hte_retrieve_ts (non blocking
> >> +version) after being notified by the callbacks from HTE subsystem. The
> >> +consumers calling those requests APIs with cb parameter NULL, usually will call
> >> +hte_retrieve_ts_wait API.
> >> +
> >> +The HTE subsystem provides software buffer per requested id/entity to store
> >> +timestamp data (struct hte_ts_data type). The consumers can manage the buffer.
> >> +It also provides buffer watermark which can notify (if cb parameter is provided
> >> +during request API call) consumer or unblock consumers calling
> >> +hte_retrieve_ts_wait API. The following APIs are used to manipulate the
> >> +software buffer:  
> > Have you come across any devices that have a hardware fifo for these timestamps?
> > It's moderately common on sensor hubs to do so, and then you get into a fun question
> > of how to manage the watermark.  You don't want to pull from the hardware too early,
> > but conversely you can get out of sync between the software and hardware buffers if
> > someone reasons less than 'watermark' samples from the software buffer.
> >
> > Anyhow, it can be entertaining.  So in those cases it can be simpler to explicitly provide
> > control of two separate watermarks.  
> 
> The provider I have dealt with had single hardware FIFO to store timestamps
> 
> indiscriminately. I am sure this will come up in future in which case we can
> 
> expand it to separate watermark.

Just to check I've understood this correctly.
You do have a hardware fifo and it has a fixed watermark? (perhaps of 1 timestamp?)
If so, indeed one for the future.

> 
> >  
> >> +
> >> +.. c:function:: int hte_set_buf_len( const struct hte_ts_desc *desc,unsigned int len )
> >> +		int hte_get_buf_len( const struct hte_ts_desc *desc )
> >> +
> >> +	The consumer uses above APIs to set/get software buffer depth.  
> > What happens if there is content when it is resized?  
> 
> I have described in the hte_set_buf_len API description. To summarize, you can
> 
> follow certain sequences to consume old data if you still care. Otherwise this
> 
> is a destructive API.

OK.  You might want to think about blocking this from changing if the timestamping
is currently enabled (assuming you don't already!)  Otherwise you tend to get
entertaining race conditions that consumers will need to deal with - probably by
doing the locking at their end.

> 
> >  
> >> +
> >> +.. c:function:: int hte_set_buf_watermark( const struct hte_ts_desc *desc, unsigned int val )
> >> +		int hte_get_buf_watermark( const struct hte_ts_desc *desc )
> >> +
> >> +	The consumer uses above APIs to set/get software threshold, threshold
> >> +	can be used to notity or unblock waiting consumer when data becomes
> >> +	available equal or above to threshold value.
> >> +
> >> +.. c:function:: size_t hte_available_ts( const struct hte_ts_desc *desc )
> >> +
> >> +	The consumer uses above API to get available timestamp data stored
> >> +	in the software buffer for the desc.
> >> +
> >> +The detail about parameters and API usage are described in each functions
> >> +definitions in ``drivers/hte/hte.c`` file.
> >> +
> >> +The HTE timestamp element detail
> >> +--------------------------------
> >> +The struct hte_ts_data, declared at ``include/linux/hte.h``, is used to pass
> >> +timestamp details between the consumers and the providers. It expresses
> >> +timestamp data in nano second in u64 data type.  
> > I'd suggest s64 to match with kernel timestamp format.  
> Make sense, I will update in next revision.
> >  
> >> For now all the HTE APIs
> >> +using struct hte_ts_data requires tsc to be in nano seconds. The timestamp
> >> +element structure stores below information along with timestamp data::
> >> +
> >> + struct hte_ts_data {
> >> +	/*
> >> +	 * Timestamp value
> >> +	 */
> >> +	u64 tsc;
> >> +	/*
> >> +	 * The sequence counter, keep track of the number of timestamps.
> >> +	 * It can be used to check if data is dropped in between.
> >> +	 */  
> > Is this a hardware feature?  A bit unusual to have this rather than simple
> > overflow flag to indicate we dropped an unknown number of samples.  
> Its software feature. I Believe having seq helps consumer to backtrack.

Will be interesting to see how this works out, particularly as I expect you
will get hardware that only tells you it's dropped something, but not how much.
That's what all the sensor hardware with timestamps currently does on overflow
Often you can control if old or new samples are dropped, but either way you will
get a hole of unknown size.

> >  
> >> +	u64 seq;
> >> +	/* Direction of the event, i.e. falling or rising */
> >> +	int dir;  
> > Given an even could do more than that potentially, or indeed not be able to
> > tell if it was rising or falling, I would suggest an enum to which we can add
> > more options as needed.  
> I have two defines in hte.h for now. I can convert them into enum type.

yikes, I should proof read my comments before sending! Glad you figured out what
I meant.  

> >  
> >> + };
> >> +
> >> +The typical hte_ts_data data life cycle::
> >> +In this example the provider provides timestamp in nano seconds and for the
> >> +GPIO line::
> >> +
> >> + - Monitors GPIO line change.
> >> + - Detects the state change on GPIO line.
> >> + - Converts timestamps in nano seconds and stores it in tsc.
> >> + - Stores GPIO direction in dir variable if the provider has that hardware
> >> + capability.  
> > We definitely want to know if it does or not.  How does an application query that?  
> Its stored in dir field of the hte_ts_data structure.

I wasn't clear in this comment.  We need a way to know the hardware does not support
providing the direction and hence the dir field is not valid.  Is there a way to
find that out from a consumer driver?

Thanks,

Jonathan

> >  
> >> + - Pushes this hte_timestamp_el object to HTE subsystem.
> >> + - HTE subsystem increments seq counter and stores it in software buffer
> >> + dedicated to requested GPIO line.  
> > Ah. So that seq counter is only for software drops if the fifo fills up.  
> Yes.
> >  
> >> + - Waiting consumer gets notified.
> >> + - The consumer calls the retrieve timestamp API.
> >> +
> >> +HTE subsystem debugfs attributes
> >> +--------------------------------
> >> +HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
> >> +It also creates line/signal related debugfs attributes at
> >> +``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
> >> +
> >> +`ts_requested`
> >> +		The total number of entities requested from the given provider,
> >> +		where entity is the provider specific and could represent
> >> +		lines, GPIO, chip signals, buses etc...
> >> +                The attribute will be availble at
> >> +		``/sys/kernel/debug/hte/<provider>/``.
> >> +
> >> +		Read only value
> >> +
> >> +`total_ts`
> >> +		The total number of entities supported by the provider.
> >> +                The attribute will be availble at
> >> +		``/sys/kernel/debug/hte/<provider>/``.
> >> +
> >> +		Read only value
> >> +
> >> +`ts_buffer_depth`
> >> +		The software buffer lenth to store timestamp data.
> >> +                The attribute will be availble at
> >> +		``/sys/kernel/debug/hte/<provider>/<label or id>/``.
> >> +
> >> +		Read only value
> >> +
> >> +`ts_buffer_watermark`
> >> +		The software buffer watermark or threshold.
> >> +                The attribute will be availble at
> >> +		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
> >> +
> >> +		Read only value
> >> +
> >> +`dropped_timestamps`
> >> +		The dropped timestamps for a given line.
> >> +                The attribute will be availble at
> >> +		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
> >> +
> >> +		Read only value  

