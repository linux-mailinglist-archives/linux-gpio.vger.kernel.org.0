Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7BC6163A7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 14:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiKBNR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 09:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbiKBNRE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 09:17:04 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3286D2AE10
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 06:16:37 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id b21so674917plc.9
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BpBZPi0glapORouRAMWPayEKktSaqEn9HY7MaIx3h7U=;
        b=Gha9+o3ritqT/wF4JAQ74U/SNwkO4OjP/kgVZlF7IUcl9sJYtDvsnAYUOjJf6Hy4jQ
         IMN+1tz1XPDQnkAgW2mApNUfiwf1C6TPsxMKNtdpeKsl0hciqJ4Sif/j2z9MGo2c5PPk
         NucmA0jccrMdx4OfnCDP6cEQTIbxMQDhKK19FY9cEn5zThEDGVOf6kN4iH3Dt70K3m7v
         i1neE+He/4PCF8CD5XYdnA2lyNyQUKIwPir8TSKaJWWZoOgX22t3qMJAmREMx+ZJOIk1
         NqCIdvfeXYOgHhYTzO5Zg4DyO4KAORJZOxC9c5ZHDTCCqZBVpOXXDExS5l8XNe8dAz6L
         mxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpBZPi0glapORouRAMWPayEKktSaqEn9HY7MaIx3h7U=;
        b=HUrzYNjnnemaNxnIxTlm5ImW3s6rBis939MnQ3Fb5MhkPW/9ya9kGAYMgDrC/2Liq8
         PPvbDTTn+NPvRSXYGDGt5qAg6uh2o4vPvzgk4JjqKg4hmUjF5QjPl7NYk3WEM80u1+6h
         EPXeX0smxyvaIK7fnRkaE8oTdyohKKsXAtgYyN2IYh41M0j4b2WqXjoLUTgjkikgd+I4
         G8zclAsmuFzMIpAjA0k3xTTsRk3qra/ylFFym6VawUdL1lHQPEAe80cSD7EaAsCo2lJ8
         v5u9jj1njHt6gD8Q41mmRMQaGorVA9GT7FSW+HsGdL+vBEm/dz+o2AHymIeq4Tc3qFPq
         D2Uw==
X-Gm-Message-State: ACrzQf0LRIFyMEQSnDinXA3qLn6qi+x/JeH6mGozLsn6X3AQ7Wxd9p2d
        kXIPWJPXaI3fdeSO2Iosiyw=
X-Google-Smtp-Source: AMsMyM67PJvlTda7XWF8TureN7iyqsiwzTFFYKifGXoVZ73guFVLgMIfTRFV5IEKLhf+cQ0IhV3qIw==
X-Received: by 2002:a17:90b:153:b0:213:b853:5db1 with SMTP id em19-20020a17090b015300b00213b8535db1mr22787477pjb.168.1667394994875;
        Wed, 02 Nov 2022 06:16:34 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b00176d347e9a7sm8363753plg.233.2022.11.02.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:16:34 -0700 (PDT)
Date:   Wed, 2 Nov 2022 21:16:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod v2][PATCH V8 9/9] bindings: rust: Implement iterator
 for edge events
Message-ID: <Y2JtqgmRu9fYXiag@sol>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2022 at 05:17:17PM +0530, Viresh Kumar wrote:
> It would be much more convenient for the user to iterate over the events
> in the Rust idiomatic way (i.e. "for event in events"), instead of
> indexing into the vector.
> 
> This also lets us drop the hard requirement of explicitly dropping the
> event before reading new events from the buffer again.
> 
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

It is generally frowned upon to patch your own patch within the same
series, so drop the Suggested-by and squash this into patch 5.
In this instance it is very handy for reviewing though, as the other
patches look pretty clean to me...

> ---
>  .../rust/libgpiod/examples/gpio_events.rs     |  47 +++----
>  bindings/rust/libgpiod/examples/gpiomon.rs    |   5 +-
>  bindings/rust/libgpiod/src/edge_event.rs      |  56 +++------
>  bindings/rust/libgpiod/src/event_buffer.rs    | 119 ++++++++++++++----
>  bindings/rust/libgpiod/src/lib.rs             |   2 +
>  bindings/rust/libgpiod/src/line_request.rs    |   5 +-
>  bindings/rust/libgpiod/tests/edge_event.rs    |  47 ++++---
>  7 files changed, 172 insertions(+), 109 deletions(-)
> 
> diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
> index 77a7d2a5faa1..57dd5b4db546 100644
> --- a/bindings/rust/libgpiod/examples/gpio_events.rs
> +++ b/bindings/rust/libgpiod/examples/gpio_events.rs
> @@ -59,30 +59,31 @@ fn main() -> Result<()> {
>              Ok(true) => (),
>          }
>  
> -        let count = request.read_edge_events(&mut buffer)?;
> -        if count == 1 {
> -            let event = buffer.event(0)?;
> -            let cloned_event = request::Event::event_clone(&event)?;
> -
> -            // This is required before reading events again into the buffer.
> -            drop(event);
> +        let events = request.read_edge_events(&mut buffer)?;
> +        for event in events {
> +            let cloned_event = request::Event::event_clone(event)?;
> +            println!(
> +                "line: {} type: {:?}, time: {:?}",
> +                cloned_event.line_offset(),
> +                cloned_event.event_type(),
> +                cloned_event.timestamp()
> +            );
> +            println!(
> +                "line: {} type: {:?}, time: {:?}",
> +                event.line_offset(),
> +                event.event_type(),
> +                event.timestamp()
> +            );
> +        }

This is based on my example code, right?

So this:
        let mut events = request.read_edge_events(&mut buffer)?;
        let event = events.event(0)?;
        let cloned_event = event.event_clone()?;
        events = request.read_edge_events(&mut buffer)?;
        let event = events.event(0)?;
        println!(
            "line: {} type: {:?}, time: {:?}",
            cloned_event.line_offset(),
            cloned_event.event_type(),
            cloned_event.timestamp()
        );
        println!(
            "line: {} type: {:?}, time: {:?}",
            event.line_offset(),
            event.event_type(),
            event.timestamp()
        );

The purpose of that was to demonstrate that the cloned event can out live
the original event - including across a read_edge_events().
This adaptation to the iterator misses that point.

You could use the iterator next() to return an event, rather than
looping over all of them.  Then do another read and get another event,
as per my example code.

Might be good to add some more comments as to what is being demonstrated
too, so we don't forget.

>  
> -            let count = request.read_edge_events(&mut buffer)?;
> -            if count == 1 {
> -                let event = buffer.event(0)?;
> -                println!(
> -                    "line: {} type: {:?}, time: {:?}",
> -                    cloned_event.line_offset(),
> -                    cloned_event.event_type(),
> -                    cloned_event.timestamp()
> -                );
> -                println!(
> -                    "line: {} type: {:?}, time: {:?}",
> -                    event.line_offset(),
> -                    event.event_type(),
> -                    event.timestamp()
> -                );
> -            }
> +        let events = request.read_edge_events(&mut buffer)?;
> +        for event in events {
> +            println!(
> +                "line: {} type: {:?}, time: {:?}",
> +                event.line_offset(),
> +                event.event_type(),
> +                event.timestamp()
> +            );
>          }
>      }
>  }
> diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
> index a03ea31dfd53..4dea5d1c8dd7 100644
> --- a/bindings/rust/libgpiod/examples/gpiomon.rs
> +++ b/bindings/rust/libgpiod/examples/gpiomon.rs
> @@ -58,9 +58,8 @@ fn main() -> Result<()> {
>              Ok(true) => (),
>          }
>  
> -        let count = request.read_edge_events(&mut buffer)?;
> -        if count == 1 {
> -            let event = buffer.event(0)?;
> +        let events = request.read_edge_events(&mut buffer)?;
> +        for event in events {
>              println!(
>                  "line: {} type: {}, time: {:?}",
>                  event.line_offset(),
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
> index 95b05e947d26..dc71efcb2396 100644
> --- a/bindings/rust/libgpiod/src/edge_event.rs
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -8,7 +8,6 @@ use std::time::Duration;
>  use super::{
>      gpiod,
>      line::{EdgeKind, Offset},
> -    request::Buffer,
>      Error, OperationType, Result,
>  };
>  
> @@ -24,29 +23,33 @@ use super::{
>  /// number of events are being read.
>  
>  #[derive(Debug, Eq, PartialEq)]
> -pub struct Event<'b> {
> -    buffer: Option<&'b Buffer>,
> -    event: *mut gpiod::gpiod_edge_event,
> +pub struct Event {
> +    pub(crate) event: *mut gpiod::gpiod_edge_event,
> +    pub(crate) cloned: bool,
>  }
>  

This can be simplified to a newtype:

pub struct Event(*mut gpiod::gpiod_edge_event);

see Buffer/Events below for more details....

Note that the cloned flag is not required.  The only Events that CAN be
dropped are those returned by event_clone().  The others are now returned
by ref and so CANNOT be dropped - from the Rust PoV they are owned by the
container that they are borrowed from.

> -impl<'b> Event<'b> {
> +impl Event {
>      /// Get an event stored in the buffer.
> -    pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event<'b>> {
> -        // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
> -        // as the `struct Event`.
> -        let event = unsafe {
> -            gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer, index.try_into().unwrap())
> -        };
> +    pub(crate) fn new(event: *mut gpiod::gpiod_edge_event) -> Event {
> +        Self {
> +            event,
> +            cloned: false,
> +        }
> +    }
> +
> +    pub fn event_clone(event: &Event) -> Result<Event> {
> +        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> +        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
>          if event.is_null() {
>              return Err(Error::OperationFailed(
> -                OperationType::EdgeEventBufferGetEvent,
> +                OperationType::EdgeEventCopy,
>                  errno::errno(),
>              ));
>          }
>  
>          Ok(Self {
> -            buffer: Some(buffer),
>              event,
> +            cloned: true,
>          })
>      }
>  
> @@ -95,32 +98,11 @@ impl<'b> Event<'b> {
>      }
>  }
>  
> -impl<'e, 'b> Event<'e> {
> -    pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
> -    where
> -        'e: 'b,
> -    {
> -        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
> -        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
> -        if event.is_null() {
> -            return Err(Error::OperationFailed(
> -                OperationType::EdgeEventCopy,
> -                errno::errno(),
> -            ));
> -        }
> -
> -        Ok(Self {
> -            buffer: None,
> -            event,
> -        })
> -    }
> -}
> -
> -impl<'b> Drop for Event<'b> {
> +impl Drop for Event {
>      /// Free the edge event.
>      fn drop(&mut self) {
> -        // Free the event only if a copy is made
> -        if self.buffer.is_none() {
> +        // Only free the cloned event, others are freed with the buffer.
> +        if self.cloned {
>              // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
>              unsafe { gpiod::gpiod_edge_event_free(self.event) };
>          }
> diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
> index 16d7022034df..d1bfac54070c 100644
> --- a/bindings/rust/libgpiod/src/event_buffer.rs
> +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> @@ -4,14 +4,74 @@
>  //     Viresh Kumar <viresh.kumar@linaro.org>
>  
>  use std::os::raw::c_ulong;
> +use std::ptr;
>  
> -use super::{gpiod, request, Error, OperationType, Result};
> +use super::{
> +    gpiod,
> +    request::{Event, Request},
> +    Error, OperationType, Result,
> +};
> +
> +pub struct Events<'a> {
> +    buffer: &'a mut Buffer,
> +    events: Vec<&'a Event>,
> +    index: usize,
> +}
> +

Events is pub but not documented.

The events attribute is expensive - requiring a dynamic allocation for
each snapshot.  And you create it unsized and push into it, which could
require resizing and reallocation.
And it is unnecessary - just have Events iterate over the appropriate
indicies and get the ref from the buffer.

The "index" field name is vague.  Perhaps read_index?

And event_count moves here from Buffer - and can be used to terminate
the iterator when read_index == event_count - rather than removing
objects from events until it is empty.

> +impl<'a> Events<'a> {
> +    pub fn new(buffer: &'a mut Buffer, len: usize) -> Self {
> +        let mut events = Vec::new();
> +
> +        for i in 0..len {
> +            // SAFETY: We could have simply pushed the reference of the event to the events vector
> +            // here, but that causes a build error as buffer is borrowed as both mutable and
> +            // immutable. Instead of a reference, perform unsafe pointer magic to do the same
> +            // thing. It is safe as the events buffer will always outlive Events and the reference
> +            // will always be valid.
> +            events.push(unsafe {
> +                (buffer.events.as_ptr().add(i) as *const Event)
> +                    .as_ref()
> +                    .unwrap()
> +            });
> +        }
> +
> +        Self {
> +            buffer,
> +            events,
> +            index: 0,
> +        }
> +    }
> +
> +    /// Get the number of events the buffer contains.

Mentioning "buffer" is confusing.
Make it "Get the number of contained events."

Does this change as events are read by the iterator, so the number left,
or is it locked to the size of the snapshot?

> +    pub fn len(&self) -> usize {
> +        self.events.len()
> +    }
> +
> +    /// Check if buffer is empty.
> +    pub fn is_empty(&self) -> bool {
> +        self.events.is_empty()
> +    }
> +}
> +
> +impl<'a> Iterator for Events<'a> {
> +    type Item = &'a Event;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.events.is_empty() || self.buffer.update_event(self.index).is_err() {
> +            return None;
> +        }
> +

So an error reading an event will quietly terminate the iterator?

> +        self.index += 1;
> +        Some(self.events.remove(0))
> +    }
> +}
>  

Still provide a get by index, so the caller has the option to
use the iterator, or to iterate over indicies?

Else why provide the len()?

I'm fine either way, but it seems a bit odd to me as it stands.

>  /// Line edge events buffer
>  #[derive(Debug, Eq, PartialEq)]
>  pub struct Buffer {
>      pub(crate) buffer: *mut gpiod::gpiod_edge_event_buffer,
> -    event_count: usize,
> +    events: Vec<Event>,
> +    capacity: usize,
>  }
>  

This can be simplified to:

pub struct Buffer {
    buffer: *mut gpiod::gpiod_edge_event_buffer,
    events: Vec<*mut gpiod::gpiod_edge_event>,
}

Storing a raw pointer here, rather than Event, so Buffer is simply the
container for the raw C objects.  The raw pointer can readily be
converted into an Event ref, as the Event is now just a newtype based
on that raw pointer.

The capacity is redundant - events.len().
The event_count should be part of the struct Events.

>  impl Buffer {
> @@ -30,22 +90,32 @@ impl Buffer {
>              ));
>          }
>  
> +        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
> +        let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
> +        let mut events = Vec::new();
> +        events.resize_with(capacity, || Event::new(ptr::null_mut()));
> +
>          Ok(Self {
>              buffer,
> -            event_count: 0,
> +            events,
> +            capacity,
>          })
>      }
>  
> -    /// Get a number of edge events from a line request.
> +    /// Get edge events from a line request.
>      ///
>      /// This function will block if no event was queued for the line.
> -    pub fn read_edge_events(&mut self, request: &request::Request) -> Result<u32> {
> +    pub fn read_edge_events(&mut self, request: &Request) -> Result<Events> {
> +        for i in 0..self.events.len() {
> +            self.events[i].event = ptr::null_mut();
> +        }
> +
>          // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
>          let ret = unsafe {
>              gpiod::gpiod_line_request_read_edge_event(
>                  request.request,
>                  self.buffer,
> -                self.capacity().try_into().unwrap(),
> +                self.capacity.try_into().unwrap(),
>              )
>          };
>  
> @@ -55,30 +125,37 @@ impl Buffer {
>                  errno::errno(),
>              ))
>          } else {
> -            // Set count of events read in the buffer
> -            self.set_event_count(ret as usize);
> -            Ok(ret as u32)
> -        }
> -    }
> +            let ret = ret as usize;
>  
> -    /// Set the number of events read into the event buffer.
> -    pub(crate) fn set_event_count(&mut self, count: usize) {
> -        self.event_count = count
> +            if ret > self.capacity {
> +                Err(Error::TooManyEvents(ret, self.capacity))
> +            } else {
> +                Ok(Events::new(self, ret))
> +            }
> +        }
>      }
>  
>      /// Get the capacity of the event buffer.
>      pub fn capacity(&self) -> usize {
> -        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
> -        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer) as usize }
> +        self.capacity
>      }
>  
>      /// Read an event stored in the buffer.
> -    pub fn event(&self, index: usize) -> Result<request::Event> {
> -        if index >= self.event_count {
> -            Err(Error::InvalidArguments)
> -        } else {
> -            request::Event::new(self, index)
> +    fn update_event(&mut self, index: usize) -> Result<()> {
> +        // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
> +        // as the `struct Event`.
> +        let event = unsafe {
> +            gpiod::gpiod_edge_event_buffer_get_event(self.buffer, index.try_into().unwrap())
> +        };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::EdgeEventBufferGetEvent,
> +                errno::errno(),
> +            ));
>          }
> +
> +        self.events[index].event = event;
> +        Ok(())
>      }

Change update_event() to:

fn event(&self, index: usize) -> Result<&Event>

and Events should use that to get the ref for the event.
(the iterator will then have to return Option<Result<&Event>>, so some
additional unwrapping, but it doesn't hide errors from the caller.)


I've updated my mods branch[1] with some of those changes, if that is
any clearer.  Sorry, that is still based on v7, so no Events iterator etc,
but hopefully the description above is sufficient.
If not let me know and I'll try to rebase it to v8.

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod/commit/d77d8b2a89ad4fbfde2070f827aa0dc007f1a92f
