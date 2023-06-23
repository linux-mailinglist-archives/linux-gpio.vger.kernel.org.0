Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E907973B2B4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 10:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjFWI0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 04:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjFWI0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 04:26:45 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7DFB7
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 01:26:44 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-76243a787a7so29195485a.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687508803; x=1690100803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGMrArNTvfkboUZn/PR7PyirQfbpNb4b/kAhHCOUw8c=;
        b=nBbVW6qjzW0KC3aXHK9rj6pFSuf/ITvfRxsns0KWZEZErlClv98nnp/d5fMKYry2XG
         U7JydueJ8Pg/MBOJhvqFoeiDamwkqBO6GjsX1C4JjbqXa+6LjeM8W/Qi9f/7IkTXTOyA
         ORGFjJ36B3IjVthkwB5dAMaf2tMI/ykBhUP84NaZwiLk+L2Vyzk2vT13Nn4GwtzCvCSt
         nuwrQcwHkJ1ygMlx14X6/ODDbIgWN4+88wWpRZKJUM6UeP0/LyrScqCdbQAzYz/to+2d
         e9SffPY6u3AHhK3/s3hQSN6xAnNbiKb938ovnmQGnGuQcFSHagk2zWZ0IyaPgCmv+g6E
         p9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687508803; x=1690100803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGMrArNTvfkboUZn/PR7PyirQfbpNb4b/kAhHCOUw8c=;
        b=C+BlsV4ADYdFRb76s4X465fpXX83IA2yDQfPCjCmIaggKbr7rSFX62Qw7dvpCFqyie
         QwoP7tBdyvbzH/wenSE/d6MhqemlKct01o5a4OHwzgBTY3mNujHKss9gHT1319vUhIFW
         WGi90s0lUGg96LA94iykE/HGU/+UL68dVLppMbDbmQSPbToS52Z5VFvG1/FHsWjiw3eL
         BJjBcTVKP3tYmrAucuJXhg+nhJ6hNcJMzAu6jXQkUXVMbPYkFLG16k3+HFTCCACl9rMs
         z2bWak+IiHfyyYP6IdIekmvtu4aC+YsoGgcjKWa938Rkz1XXs4exMv23T1xUCcM9gyDY
         jM4A==
X-Gm-Message-State: AC+VfDzNaYgB6O8fgqAenjsu/5kmI2SMvrfWFYbqnSSKtX7Qqhbc9rSS
        jdV8lHkSf7UUnLd1NH8ePleZSGqKGqc=
X-Google-Smtp-Source: ACHHUZ5+3Ay4DoD0p8lSF2l+TVFn61OxoKMqtOzbSEaR/lRHtW20fiwW8hu9ARNs6Gr2QwJXh+nYfw==
X-Received: by 2002:a05:6214:ca4:b0:632:def:599d with SMTP id s4-20020a0562140ca400b006320def599dmr9683410qvs.51.1687508803445;
        Fri, 23 Jun 2023 01:26:43 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78551000000b0064d47cd116esm5612846pfn.161.2023.06.23.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 01:26:42 -0700 (PDT)
Date:   Fri, 23 Jun 2023 16:26:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH 8/8] bindings: rust: examples: replace tools
 examples with use case examples
Message-ID: <ZJVXPn683fXesO/s@sol>
References: <20230623043901.16764-1-warthog618@gmail.com>
 <20230623043901.16764-9-warthog618@gmail.com>
 <CTJVBIO5TY63.PUKXXIU50HDG@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTJVBIO5TY63.PUKXXIU50HDG@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 23, 2023 at 09:57:17AM +0200, Erik Schilling wrote:
> On Fri Jun 23, 2023 at 6:39 AM CEST, Kent Gibson wrote:
> > Replace tool examples with use case examples drawn from the tools,
> > gpio_events example with buffered_event_lifetimes, and
> > gpio_threaded_info_events with reconfigure_input_to_output.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> 
> Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
> 
> >     let mut buffer = libgpiod::request::Buffer::new(4)?;
> 
> Slightly tangential:
> 
> Maybe the API should provide some sensible defaults for the buffer size?
> (Or just set a sane default and provide ways to override it)? The change
> from 1 -> 4 for bulk operations seems reasonable, but I feel like a user
> just getting started with all of this likely won't know what might be
> good values to pick...
> 


The C API does that - it defaults to 64, IIRC - if you pass in 0.
And the Rust will do the same - read the docs:

    /// Create a new edge event buffer.
    ///
    /// If capacity equals 0, it will be set to a default value of 64. If
    /// capacity is larger than 1024, it will be limited to 1024.

Using 64 seems excessive to me, so I explictly set more reasonable
sizes in the examples.

Btw a casual user is probably fine with 1 - the events will still be
buffered in the kernel so the only advantages of > 1 is to reduce the
number of reads when handling bursts, and so drain the kernel buffer
slightly quicker.  I expect that the only users who would see an
appreciable difference in behaviour with different userspace buffer
sizes probably have a good idea why they want to be setting it.
Again, would be good to document that - if it isn't already.

Cheers,
Kent.
