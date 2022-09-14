Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8865B87A9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiINL6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 07:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiINL6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 07:58:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451282F03E
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 04:58:21 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dv25so34080736ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=by8v24Y5KEA2aF/BJO8+araHAeMCS2MQ24Po14UK234=;
        b=CenPwWaG2r/Ri7/nbLbMXiPnX7NpubenN3vVteOZBn/JHIUTgnAyBnp8uuuB10XD06
         7MBJB7PhzQXDeLmGO0UDSB35g6djXq28wX/mPSoMxXUROfca70kpZw416kLpeqHai/7t
         YVMrfTnltLVC//axTygVFWRViSAaDsGKa3ef1+8bKj8b8nyBlUFU+CUznMXKdTu1Jgpu
         OsnzJgf8ZbeOyHUxBBmfHNkfJ0XTV3mKSG4WLWriySSMTObGNYWEvTFwbmtDsEe+vjDv
         zMp6QeKmPARMWGv14Jdk01gjTDfd0xkjlzR+Pnd7uCXlRMKbPCMiSRFRaH+9arG1IJfK
         sK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=by8v24Y5KEA2aF/BJO8+araHAeMCS2MQ24Po14UK234=;
        b=wiSe9+RwPJUT1B07motTbaGVeDZaeeXnrU+Nno8gNwDJqm8czeEIRNkwb6hWPcqeUr
         5CYNjYXRPM/81SUJoOey+dNPOs2PLr5uqmfxp9Gg8yTekgQGQPgvDhZ8cO1rtAR3B/oZ
         tyWqPEe3rRzpfLcnTO5/oSDwjceSVQBYHC6NR6XipdyaGRr47JcPndC47EIDoF9125j4
         mULeIaZuq+gIlbOpiPtFIlx5qZmMY9/rD97456RT876quHf4H1IzsZ3mog9+0hYwLUxF
         zJlD+Hsfe3BGUBBuFDF/QvV5iKO+DzzHVBp4Yu79r8QxaxeVAR3iIrEu4bVt4bp7sljR
         BMJw==
X-Gm-Message-State: ACgBeo3RmofVX4Hze1nY93la0v06TI/OEbvBQtHnNSYOUmHomABZ0wh4
        0RIujT8+hSiGSyEUO0hLbHsjEKD+tmoNaBHH1d6nOg==
X-Google-Smtp-Source: AA6agR6GAVPRkD9KLX7bVStEycSzAKlZ3/lBzXIAhj7tU3GA8Tsda+OpU4JBTc3FTTr3qm5KFB0ZbsGc3MxgvDxEsTs=
X-Received: by 2002:a17:907:9816:b0:741:89cc:af19 with SMTP id
 ji22-20020a170907981600b0074189ccaf19mr24678842ejc.492.1663156699829; Wed, 14
 Sep 2022 04:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220913161407.63472-1-brgl@bgdev.pl> <YyGpQedIKMRg8IVA@smile.fi.intel.com>
In-Reply-To: <YyGpQedIKMRg8IVA@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Sep 2022 13:58:09 +0200
Message-ID: <CAMRc=MfoC8pLwr5tsBAw7KKzFFK3GC==0NO7=OFyNjf1i5WRVA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2] treewide: rework line configuration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 14, 2022 at 12:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 13, 2022 at 06:14:07PM +0200, Bartosz Golaszewski wrote:
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
>
> It's a huge change and my knowledge of C++ is a bare minimum from dozen of
> years ago, can you point out to the file with an example how this APIs (which
> are suggested by a new code) look like for developer in practice? Some test
> cases or simple example? This can help to understand the prettiness of the
> API.
>

Yeah I know it's big but we simply need to get all this code in somehow.

You can apply this patch and go to bindings/cxx/examples and
bindings/cxx/tests for code samples.

Bart
