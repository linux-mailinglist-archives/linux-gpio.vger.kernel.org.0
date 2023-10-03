Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D0E7B6614
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 12:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239808AbjJCKHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 06:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239852AbjJCKHO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 06:07:14 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7F4B4
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 03:07:09 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf55a81eeaso5539495ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696327628; x=1696932428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNvBLlYUm6fbAH0gnXRE1jjPoaWdAgzeOUmYqwxJc1A=;
        b=f/VuyLFOG9uYj9+7e6tX8gryVd0QMRh6FQL2im3OjDhcb8XbRpGMJ/keOKn74QAR55
         J1UrZfMbmWjWIvco74ifBUfiYGRdgZBSgMMztdcFDFBBjFVGMzeihRlL3DUpMIjXl/ms
         D7SGyoVrppcz5SeC8GIoBpxoDMi3sG7xBwBwznGF0AhMvZZAdTpygOUU8pBebrcPUGLJ
         +mw3WZAnmrhDLU0JoP3iHmxnyUwLAlSuRXobkj93cDjZn/LQDSSqiqnEKlvKl3iaNFrC
         wL/GhFnywMSCsMDmHWGqGh2WtHFjG7Xz2mB/DLEjTVi0vZ6Rzmpiespti0ZYhdHrox9t
         +kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327628; x=1696932428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNvBLlYUm6fbAH0gnXRE1jjPoaWdAgzeOUmYqwxJc1A=;
        b=TRk45RFX5bPozaHLuc4nTTkqpPbN0eL3Ez2NIc7jq6ZM9Qwv3xI4pKI/j904V8T1Vj
         VCN4L58Pn0nTOroy8iSa39Qub/4piYObWGMvgMQQDGJk/efXsFQnURH7FCvE5dE+KBh8
         UnvWBX/HVPURmBiI+jLlv9ctzPnX4djbFFNot2of8qv7+0VvzrJs3iRTE+j8vO5fVGxB
         H/zUkW6/tKCuq3w7HlB0N/ayeQMTV5+s3M0WRX/fzXSpuNo+Wo4Ak2nph05LeT8XHMfp
         x45zYB5Q2wnkkn8EFSdf8JaD4ax8EiBTG580TjF1NLc/Ocl4SSw1SshjOtdbhsHCwODJ
         H9mA==
X-Gm-Message-State: AOJu0Yzuf58kouTLdqoHWfAFlYlkB0ilF3S2VYQYRUSRu3hkXW/aaZpN
        +3D8tR7sx59SbDv6Cd7mDSNPAQ2vBqnvXfs/V/4=
X-Google-Smtp-Source: AGHT+IH8px0bH0lySPSVbZaQ8qbJ7itPHa+im7NW59D2aGc3t37YXSv1kZ8EV5q4lBPy3igC8gJGdQ==
X-Received: by 2002:a17:903:185:b0:1c5:f663:1722 with SMTP id z5-20020a170903018500b001c5f6631722mr13682108plg.6.1696327628410;
        Tue, 03 Oct 2023 03:07:08 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id y8-20020a170902b48800b001c3267ae31bsm1089454plr.301.2023.10.03.03.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:07:07 -0700 (PDT)
Date:   Tue, 3 Oct 2023 15:37:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH v3 1/3] bindings: rust: fix soundness of
 line_info modeling
Message-ID: <20231003100705.6bav5earmwvxxt5b@vireshk-i7>
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
 <20231003-rust-line-info-soundness-v3-1-555ba21b4632@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003-rust-line-info-soundness-v3-1-555ba21b4632@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-10-23, 11:39, Erik Schilling wrote:
> While attention was provided to prevent freeing in non-owned use-cases,
> the lifetime of these object was not properly modeled.
> 
> The line_info from an event may only be used for as long as the event
> exists.
> 
> This allowed us to write unsafe-free Rust code that causes a
> use-after-free:
> 
>   let event = chip.read_info_event().unwrap();
>   let line_info = event.line_info().unwrap();
>   drop(event);
>   dbg!(line_info.name().unwrap());
> 
> Which makes the AddressSanitizer scream:
> 
>   ==90154==ERROR: AddressSanitizer: heap-use-after-free on address 0x50b000005dc4 at pc 0x55a4f883a009 bp 0x7f60ac8fbbc0 sp 0x7f60ac8fb388
>   READ of size 2 at 0x50b000005dc4 thread T2
>       [...]
>       #3 0x55a4f8c3d5f3 in libgpiod::line_info::Info::name::h5ba0bfd360ecb405 libgpiod/bindings/rust/libgpiod/src/line_info.rs:70:18
>     	[...]
> 
>   0x50b000005dc4 is located 4 bytes inside of 112-byte region [0x50b000005dc0,0x50b000005e30)
>   freed by thread T2 here:
>       [...]
>       #1 0x7f60b07f7e31 in gpiod_info_event_free libgpiod/lib/info-event.c:61:2
>       [...]
> 
>   previously allocated by thread T2 here:
>       #0 0x55a4f88b04be in malloc /rustc/llvm/src/llvm-project/compiler-rt/lib/asan/asan_malloc_linux.cpp:69:3
>       #1 0x7f60b07f8ff0 in gpiod_line_info_from_uapi libgpiod/lib/line-info.c:144:9
> 
> The fix is to distinguish between the owned and non-owned variants and
> assigning lifetimes to non-owned variants.
> 
> For modeling the non-owned type there are a couple of options. The ideal
> solution would be using extern_types [1]. But that is still unstable.
> Instead, we are defining a #[repr(transparent)] wrapper around the opaque
> gpiod_line_info struct and cast the pointer to a reference.
> 
> This was recommended on the Rust Discord server as good practise.
> (Thanks to Kyuuhachi, shepmaster, pie_flavor and ilyvion! Also thanks to
> @epilys for a brainstorming on this on #linaro-virtualization IRC).
> 
> Of course, determining the lifetimes and casting across the types
> requires some care. So this adds a couple of SAFETY comments that would
> probably also have helped the existing code.
> 
> [1] https://github.com/rust-lang/rfcs/blob/master/text/1861-extern-types.md
> 
> Fixes: 91f9373 ("bindings: rust: Add libgpiod crate")
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/src/chip.rs       |   8 +-
>  bindings/rust/libgpiod/src/info_event.rs |   8 +-
>  bindings/rust/libgpiod/src/line_info.rs  | 130 +++++++++++++++++++++----------
>  3 files changed, 100 insertions(+), 46 deletions(-)
> 
> diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
> index ebc15dc..bbb962f 100644
> --- a/bindings/rust/libgpiod/src/chip.rs
> +++ b/bindings/rust/libgpiod/src/chip.rs
> @@ -85,7 +85,9 @@ impl Chip {
>              ));
>          }
>  
> -        line::Info::new(info)
> +        // SAFETY: We verified that the pointer is valid. We own the pointer and
> +        // no longer use it after converting it into a Info instance.
> +        Ok(unsafe { line::Info::from_raw(info) })
>      }
>  
>      /// Get the current snapshot of information about the line at given offset and start watching
> @@ -101,7 +103,9 @@ impl Chip {
>              ));
>          }
>  
> -        line::Info::new_watch(info)
> +        // SAFETY: We verified that the pointer is valid. We own the instance and
> +        // no longer use it after converting it into a Info instance.
> +        Ok(unsafe { line::Info::from_raw(info) })
>      }
>  
>      /// Stop watching a line
> diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
> index db60600..6eec0db 100644
> --- a/bindings/rust/libgpiod/src/info_event.rs
> +++ b/bindings/rust/libgpiod/src/info_event.rs
> @@ -44,7 +44,7 @@ impl Event {
>      }
>  
>      /// Get the line-info object associated with the event.
> -    pub fn line_info(&self) -> Result<line::Info> {
> +    pub fn line_info(&self) -> Result<&line::InfoRef> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
>          let info = unsafe { gpiod::gpiod_info_event_get_line_info(self.event) };
>  
> @@ -55,7 +55,11 @@ impl Event {
>              ));
>          }
>  
> -        line::Info::new_from_event(info)
> +        // SAFETY: The pointer is valid. The returned reference receives the
> +        // lifetime '0 - the same as &self. &self also controls lifetime and
> +        // ownership of the owning object. Therefore, the borrow prevents moving
> +        // of the owning object to another thread.
> +        Ok(unsafe { line::InfoRef::from_raw(info) })
>      }
>  }
>  
> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
> index c4f488c..2148789 100644
> --- a/bindings/rust/libgpiod/src/line_info.rs
> +++ b/bindings/rust/libgpiod/src/line_info.rs
> @@ -2,9 +2,10 @@
>  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  
> -use std::ffi::CStr;
> +use std::ops::Deref;
>  use std::str;
>  use std::time::Duration;
> +use std::{ffi::CStr, marker::PhantomData};
>  
>  use super::{
>      gpiod,
> @@ -12,7 +13,7 @@ use super::{
>      Error, Result,
>  };
>  
> -/// Line info
> +/// Line info reference
>  ///
>  /// Exposes functions for retrieving kernel information about both requested and
>  /// free lines.  Line info object contains an immutable snapshot of a line's status.
> @@ -20,48 +21,57 @@ use super::{
>  /// The line info contains all the publicly available information about a
>  /// line, which does not include the line value.  The line must be requested
>  /// to access the line value.
> -
> -#[derive(Debug, Eq, PartialEq)]
> -pub struct Info {
> -    info: *mut gpiod::gpiod_line_info,
> -    contained: bool,
> +///
> +/// [InfoRef] only abstracts a reference to a [gpiod::gpiod_line_info] instance whose lifetime is managed
> +/// by a different object instance. The owned counter-part of this type is [Info].
> +#[derive(Debug)]
> +#[repr(transparent)]
> +pub struct InfoRef {
> +    _info: gpiod::gpiod_line_info,
> +    // Avoid the automatic `Sync` implementation.
> +    //
> +    // The C lib does not allow parallel invocations of the API. We could model
> +    // that by restricting all wrapper functions to `&mut Info` - which would
> +    // ensure exclusive access. But that would make the API a bit weird...
> +    // So instead we just suppress the `Sync` implementation, which suppresses
> +    // the `Send` implementation on `&Info` - disallowing to send it to other
> +    // threads, making concurrent use impossible.
> +    _not_sync: PhantomData<*mut gpiod::gpiod_line_info>,
>  }
>  
> -impl Info {
> -    fn new_internal(info: *mut gpiod::gpiod_line_info, contained: bool) -> Result<Self> {
> -        Ok(Self { info, contained })
> -    }
> -
> -    /// Get a snapshot of information about the line.
> -    pub(crate) fn new(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, false)
> -    }
> -
> -    /// Get a snapshot of information about the line and start watching it for changes.
> -    pub(crate) fn new_watch(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, false)
> +impl InfoRef {
> +    /// Converts a non-owning pointer to a wrapper reference of a specific
> +    /// lifetime
> +    ///
> +    /// No ownership will be assumed, the pointer must be free'd by the original
> +    /// owner.
> +    ///
> +    /// SAFETY: The pointer must point to an instance that is valid for the
> +    /// entire lifetime 'a. The instance must be owned by an object that is
> +    /// owned by the thread invoking this method. The owning object may not be
> +    /// moved to another thread for the entire lifetime 'a.
> +    pub(crate) unsafe fn from_raw<'a>(info: *mut gpiod::gpiod_line_info) -> &'a InfoRef {
> +        &*(info as *mut _)
>      }
>  
> -    /// Get the Line info object associated with an event.
> -    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> -        Info::new_internal(info, true)
> +    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> +        self as *const _ as *mut _
>      }
>  
>      /// Get the offset of the line within the GPIO chip.
>      ///
>      /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
>      /// uniquely identifies the line within the system.
> -
>      pub fn offset(&self) -> Offset {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        unsafe { gpiod::gpiod_line_info_get_offset(self.info) }
> +        unsafe { gpiod::gpiod_line_info_get_offset(self.as_raw_ptr()) }
>      }
>  
>      /// Get GPIO line's name.
>      pub fn name(&self) -> Result<&str> {
>          // SAFETY: The string returned by libgpiod is guaranteed to live as long
>          // as the `struct Info`.
> -        let name = unsafe { gpiod::gpiod_line_info_get_name(self.info) };
> +        let name = unsafe { gpiod::gpiod_line_info_get_name(self.as_raw_ptr()) };
>          if name.is_null() {
>              return Err(Error::NullString("GPIO line's name"));
>          }
> @@ -79,14 +89,14 @@ impl Info {
>      /// the line is used and we can't request it.
>      pub fn is_used(&self) -> bool {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        unsafe { gpiod::gpiod_line_info_is_used(self.info) }
> +        unsafe { gpiod::gpiod_line_info_is_used(self.as_raw_ptr()) }
>      }
>  
>      /// Get the GPIO line's consumer name.
>      pub fn consumer(&self) -> Result<&str> {
>          // SAFETY: The string returned by libgpiod is guaranteed to live as long
>          // as the `struct Info`.
> -        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.info) };
> +        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.as_raw_ptr()) };
>          if name.is_null() {
>              return Err(Error::NullString("GPIO line's consumer name"));
>          }
> @@ -100,44 +110,44 @@ impl Info {
>      /// Get the GPIO line's direction.
>      pub fn direction(&self) -> Result<Direction> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) })
> +        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.as_raw_ptr()) })
>      }
>  
>      /// Returns true if the line is "active-low", false otherwise.
>      pub fn is_active_low(&self) -> bool {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        unsafe { gpiod::gpiod_line_info_is_active_low(self.info) }
> +        unsafe { gpiod::gpiod_line_info_is_active_low(self.as_raw_ptr()) }
>      }
>  
>      /// Get the GPIO line's bias setting.
>      pub fn bias(&self) -> Result<Option<Bias>> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) })
> +        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.as_raw_ptr()) })
>      }
>  
>      /// Get the GPIO line's drive setting.
>      pub fn drive(&self) -> Result<Drive> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) })
> +        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.as_raw_ptr()) })
>      }
>  
>      /// Get the current edge detection setting of the line.
>      pub fn edge_detection(&self) -> Result<Option<Edge>> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) })
> +        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.as_raw_ptr()) })
>      }
>  
>      /// Get the current event clock setting used for edge event timestamps.
>      pub fn event_clock(&self) -> Result<EventClock> {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) })
> +        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.as_raw_ptr()) })
>      }
>  
>      /// Returns true if the line is debounced (either by hardware or by the
>      /// kernel software debouncer), false otherwise.
>      pub fn is_debounced(&self) -> bool {
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -        unsafe { gpiod::gpiod_line_info_is_debounced(self.info) }
> +        unsafe { gpiod::gpiod_line_info_is_debounced(self.as_raw_ptr()) }
>      }
>  
>      /// Get the debounce period of the line.
> @@ -147,18 +157,54 @@ impl Info {
>          #[allow(clippy::unnecessary_cast)]
>          // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
>          Duration::from_micros(unsafe {
> -            gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
> +            gpiod::gpiod_line_info_get_debounce_period_us(self.as_raw_ptr()) as u64
>          })
>      }
>  }
>  
> +/// Line info
> +///
> +/// This is the owned counterpart to [InfoRef]. Due to a [Deref] implementation,
> +/// all functions of [InfoRef] can also be called on this type.
> +#[derive(Debug)]
> +pub struct Info {
> +    info: *mut gpiod::gpiod_line_info,
> +}
> +
> +// SAFETY: Info models a owned instance whose ownership may be safely
> +// transferred to other threads.
> +unsafe impl Send for Info {}
> +
> +impl Info {
> +    /// Converts a owned pointer into an owned instance
> +    ///
> +    /// Assumes sole ownership over a [gpiod::gpiod_line_info] instance.
> +    ///
> +    /// SAFETY: The pointer must point to an instance that is valid. After
> +    /// constructing an [Info] the pointer MUST NOT be used for any other
> +    /// purpose anymore. All interactions with the libgpiod API have to happen
> +    /// through this object.
> +    pub(crate) unsafe fn from_raw(info: *mut gpiod::gpiod_line_info) -> Info {
> +        Info { info }
> +    }
> +}
> +
> +impl Deref for Info {
> +    type Target = InfoRef;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: The pointer is valid for the entire lifetime '0. Info is not
> +        // Sync. Therefore, no &Info may be held by a different thread. Hence,
> +        // the current thread owns it. Since we borrow with the lifetime of '0,
> +        // no move to a different thread can occur while a reference remains
> +        // being hold.
> +        unsafe { InfoRef::from_raw(self.info) }
> +    }
> +}
> +
>  impl Drop for Info {
>      fn drop(&mut self) {
> -        // We must not free the Line info object created from `struct chip::Event` by calling
> -        // libgpiod API.
> -        if !self.contained {
> -            // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> -            unsafe { gpiod::gpiod_line_info_free(self.info) }
> -        }
> +        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
> +        unsafe { gpiod::gpiod_line_info_free(self.info) }
>      }
>  }
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
