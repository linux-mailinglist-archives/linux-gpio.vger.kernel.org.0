Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EECC4CF62F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 10:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237283AbiCGJd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 04:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbiCGJdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 04:33:10 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76806AA71
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 01:30:08 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 27so13047433pgk.10
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 01:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jJy0kd532p2lW2WJ1Hn5hLy+vehNRzAKGzQJuLCrJVw=;
        b=DeJ5lci47x4/nFLEQ1M+kqWm2iF8K8I5FyuItFN3+5juy3ahr8pa9xY/DX44A1XeDc
         PK9n5REAN2yHuiJvxD3mru46ZO8b3Pwi8ueLYqYWjhWcY2wxpLRVqGDJihkuB4RIi8uK
         ALEgfn/7X6ieSrLwWwdFC6rABLaDNow8KkQ+C1yGJ8a0J3f09HIgikQkyHFjyrTPZ4ov
         t+4kppBSRShkpMYm5G9n69GWbHJBmBhqtNZA1GJJXnEk1M7k4ZbBHgCpTY5Z+gqXgf4d
         sfB/UM/u7TCH3okJZd/+HmNygBzP5xTWLK5tf1DZy0hGp3yb9Sn5n7HHNPXqH/BmvBcC
         W0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jJy0kd532p2lW2WJ1Hn5hLy+vehNRzAKGzQJuLCrJVw=;
        b=B8M5vTLK7o+k0dqK6vwhsAeJ7YJMw+CHheWGIvLBxmYBhEUOyPYpcjdFOmtN2FGner
         vTvlp1aM1N0pUMfDBNqY2oH1GKyu1sCTStnYOjYt2SB+CEGu95Ce9yPrmXnsuxgfst1y
         LVsy9DFD1z/jcrz+DZTcq7aTQb1GNl/GlFz26NghRT3kflX6UYo8Po687O0iTi3c0R4e
         oYOlyneuEEjSF69Hc4uEcTSXPBe9KdJKzuyNxFwrlj8PMaSD6zOloka5zxhUqg9iud2P
         vWRVRxHujtw57QyH5sq3Xm5Q9HwFgvpB5jLPufcLJ+84ru+H8tyou4aoqVkP2sclBdAK
         scAg==
X-Gm-Message-State: AOAM532JgTH+eyzkVzmt9AUTEUAY0st6XGjAwMMNOUYUL3wkn72+ciwV
        +1d00ly1lgQEk2ZiAJpXCePwkItOuLIMoQ==
X-Google-Smtp-Source: ABdhPJwCeI/JE+up8K/7ch8TzWgXLKgLdPYs0IVpCYfr0+Jd0RLzryYkj5Zx4vq21WO16eSXzAvGAw==
X-Received: by 2002:a63:191e:0:b0:37f:f33c:2d43 with SMTP id z30-20020a63191e000000b0037ff33c2d43mr8910291pgl.43.1646645407003;
        Mon, 07 Mar 2022 01:30:07 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id b9-20020a056a000cc900b004f3581ae086sm16185300pfv.16.2022.03.07.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:30:06 -0800 (PST)
Date:   Mon, 7 Mar 2022 17:30:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <20220307093002.GA45584@sol>
References: <20220305094037.46361-1-warthog618@gmail.com>
 <CAMRc=MebW6P0qDi0DNckwVe2+LX3Bi84-HPZPGnAA-tvDiJ9Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MebW6P0qDi0DNckwVe2+LX3Bi84-HPZPGnAA-tvDiJ9Xg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 07, 2022 at 10:16:49AM +0100, Bartosz Golaszewski wrote:
> On Sat, Mar 5, 2022 at 10:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Having the libgpiod documentation available online would be helpful, so
> > add the configuration required to generate the existing doxygen C/C++
> > documentation on readthedocs.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >

[snip]

> > --- /dev/null
> > +++ b/sphinx/index.rst
> > @@ -0,0 +1,24 @@
> > +.. SPDX-License-Identifier: LGPL-2.1-or-later
> > +
> > +..
> > +   This file is part of libgpiod.
> > +
> > +   Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
> 
> All looks good to me except that Copyright should be yours here, not mine. :)
> 

Seemed simpler to me to keep it under the one umbrella, so happy to
transfer any and all copyrights to you.

Cheers,
Kent.
