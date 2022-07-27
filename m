Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C05A6581FD0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiG0GGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiG0GGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:06:44 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF893F324
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:06:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id h132so15068661pgc.10
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CYT+RAnLT8l9VJ2gJRi7trKYrP24IbM1jQObs/oVyPQ=;
        b=hmTfkvRFYNWG5lWduC++uOSJebFpELcBpNF4YuuWHhEX3s/zi0L3HOape8FQM00f+q
         D+X/Ag+4E+UCti0AYY9NvKmh1xifaNEeLUtcwsTjbFmGhKDWYY0l0hKG39AO+B70bp8g
         tP8InuPdsUdz5aeUlGJZJajUSIrdHb6xQXrYa+1PP5s1QZ24fXXX6PFvjSCkCX1wjQbX
         Oo6nWKjYTiX24MBtL8cQW2vD7BN1y8BpMHaxwvHOXgJh42PB2XDNFn0/532qcTGrxuJK
         d2M6zrc4MvYPpuEz4NOPXu/cncJ0q2NbvlqN34GmFCHVtRKY58UQQ+uCvSiCXIct663B
         q2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CYT+RAnLT8l9VJ2gJRi7trKYrP24IbM1jQObs/oVyPQ=;
        b=kcFGotSJJE9SF98PMHbhs8Cb3Ll9EtOzRZkSukvdLuHkWWYxFUZo0luDbXBUrSdqSf
         wWGuq5Yay0XZyHtsTbR6BnOyZ23kJXmarx5wB4h5mOCCtBKKaHETDBs3UsRkKl+hrmjm
         pJEi+8MZE0QPFhFL5W3XjN0udYvupUWk/BVytJ8naPtxul5uL40FGfknqdDjlKmFQORk
         4fI6K4gLhSqpzjolWGTrFJ5o3KEA9qSzp+w7aG59bMtmtu/tyX58KT5gErJbxRysu0uv
         u7DP3A98hCNakGuwubkSPx8lUnB012K+RnXLKZIGr04ybSK6A1tYSiXS85Tvk0M+gnCf
         kdfQ==
X-Gm-Message-State: AJIora+QeOO8YAS3wiP5+KqOh7ABNhXFgiHhf4E06B0ww2pRTkBSqaf7
        MbsyV7ADqnSYhaIoj5tWt4Y=
X-Google-Smtp-Source: AGRyM1tkoINmbo1HCZlcT1H7dENddxXlMTV8eUW+TyBNV+DBh/Ojk2T19E7L9Z0eTxoFBsJklnkPEQ==
X-Received: by 2002:a63:6c87:0:b0:419:b667:6622 with SMTP id h129-20020a636c87000000b00419b6676622mr17154960pgc.495.1658902002793;
        Tue, 26 Jul 2022 23:06:42 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b0016c2cdea409sm12707928plc.280.2022.07.26.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:06:42 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:06:36 +0800
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
Message-ID: <20220727060636.GA111005@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
 <20220727025723.GB88787@sol>
 <20220727051529.becrq3qecbild2iq@vireshk-i7>
 <20220727053138.GA108918@sol>
 <20220727060024.cuejt6qbs75afhuh@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727060024.cuejt6qbs75afhuh@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 11:30:24AM +0530, Viresh Kumar wrote:
> On 27-07-22, 13:31, Kent Gibson wrote:
> > On Wed, Jul 27, 2022 at 10:45:29AM +0530, Viresh Kumar wrote:
> > > On 27-07-22, 10:57, Kent Gibson wrote:
> > > > On Fri, Jul 08, 2022 at 05:04:55PM +0530, Viresh Kumar wrote:
> > > > > +## Updating bindings
> > > > > +1. Clone the source from
> > > > > +	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
> > > > > +2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
> > > > > +2. run `cargo build --features generate`
> > > > > +3. Commit changes in `src/bindings.rs`
> > > > 
> > > > Those instructions do not force the regeneration of the bindings.
> > > 
> > > It does, just that the new file that got generated lands somewhere like this:
> > > 
> > > target/debug/build/libgpiod-sys-769f98853e1c0550/out/bindings.rs
> > > 
> > > and the end user crate will use this instead of the one in src/.
> > > 
> > 
> > But the instructions don't mention any of that, and the implication is
> > that src/bindings.rs will be regenerated.
> 
> Something like this is okay ?
> 
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
> index ea037d6d7803..7d4583519e87 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -7,4 +7,5 @@ Automatically generated Rust FFI bindings via
>         <https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
>  2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
>  2. run `cargo build --features generate`
> -3. Commit changes in `src/bindings.rs`
> +3. Copy the bindings 'cp target/debug/build/libgpiod-sys-###/out/bindings.rs src/bindings.rs'
> +4. Commit changes in `src/bindings.rs`
> 

Definitely clearer.

Still not sure how all this is easier than just calling bindgen directly,
but ok. I guess at least it specifies the appropriate-ish bindgen version.

Cheers,
Kent.

