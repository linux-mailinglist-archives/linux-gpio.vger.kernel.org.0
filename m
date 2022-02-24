Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AC54C36EB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 21:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbiBXUeY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 15:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbiBXUeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 15:34:23 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B5D2399D4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 12:33:52 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p15so6773315ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALJxZ857obWSxg5mSrQowDguNSotGUwVojGGHDV+GFM=;
        b=mSSNpydAP6Jkw2LrhhG3B9ilEw/c4n+qrpXeBpzkC8G1ismDsuIYvWLgOU9k8+BD/w
         WSY8nKbkZNAJ45vV9LAEBL5gociIgYFOQA5lUslC1Ca3TkBw3dtAKKemXWrg04FAC3cd
         fbZJnNtMhrQb/sfbWI4GpNZL885qdVT2WzdQKxawDgPT2pX+HkQDrevPAVoXvgS/EA9H
         Pcq4scqY3gIiukAvcE2sVlMpdprTud2A0SfW3rGlZcTsCo50Zy7jdyJ223d481lmTWMm
         SM1eElRHZZXdR5FYpRvQyZXNtEQfxnlL6TatEsw9NzdBRvv3DvD6Q+eW/wH6HmffMeWu
         Zv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALJxZ857obWSxg5mSrQowDguNSotGUwVojGGHDV+GFM=;
        b=AywbLnoqXDB1GDtcpc4FLdb2zd9DPLGNfSKnrW4pl0Og3zUJOptxLwHtlDo1f2MPeJ
         hMS9764Z2uWlh/TWlaHEGyZcLCF2nRaO6FVLbuMZNf+F0aE7NLes4yK0lsbT4feCiENf
         RN1dmq5UcURfWsPMx/SfMm42A/wJvYmzF/NTRblVenLWIdHYw88vW58qsRVVzeR385Vg
         E19zlBeIDraBRCzAL3c3itLxUXDp6zv6vPMGTSBd7JPPgC904Xy1/4iWN/UaNyn9Sr+X
         voWVwo659flwJ3h4a0Grtw3yae4wr4V1n3z2f/O/PjWob5EeFaPNXUmAB+6T0QTS+ufd
         CxCA==
X-Gm-Message-State: AOAM532Ex4586RzOyvqxR7ZRUBEp+NOFyHdNV9Ltt5sW7wZd9P0LICbz
        eDh6laJ+xzZxk4T/QPdVKEusjpTt0tVO8b0345wqHJWfedg=
X-Google-Smtp-Source: ABdhPJwynhLVxAR2GCyxRVJVayyEuombUKixWdrfEMVyhRUKhkLnywLWVABwYP/tQBjZGlFbmnGatpYEP6yu+E4p3pM=
X-Received: by 2002:a17:907:7618:b0:6cf:5756:26c4 with SMTP id
 jx24-20020a170907761800b006cf575626c4mr3603621ejc.492.1645734830939; Thu, 24
 Feb 2022 12:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20220221154055.654819-1-brgl@bgdev.pl> <20220221154055.654819-3-brgl@bgdev.pl>
 <20220223101857.GA1023391@sol>
In-Reply-To: <20220223101857.GA1023391@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Feb 2022 21:33:40 +0100
Message-ID: <CAMRc=MeHme+saL-N3w-i69Y5ehHqWx1rC03rh67Zh+kbYczAbg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 2/2] tests: rewrite core C tests using libgpiosim
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 11:19 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Feb 21, 2022 at 04:40:55PM +0100, Bartosz Golaszewski wrote:
> > This replaces the old tests for the C API v1 based on gpio-mockup with
> > a test suite based on gpio-sim that covers around 95% of the libgpiod v2
> > codebase.
> >
> > The test harness has been rebuilt and shrank significantly as well. The
> > libgpiosim API has been wrapped in a gobject interface.
> >
>
> I was having trouble running the tests in a qemu instance where entropy
> is slow to collect.  The error I get is
>
> Bail out! gpiod-test-FATAL-ERROR: Unable to instantiate new GPIO device: Resource temporarily unavailable
>
> which I backtracked to the getrandom() call in make_random_dir_at().
>
> I have a dislike for random elements in tests as it negatively impacts
> repeatability.  They are only used here for chip and bank names in the
> configfs, and otherwise have no bearing on the tests?
> Why not deterministic naming, say using the test case name, pid,...
>

We can have multiple random names in use at once. And on the off
chance that something goes wrong, a random configfs dir just stays
there while a deterministic one can hose other tests. Can't you just
install havaged in whatever rootfs you're using?

[snip]

> >
> >  #define MIN_KERNEL_MAJOR     5
> > -#define MIN_KERNEL_MINOR     10
> > +#define MIN_KERNEL_MINOR     16
>
> Might as well bump this to 17 as RCs are available and 16 isn't really
> sufficient.  Similarly gpiosim.c.
>

I'm building this on my laptop so prefer to have it at 16 for now.
We'll have 5.17 out in three weeks, I'll bump it then.

[snip]

> > +
> > +GPIOD_TEST_CASE(request_reconfigure_release_events)
> > +{
> > +     static const guint offset = 3;
> > +
> > +     g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
> > +     g_autoptr(struct_gpiod_chip) chip = NULL;
> > +     g_autoptr(struct_gpiod_line_info) info = NULL;
> > +     g_autoptr(struct_gpiod_info_event) request_event = NULL;
> > +     g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
> > +     g_autoptr(struct_gpiod_info_event) release_event = NULL;
> > +     g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
> > +     g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
> > +     g_autoptr(GThread) thread = NULL;
> > +     struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
> > +     guint64 request_ts, reconfigure_ts, release_ts;
> > +     struct request_ctx ctx;
> > +     gint ret;
> > +
> > +     chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
> > +     req_cfg = gpiod_test_create_request_config_or_fail();
> > +     line_cfg = gpiod_test_create_line_config_or_fail();
> > +
> > +     gpiod_request_config_set_offsets(req_cfg, 1, &offset);
> > +
> > +     info = gpiod_chip_watch_line_info(chip, 3);
> > +     g_assert_nonnull(info);
> > +     gpiod_test_return_if_failed();
> > +
> > +     g_assert_false(gpiod_line_info_is_used(info));
> > +
> > +     ctx.chip = chip;
> > +     ctx.req_cfg = req_cfg;
> > +     ctx.line_cfg = line_cfg;
> > +
> > +     thread = g_thread_new("request-release", request_release_line, &ctx);
> > +     g_thread_ref(thread);
> > +
> > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > +     g_assert_cmpint(ret, >, 0);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     request_event = gpiod_chip_info_event_read(chip);
> > +     g_assert_nonnull(request_event);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     g_assert_cmpint(gpiod_info_event_get_event_type(request_event), ==,
> > +                     GPIOD_INFO_EVENT_LINE_REQUESTED);
> > +
> > +     request_info = gpiod_info_event_get_line_info(request_event);
> > +
> > +     g_assert_cmpuint(gpiod_line_info_get_offset(request_info), ==, 3);
> > +     g_assert_true(gpiod_line_info_is_used(request_info));
> > +     g_assert_cmpint(gpiod_line_info_get_direction(request_info), ==,
> > +                     GPIOD_LINE_DIRECTION_INPUT);
> > +
> > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > +     g_assert_cmpint(ret, >, 0);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     reconfigure_event = gpiod_chip_info_event_read(chip);
> > +     g_assert_nonnull(reconfigure_event);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     g_assert_cmpint(gpiod_info_event_get_event_type(reconfigure_event), ==,
> > +                     GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED);
> > +
> > +     reconfigure_info = gpiod_info_event_get_line_info(reconfigure_event);
> > +
> > +     g_assert_cmpuint(gpiod_line_info_get_offset(reconfigure_info), ==, 3);
> > +     g_assert_true(gpiod_line_info_is_used(reconfigure_info));
> > +     g_assert_cmpint(gpiod_line_info_get_direction(reconfigure_info), ==,
> > +                     GPIOD_LINE_DIRECTION_OUTPUT);
> > +
> > +     ret = gpiod_chip_info_event_wait(chip, 1000000000);
> > +     g_assert_cmpint(ret, >, 0);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     release_event = gpiod_chip_info_event_read(chip);
> > +     g_assert_nonnull(release_event);
> > +     gpiod_test_join_thread_and_return_if_failed(thread);
> > +
> > +     g_assert_cmpint(gpiod_info_event_get_event_type(release_event), ==,
> > +                     GPIOD_INFO_EVENT_LINE_RELEASED);
> > +
> > +     release_info = gpiod_info_event_get_line_info(release_event);
> > +
> > +     g_assert_cmpuint(gpiod_line_info_get_offset(release_info), ==, 3);
> > +     g_assert_false(gpiod_line_info_is_used(release_info));
> > +
> > +     g_thread_join(thread);
> > +
> > +     request_ts = gpiod_info_event_get_timestamp(request_event);
> > +     reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
> > +     release_ts = gpiod_info_event_get_timestamp(release_event);
> > +
> > +     g_assert_cmpuint(request_ts, <, reconfigure_ts);
> > +     g_assert_cmpuint(reconfigure_ts, <, release_ts);
> > +}
>
> Is multi-threading really necessary here (and elsewhere, but this the
> first case where the secondary thread is ALSO asserting)?
> Couldn't you provide the stimulous and check the result from the one
> thread?

I think it's a good way to test a real-life situation. I agree that
they are not technically required but I'd still keep them, they don't
hurt.

[snip]

>
> Only a couple of minor points for this file:
> How about some tests where the offsets are not ordered?
> And a few more with len(offsets) != 4.

Good points, will do. And will fix the rest mentioned. Thanks!

Bart

>
> [snip to end]
>
> Nothing major.
>
> Cheers,
> Kent.
