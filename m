Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6195600FA1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiJQNAD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiJQNAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:00:00 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE901A044
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:59:50 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d24so10690601pls.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XiEh6gH734kT+uI/xZYTNpJBR+3f9yTQLNS9+D3babs=;
        b=MpkQOIQ9UlMfPlmu6tpt+AH5lRhMR8hQTNIRuzK1i/DEejMikT1OTLOq0lR5l/ge8l
         CR48KhEmr0VszlL4Yib1evMgK50gzX7uakpzAwneaatZrp+lcfXHT1NVr7aq6YcqxqE+
         R5j7L59DIR1lrhQttFdEftQ3Rytnzl2UyfnzH23NV3Op2aoU9fezeYLZI5mqZFLDO/17
         zd5o0etMh/r4xiqTNXVPpNfg1ir82nOd2qCQbpDRRkHIvRFYndg6fWGr9AotjGCXy/hx
         ijvVsLMTAsS7mn4g8Wp3NHiZqa8v2tXgYi2CIMQ2ZQ8uUDpbL22QhbzHvCUxhlUqHwFa
         KqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiEh6gH734kT+uI/xZYTNpJBR+3f9yTQLNS9+D3babs=;
        b=jX0FheSOOKgKasl9UWduA1dQ3RHEOf9oDgQ8YJ4nCw0PYdGgpmo0WElDg8QiTa2yqe
         tMdcPmFnCsA4i9LXus134gUhrKJKIlupVpem5v9KCLEn7IFy2hAanlkdGAPN8h+LLtza
         l/kkeTxqS4ZQTBZAEIO5oH8V2QODZn6HgA6CXPEJXTyNqniVGnUqv3bieILiAhJNA4Hc
         i+3lhDuLE5G40eOMkIe5ngnhs6+OUbsam2FLF7WIT8nADvsudej6NKpM+rDvd15ag7q2
         yE1OGll9c+qGUpoz+Tn66U0eFyTOR1HB0w9ZlxKB8AbYtuDsSn/yfuMoef6uJypX/jrx
         VZMg==
X-Gm-Message-State: ACrzQf35llAdrvZLWTuQGyRjjxamHCk27t4ud4sESXLLKqJnsHV1l21p
        +/i+LDEhKw5UhjZJ4u7UeKBpH/3rkSU=
X-Google-Smtp-Source: AMsMyM46Tpao0L1dLcGwj8dd5faU/F3LKKKYoJJvI5HN6llQ5OAPEeR29uAXAWN6jrg+7KzLSgc/WA==
X-Received: by 2002:a17:90a:4ec6:b0:20a:96cd:2a46 with SMTP id v6-20020a17090a4ec600b0020a96cd2a46mr13965853pjl.171.1666011588754;
        Mon, 17 Oct 2022 05:59:48 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902c41200b0017b224969d6sm6687152plk.76.2022.10.17.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 05:59:48 -0700 (PDT)
Date:   Mon, 17 Oct 2022 20:59:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y01RvbboC3dMDVSy@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:20PM +0530, Viresh Kumar wrote:
> Add rust wrapper crate, around the libpiod-sys crate added earlier, to
> provide a convenient interface for the users.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/Cargo.toml                     |   1 +
>  bindings/rust/libgpiod/Cargo.toml            |  13 +
>  bindings/rust/libgpiod/src/chip.rs           | 253 ++++++++++
>  bindings/rust/libgpiod/src/edge_event.rs     | 101 ++++
>  bindings/rust/libgpiod/src/event_buffer.rs   |  66 +++
>  bindings/rust/libgpiod/src/info_event.rs     |  68 +++
>  bindings/rust/libgpiod/src/lib.rs            | 471 +++++++++++++++++++
>  bindings/rust/libgpiod/src/line_config.rs    | 118 +++++
>  bindings/rust/libgpiod/src/line_info.rs      | 180 +++++++
>  bindings/rust/libgpiod/src/line_request.rs   | 246 ++++++++++
>  bindings/rust/libgpiod/src/line_settings.rs  | 277 +++++++++++
>  bindings/rust/libgpiod/src/request_config.rs |  96 ++++
>  12 files changed, 1890 insertions(+)
>  create mode 100644 bindings/rust/libgpiod/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod/src/chip.rs
>  create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
>  create mode 100644 bindings/rust/libgpiod/src/info_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/lib.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_config.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_info.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_request.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_settings.rs
>  create mode 100644 bindings/rust/libgpiod/src/request_config.rs
> 
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index d0b3a3c88ff1..1e57ef2c0002 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -2,4 +2,5 @@
>  
>  members = [
>      "libgpiod-sys",
> +    "libgpiod"
>  ]
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> new file mode 100644
> index 000000000000..f25242abb153
> --- /dev/null
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -0,0 +1,13 @@
> +[package]
> +name = "libgpiod"
> +version = "0.1.0"
> +edition = "2018"

Add license and other relevant keys as per the link.

> +
> +# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
> +
> +[dependencies]
> +intmap = "2.0.0"
> +libc = ">=0.2.39"
> +libgpiod-sys = { path = "../libgpiod-sys" }
> +thiserror = "1.0"
> +vmm-sys-util = "=0.10.0"
> diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
> new file mode 100644
> index 000000000000..4f52c3f141f4
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/chip.rs
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::strlen;

Avoid importing function names.  Idiomatically, modules and types are ok,
but not functions.  So says the Rust book.

> +use std::os::raw::c_char;
> +use std::path::Path;
> +use std::sync::Arc;
> +use std::time::Duration;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as Errno;

Why vmm_sys_util::errno::Error rather than, say, errno::Errno?

> +
> +use super::{gpiod, info, line, request, Error, Offset, OperationType, Result};
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub(crate) struct Internal {
> +    chip: *mut gpiod::gpiod_chip,
> +}
> +

Derived implmentation of Clone on an object containing a raw pointer and
a Drop that frees that pointer?  That wont end well.

If you have an Arc managing references to it below, why the need for Clone?

Types that wrap C types that should impl Clone have a C _copy function,
and require an explicit impl that calls it, not a derived.

> +impl Internal {
> +    /// Find a chip by path.
> +    pub(crate) fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
> +        // Null-terminate the string
> +        let path = path.as_ref().to_string_lossy() + "\0";
> +
> +        let chip = unsafe { gpiod::gpiod_chip_open(path.as_ptr() as *const c_char) };

All unsafes should have a preceding SAFETY comment.

> +        if chip.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::ChipOpen,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { chip })
> +    }
> +
> +    /// Private helper, Returns gpiod_chip
> +    pub(crate) fn chip(&self) -> *mut gpiod::gpiod_chip {
> +        self.chip
> +    }

Just make self.chip itself pub(crate)?

> +}
> +
> +impl Drop for Internal {
> +    /// Close the chip and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_chip_close(self.chip) }
> +    }
> +}
> +
> +/// GPIO chip
> +///
> +/// A GPIO chip object is associated with an open file descriptor to the GPIO
> +/// character device. It exposes basic information about the chip and allows
> +/// callers to retrieve information about each line, watch lines for state
> +/// changes and make line requests.
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Chip {
> +    ichip: Arc<Internal>,
> +    info: Info,
> +}
> +

Doesn't info need an Arc as well? (see struct Info below).

Actually, does it make sense to be able to Clone the Chip?
Two threads could then watch different lines and
wait_info_event() from the one chip.
That isn't going to work, at least not the way you would want.

> +unsafe impl Send for Chip {}
> +unsafe impl Sync for Chip {}
> +

Send makes sense to me, but not Sync, due to the waiting for info events.
Similarly for line_request::Request.
At least not without some additional synchronisation/locking, and I'm not
sure we want to go there.

> +impl Chip {
> +    /// Find a chip by path.
> +    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
> +        let ichip = Arc::new(Internal::open(path)?);
> +        let info = Info::new(ichip.clone())?;
> +

info is not always necessary, e.g. if the user just want to request a
line.  Maybe lazy load it?  Assuming you want to keep a copy cached with
the Chip at all.

> +        Ok(Self { ichip, info })
> +    }
> +
> +    /// Get the chip name as represented in the kernel.
> +    pub fn name(&self) -> Result<&str> {
> +        self.info.name()
> +    }
> +
> +    /// Get the chip label as represented in the kernel.
> +    pub fn label(&self) -> Result<&str> {
> +        self.info.label()
> +    }
> +
> +    /// Get the number of GPIO lines exposed by the chip.
> +    pub fn num_lines(&self) -> usize {
> +        self.info.num_lines()
> +    }
> +
> +    /// Get the path used to find the chip.
> +    pub fn path(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let path = unsafe { gpiod::gpiod_chip_get_path(self.ichip.chip()) };
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe { slice::from_raw_parts(path as *const u8, strlen(path) as usize) })
> +            .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Get information about the chip.
> +    pub fn info(&self) -> Result<Info> {
> +        Info::new(self.ichip.clone())
> +    }

You already wrap all the methods of Info, so why the need to return a
copy as well? Do you really need both?

And the functions of Info are currently pub(crate) so what could they do
with it anyway?

> +
> +    /// Get a snapshot of information about the line.
> +    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
> +        line::Info::new(self.ichip.clone(), offset)
> +    }
> +
> +    /// Get the current snapshot of information about the line at given offset and start watching
> +    /// it for future changes.
> +    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
> +        line::Info::new_watch(self.ichip.clone(), offset)
> +    }
> +
> +    /// Stop watching a line
> +    pub fn unwatch(&self, offset: Offset) {
> +        unsafe {
> +            gpiod::gpiod_chip_unwatch_line_info(self.ichip.chip(), offset);
> +        }
> +    }
> +
> +    /// Get the file descriptor associated with the chip.
> +    ///
> +    /// The returned file descriptor must not be closed by the caller, else other methods for the
> +    /// `struct Chip` may fail.
> +    pub fn fd(&self) -> Result<u32> {
> +        let fd = unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip()) };
> +
> +        if fd < 0 {
> +            Err(Error::OperationFailed(
> +                OperationType::ChipGetFd,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(fd as u32)
> +        }
> +    }
> +
> +    /// Wait for line status events on any of the watched lines on the chip.
> +    pub fn wait_info_event(&self, timeout: Option<Duration>) -> Result<bool> {
> +        let timeout = match timeout {
> +            Some(x) => x.as_nanos() as i64,
> +            // Block indefinitely
> +            None => -1,
> +        };
> +
> +        let ret = unsafe { gpiod::gpiod_chip_wait_info_event(self.ichip.chip(), timeout) };
> +
> +        match ret {
> +            -1 => Err(Error::OperationFailed(
> +                OperationType::ChipWaitInfoEvent,
> +                Errno::last(),
> +            )),
> +            0 => Ok(false),
> +            _ => Ok(true),
> +        }
> +    }
> +
> +    /// Read a single line status change event from the chip. If no events are
> +    /// pending, this function will block.
> +    pub fn read_info_event(&self) -> Result<info::Event> {
> +        info::Event::new(&self.ichip)
> +    }
> +
> +    /// Map a GPIO line's name to its offset within the chip.
> +    pub fn line_offset_from_name(&self, name: &str) -> Result<Offset> {
> +        // Null-terminate the string
> +        let name = name.to_owned() + "\0";
> +
> +        let ret = unsafe {
> +            gpiod::gpiod_chip_get_line_offset_from_name(
> +                self.ichip.chip(),
> +                name.as_ptr() as *const c_char,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::ChipGetLine,
> +                Errno::last(),
> +            ))

The OperationType identifies the underlying C call that caused the
error?  So it should be ChipGetLineOffsetFromName?

> +        } else {
> +            Ok(ret as u32)
> +        }
> +    }
> +
> +    /// Request a set of lines for exclusive usage.
> +    pub fn request_lines(
> +        &self,
> +        rconfig: &request::Config,
> +        lconfig: &line::Config,
> +    ) -> Result<line::Request> {
> +        line::Request::new(&self.ichip, rconfig, lconfig)
> +    }
> +}
> +
> +/// GPIO chip Information
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Info {
> +    info: *mut gpiod::gpiod_chip_info,
> +}
> +

Does struct Info even need to be pub?

Clone/Drop wrapping a raw pointer again.

> +impl Info {
> +    /// Find a GPIO chip by path.
> +    pub(crate) fn new(chip: Arc<Internal>) -> Result<Self> {
> +        let info = unsafe { gpiod::gpiod_chip_get_info(chip.chip()) };
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::ChipInfoGet,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { info })
> +    }

Do these functions need to be pub(crate)?  They are only used within the
module (by Chip), and are visible to that anyway.

> +
> +    /// Get the GPIO chip name as represented in the kernel.
> +    pub(crate) fn name(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let name = unsafe { gpiod::gpiod_chip_info_get_name(self.info) };
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
> +            .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Get the GPIO chip label as represented in the kernel.
> +    pub(crate) fn label(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let label = unsafe { gpiod::gpiod_chip_info_get_label(self.info) };
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe { slice::from_raw_parts(label as *const u8, strlen(label) as usize) })
> +            .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Get the number of GPIO lines exposed by the chip.
> +    pub(crate) fn num_lines(&self) -> usize {
> +        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
> +    }
> +}
> +
> +impl Drop for Info {
> +    /// Close the GPIO chip info and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_chip_info_free(self.info) }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
> new file mode 100644
> index 000000000000..12c0fd73f778
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{edge::event::Buffer, gpiod, EdgeKind, Error, Offset, OperationType, Result};
> +
> +/// Line edge events handling
> +///
> +/// An edge event object contains information about a single line edge event.
> +/// It contains the event type, timestamp and the offset of the line on which
> +/// the event occurred as well as two sequence numbers (global for all lines
> +/// in the associated request and local for this line only).
> +///
> +/// Edge events are stored into an edge-event buffer object to improve
> +/// performance and to limit the number of memory allocations when a large
> +/// number of events are being read.
> +
> +#[derive(Debug, Eq, PartialEq)]
> +pub struct Event<'b> {
> +    buffer: Option<&'b Buffer>,
> +    event: *mut gpiod::gpiod_edge_event,
> +}
> +
> +impl<'b> Event<'b> {
> +    /// Get an event stored in the buffer.
> +    pub(crate) fn new(buffer: &'b Buffer, index: u64) -> Result<Self> {
> +        let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::EdgeEventBufferGetEvent,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            buffer: Some(buffer),
> +            event,
> +        })
> +    }
> +
> +    pub fn event_clone(event: &Event) -> Result<Self> {
> +        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::EdgeEventCopy,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            buffer: None,
> +            event,
> +        })
> +    }
> +
> +    /// Get the event type.
> +    pub fn event_type(&self) -> Result<EdgeKind> {
> +        EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.event) } as u32)
> +    }
> +
> +    /// Get the timestamp of the event.
> +    pub fn timestamp(&self) -> Duration {
> +        Duration::from_nanos(unsafe { gpiod::gpiod_edge_event_get_timestamp_ns(self.event) })
> +    }
> +
> +    /// Get the offset of the line on which the event was triggered.
> +    pub fn line_offset(&self) -> Offset {
> +        unsafe { gpiod::gpiod_edge_event_get_line_offset(self.event) }
> +    }
> +
> +    /// Get the global sequence number of the event.
> +    ///
> +    /// Returns sequence number of the event relative to all lines in the
> +    /// associated line request.
> +    pub fn global_seqno(&self) -> u64 {
> +        unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event) }
> +    }
> +
> +    /// Get the event sequence number specific to concerned line.
> +    ///
> +    /// Returns sequence number of the event relative to the line within the
> +    /// lifetime of the associated line request.
> +    pub fn line_seqno(&self) -> u64 {
> +        unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event) }
> +    }
> +}
> +
> +impl<'b> Drop for Event<'b> {
> +    /// Free the edge event.
> +    fn drop(&mut self) {
> +        // Free the event only if a copy is made
> +        if self.buffer.is_none() {
> +            unsafe { gpiod::gpiod_edge_event_free(self.event) };
> +        }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
> new file mode 100644
> index 000000000000..11c8b5e1d7c9
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::c_ulong;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{edge, gpiod, Error, OperationType, Result};
> +
> +/// Line edge events buffer
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Buffer {
> +    buffer: *mut gpiod::gpiod_edge_event_buffer,
> +}

Clone/Drop wrapping a raw pointer again.

> +
> +impl Buffer {
> +    /// Create a new edge event buffer.
> +    ///
> +    /// If capacity equals 0, it will be set to a default value of 64. If
> +    /// capacity is larger than 1024, it will be limited to 1024.
> +    pub fn new(capacity: usize) -> Result<Self> {
> +        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> +        if buffer.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::EdgeEventBufferNew,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { buffer })
> +    }
> +
> +    /// Private helper, Returns gpiod_edge_event_buffer
> +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> +        self.buffer
> +    }

Just make self.buffer pub(crate)?  Why is the idea of passing a raw
pointer around making my skin crawl?
Or even better, move the guts of
line_request::Request::read_edge_events() into a helper function here
that it can call so it doesn't need access to self.buffer.

> +
> +    /// Get the capacity of the event buffer.
> +    pub fn capacity(&self) -> usize {
> +        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
> +    }
> +
> +    /// Read an event stored in the buffer.
> +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> +        edge::Event::new(self, index)
> +    }

What is to prevent reading an event from a slot that has not yet been
populated?  I realise doing that is possible in C, but it should be
prevented in the Rust bindings.

> +
> +    /// Get the number of events the buffer contains.
> +    pub fn len(&self) -> usize {
> +        unsafe { gpiod::gpiod_edge_event_buffer_get_num_events(self.buffer()) as usize }
> +    }
> +
> +    /// Check if buffer is empty.
> +    pub fn is_empty(&self) -> bool {
> +        self.len() == 0
> +    }
> +}
> +
> +impl Drop for Buffer {
> +    /// Free the edge event buffer and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
> new file mode 100644
> index 000000000000..d8be87df6679
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/info_event.rs
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::sync::Arc;
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{chip, gpiod, line, Error, InfoChangeKind, OperationType, Result};
> +
> +/// Line status watch events
> +///
> +/// Accessors for the info event objects allowing to monitor changes in GPIO
> +/// line state.
> +///
> +/// Callers can be notified about changes in line's state using the interfaces
> +/// exposed by GPIO chips. Each info event contains information about the event
> +/// itself (timestamp, type) as well as a snapshot of line's state in the form
> +/// of a line-info object.
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Event {
> +    event: *mut gpiod::gpiod_info_event,
> +}
> +

Clone/Drop wrapping a raw pointer again.

> +impl Event {
> +    /// Get a single chip's line's status change event.
> +    pub(crate) fn new(ichip: &Arc<chip::Internal>) -> Result<Self> {
> +        let event = unsafe { gpiod::gpiod_chip_read_info_event(ichip.chip()) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::ChipReadInfoEvent,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { event })
> +    }

The new() should be:

    pub(crate) fn new(event: *mut gpiod::gpiod_info_event) -> Self {
        Self {event}
    }

The guts should be in Chip - where this new() is called.

> +
> +    /// Private helper, Returns gpiod_info_event
> +    pub(crate) fn event(&self) -> *mut gpiod::gpiod_info_event {
> +        self.event
> +    }
> +
> +    /// Get the event type of the status change event.
> +    pub fn event_type(&self) -> Result<InfoChangeKind> {
> +        InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
> +    }
> +
> +    /// Get the timestamp of the event, read from the monotonic clock.
> +    pub fn timestamp(&self) -> Duration {
> +        Duration::from_nanos(unsafe { gpiod::gpiod_info_event_get_timestamp_ns(self.event) })
> +    }
> +
> +    /// Get the line-info object associated with the event.
> +    pub fn line_info(&self) -> Result<line::Info> {
> +        line::Info::new_from_event(self)
> +    }
> +}
> +
> +impl Drop for Event {
> +    /// Free the info event object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_info_event_free(self.event) }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
> new file mode 100644
> index 000000000000..c5d974a9f4ea
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/lib.rs
> @@ -0,0 +1,471 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Rust wrappers for GPIOD APIs
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +//! libgpiod public API
> +//!
> +//! This is the complete documentation of the public Rust API made available to
> +//! users of libgpiod.
> +//!
> +//! The API is logically split into several parts such as: GPIO chip & line
> +//! operators, GPIO events handling etc.
> +
> +/// GPIO chip related definitions.
> +pub mod chip;
> +
> +mod edge_event;
> +mod event_buffer;
> +
> +/// GPIO chip edge event related definitions.
             ^
            line

> +pub mod edge {
> +    pub use crate::edge_event::*;
> +
> +    /// GPIO chip edge event buffer related definitions.
> +    pub mod event {
> +        pub use crate::event_buffer::*;
> +    }
> +}
> +

Not sure why event_buffer needs to be nested inside an event module.
event_buffer should be in the request module.

edge_event is a tougher call, either line or request.  Probably the
latter.

> +mod info_event;
> +
> +/// GPIO chip info event related definitions.
> +pub mod info {
> +    pub use crate::info_event::*;
> +}
> +

Why is this a top level module, not part of chip?

> +mod line_config;
> +mod line_info;
> +mod line_request;
> +mod line_settings;
> +
> +/// GPIO chip line related definitions.
> +pub mod line {
> +    pub use crate::line_config::*;
> +    pub use crate::line_info::*;
> +    pub use crate::line_request::*;
> +    pub use crate::line_settings::*;
> +}

The line_request should be in the request module?

> +
> +mod request_config;
> +
> +/// GPIO chip request related definitions.
> +pub mod request {
> +    pub use crate::request_config::*;
> +}
> +
> +use libgpiod_sys as gpiod;
> +
> +use intmap::IntMap;
> +use libc::strlen;
> +use std::fs;
> +use std::os::raw::c_char;
> +use std::path::Path;
> +use std::time::Duration;
> +use std::{fmt, slice, str};
> +
> +use thiserror::Error as ThisError;
> +use vmm_sys_util::errno::Error as Errno;
> +
> +/// Operation types, used with OperationFailed() Error.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum OperationType {
> +    ChipOpen,
> +    ChipGetFd,
> +    ChipWaitInfoEvent,
> +    ChipGetLine,
> +    ChipGetLineInfo,
> +    ChipInfoGet,
> +    ChipReadInfoEvent,
> +    ChipWatchLineInfo,
> +    EdgeEventBufferGetEvent,
> +    EdgeEventCopy,
> +    EdgeEventBufferNew,
> +    InfoEventGetLineInfo,
> +    LineConfigNew,
> +    LineConfigAddSettings,
> +    LineConfigGetOffsets,
> +    LineConfigGetSetting,
> +    LineRequest,
> +    LineRequestReconfigLines,
> +    LineRequestGetVal,
> +    LineRequestGetValSubset,
> +    LineRequestSetVal,
> +    LineRequestSetValSubset,
> +    LineRequestReadEdgeEvent,
> +    LineRequestWaitEdgeEvent,
> +    LineSettingsNew,
> +    LineSettingsCopy,
> +    LineSettingsGetOutVal,
> +    LineSettingsSetDirection,
> +    LineSettingsSetEdgeDetection,
> +    LineSettingsSetBias,
> +    LineSettingsSetDrive,
> +    LineSettingsSetActiveLow,
> +    LineSettingsSetDebouncePeriod,
> +    LineSettingsSetEventClock,
> +    LineSettingsSetOutputValue,
> +    RequestConfigNew,
> +    RequestConfigGetConsumer,
> +    SimBankGetVal,
> +    SimBankNew,
> +    SimBankSetLabel,
> +    SimBankSetNumLines,
> +    SimBankSetLineName,
> +    SimBankSetPull,
> +    SimBankHogLine,
> +    SimCtxNew,
> +    SimDevNew,
> +    SimDevEnable,
> +    SimDevDisable,
> +}
> +
> +impl fmt::Display for OperationType {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:?}", self)
> +    }
> +}
> +
> +/// Result of libgpiod operations.
> +pub type Result<T> = std::result::Result<T, Error>;
> +
> +/// Error codes for libgpiod operations.
> +#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
> +pub enum Error {
> +    #[error("Failed to get {0}")]
> +    NullString(&'static str),
> +    #[error("String not utf8: {0:?}")]
> +    StringNotUtf8(str::Utf8Error),
> +    #[error("Invalid enum {0} value: {1}")]
> +    InvalidEnumValue(&'static str, u32),
> +    #[error("Operation {0} Failed: {1}")]
> +    OperationFailed(OperationType, Errno),
> +    #[error("Invalid Arguments")]
> +    InvalidArguments,
> +    #[error("Std Io Error")]
> +    IoError,
> +}
> +

The remaining types in this file look specific to lines and should be in
the line module?

> +/// Value settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum Value {
> +    /// Active
> +    Active,
> +    /// Inactive
> +    InActive,
> +}
> +
> +/// Maps offset to Value.
> +pub type ValueMap = IntMap<Value>;
> +
> +impl Value {
> +    pub fn new(val: i32) -> Result<Self> {
> +        match val {
> +            0 => Ok(Value::InActive),
> +            1 => Ok(Value::Active),
> +            _ => Err(Error::InvalidEnumValue("Value", val as u32)),
> +        }
> +    }

Move the Ok outside the match, and return the Err immediately.
Not a biggy here, but where there are more variants it makes it easier
to read, if nothing else.

> +
> +    fn value(&self) -> i32 {
> +        match self {
> +            Value::Active => 1,
> +            Value::InActive => 0,
> +        }
> +    }
> +}
> +
> +/// Offset type.
> +pub type Offset = u32;
> +
> +/// Direction settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum Direction {
> +    /// Request the line(s), but don't change direction.
> +    AsIs,
> +    /// Direction is input - for reading the value of an externally driven GPIO line.
> +    Input,
> +    /// Direction is output - for driving the GPIO line.
> +    Output,
> +}
> +
> +impl Direction {
> +    fn new(dir: u32) -> Result<Self> {
> +        match dir {
> +            gpiod::GPIOD_LINE_DIRECTION_AS_IS => Ok(Direction::AsIs),
> +            gpiod::GPIOD_LINE_DIRECTION_INPUT => Ok(Direction::Input),
> +            gpiod::GPIOD_LINE_DIRECTION_OUTPUT => Ok(Direction::Output),
> +            _ => Err(Error::InvalidEnumValue("Direction", dir)),
> +        }
> +    }
> +
> +    fn gpiod_direction(&self) -> u32 {
> +        match self {
> +            Direction::AsIs => gpiod::GPIOD_LINE_DIRECTION_AS_IS,
> +            Direction::Input => gpiod::GPIOD_LINE_DIRECTION_INPUT,
> +            Direction::Output => gpiod::GPIOD_LINE_DIRECTION_OUTPUT,
> +        }
> +    }
> +}
> +
> +/// Internal bias settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum Bias {
> +    /// The internal bias is disabled.
> +    Disabled,
> +    /// The internal pull-up bias is enabled.
> +    PullUp,
> +    /// The internal pull-down bias is enabled.
> +    PullDown,
> +}
> +
> +impl Bias {
> +    fn new(bias: u32) -> Result<Option<Self>> {
> +        match bias {
> +            gpiod::GPIOD_LINE_BIAS_UNKNOWN => Ok(None),
> +            gpiod::GPIOD_LINE_BIAS_AS_IS => Ok(None),
> +            gpiod::GPIOD_LINE_BIAS_DISABLED => Ok(Some(Bias::Disabled)),
> +            gpiod::GPIOD_LINE_BIAS_PULL_UP => Ok(Some(Bias::PullUp)),
> +            gpiod::GPIOD_LINE_BIAS_PULL_DOWN => Ok(Some(Bias::PullDown)),
> +            _ => Err(Error::InvalidEnumValue("Bias", bias)),
> +        }
> +    }
> +
> +    fn gpiod_bias(bias: Option<Bias>) -> u32 {
> +        match bias {
> +            None => gpiod::GPIOD_LINE_BIAS_AS_IS,
> +            Some(bias) => match bias {
> +                Bias::Disabled => gpiod::GPIOD_LINE_BIAS_DISABLED,
> +                Bias::PullUp => gpiod::GPIOD_LINE_BIAS_PULL_UP,
> +                Bias::PullDown => gpiod::GPIOD_LINE_BIAS_PULL_DOWN,
> +            },
> +        }
> +    }
> +}
> +
> +/// Drive settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum Drive {
> +    /// Drive setting is push-pull.
> +    PushPull,
> +    /// Line output is open-drain.
> +    OpenDrain,
> +    /// Line output is open-source.
> +    OpenSource,
> +}
> +
> +impl Drive {
> +    fn new(drive: u32) -> Result<Self> {
> +        match drive {
> +            gpiod::GPIOD_LINE_DRIVE_PUSH_PULL => Ok(Drive::PushPull),
> +            gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN => Ok(Drive::OpenDrain),
> +            gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE => Ok(Drive::OpenSource),
> +            _ => Err(Error::InvalidEnumValue("Drive", drive)),
> +        }
> +    }
> +
> +    fn gpiod_drive(&self) -> u32 {
> +        match self {
> +            Drive::PushPull => gpiod::GPIOD_LINE_DRIVE_PUSH_PULL,
> +            Drive::OpenDrain => gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN,
> +            Drive::OpenSource => gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE,
> +        }
> +    }
> +}
> +
> +/// Edge detection settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum Edge {
> +    /// Line detects rising edge events.
> +    Rising,
> +    /// Line detects falling edge events.
> +    Falling,
> +    /// Line detects both rising and falling edge events.
> +    Both,
> +}
> +
> +impl Edge {
> +    fn new(edge: u32) -> Result<Option<Self>> {
> +        match edge {
> +            gpiod::GPIOD_LINE_EDGE_NONE => Ok(None),
> +            gpiod::GPIOD_LINE_EDGE_RISING => Ok(Some(Edge::Rising)),
> +            gpiod::GPIOD_LINE_EDGE_FALLING => Ok(Some(Edge::Falling)),
> +            gpiod::GPIOD_LINE_EDGE_BOTH => Ok(Some(Edge::Both)),
> +            _ => Err(Error::InvalidEnumValue("Edge", edge)),
> +        }
> +    }
> +
> +    fn gpiod_edge(edge: Option<Edge>) -> u32 {
> +        match edge {
> +            None => gpiod::GPIOD_LINE_EDGE_NONE,
> +            Some(edge) => match edge {
> +                Edge::Rising => gpiod::GPIOD_LINE_EDGE_RISING,
> +                Edge::Falling => gpiod::GPIOD_LINE_EDGE_FALLING,
> +                Edge::Both => gpiod::GPIOD_LINE_EDGE_BOTH,
> +            },
> +        }
> +    }
> +}
> +
> +/// Line setting kind.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum SettingKind {
> +    /// Line direction.
> +    Direction,
> +    /// Bias.
> +    Bias,
> +    /// Drive.
> +    Drive,
> +    /// Edge detection.
> +    EdgeDetection,
> +    /// Active-low setting.
> +    ActiveLow,
> +    /// Debounce period.
> +    DebouncePeriod,
> +    /// Event clock type.
> +    EventClock,
> +    /// Output value.
> +    OutputValue,
> +}
> +
> +/// Line settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum SettingVal {
> +    /// Line direction.
> +    Direction(Direction),
> +    /// Bias.
> +    Bias(Option<Bias>),
> +    /// Drive.
> +    Drive(Drive),
> +    /// Edge detection.
> +    EdgeDetection(Option<Edge>),
> +    /// Active-low setting.
> +    ActiveLow(bool),
> +    /// Debounce period.
> +    DebouncePeriod(Duration),
> +    /// Event clock type.
> +    EventClock(EventClock),
> +    /// Output value.
> +    OutputValue(Value),
> +}
> +
> +impl fmt::Display for SettingVal {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:?}", self)
> +    }
> +}
> +
> +/// Event clock settings.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum EventClock {
> +    /// Line uses the monotonic clock for edge event timestamps.
> +    Monotonic,
> +    /// Line uses the realtime clock for edge event timestamps.
> +    Realtime,
> +    /// Line uses the hardware timestamp engine clock for edge event timestamps.
> +    HTE,
> +}
> +
> +impl EventClock {
> +    fn new(clock: u32) -> Result<Self> {
> +        match clock {
> +            gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => Ok(EventClock::Monotonic),
> +            gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME => Ok(EventClock::Realtime),
> +            gpiod::GPIOD_LINE_EVENT_CLOCK_HTE => Ok(EventClock::HTE),
> +            _ => Err(Error::InvalidEnumValue("Eventclock", clock)),
> +        }
> +    }
> +
> +    fn gpiod_clock(&self) -> u32 {
> +        match self {
> +            EventClock::Monotonic => gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
> +            EventClock::Realtime => gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME,
> +            EventClock::HTE => gpiod::GPIOD_LINE_EVENT_CLOCK_HTE,
> +        }
> +    }
> +}
> +
> +/// Line status change event types.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum InfoChangeKind {
> +    /// Line has been requested.
> +    LineRequested,
> +    /// Previously requested line has been released.
> +    LineReleased,
> +    /// Line configuration has changed.
> +    LineConfigChanged,
> +}
> +
> +impl InfoChangeKind {
> +    fn new(kind: u32) -> Result<Self> {
> +        match kind {
> +            gpiod::GPIOD_INFO_EVENT_LINE_REQUESTED => Ok(InfoChangeKind::LineRequested),
> +            gpiod::GPIOD_INFO_EVENT_LINE_RELEASED => Ok(InfoChangeKind::LineReleased),
> +            gpiod::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => Ok(InfoChangeKind::LineConfigChanged),
> +            _ => Err(Error::InvalidEnumValue("InfoChangeKind", kind)),
> +        }
> +    }
> +}
> +
> +/// Edge event types.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum EdgeKind {
> +    /// Rising edge event.
> +    Rising,
> +    /// Falling edge event.
> +    Falling,
> +}
> +
> +impl EdgeKind {
> +    fn new(kind: u32) -> Result<Self> {
> +        match kind {
> +            gpiod::GPIOD_EDGE_EVENT_RISING_EDGE => Ok(EdgeKind::Rising),
> +            gpiod::GPIOD_EDGE_EVENT_FALLING_EDGE => Ok(EdgeKind::Falling),
> +            _ => Err(Error::InvalidEnumValue("EdgeEvent", kind)),
> +        }
> +    }
> +}
> +
> +/// Various libgpiod-related functions.
> +
> +/// Check if the file pointed to by path is a GPIO chip character device.
> +///
> +/// Returns true if the file exists and is a GPIO chip character device or a
> +/// symbolic link to it.
> +pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool {
> +    // Null-terminate the string
> +    let path = path.as_ref().to_string_lossy() + "\0";
> +
> +    unsafe { gpiod::gpiod_is_gpiochip_device(path.as_ptr() as *const c_char) }
> +}
> +
> +/// Iterator for GPIO devices.
> +pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
> +    let mut chips = Vec::new();
> +
> +    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
> +        let path = entry.path();
> +
> +        if is_gpiochip_device(&path) {
> +            chips.push(chip::Chip::open(&path)?);
> +        }
> +    }

If there is a symlink to a device both in the path, or multiple symlinks
to the same device, you will get the same chip several times in the
returned Vec?

Some mention of the order in which devices are returned?
If you are returning a Vec then sorted might be nice, else state they
are not sorted.

And strictly speaking a Vec is not an iterator. It can be iterated over,
but Vec.iter() is its iterator.

> +
> +    Ok(chips)
> +}
> +
> +/// Get the API version of the library as a human-readable string.
> +pub fn version_string() -> Result<&'static str> {
> +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> +    let version = unsafe { gpiod::gpiod_version_string() };
> +
> +    if version.is_null() {
> +        return Err(Error::NullString("GPIO library version"));
> +    }
> +
> +    // SAFETY: The string is guaranteed to be valid here by the C API.
> +    str::from_utf8(unsafe { slice::from_raw_parts(version as *const u8, strlen(version) as usize) })
> +        .map_err(Error::StringNotUtf8)
> +}

What if the Rust bindings version differ from the libgpiod version?

> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> new file mode 100644
> index 000000000000..ea25452fd1d6
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/line_config.rs
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::c_ulong;
> +use std::slice::from_raw_parts;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{gpiod, line::Settings, Error, Offset, OperationType, Result};
> +
> +/// Line configuration objects.
> +///
> +/// The line-config object contains the configuration for lines that can be
> +/// used in two cases:
> +///  - when making a line request
> +///  - when reconfiguring a set of already requested lines.
> +///
> +/// A new line-config object is empty. Using it in a request will lead to an
> +/// error. In order to a line-config to become useful, it needs to be assigned
                       ^
                      for

> +/// at least one offset-to-settings mapping by calling
> +/// ::gpiod_line_config_add_line_settings.
> +///
> +/// When calling ::gpiod_chip_request_lines, the library will request all
> +/// offsets that were assigned settings in the order that they were assigned.
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Config {
> +    config: *mut gpiod::gpiod_line_config,
> +}
> +

Clone/Drop wrapping a raw pointer again.

> +impl Config {
> +    /// Create a new line config object.
> +    pub fn new() -> Result<Self> {
> +        let config = unsafe { gpiod::gpiod_line_config_new() };
> +
> +        if config.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineConfigNew,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { config })
> +    }
> +
> +    /// Private helper, Returns gpiod_line_config
> +    pub(crate) fn config(&self) -> *mut gpiod::gpiod_line_config {
> +        self.config
> +    }
> +
> +    /// Resets the entire configuration stored in the object. This is useful if
> +    /// the user wants to reuse the object without reallocating it.
> +    pub fn reset(&mut self) {
> +        unsafe { gpiod::gpiod_line_config_reset(self.config) }
> +    }
> +
> +    /// Add line settings for a set of offsets.
> +    pub fn add_line_settings(&self, offsets: &[Offset], settings: Settings) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_config_add_line_settings(
> +                self.config,
> +                offsets.as_ptr(),
> +                offsets.len() as c_ulong,
> +                settings.settings(),
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineConfigAddSettings,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get line settings for offset.
> +    pub fn line_settings(&self, offset: Offset) -> Result<Settings> {
> +        let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, offset) };
> +
> +        if settings.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineConfigGetSetting,
                                                      ^
                                               Settings

> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Settings::new_with_settings(settings))
> +    }
> +
> +    /// Get configured offsets.
> +    pub fn offsets(&self) -> Result<Vec<Offset>> {
> +        let mut num: u64 = 0;
> +        let mut offsets: *mut Offset = std::ptr::null_mut();
> +
> +        let ret =
> +            unsafe { gpiod::gpiod_line_config_get_offsets(self.config, &mut num, &mut offsets) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineConfigGetOffsets,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(unsafe { from_raw_parts(offsets as *const Offset, num as usize).to_vec() })
> +        }
> +    }
> +}
> +
> +impl Drop for Config {
> +    /// Free the line config object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_line_config_free(self.config) }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
> new file mode 100644
> index 000000000000..9db51fc30efd
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/line_info.rs
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::strlen;
> +use std::sync::Arc;
> +use std::time::Duration;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{
> +    chip, gpiod, info, Bias, Direction, Drive, Edge, Error, EventClock, Offset, OperationType,
> +    Result,
> +};
> +
> +/// Line info
> +///
> +/// Exposes functions for retrieving kernel information about both requested and
> +/// free lines.  Line info object contains an immutable snapshot of a line's status.
> +///
> +/// The line info contains all the publicly available information about a
> +/// line, which does not include the line value.  The line must be requested
> +/// to access the line value.
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Info {
> +    info: *mut gpiod::gpiod_line_info,
> +    info_event: bool,
> +}
> +

Clone/Drop wrapping a raw pointer again.

> +impl Info {
> +    /// Get a snapshot of information about the line and optionally start watching it for changes.
> +    pub(crate) fn new(ichip: Arc<chip::Internal>, offset: Offset) -> Result<Self> {
> +        let info = unsafe { gpiod::gpiod_chip_get_line_info(ichip.chip(), offset) };
> +
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::ChipGetLineInfo,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            info,
> +            info_event: false,
> +        })
> +    }

Move the guts into chip where this is called.  This should just be a
bare contructor:

pub(crate) fn new(info: *mut gpiod::gpiod_line_info, free_me_seymour: bool)

> +
> +    pub(crate) fn new_watch(ichip: Arc<chip::Internal>, offset: Offset) -> Result<Self> {
> +        let info = unsafe { gpiod::gpiod_chip_watch_line_info(ichip.chip(), offset) };
> +
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::ChipWatchLineInfo,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            info,
> +            info_event: false,
> +        })
> +    }

Move the guts into chip where this is called, and call the new() above.

> +
> +    /// Get the Line info object associated with an event.
> +    pub(crate) fn new_from_event(event: &info::Event) -> Result<Self> {
> +        let info = unsafe { gpiod::gpiod_info_event_get_line_info(event.event()) };
> +
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::InfoEventGetLineInfo,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            info,
> +            info_event: true,
> +        })
> +    }

Move the guts into info_events where this is called, and call the new()
above.

> +
> +    /// Get the offset of the line within the GPIO chip.
> +    ///
> +    /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
> +    /// uniquely identifies the line within the system.
> +
> +    pub fn offset(&self) -> Offset {
> +        unsafe { gpiod::gpiod_line_info_get_offset(self.info) }
> +    }
> +
> +    /// Get GPIO line's name.
> +    pub fn name(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Info`.
> +        let name = unsafe { gpiod::gpiod_line_info_get_name(self.info) };
> +        if name.is_null() {
> +            return Err(Error::NullString("GPIO line's name"));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
> +            .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Returns True if the line is in use, false otherwise.
> +    ///
> +    /// The user space can't know exactly why a line is busy. It may have been
> +    /// requested by another process or hogged by the kernel. It only matters that
> +    /// the line is used and we can't request it.
> +    pub fn is_used(&self) -> bool {
> +        unsafe { gpiod::gpiod_line_info_is_used(self.info) }
> +    }
> +
> +    /// Get the GPIO line's consumer name.
> +    pub fn consumer(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Info`.
> +        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.info) };
> +        if name.is_null() {
> +            return Err(Error::NullString("GPIO line's consumer name"));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
> +            .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Get the GPIO line's direction.
> +    pub fn direction(&self) -> Result<Direction> {
> +        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) } as u32)
> +    }
> +
> +    /// Returns true if the line is "active-low", false otherwise.
> +    pub fn is_active_low(&self) -> bool {
> +        unsafe { gpiod::gpiod_line_info_is_active_low(self.info) }
> +    }
> +
> +    /// Get the GPIO line's bias setting.
> +    pub fn bias(&self) -> Result<Option<Bias>> {
> +        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) } as u32)
> +    }
> +
> +    /// Get the GPIO line's drive setting.
> +    pub fn drive(&self) -> Result<Drive> {
> +        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) } as u32)
> +    }
> +
> +    /// Get the current edge detection setting of the line.
> +    pub fn edge_detection(&self) -> Result<Option<Edge>> {
> +        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) } as u32)
> +    }
> +
> +    /// Get the current event clock setting used for edge event timestamps.
> +    pub fn event_clock(&self) -> Result<EventClock> {
> +        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) } as u32)
> +    }
> +
> +    /// Returns true if the line is debounced (either by hardware or by the
> +    /// kernel software debouncer), false otherwise.
> +    pub fn is_debounced(&self) -> bool {
> +        unsafe { gpiod::gpiod_line_info_is_debounced(self.info) }
> +    }
> +
> +    /// Get the debounce period of the line.
> +    pub fn debounce_period(&self) -> Duration {
> +        Duration::from_micros(unsafe { gpiod::gpiod_line_info_get_debounce_period_us(self.info) })
> +    }
> +}
> +
> +impl Drop for Info {
> +    fn drop(&mut self) {
> +        // We must not free the Line info object created from `struct info::Event` by calling
> +        // libgpiod API.
> +        if !self.info_event {
> +            unsafe { gpiod::gpiod_line_info_free(self.info) }
> +        }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> new file mode 100644
> index 000000000000..e4ff951aef29
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::EINVAL;
> +use std::os::raw::c_ulong;
> +use std::sync::Arc;
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{
> +    chip, edge, gpiod, line, request, Error, Offset, OperationType, Result, Value, ValueMap,
> +};
> +
> +/// Line request operations
> +///
> +/// Allows interaction with a set of requested lines.
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Request {
> +    request: *mut gpiod::gpiod_line_request,
> +}
> +

Clone/Drop wrapping a raw pointer again.

Does it make sense to be able to clone a request?
As per Chip, concerns being about reading events concurrently, as well
as the freeing of the underlying resources.

> +impl Request {
> +    /// Request a set of lines for exclusive usage.
> +    pub(crate) fn new(
> +        ichip: &Arc<chip::Internal>,
> +        rconfig: &request::Config,
> +        lconfig: &line::Config,
> +    ) -> Result<Self> {
> +        let request = unsafe {
> +            gpiod::gpiod_chip_request_lines(ichip.chip(), rconfig.config(), lconfig.config())
> +        };
> +
> +        if request.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineRequest,
                                     ^
                                ChipRequestLines

> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { request })
> +    }

As with other constructors, this should be a bare constructor, and the
guts should be in Chip where this function is called.

> +
> +    /// Get the number of lines in the request.
> +    pub fn num_lines(&self) -> usize {
> +        unsafe { gpiod::gpiod_line_request_get_num_lines(self.request) as usize }
> +    }
> +
> +    /// Get the offsets of lines in the request.
> +    pub fn offsets(&self) -> Vec<Offset> {
> +        let mut offsets = vec![0; self.num_lines() as usize];
> +
> +        unsafe { gpiod::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
> +        offsets
> +    }
> +
> +    /// Get the value (0 or 1) of a single line associated with the request.
> +    pub fn value(&self, offset: Offset) -> Result<Value> {
> +        let value = unsafe { gpiod::gpiod_line_request_get_value(self.request, offset) };
> +
> +        if value != 0 && value != 1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestGetVal,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Value::new(value)
> +        }
> +    }
> +
> +    /// Get values of a subset of lines associated with the request.
> +    pub fn values_subset(&self, offsets: &[Offset]) -> Result<ValueMap> {
> +        let mut values = vec![0; offsets.len()];
> +
> +        let ret = unsafe {
> +            gpiod::gpiod_line_request_get_values_subset(
> +                self.request,
> +                offsets.len() as c_ulong,
> +                offsets.as_ptr(),
> +                values.as_mut_ptr(),
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestGetValSubset,
> +                Errno::last(),
> +            ))
> +        } else {
> +            let mut map = ValueMap::new();
> +
> +            for (i, val) in values.iter().enumerate() {
> +                map.insert(offsets[i].into(), Value::new(*val)?);
> +            }
> +
> +            Ok(map)
> +        }
> +    }
> +
> +    /// Get values of all lines associated with the request.
> +    pub fn values(&self) -> Result<ValueMap> {
> +        self.values_subset(&self.offsets())
> +    }
> +
> +    /// Set the value of a single line associated with the request.
> +    pub fn set_value(&self, offset: Offset, value: Value) -> Result<()> {
> +        let ret =
> +            unsafe { gpiod::gpiod_line_request_set_value(self.request, offset, value.value()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestSetVal,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get values of a subset of lines associated with the request.
> +    pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
> +        let mut offsets = Vec::new();
> +        let mut values = Vec::new();
> +
> +        for (offset, value) in map {
> +            offsets.push(offset as u32);
> +            values.push(value.value());
> +        }
> +
> +        let ret = unsafe {
> +            gpiod::gpiod_line_request_set_values_subset(
> +                self.request,
> +                offsets.len() as c_ulong,
> +                offsets.as_ptr(),
> +                values.as_ptr(),
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestSetValSubset,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get values of all lines associated with the request.
> +    pub fn set_values(&self, values: &[Value]) -> Result<()> {
> +        if values.len() != self.num_lines() as usize {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineRequestSetVal,
> +                Errno::new(EINVAL),
> +            ));
> +        }

The error implies a C call failed, but that isn't the case.
Make it a plain InvalidArgument?

> +
> +        let mut new_values = Vec::new();
> +        for value in values {
> +            new_values.push(value.value());
> +        }
> +
> +        let ret =
> +            unsafe { gpiod::gpiod_line_request_set_values(self.request, new_values.as_ptr()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestSetVal,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Update the configuration of lines associated with the line request.
> +    pub fn reconfigure_lines(&self, lconfig: &line::Config) -> Result<()> {
> +        let ret =
> +            unsafe { gpiod::gpiod_line_request_reconfigure_lines(self.request, lconfig.config()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestReconfigLines,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the file descriptor associated with the line request.
> +    pub fn fd(&self) -> u32 {
> +        unsafe { gpiod::gpiod_line_request_get_fd(self.request) as u32 }
> +    }

impl AsRawFd?

> +
> +    /// Wait for edge events on any of the lines associated with the request.
> +    pub fn wait_edge_event(&self, timeout: Option<Duration>) -> Result<bool> {
> +        let timeout = match timeout {
> +            Some(x) => x.as_nanos() as i64,
> +            // Block indefinitely
> +            None => -1,
> +        };
> +
> +        let ret = unsafe { gpiod::gpiod_line_request_wait_edge_event(self.request, timeout) };
> +
> +        match ret {
> +            -1 => Err(Error::OperationFailed(
> +                OperationType::LineRequestWaitEdgeEvent,
> +                Errno::last(),
> +            )),
> +            0 => Ok(false),
> +            _ => Ok(true),
> +        }
> +    }
> +
> +    /// Get a number of edge events from a line request.
> +    ///
> +    /// This function will block if no event was queued for the line.
> +    pub fn read_edge_events(&self, buffer: &mut edge::event::Buffer) -> Result<u32> {

What is to stop the user requesting events between the len returned
here and the end of the buffer?  Why knows what state they are in.

Would be better to return an object that can only access the relevant
events in the buffer.

I've got an alternative for the event buffer implementation - will
describe that at the end.

> +        let ret = unsafe {
> +            gpiod::gpiod_line_request_read_edge_event(
> +                self.request,
> +                buffer.buffer(),
> +                buffer.capacity() as u64,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineRequestReadEdgeEvent,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(ret as u32)
> +        }
> +    }
> +}
> +
> +impl Drop for Request {
> +    /// Release the requested lines and free all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_line_request_release(self.request) }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
> new file mode 100644
> index 000000000000..2c3090132ea5
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{
> +    gpiod, Bias, Direction, Drive, Edge, Error, EventClock, OperationType, Result, SettingKind,
> +    SettingVal, Value,
> +};
> +
> +/// Line settings objects.
> +///
> +/// Line settings object contains a set of line properties that can be used
> +/// when requesting lines or reconfiguring an existing request.
> +///
> +/// Mutators in general can only fail if the new property value is invalid. The
> +/// return values can be safely ignored - the object remains valid even after
> +/// a mutator fails and simply uses the sane default appropriate for given
> +/// property.
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Settings {
> +    settings: *mut gpiod::gpiod_line_settings,
> +}
> +

Clone/Drop wrapping a raw pointer again.

> +impl Settings {
> +    /// Create a new line settings object.
> +    pub fn new() -> Result<Self> {
> +        let settings = unsafe { gpiod::gpiod_line_settings_new() };
> +
> +        if settings.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineSettingsNew,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { settings })
> +    }
> +
> +    pub fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
> +        Self { settings }
> +    }
> +
> +    /// Private helper, Returns gpiod_line_settings
> +    pub(crate) fn settings(&self) -> *mut gpiod::gpiod_line_settings {
> +        self.settings
> +    }

Just make self.settings pub(crate)?

> +
> +    /// Resets the line settings object to its default values.
> +    pub fn reset(&mut self) {
> +        unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
> +    }
> +
> +    /// Makes copy of the settings object.
> +    pub fn settings_clone(&self) -> Result<Self> {
> +        let settings = unsafe { gpiod::gpiod_line_settings_copy(self.settings) };
> +        if settings.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::LineSettingsCopy,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { settings })
> +    }

This clone is fine - the derived one is not.

> +
> +    /// Set line prop setting.
> +    pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {

Rename values to props, particularly as values is one of the props.

> +        for value in values {
> +            match value {
> +                SettingVal::Direction(val) => self.set_direction(*val)?,
> +                SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
> +                SettingVal::Bias(val) => self.set_bias(*val)?,
> +                SettingVal::Drive(val) => self.set_drive(*val)?,
> +                SettingVal::ActiveLow(val) => self.set_active_low(*val),
> +                SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
> +                SettingVal::EventClock(val) => self.set_event_clock(*val)?,
> +                SettingVal::OutputValue(val) => self.set_output_value(*val)?,
> +            }
> +        }
> +
> +        Ok(())
> +    }

Make mutators -> Result<&mut Self> so they can be chained.

> +
> +    /// Get the line prop setting.
> +    pub fn prop(&self, property: SettingKind) -> Result<SettingVal> {
> +        Ok(match property {
> +            SettingKind::Direction => SettingVal::Direction(self.direction()?),
> +            SettingKind::EdgeDetection => SettingVal::EdgeDetection(self.edge_detection()?),
> +            SettingKind::Bias => SettingVal::Bias(self.bias()?),
> +            SettingKind::Drive => SettingVal::Drive(self.drive()?),
> +            SettingKind::ActiveLow => SettingVal::ActiveLow(self.active_low()),
> +            SettingKind::DebouncePeriod => SettingVal::DebouncePeriod(self.debounce_period()?),
> +            SettingKind::EventClock => SettingVal::EventClock(self.event_clock()?),
> +            SettingKind::OutputValue => SettingVal::OutputValue(self.output_value()?),
> +        })
> +    }
> +
> +    /// Set the line direction.
> +    fn set_direction(&mut self, direction: Direction) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_settings_set_direction(
> +                self.settings,
> +                direction.gpiod_direction() as i32,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetDirection,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }

These mutators might as well be pub as well.  Then the caller has the
option of using the set_prop(&[settings]) or chaining mutators.
Similarly the accessors.

> +
> +    /// Get the direction setting.
> +    fn direction(&self) -> Result<Direction> {
> +        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) } as u32)
> +    }
> +
> +    /// Set the edge event detection setting.
> +    fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_settings_set_edge_detection(
> +                self.settings,
> +                Edge::gpiod_edge(edge) as i32,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetEdgeDetection,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the edge event detection setting.
> +    fn edge_detection(&self) -> Result<Option<Edge>> {
> +        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) } as u32)
> +    }
> +
> +    /// Set the bias setting.
> +    fn set_bias(&mut self, bias: Option<Bias>) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias) as i32)
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetBias,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the bias setting.
> +    fn bias(&self) -> Result<Option<Bias>> {
> +        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) } as u32)
> +    }
> +
> +    /// Set the drive setting.
> +    fn set_drive(&mut self, drive: Drive) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive() as i32)
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetDrive,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the drive setting.
> +    fn drive(&self) -> Result<Drive> {
> +        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) } as u32)
> +    }
> +
> +    /// Set active-low setting.
> +    fn set_active_low(&mut self, active_low: bool) {
> +        unsafe { gpiod::gpiod_line_settings_set_active_low(self.settings, active_low) }
> +    }
> +
> +    /// Check the active-low setting.
> +    fn active_low(&self) -> bool {
> +        unsafe { gpiod::gpiod_line_settings_get_active_low(self.settings) }
> +    }
> +
> +    /// Set the debounce period setting.
> +    fn set_debounce_period(&mut self, period: Duration) {
> +        unsafe {
> +            gpiod::gpiod_line_settings_set_debounce_period_us(
> +                self.settings,
> +                period.as_micros() as u64,
> +            )
> +        }
> +    }
> +
> +    /// Get the debounce period.
> +    fn debounce_period(&self) -> Result<Duration> {
> +        Ok(Duration::from_micros(unsafe {
> +            gpiod::gpiod_line_settings_get_debounce_period_us(self.settings)
> +        }))
> +    }
> +
> +    /// Set the event clock setting.
> +    fn set_event_clock(&mut self, clock: EventClock) -> Result<()> {
> +        let ret = unsafe {
> +            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock() as i32)
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetEventClock,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the event clock setting.
> +    fn event_clock(&self) -> Result<EventClock> {
> +        EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
> +    }
> +
> +    /// Set the output value setting.
> +    fn set_output_value(&mut self, value: Value) -> Result<()> {
> +        let ret =
> +            unsafe { gpiod::gpiod_line_settings_set_output_value(self.settings, value.value()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsSetOutputValue,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the output value, 0 or 1.
> +    fn output_value(&self) -> Result<Value> {
> +        let value = unsafe { gpiod::gpiod_line_settings_get_output_value(self.settings) };
> +
> +        if value != 0 && value != 1 {
> +            Err(Error::OperationFailed(
> +                OperationType::LineSettingsGetOutVal,
> +                Errno::last(),
> +            ))
> +        } else {
> +            Value::new(value)
> +        }
> +    }
> +}
> +
> +impl Drop for Settings {
> +    /// Free the line settings object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_line_settings_free(self.settings) }
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
> new file mode 100644
> index 000000000000..760d9c755c86
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/request_config.rs
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::strlen;
> +use std::os::raw::{c_char, c_ulong};
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{gpiod, Error, OperationType, Result};
> +
> +/// Request configuration objects
> +///
> +/// Request config objects are used to pass a set of options to the kernel at
> +/// the time of the line request. The mutators don't return error values. If the
> +/// values are invalid, in general they are silently adjusted to acceptable
> +/// ranges.
> +
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Config {
> +    config: *mut gpiod::gpiod_request_config,
> +}
> +

And one last time...

Clone/Drop wrapping a raw pointer again.

> +impl Config {
> +    /// Create a new request config object.
> +    pub fn new() -> Result<Self> {
> +        let config = unsafe { gpiod::gpiod_request_config_new() };
> +        if config.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::RequestConfigNew,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { config })
> +    }
> +
> +    /// Private helper, Returns gpiod_request_config
> +    pub(crate) fn config(&self) -> *mut gpiod::gpiod_request_config {
> +        self.config
> +    }
> +

Make self.config pub(crate) instead?

> +    /// Set the consumer name for the request.
> +    ///
> +    /// If the consumer string is too long, it will be truncated to the max
> +    /// accepted length.
> +    pub fn set_consumer(&self, consumer: &str) {
> +        // Null-terminate the string
> +        let consumer = consumer.to_owned() + "\0";
> +
> +        unsafe {
> +            gpiod::gpiod_request_config_set_consumer(
> +                self.config,
> +                consumer.as_ptr() as *const c_char,
> +            )
> +        }
> +    }
> +
> +    /// Get the consumer name configured in the request config.
> +    pub fn consumer(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Config`.
> +        let consumer = unsafe { gpiod::gpiod_request_config_get_consumer(self.config) };
> +        if consumer.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::RequestConfigGetConsumer,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here by the C API.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(consumer as *const u8, strlen(consumer) as usize)
> +        })
> +        .map_err(Error::StringNotUtf8)
> +    }
> +
> +    /// Set the size of the kernel event buffer for the request.
> +    pub fn set_event_buffer_size(&self, size: usize) {
> +        unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong) }
> +    }
> +
> +    /// Get the edge event buffer size setting for the request config.
> +    pub fn event_buffer_size(&self) -> usize {
> +        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
> +    }
> +}
> +
> +impl Drop for Config {
> +    /// Free the request config object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_request_config_free(self.config) }
> +    }
> +}
> -- 
> 2.31.1.272.g89b43f80a514
> 

Overall I don't see any problems that require major rework to the scale
of previous versions.  My main itches that need to be scratched being
dangling pointers and to a lesser degree thread safey.

I find the event_buffer solution to be less safe than it could be.
I've got an alternative, based on the my earlier PoC/suggestion, that
returns an snaphot of events when you read events from the request into
the buffer.  I've put that in a branch on github [1] if you want to take
a look.

I went though a few variations wrt how to deal with the event cloning.
Not implementing Clone on the events means they can't be stored in a
Vec, and so storing them in the Buffer was problematic.
My initial solution was for the event to only wrap the C pointer and
have distinct event types for buffered and cloned, implemented
using traits - which is bit of a pain as the user then needs to import
the trait themselves to use the events :-(.
Then tried a macro to add impl Event on the two event types, which looks
ugly to me.
Finally went with having Event be a new type of BaseEvent, which does
impl Clone, so the event buffer can store them (and <cough> cast them
to Event as appropriate).  Slightly more evil under the hood than I
would like, but provides the cleanest implementation.

The Events snapshot should impl Iterator to make it easier to use,
though I haven't added that yet.
And the error returned by Events::event() is wrong - just cut and pasted
one in there - probably should be InvalidArguments?

Anyway, the end result is that it is not possible to read an invalid or
uninitialised event from Rust, which was the point.
It also better handles lifetimes, so it isn't necessary to explicitly
drop events before re-using the buffer, and the event_clone() method
can be an instance method rather than a class method (to borrow some
Python terminology).
I've added an events.rs to the examples to demonstrate how the
changes impact usage in each case.

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod/commits/rust_v7_mods

