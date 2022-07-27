Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7353F581FB1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiG0GAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiG0GAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:00:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F775616F
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:00:28 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x24-20020a17090ab01800b001f21556cf48so1111106pjq.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GPR1iIfO3TgxhTv/Ry3udyTd10kYV9UqeVzcBAjhOVQ=;
        b=CLJvXv12+Lh7ubF3P6kgKU2mjkOzFcMipi9X4vVm+roPIMZhlWzp4hjAlbpb0hRCLn
         Ozw9mdoASp5dTUqeIJ1Pxgeiz0s2ktOKpc+8EBWZueIiBXbbLjeqKDaC9y7hoGtlePMP
         aq1aBKPUMtHflvOdY9gxUZduZ934kD99iHA3toLEGouxl/9P39/ExGuWde9kFwxsCXUC
         3xamti7Agpj1M9o7XdhCmTEXwJtc8i9KIMHF1PN/KRfDh+B+49UfPK4HYFJ3tf5q4SUD
         w+te/Pn3fLOxRF3paOz3aILSShyBxB8GZR5TilMSVPp7bvtRD9+f36FeFqIw5g74iLA2
         xGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GPR1iIfO3TgxhTv/Ry3udyTd10kYV9UqeVzcBAjhOVQ=;
        b=XTdDLwmGN4Scw0hXfZ2swDw8htY/zMpLAgCDNF1kvzSHnZ3yuyuEqifoPOSdpfXDWX
         SBaET9N744fi/oFNXKRaD0Fkk3cT7afOWQ+KU6FaMQNDZYj8hTYlGh2uS3Z3u4CIVKuz
         /05mshOJ1dK0P2mWji5EUdHZYk6wuhSWVxgs9MJBG0mhQmeo3nzGM9Is1xlfluzwq5gR
         kBPgQc/Wu9s572wv7uLHPxn927cKRubR4FzYiZ8oD6XJppuHixgdsR40SSe0eb6zkcWq
         tI9OxNtdOMDOrmeQ8W0Q14DXCweowP1P7V9FA2AKNxiWFeJz+Q1ylWXKDBPtAtcrGf0s
         rNWg==
X-Gm-Message-State: AJIora+ORht6a69iLOnwsA7lsOUfENvOGeRgqt3iV4sq53RJPDAyHRGV
        3MuBJ83mHHuo3J38zEe8fWpA1A==
X-Google-Smtp-Source: AGRyM1vpoO9gBya22n9x00eCGZD81hbnmYAgOv9RbXC+8BfWdgSrlICv2jdeU3X3d2jrG0vC52eilA==
X-Received: by 2002:a17:90a:8a8d:b0:1f3:155:3324 with SMTP id x13-20020a17090a8a8d00b001f301553324mr2687918pjn.89.1658901627510;
        Tue, 26 Jul 2022 23:00:27 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b0016c46ff1973sm12661749pla.228.2022.07.26.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:00:27 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:30:24 +0530
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
Subject: Re: [PATCH V4 2/8] libgpiod: Add pre generated rust bindings
Message-ID: <20220727060024.cuejt6qbs75afhuh@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
 <20220727025723.GB88787@sol>
 <20220727051529.becrq3qecbild2iq@vireshk-i7>
 <20220727053138.GA108918@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727053138.GA108918@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 13:31, Kent Gibson wrote:
> On Wed, Jul 27, 2022 at 10:45:29AM +0530, Viresh Kumar wrote:
> > On 27-07-22, 10:57, Kent Gibson wrote:
> > > On Fri, Jul 08, 2022 at 05:04:55PM +0530, Viresh Kumar wrote:
> > > > +## Updating bindings
> > > > +1. Clone the source from
> > > > +	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
> > > > +2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
> > > > +2. run `cargo build --features generate`
> > > > +3. Commit changes in `src/bindings.rs`
> > > 
> > > Those instructions do not force the regeneration of the bindings.
> > 
> > It does, just that the new file that got generated lands somewhere like this:
> > 
> > target/debug/build/libgpiod-sys-769f98853e1c0550/out/bindings.rs
> > 
> > and the end user crate will use this instead of the one in src/.
> > 
> 
> But the instructions don't mention any of that, and the implication is
> that src/bindings.rs will be regenerated.

Something like this is okay ?

diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index ea037d6d7803..7d4583519e87 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -7,4 +7,5 @@ Automatically generated Rust FFI bindings via
        <https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
 2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
 2. run `cargo build --features generate`
-3. Commit changes in `src/bindings.rs`
+3. Copy the bindings 'cp target/debug/build/libgpiod-sys-###/out/bindings.rs src/bindings.rs'
+4. Commit changes in `src/bindings.rs`

-- 
viresh
