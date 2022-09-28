Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA4B5EDFF0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 17:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiI1PRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 11:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiI1PRV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 11:17:21 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACDE8B2C4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 08:17:20 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id iw17so12073078plb.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ghawqaLQ421cJD+xuI4053nt7PxFnu+wVQFMzKEtwF0=;
        b=SEF5Ah1Fg94aK+LAukYdSINgroIBF5cnO6q14p95NWMZ5xiBEz6rXRvflqVb8fU7PD
         2i3N9qxhfIfZC9mD0H050goF8hr4wlCzKrbrPUYf190kJ3MsHkZN+cTuj+aLil4ebVxX
         5J+OeUouaVB7zGsC4logNDoie7OA7w3JnMIUlbfIFqVvONJOmDtpDf99gUp0H5aSh5DG
         Dr+A6DqZdY3EHvgbfmzeRd7K7dMFjYlohWI73qptMrdvcVQzukjjqcVjjsqEyTl9kO2V
         gRPhpl/N7vF08jg10FuB4U+g3YTBQ5sFdMxnVm+pTY7E99zx4Cjtq4xWU/hfX+OhcSDU
         SKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ghawqaLQ421cJD+xuI4053nt7PxFnu+wVQFMzKEtwF0=;
        b=m4UYTarR0/hUlhyRxjPqlDwnBNDh2+3wdxiiGFgsIIoLNxEfUIhy6e+ByYlL+9f5PF
         5rrIcr3gcroI8r7cGPtRzE9AntZ4ORHSVLJK9xymbcJC6gyjGui7dMO1dnJhItOLKbN5
         oAngedfWhmFdit8DCWXuK6Uql+16/ewI+IU8+CL/VQvZJEWbalg4D2kT1qu2uiXZrzZp
         +GGEODehlMWT8htErHHqMB2mBP8BvE+I8ihERGouXXo9s8UPOirire7lZbLg++PwQgxy
         skUvV2wC2rOvoAgUfUHOkheyNtivp0SOUlLKv5VS7xfvIwFOTBIRWTMKGUZJoe/jPd+y
         jnKQ==
X-Gm-Message-State: ACrzQf3jFzLuUPggsq0xkBUK+sGP3cjEoxk6bw66C2onnYvNH0SmJ4Kp
        6CXxZN63hGVF6otvNJWiV/XZ+Q==
X-Google-Smtp-Source: AMsMyM6PPAZZDB0CE2dCElyqOwb5KXUz4D/5ViD9yzpN99hVMqPyyGoBDizwAljRN5BE8Dahwebrgg==
X-Received: by 2002:a17:902:7b87:b0:179:ec0a:7239 with SMTP id w7-20020a1709027b8700b00179ec0a7239mr301347pll.139.1664378239912;
        Wed, 28 Sep 2022 08:17:19 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id 64-20020a630343000000b0043be496f3f3sm3757606pgd.57.2022.09.28.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:17:18 -0700 (PDT)
Date:   Wed, 28 Sep 2022 20:47:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
 <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-22, 14:20, Bartosz Golaszewski wrote:
> Ok, so this is not correct. The doc for
> gpiod_edge_event_buffer_get_event() says:
> 
>  * @return Pointer to an event stored in the buffer. The lifetime of the
>  *   event is tied to the buffer object. Users must not free the event
>  *   returned by this function.
> 
> We make no guarantees that the address returned by
> gpiod_edge_event_buffer_get_event() will still be valid after a call
> to gpiod_line_request_read_edge_event(). In fact the doc for the
> latter says:
> 
>  * @note Any exising events in the buffer are overwritten.  This is not an
>  *       append operation.
> 
> So we're being clear that after a call to
> gpiod_line_request_read_edge_event(), all previously returned edge
> event pointers are invalid unless the objects to which they point were
> explicitly copied.
> 
> Current implementation does indeed work like what you describe but
> that behavior is not "contractually" guaranteed and can change even
> between minor releases.
> 
> In C++ if you do:
> 
> const edge_event& ev = buffer.get_event(0);
> request.read_edge_event(buffer);
> std::cout << ev << std::endl;
> 
> You risk a segfault.
> 
> My understanding is that Rust should not allow a crash in this
> situation by design.

Hmm, so what exactly do we want to do here then ?

- Don't allow events to be referenced ? i.e. make event_clone() the default
  behavior ?

- Don't allow read_edge_event() to be called twice for a buffer ? that will be
  inefficient though.

- Somehow guarantee that reference to all the events are dropped before issuing
  read_edge_event() again, else make it fail ? I am not sure how straight
  forward that can be though.

-- 
viresh
