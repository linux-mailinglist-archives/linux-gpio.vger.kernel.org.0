Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576AD583AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 10:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbiG1Iw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jul 2022 04:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbiG1Iw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2022 04:52:27 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A4D65550
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 01:52:27 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f65so1016711pgc.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5rQYwP/b6zNbnuo6295VvKXc03DUn8cTtqe6xDP97qg=;
        b=T8zKDfPFJxXnmgnvmMjz0AezIXpXC6T5Lf4gh7rUYHdUdDwfNSkwo0dEcCSdSvScpd
         KggvnjXuitbhOiBa9/FOjs0nlbZL30EwvMUznx+xEwIrGFa9YcCdWvPDK1WBApXsSKqv
         rgZhn7EokRqTOOjYc9sTwWxWHknqKfIA0+CkPSgV/DwS1EJrK/4N+p0qmeI1VX6eqjZl
         94p/99pAE5J42m5QjC5wPXTzPsa7Pvrl5yvnw5JHvvh3k/31J2BgT3SgEaC6D6VQT+iH
         du8NAMkecJi7EVqGVf36M9FaWMpW8nWVTpRA2uvuhL4poWP1bwTigCoGTXhioCDxs/A2
         5q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5rQYwP/b6zNbnuo6295VvKXc03DUn8cTtqe6xDP97qg=;
        b=UKkhSFeBWEd0tezRJOHlgTZ3f94a51ulgCDl0GeHIB2Yx6kcSRdt/u825UiB8HtaKR
         /pa+WpMbQYfFvUwmMF1K0gg/rg7hvUWcBg9snIbOGz2IEbn0casRZbm0dFKS7Uj86bUX
         7r4H7ff+zwmiKmzYPnmq7gj12FhEkZmWA7+x54eDVIm8zfDdRLP3wCVOFwt7fxyhahKP
         SvIcFbDpiVQPaK2P3WH0ROkjGQ7iSSmOyklT5uzwawlz7DBD1a76f47smrDnTAYTkVYq
         wC0kuaUqzDN5hKm01viAFSeXQ3w3BypI6XvUaUDK3RGOjWBqUEUJ66+TF29yaEyHNtfD
         4HAg==
X-Gm-Message-State: AJIora9dpPM7MYjMOBGJZ9zhcZSJUQ1x8eR7rGn9IMhwNQoBoa8kJS5y
        VUdMsBen64UkVBzaYp6es+XYQw==
X-Google-Smtp-Source: AGRyM1vfkC0ey6A+QbPuobZ0++QTZBkAdhriQ9/iJXIztE2B8T7O1FqEbX7azgmEZ4W4JdeqtPvHLQ==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id k8-20020a056a00168800b00517cf7b9293mr26077314pfc.7.1658998346591;
        Thu, 28 Jul 2022 01:52:26 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902ea0f00b0016a3f9e4865sm631747plg.148.2022.07.28.01.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:52:26 -0700 (PDT)
Date:   Thu, 28 Jul 2022 14:22:24 +0530
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220728085224.myrmixyyqjsaio76@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025754.GD88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:57, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
 
> > +    /// Get the number of events the buffers stores.
> 
> stores -> contains
> 
> The capacity indicates the number that can be stored.
> This field indicates the number the buffer currently contains.
> 
> And, as mentioned above, rename to len(), and return value should be
> usize.
> 
> Add a set_len() method to replace the max_events parameter in
> LineRequest::read_edge_event() to handle the unusual case where the user
> only wants to partially fill the buffer.

So capacity is max that can be stored, len is what is currently present. What
read_edge_event() needs is how much we want it to read, which should be <=
capacity.

If we remove the parameter to read_edge_event(), then it must fetch the value
from the buffer itself, which should be buffer.capacity() if user hasn't called
set_len(), else it will be that special value the user sets.

What do you want to call the value (to be added as a field to struct
EdgeEventBuffer) and the helper routine to fetch it ?

Maybe we should name it "max_events" and call the helpers as max_events() and
set_max_events() instead of set_len()?

> > +    pub fn get_num_events(&self) -> u32 {
> > +        unsafe { bindings::gpiod_edge_event_buffer_get_num_events(self.buffer()) as u32 }
> > +    }
> > +}

-- 
viresh
