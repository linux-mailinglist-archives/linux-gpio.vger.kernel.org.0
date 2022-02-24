Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844114C39E6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 00:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiBXXwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 18:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbiBXXwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 18:52:50 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E4FD5566
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 15:52:19 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id p8so3228076pfh.8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RW+k452ssAC2O6myfztq0VCEjZlZlZjkKEOHs/eXiR8=;
        b=TO18DzWXfbZnvtXdYd5b2tGcPcof0HN/GY/Dj+V1Kucye2oMczcCjr7nvZbe4Bd3xk
         TsLiGJep5V7VQGYWXncKACQdQUvaaHJfOsGDEUO7atJivGFDFw2IJ+bMD0X0+LQYYpgL
         2eQ+eV6vd/9kp8p0SuYALgHD7idVNY+E1hEWO97RLoREtff4tzgcok/W3nXS9aC6rCAE
         zjI+jcaozdbiI/Een42ko6hwA99ASB1UhBJ4IISzFhJ/w5P7O8KjQZERrg79hkmGIOlc
         /mLwU1CIGYBZskoJ2TEWtZ4YlJaCcZHiPMqPVNzIgRoJ2Ruf5Hm59i8SfNu5nQphvFrD
         IDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RW+k452ssAC2O6myfztq0VCEjZlZlZjkKEOHs/eXiR8=;
        b=Xw7VEoX+2TXJ3+LQjEWPb3C1h4gLFedW0DPDbtJOmDWix+zaWwQ558jdOANhAWZeiN
         o7FhVlI1WW/A0z7Gfd6fhbDA+Fv1EMN01c75qrDTD8mP6M3/n/qwtpUUMl72gvMv8rQ1
         Z+8aeIogNeb73pLOJlz9/1bROUzdxsns7gRNsr8galXs0fJmDhIL7oYk8u8OAWvTwj5P
         MhpBo4szvFy9ESPc6kOq7ZSIf5yj7idQazcus5VPZmEAUPqvAv5T830rZ/XfN9uF/MXv
         qNO6ilSP3wE66JgosTrJTp3aXSg7cNqBd6C5esLPjekKTXN4PLf8YGw+x+YIwSSPuOKT
         0Rmg==
X-Gm-Message-State: AOAM532JyjEuU5omz24IMRjWvyyB1BI+WkKz4KelTeluaALMGtKe5nid
        0usMDYg1tK7l1bp7TiObOK0=
X-Google-Smtp-Source: ABdhPJyO60HU3Y/i/QvFGJKa2lHLTt1z3CDzvEQCuogk771zglZEvBwwAgnj1FtbzSaq2dgsb4U0Dg==
X-Received: by 2002:a05:6a00:1954:b0:4e1:7791:6a8e with SMTP id s20-20020a056a00195400b004e177916a8emr5022727pfk.77.1645746738013;
        Thu, 24 Feb 2022 15:52:18 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id l9-20020a655609000000b0037589f4337dsm545135pgs.78.2022.02.24.15.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 15:52:17 -0800 (PST)
Date:   Fri, 25 Feb 2022 07:52:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 2/2] tests: rewrite core C tests using
 libgpiosim
Message-ID: <20220224235212.GA5420@sol>
References: <20220221154055.654819-1-brgl@bgdev.pl>
 <20220221154055.654819-3-brgl@bgdev.pl>
 <20220223101857.GA1023391@sol>
 <CAMRc=MeHme+saL-N3w-i69Y5ehHqWx1rC03rh67Zh+kbYczAbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeHme+saL-N3w-i69Y5ehHqWx1rC03rh67Zh+kbYczAbg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 24, 2022 at 09:33:40PM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 23, 2022 at 11:19 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Feb 21, 2022 at 04:40:55PM +0100, Bartosz Golaszewski wrote:
> > > This replaces the old tests for the C API v1 based on gpio-mockup with
> > > a test suite based on gpio-sim that covers around 95% of the libgpiod v2
> > > codebase.
> > >
> > > The test harness has been rebuilt and shrank significantly as well. The
> > > libgpiosim API has been wrapped in a gobject interface.
> > >
> >
> > I was having trouble running the tests in a qemu instance where entropy
> > is slow to collect.  The error I get is
> >
> > Bail out! gpiod-test-FATAL-ERROR: Unable to instantiate new GPIO device: Resource temporarily unavailable
> >
> > which I backtracked to the getrandom() call in make_random_dir_at().
> >
> > I have a dislike for random elements in tests as it negatively impacts
> > repeatability.  They are only used here for chip and bank names in the
> > configfs, and otherwise have no bearing on the tests?
> > Why not deterministic naming, say using the test case name, pid,...
> >
> 
> We can have multiple random names in use at once. And on the off
> chance that something goes wrong, a random configfs dir just stays
> there while a deterministic one can hose other tests. Can't you just
> install havaged in whatever rootfs you're using?
> 

Sure, but incorporating the PID in the names would serve a similar
purpose, and also provide some indication as to what created the sim in
the first place.  Random is just noise.  How can you tell if your
configfs objects are orphaned?
Are you sure you aren't biased towards random as it also simplifies your
test setup logic (no pesky names to worry about - just pass a NULL)?

My test setup is a pretty vanilla buildroot/qemu setup configured to
build local kernels and libgpiod, repeated for a few different platforms.
Though in this instance I was only building for x86_64.
No network interfaces, as I'm only testing GPIO, but that also means few
sources of entropy.  So far that hadn't been an issue.
Hadn't heard of haveged, but will give it a go.
<a few minutes later>
That works.  Cool.  Though I still don't like the randomness.

> [snip]
> 
> > >
> > >  #define MIN_KERNEL_MAJOR     5
> > > -#define MIN_KERNEL_MINOR     10
> > > +#define MIN_KERNEL_MINOR     16
> >
> > Might as well bump this to 17 as RCs are available and 16 isn't really
> > sufficient.  Similarly gpiosim.c.
> >
> 
> I'm building this on my laptop so prefer to have it at 16 for now.
> We'll have 5.17 out in three weeks, I'll bump it then.
> 

Not sure why that prevents you from testing against 5.17-rc5, or one of
the earlier RCs, but ok.

> [snip]
> 
> > > +
> > > +GPIOD_TEST_CASE(request_reconfigure_release_events)
> > > +{
> > > +     static const guint offset = 3;
> > > +
> > > +     g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> > > +     g_autoptr(struct_gpiod_chip) chip = NULL;
> > > +     g_autoptr(struct_gpiod_line_info) info = NULL;
> > > +     g_autoptr(struct_gpiod_info_event) request_event = NULL;
> > > +     g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
> > > +     g_autoptr(struct_gpiod_info_event) release_event = NULL;
> > > +     g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> > > +     g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> > > +     g_autoptr(GThread) thread = NULL;
> > > +     struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
> > > +     guint64 request_ts, reconfigure_ts, release_ts;
> > > +     struct request_ctx ctx;
> > > +     gint ret;
> > > +
> > > +     chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> > > +     req_cfg = gpiod_test_create_request_config_or_fail();
> > > +     line_cfg = gpiod_test_create_line_config_or_fail();
> > > +
> > > +     gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> > > +
> > > +     info = gpiod_chip_watch_line_info(chip, 3);
> > > +     g_assert_nonnull(info);
> > > +     gpiod_test_return_if_failed();
> > > +
> > > +     g_assert_false(gpiod_line_info_is_used(info));
> > > +
> > > +     ctx.chip = chip;
> > > +     ctx.req_cfg = req_cfg;
> > > +     ctx.line_cfg = line_cfg;
> > > +
> > > +     thread = g_thread_new("request-release", request_release_line, &ctx);
> > > +     g_thread_ref(thread);
> > > +
> > > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > > +     g_assert_cmpint(ret, >, 0);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     request_event = gpiod_chip_info_event_read(chip);
> > > +     g_assert_nonnull(request_event);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     g_assert_cmpint(gpiod_info_event_get_event_type(request_event), ==,
> > > +                     GPIOD_INFO_EVENT_LINE_REQUESTED);
> > > +
> > > +     request_info = gpiod_info_event_get_line_info(request_event);
> > > +
> > > +     g_assert_cmpuint(gpiod_line_info_get_offset(request_info), ==, 3);
> > > +     g_assert_true(gpiod_line_info_is_used(request_info));
> > > +     g_assert_cmpint(gpiod_line_info_get_direction(request_info), ==,
> > > +                     GPIOD_LINE_DIRECTION_INPUT);
> > > +
> > > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > > +     g_assert_cmpint(ret, >, 0);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     reconfigure_event = gpiod_chip_info_event_read(chip);
> > > +     g_assert_nonnull(reconfigure_event);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     g_assert_cmpint(gpiod_info_event_get_event_type(reconfigure_event), ==,
> > > +                     GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED);
> > > +
> > > +     reconfigure_info = gpiod_info_event_get_line_info(reconfigure_event);
> > > +
> > > +     g_assert_cmpuint(gpiod_line_info_get_offset(reconfigure_info), ==, 3);
> > > +     g_assert_true(gpiod_line_info_is_used(reconfigure_info));
> > > +     g_assert_cmpint(gpiod_line_info_get_direction(reconfigure_info), ==,
> > > +                     GPIOD_LINE_DIRECTION_OUTPUT);
> > > +
> > > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > > +     g_assert_cmpint(ret, >, 0);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     release_event = gpiod_chip_info_event_read(chip);
> > > +     g_assert_nonnull(release_event);
> > > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > > +
> > > +     g_assert_cmpint(gpiod_info_event_get_event_type(release_event), ==,
> > > +                     GPIOD_INFO_EVENT_LINE_RELEASED);
> > > +
> > > +     release_info = gpiod_info_event_get_line_info(release_event);
> > > +
> > > +     g_assert_cmpuint(gpiod_line_info_get_offset(release_info), ==, 3);
> > > +     g_assert_false(gpiod_line_info_is_used(release_info));
> > > +
> > > +     g_thread_join(thread);
> > > +
> > > +     request_ts = gpiod_info_event_get_timestamp(request_event);
> > > +     reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
> > > +     release_ts = gpiod_info_event_get_timestamp(release_event);
> > > +
> > > +     g_assert_cmpuint(request_ts, <, reconfigure_ts);
> > > +     g_assert_cmpuint(reconfigure_ts, <, release_ts);
> > > +}
> >
> > Is multi-threading really necessary here (and elsewhere, but this the
> > first case where the secondary thread is ALSO asserting)?
> > Couldn't you provide the stimulous and check the result from the one
> > thread?
> 
> I think it's a good way to test a real-life situation. I agree that
> they are not technically required but I'd still keep them, they don't
> hurt.
> 

Sure, and that is why I didn't have a problem with the earlier
instances.  But here you have both threads asserting, so splitting the
test logic.  That crosses a line for me.  Dumb helper threads I'm ok
with.

Cheers,
Kent.

