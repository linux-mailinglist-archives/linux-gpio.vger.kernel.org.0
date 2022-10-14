Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70ACC5FEC2F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 11:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJNJ5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 05:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJNJ5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 05:57:31 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D9E1C3E67
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:57:29 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so4345140pjb.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbejNAfTcuR9AptHED5Voi/rrbRHF0HfkiHjTnCloM4=;
        b=r5IW4YTME5JT3arlIjMp94erdSpErJfTvKXiQFr2tkyTd21U/CyNkseyBHzlHwYt27
         Sq5x6QSnT20pEZnNiFpIWodq7i7na7OlKdssXLOC79MAtXqK2yluhdbYsDD6ffySk/ZP
         VL/y15ryI17llV+is+svMoYXb012FQP83MZnI74FOT3pHp596EKZDME+JLkV5QneyXew
         TM6JM4ngIS7D9WN6ba3y21My1uRyFrpVGnxb09K6pM79zwsprm7LXD3qq1lR49W+jwLY
         JKyIWl0voIH22QqWOM7t3zUYlaH31MVXmw0eVvYm0JbpSvLlqQvxN6+h5IM6Ga05sInA
         Di3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbejNAfTcuR9AptHED5Voi/rrbRHF0HfkiHjTnCloM4=;
        b=WVtFZ4c2thMGoSWneQZeaO2wP6/1SHFp+aZPP8peXhVeGih8SqoIDiaPN0az5H+v2g
         O1Pwa7ojiTk0OETkIvQoEyLgroUTo66KJa955n9HmAloFrjZuUGMVpCVVzKC+XKwxMVS
         yXIguC/zhg1oltd9GHuCBgMgV15HJyl1CP8WnieGHv9/oCMU1FC0Kn6bjuW1C644ORX+
         i3BVDbqfW91hfnsittrq4yuADraPMocu8dnzivXGL1EAyR/kHhGFu8JHIirMSnoJLqJD
         Lt9mzvrZfHziyDaDFTKQqISKmd6EPa3tM0HZyNKzPSrLWO7huHUDDnIwe+C9X3P2+htQ
         +aKA==
X-Gm-Message-State: ACrzQf3Ifkt6PfmWaRLYh3Jelop7w2UyF/gRnBwboCJRE/YSyLZPLhbn
        a3/vaQUoBQ2W9pnPCT2koa6eaA==
X-Google-Smtp-Source: AMsMyM7CGf129HqEuEmFsS/L1c9Xn7phVV9f4MtYsayou+uRb7F7wkhy4G8GrKMHnYxNk9WLUxVIRA==
X-Received: by 2002:a17:902:ecca:b0:183:7473:580c with SMTP id a10-20020a170902ecca00b001837473580cmr4481329plh.167.1665741449127;
        Fri, 14 Oct 2022 02:57:29 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id 2-20020a620602000000b0052d4cb47339sm1275426pfg.151.2022.10.14.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 02:57:27 -0700 (PDT)
Date:   Fri, 14 Oct 2022 15:27:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
References: <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14-10-22, 11:45, Bartosz Golaszewski wrote:
> Maybe also add chained mutators everywhere? To be able to do
> settings.set_direction().set_edge() etc.?

Based on Kent's suggestion earlier, what I have implemented is
set_prop(), to which one can pass all settings and it will apply them
in a loop.

    pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {
        for value in values {
            match value {
                SettingVal::Direction(val) => self.set_direction(*val)?,
                SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
                SettingVal::Bias(val) => self.set_bias(*val)?,
                SettingVal::Drive(val) => self.set_drive(*val)?,
                SettingVal::ActiveLow(val) => self.set_active_low(*val),
                SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
                SettingVal::EventClock(val) => self.set_event_clock(*val)?,
                SettingVal::OutputValue(val) => self.set_output_value(*val)?,
            }
        }

        Ok(())
    }

I think that replaces the need of nested ones ? And if we want to add
those later, we can always come back and add them. But I am not sure
it would be required.

> And I would still love a thorough API review from someone who actually
> knows rust too. :(

Well, Kent did a very good job earlier. I am not sure if he has extra
cycles to review this once again, though not a lot has changed since
last time.

> But I will play some more with v7 so do send it.

Great.

-- 
viresh
