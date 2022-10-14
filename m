Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BF55FF202
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 18:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiJNQGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 12:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiJNQGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 12:06:45 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D222194222
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 09:06:43 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gf8so5289965pjb.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUhmTIbCEFaUtsfzKk8G7RgFHMybLH1egCOfnxrW9lg=;
        b=MHtdvVzgGm8B6V60R9G1BFOot1asDbY0O2+oW7eMLbe2XJ0lCDOLNJtkoPF8uzH/BM
         9tmmr498L9qaegq2IeF8j7o4jgvQajorFG9NLSIMN3lMn5JA9CwHuOe1EXz0pl2oI5RR
         kW/7rdV24URIos88hAUoT/RtzfuS86mH5FDsKzCaVPzZBOR/UeEda/LX/qbQqSzUMEVe
         BUb8RpqhKBcQIY0EAwwwff4AMCRUjnM2sC9pfE6x87HnEEGmFQZ5+/Uy5iI+NDUGWe/h
         xg7yQxl3vf8J/t5hERCqPN3jqjEOJ/vOAgeU+CLjuXh+N4kaQAmQjA/Lc52HnM9L/ncQ
         zjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUhmTIbCEFaUtsfzKk8G7RgFHMybLH1egCOfnxrW9lg=;
        b=v0pkmYaeF7QOJw4GK+Qm3T4pHRa0xIFCTXyCmOzd0i34xlPO21JLQNb7VKOZiOhJUJ
         2VAJ2uTjoUFHE5MH4nyD9oy3bTZiprmR4gbttYzTesqxxadilWLybFt2kc1tulRKgaxF
         5FfbpmeXt7ae0A600oORRNNUvBb1bDKKGuPCZ6Z8r0dyYZ6TzQCrYbOo/bld9D0Ry2tX
         lD+PvKu6JuTO338PS7+kAVbJlBrmsz5j1SdQw5UDvz3bVdsGbwqbKFl76dHExoYsTmxw
         VnZgsL/t94MGFpikIDeuwiB/cJTQVj8DV9Q0PkanAYhtlJsPZWFNwRJw/ig3N9opkYdo
         YG+A==
X-Gm-Message-State: ACrzQf2baZ4GOHZhpxxs6L+uQ0M/h0G7CFx8PyM1DsWH1aQyXs0DfMea
        zuTHuiKMEldRA4bwgigUtMk=
X-Google-Smtp-Source: AMsMyM7AaL9pahQeH6kn6nVJ9oUm8K8AlMGy8C3RkkkNmmCkrdNYQ/cbGFvFrN/F4cXxBEQ7O3ALhw==
X-Received: by 2002:a17:90a:ba90:b0:20d:3434:7f56 with SMTP id t16-20020a17090aba9000b0020d34347f56mr6620528pjr.105.1665763602956;
        Fri, 14 Oct 2022 09:06:42 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b00177f32b1a32sm1898929plx.271.2022.10.14.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:06:41 -0700 (PDT)
Date:   Sat, 15 Oct 2022 00:06:35 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y0mJC8lVM/cgBLyi@sol>
References: <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
 <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
 <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:25:31PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 14, 2022 at 11:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 14-10-22, 11:45, Bartosz Golaszewski wrote:
> > > Maybe also add chained mutators everywhere? To be able to do
> > > settings.set_direction().set_edge() etc.?
> >
> > Based on Kent's suggestion earlier, what I have implemented is
> > set_prop(), to which one can pass all settings and it will apply them
> > in a loop.
> >
> >     pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {
> >         for value in values {
> >             match value {
> >                 SettingVal::Direction(val) => self.set_direction(*val)?,
> >                 SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
> >                 SettingVal::Bias(val) => self.set_bias(*val)?,
> >                 SettingVal::Drive(val) => self.set_drive(*val)?,
> >                 SettingVal::ActiveLow(val) => self.set_active_low(*val),
> >                 SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
> >                 SettingVal::EventClock(val) => self.set_event_clock(*val)?,
> >                 SettingVal::OutputValue(val) => self.set_output_value(*val)?,
> >             }
> >         }
> >
> >         Ok(())
> >     }
> >
> > I think that replaces the need of nested ones ? And if we want to add
> > those later, we can always come back and add them. But I am not sure
> > it would be required.
> >
> 
> I cannot find Kent's comment on that - what was the reasoning behind this?
> 

The comment was:

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


Prior to the line_settings change there was a veritable forest of
mutators, so the idea was to consolidate them where possible, cos in Rust
you can.  But behind the scenes the implementation is just fanning them
out again, so I'm not sure I see the benefit if that is the case.

If the mutators for each field still exist they may as well be pub.

And they should return Result<&mut Self> so they can be chained, as you
suggest.

Wrt the values param (which I would prefer was called props), the idea
was that the config could be built and passed around as pure Rust
objects.  The set_prop() applied that list to the C line config, at the
time using one of the default/offset/subset mutators.  So it decoupled
the settings from the scope they were to be applied to.  Not such an
issue now - the scope is always line.
Might still be useful, might not.

> > > And I would still love a thorough API review from someone who actually
> > > knows rust too. :(
> >
> > Well, Kent did a very good job earlier. I am not sure if he has extra
> > cycles to review this once again, though not a lot has changed since
> > last time.
> >
> 
> Yeah sorry Kent, I forgot we're at v6 already and you did review the
> previous iterations. :)
> 

My review was of v4.  Things have changed a bit since then.
And I agree with your original point - it would be good to get a review
from someone that actually uses Rust in anger - I only toy with it.

Cheers,
Kent.
