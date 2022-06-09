Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55881544DB3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 15:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239796AbiFINb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 09:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238801AbiFINb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 09:31:26 -0400
X-Greylist: delayed 607 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Jun 2022 06:31:22 PDT
Received: from patejl.cela.cz (241-168-195-217.cust.centrio.cz [217.195.168.241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7140FA8690
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 06:31:22 -0700 (PDT)
Received: from griffin (mem-185.47.222.164.jmnet.cz [185.47.222.164])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by patejl.cela.cz (Postfix) with ESMTPSA id 386A7A665;
        Thu,  9 Jun 2022 15:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=upir.cz; s=mail;
        t=1654780873; bh=tlV0TwvabMCDIgeG164b3Ba31Qh2U5kTmwI4rsYeFEQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=qiAsteDMSoRj2h0v3oTBU+yS9azYf+vHAetqFlA+XduJsJY/XhSoxobel4Cia39jo
         xqC38eNlx+vrO/AsyRxOegqtLhJes9HIyFY5qfLgInespCfAcQqk+WNPIPZ0sWfyof
         F19Hd7RazK5ECUAyCQ+iwnhKRmxR2baFsw63QbFA=
Date:   Thu, 9 Jun 2022 15:21:12 +0200
From:   Jiri Benc <jbenc@upir.cz>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <20220609152112.12fc6db4@griffin>
In-Reply-To: <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
References: <20220525140704.94983-1-brgl@bgdev.pl>
        <20220525140704.94983-4-brgl@bgdev.pl>
        <20220603124600.GA35695@sol>
        <20220604024131.GB13574@sol>
        <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
        <20220607015220.GA9430@sol>
        <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
        <20220609044922.GA11301@sol>
        <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0git415 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Virus-Scanned: clamav-milter 0.103.3 at patejl
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 9 Jun 2022 10:42:44 +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 9, 2022 at 6:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> > Agree that it would be easier to write a pythonic wrapper around the C
> > API in Python, so no problem with that.
> > However, the pythonic wrapper should the one named gpiod, as it is
> > intended to be the primary interface for Python.  Rename your existing
> > to gpiod_c or gpiod_core or something.
> 
> I don't agree. The module that wraps the C library should still be
> called gpiod and be the primary interface. The pythonic module would
> just offer helpers that would still use the gpiod data types for most
> part.

As a Python user, I'd much rather see the high level API being the
primary interface and being named 'gpiod'. The easier to use and more
Pythonic, the better. The low level library bindings and low level data
types are just an implementation detail for me when coding in Python.
If I wanted low level, I'd code everything directly in C.

Just my two cents. Thanks for the good work in either case.

 Jiri
