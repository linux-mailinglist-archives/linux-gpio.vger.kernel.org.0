Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2045E7085
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 02:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiIWALP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 20:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiIWALO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 20:11:14 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C431F8C08
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 17:11:13 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c198so10794939pfc.13
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 17:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=e7uFesgivjrmJioyNN+4bAOrtwCeECP4eeDTtpj5OPU=;
        b=XxZ06q65PnjCLWASyqnRR6qR0hysA0QiYqqNzMT1G2v+k7fnYxMBr/j5DRDx4uYTEr
         98ffObqYNYmoD/wxQy+FOI0hh60w4/6nTiSYdgr+GmtKDOtKyrnC152fAlZPAjgES3rA
         oxd4R7W4LNVY8GBfZELdf0vMgxyDPg90wzAP+nUNDbsrknzlD3YlYVNsDbI0lsMM8Ze9
         B5ZgvnJN1oGyWKWys+6lEAG6iRlb1Mp+rwv//gdcar/+jIzmheH7CxA0DxRo6SF4a2kt
         YVYr5NBiuclcWkWuFIBVw/Zp/D+raXkcE685ctzOTaaGVcCTL5yjBcgEOaC73uBOnD1H
         s1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=e7uFesgivjrmJioyNN+4bAOrtwCeECP4eeDTtpj5OPU=;
        b=NNBNydnnos1gjr+OxOH6VUH6xFHVxo5NIMcy9oR4wQcsKrIR6txkwR9tzt3eGfMBzY
         oQyuIZdB/sFSpRP1fLhuBP9vyw3czXnhWawQO3PgN8DQRubhwuHCaFGCmNqbW4DEECX1
         RJMpC2rvFkmocW5THVqoWIvMTRnlIAZKVHxhEtNS4lnuE11EH94kru+Hx9zM7lTxXpu1
         wajCV560ATshA3i06fHhmfSuIFdyNXn++2lceYP/mbAVsQbrChcNGi/WntHJsbxdqO3G
         vFvv60I2cuNgD3Do6H3tzi0nISPf7puDxQi+9/3OxpbyjEFr2dLVSY9dPGI5i1eFj0Ek
         yxlw==
X-Gm-Message-State: ACrzQf2x2yMjf0ymvnEXbx2NG3sJBeNjqKcWbfwkgzgW9CQS1anqfsOA
        Eis0MYsOTlaM+q/z7MuYYodljYMSKL8=
X-Google-Smtp-Source: AMsMyM7C3xVmXdNpKd1qNQkppeJuRgfnm6xnxW/8FUxfbE4tk11zBmnEqnb7+VrST17fhCpTffI7DA==
X-Received: by 2002:a63:2a02:0:b0:42b:3b16:5759 with SMTP id q2-20020a632a02000000b0042b3b165759mr5181362pgq.564.1663891872948;
        Thu, 22 Sep 2022 17:11:12 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b00178143a728esm4710910pla.275.2022.09.22.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:11:12 -0700 (PDT)
Date:   Fri, 23 Sep 2022 08:11:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2] treewide: rework line configuration
Message-ID: <Yyz5mpl/6h6UJC6N@sol>
References: <20220913161407.63472-1-brgl@bgdev.pl>
 <CAMRc=Mfj74JKgQNcYBySkpU_CXsA1xcPAEYa4YaKdH6TTvOktQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfj74JKgQNcYBySkpU_CXsA1xcPAEYa4YaKdH6TTvOktQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 22, 2022 at 02:25:43PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 13, 2022 at 6:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > This tries to get rid of the concept of defaults and overrides for line
> > properties from the library (or rather hide them from the users). While
> > this makes the C API a bit more complex, it allows for a more elegant
> > high-level interface.
> >
> > This patch is pretty big but I'll just give an overview here. I don't
> > expect a detailed review of every line.
> >
> > Low-level data structure model (as seen in the C API):
> >
> > We're adding a new structure - line_settings. It's a basic data class
> > that stores a set of line properties. The line_config object is simplified
> > and becomes a storage for the mappings between offsets and line_settings.
> >
> > We no longer require the user to store the offsets array in the
> > request_config. The offsets to request are simply those for which the
> > user explicitly added settings to the line_config. Subsequently, the
> > request_config structure becomes optional for the request.
> >
> > In C++ bindings this allows us to implement an elegant interface with
> > rust-like chained mutators. To that end, we're also introducing a new
> > intermediate class called request_builder that's returned by the chip's
> > prepare_request() method which exposes routines for storing the line
> > and request configs for the request we're making. For examples of
> > usage - see C++ tests and samples.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> 
> I merged this into next/libgpiod-2.0. Same for the gpiosim rework for
> C++. I want to progress on the python bindings front, get that into
> master and apply the tools changes and get those Rust bindings in too.
> 
> If there are some issues, we can rework them later when doing a new
> API review before tagging v2.0-rc1.
> 

I have my tool updates rebased to that (in the twools_v3 branch in my
github repo - in case I get hit by a bus), but can you update to the
latest gpio.h and add the corresponding GPIOD_LINE_EVENT_CLOCK_HTE so we
can support HTE?

Cheers,
Kent.

