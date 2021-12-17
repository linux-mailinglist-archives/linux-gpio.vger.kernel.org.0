Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C08478747
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhLQJcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbhLQJcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:32:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEF3C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:32:42 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so2161618pjq.4
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VVPndw7FY2ifBUpQcMIgM86G31cUfhTXnwMHyOFwjb4=;
        b=tvNF/2cEwICH8/dLuBLCJFLBEXF1YmtC9prnrQE7X7mhT98du3wckqRKaLC4PTmAoH
         3EXno2dhxSBs2NuIavByYBaTXwe8IND4C0x4w3050l2gabPvhGHW7R5idhFp5wcWOS/X
         4oWxR0NHkCbSW5C74QOKwMqD7wuhWKxK9JNqgXhDafzcDVzASgMQTNaJhpinSjrhGZGC
         BXKzPXYO+2PwQqEIbI5B1DzZdbuXfZXVuFt9+ghtcYR7vCeBsqRz5+z99Ms92sFbFWcO
         o5B7tGcsz97d+65qUdAI0VqecxDYzyjIZLeZeBldoUU2jb99wSJ2gZmcoK2GAsbCAjme
         hM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VVPndw7FY2ifBUpQcMIgM86G31cUfhTXnwMHyOFwjb4=;
        b=vK967EQvH2+IZCtKHeFdsW1I4agL9JHj1fsphItukzf1Ng9dF6rAjg6GlAe/6UFZqk
         WW631vVArUMAbcMFOZqI7IxfbfVflBjwvCuDE+LVOUrimn+u6rnKiGeLxWfUjijhlVAF
         H6dTpTrUiRYs9cTMLYfQ7xBB8uCC8zXBqS8CwJFlfSvhXW2qbbo1zXrTzPTbmtKCVwD9
         HxqjLJ5iraNvpHdmPZNXO99uRnP0kUVx0Y3UNVjEla2T7mhnwClsP/cfSBGdgw8jAHrC
         pJnpQ/BzhrMrdpwaIFGJL+xA5YsG7T5ZoJlk3pqsnBtIYx8KUQFC5On0dA2uaa7X63aW
         /YkQ==
X-Gm-Message-State: AOAM5332gDYIMAJ7efjO1ezeT+HKia+WXu6rGw/VG8on7wA8zyXOw2rD
        0myvB7jVxFUcmHTCjrNBABhMBw==
X-Google-Smtp-Source: ABdhPJw5sLKPO0m595rZrxZ7zP3acxqqKrWVQmNtIJDOARe67Zv2N/3A8sfCW07+3HfrHiV5HiDHrg==
X-Received: by 2002:a17:90b:1a92:: with SMTP id ng18mr11054672pjb.19.1639733561859;
        Fri, 17 Dec 2021 01:32:41 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id gf4sm7620763pjb.56.2021.12.17.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 01:32:41 -0800 (PST)
Date:   Fri, 17 Dec 2021 15:02:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217093239.to4u5b5zorr2hpee@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
 <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 10:12, Bartosz Golaszewski wrote:
> No, it's a different story altogether. In C the buffer allocates
> memory for events and when you "get" an event, you only have a pointer
> to the memory space in the buffer that you must not free. But you can
> "copy" an event with gpiod_edge_event_copy() which returns you a deep
> copy of the event that will survive the parent and that must be freed
> with gpiod_edge_event_free(). This is done so that by default we try
> to limit the number of allocations (as there can be a lot of events)
> unless the user decides to manually copy the event.
> 
> In C++ I used that mechanism together with the buffer's const
> event_get() and event's copy assignment operator. "Getting" an event
> returns a const reference to the event (still in buffer's memory) but
> copying it triggers a deep copy. The memory management is of course
> handled by the destructor.
> 
> This is not used in Python as speed is no longer a concern and we'd be
> creating new python objects anyway. But in Rust, I think it makes
> sense to reuse this mechanism.

Ahh, what about this then, it just caches all the values when the event is
requested ?

pub struct EdgeEvent {
    event_type: LineEdgeEvent,
    timestamp: Duration,
    line_offset: u32,
    global_seqno: u64,
    line_seqno: u64,
}

impl EdgeEvent {
    /// Get an event stored in the buffer.
    pub fn new(buffer: &EdgeEventBuffer, index: u64) -> Result<Self> {
        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
        if event.is_null() {
            return Err(Error::OperationFailed(
                "Gpio EdgeEvent buffer-get-event",
                IoError::last(),
            ));
        }

        Ok(Self {
            event_type: LineEdgeEvent::new(unsafe {
                bindings::gpiod_edge_event_get_event_type(event)
            } as u32)?,

            timestamp: Duration::from_nanos(unsafe {
                bindings::gpiod_edge_event_get_timestamp(event)
            }),

            line_offset: unsafe { bindings::gpiod_edge_event_get_line_offset(event) },
            global_seqno: unsafe { bindings::gpiod_edge_event_get_global_seqno(event) },
            line_seqno: unsafe { bindings::gpiod_edge_event_get_line_seqno(event) },
        })
    }

    /// Get the event type.
    pub fn get_event_type(&self) -> LineEdgeEvent {
        self.event_type
    }

    /// Get the timestamp of the event.
    pub fn get_timestamp(&self) -> Duration {
        self.timestamp
    }

    /// Get the offset of the line on which the event was triggered.
    pub fn get_line_offset(&self) -> u32 {
        self.line_offset
    }

    /// Get the global sequence number of this event.
    ///
    /// Returns sequence number of the event relative to all lines in the
    /// associated line request.
    pub fn get_global_seqno(&self) -> u64 {
        self.global_seqno
    }

    /// Get the event sequence number specific to concerned line.
    ///
    /// Returns sequence number of the event relative to this line within the
    /// lifetime of the associated line request.
    pub fn get_line_seqno(&self) -> u64 {
        self.line_seqno
    }
}

-- 
viresh
