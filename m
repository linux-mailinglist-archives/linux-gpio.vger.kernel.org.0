Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A515661736C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Nov 2022 01:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiKCAiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 20:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKCAiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 20:38:24 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B239DC4
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 17:38:23 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d10so206842pfh.6
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6bvyne7RDDueJmMyr1M+qanSI2KzotzdT0nOUPbJnM=;
        b=mFmnC6Nh3Gm36qyQEfsRp1Q0mxFcZSsGyD3gEunpLy1e4/cqiiD0S3/4D9NeNBHMR6
         e8oF/EiYBVoJ5U0AeRT+ohL0HXMyRaje2o0p1AApfh3AUD/HH+wu8d+Ytv1P7ukPLyma
         tWF3ECI5JmmB4/kJwRWaRnM4l0JSXMtFd8r9fkGujerpQRKl1TfwFKkJ0aDkVzhTO+2j
         ma2NvnT18OYPxQcWPdxsYnhOe0aANvaoZdkLH1m7t429QHq77Z3WAuMAhIs5HNbLnUXU
         DZnjykPxWAmXBDXHm/504ymq6aKGK8/SDSdMIFyQZ7R3dC+MsGfA/itycgjOpvzVobL0
         xTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6bvyne7RDDueJmMyr1M+qanSI2KzotzdT0nOUPbJnM=;
        b=FRDjYY24/B0+X7rxvJWPKTskkQdWMrtyjonB15JqMEwoJX+apm87G04rnlS/S8bPt1
         3G7xC0oXk4YqFTnT54sCqYxcS54eKJlukPTpdFUQ2R9yWE5DJn+uDJcL49/B7gh6x0tF
         cMzv0R6pkiNpFtzh3xo3NGxuEDG3v+vJ+aX8XPy+uXnIooxfFeoGndVwI68BBYVmuAKO
         UBi7ApPCuUGghNtGm4YiDGaaYPA/MBshnZ/AZXTsuMzXYUvttJTomSJwVbR4Pa8DBrTw
         bI6fg3qHQXKFbpoD0IQD9ZDwJBx59yOqKh8/dsBQLiqWfG1+8y61uONzU9Ikg4DSdsxy
         EPhA==
X-Gm-Message-State: ACrzQf1KtYwAts1R9VS2Hkz4Tu8zDLFY2sfPikO5xTczr7BBgBeY788C
        iIZqhPZpvIqUE1gSRE+Q3OM=
X-Google-Smtp-Source: AMsMyM7HiHKGxW2Q2xeRgc02l38OUWJJR6wOsSg36TuSSNLTR1ZvOIW6tcNtKuP1qzJqmJYzF/Zyzg==
X-Received: by 2002:a05:6a00:4ac3:b0:56d:6e51:60eb with SMTP id ds3-20020a056a004ac300b0056d6e5160ebmr19136395pfb.58.1667435902480;
        Wed, 02 Nov 2022 17:38:22 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902684f00b0017e232b6724sm8888890pln.69.2022.11.02.17.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 17:38:21 -0700 (PDT)
Date:   Thu, 3 Nov 2022 08:38:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y2MNd0Y27hZ164i2@sol>
References: <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
 <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol>
 <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
 <Y2JrywE5RB0Mdrqo@sol>
 <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 02, 2022 at 05:34:20PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 2, 2022 at 2:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > On 31-10-22, 20:33, Kent Gibson wrote:
> > > > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > > > support, or as his work appears to be on behalf of Linaro that they
> > > > > would have an interest in maintaining it.
> > > >
> > > > I will surely help in maintaining the Rust part. Not an issue.
> > > >
> > >
> > > Sounds like a plan. I'm going through Kent's gpio-tools patches and
> > > rust bindings are next in line.
> > >
> >
> > The rust bindings might make it in before they do - you may find that
> > they are a bit more different from the old tools than you were expecting.
> >
> 
> Yeah, I can tell that. :)
> 
> I have lots of non-functional minor things to point out - mostly
> coding style etc. - that I will probably just fix locally when
> applying.
> 

Looks like there will be a v5 for the optional interactive set, if
nothing else, so let me know and I can fix them as well.

> One thing that stands out though is the dependency on libedit - do you
> think we could make the gpioset interactive mode a configurable
> feature with its own configure switch that could be left out if we
> don't want to depend on any external libraries?

Well, libedit was your preferred choice.
But, yeah, making the interactive mode optional is a good idea.

Any preference on the name for the config flag?
--enable-gpioset-interactive ?

One other major thing I had been considering, and implemented in my Rust
version[1], is renaming the tools, since it isn't intuitively obvious,
to me anyway, what gpiodetect, gpioinfo, gpiomon, and gpiowatch do.

I went with:
 gpiodetect -> gpiochip
 gpioinfo   -> gpioline
 gpiomon    -> gpioedges
 gpiowatch  -> gpionotify

where the names try to indicate the information returned, rather than
how it is collected.
And yeah, I got stuck with gpiowatch/gpionotify as I couldn't come up
with a short meaningful name for line info changed events.
Suggestions welcome.  And lice is not an option.

gpioget and gpioset remain unchanged as they are already as clear as can
be.

Would that work for you, or would you prefer to stick with the existing
names?

Cheers,
Kent.

[1] https://crates.io/crates/gpiocdev-cli
