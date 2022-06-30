Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2390156154A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 10:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiF3IjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 04:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbiF3IjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 04:39:00 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D462A427FC
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 01:38:57 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id n12so17550735pfq.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QsBlQsCifNUKyvdZ8rupkDTd9D0hTIQn47a4Zb547qc=;
        b=V/HZzUEwPPAL4qi+76AbadW6qB+t48z9xmgGuL5H/jl4Vxj/Sq1IpcmlOL510IAn0p
         2pIa58uutuUfp3K5225DNnHcGXWts+B06zXt4ztIDQY64jYHckIoTGSmkgweDhF2ZrLI
         iNGpvhYlcK/ftRhsO72D2aUjUpk36EKdCJOqK+5t4LWOtgkehjNVqRxxFzMloqagHj+u
         YxKLpLGKC/uclTBnCGHSUzLRtGDzIT0SCzV7mbUsDALx34G40yy/iBnWXN3ex8lttBsO
         T2113DDV5M6wRJ2WHF0mxidjCHM3Wcsr3ea1MCNscgtuxDm1r5uqLKN4f+EUNgPBRQXT
         sHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QsBlQsCifNUKyvdZ8rupkDTd9D0hTIQn47a4Zb547qc=;
        b=gXbTbU5JU5Jgg9hNlpf2YjrER0K/RD6OeAEdhCAPyK/NySAg7toE4Tnoq9LUrWv4q5
         ZNHjWzzRPCCsOQLqXR3YVu2kU/cScaBqoge7d8y8D/Vs0KH30QNb0wLKC0uoXU6Srv9s
         Ws/16zLOR8KSM+HIuLqRODnRdK+ijvZjLsAuaicj06vOk+KX8pRJFFLeqQeIj+M6K3l/
         4t5Hbq0+aHh073sPXwNIb0ibBSqBg0x0DBu4Iw2VXgJfGYe8kCd2qGkKJz/7qUOs0jMe
         qM1Rbu0AbZhUr+vkeNm/Htg//BKXz52KINfrK118jxVSz7EkaQT7logFwwv6PTPJ4aZv
         xrwg==
X-Gm-Message-State: AJIora83gBBBv5SkIcZtdszBjCxCu2Pd8u6XkSHYENxtyne/6+0hz8gM
        W9MwULOUKcO35ENqUWJxd+S0PIboPao=
X-Google-Smtp-Source: AGRyM1t6fk7Nmlkegf04sKqrSuI6uOCUkHyCdDdqmobH3G0S89xNcJ1uBCwMu7hdqGjHH7TXV6jr6g==
X-Received: by 2002:a05:6a00:21c7:b0:51c:4b2d:f82f with SMTP id t7-20020a056a0021c700b0051c4b2df82fmr14642700pfj.29.1656578337342;
        Thu, 30 Jun 2022 01:38:57 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b00168ba5ac8adsm12847035plk.163.2022.06.30.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:38:56 -0700 (PDT)
Date:   Thu, 30 Jun 2022 16:38:51 +0800
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
Message-ID: <20220630083851.GA24642@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220630022522.GA17221@sol>
 <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630081450.GB23652@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 30, 2022 at 04:14:50PM +0800, Kent Gibson wrote:
> On Thu, Jun 30, 2022 at 08:54:24AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jun 30, 2022 at 4:25 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Tue, Jun 28, 2022 at 10:42:26AM +0200, Bartosz Golaszewski wrote:
> > > > This is the implementation of the new python API for libgpiod v2.
> > > >
> > >
> > > [snip]
> > >
> > > > +     }
> > > > +
> > > > +     res = PyObject_Call(method, args, line_cfg_kwargs);
> > > > +     Py_DECREF(args);
> > > > +     Py_DECREF(method);
> > > > +     if (!Py_IsNone(res)) {
> > > > +             Py_DECREF(res);
> > > > +             return NULL;
> > > > +     }
> > > > +
> > >
> > > Building against python 3.9 (the min required by configure.ac) gives:
> > >
> > > module.c:276:7: warning: implicit declaration of function ‘Py_IsNone’; did you mean ‘Py_None’? [-Wimplicit-function-declaration]
> > >   276 |  if (!Py_IsNone(res)) {
> > >       |       ^~~~~~~~~
> > >       |       Py_None
> > >
> > >
> > > Py_IsNone didn't get added to the Stable ABI until 3.10.
> > >
> > > Cheers,
> > > Kent.
> > 
> > It seems like most distros still ship python 3.9, I don't want to make
> > 3.10 the requirement. This can be replaced by `if (res != Py_None)`.
> > Are there any more build issues?
> > 
> 
> No, that was the only one.
> 

But I am seeing a test failure:

$ sudo bindings/python/tests/gpiod_py_test.py
.............................................................................F................................
======================================================================
FAIL: test_module_line_request_edge_detection (cases.tests_line_request.ModuleLineRequestWorks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/dev/libgpiod/bindings/python/tests/cases/tests_line_request.py", line 71, in test_module_line_request_edge_detection
    self.assertTrue(req.wait_edge_event())
AssertionError: False is not true

----------------------------------------------------------------------
Ran 110 tests in 2.652s

FAILED (failures=1)

Cheers,
Kent.
