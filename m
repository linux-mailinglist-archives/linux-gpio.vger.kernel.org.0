Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A828A5E80B9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 19:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbiIWRa6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 13:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiIWRa4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 13:30:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517DC12BD98
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 10:30:55 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id nb11so2148422ejc.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o6vYmSR7kgKFyqKB56wM6eb40dCEJPbKml0D5Bobw+A=;
        b=eIdRYv614AvjV9gq8P5S08gCgDhnETd5+wX7nKftqb2oQCGr7DIbtZ1aioBXV+FP8v
         2EL2DSwqjv+RElSK+yx646E5O5YZ7YaxppAJcJCJaabTxAgXs228xXpXspzmDpdmdlAT
         v9robrVJwBPuQLJpyHgnxFGrganaMAJfeqNoT2TTrRKVQc/peDQI4+1zdzhQbcKDEkzU
         Ut0erzhZWEa0PVS+cDWxK7GXy/Kt4CRaIGCDBO017+U5inpuPEnbrMJWOpCyohXcgkbU
         as4mFnaFHjwwXVkDK6/cdQzSuYEdVIrhN6Xt4XSYKp/vO+Myzn/7wHNx5ktgpa08pUzc
         E7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o6vYmSR7kgKFyqKB56wM6eb40dCEJPbKml0D5Bobw+A=;
        b=hZZaCrFjQZ9l+BU/p4uiuSy9cMRes+m1EBo91YUwP0tttOaaYb5vUGWB0LRF0YQghe
         +YW3Dx6qezVulbWHp4Lj12J8CAyjMHVK9bnvsLf5bw/wOSpj8P0gDOeICIBpH6FCd6zz
         Q/HXuBv3vbP8xP8dmUsCGrMILXkNlkdQLa5XUYMKZ17GmQEnzCcsyz9li2hsAE/g38V7
         V3eKb/YiyXa2U0dDGcZdSt5hoWwaANtEUWDxTWH5f1t1Q6STu3VWVnaKgBvxhqJPAY0T
         6IP5oAlFwmNOP2YPfh97kA72HZiq9vzHwH1kM5F8oTNl/xdRdWex5k2xxOIalD0Y5yq4
         AebA==
X-Gm-Message-State: ACrzQf1rIQvLIiU/S97ds+MsGQ14YAnuU5+yExo2setAnBMp34u2jDH6
        rGD4h8FSSwTEmK7wZKGFYu3VsD1yaoDHV32fhh+74peRvoU=
X-Google-Smtp-Source: AMsMyM4GYRd3YzKOZe5ROKLx+Hz0cGsdMzr0veMEMKeuWkZ/xte6Snn6e0IIx/DkSqwy3TSInkGgPW7XiPHquOJzehQ=
X-Received: by 2002:a17:907:3da9:b0:77b:9672:3f7f with SMTP id
 he41-20020a1709073da900b0077b96723f7fmr8131859ejc.636.1663954253854; Fri, 23
 Sep 2022 10:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220923081223.25851-1-brgl@bgdev.pl> <Yy2K0PaK2e3tMs9l@smile.fi.intel.com>
In-Reply-To: <Yy2K0PaK2e3tMs9l@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Sep 2022 19:30:43 +0200
Message-ID: <CAMRc=McphGarenwa+C4g+o4uTfjMHU4qfb1mpbow0OCppg5p2g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] treewide: add support for hardware timestamp engine
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 23, 2022 at 12:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 23, 2022 at 10:12:23AM +0200, Bartosz Golaszewski wrote:
> > Since v5.19 the linux GPIO uAPI exposes a new request flag for making
> > the hardware timestamp engine be the source of edge event timestamps.
> > Add support for it to libgpiod.
>
> ...
>
> >       /**
> >        * @brief Read the current event clock setting used for edge event
> >        *        timestamps.
> > -      * @return Returns MONOTONIC or REALTIME.
> > +      * @return Returns MONOTONIC, REALTIME or HTE.
>
> Is it possible to refer to these with % so doxygen (or whatever you are using)
> make the links out of them?
>

Yeah I couldn't get that to work with enums. If I can make it work,
then I'll do a sweeping fix across the entire tree.

> Because HTE is way too cryptic TLA (the same concern was also during submission
> of that framework into the Linux kernel).
>
> >        */
>
> ...
>
> >       { line::clock::MONOTONIC,       "MONOTONIC" },
> > -     { line::clock::REALTIME,        "REALTIME" }
> > +     { line::clock::REALTIME,        "REALTIME" },
> > +     { line::clock::HTE,             "HTE" }
>
> Similar here and hey, have you got the idea of the trailing comma (or poor C++
> forbids that?)?
>

I just made it consistent with the rest of the code. I will fix it
treewide too, already have that on my TODO.

Bart
