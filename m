Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20BD7581DCA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240120AbiG0C6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240051AbiG0C6G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:58:06 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32719371B2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q16so14785125pgq.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ns0H03Jhy71P2DY7YKRSAySXylZFvC8Td/PeED2XiUk=;
        b=OhH7Hjw46VV34TKfUv7JZHnaBk43dvU240O2pjSmrQ3zCtSgclEZPb0I2syiL92/fj
         bzAYUsa0wEs90B65K33CEHjYxZmfBUiN4jm4o6s/32VoLEXULy2GNKverHmj7ZDSlY0t
         kAHHJBlbxQk3DkKMP38PZsQBQwQGTKiNjelZxr9xYzIn/LnORS1++28/p3dvzmmT2hT5
         OpkrtCYXsGn/reDvjz7YztcB1xiRn5oVWl+4XdzTgAiiIn4gUOVFikrIG2H10hfhoBTs
         CXU7tVaAH9Bl1IVERtw23+/DnDMpruMKup30JzxhywANVTb9w56xoigexuU4+GFoSAC9
         JK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ns0H03Jhy71P2DY7YKRSAySXylZFvC8Td/PeED2XiUk=;
        b=QHTzkOmdmRf9GjNvyKHSYVNukr7muw0mG/D7n7Gw8fFE+2ZDbaiETjICyINTw2wYyI
         6O+kzGwX4emfq+fNK/uGLe4Yip23AUC9LpsifNMxboNxXRKEJaInXTBeezZltk0l+kxz
         uQX0BzS7JVK1ecyiu9RWXIXpasrx+LAghfXRjwbjlAqaYDN35KR5AI4E05Gf79xxLPMV
         DNqp9y8bvA1am+DiODjsw+usBUltU/MApv4cXOC/Qo5ZUuBJmrNjWB4KQ0j+TRlaK2d9
         q1gvvs2e+/RT8prHKKcTEa4fS2aL0zLGHH12ea6puENkeoVz+90Pufx9cZgizu8vtSuA
         0Tjw==
X-Gm-Message-State: AJIora+pHN2kYu566iZiHbzDwiyZsO7TpsKybIjG0MuqF/h6gIl5WuQf
        8LCECr5ZJ5zoieXB9rGJbr4eM+hp1DM=
X-Google-Smtp-Source: AGRyM1vIzc9S2ZMrPgmSKGosXWYrHTdTp+Zk0NDqwjtoYelAHBFqQzycGmq0hZcNiti6UrAWiP6wwg==
X-Received: by 2002:a63:1d49:0:b0:41b:425b:fbc6 with SMTP id d9-20020a631d49000000b0041b425bfbc6mr1833988pgm.407.1658890681431;
        Tue, 26 Jul 2022 19:58:01 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b0016d6c939332sm6099689plh.279.2022.07.26.19.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:58:00 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:57:54 +0800
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220727025754.GD88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> Add rust wrapper crate, around the libpiod-sys crate added earlier, to
> provide a convenient interface for the users.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/Cargo.toml            |  12 +
>  bindings/rust/src/chip.rs           | 179 ++++++++++
>  bindings/rust/src/chip_info.rs      |  69 ++++
>  bindings/rust/src/edge_event.rs     | 105 ++++++
>  bindings/rust/src/event_buffer.rs   |  88 +++++
>  bindings/rust/src/info_event.rs     |  68 ++++
>  bindings/rust/src/lib.rs            | 317 ++++++++++++++++++
>  bindings/rust/src/line_config.rs    | 493 ++++++++++++++++++++++++++++
>  bindings/rust/src/line_info.rs      | 189 +++++++++++
>  bindings/rust/src/line_request.rs   | 248 ++++++++++++++
>  bindings/rust/src/request_config.rs | 122 +++++++
>  11 files changed, 1890 insertions(+)
>  create mode 100644 bindings/rust/Cargo.toml
>  create mode 100644 bindings/rust/src/chip.rs
>  create mode 100644 bindings/rust/src/chip_info.rs
>  create mode 100644 bindings/rust/src/edge_event.rs
>  create mode 100644 bindings/rust/src/event_buffer.rs
>  create mode 100644 bindings/rust/src/info_event.rs
>  create mode 100644 bindings/rust/src/lib.rs
>  create mode 100644 bindings/rust/src/line_config.rs
>  create mode 100644 bindings/rust/src/line_info.rs
>  create mode 100644 bindings/rust/src/line_request.rs
>  create mode 100644 bindings/rust/src/request_config.rs
> 
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> new file mode 100644
> index 000000000000..d5d81486fa2f
> --- /dev/null
> +++ b/bindings/rust/Cargo.toml
> @@ -0,0 +1,12 @@
> +[package]
> +name = "libgpiod"
> +version = "0.1.0"
> +edition = "2018"
> +

Make the top level a workspace, and move libgpiod, libgpiod-sys and
gpiosim into sub-directories (as libgpiod-sys already is).

> +# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
> +
> +[dependencies]
> +libc = ">=0.2.39"
> +libgpiod-sys = { path = "libgpiod-sys" }
> +thiserror = "1.0"
> +vmm-sys-util = "=0.9.0"
> diff --git a/bindings/rust/src/chip.rs b/bindings/rust/src/chip.rs
> new file mode 100644
> index 000000000000..50b5d6102f96
> --- /dev/null
> +++ b/bindings/rust/src/chip.rs
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::c_char;
> +use std::sync::Arc;
> +use std::time::Duration;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{
> +    bindings, chip_info::ChipInfo, Error, InfoEvent, LineConfig, LineInfo, LineRequest,
> +    RequestConfig, Result,
> +};
> +
> +/// GPIO chip
> +///
> +/// A GPIO chip object is associated with an open file descriptor to the GPIO
> +/// character device. It exposes basic information about the chip and allows
> +/// callers to retrieve information about each line, watch lines for state
> +/// changes and make line requests.
> +pub(crate) struct ChipInternal {
> +    chip: *mut bindings::gpiod_chip,
> +}
> +
> +impl ChipInternal {
> +    /// Find a chip by path.
> +    pub(crate) fn open(path: &str) -> Result<Self> {
> +        // Null-terminate the string
> +        let path = path.to_owned() + "\0";
> +
> +        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };
> +        if chip.is_null() {
> +            return Err(Error::OperationFailed("Gpio Chip open", IoError::last()));
> +        }
> +
> +        Ok(Self { chip })
> +    }
> +
> +    /// Private helper, Returns gpiod_chip
> +    pub(crate) fn chip(&self) -> *mut bindings::gpiod_chip {
> +        self.chip
> +    }
> +}
> +
> +impl Drop for ChipInternal {
> +    /// Close the chip and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_chip_close(self.chip) }
> +    }
> +}
> +
> +pub struct Chip {
> +    ichip: Arc<ChipInternal>,
> +    info: ChipInfo,
> +}
> +

Chip is undocumented. (check the generated docs)

> +impl Chip {
> +    /// Find a chip by path.
> +    pub fn open(path: &str) -> Result<Self> {
> +        let ichip = Arc::new(ChipInternal::open(path)?);
> +        let info = ChipInfo::new(ichip.clone())?;
> +
> +        Ok(Self { ichip, info })
> +    }
> +
> +    /// Get the chip name as represented in the kernel.
> +    pub fn get_name(&self) -> Result<&str> {
> +        self.info.name()
> +    }
> +

Drop the "get_" prefix from accessor methods (mutators are
still prefixed with "set_")[1]

[1] https://rust-lang.github.io/api-guidelines/naming.html

> +    /// Get the chip label as represented in the kernel.
> +    pub fn get_label(&self) -> Result<&str> {
> +        self.info.label()
> +    }
> +
> +    /// Get the number of GPIO lines exposed by the chip.
> +    pub fn get_num_lines(&self) -> u32 {
> +        self.info.num_lines()
> +    }
> +
> +    /// Get the path used to find the chip.
> +    pub fn get_path(&self) -> Result<&str> {

It seems absurd that a method that simply returns the path provided to
open() requires a Result, but that is a consequence of wrapping.

I was considering suggesting caching a copy in struct Chip, but all the
other methods require Results so at least this is consistent :-(.

Yay, more unwrapping than Xmas past.

> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let path = unsafe { bindings::gpiod_chip_get_path(self.ichip.chip()) };

Trusting that it is never NULL?
Add a null check to be sure.

> +
> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(path as *const u8, bindings::strlen(path) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Get information about the chip.
> +    pub fn info(&self) -> Result<ChipInfo> {
> +        ChipInfo::new(self.ichip.clone())
> +    }
> +
> +    /// Get a snapshot of information about the line.
> +    pub fn line_info(&self, offset: u32) -> Result<LineInfo> {
> +        LineInfo::new(self.ichip.clone(), offset, false)
> +    }
> +
> +    /// Get the current snapshot of information about the line at given offset
> +    /// and optionally start watching it for future changes.
> +    pub fn watch_line_info(&self, offset: u32) -> Result<LineInfo> {
> +        LineInfo::new(self.ichip.clone(), offset, true)
> +    }
> +
> +    /// Get the file descriptor associated with the chip.
> +    ///
> +    /// The returned file descriptor must not be closed by the caller, else other methods for the
> +    /// `struct Chip` may fail.
> +    pub fn get_fd(&self) -> Result<u32> {
> +        let fd = unsafe { bindings::gpiod_chip_get_fd(self.ichip.chip()) };
> +
> +        if fd < 0 {
> +            Err(Error::OperationFailed("Gpio Chip get-fd", IoError::last()))
> +        } else {
> +            Ok(fd as u32)
> +        }
> +    }
> +
> +    /// Wait for line status events on any of the watched lines on the chip.
> +    pub fn wait_info_event(&self, timeout: Duration) -> Result<()> {

Durations cannot be negative, so caller cannot make this block
indefinitely.  Make timeout an Option? (no timeout => block)

> +        let ret = unsafe {
> +            bindings::gpiod_chip_wait_info_event(self.ichip.chip(), timeout.as_nanos() as i64)
> +        };
> +
> +        match ret {
> +            -1 => Err(Error::OperationFailed(
> +                "Gpio Chip info-event-wait",
> +                IoError::last(),
> +            )),
> +            0 => Err(Error::OperationTimedOut),
> +            _ => Ok(()),
> +        }
> +    }
> +

Better to return Result<bool> indicating if an event is present rather
than a timeout error?

> +    /// Read a single line status change event from the chip. If no events are
> +    /// pending, this function will block.
> +    pub fn read_info_event(&self) -> Result<InfoEvent> {
> +        InfoEvent::new(&self.ichip)
> +    }
> +
> +    /// Map a GPIO line's name to its offset within the chip.
> +    pub fn find_line(&self, name: &str) -> Result<u32> {

Rename to line_offset_from_name() to match the renaming in the C API.

> +        // Null-terminate the string
> +        let name = name.to_owned() + "\0";
> +
> +        let ret = unsafe {
> +            bindings::gpiod_chip_get_line_offset_from_name(
> +                self.ichip.chip(),
> +                name.as_ptr() as *const c_char,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio Chip find-line",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(ret as u32)
> +        }
> +    }
> +
> +    /// Request a set of lines for exclusive usage.
> +    pub fn request_lines(
> +        &self,
> +        rconfig: &RequestConfig,
> +        lconfig: &LineConfig,
> +    ) -> Result<LineRequest> {
> +        LineRequest::new(&self.ichip, rconfig, lconfig)
> +    }
> +}
> diff --git a/bindings/rust/src/chip_info.rs b/bindings/rust/src/chip_info.rs
> new file mode 100644
> index 000000000000..950368b54c6f
> --- /dev/null
> +++ b/bindings/rust/src/chip_info.rs
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::sync::Arc;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, ChipInternal, Error, Result};
> +
> +/// GPIO chip Information
> +pub struct ChipInfo {
> +    info: *mut bindings::gpiod_chip_info,
> +}
> +

Consider modules and namespaces rather than lumping everything in
the gpiod space.

e.g. gpiod::ChipInfo -> gpiod::chip::Info

> +impl ChipInfo {
> +    /// Find a GPIO chip by path.
> +    pub(crate) fn new(chip: Arc<ChipInternal>) -> Result<Self> {
> +        let info = unsafe { bindings::gpiod_chip_get_info(chip.chip()) };
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio Chip get info",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { info })
> +    }
> +
> +    /// Get the GPIO chip name as represented in the kernel.
> +    pub(crate) fn name(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let name = unsafe { bindings::gpiod_chip_info_get_name(self.info) };
> +

Again, trusting the C not to return NULL.
Similarly elsewhere - don't trust the C library.

> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(name as *const u8, bindings::strlen(name) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Get the GPIO chip label as represented in the kernel.
> +    pub(crate) fn label(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct Chip`.
> +        let label = unsafe { bindings::gpiod_chip_info_get_label(self.info) };
> +
> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(label as *const u8, bindings::strlen(label) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Get the number of GPIO lines exposed by the chip.
> +    pub(crate) fn num_lines(&self) -> u32 {
> +        unsafe { bindings::gpiod_chip_info_get_num_lines(self.info) as u32 }
> +    }
> +}
> +
> +impl Drop for ChipInfo {
> +    /// Close the GPIO chip info and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_chip_info_free(self.info) }
> +    }
> +}
> diff --git a/bindings/rust/src/edge_event.rs b/bindings/rust/src/edge_event.rs
> new file mode 100644
> index 000000000000..89bda58709d2
> --- /dev/null
> +++ b/bindings/rust/src/edge_event.rs
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::sync::Arc;
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, EdgeEventBufferInternal, Error, LineEdgeEvent, Result};
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
> +pub struct EdgeEvent {
> +    ibuffer: Option<Arc<EdgeEventBufferInternal>>,
> +    event: *mut bindings::gpiod_edge_event,
> +}
> +
> +impl EdgeEvent {
> +    /// Get an event stored in the buffer.
> +    pub(crate) fn new(
> +        ibuffer: &Arc<EdgeEventBufferInternal>,
> +        index: u64,
> +        copy: bool,

rename to copied or cloned, or flip the sense and call it buffered or
contained.

> +    ) -> Result<Self> {
> +        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(ibuffer.buffer(), index) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio EdgeEvent buffer-get-event",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        if copy {
> +            let event = unsafe { bindings::gpiod_edge_event_copy(event) };
> +            if event.is_null() {
> +                return Err(Error::OperationFailed(
> +                    "Gpio EdgeEvent copy",
> +                    IoError::last(),
> +                ));
> +            }
> +
> +            Ok(Self {
> +                ibuffer: None,
> +                event,
> +            })
> +        } else {
> +            Ok(Self {
> +                ibuffer: Some(ibuffer.clone()),
> +                event,
> +            })
> +        }
> +    }

This is both a new() and a clone(). Split them out.

> +
> +    /// Get the event type.
> +    pub fn get_event_type(&self) -> Result<LineEdgeEvent> {
> +        LineEdgeEvent::new(unsafe { bindings::gpiod_edge_event_get_event_type(self.event) } as u32)
> +    }
> +
> +    /// Get the timestamp of the event.
> +    pub fn get_timestamp(&self) -> Duration {
> +        Duration::from_nanos(unsafe { bindings::gpiod_edge_event_get_timestamp_ns(self.event) })
> +    }
> +
> +    /// Get the offset of the line on which the event was triggered.
> +    pub fn get_line_offset(&self) -> u32 {
> +        unsafe { bindings::gpiod_edge_event_get_line_offset(self.event) }
> +    }
> +
> +    /// Get the global sequence number of the event.
> +    ///
> +    /// Returns sequence number of the event relative to all lines in the
> +    /// associated line request.
> +    pub fn get_global_seqno(&self) -> u64 {
> +        unsafe { bindings::gpiod_edge_event_get_global_seqno(self.event) }
> +    }
> +
> +    /// Get the event sequence number specific to concerned line.
> +    ///
> +    /// Returns sequence number of the event relative to the line within the
> +    /// lifetime of the associated line request.
> +    pub fn get_line_seqno(&self) -> u64 {
> +        unsafe { bindings::gpiod_edge_event_get_line_seqno(self.event) }
> +    }
> +}
> +
> +impl Drop for EdgeEvent {
> +    /// Free the edge event.
> +    fn drop(&mut self) {
> +        // Free the event only if a copy is made
> +        if self.ibuffer.is_none() {
> +            unsafe { bindings::gpiod_edge_event_free(self.event) };
> +        }
> +    }
> +}
> diff --git a/bindings/rust/src/event_buffer.rs b/bindings/rust/src/event_buffer.rs
> new file mode 100644
> index 000000000000..bb568a80e09c
> --- /dev/null
> +++ b/bindings/rust/src/event_buffer.rs
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::c_ulong;
> +use std::sync::Arc;
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, EdgeEvent, Error, Result};
> +
> +/// Line edge events buffer
> +pub(crate) struct EdgeEventBufferInternal {
> +    buffer: *mut bindings::gpiod_edge_event_buffer,
> +}
> +
> +impl EdgeEventBufferInternal {
> +    /// Create a new edge event buffer.
> +    ///
> +    /// If capacity equals 0, it will be set to a default value of 64. If
> +    /// capacity is larger than 1024, it will be limited to 1024.
> +    pub fn new(capacity: u32) -> Result<Self> {

Use usize not u32 for array sizes throughout.

> +        let buffer = unsafe { bindings::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> +        if buffer.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio EdgeEventBuffer new",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { buffer })
> +    }
> +
> +    /// Private helper, Returns gpiod_edge_event_buffer
> +    pub(crate) fn buffer(&self) -> *mut bindings::gpiod_edge_event_buffer {
> +        self.buffer
> +    }
> +}
> +
> +impl Drop for EdgeEventBufferInternal {
> +    /// Free the edge event buffer and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_edge_event_buffer_free(self.buffer) };
> +    }
> +}
> +
> +/// Line edge events buffer
> +pub struct EdgeEventBuffer {
> +    ibuffer: Arc<EdgeEventBufferInternal>,
> +}
> +
> +impl EdgeEventBuffer {
> +    /// Create a new edge event buffer.
> +    ///
> +    /// If capacity equals 0, it will be set to a default value of 64. If
> +    /// capacity is larger than 1024, it will be limited to 1024.
> +    pub fn new(capacity: u32) -> Result<Self> {
> +        Ok(Self {
> +            ibuffer: Arc::new(EdgeEventBufferInternal::new(capacity)?),
> +        })
> +    }
> +
> +    /// Private helper, Returns gpiod_edge_event_buffer
> +    pub(crate) fn buffer(&self) -> *mut bindings::gpiod_edge_event_buffer {
> +        self.ibuffer.buffer()
> +    }
> +
> +    /// Get the capacity of the event buffer.
> +    pub fn get_capacity(&self) -> u32 {
> +        unsafe { bindings::gpiod_edge_event_buffer_get_capacity(self.buffer()) as u32 }
> +    }

Follow the Vec API and make this capacity().
num_events() becomes len().

> +
> +    /// Read an event stored in the buffer.
> +    pub fn get_event(&self, index: u64) -> Result<EdgeEvent> {
> +        EdgeEvent::new(&self.ibuffer, index, false)
> +    }
> +
> +    /// Make copy of an edge event stored in the buffer.
> +    pub fn get_event_copy(&self, index: u64) -> Result<EdgeEvent> {
> +        EdgeEvent::new(&self.ibuffer, index, true)
> +    }

impl Clone for EdgeEvent instead.

> +
> +    /// Get the number of events the buffers stores.

stores -> contains

The capacity indicates the number that can be stored.
This field indicates the number the buffer currently contains.

And, as mentioned above, rename to len(), and return value should be
usize.

Add a set_len() method to replace the max_events parameter in
LineRequest::read_edge_event() to handle the unusual case where the user
only wants to partially fill the buffer.

> +    pub fn get_num_events(&self) -> u32 {
> +        unsafe { bindings::gpiod_edge_event_buffer_get_num_events(self.buffer()) as u32 }
> +    }
> +}
> diff --git a/bindings/rust/src/info_event.rs b/bindings/rust/src/info_event.rs
> new file mode 100644
> index 000000000000..ffba23f350be
> --- /dev/null
> +++ b/bindings/rust/src/info_event.rs
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::convert::TryFrom;
> +use std::sync::Arc;
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, ChipInternal, Error, Event, LineInfo, Result};
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
> +pub struct InfoEvent {
> +    event: *mut bindings::gpiod_info_event,
> +}
> +
> +impl InfoEvent {
> +    /// Get a single chip's line's status change event.
> +    pub(crate) fn new(ichip: &Arc<ChipInternal>) -> Result<Self> {
> +        let event = unsafe { bindings::gpiod_chip_read_info_event(ichip.chip()) };
> +        if event.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio InfoEvent event-read",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { event })
> +    }
> +
> +    /// Private helper, Returns gpiod_info_event
> +    pub(crate) fn event(&self) -> *mut bindings::gpiod_info_event {
> +        self.event
> +    }
> +
> +    /// Get the event type of the status change event.
> +    pub fn get_event_type(&self) -> Result<Event> {
> +        Event::new(unsafe { bindings::gpiod_info_event_get_event_type(self.event) } as u32)
> +    }
> +
> +    /// Get the timestamp of the event, read from the monotonic clock.
> +    pub fn get_timestamp(&self) -> Duration {
> +        Duration::from_nanos(unsafe { bindings::gpiod_info_event_get_timestamp_ns(self.event) })
> +    }
> +
> +    /// Get the line-info object associated with the event.
> +    pub fn line_info(&self) -> Result<LineInfo> {
> +        LineInfo::try_from(self)
> +    }
> +}
> +
> +impl Drop for InfoEvent {
> +    /// Free the info event object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_info_event_free(self.event) }
> +    }
> +}
> diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
> new file mode 100644
> index 000000000000..2f2ac515d353
> --- /dev/null
> +++ b/bindings/rust/src/lib.rs
> @@ -0,0 +1,317 @@
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
> +mod chip;
> +mod chip_info;
> +mod edge_event;
> +mod event_buffer;
> +mod info_event;
> +mod line_config;
> +mod line_info;
> +mod line_request;
> +mod request_config;
> +
> +use libgpiod_sys as bindings;

I find the original name clearer.
From the end user's perspective THIS module is the bindings.
If you want a short name how about "gpiod"?

> +
> +pub use crate::chip::*;
> +pub use crate::edge_event::*;
> +pub use crate::event_buffer::*;
> +pub use crate::info_event::*;
> +pub use crate::line_config::*;
> +pub use crate::line_info::*;
> +pub use crate::line_request::*;
> +pub use crate::request_config::*;
> +
> +use std::os::raw::c_char;
> +use std::{slice, str};
> +
> +use thiserror::Error as ThisError;
> +use vmm_sys_util::errno::Error as IoError;
> +

IoError could be confused with std::io::Error.
This is just an Errno.

> +/// Result of libgpiod operations
> +pub type Result<T> = std::result::Result<T, Error>;
> +
> +/// Error codes for libgpiod operations
> +#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
> +pub enum Error {
> +    #[error("Failed to find {0}")]

"find" implies a search.  Where it is used it is just a get.

> +    NameNotFound(&'static str),

This is used when the C API returns a NULL char *.
Not sure "NameNotFound" indicates that.
It is a specific case of InvalidValue.
Maybe NullString?

> +    #[error("Invalid String: {0:?}")]
> +    InvalidString(str::Utf8Error),

Specifically the string is not UTF8, so "InvalidString" is a bit vague.

> +    #[error("Invalid {0} value: {1}")]
> +    InvalidValue(&'static str, u32),

And this is an InvalidEnumValue.

> +    #[error("Operation {0} Failed: {1}")]
> +    OperationFailed(&'static str, IoError),

Use an enum for the operation rather than a string?

And if it returns an IoError it must be an IoOperation?
Else if the IoError is just an errno then call it that.

> +    #[error("Operation Timed-out")]
> +    OperationTimedOut,

No indication which operation?

Scratch that - this error should be removed.
Refer to comments where used below.

> +}
> +
> +/// Direction settings.
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
> +            bindings::GPIOD_LINE_DIRECTION_AS_IS => Ok(Direction::AsIs),
> +            bindings::GPIOD_LINE_DIRECTION_INPUT => Ok(Direction::Input),
> +            bindings::GPIOD_LINE_DIRECTION_OUTPUT => Ok(Direction::Output),
> +            _ => Err(Error::InvalidValue("direction", dir)),
> +        }
> +    }
> +
> +    fn gpiod_direction(&self) -> u32 {
> +        match self {
> +            Direction::AsIs => bindings::GPIOD_LINE_DIRECTION_AS_IS,
> +            Direction::Input => bindings::GPIOD_LINE_DIRECTION_INPUT,
> +            Direction::Output => bindings::GPIOD_LINE_DIRECTION_OUTPUT,
> +        }
> +    }
> +}
> +
> +/// Internal bias settings.
> +pub enum Bias {
> +    /// Don't change the bias setting when applying line config.
> +    AsIs,
> +    /// The internal bias state is unknown.
> +    Unknown,
> +    /// The internal bias is disabled.
> +    Disabled,
> +    /// The internal pull-up bias is enabled.
> +    PullUp,
> +    /// The internal pull-down bias is enabled.
> +    PullDown,
> +}
> +

Bias fields should be Option<Bias>
AsIs only makes sense in requests and should be None.
Unknown only makes sense in responses and should be None.

> +impl Bias {
> +    fn new(bias: u32) -> Result<Self> {
> +        match bias {
> +            bindings::GPIOD_LINE_BIAS_AS_IS => Ok(Bias::AsIs),
> +            bindings::GPIOD_LINE_BIAS_UNKNOWN => Ok(Bias::Unknown),
> +            bindings::GPIOD_LINE_BIAS_DISABLED => Ok(Bias::Disabled),
> +            bindings::GPIOD_LINE_BIAS_PULL_UP => Ok(Bias::PullUp),
> +            bindings::GPIOD_LINE_BIAS_PULL_DOWN => Ok(Bias::PullDown),
> +            _ => Err(Error::InvalidValue("bias", bias)),
> +        }
> +    }
> +
> +    fn gpiod_bias(&self) -> u32 {
> +        match self {
> +            Bias::AsIs => bindings::GPIOD_LINE_BIAS_AS_IS,
> +            Bias::Unknown => bindings::GPIOD_LINE_BIAS_UNKNOWN,
> +            Bias::Disabled => bindings::GPIOD_LINE_BIAS_DISABLED,
> +            Bias::PullUp => bindings::GPIOD_LINE_BIAS_PULL_UP,
> +            Bias::PullDown => bindings::GPIOD_LINE_BIAS_PULL_DOWN,
> +        }
> +    }
> +}
> +
> +/// Drive settings.
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
> +            bindings::GPIOD_LINE_DRIVE_PUSH_PULL => Ok(Drive::PushPull),
> +            bindings::GPIOD_LINE_DRIVE_OPEN_DRAIN => Ok(Drive::OpenDrain),
> +            bindings::GPIOD_LINE_DRIVE_OPEN_SOURCE => Ok(Drive::OpenSource),
> +            _ => Err(Error::InvalidValue("drive", drive)),
> +        }
> +    }
> +
> +    fn gpiod_drive(&self) -> u32 {
> +        match self {
> +            Drive::PushPull => bindings::GPIOD_LINE_DRIVE_PUSH_PULL,
> +            Drive::OpenDrain => bindings::GPIOD_LINE_DRIVE_OPEN_DRAIN,
> +            Drive::OpenSource => bindings::GPIOD_LINE_DRIVE_OPEN_SOURCE,
> +        }
> +    }
> +}
> +
> +/// Edge detection settings.
> +pub enum Edge {
> +    /// Line edge detection is disabled.
> +    None,
> +    /// Line detects rising edge events.
> +    Rising,
> +    /// Line detects falling edge events.
> +    Falling,
> +    /// Line detects both rising and falling edge events.
> +    Both,
> +}
> +

As per Bias, the None case should be provided by making the field an
Option where used.

> +impl Edge {
> +    fn new(edge: u32) -> Result<Self> {
> +        match edge {
> +            bindings::GPIOD_LINE_EDGE_NONE => Ok(Edge::None),
> +            bindings::GPIOD_LINE_EDGE_RISING => Ok(Edge::Rising),
> +            bindings::GPIOD_LINE_EDGE_FALLING => Ok(Edge::Falling),
> +            bindings::GPIOD_LINE_EDGE_BOTH => Ok(Edge::Both),
> +            _ => Err(Error::InvalidValue("edge", edge)),
> +        }
> +    }
> +
> +    fn gpiod_edge(&self) -> u32 {
> +        match self {
> +            Edge::None => bindings::GPIOD_LINE_EDGE_NONE,
> +            Edge::Rising => bindings::GPIOD_LINE_EDGE_RISING,
> +            Edge::Falling => bindings::GPIOD_LINE_EDGE_FALLING,
> +            Edge::Both => bindings::GPIOD_LINE_EDGE_BOTH,
> +        }
> +    }
> +}
> +
> +/// Line config settings.
> +pub enum Config {

Rename to SettingKind.
(see comments in line-config)

> +    /// Line direction.
> +    Direction,
> +    /// Edge detection.
> +    EdgeDetection,
> +    /// Bias.
> +    Bias,
> +    /// Drive.
> +    Drive,
> +    /// Active-low setting.
> +    ActiveLow,
> +    /// Debounce period.
> +    DebouncePeriodUs,
> +    /// Event clock type.
> +    EventClock,
> +    /// Output value.
> +    OutputValue,
> +}
> +
> +impl Config {
> +    fn new(config: u32) -> Result<Self> {
> +        match config {
> +            bindings::GPIOD_LINE_CONFIG_PROP_DIRECTION => Ok(Config::Direction),
> +            bindings::GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION => Ok(Config::EdgeDetection),
> +            bindings::GPIOD_LINE_CONFIG_PROP_BIAS => Ok(Config::Bias),
> +            bindings::GPIOD_LINE_CONFIG_PROP_DRIVE => Ok(Config::Drive),
> +            bindings::GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW => Ok(Config::ActiveLow),
> +            bindings::GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US => Ok(Config::DebouncePeriodUs),
> +            bindings::GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK => Ok(Config::EventClock),
> +            bindings::GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE => Ok(Config::OutputValue),
> +            _ => Err(Error::InvalidValue("config", config)),
> +        }
> +    }
> +}
> +
> +/// Event clock settings.
> +pub enum EventClock {
> +    /// Line uses the monotonic clock for edge event timestamps.
> +    Monotonic,
> +    /// Line uses the realtime clock for edge event timestamps.
> +    Realtime,
> +}
> +
> +impl EventClock {
> +    fn new(clock: u32) -> Result<Self> {
> +        match clock {
> +            bindings::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => Ok(EventClock::Monotonic),
> +            bindings::GPIOD_LINE_EVENT_CLOCK_REALTIME => Ok(EventClock::Realtime),
> +            _ => Err(Error::InvalidValue("event clock", clock)),
> +        }
> +    }
> +
> +    fn gpiod_clock(&self) -> u32 {
> +        match self {
> +            EventClock::Monotonic => bindings::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
> +            EventClock::Realtime => bindings::GPIOD_LINE_EVENT_CLOCK_REALTIME,
> +        }
> +    }
> +}
> +
> +/// Line status change event types.
> +pub enum Event {
> +    /// Line has been requested.
> +    LineRequested,
> +    /// Previously requested line has been released.
> +    LineReleased,
> +    /// Line configuration has changed.
> +    LineConfigChanged,
> +}

This is not an Event.  It is a LineInfoChange or LineInfoChangeKind.

And then the "Line" prefix is redundant.

> +
> +impl Event {
> +    fn new(event: u32) -> Result<Self> {
> +        match event {
> +            bindings::GPIOD_INFO_EVENT_LINE_REQUESTED => Ok(Event::LineRequested),
> +            bindings::GPIOD_INFO_EVENT_LINE_RELEASED => Ok(Event::LineReleased),
> +            bindings::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => Ok(Event::LineConfigChanged),
> +            _ => Err(Error::InvalidValue("event", event)),
> +        }
> +    }
> +}
> +
> +#[derive(Copy, Clone)]
> +/// Edge event types.
> +pub enum LineEdgeEvent {
> +    /// Rising edge event.
> +    Rising,
> +    /// Falling edge event.
> +    Falling,
> +}
> +

Similarly LineEdge or LineEdgeKind.

> +impl LineEdgeEvent {
> +    fn new(event: u32) -> Result<Self> {
> +        match event {
> +            bindings::GPIOD_EDGE_EVENT_RISING_EDGE => Ok(LineEdgeEvent::Rising),
> +            bindings::GPIOD_EDGE_EVENT_FALLING_EDGE => Ok(LineEdgeEvent::Falling),
> +            _ => Err(Error::InvalidValue("edge event", event)),
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
> +pub fn gpiod_is_gpiochip_device(path: &str) -> bool {
> +    // Null-terminate the string
> +    let path = path.to_owned() + "\0";
> +
> +    unsafe { bindings::gpiod_is_gpiochip_device(path.as_ptr() as *const c_char) }
> +}
> +

The "gpiod_" prefix is redundant for top level functions in the crate.

> +/// Get the API version of the library as a human-readable string.
> +pub fn gpiod_version_string() -> Result<&'static str> {
> +    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
> +    let version = unsafe { bindings::gpiod_version_string() };
> +
> +    if version.is_null() {
> +        return Err(Error::NameNotFound("GPIO library version"));
> +    }
> +
> +    // SAFETY: The string is guaranteed to be valid here.
> +    str::from_utf8(unsafe {
> +        slice::from_raw_parts(version as *const u8, bindings::strlen(version) as usize)
> +    })
> +    .map_err(Error::InvalidString)
> +}
> diff --git a/bindings/rust/src/line_config.rs b/bindings/rust/src/line_config.rs
> new file mode 100644
> index 000000000000..0fc8d0b736a3
> --- /dev/null
> +++ b/bindings/rust/src/line_config.rs
> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::EINVAL;
> +use std::os::raw::c_ulong;
> +use std::time::Duration;
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, Bias, Config, Direction, Drive, Edge, Error, EventClock, Result};
> +
> +/// Line configuration objects.
> +///
> +/// The line-config object contains the configuration for lines that can be
> +/// used in two cases:
> +///  - when making a line request
> +///  - when reconfiguring a set of already requested lines.
> +///
> +/// A new line-config object is instantiated with a set of sane defaults
> +/// for all supported configuration settings. Those defaults can be modified by
> +/// the caller. Default values can be overridden by applying different values
> +/// for specific lines. When making a request or reconfiguring an existing one,
> +/// the overridden settings for specific lines take precedence. For lines
> +/// without an override the requested default settings are used.
> +///
> +/// For every setting there are two mutators (one setting the default and one
> +/// for the per-line override), two getters (one for reading the global
> +/// default and one for retrieving the effective value for the line),
> +/// a function for testing if a setting is overridden for the line
> +/// and finally a function for clearing the overrides (per line).
> +///

Add a Setting enum that has a variant for each setting.
Then you only need 3 mutators total.
And the user can define configs as a list of Settings.
So perhaps the mutators should accept &[Setting].
And &[offsets] rather than just offset.

Similarly, gets can be consolidated into:

  get_prop_offset(self, offset, SettingKind) -> Result<Setting>

and
  get_prop_default(self, SettingKind) -> Result<Setting>

(simplified signatures)

As per my comments to the Python bindings, I question the value of the
default/override/clear pattern over a straight up set, but this is
at least consistent with the other bindings.

> +/// The mutators don't return errors. If the set of options is too complex to
> +/// be translated into kernel uAPI structures then an error will be returned at
> +/// the time of the request or reconfiguration. If an invalid value was passed
> +/// to any of the mutators then the default value will be silently used instead.
> +///
> +/// Operating on lines in struct LineConfig has no immediate effect on real
> +/// GPIOs, it only manipulates the config object in memory.  Those changes are
> +/// only applied to the hardware at the time of the request or reconfiguration.
> +///
> +/// Overrides for lines that don't end up being requested are silently ignored
> +/// both in LineRequest::new() as well as in LineRequest::reconfigure_lines().
> +///
> +/// In cases where all requested lines are using the one configuration, the
> +/// line overrides can be entirely ignored when preparing the configuration.
> +
> +pub struct LineConfig {
> +    config: *mut bindings::gpiod_line_config,
> +}
> +
> +impl LineConfig {
> +    /// Create a new line config object.
> +    pub fn new() -> Result<Self> {
> +        let config = unsafe { bindings::gpiod_line_config_new() };
> +
> +        if config.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineConfig new",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { config })
> +    }
> +
> +    /// Private helper, Returns gpiod_line_config
> +    pub(crate) fn config(&self) -> *mut bindings::gpiod_line_config {
> +        self.config
> +    }
> +
> +    /// Resets the entire configuration stored in the object. This is useful if
> +    /// the user wants to reuse the object without reallocating it.
> +    pub fn reset(&mut self) {
> +        unsafe { bindings::gpiod_line_config_reset(self.config) }
> +    }
> +
> +    /// Set the default line direction.
> +    pub fn set_direction_default(&mut self, direction: Direction) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_direction_default(
> +                self.config,
> +                direction.gpiod_direction() as i32,
> +            )
> +        }
> +    }
> +
> +    /// Set the direction for a line.
> +    pub fn set_direction_override(&mut self, direction: Direction, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_direction_override(
> +                self.config,
> +                direction.gpiod_direction() as i32,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// Clear the direction for a line.
> +    pub fn clear_direction_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_direction_override(self.config, offset) }
> +    }
> +
> +    /// Check if the direction is overridden for a line.
> +    pub fn direction_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_direction_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default direction setting.
> +    pub fn get_direction_default(&self) -> Result<Direction> {
> +        Direction::new(
> +            unsafe { bindings::gpiod_line_config_get_direction_default(self.config) } as u32,
> +        )
> +    }
> +
> +    /// Get the direction of a given line.
> +    ///
> +    /// Direction setting for the line if the config object were used in a request.
> +    pub fn get_direction_offset(&self, offset: u32) -> Result<Direction> {
> +        Direction::new(unsafe {
> +            bindings::gpiod_line_config_get_direction_offset(self.config, offset)
> +        } as u32)
> +    }
> +
> +    /// Set the default edge event detection setting.
> +    pub fn set_edge_detection_default(&mut self, edge: Edge) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_edge_detection_default(
> +                self.config,
> +                edge.gpiod_edge() as i32,
> +            )
> +        }
> +    }
> +
> +    /// Set the edge event detection for a single line.
> +    pub fn set_edge_detection_override(&mut self, edge: Edge, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_edge_detection_override(
> +                self.config,
> +                edge.gpiod_edge() as i32,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// Clear the edge event detection for a single line.
> +    pub fn clear_edge_detection_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_edge_detection_override(self.config, offset) }
> +    }
> +
> +    /// Check if the edge event detection is overridden for a line.
> +    pub fn edge_detection_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_edge_detection_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default edge event detection setting.
> +    pub fn get_edge_detection_default(&self) -> Result<Edge> {
> +        Edge::new(
> +            unsafe { bindings::gpiod_line_config_get_edge_detection_default(self.config) } as u32,
> +        )
> +    }
> +
> +    /// Get the edge event detection setting for a given line.
> +    ///
> +    /// Edge event detection setting for the line if the config object were used in a request.
> +    pub fn get_edge_detection_offset(&self, offset: u32) -> Result<Edge> {
> +        Edge::new(unsafe {
> +            bindings::gpiod_line_config_get_edge_detection_offset(self.config, offset)
> +        } as u32)
> +    }
> +
> +    /// Set the default bias setting.
> +    pub fn set_bias_default(&mut self, bias: Bias) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_bias_default(self.config, bias.gpiod_bias() as i32)
> +        }
> +    }
> +
> +    /// Set the bias for a single line.
> +    pub fn set_bias_override(&mut self, bias: Bias, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_bias_override(
> +                self.config,
> +                bias.gpiod_bias() as i32,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// Clear the bias for a single line.
> +    pub fn clear_bias_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_bias_override(self.config, offset) }
> +    }
> +
> +    /// Check if the bias is overridden for a line.
> +    pub fn bias_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_bias_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default bias setting.
> +    pub fn get_bias_default(&self) -> Result<Bias> {
> +        Bias::new(unsafe { bindings::gpiod_line_config_get_bias_default(self.config) } as u32)
> +    }
> +
> +    /// Get the bias setting for a given line.
> +    ///
> +    /// Bias setting used for the line if the config object were used in a request.
> +    pub fn get_bias_offset(&self, offset: u32) -> Result<Bias> {
> +        Bias::new(
> +            unsafe { bindings::gpiod_line_config_get_bias_offset(self.config, offset) } as u32,
> +        )
> +    }
> +
> +    /// Set the default drive setting.
> +    pub fn set_drive_default(&mut self, drive: Drive) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_drive_default(self.config, drive.gpiod_drive() as i32)
> +        }
> +    }
> +
> +    /// Set the drive for a single line.
> +    pub fn set_drive_override(&mut self, drive: Drive, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_drive_override(
> +                self.config,
> +                drive.gpiod_drive() as i32,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// clear the drive for a single line.
> +    pub fn clear_drive_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_drive_override(self.config, offset) }
> +    }
> +
> +    /// Check if the drive is overridden for a line.
> +    pub fn drive_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_drive_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default drive setting.
> +    pub fn get_drive_default(&self) -> Result<Drive> {
> +        Drive::new(unsafe { bindings::gpiod_line_config_get_drive_default(self.config) } as u32)
> +    }
> +
> +    /// Get the drive setting for a given line.
> +    ///
> +    /// The offset of the line for which to read the drive setting. Drive setting for the line if
> +    /// the config object were used in a request.
> +    pub fn get_drive_offset(&self, offset: u32) -> Result<Drive> {
> +        Drive::new(
> +            unsafe { bindings::gpiod_line_config_get_drive_offset(self.config, offset) } as u32,
> +        )
> +    }
> +
> +    /// Set default active-low setting.
> +    pub fn set_active_low_default(&mut self, active_low: bool) {
> +        unsafe { bindings::gpiod_line_config_set_active_low_default(self.config, active_low) }
> +    }
> +
> +    /// Set active-low setting for a single line.
> +    pub fn set_active_low_override(&mut self, active_low: bool, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_active_low_override(self.config, active_low, offset)
> +        }
> +    }
> +
> +    /// Clear a single line's active-low setting.
> +    pub fn clear_active_low_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_active_low_override(self.config, offset) }
> +    }
> +
> +    /// Check if the active-low is overridden for a line.
> +    pub fn active_low_is_overridden(&mut self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_active_low_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Check the default active-low setting.
> +    pub fn get_active_low_default(&self) -> bool {
> +        unsafe { bindings::gpiod_line_config_get_active_low_default(self.config) }
> +    }
> +
> +    /// Check the active-low setting of a line.
> +    ///
> +    /// Active-low setting for the line if the config object were used in a request.
> +    pub fn get_active_low_offset(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_get_active_low_offset(self.config, offset) }
> +    }
> +
> +    /// Set the deafult debounce period setting.

default

> +    pub fn set_debounce_period_default(&mut self, period: Duration) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_debounce_period_us_default(
> +                self.config,
> +                period.as_micros() as u64,
> +            )
> +        }
> +    }
> +
> +    /// Set the debounce period for a single line.
> +    pub fn set_debounce_period_override(&mut self, period: Duration, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_debounce_period_us_override(
> +                self.config,
> +                period.as_micros() as u64,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// Clear the debounce period for a single line.
> +    pub fn clear_debounce_period_override(&mut self, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_clear_debounce_period_us_override(self.config, offset)
> +        }
> +    }
> +
> +    /// Check if the debounce period setting is overridden.
> +    pub fn debounce_period_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_debounce_period_us_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default debounce period.
> +    pub fn get_debounce_period_default(&self) -> Result<Duration> {
> +        Ok(Duration::from_micros(unsafe {
> +            bindings::gpiod_line_config_get_debounce_period_us_default(self.config)
> +        }))
> +    }
> +
> +    /// Get the debounce period for a given line.
> +    ///
> +    /// Debounce period for the line if the config object were used in a request, 0 if debouncing
> +    /// is disabled.
> +    pub fn get_debounce_period_offset(&self, offset: u32) -> Result<Duration> {
> +        Ok(Duration::from_micros(unsafe {
> +            bindings::gpiod_line_config_get_debounce_period_us_offset(self.config, offset)
> +        }))
> +    }
> +
> +    /// Set the default event clock setting.
> +    pub fn set_event_clock_default(&mut self, clock: EventClock) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_event_clock_default(
> +                self.config,
> +                clock.gpiod_clock() as i32,
> +            )
> +        }
> +    }
> +
> +    /// Set the event clock for a single line.
> +    pub fn set_event_clock_override(&mut self, clock: EventClock, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_event_clock_override(
> +                self.config,
> +                clock.gpiod_clock() as i32,
> +                offset,
> +            )
> +        }
> +    }
> +
> +    /// Clear the event clock for a single line.
> +    pub fn clear_event_clock_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_event_clock_override(self.config, offset) }
> +    }
> +
> +    /// Check if the event clock is overridden for a line.
> +    pub fn event_clock_is_overridden(&mut self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_event_clock_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default event clock setting.
> +    pub fn get_event_clock_default(&self) -> Result<EventClock> {
> +        EventClock::new(
> +            unsafe { bindings::gpiod_line_config_get_event_clock_default(self.config) } as u32,
> +        )
> +    }
> +
> +    /// Get the event clock setting for a given line.
> +    ///
> +    /// Event clock setting for the line if the config object were used in a request.
> +    pub fn get_event_clock_offset(&self, offset: u32) -> Result<EventClock> {
> +        EventClock::new(unsafe {
> +            bindings::gpiod_line_config_get_event_clock_offset(self.config, offset)
> +        } as u32)
> +    }
> +
> +    /// Set the default output value setting.
> +    pub fn set_output_value_default(&mut self, value: u32) {
> +        unsafe { bindings::gpiod_line_config_set_output_value_default(self.config, value as i32) }
> +    }
> +

Make value an enum (active/inactive) not a u32 throughout.
Perhaps give offsets a type as well.

> +    /// Set the output value for a line.
> +    pub fn set_output_value_override(&mut self, value: u32, offset: u32) {
> +        unsafe {
> +            bindings::gpiod_line_config_set_output_value_override(self.config, value as i32, offset)
> +        }
> +    }
> +
> +    /// Set the output values for a set of lines.
> +    pub fn set_output_values(&mut self, offsets: &[u32], values: &[i32]) -> Result<()> {
> +        if offsets.len() != values.len() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineConfig array size mismatch",
> +                IoError::new(EINVAL),
> +            ));
> +        }
> +
> +        unsafe {
> +            bindings::gpiod_line_config_set_output_values(
> +                self.config,
> +                values.len() as c_ulong,
> +                offsets.as_ptr(),
> +                values.as_ptr(),
> +            );
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Clear the output value for a line.
> +    pub fn clear_output_value_override(&mut self, offset: u32) {
> +        unsafe { bindings::gpiod_line_config_clear_output_value_override(self.config, offset) }
> +    }
> +
> +    /// Check if the output value is overridden for a line.
> +    pub fn output_value_is_overridden(&self, offset: u32) -> bool {
> +        unsafe { bindings::gpiod_line_config_output_value_is_overridden(self.config, offset) }
> +    }
> +
> +    /// Get the default output value, 0 or 1.
> +    pub fn get_output_value_default(&self) -> Result<u32> {
> +        let value = unsafe { bindings::gpiod_line_config_get_output_value_default(self.config) };
> +
> +        if value != 0 && value != 1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineConfig get-output-value",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(value as u32)
> +        }
> +    }
> +
> +    /// Get the output value configured for a given line, 0 or 1.
> +    pub fn get_output_value_offset(&self, offset: u32) -> Result<u32> {
> +        let value =
> +            unsafe { bindings::gpiod_line_config_get_output_value_offset(self.config, offset) };
> +
> +        if value != 0 && value != 1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineConfig get-output-value",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(value as u32)
> +        }
> +    }
> +
> +    /// Get the list of overridden offsets and the corresponding types of overridden settings.
> +    pub fn get_overrides(&self) -> Result<Vec<(u32, Config)>> {
> +        let num = unsafe { bindings::gpiod_line_config_get_num_overrides(self.config) } as usize;
> +        if num == 0 {
> +            return Ok(Vec::new());
> +        }
> +
> +        let mut overrides = Vec::new();
> +        let mut offset = vec![0_u32; num];
> +        let mut props = vec![0_i32; num];
> +
> +        unsafe {
> +            bindings::gpiod_line_config_get_overrides(
> +                self.config,
> +                offset.as_mut_ptr(),
> +                props.as_mut_ptr(),
> +            )
> +        };
> +
> +        for i in 0..num {
> +            overrides.push((offset[i], Config::new(props[i] as u32)?));
> +        }
> +
> +        Ok(overrides)
> +    }
> +}
> +
> +impl Drop for LineConfig {
> +    /// Free the line config object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_line_config_free(self.config) }
> +    }
> +}
> diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
> new file mode 100644
> index 000000000000..70b6bd6a84bb
> --- /dev/null
> +++ b/bindings/rust/src/line_info.rs
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::convert::TryFrom;
> +use std::sync::Arc;
> +use std::time::Duration;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{
> +    bindings, Bias, ChipInternal, Direction, Drive, Edge, Error, EventClock, InfoEvent, Result,
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
> +pub struct LineInfo {
> +    info: *mut bindings::gpiod_line_info,
> +    ichip: Option<Arc<ChipInternal>>,
> +    free: bool,

This flag makes no sense - the info always needs to be freed no matter
which path, watched or not, was taken to get it from the C API.

Implement a gpiowatch example to demonstrate using this part of the API.

> +}
> +
> +impl LineInfo {
> +    /// Get a snapshot of information about the line and optionally start watching it for changes.
> +    pub(crate) fn new(ichip: Arc<ChipInternal>, offset: u32, watch: bool) -> Result<Self> {
> +        let info = if watch {
> +            unsafe { bindings::gpiod_chip_watch_line_info(ichip.chip(), offset) }
> +        } else {
> +            unsafe { bindings::gpiod_chip_get_line_info(ichip.chip(), offset) }
> +        };
> +
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineInfo line-info",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            info,
> +            ichip: if watch { Some(ichip) } else { None },
> +            free: watch,
> +        })
> +    }
> +

Why bother implementing the get and watch cases in the one function?
Move the corresponding path into where it is called in the chip methods
and remove this method.

> +    /// Stop watching the line
> +    pub fn unwatch(&mut self) {
> +        if let Some(ichip) = &self.ichip {
> +            unsafe {
> +                bindings::gpiod_chip_unwatch_line_info(ichip.chip(), self.get_offset());
> +            }
> +            self.ichip = None;
> +        }
> +    }
> +

This should be a method of the chip, not the info.

> +    /// Get the offset of the line within the GPIO chip.
> +    ///
> +    /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
> +    /// uniquely identifies the line within the system.
> +
> +    pub fn get_offset(&self) -> u32 {
> +        unsafe { bindings::gpiod_line_info_get_offset(self.info) }
> +    }
> +
> +    /// Get GPIO line's name.
> +    pub fn get_name(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct LineInfo`.
> +        let name = unsafe { bindings::gpiod_line_info_get_name(self.info) };
> +        if name.is_null() {
> +            return Err(Error::NameNotFound("GPIO line's name"));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(name as *const u8, bindings::strlen(name) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Returns True if the line is in use, false otherwise.
> +    ///
> +    /// The user space can't know exactly why a line is busy. It may have been
> +    /// requested by another process or hogged by the kernel. It only matters that
> +    /// the line is used and we can't request it.
> +    pub fn is_used(&self) -> bool {
> +        unsafe { bindings::gpiod_line_info_is_used(self.info) }
> +    }
> +
> +    /// Get the GPIO line's consumer name.
> +    pub fn get_consumer(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct LineInfo`.
> +        let name = unsafe { bindings::gpiod_line_info_get_consumer(self.info) };
> +        if name.is_null() {
> +            return Err(Error::NameNotFound("GPIO line's consumer name"));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(name as *const u8, bindings::strlen(name) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Get the GPIO line's direction.
> +    pub fn get_direction(&self) -> Result<Direction> {
> +        Direction::new(unsafe { bindings::gpiod_line_info_get_direction(self.info) } as u32)
> +    }
> +
> +    /// Returns true if the line is "active-low", false otherwise.
> +    pub fn is_active_low(&self) -> bool {
> +        unsafe { bindings::gpiod_line_info_is_active_low(self.info) }
> +    }
> +
> +    /// Get the GPIO line's bias setting.
> +    pub fn get_bias(&self) -> Result<Bias> {
> +        Bias::new(unsafe { bindings::gpiod_line_info_get_bias(self.info) } as u32)
> +    }
> +
> +    /// Get the GPIO line's drive setting.
> +    pub fn get_drive(&self) -> Result<Drive> {
> +        Drive::new(unsafe { bindings::gpiod_line_info_get_drive(self.info) } as u32)
> +    }
> +
> +    /// Get the current edge detection setting of the line.
> +    pub fn get_edge_detection(&self) -> Result<Edge> {
> +        Edge::new(unsafe { bindings::gpiod_line_info_get_edge_detection(self.info) } as u32)
> +    }
> +
> +    /// Get the current event clock setting used for edge event timestamps.
> +    pub fn get_event_clock(&self) -> Result<EventClock> {
> +        EventClock::new(unsafe { bindings::gpiod_line_info_get_event_clock(self.info) } as u32)
> +    }
> +
> +    /// Returns true if the line is debounced (either by hardware or by the
> +    /// kernel software debouncer), false otherwise.
> +    pub fn is_debounced(&self) -> bool {
> +        unsafe { bindings::gpiod_line_info_is_debounced(self.info) }
> +    }
> +
> +    /// Get the debounce period of the line.
> +    pub fn get_debounce_period(&self) -> Duration {
> +        Duration::from_micros(unsafe {
> +            bindings::gpiod_line_info_get_debounce_period_us(self.info)
> +        })
> +    }
> +}
> +
> +impl TryFrom<&InfoEvent> for LineInfo {

Is try_from appropriate for getting a contained object?
"from" normally refers to a type conversion.

> +    type Error = Error;
> +
> +    /// Get the Line info object associated with a event.
> +    fn try_from(event: &InfoEvent) -> Result<Self> {
> +        let info = unsafe { bindings::gpiod_info_event_get_line_info(event.event()) };
> +        if info.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineInfo try-from",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self {
> +            info,
> +            ichip: None,
> +            free: false,
> +        })
> +    }
> +}
> +
> +impl Drop for LineInfo {
> +    fn drop(&mut self) {
> +        // We must not free the Line info object created from `struct InfoEvent` by calling
> +        // libgpiod API.
> +        if self.free {
> +            self.unwatch();

Why does dropping a LineInfo unwatch the line???

> +            unsafe { bindings::gpiod_line_info_free(self.info) }
> +        }
> +    }
> +}
> diff --git a/bindings/rust/src/line_request.rs b/bindings/rust/src/line_request.rs
> new file mode 100644
> index 000000000000..bb338e72671d
> --- /dev/null
> +++ b/bindings/rust/src/line_request.rs
> @@ -0,0 +1,248 @@
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
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, ChipInternal, EdgeEventBuffer, Error, LineConfig, RequestConfig, Result};
> +
> +/// Line request operations
> +///
> +/// Allows interaction with a set of requested lines.
> +pub struct LineRequest {
> +    request: *mut bindings::gpiod_line_request,
> +}
> +
> +impl LineRequest {
> +    /// Request a set of lines for exclusive usage.
> +    pub(crate) fn new(
> +        ichip: &Arc<ChipInternal>,
> +        rconfig: &RequestConfig,
> +        lconfig: &LineConfig,
> +    ) -> Result<Self> {
> +        let request = unsafe {
> +            bindings::gpiod_chip_request_lines(ichip.chip(), rconfig.config(), lconfig.config())
> +        };
> +
> +        if request.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineRequest request-lines",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { request })
> +    }
> +
> +    /// Get the number of lines in the request.
> +    pub fn get_num_lines(&self) -> u32 {
> +        unsafe { bindings::gpiod_line_request_get_num_lines(self.request) as u32 }
> +    }
> +
> +    /// Get the offsets of lines in the request.
> +    pub fn get_offsets(&self) -> Vec<u32> {
> +        let mut offsets = vec![0; self.get_num_lines() as usize];
> +
> +        unsafe { bindings::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
> +        offsets
> +    }
> +
> +    /// Get the value (0 or 1) of a single line associated with the request.
> +    pub fn get_value(&self, offset: u32) -> Result<u32> {
> +        let value = unsafe { bindings::gpiod_line_request_get_value(self.request, offset) };
> +
> +        if value != 0 && value != 1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest get-value",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(value as u32)
> +        }
> +    }
> +
> +    /// Get values of a subset of lines associated with the request.
> +    pub fn get_values_subset(&self, offsets: &[u32], values: &mut Vec<i32>) -> Result<()> {
> +        if offsets.len() != values.len() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineRequest array size mismatch",
> +                IoError::new(EINVAL),
> +            ));
> +        }
> +

Returned values are awkward to use as the user has to index into them
using the index corresponding to the offset in offsets.
Provide a Values type that maps offset to value, e.g. using an IntMap,
and pass that in instead of separate offsets and values arrays.

Same applies to set_values_subset().

> +        let ret = unsafe {
> +            bindings::gpiod_line_request_get_values_subset(
> +                self.request,
> +                offsets.len() as c_ulong,
> +                offsets.as_ptr(),
> +                values.as_mut_ptr(),
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest get-values-subset",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get values of all lines associated with the request.
> +    pub fn get_values(&self, values: &mut Vec<i32>) -> Result<()> {
> +        if values.len() != self.get_num_lines() as usize {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineRequest array size mismatch",
> +                IoError::new(EINVAL),
> +            ));
> +        }
> +

Incorporating the get_values_subset() comments above, this becomes a
special case of that, so merge the two into one function.

Similarly the sets.

> +        let ret =
> +            unsafe { bindings::gpiod_line_request_get_values(self.request, values.as_mut_ptr()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest get-values",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Set the value of a single line associated with the request.
> +    pub fn set_value(&self, offset: u32, value: i32) -> Result<()> {
> +        let ret = unsafe { bindings::gpiod_line_request_set_value(self.request, offset, !!value) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest set-value",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get values of a subset of lines associated with the request.
> +    pub fn set_values_subset(&self, offsets: &[u32], values: &[i32]) -> Result<()> {
> +        if offsets.len() != values.len() {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineRequest array size mismatch",
> +                IoError::new(EINVAL),
> +            ));
> +        }
> +
> +        let ret = unsafe {
> +            bindings::gpiod_line_request_set_values_subset(
> +                self.request,
> +                offsets.len() as c_ulong,
> +                offsets.as_ptr(),
> +                values.as_ptr(),
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest set-values-subset",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get values of all lines associated with the request.
> +    pub fn set_values(&self, values: &[i32]) -> Result<()> {
> +        if values.len() != self.get_num_lines() as usize {
> +            return Err(Error::OperationFailed(
> +                "Gpio LineRequest array size mismatch",
> +                IoError::new(EINVAL),
> +            ));
> +        }
> +
> +        let ret = unsafe { bindings::gpiod_line_request_set_values(self.request, values.as_ptr()) };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest set-values",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Update the configuration of lines associated with the line request.
> +    pub fn reconfigure_lines(&self, lconfig: &LineConfig) -> Result<()> {
> +        let ret = unsafe {
> +            bindings::gpiod_line_request_reconfigure_lines(self.request, lconfig.config())
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest reconfigure-lines",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Get the file descriptor associated with the line request.
> +    pub fn get_fd(&self) -> u32 {
> +        unsafe { bindings::gpiod_line_request_get_fd(self.request) as u32 }
> +    }
> +
> +    /// Wait for edge events on any of the lines associated with the request.
> +    pub fn wait_edge_event(&self, timeout: Duration) -> Result<()> {
> +        let ret = unsafe {
> +            bindings::gpiod_line_request_wait_edge_event(self.request, timeout.as_nanos() as i64)
> +        };
> +
> +        match ret {
> +            -1 => Err(Error::OperationFailed(
> +                "Gpio LineRequest edge-event-wait",
> +                IoError::last(),
> +            )),
> +            0 => Err(Error::OperationTimedOut),
> +            _ => Ok(()),
> +        }
> +    }
> +

Same comment on Duration/blocking as per info events.
Same comment on return type as per info events.

> +    /// Get a number of edge events from a line request.
> +    ///
> +    /// This function will block if no event was queued for the line.
> +    pub fn read_edge_event(&self, buffer: &EdgeEventBuffer, max_events: u32) -> Result<u32> {

Should be read_edge_events() as it reads multiple.
(same comment applies to the C API, btw)

max_events should be derived from buffer len (assuming EdgeEventBuffer
has a Vec-like API for len and capacity).

> +        let ret = unsafe {
> +            bindings::gpiod_line_request_read_edge_event(
> +                self.request,
> +                buffer.buffer(),
> +                max_events as c_ulong,
> +            )
> +        };
> +
> +        if ret == -1 {
> +            Err(Error::OperationFailed(
> +                "Gpio LineRequest edge-event-read",
> +                IoError::last(),
> +            ))
> +        } else {
> +            Ok(ret as u32)
> +        }
> +    }
> +}
> +
> +impl Drop for LineRequest {
> +    /// Release the requested lines and free all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_line_request_release(self.request) }
> +    }
> +}
> diff --git a/bindings/rust/src/request_config.rs b/bindings/rust/src/request_config.rs
> new file mode 100644
> index 000000000000..3e667d28cc1f
> --- /dev/null
> +++ b/bindings/rust/src/request_config.rs
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::{c_char, c_ulong};
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as IoError;
> +
> +use super::{bindings, Error, Result};
> +
> +/// Request configuration objects
> +///
> +/// Request config objects are used to pass a set of options to the kernel at
> +/// the time of the line request. Similarly to the line-config - the mutators
> +/// don't return error values. If the values are invalid, in general they are
> +/// silently adjusted to acceptable ranges.
> +
> +pub struct RequestConfig {
> +    config: *mut bindings::gpiod_request_config,
> +}
> +
> +impl RequestConfig {
> +    /// Create a new request config object.
> +    pub fn new() -> Result<Self> {
> +        let config = unsafe { bindings::gpiod_request_config_new() };
> +        if config.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio RequestConfig new",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        Ok(Self { config })
> +    }
> +
> +    /// Private helper, Returns gpiod_request_config
> +    pub(crate) fn config(&self) -> *mut bindings::gpiod_request_config {
> +        self.config
> +    }
> +
> +    /// Set the consumer name for the request.
> +    ///
> +    /// If the consumer string is too long, it will be truncated to the max
> +    /// accepted length.
> +    pub fn set_consumer(&self, consumer: &str) {
> +        // Null-terminate the string
> +        let consumer = consumer.to_owned() + "\0";
> +
> +        unsafe {
> +            bindings::gpiod_request_config_set_consumer(
> +                self.config,
> +                consumer.as_ptr() as *const c_char,
> +            )
> +        }
> +    }
> +
> +    /// Get the consumer name configured in the request config.
> +    pub fn get_consumer(&self) -> Result<&str> {
> +        // SAFETY: The string returned by libgpiod is guaranteed to live as long
> +        // as the `struct RequestConfig`.
> +        let consumer = unsafe { bindings::gpiod_request_config_get_consumer(self.config) };
> +        if consumer.is_null() {
> +            return Err(Error::OperationFailed(
> +                "Gpio RequestConfig get-consumer",
> +                IoError::last(),
> +            ));
> +        }
> +
> +        // SAFETY: The string is guaranteed to be valid here.
> +        str::from_utf8(unsafe {
> +            slice::from_raw_parts(consumer as *const u8, bindings::strlen(consumer) as usize)
> +        })
> +        .map_err(Error::InvalidString)
> +    }
> +
> +    /// Set the offsets of the lines to be requested.
> +    ///
> +    /// If too many offsets were specified, the offsets above the limit accepted
> +    /// by the kernel (64 lines) are silently dropped.
> +    pub fn set_offsets(&self, offsets: &[u32]) {
> +        unsafe {
> +            bindings::gpiod_request_config_set_offsets(
> +                self.config,
> +                offsets.len() as c_ulong,
> +                offsets.as_ptr(),
> +            )
> +        }
> +    }
> +
> +    /// Get the offsets of lines in the request config.
> +    pub fn get_offsets(&self) -> Vec<u32> {
> +        let num = unsafe { bindings::gpiod_request_config_get_num_offsets(self.config) };
> +        let mut offsets = vec![0; num as usize];
> +
> +        unsafe { bindings::gpiod_request_config_get_offsets(self.config, offsets.as_mut_ptr()) };
> +        offsets
> +    }
> +
> +    /// Set the size of the kernel event buffer for the request.
> +    ///
> +    /// The kernel may adjust the value if it's too high. If set to 0, the
> +    /// default value will be used.
> +    pub fn set_event_buffer_size(&self, size: u32) {
> +        unsafe {
> +            bindings::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong)
> +        }
> +    }

The kernel may adjust the value regardless - this value is a tentative
suggestion to the kernel (the kernel buffers have to be sized in 2^N, so
it generally rounds up to the next power of 2, within limits).

> +
> +    /// Get the edge event buffer size for the request config.
> +    pub fn get_event_buffer_size(&self) -> u32 {
> +        unsafe { bindings::gpiod_request_config_get_event_buffer_size(self.config) as u32 }
> +    }

You might want to note that this just reads the value from the config.
The actual value used by the kernel is not made available to user space.

> +}
> +
> +impl Drop for RequestConfig {
> +    /// Free the request config object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_request_config_free(self.config) }
> +    }
> +}
> -- 
> 2.31.1.272.g89b43f80a514
> 

Cheers,
Kent.
