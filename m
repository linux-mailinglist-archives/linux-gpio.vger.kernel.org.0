Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9CF58243C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiG0K13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiG0K12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:27:28 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92672255A7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:27:27 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y9so15704628pff.12
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MpuUhnmWk8N9LXn9lV7NyN9RsJrdqebRTaBDScT3AYE=;
        b=cvJUv8VPYJPk7PE4vspqS3ADgZNO3pqabIWEd6dsGk72jITP2/N+fiFpuo/aB8UzCO
         hPJ5ww9pbk01lDNuAZrOb8RBgepVsT9B6D7/3iMfCj+FPu47yz9hZznhJ8Yvgw134BI3
         qqk6Waq7TN3JZWMYI5DpdTcevmYSKS9fJ1bZxMp3prpab4gEgp0nfPlTpbZKSWaBfTW2
         Ax+VHTsUu44nJA9m+7oLOGWXX3VKutbyFaKynx1EVuHLBEz5mhZ5iqM/s10JXFTGEdNC
         t87cKcDxUk361ObSxhQzr/sspUluNQsshEIkihpuU+BDinTNhdlIm0BIAqHyCFq+62aM
         yWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MpuUhnmWk8N9LXn9lV7NyN9RsJrdqebRTaBDScT3AYE=;
        b=NDiSMlvMaefvU9lhdyNqKhXuu8gT6szIQ2fM5pJsMsqL9F1VORx95ZbyiYwfGyZpR+
         OhjUgq730XTetEJzgHKvc9ctY/HPKxU2UbYHDAyQdf8qeFk2ssB6xu3rZbolYpHgbI/9
         lKy6vywRTtZAauNvjDwXESWKjaYjex82uWD6K8XUnaGNANNBMwtl6UbEzb3L+wGNFO0d
         +NBs/jhW5kB0/jFnYbp9wgqDMc0WPv0LWfdpiJhJ4DInqZJi5hsZ2eytVeT56Uqewt3E
         M/nugcMQvPJc/TXLxAR+3rsbbKydFc/FLeRu5GZBW13cwxDw3X7SSFKpqqPe74H72miG
         agMQ==
X-Gm-Message-State: AJIora8+d/gSXlZGItPNUGhsj0jyWZsG4ALwAlz2a6Jl0409axIwPcww
        xrvOY/C9iJ0YUdbz3Uu5RVI=
X-Google-Smtp-Source: AGRyM1tPH8uIXYE7WkYHiDYMM6kG9HPSEKdzo+OvWjXW1aksSIXhTsUv4N47WGTRTr+IkGzenYKi+g==
X-Received: by 2002:a63:8449:0:b0:41b:4a5b:c5ca with SMTP id k70-20020a638449000000b0041b4a5bc5camr1411388pgd.6.1658917646977;
        Wed, 27 Jul 2022 03:27:26 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id co2-20020a17090afe8200b001f1a8c24b5esm1322597pjb.6.2022.07.27.03.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 03:27:26 -0700 (PDT)
Date:   Wed, 27 Jul 2022 18:27:20 +0800
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
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220727102720.GA121297@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
 <20220727095955.s4ymsu7wg6cmddey@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727095955.s4ymsu7wg6cmddey@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 03:29:55PM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:58, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:05:00PM +0530, Viresh Kumar wrote:
> > Don't include the test results in the commit message.
> > Those are more of a release artifact than a commit artifact.
> > It is assumed the tests pass for you or you wouldn't be submitting them.
> 
> I wasn't trying to prove that I tested them :)
> 
> The idea was to show how module/test names eventually look in the output.
> 
> Maybe I could have just replied to this email and pasted it, sure commit message
> doesn't need it.
> 

If you want to add more detail to the patch, but not to the commit
message, then add it between the "---" and the file list.
Or put it in the cover letter.

> > > diff --git a/bindings/rust/tests/chip.rs b/bindings/rust/tests/chip.rs
> > > +    mod configure {
> > > +        use super::*;
> > > +        const NGPIO: u64 = 16;
> > > +        const LABEL: &str = "foobar";
> > > +
> > > +        #[test]
> > > +        fn verify() {
> > > +            let sim = Sim::new(Some(NGPIO), Some(LABEL), true).unwrap();
> > > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > > +
> > > +            assert_eq!(chip.get_label().unwrap(), LABEL);
> > > +            assert_eq!(chip.get_name().unwrap(), sim.chip_name());
> > > +            assert_eq!(chip.get_path().unwrap(), sim.dev_path());
> > > +            assert_eq!(chip.get_num_lines(), NGPIO as u32);
> > > +            chip.get_fd().unwrap();
> > > +        }
> > > +
> > 
> > A test for a basic open on an existing chip and a smoke test of some
> > chip methods is called "verify", so chip::configure::verify?
> 
> You want me to rename this ? Sorry, got confused :(

I was trying to work out your naming scheme.
Couldn't see one - sorry.

> 
> Yeah, I am generally bad with naming, suggestions are welcome here :)
> 

Naming is always the hard part.  Find a system that will do the worst of
it for you.

I usually go with <struct>::<method> for the tests that cover a method
on a struct.  For complex methods that require multiple tests add
another tier that described what subset of functionality or failure mode
is being tested.

> > > +        #[test]
> > > +        fn line_lookup() {
> > > +            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
> > > +            sim.set_line_name(0, "zero").unwrap();
> > > +            sim.set_line_name(2, "two").unwrap();
> > > +            sim.set_line_name(3, "three").unwrap();
> > > +            sim.set_line_name(5, "five").unwrap();
> > > +            sim.set_line_name(10, "ten").unwrap();
> > > +            sim.set_line_name(11, "ten").unwrap();
> > > +            sim.enable().unwrap();
> > > +
> > > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > > +
> > > +            // Success case
> > > +            assert_eq!(chip.find_line("zero").unwrap(), 0);
> > > +            assert_eq!(chip.find_line("two").unwrap(), 2);
> > > +            assert_eq!(chip.find_line("three").unwrap(), 3);
> > > +            assert_eq!(chip.find_line("five").unwrap(), 5);
> > > +
> > > +            // Success with duplicate names, should return first entry
> > > +            assert_eq!(chip.find_line("ten").unwrap(), 10);
> > > +
> > > +            // Failure
> > > +            assert_eq!(
> > > +                chip.find_line("nonexistent").unwrap_err(),
> > > +                ChipError::OperationFailed("Gpio Chip find-line", IoError::new(ENOENT))
> > > +            );
> > > +        }
> > 
> > If it is testing find_line() then why not call it find_line?
> 
> I think I picked many names from the TEST_CASE name from cxx bindings. This was
> written there as:
> 
> TEST_CASE("line lookup by name works", "[chip]")
> 
> and I didn't think much about it :)
> 

Fair enough.

> Sure I can name this find_line().
> 

At least until you get around to renaming find_line to line_offset_from_name ;-).

> > > diff --git a/bindings/rust/tests/edge_event.rs b/bindings/rust/tests/edge_event.rs
> > > +        #[test]
> > > +        fn wait_timeout() {
> > > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > > +            config.rconfig(Some(&[0]));
> > > +            config.lconfig_edge(Some(Edge::Both));
> > > +            config.request_lines().unwrap();
> > > +
> > > +            // No events available
> > > +            assert_eq!(
> > > +                config
> > > +                    .request()
> > > +                    .wait_edge_event(Duration::from_millis(100))
> > > +                    .unwrap_err(),
> > > +                ChipError::OperationTimedOut
> > > +            );
> > > +        }
> > 
> > Is a timeout really a "failure"?
> > 
> > It is testing wait_edge_event(), which is a method of line_request,
> > and so should be in the line_request test suite.
> 
> Copied it from cxx again, I just tried to add similar tests in similar files.
> 
> TEST_CASE("edge_event wait timeout", "[edge-event]")
> 
> > > +
> > > +        #[test]
> > > +        fn dir_out_edge_failure() {
> > > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > > +            config.rconfig(Some(&[0]));
> > > +            config.lconfig(Some(Direction::Output), None, None, Some(Edge::Both), None);
> > > +
> > > +            assert_eq!(
> > > +                config.request_lines().unwrap_err(),
> > > +                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EINVAL))
> > > +            );
> > > +        }
> > > +    }
> > > +
> > 
> > This is testing a failure mode of request_lines(), not edge_events.
> > Where is the edge_event here?
> 
> I agree, I will move this out.
> 
> This needs fixing too though.
> 
> TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
> 
> > > diff --git a/bindings/rust/tests/info_event.rs b/bindings/rust/tests/info_event.rs
> > > new file mode 100644
> > > index 000000000000..96d8385deadf
> > > --- /dev/null
> > > +++ b/bindings/rust/tests/info_event.rs
> > > @@ -0,0 +1,126 @@
> > > +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> > > +//
> > > +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> > > +//     Viresh Kumar <viresh.kumar@linaro.org>
> > > +
> > > +mod common;
> > > +
> > > +mod info_event {
> > > +    use libc::EINVAL;
> > > +    use std::sync::Arc;
> > > +    use std::thread::{sleep, spawn};
> > > +    use std::time::Duration;
> > > +
> > > +    use vmm_sys_util::errno::Error as IoError;
> > > +
> > > +    use crate::common::*;
> > > +    use libgpiod::{Chip, Direction, Error as ChipError, Event, LineConfig, RequestConfig};
> > > +
> > > +    fn request_reconfigure_line(chip: Arc<Chip>) {
> > > +        spawn(move || {
> > > +            sleep(Duration::from_millis(10));
> > > +
> > > +            let lconfig1 = LineConfig::new().unwrap();
> > > +            let rconfig = RequestConfig::new().unwrap();
> > > +            rconfig.set_offsets(&[7]);
> > > +
> > > +            let request = chip.request_lines(&rconfig, &lconfig1).unwrap();
> > > +
> > > +            sleep(Duration::from_millis(10));
> > > +
> > > +            let mut lconfig2 = LineConfig::new().unwrap();
> > > +            lconfig2.set_direction_default(Direction::Output);
> > > +
> > > +            request.reconfigure_lines(&lconfig2).unwrap();
> > > +
> > > +            sleep(Duration::from_millis(10));
> > > +        });
> > > +    }
> > > +
> > 
> > Benefit of the background thread?
> 
> Again copied from cxx, I think the idea here is to get the events one by one and
> read one before the next one is generated. i.e. to do it all in parallel, which
> looked fine to me.
> 

Following the pattern from the other bindings is fine.

That is a point where Bart and I disagree.
He likes making the tests closer to reality.
I like keeping them simple.

They are separate paths and strictly speaking both should be tested.
But if you are only going to do one, do the easy one ;-).

Anyway leave it as is - no point changing it now.

> > > +    mod properties {
> > > +        use super::*;
> > > +
> > > +        #[test]
> > > +        fn verify() {
> > > +            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
> > > +            sim.set_line_name(1, "one").unwrap();
> > > +            sim.set_line_name(2, "two").unwrap();
> > > +            sim.set_line_name(4, "four").unwrap();
> > > +            sim.set_line_name(5, "five").unwrap();
> > > +            sim.hog_line(3, "hog3", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
> > > +                .unwrap();
> > > +            sim.hog_line(4, "hog4", GPIOSIM_HOG_DIR_OUTPUT_LOW as i32)
> > > +                .unwrap();
> > > +            sim.enable().unwrap();
> > > +
> > > +            let chip = Chip::open(sim.dev_path()).unwrap();
> > > +            chip.line_info(6).unwrap();
> > > +
> > > +            let info4 = chip.line_info(4).unwrap();
> > > +            assert_eq!(info4.get_offset(), 4);
> > > +            assert_eq!(info4.get_name().unwrap(), "four");
> > > +            assert_eq!(info4.is_used(), true);
> > > +            assert_eq!(info4.get_consumer().unwrap(), "hog4");
> > > +            assert_eq!(info4.get_direction().unwrap(), Direction::Output);
> > > +            assert_eq!(info4.is_active_low(), false);
> > > +            assert_eq!(info4.get_bias().unwrap(), Bias::Unknown);
> > > +            assert_eq!(info4.get_drive().unwrap(), Drive::PushPull);
> > > +            assert_eq!(info4.get_edge_detection().unwrap(), Edge::None);
> > > +            assert_eq!(info4.get_event_clock().unwrap(), EventClock::Monotonic);
> > > +            assert_eq!(info4.is_debounced(), false);
> > > +            assert_eq!(info4.get_debounce_period(), Duration::from_millis(0));
> > > +        }
> > > +    }
> > 
> > Test that you can read all supported values for all fields.
> 
> Like setting bias to all possible values one by one and reading them back ? Or
> something else ?
> 
> > Clippy warnings to fix:
> > 
> > $cargo clippy --tests
> 
> I just ran
> 
> cargo clippy --workspace --bins --examples --benches --all-features -- -D warnings
> 
> and thought it works for tests too, my bad.
> 

Turns out not.  Surprised me too.

Cheers,
Kent.
