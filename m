Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6BE5FF045
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 16:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJNOZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 10:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiJNOZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 10:25:44 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E03B9A2A4
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 07:25:43 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id v81so2330720vkv.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bqHsgShuxjT2vPGUUUfT6YZKYir4qAsxYTqAexZuz6U=;
        b=rOeP67hG70prJ82JmknaecJG/Te4FkU1X0VK87NPWp6Zhc8R2IQGMKvz+jvJKVj5QK
         z0Qn8eHx1jbuC23JKzjQyy6KMtoJOjZemVz+YB9cAwCYhDORbX2uCfToJsnIU5x58C2x
         l+5YbRRllh4WfZDUzwN/TAQXO7NSXMttDb/4TYL9H5LXwlgpMwg6CaInShNnQTzF8F18
         lYhm0dhTtiKDBsi4PqF3/kzfuAKHgmHUcGUm1qfe/vYDZYcf0byUyxMRbROuetHo+S8e
         LpccEF26tMSnPGlr9HQWcZ3CV6mXNyMgYnoWK9Bkm+qDFydfSLDx0fNgXcoepJY3Lmdy
         9yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqHsgShuxjT2vPGUUUfT6YZKYir4qAsxYTqAexZuz6U=;
        b=2WJ3MleWkkTt0x+1CVOiCdo8dNdF6wM4ZTKs6MLrIdFIYQanq7sG+KOT0stuUbTuu0
         qpFDCMhUkBEjRbctmfR4qI3QOeLWvtYu3aym4tB18fkheJ6dAdrwVgXukLw9tsbZyuix
         LWdtneeAuik0BerroP5YRk0lVgtPgYzlI7V5BlDh7B/uUTtJyNonHe1BMFkl7vTD696u
         I3zbcU2HyPUyTmCwO8IBBX9CMltmt++92h1ktDaKaoFksw9alNba8XMXHGtWHm4r5f7o
         VwPnFwkH70rSDDZredm4SHPuXeavRJPokhUv/YLthyXSi0fzI5Nuza0Lni4zDT4JMC65
         2q0w==
X-Gm-Message-State: ACrzQf2VwloHt+PvXXQ4ho/cRckxsG2J8jO3Q/KB9YOKrxl0yIYVBDPM
        MfOq/4asrw6qW81iboMTxcZTuW9+VlJsv2ZmuU/1OQ==
X-Google-Smtp-Source: AMsMyM4S5SQEyZ+bGCoFl4SKzjF8TKEnqUZzdbpEflFLFG5eXg4MP5I2qQzQAOPSihuECqB1k6XvCcy9/2vpQuB2ZOw=
X-Received: by 2002:a1f:e944:0:b0:3ab:334d:2896 with SMTP id
 g65-20020a1fe944000000b003ab334d2896mr2715172vkh.5.1665757542269; Fri, 14 Oct
 2022 07:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7> <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com> <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
In-Reply-To: <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 14 Oct 2022 16:25:31 +0200
Message-ID: <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 11:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 14-10-22, 11:45, Bartosz Golaszewski wrote:
> > Maybe also add chained mutators everywhere? To be able to do
> > settings.set_direction().set_edge() etc.?
>
> Based on Kent's suggestion earlier, what I have implemented is
> set_prop(), to which one can pass all settings and it will apply them
> in a loop.
>
>     pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {
>         for value in values {
>             match value {
>                 SettingVal::Direction(val) => self.set_direction(*val)?,
>                 SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
>                 SettingVal::Bias(val) => self.set_bias(*val)?,
>                 SettingVal::Drive(val) => self.set_drive(*val)?,
>                 SettingVal::ActiveLow(val) => self.set_active_low(*val),
>                 SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
>                 SettingVal::EventClock(val) => self.set_event_clock(*val)?,
>                 SettingVal::OutputValue(val) => self.set_output_value(*val)?,
>             }
>         }
>
>         Ok(())
>     }
>
> I think that replaces the need of nested ones ? And if we want to add
> those later, we can always come back and add them. But I am not sure
> it would be required.
>

I cannot find Kent's comment on that - what was the reasoning behind this?

> > And I would still love a thorough API review from someone who actually
> > knows rust too. :(
>
> Well, Kent did a very good job earlier. I am not sure if he has extra
> cycles to review this once again, though not a lot has changed since
> last time.
>

Yeah sorry Kent, I forgot we're at v6 already and you did review the
previous iterations. :)

Bart

> > But I will play some more with v7 so do send it.
>
> Great.
>
> --
> viresh
