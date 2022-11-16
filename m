Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3315B62B06F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 02:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiKPBML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 20:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiKPBMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 20:12:10 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0513137B
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 17:12:09 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 140so14557496pfz.6
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 17:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0It5KbZc0A7Bzf8S3NgAg+pHebZzRFuPQgku3idwdPA=;
        b=FNkaFNP4D46TTgKlgZ16J2A7fOlsLDhhQ5d5esrYuviXjwHweOcodLVREPJAU7gSAU
         XM6AvBnZ/6ZjpjLgfJEjO2X/KjUR84+a+62msQT++ToRPykjg9msaL36/9QxiREMGOma
         Ykd68p6E6U8NZXCkVeIIT2Aqn8OZSVYrJlPXmIoRgdzrjS7h3amVG41j79nrENRWvOxx
         WC+XzxF3MhudltrbmetzchWZzqLijqqCiZteL7mTRbtNa/yXnjjcPOz+pJ45lohHmYUw
         JLbDAo2d4PNBFF6qfRTYgRH0E0f/Sa6zr8qtvLFD1ekcnRCcJEn+EwJsP4aQVN4vPwCz
         x0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0It5KbZc0A7Bzf8S3NgAg+pHebZzRFuPQgku3idwdPA=;
        b=CneIodlHyqar1oq7TkaNa97Du8i9C6VMWmYebhVzEevxABBP8tzx9XqMNAL4VR/UpZ
         SOKybvd9EPxMQCT3lKZn567wsDbCuexzWF3ETQxfDJSrgy5l3Oa6G2rS5/P+TKIAaD46
         bdYy5+QKpptqTdCOOUi6cUUGo5hGYOjybdeazAp3o42F51SmWTbYE+PmbiOwqNn2a3CX
         pI2xUMldciZ7s/hyUHvWJYr4/DjPQYJjNHd11cyPrYATCRTazNqNIET4WTRkwn108vsZ
         8cSceQi2aKzPxrrH+DtT5WhgDQecWveUdCFX8TrA4eU8ZY+fXaVnzYAS4mTbmGH61V1s
         y0ag==
X-Gm-Message-State: ANoB5pmXoQCoP0qP93dSAw2hZTjeE1Sa7ilBsrYWFP02ZiJOmX6YU9gA
        hCJ0sg+lD5w7KNiu+TnMNXvZs9093j8=
X-Google-Smtp-Source: AA0mqf4KmbfyS8ljyMDTJHdmc2qz+u0FgDzuHImU4C6+TSTCpaNvGj8IjqKEZtNqsTuuVKPeEXBcuQ==
X-Received: by 2002:a63:db13:0:b0:46f:8e43:e966 with SMTP id e19-20020a63db13000000b0046f8e43e966mr17936799pgg.206.1668561129485;
        Tue, 15 Nov 2022 17:12:09 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id w36-20020a17090a6ba700b0020adf65cebbsm210795pjj.8.2022.11.15.17.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 17:12:08 -0800 (PST)
Date:   Wed, 16 Nov 2022 09:12:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <Y3Q44X7+DxoVefD5@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=Mc=NVzo-R8Yg8SSos6rSaru_i4+m3qpXeZcKsHH6hcOAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc=NVzo-R8Yg8SSos6rSaru_i4+m3qpXeZcKsHH6hcOAg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 10:49:36PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > Here is another version of the rust bindings, based of the master branch.
> >
> > Pushed here:
> >
> > https://github.com/vireshk/libgpiod v9
> >
> > V8->V9:
> > - Merged the last patch (supporting Events) with the other patches.
> > - Events implementation is simplified and made efficient. nth() is also
> >   implemented for the iterator.
> > - Unnecessary comment removed from Cargo.toml files.
> > - Updated categories in libgpiod's Cargo.toml.
> > - Updated gpio_events example to show cloned events live past another
> >   read_edge_events().
> > - Implement AsRawFd for Chip.
> > - Other minor changes.
> >
> 
> Kent, Miguel: if you are ok with this version - can you add your review tags?
> 
> Bart

As mentioned elsewhere, I'm a bit iffy about the handling of non-UTF-8
names, which are treated as errors, but are valid in the C API.
But that is an extreme corner case that can be addressed later, so I have
no objection to this version being merged.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
