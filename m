Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C8B63E7BA
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiLACUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiLACUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:20:17 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931D2A0557
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:20:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o12so526818pjo.4
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=916KUp4h0ak9JjsMQ8eRkiTGlOu7SdqHYN5gds5FGmo=;
        b=jspWBvHTTM+OKuchnkefNN0CpfDaGG1L1AtMNcPI2FouBwgfM+pSPeirjkT7xhCYlJ
         SflzoZQBt7YYplc5tCFFWk7fdm6Hu6ht0svNg0+CBo6pOGrqQ5HMwtVd5Mw1hGiiC4IP
         HHq6u8KTDWtc7b/OEq142nTn8yitrA0jtbmCttzLMFINn9o5QlmYh4xOFdyJQ2FZYrx6
         cZmSdufZTb0kFt6n6qt/G4S9ZjRpMwjirhhyJ8Z6mLNm+R+fv9mlBNsIFQ+S/8gO41xC
         w+E4SPlw4NXYdIsGhtgNE3u4BgmrQ8WJSptpw/KITu+Y4zABh9Qc50kJZeBKRcC37GJi
         qECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=916KUp4h0ak9JjsMQ8eRkiTGlOu7SdqHYN5gds5FGmo=;
        b=e7qmVN5EzfaGeNSyH99HUunveCXIXHSl7yR0cmEO1DeFyMgoLnUgUqtq2o+hZtjnzL
         SE5BOEiAA4qqFFxEqDWivJPPUlMCEnSwaP5VjxkDocvjJRxi/qpPny1hCJLBdfKhXCkF
         yZop/GcZ6znLQvqQiEIh2ayyOipHPUUKY0bvFfGyeSQyB1KcRjV7AOa/3WLDMDkbXLQM
         pn2oC9cngSOKYSCRhowse+hm8J1J1HVY7gwEigtWyjOi7hHZUhqN5I+TrIkuxAIM0DmZ
         Rf/kgTitxgZVhjbq25biFKYyL8m2oc9XDtLTS3Z8csoBdZ6h66grIDqs8x7G0/5ZI5to
         A35w==
X-Gm-Message-State: ANoB5plJhkB3vFNqUJ4yfHf9y6tBiVJPEbD+f/gEl6yHvuN5OYSuTtMw
        FX1/51QdY5scm1JZfihG8ywrDg==
X-Google-Smtp-Source: AA0mqf7IN9YTRZmV83ZJLz1OQa94GgWmfwV4s6C4E45zQx9kdQG9Z/dgJjj4O2ivl7kXYqNqVfSZCQ==
X-Received: by 2002:a17:90a:4892:b0:216:92a9:fd50 with SMTP id b18-20020a17090a489200b0021692a9fd50mr67491678pjh.126.1669861216163;
        Wed, 30 Nov 2022 18:20:16 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id i4-20020a626d04000000b0056d98e359a5sm2007866pfc.165.2022.11.30.18.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:20:15 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:50:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
Message-ID: <20221201022012.cc24ljwdmu6zuuak@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-8-brgl@bgdev.pl>
 <Y4djKAW2Y1RQb98Z@smile.fi.intel.com>
 <CAMRc=MfUo2dq6qCiP4q0K0W2b=fBWdb9Jo3b6b=u9DQDQNArDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfUo2dq6qCiP4q0K0W2b=fBWdb9Jo3b6b=u9DQDQNArDw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 17:20, Bartosz Golaszewski wrote:
> On Wed, Nov 30, 2022 at 3:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 01:42:27PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add missing license text files and use the CC0-1.0 license for the
> > > rust-specific .gitignore file.
> >
> > ...
> >
> > > diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
> > > index 95054d9..6fe7bde 100644
> > > --- a/bindings/rust/.gitignore
> > > +++ b/bindings/rust/.gitignore
> > > @@ -1,4 +1,6 @@
> >
> > > -# Added by cargo
> >
> > Seems like automatically generated, which means that next time something comes
> > here may well screw up the below.
> >
> 
> I think the comment refers to the *ignored* files *added* by cargo,
> not saying that .gitignore was added by cargo.

Yes. Cargo, by itself, updated the root folder's .gitignore I think and I had to
copy/paste stuff here.

-- 
viresh
