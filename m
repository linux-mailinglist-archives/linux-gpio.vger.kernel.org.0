Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3B845E415
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357491AbhKZBg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhKZBe5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:34:57 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151D4C061756;
        Thu, 25 Nov 2021 17:31:45 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id iq11so6180257pjb.3;
        Thu, 25 Nov 2021 17:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XthcFlmkOECs3jh3x2DS27zqQTYI0OwqkcCX41zDGBk=;
        b=gX4qfVAvlrDhh3IPUoxGah0KF89JMKwRzJ+DfOg5wXtU+cDvYFbRJWNjTgbWncZv2R
         5v+lx7mWMI20E2VSM2NjdtWF7m3FjOstQJmLXwn92NnTHFiK8sI+e2e9tBWs1UHb5X6X
         vTTcwPz1UNlNwFteQ6hWNYX3un5VUhqSacZvUJZFOiXs/VsGA5hpfYfNVbS7uqJR6M6d
         t9z4ODzaUDR42oxAaPF9YDlNDLND6OC2zj+zPJZk5BT2kAivKKF9O+RzcvbQ3AdCBFct
         wbA0PaTjrTwQ7nqDf3VZSmRJbCx+F2q7RbPHBLrKlz+pbGUskFR806M1RHtlQHshDoTI
         udFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XthcFlmkOECs3jh3x2DS27zqQTYI0OwqkcCX41zDGBk=;
        b=eOED+WJlMZQ/+HRPSM7jsv3M8dOygD+24bojkz2EsA3OlSTlH+i/QhSKek+TApSic+
         QvcFz1PhvQSPhSDfag6QNkkd8HUwBt2yyLUwNBc+pteIlh0myPbFADiHLmAxO9vS7BGg
         WJnXCw+aFh+3U2VYla96+p0Wqctvu6GyqGNu9GWZLMcwyDadgq340PfQYByjpxdsb8Vs
         NOFszWSo8ftiPL4UL2iPnuUJ6x70eefsp6sUu/eA/kfCXIwV7M3VTVQRdRFqekjsu8Un
         6rSXTRgdNEM4MitCcJvxvJ8VUrQR0kcRh8XuM3Q3ZTsNKFexMU+qWb8E87rI6Jcc12v4
         CwcA==
X-Gm-Message-State: AOAM530OPOI2IM36WU1DTs6/opy++qvJBE0XGr8mZ4l8HgauuGmxBy4j
        98ndyRBsw0tHwofqTV9krMg=
X-Google-Smtp-Source: ABdhPJyWbhARKJJGw04SVAzMCwQEAdphZl4Rcc5YE+p6FPdNmMmC7b36KzLWvTjpXBq/z4hiAlcoZg==
X-Received: by 2002:a17:90b:20d:: with SMTP id fy13mr12000853pjb.47.1637890304397;
        Thu, 25 Nov 2021 17:31:44 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id d7sm5049807pfj.91.2021.11.25.17.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 17:31:43 -0800 (PST)
Date:   Fri, 26 Nov 2021 09:31:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC v3 09/12] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <20211126013137.GC10380@sol>
References: <20211123193039.25154-1-dipenp@nvidia.com>
 <20211123193039.25154-10-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123193039.25154-10-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 11:30:36AM -0800, Dipen Patel wrote:
> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines in realtime using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, the HTE subsystem pushes timestamp data
> through callbacks.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - Added hte_dir and static structure hte_ts_desc.
> - Added callbacks which get invoked by HTE when new data is available.
> - Better use of hte_dir and seq from hte_ts_desc.
> - Modified sw debounce function to accommodate hardware timestamping.
> 
>  drivers/gpio/gpiolib-cdev.c | 161 ++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/gpio.h   |   1 +
>  2 files changed, 153 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index c7b5446d01fd..1736ad54e3ec 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -464,6 +464,12 @@ struct line {
>  	 * stale value.
>  	 */
>  	unsigned int level;
> +	/*
> +	 * dir will be touched in HTE callbacks hte_ts_cb_t and
> +	 * hte_ts_threaded_cb_t and they are mutually exclusive. This will be
> +	 * unused when HTE is not supported/disabled.
> +	 */
> +	enum hte_dir dir;
>  };
>  

Documentation should be in present tense, so 

s/will be/is/g

Same applies to other patches.

Also

s/touched/accessed/

dir is a poor name for the field.  It is the hte edge direction and
effectively the line level, so call it hte_edge_dirn or
hte_edge_direction or hte_level.

And it is placed in a section of the struct documented as "debouncer specific
fields", but it is not specfic to the debouncer.  Add a "hte specific
fields" section if nothing else is suitable.

>  /**
> @@ -518,6 +524,7 @@ struct linereq {
>  	 GPIO_V2_LINE_DRIVE_FLAGS | \
>  	 GPIO_V2_LINE_EDGE_FLAGS | \
>  	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>  	 GPIO_V2_LINE_BIAS_FLAGS)
>  

>  static void linereq_put_event(struct linereq *lr,
> @@ -546,6 +553,94 @@ static u64 line_event_timestamp(struct line *line)
>  	return ktime_get_ns();
>  }
>  
> +static hte_return_t process_hw_ts_thread(void *p)
> +{
> +	struct line *line = p;
> +	struct linereq *lr = line->req;
> +	struct gpio_v2_line_event le;
> +	u64 eflags;
> +
> +	memset(&le, 0, sizeof(le));
> +
> +	le.timestamp_ns = line->timestamp_ns;
> +	line->timestamp_ns = 0;
> +

What is the purpose of this zeroing?

> +	if (line->dir >= HTE_DIR_NOSUPP) {
> +		eflags = READ_ONCE(line->eflags);
> +		if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
> +			int level = gpiod_get_value_cansleep(line->desc);
> +
> +			if (level)
> +				/* Emit low-to-high event */
> +				le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +			else
> +				/* Emit high-to-low event */
> +				le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
> +			/* Emit low-to-high event */
> +			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
> +			/* Emit high-to-low event */
> +			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +		} else {
> +			return HTE_CB_ERROR;
> +		}
> +	} else {
> +		if (line->dir == HTE_RISING_EDGE_TS)
> +			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +		else
> +			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +	}

The mapping from line->dir to le.id needs to take into account the active
low setting for the line.

And it might be simpler if the hte_ts_data provided the level, equivalent
to gpiod_get_raw_value_cansleep(), rather than an edge direction, so you
can provide a common helper to determine the edge given the raw level.

> +
> +	le.line_seqno = line->line_seqno;
> +	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
> +	le.offset = gpio_chip_hwgpio(line->desc);
> +
> +	linereq_put_event(lr, &le);
> +
> +	return HTE_CB_HANDLED;
> +}
> +
> +static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
> +{
> +	struct line *line = p;
> +	struct linereq *lr = line->req;
> +
> +	if (!ts)
> +		return HTE_CB_ERROR;
> +
> +	line->timestamp_ns = ts->tsc;
> +	line->dir = ts->dir;
> +

The doc for timestamp_ns states:

	 * timestamp_ns and req_seqno are accessed only by
	 * edge_irq_handler() and edge_irq_thread(), which are themselves
	 * mutually exclusive, so no additional protection is necessary.

That no longer holds.  It is now also accessed here, and in
process_hw_ts_thread(), which wont run concurrently with each other or
the edge_irq_* handlers, but also in debounce_work_func() which may run
concurrently with the others.
So timestamp_ns now requires protection from concurrent access.

> +	/*
> +	 * It is possible that HTE engine detects spurious edges for the
> +	 * lines where software debounce is enabled. This primary callback
> +	 * will be called multiple times in that case. It will be better to
> +	 * let debounce_work_func handle instead of process_hw_ts_thread.
> +	 * The timestamp_ns will be overwritten here which is fine as we are
> +	 * interested in the last value anyway. The debounce_work_func will
> +	 * then just read whatever last line->timestamp_ns is stored. Because
> +	 * this callback can be called multiple times, we are not really
> +	 * interested in ts->seq.
> +	 */

Not sure what this is trying to say.
Is this the primary callback? Or debounce_irq_handler()?
You say you really aren't interested in ts->seq, but the code immediately
uses it.

Reword to clarify.
And add braces after function names to highlight them, so
debounce_work_func().

> +	if (!READ_ONCE(line->sw_debounced)) {
> +		line->line_seqno = ts->seq;
> +
> +		/*
> +		 * Increment in this callback incase all the lines in linereq
> +		 * are enabled for hw timestamping. This will work even if
> +		 * subset of lines are enabled for hw timestamping as
> +		 * edge_irq_* callbacks will proceed as usual for them.
> +		 */

s/incase/in case/

Not sure what the comment is trying to say. There is no check here that
the other lines have HTE enabled.  And that is not relevant anyway.
The edge_irq_* handlers will proceed as usual for those lines NOT
enabled for hw timestamping.

To clarify, the line_seqno indicates where this event lies in the
sequence of events for the line.
The request seqno indicates where this event lines in the sequence of
events for the request.
For a single line request these are the same, hence the minor
optimisation of not updating lr->seqno below.

> +		if (lr->num_lines != 1)
> +			line->req_seqno = atomic_inc_return(&lr->seqno);
> +

The req_seqno should be updated corresponding to the change in the
line_reqno.  That always used to be 1, but no longer if hte can discard
events, i.e. skip over line_seqnos.
To be consistent, i.e. if events were lost for this line then they were
also lost for the requested lines, the lr->seqno should be incremented by
the change in line_seqno.  Probably with some sanity checks.

> +		return HTE_RUN_THREADED_CB;
> +	}
> +
> +	return HTE_CB_HANDLED;
> +}
> +
>  static irqreturn_t edge_irq_thread(int irq, void *p)
>  {
>  	struct line *line = p;
> @@ -553,6 +648,10 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
>  	struct gpio_v2_line_event le;
>  	u64 eflags;
>  
> +	/* Let process_hw_ts_thread handle */
> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags))
> +		return IRQ_HANDLED;
> +

This adds pointless runtime overhead, and for everyone not just hte users.
Don't stub out a handler in the handler - stub it out where it is
registered by registering a stub handler.  Or don't request it at all.

So why would gpiolib-cdev be requesting the irq, only to stub out
the handlers?
If that has a side-effect that hte requires then hte should be taking
care of it - it is not gpiolib-cdev's problem.

And speaking as to how the whole hte/gpiolib-cdev interface should work,
hte should be an edge event generator alternative to irq.  So lines with
hte enabled should work without any irq calls from gpiolib-cdev.
That includes the sw debouncer - more on that below.

>  	/* Do not leak kernel stack to userspace */
>  	memset(&le, 0, sizeof(le));
>  
> @@ -604,6 +703,10 @@ static irqreturn_t edge_irq_handler(int irq, void *p)
>  	struct line *line = p;
>  	struct linereq *lr = line->req;
>  
> +	/* Let HTE supplied callbacks handle */
> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags))
> +		return IRQ_HANDLED;
> +
>  	/*
>  	 * Just store the timestamp in hardirq context so we get it as
>  	 * close in time as possible to the actual event.
> @@ -682,14 +785,6 @@ static void debounce_work_func(struct work_struct *work)
>  	/* Do not leak kernel stack to userspace */
>  	memset(&le, 0, sizeof(le));
>  
> -	lr = line->req;
> -	le.timestamp_ns = line_event_timestamp(line);
> -	le.offset = gpio_chip_hwgpio(line->desc);
> -	line->line_seqno++;
> -	le.line_seqno = line->line_seqno;
> -	le.seqno = (lr->num_lines == 1) ?
> -		le.line_seqno : atomic_inc_return(&lr->seqno);
> -
>  	if (level)
>  		/* Emit low-to-high event */
>  		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> @@ -697,6 +792,23 @@ static void debounce_work_func(struct work_struct *work)
>  		/* Emit high-to-low event */
>  		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
>  
> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
> +		le.timestamp_ns = line->timestamp_ns;
> +		if (line->dir < HTE_DIR_NOSUPP)
> +			le.id = (line->dir == HTE_RISING_EDGE_TS) ?
> +				 GPIO_V2_LINE_EVENT_RISING_EDGE :
> +				 GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +	} else {
> +		le.timestamp_ns = line_event_timestamp(line);
> +	}
> +

Move the FLAG_EVENT_CLOCK_HARDWARE check into line_event_timestamp().

And the id fudging is necessary because the level returned by
gpiod_get_raw_value_cansleep() can disagree with the level from hte?
So you are still trying to synchronise events from two streams.
And that is still broken.
If a hte event occurs between the level being sampled by
gpiod_get_raw_value_cansleep() and the line->dir being read then the line
will have toggled and you will be reporting the opposite state than the
one the debouncer determined was stable.  And maybe the wrong timestamp as
well.

For lines where hte is enabled, the hte should be the source of level for
the debouncer, not the raw value.  And the mod_delayed_work() that
drives the debouncer should be called by a hte handler, not an irq handler.

There is also a race on reading the hte timestamp (line->timestamp_ns) and
the hte level (line->dir), such that you can get the level from one event
the timestamp from another.

> +	lr = line->req;
> +	le.offset = gpio_chip_hwgpio(line->desc);
> +	line->line_seqno++;
> +	le.line_seqno = line->line_seqno;
> +	le.seqno = (lr->num_lines == 1) ?
> +		le.line_seqno : atomic_inc_return(&lr->seqno);
> +

What is the purpose of moving this block of code moved from before the
if (level)?


>  	linereq_put_event(lr, &le);
>  }
>  
> @@ -891,7 +1003,6 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  	/* Return an error if an unknown flag is set */
>  	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
>  		return -EINVAL;
> -

Gratuitous whitespace change.

>  	/*
>  	 * Do not allow both INPUT and OUTPUT flags to be set as they are
>  	 * contradictory.
> @@ -900,6 +1011,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
>  		return -EINVAL;
>  
> +	/* Only allow one event clock source */
> +	if ((flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME) &&
> +	    (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE))
> +		return -EINVAL;
> +
>  	/* Edge detection requires explicit input. */
>  	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
>  	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
> @@ -992,6 +1108,8 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
>  
>  	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
>  		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
> +	assign_bit(FLAG_EVENT_CLOCK_HARDWARE, flagsp,
> +		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE);
>  }
>  
>  static long linereq_get_values(struct linereq *lr, void __user *ip)
> @@ -1154,6 +1272,21 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>  				return ret;
>  		}
>  
> +		/* Check if new config sets hardware assisted clock */
> +		if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> +			ret = gpiod_req_hw_timestamp_ns(desc, process_hw_ts,
> +							process_hw_ts_thread,
> +							&lr->lines[i]);
> +			if (ret)
> +				return ret;

Note that the line config is the complete line config, not a delta.

What happens when a line that already has hte enabled is reconfigured
and still has hte enabled?  i.e. what happens when
gpiod_req_hw_timestamp_ns() is called for the second time?

You provide a comment for the release case below, what of the request
case?

If you need to check for change then compare the old and new flags, as
the polarity_change check does (not visible in the diff here).

> +		} else {
> +			/*
> +			 * HTE subsys will do nothing if there is nothing to
> +			 * release.
> +			 */
> +			gpiod_rel_hw_timestamp_ns(desc);
> +		}
> +

Comment will fit on one line.

And it would be better to document that the function is idempotent in the
function documentation, not everywhere it is used.

>  		blocking_notifier_call_chain(&desc->gdev->notifier,
>  					     GPIO_V2_LINE_CHANGED_CONFIG,
>  					     desc);
> @@ -1409,6 +1542,14 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  					flags & GPIO_V2_LINE_EDGE_FLAGS);
>  			if (ret)
>  				goto out_free_linereq;
> +
> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> +				ret = gpiod_req_hw_timestamp_ns(desc, process_hw_ts,
> +							process_hw_ts_thread,
> +							&lr->lines[i]);
> +				if (ret)
> +					goto out_free_linereq;
> +			}
>  		}
>  
>  		blocking_notifier_call_chain(&desc->gdev->notifier,
> @@ -1959,6 +2100,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  
>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
>  		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
> +	else if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &desc->flags))
> +		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
>  
>  	debounce_period_us = READ_ONCE(desc->debounce_period_us);
>  	if (debounce_period_us) {
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index eaaea3d8e6b4..d360545b4c21 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
>  	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
>  	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
>  	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
> +	GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE	= _BITULL(12),
>  };
>  

I'm now thinking this name, "HARDWARE" is too vague, in case other
timestamp source alternatives join the fray, and so should be "HTE".

Cheers,
Kent.
