Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087D156149E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 10:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiF3ISA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 04:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbiF3IRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 04:17:01 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1241842EC4
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 01:14:58 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n10so16408644plp.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=u7pI63YOJWzUeiWCqRCJryXXVxiQe8NQHWg4MUznqYY=;
        b=lpo3LgPVwIW6C3cr9Xl4U535ehecRNAvSXnGsdfBZOCwfDgKi62I1bqyDORCghPe9K
         gJ+cedsOgqt7tc+O4+iAW3AHBgPJ774JfWFBRXl2R1f0rYz1FTSYQBeEmF4Ylad85lY8
         OaY4XqELypBta6LPGk9VWkBxEIdbtTgEAK10hwtV8FQYpbfElXI04uFsUgalB0bmFw+T
         1UXd541veruGxZ3kINi46VTOCgA3PDWrKB7ucZmmUx3R14juRUuaiVAkOdmJ2q5ME01a
         Ey4e6eko73w2wWaYDcM/99Bhq+l+1A5sZLS4yibqfNS/XQHeUDB1WJypkWsqgD9YWttd
         7oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=u7pI63YOJWzUeiWCqRCJryXXVxiQe8NQHWg4MUznqYY=;
        b=EtSlrBxEcOXjeExnWSoJskYSBpzcfgCV32X/+42ULGtNGKp449L6MEbZpBunXrYwx9
         Y8nHBztgC7Lo6HOtqxBWAj4mq6s2k077/ew02F3KFGDefwPHVPF45RVI6vXQtMcLn6xb
         omupj3NRxjIvufUQxlaRY1BICU7okPzLZWebwdq+9lAT8Pv/XEJxeKdHhG/PeFJn03Gl
         Y6rmv3coO8APm7yt1BtNhu4FiY/2/R3ne6Up+R8rwL1IDqwYJRgmWO8vekvvw8CxkcCC
         HQXP5yt1EvHE0m6ZYDCmguCBvhCm3cj20kXF7QjmGcKbhKH8k2D0xQihAyb2vabjoDAG
         Jtrw==
X-Gm-Message-State: AJIora/wKLp0XkYobyUrTXzh7GY4VRwUvz/zDP6Fej4vkt7prTYTE6VL
        isfJnqYZNvZ+zQnbMkm9G38=
X-Google-Smtp-Source: AGRyM1sQTtbjuZHvhuamlxdBwy230Su8Du1fbS5we9MGRiOx/nMYkPJRT26CnYv8HxgMw/UegzW6FQ==
X-Received: by 2002:a17:902:b789:b0:16a:4a81:bd67 with SMTP id e9-20020a170902b78900b0016a4a81bd67mr13448312pls.111.1656576897508;
        Thu, 30 Jun 2022 01:14:57 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id g207-20020a6252d8000000b0050dc762817esm12914533pfb.88.2022.06.30.01.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:14:56 -0700 (PDT)
Date:   Thu, 30 Jun 2022 16:14:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220630081450.GB23652@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > This is the implementation of the new python API for libgpiod v2.
> > >
> >
> > [snip]
> >
> > > +     }
> > > +
> > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > +     Py_DECREF(args);
> > > +     Py_DECREF(method);
> > > +     if (!Py_IsNone(res)) {
> > > +             Py_DECREF(res);
> > > +             return NULL;
> > > +     }
> > > +
> >
> > Building against python 3.9 (the min required by configure.ac) gives:
> >
> > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> >   276 |  if (!Py_IsNone(res)) {
> >       |       ^~~~~~~~~
> >       |       Py_None
> >
> >
> > Py_IsNone didn't get added to the Stable ABI until 3.10.
> >
> > Cheers,
> > Kent.
> 
> It seems like most distros still ship python 3.9, I don't want to make
> 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> Are there any more build issues?
> 

No, that was the only one.

Cheers,
Kent.
