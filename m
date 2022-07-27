Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BB558239B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiG0KAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiG0KAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:00:05 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111D245984
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:00:00 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y141so15640036pfb.7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DwABGd8hj3D13WD5oylzTMGhDsx4jNTOaADKI531M1I=;
        b=dnDJzJBj9oCFI97CIvjfOxZlQ1IYA6nj3m7mBJPKburGtsCovXYtHXWMuTs3NlHVUX
         s9VN8G2uqvm2TxcEkz/Y9fKC70ZrSigKVhQ4tmqYbNU+Pktf/TIPg3drZF77uhusl0Yz
         2XKkYRJUxrtXAIKVW1+0kCWeezgOiU8AnSAnQ08ul2CcElCVzAS8N2YyhqyregNhD8FM
         uRwgxBPPdtrcwF6xFnLAab0XKb7AWZW62C9l4am+NQJPw/oT2UAsIg1DeNHyqGQ7tO5O
         eiT8xVIZH726Y04PP5H+IBxEhNAmGoJ8EnXj7rIEnM45BCQjbdJukkyWr8NI8QryAvrO
         y2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DwABGd8hj3D13WD5oylzTMGhDsx4jNTOaADKI531M1I=;
        b=GifEi0TlE9kNIuqwSiD8N2NSQ/LWA0Rwe7ptN2isWU35poea35MgA/MSXPHs1FpbST
         5z/JYPyVW08INW1fSOQZ+UtlR7i2C1Zufp9kB2ogrZ/FmQ+EZ0/tlV/wEcBS+DecbZE5
         0ZN6G8+ICV/5/Y2GMK4+9HngDrFPhvlcfmc1vxYe3DgPmhptg74aF3iFifD2hlXgRzHf
         VXrs6YBdwGPwoImLj0585KQioui3GGq9I/kHZMcCFuIDUrf0BReS38MCiOZkHzGjBptQ
         YKg99tsD5IpvHyX3LwfKHD/U5yM+/S/jQGKZO5CqQJTCii1T73DjIODvYL82dMcq1pfP
         IFuQ==
X-Gm-Message-State: AJIora96PoFytViTZaTx9UF7LG0GMAYJ/thjnujaGRUzSlUXmc99Vh2R
        LZaFC3B0sEdZJ96+vx42sP6O6J7ajVdiwQ==
X-Google-Smtp-Source: AGRyM1sZv4kBfPrtVaUezX8YeTv6sHDDjdUUmUaF223vdOwSin04o07srVqfqtMb8xJP75b/+mHHdg==
X-Received: by 2002:a63:4503:0:b0:419:7b8c:cb11 with SMTP id s3-20020a634503000000b004197b8ccb11mr17954884pga.446.1658915999095;
        Wed, 27 Jul 2022 02:59:59 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id lb18-20020a17090b4a5200b001f09d9b6673sm1317411pjb.7.2022.07.27.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 02:59:58 -0700 (PDT)
Date:   Wed, 27 Jul 2022 15:29:55 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220727095955.s4ymsu7wg6cmddey@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025847.GG88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:58, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:05:00PM +0530, Viresh Kumar wrote:
> Don't include the test results in the commit message.
> Those are more of a release artifact than a commit artifact.
> It is assumed the tests pass for you or you wouldn't be submitting them.

I wasn't trying to prove that I tested them :)

The idea was to show how module/test names eventually look in the output.

Maybe I could have just replied to this email and pasted it, sure commit message
doesn't need it.

> > diff --git a/bindings/rust/tests/chip.rs b/bindings/rust/tests/chip.rs
> > +    mod configure {
> > +        use super::*;
> > +        const NGPIO: u64 = 16;
> > +        const LABEL: &str = "foobar";
> > +
> > +        #[test]
> > +        fn verify() {
> > +            let sim = Sim::new(Some(NGPIO), Some(LABEL), true).unwrap();
> > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > +
> > +            assert_eq!(chip.get_label().unwrap(), LABEL);
> > +            assert_eq!(chip.get_name().unwrap(), sim.chip_name());
> > +            assert_eq!(chip.get_path().unwrap(), sim.dev_path());
> > +            assert_eq!(chip.get_num_lines(), NGPIO as u32);
> > +            chip.get_fd().unwrap();
> > +        }
> > +
> 
> A test for a basic open on an existing chip and a smoke test of some
> chip methods is called "verify", so chip::configure::verify?

You want me to rename this ? Sorry, got confused :(

Yeah, I am generally bad with naming, suggestions are welcome here :)

> > +        #[test]
> > +        fn line_lookup() {
> > +            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
> > +            sim.set_line_name(0, "zero").unwrap();
> > +            sim.set_line_name(2, "two").unwrap();
> > +            sim.set_line_name(3, "three").unwrap();
> > +            sim.set_line_name(5, "five").unwrap();
> > +            sim.set_line_name(10, "ten").unwrap();
> > +            sim.set_line_name(11, "ten").unwrap();
> > +            sim.enable().unwrap();
> > +
> > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > +
> > +            // Success case
> > +            assert_eq!(chip.find_line("zero").unwrap(), 0);
> > +            assert_eq!(chip.find_line("two").unwrap(), 2);
> > +            assert_eq!(chip.find_line("three").unwrap(), 3);
> > +            assert_eq!(chip.find_line("five").unwrap(), 5);
> > +
> > +            // Success with duplicate names, should return first entry
> > +            assert_eq!(chip.find_line("ten").unwrap(), 10);
> > +
> > +            // Failure
> > +            assert_eq!(
> > +                chip.find_line("nonexistent").unwrap_err(),
> > +                ChipError::OperationFailed("Gpio Chip find-line", IoError::new(ENOENT))
> > +            );
> > +        }
> 
> If it is testing find_line() then why not call it find_line?

I think I picked many names from the TEST_CASE name from cxx bindings. This was
written there as:

TEST_CASE("line lookup by name works", "[chip]")

and I didn't think much about it :)

Sure I can name this find_line().

> > diff --git a/bindings/rust/tests/edge_event.rs b/bindings/rust/tests/edge_event.rs
> > +        #[test]
> > +        fn wait_timeout() {
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.rconfig(Some(&[0]));
> > +            config.lconfig_edge(Some(Edge::Both));
> > +            config.request_lines().unwrap();
> > +
> > +            // No events available
> > +            assert_eq!(
> > +                config
> > +                    .request()
> > +                    .wait_edge_event(Duration::from_millis(100))
> > +                    .unwrap_err(),
> > +                ChipError::OperationTimedOut
> > +            );
> > +        }
> 
> Is a timeout really a "failure"?
> 
> It is testing wait_edge_event(), which is a method of line_request,
> and so should be in the line_request test suite.

Copied it from cxx again, I just tried to add similar tests in similar files.

TEST_CASE("edge_event wait timeout", "[edge-event]")

> > +
> > +        #[test]
> > +        fn dir_out_edge_failure() {
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.rconfig(Some(&[0]));
> > +            config.lconfig(Some(Direction::Output), None, None, Some(Edge::Both), None);
> > +
> > +            assert_eq!(
> > +                config.request_lines().unwrap_err(),
> > +                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EINVAL))
> > +            );
> > +        }
> > +    }
> > +
> 
> This is testing a failure mode of request_lines(), not edge_events.
> Where is the edge_event here?

I agree, I will move this out.

This needs fixing too though.

TEST_CASE("output mode and edge detection don't work together", "[edge-event]")

> > diff --git a/bindings/rust/tests/info_event.rs b/bindings/rust/tests/info_event.rs
> > new file mode 100644
> > index 000000000000..96d8385deadf
> > --- /dev/null
> > +++ b/bindings/rust/tests/info_event.rs
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> > +//
> > +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> > +//     Viresh Kumar <viresh.kumar@linaro.org>
> > +
> > +mod common;
> > +
> > +mod info_event {
> > +    use libc::EINVAL;
> > +    use std::sync::Arc;
> > +    use std::thread::{sleep, spawn};
> > +    use std::time::Duration;
> > +
> > +    use vmm_sys_util::errno::Error as IoError;
> > +
> > +    use crate::common::*;
> > +    use libgpiod::{Chip, Direction, Error as ChipError, Event, LineConfig, RequestConfig};
> > +
> > +    fn request_reconfigure_line(chip: Arc<Chip>) {
> > +        spawn(move || {
> > +            sleep(Duration::from_millis(10));
> > +
> > +            let lconfig1 = LineConfig::new().unwrap();
> > +            let rconfig = RequestConfig::new().unwrap();
> > +            rconfig.set_offsets(&[7]);
> > +
> > +            let request = chip.request_lines(&rconfig, &lconfig1).unwrap();
> > +
> > +            sleep(Duration::from_millis(10));
> > +
> > +            let mut lconfig2 = LineConfig::new().unwrap();
> > +            lconfig2.set_direction_default(Direction::Output);
> > +
> > +            request.reconfigure_lines(&lconfig2).unwrap();
> > +
> > +            sleep(Duration::from_millis(10));
> > +        });
> > +    }
> > +
> 
> Benefit of the background thread?

Again copied from cxx, I think the idea here is to get the events one by one and
read one before the next one is generated. i.e. to do it all in parallel, which
looked fine to me.

> > +    mod properties {
> > +        use super::*;
> > +
> > +        #[test]
> > +        fn verify() {
> > +            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
> > +            sim.set_line_name(1, "one").unwrap();
> > +            sim.set_line_name(2, "two").unwrap();
> > +            sim.set_line_name(4, "four").unwrap();
> > +            sim.set_line_name(5, "five").unwrap();
> > +            sim.hog_line(3, "hog3", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
> > +                .unwrap();
> > +            sim.hog_line(4, "hog4", GPIOSIM_HOG_DIR_OUTPUT_LOW as i32)
> > +                .unwrap();
> > +            sim.enable().unwrap();
> > +
> > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > +            chip.line_info(6).unwrap();
> > +
> > +            let info4 = chip.line_info(4).unwrap();
> > +            assert_eq!(info4.get_offset(), 4);
> > +            assert_eq!(info4.get_name().unwrap(), "four");
> > +            assert_eq!(info4.is_used(), true);
> > +            assert_eq!(info4.get_consumer().unwrap(), "hog4");
> > +            assert_eq!(info4.get_direction().unwrap(), Direction::Output);
> > +            assert_eq!(info4.is_active_low(), false);
> > +            assert_eq!(info4.get_bias().unwrap(), Bias::Unknown);
> > +            assert_eq!(info4.get_drive().unwrap(), Drive::PushPull);
> > +            assert_eq!(info4.get_edge_detection().unwrap(), Edge::None);
> > +            assert_eq!(info4.get_event_clock().unwrap(), EventClock::Monotonic);
> > +            assert_eq!(info4.is_debounced(), false);
> > +            assert_eq!(info4.get_debounce_period(), Duration::from_millis(0));
> > +        }
> > +    }
> 
> Test that you can read all supported values for all fields.

Like setting bias to all possible values one by one and reading them back ? Or
something else ?

> Clippy warnings to fix:
> 
> $cargo clippy --tests

I just ran

cargo clippy --workspace --bins --examples --benches --all-features -- -D warnings

and thought it works for tests too, my bad.

-- 
viresh
