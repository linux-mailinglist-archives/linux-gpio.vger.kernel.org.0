Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E4172F8AE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 11:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243906AbjFNJGm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 05:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243895AbjFNJGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 05:06:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00A4198
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 02:06:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b3f8179f51so7977385ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686733595; x=1689325595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe+bsIqeCteAGrtxFO/9xdLNkVI/YEgfgiRYwXvUkLw=;
        b=Qu/B9cO9GxkoxXpqjwqrxchxiHxfIzSxAHnQLX3N3PS1Jhc1mQAErRr87h5GpCoiVX
         aSdme/rAtzluE6XUY6R+Z1yW9g4v5k5b8lAYvL3hl7SmmrknRYiQJ9Ea2JeBCFQupvMB
         Wk+uhez6+CyrC73UzF/z4WRsMCH29phvAwtBjuMTVuJXT52wBd44fcKl8XsQMPU8rocz
         10zGBIIg6a8iL/PNseF37eIjRsB4+IBqOqLINIK8vjsHuHsFIWPvkVYzch6VFhuQqHL+
         AEyWHipagXsWl4DzDuzU3FdZvKiPBM+eftvuxpGMTssTV0ldGExfXZksLYZDDb8PBCZ2
         DDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733595; x=1689325595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe+bsIqeCteAGrtxFO/9xdLNkVI/YEgfgiRYwXvUkLw=;
        b=gn8XqxRVw5OalggM5eecz2SRBmaJBNV+yhzxmjnYT12HE9ILqtm4lyLpgOa3m0opnP
         N7uNS48dLmkyymkb8k8fOb5YvTXk9XfKhQ1kGKmXZWDK1uc533ajAQOdQmBNdHJSG5kJ
         633RX8UvPSDetPw3hwzVMw8RuMzOnI2/JaGIT/YQvTGrLT5zW4rWr4td9nRAdHsbiI/J
         JmOqmQn5f2WfrtQzqCKEYGDocNBiYQKpNQAOM1zuDxqo0iI0IrjsEWVnSF24N83S/Ndo
         LeiUPS6PLRIRaswlh001lRlWfjkp9Onq755mK5SNpwUfek6nxv4m6QKBw4tUiV8PqCIi
         QvZw==
X-Gm-Message-State: AC+VfDzOAb6nJ6x2ElVFrjITCxYKzb5Hfbe6eCdNEDfUUafa3019MfuZ
        i0bkz3KdsSAoawsCGWdfc4Q=
X-Google-Smtp-Source: ACHHUZ79AEv7xnfB8Japjv7tlUaGVJP93rxBgunDtwKD0UEgGDy/fvCa11gzPP/LEYkQYrPQlJx2yg==
X-Received: by 2002:a17:903:22c7:b0:1b3:d25a:5edc with SMTP id y7-20020a17090322c700b001b3d25a5edcmr8464950plg.31.1686733594990;
        Wed, 14 Jun 2023 02:06:34 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id io6-20020a17090312c600b001ab28f620d0sm11708908plb.290.2023.06.14.02.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:06:34 -0700 (PDT)
Date:   Wed, 14 Jun 2023 17:06:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Message-ID: <ZImDFS2ATTxeFxDK@sol>
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
 <ZIl6X8YAUHS/n5s8@sol>
 <CTC8M1AAQDLI.DNPMW5PQHFNK@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTC8M1AAQDLI.DNPMW5PQHFNK@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 10:40:56AM +0200, Erik Schilling wrote:
> On Wed Jun 14, 2023 at 10:29 AM CEST, Kent Gibson wrote:
> > On Wed, Jun 14, 2023 at 10:14:08AM +0200, Erik Schilling wrote:
> > > On Mon Jun 12, 2023 at 5:40 PM CEST, Kent Gibson wrote:
> > > > clippy from Rust 1.70 reports a host of warnings due to casting and type
> > > > conversions across the FFI interface to libgpiod.
> > > > These casts and conversions are required to support old versions of Rust
> > > > that do not support recent Rust FFI extensions.
> > > 
> > > Could you elaborate which extensions are relevant here? Would it be
> > > realistic to just update the minimum Rust version instead of needing
> > > to include these suppression directives?
> > > 
> >
> > Types were added in core::ffi[1] in 1.64 for just this purpose.
> > e.g. c_uint[2]
> > Though c_size_t[3] still remains in Experimental.
> >
> > And I guess the clippy lints followed soon after.
> >
> > Wrt setting the MSRV, but I assumed not, hence the allows.
> 
> For me bindgen seems to generate usize of size_t, thats why I asked.
> Does that depend on the Rust version somehow? Or more concretely:
> When will things like `gpiod_line_config_get_num_configured_offsets`
> not get translated to `usize` so that we need a cast?
> 

No idea - outside my area.

> On my end (with latest toolchain and nightly), I do not see any
> clippy warnings with `cargo clippy`. How exactly did you produce those
> warnings?
> 

Interesting.  With stable on libgpiod master in the rust/libgpiod
directory, and with these in my environment:

export SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1
export SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/"
export SYSTEM_DEPS_LIBGPIOD_LIB=gpiod
export SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"

I get:

$ cargo clippy --tests
warning: casting to the same type is unnecessary (`u32` -> `u32`)
  --> libgpiod/src/info_event.rs:37:29
   |
37 |         InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unsafe { gpiod::gpiod_info_event_get_event_type(self.event) }`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `#[warn(clippy::unnecessary_cast)]` on by default

warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> libgpiod/src/chip.rs:282:18
    |
282 |         unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
    |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_chip_info_get_num_lines(self.info)`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`u32` -> `u32`)
  --> libgpiod/src/edge_event.rs:44:23
   |
44 |         EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) } as u32)
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) }`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: called `.nth(0)` on a `std::iter::Iterator`, when `.next()` is equivalent
  --> libgpiod/src/event_buffer.rs:57:9
   |
57 |         self.nth(0)
   |         ^^^^^^^^^^^ help: try calling `.next()` instead of `.nth(0)`: `self.next()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#iter_nth_zero
   = note: `#[warn(clippy::iter_nth_zero)]` on by default

warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/src/event_buffer.rs:85:33
   |
85 |         let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
   |                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_edge_event_buffer_get_capacity(buffer)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: useless conversion to the same type: `usize`
   --> libgpiod/src/event_buffer.rs:111:17
    |
111 |                 self.events.len().try_into().unwrap(),
    |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
    = help: consider removing `.try_into()`
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion
    = note: `#[warn(clippy::useless_conversion)]` on by default

warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/src/line_request.rs:31:18
   |
31 |         unsafe { gpiod::gpiod_line_request_get_num_requested_lines(self.request) as usize }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_line_request_get_num_requested_lines(self.request)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/src/line_request.rs:36:35
   |
36 |         let mut offsets = vec![0; self.num_lines() as usize];
   |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `self.num_lines()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/src/line_request.rs:46:27
   |
46 |         offsets.shrink_to(num_offsets as usize);
   |                           ^^^^^^^^^^^^^^^^^^^^ help: try: `num_offsets`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> libgpiod/src/line_request.rs:148:28
    |
148 |         if values.len() != self.num_lines() as usize {
    |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `self.num_lines()`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/src/request_config.rs:86:18
   |
86 |         unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_request_config_get_event_buffer_size(self.config)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> libgpiod/src/line_config.rs:111:35
    |
111 |         let mut offsets = vec![0; num_lines as usize];
    |                                   ^^^^^^^^^^^^^^^^^^ help: try: `num_lines`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> libgpiod/src/line_config.rs:122:35
    |
122 |         for offset in &offsets[0..num_stored as usize] {
    |                                   ^^^^^^^^^^^^^^^^^^^ help: try: `num_stored`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`u64` -> `u64`)
   --> libgpiod/src/line_info.rs:147:13
    |
147 |             gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_line_info_get_debounce_period_us(self.info)`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`u64` -> `u64`)
   --> libgpiod/src/line_settings.rs:223:13
    |
223 |             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings) as u64
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `gpiod::gpiod_line_settings_get_debounce_period_us(self.settings)`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> libgpiod/src/line_settings.rs:247:25
    |
247 |         EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) }`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: casting to the same type is unnecessary (`i32` -> `i32`)
   --> libgpiod/src/lib.rs:196:66
    |
196 |                 _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
    |                                                                  ^^^^^^^^^^ help: try: `val`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: `libgpiod` (lib) generated 17 warnings (run `cargo clippy --fix --lib -p libgpiod` to apply 16 suggestions)
warning: casting to the same type is unnecessary (`i32` -> `i32`)
   --> gpiosim-sys/src/sim.rs:167:24
    |
167 |             Value::new(ret as i32)
    |                        ^^^^^^^^^^ help: try: `ret`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
    = note: `#[warn(clippy::unnecessary_cast)]` on by default

warning: useless conversion to the same type: `usize`
   --> gpiosim-sys/src/sim.rs:189:66
    |
189 |         let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num.try_into().unwrap()) };
    |                                                                  ^^^^^^^^^^^^^^
    |
    = help: consider removing `.try_into()`
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion
    = note: `#[warn(clippy::useless_conversion)]` on by default

warning: casting to the same type is unnecessary (`i32` -> `i32`)
  --> gpiosim-sys/src/lib.rs:49:62
   |
49 |             _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
   |                                                              ^^^^^^^^^^ help: try: `val`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

warning: `gpiosim-sys` (lib) generated 3 warnings (run `cargo clippy --fix --lib -p gpiosim-sys` to apply 2 suggestions)
warning: casting to the same type is unnecessary (`usize` -> `usize`)
  --> libgpiod/tests/chip.rs:62:42
   |
62 |             assert_eq!(info.num_lines(), NGPIO as usize);
   |                                          ^^^^^^^^^^^^^^ help: try: `{ NGPIO }`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `#[warn(clippy::unnecessary_cast)]` on by default

warning: `libgpiod` (lib test) generated 17 warnings (17 duplicates)
warning: `libgpiod` (test "chip") generated 1 warning (run `cargo clippy --fix --test "chip"` to apply 1 suggestion)
    Finished dev [unoptimized + debuginfo] target(s) in 0.03s


where stable is:
stable-x86_64-unknown-linux-gnu unchanged - rustc 1.70.0 (90c541806 2023-05-31)

I get the same from nightly.
nightly-x86_64-unknown-linux-gnu unchanged - rustc 1.72.0-nightly (dd5d7c729 2023-06-02)

The --tests is to extend the check to the tests - you get the vast
majority of those without it.

In both cases the patched version is clean.

Cheers,
Kent.
