Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FD9600DDB
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 13:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiJQLeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 07:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiJQLeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 07:34:15 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B88371AD
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:34:13 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so10675380pjo.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6Qcvla8PHIerX3OGyF5GQYNvPlzAZ4TPdY5Ov4+ekU=;
        b=p7sb4WZ3XBMtfht1uzyY3Lx3kQv2spj2cqDX4aMjBEXZFFprfPhEQNLMmGHfFSuGLU
         VyR3c5QBpV5HNA7FCk8Ej9szu25FPw5xKJoAU2xOUSSLrd4jbOkfSasyfCiS21IWjRTH
         OkI0H1VYuugiXi+f5ayI2SfAGz/hF7cSWNOpOeuMOEg/DrYe7YHUGuDYjtkBEVUrfm7s
         ioIWzBWhyjQuLjWlDmBV8RomeTey5Tk67U5MggmkzlkFYS67pmGFzxL+qMzrQKuFInBO
         tebMTiGuLj2fOKzs0LKGV7EE2Gk66Z5A2pW0P4aQLeOHeW701A11EP8CfZcYcysE5ZXE
         DnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6Qcvla8PHIerX3OGyF5GQYNvPlzAZ4TPdY5Ov4+ekU=;
        b=NsR0RQirxR8O6hRBWQPesqu3BjoL8HTzAKKc/0Rg9FEpBjukBY0XcfzujvuRacvWh4
         8FOxVlhgA6UOeEbgAtf5YTWu1UcWoNPBn4rN9WC7Q0qRteYDPct9PZIAhBBzscXvE+Y6
         YkG9rH0nfDa7s5lDXgAPTNPrSQU9wddwJq3KEVFdyNyocBdxFqXUMsi2d0LcUAM22mUB
         ON+pg/aDGvUsJwH7eez+IXGWQxbsvRWPmz+ZP9rR2UHlRCyQTpi7WiZ5OI9HrirTO1VP
         Q6OwvaDWGvQMNk6Zyt0wzxgTBrTjVnjS28SYcSSohUGhiQTsP8FrG6pQ6LxzKTgaGPZW
         KIYA==
X-Gm-Message-State: ACrzQf1XOBcZF08cMce2MZMAgPvKjUIbzYwrwSy12N49lzqnWoPUC6a0
        tOm7y+tHcgbXZ5iKcUppfVE=
X-Google-Smtp-Source: AMsMyM4cbiC3pRUlTZRWu3ZZi30rlAbbYzdg0CwOqmFCuDGe/ck8CjEkAzheyd6EYZjSK94hGujbbA==
X-Received: by 2002:a17:903:1110:b0:178:9f67:b543 with SMTP id n16-20020a170903111000b001789f67b543mr11602502plh.131.1666006452957;
        Mon, 17 Oct 2022 04:34:12 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090a1d4600b0020669c8bd87sm6037090pju.36.2022.10.17.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 04:34:12 -0700 (PDT)
Date:   Mon, 17 Oct 2022 19:34:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y009rqtA1h00ZVN5@sol>
References: <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
 <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
 <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
 <Y0mJC8lVM/cgBLyi@sol>
 <20221017112625.sobgfiist7t6w5zz@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017112625.sobgfiist7t6w5zz@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 04:56:25PM +0530, Viresh Kumar wrote:
> On 15-10-22, 00:06, Kent Gibson wrote:
> > If the mutators for each field still exist they may as well be pub.
> > 
> > And they should return Result<&mut Self> so they can be chained, as you
> > suggest.
> > 
> > Wrt the values param (which I would prefer was called props)
> 
> Is this fine now ? Rebased over v7.
> 
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
> index 2c3090132ea5..be50b5b41c5a 100644
> --- a/bindings/rust/libgpiod/src/line_settings.rs
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -70,18 +70,18 @@ impl Settings {
>      }
> 
>      /// Set line prop setting.
> -    pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {
> -        for value in values {
> -            match value {
> -                SettingVal::Direction(val) => self.set_direction(*val)?,
> -                SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
> -                SettingVal::Bias(val) => self.set_bias(*val)?,
> -                SettingVal::Drive(val) => self.set_drive(*val)?,
> -                SettingVal::ActiveLow(val) => self.set_active_low(*val),
> -                SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
> -                SettingVal::EventClock(val) => self.set_event_clock(*val)?,
> -                SettingVal::OutputValue(val) => self.set_output_value(*val)?,
> -            }
> +    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<()> {
                                                                  ^   
                                                        also &mut Self

Apart from that, yeah that is what I had in mind, as also noted in my
forthcoming v7 review.

Cheers,
Kent.

