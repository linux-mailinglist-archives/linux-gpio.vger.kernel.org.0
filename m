Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484DD581F81
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 07:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiG0Fbs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 01:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiG0Fbr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 01:31:47 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F1A3ED4E
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:31:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id v16-20020a17090abb9000b001f25244c65dso1079794pjr.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mYIT5dD4sNTqmYNQJZCSKmdSBzdn8dMwvL0lZTRuLxE=;
        b=m0WngtGAx/EV+SDMiVljw9g1Wj2LQH5tsTidEceeJ75Feqgs9SMP9EjRokoagJKyO+
         99Z5Ls7shWmv6QaEHKUtQgRA5wjv3D4xDZZmcSUwVGbatlCfyJrd/KcNhyrpVj88cc1u
         hcLQIop06M9hCrgTNTyTS8q4LnjUGTzXml7D9ZimWEZQAo5U6Nl+imsxbDXoJVrUKDfn
         6Qd43HE44Efdp2mlHrOghzf0RLX+s81pQP4iec97Yz4Oh/epVqNC70EPHOA2LdFZ3iRD
         7J8V/aoB3yknz1TejHeqSKlbB78EFaJtdzwmRWGFkhj+5LPGNhdeKWJDdQoZOnKECxBt
         yYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mYIT5dD4sNTqmYNQJZCSKmdSBzdn8dMwvL0lZTRuLxE=;
        b=gV6v6v8Lw2d3LAjgw1eR1b3c6Cpls6Plf9Uy2WI5qEByFmFC84OqjWYHByLi6nyd+D
         eyxzxUFxkdMFmybHCmB9pteUjSfZcr7l37V7DW2jrlszaQiqcWwC/P20MrEoQRXyYBDD
         7AoJPEwEEJK3cMV6HPcTOgJVZ9mTVI7mpjWyyFdfcCl5h3K2CbOHpnxxaTv+sg6tD2Ho
         xjE7ARqaOHK3LhNyqjfQpSWY8QxZyiotTwJVOS/do11VuYsXbQQiU6AEuHeiUoVIbpvj
         3S6e2woXiFL/jCP+wUIDggKE00fInA1Vvvbf/vpz9ixRJxtXSCrb8jGyxAin6Twn5QnS
         v13Q==
X-Gm-Message-State: AJIora+pGrmkNS0n16Juup+dLhmQZrbDjo6pGaapu5X0hqQhgBAHERJP
        50zw4byKklGDoWTo4/kilaym2RKbDrg=
X-Google-Smtp-Source: AGRyM1s30LsfKq5jrUe8KjR11vaR7aG0q9QhNjNOuNAWu3b//3Q6Fkt/9o0H00B/NMzEccj/3avPEg==
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id oo2-20020a17090b1c8200b001eeeb41b141mr2692278pjb.143.1658899904898;
        Tue, 26 Jul 2022 22:31:44 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id ik5-20020a170902ab0500b0016da9128169sm1774488plb.130.2022.07.26.22.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 22:31:44 -0700 (PDT)
Date:   Wed, 27 Jul 2022 13:31:38 +0800
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
Subject: Re: [PATCH V4 2/8] libgpiod: Add pre generated rust bindings
Message-ID: <20220727053138.GA108918@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
 <20220727025723.GB88787@sol>
 <20220727051529.becrq3qecbild2iq@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727051529.becrq3qecbild2iq@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 10:45:29AM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:57, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:04:55PM +0530, Viresh Kumar wrote:
> > > +## Updating bindings
> > > +1. Clone the source from
> > > +	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
> > > +2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
> > > +2. run `cargo build --features generate`
> > > +3. Commit changes in `src/bindings.rs`
> > 
> > Those instructions do not force the regeneration of the bindings.
> 
> It does, just that the new file that got generated lands somewhere like this:
> 
> target/debug/build/libgpiod-sys-769f98853e1c0550/out/bindings.rs
> 
> and the end user crate will use this instead of the one in src/.
> 

But the instructions don't mention any of that, and the implication is
that src/bindings.rs will be regenerated.

Cheers,
Kent.
