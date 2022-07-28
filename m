Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10347583B9F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 11:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbiG1J7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jul 2022 05:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235375AbiG1J7g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2022 05:59:36 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DBE66111
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 02:59:35 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id o3so1375969ple.5
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cm6h2JHiDePYtsRUXXiZEVmyi8Xq8kMXwnZkUpRpzzo=;
        b=hQPN7ooWTsZvJ7iFzatbyxhqseH2pa7vZKWTrSCEqHwnBC9aQCH0AuIHnZuuNJa5rA
         dHUuPEEn8oqMlKKCJuFy81bNrvRsnu12WakwjPi6USufn1433OQNalR60gDlB0V4L3mu
         dmE6s+SAfwzFbMZXO3FSv4e6fPHhQsD5mV8FVZQypCASITcolarkhM6CKuLB0VZ7v3Ti
         1Vqmydrc7BasV0nvhapNPrOKLR2EIufWdt3BdakWBVXXgfwOsPE80Ug2y3ufb0ThLtzf
         TL/QKFtPS9J1YShGya3qVn/j8uW0dHnUf+JV9MmR0YoE1LrX4ulspyUyaT+jbAbnhuYR
         /Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cm6h2JHiDePYtsRUXXiZEVmyi8Xq8kMXwnZkUpRpzzo=;
        b=YWovC4axe+M3LHywDhSnbe7Yz8d7QTAAOUwaqXfw2ZmtbAmIXX3zQ5Lk+BQIKYOSRa
         qElZSfspbw6enFRz4HIYn3A7qQu43jzJ3iJe+ggVUpUhHoNZEyBeRPzs9rHjlCd1Eg7d
         PyJqr5zN4cCuJrj+8IRn2/SYSEvdrGyrU1jy7WqmR+yoCsULOgY+elWb2R5B80z8hAnI
         S/0ggyWVDJyXU/L130euRXL9mo3Jjjo9/ed5AvRBWgccB2U1DN823o9fA6do+0NnEcpG
         wOyuGkc0T7OTMjePoQF9hJstIeUtIHV5uO3J3AvE7cmJ6fFkQI112SItw36NBpUda2w1
         s6lA==
X-Gm-Message-State: AJIora89noXhsCPkV26T7+JSMArimCSU6uaRlGjjp0BKHSWB5XNqN10n
        muQOumuLw+slZ2oZANApi8c=
X-Google-Smtp-Source: AGRyM1t42rIr5yLIZdMlXn5NVIoo7zR3Og2LBe79OofDb2NFQuUZfLDYwuuyp6GbhW/3dv8pNPjYdQ==
X-Received: by 2002:a17:902:8f95:b0:16d:bea5:7bfb with SMTP id z21-20020a1709028f9500b0016dbea57bfbmr4004173plo.124.1659002375012;
        Thu, 28 Jul 2022 02:59:35 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id p18-20020a637412000000b0040d75537824sm573390pgc.86.2022.07.28.02.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 02:59:34 -0700 (PDT)
Date:   Thu, 28 Jul 2022 17:59:27 +0800
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220728095927.GA43587@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220728085224.myrmixyyqjsaio76@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728085224.myrmixyyqjsaio76@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 28, 2022 at 02:22:24PM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:57, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
>  
> > > +    /// Get the number of events the buffers stores.
> > 
> > stores -> contains
> > 
> > The capacity indicates the number that can be stored.
> > This field indicates the number the buffer currently contains.
> > 
> > And, as mentioned above, rename to len(), and return value should be
> > usize.
> > 
> > Add a set_len() method to replace the max_events parameter in
> > LineRequest::read_edge_event() to handle the unusual case where the user
> > only wants to partially fill the buffer.
> 
> So capacity is max that can be stored, len is what is currently present. What
> read_edge_event() needs is how much we want it to read, which should be <=
> capacity.
> 
> If we remove the parameter to read_edge_event(), then it must fetch the value
> from the buffer itself, which should be buffer.capacity() if user hasn't called
> set_len(), else it will be that special value the user sets.
> 

Ah, so the the problem there is after the read_edge_event() the len() is
supposed to indicate the number of events in the buffer, so if we use
that to size the read then the user will have to re-set_len() on each read
- so we are effectively back to providing the length to read on each call.

So not a good plan - my bad.

> What do you want to call the value (to be added as a field to struct
> EdgeEventBuffer) and the helper routine to fetch it ?
> 
> Maybe we should name it "max_events" and call the helpers as max_events() and
> set_max_events() instead of set_len()?
> 

I'm not even sure it makes sense to have an option to partially fill the
buffer.  It is there in the C as we have to provide the buffer size, and
so can always elect to provide a smaller size, but I'm not sure there is
any use case for it - certainly none that I am aware of.
Perhaps we should always fill the buffer to capacity.

Then we can stick with the Vec len/capacity pattern, so capacity() indicates
how many can be written during a read and len() indicates how many are
available in the buffer.  No set_len() required.

The goal was to provide an interface that is more idiomatic than
just wrapping the C API verbatim, so the idea was to provide something
with a Vec feel.

That is what I tried to do with mine[1], though that totally hides the
filling of the buffer from the user - filling it on demand when the user
requests an event (the buffer also being an iterator) when the buffer is
empty.
Something like that may be doable using the libpgiod API.

Kent.
[1]https://warthog618.github.io/gpiocdev-rs/gpiocdev/request/struct.EdgeEventBuffer.html
