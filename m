Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E4562DC41
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 14:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239597AbiKQNF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 08:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239618AbiKQNFw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 08:05:52 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FB66D495
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 05:05:49 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id k5so1592433pjo.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 05:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/3G9pMb/Z942+SR6JIdPEt0AlOdg/Z2Sd/Oe689Yak=;
        b=qLgPNIj0aIMxLXSrr8uJg+rdYnLP82hqbJz/Nr9QGvN4Kewu0xL/pAlKOCt091Oy3C
         TawRMB6epbqPzmB/pz9Go9l2Fs5Pj3be9MHSI8xoc0tATt6xX0TII2dH4OSHcWiRYWM7
         Sh9AIRYmq8tftweAqJogef6jNXKZITsmSX8qTJYX46+EceHvSDArjPJV3XI+NeaXxlhP
         0vlI8rase7zIY7IR0TmOt23e2V0Nms69FFS0FIdsyU2F/IKM5hX9tqINMpXRjAmi8LYY
         fu83p6+/6jJWZNNvFxJusqwXepNqhrvV+Jh9I56WL8NFIkA49jirXHM61z7CV2jVjnpR
         GcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/3G9pMb/Z942+SR6JIdPEt0AlOdg/Z2Sd/Oe689Yak=;
        b=IAkiOw8PQjKNkk4mHMJOp+PS1usUEyZVIJTGYR0ntND2OUrVJ8rQEQwyX0MKis4JZY
         L1r6HBk9fukRWTQcADwxH2tSmS6a0HP97wXgIhMXjnWA7QkmxKzDG2eJZMiT/heKrujS
         HCg1QPuCoi5//zJ51ywuKZMploUMynxeq/HqAvNTbTqLIvjqM2MD10aIKsp7SjNC4KYw
         0IXXEt58VpH4kEPkRdgYzV5q8MRdvvIHESvO9dgm0BydI3fHLjPjz6OHYi2xKjkq7TNA
         tPqsi01jAKxfup7cSQuGdpsTvt+l3ojknsNN9O74X8EQLB4tJAEN+YMRJUM8En5p7NH8
         s+iw==
X-Gm-Message-State: ANoB5pkpIQl5G6AGi0avLi3S00hIP/UXVEQNCHWUHnVMfEFgCfBCC8fK
        EsKbCRwTp3YV/Pd1rwGk0YE=
X-Google-Smtp-Source: AA0mqf7XcWXnBkUC85zlh2oUEOzQ71Qnv1Jzd832cC+HQfgsMP2s0EPhlY6I/xRblADKG1gmwJ1hQg==
X-Received: by 2002:a17:90b:802:b0:213:c9cd:450b with SMTP id bk2-20020a17090b080200b00213c9cd450bmr8927035pjb.152.1668690348881;
        Thu, 17 Nov 2022 05:05:48 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id 22-20020a621916000000b00565c860bf83sm1030617pfz.150.2022.11.17.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:05:47 -0800 (PST)
Date:   Thu, 17 Nov 2022 21:05:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <Y3YxozG/ojU6pEZf@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
 <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 04:55:17PM +0530, Viresh Kumar wrote:
> On 17-11-22, 12:15, Bartosz Golaszewski wrote:
> > So I'd say - just use CC0-1.0 license in Cargo.toml?
> 
> The Cargo.toml files already have following currently:
> 
> license = "Apache-2.0 OR BSD-3-Clause"
> 

That is the license for the resulting crate, not the Cargo.toml file
itself. And they aren't necessarily the same.

Using CC0-1.0 for config and documentation makes sense to me.

Cheers,
Kent.

