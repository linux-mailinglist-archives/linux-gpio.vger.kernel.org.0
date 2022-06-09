Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DA454518A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 18:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiFIQGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 12:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbiFIQGX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 12:06:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22FC1B1CC4
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 09:06:22 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v25so31839966eda.6
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bbuoibGqpUzgIv8kzMZ72alXsr0IfG8c0YGuJCyKV1k=;
        b=eM8BuGOB92Lhe5957W7wSWvgi/TvSREPfm4noIASBPJL5W/RUfHCLxbbEcGhdDOgSC
         oBAym6VV4tO+GTg4KI/6BWMuTD+I+coDyTmJ90FOBAxV8JBWsiVjon2vAKnXcd4cQ/QN
         OOMDFwWk2oUJl05U4iutfTbWecNZhxJaKPZkz1wFxtUh3sJQwXM+4nFjV0Z2+nlXidB5
         yq6rquhl+B9LSyg3LwsyNyMije0/MA5E1Dviw8bQjBRuRGTQsQmDJ2QR38f7MQAEdh0H
         jDPibi5UFT/grIQu4YHxUPeUpwyIMknohU6gaFti910IM2nUtgNjaXKagqslGJTKsHQa
         gG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbuoibGqpUzgIv8kzMZ72alXsr0IfG8c0YGuJCyKV1k=;
        b=NBDp3UkARirt5iDTnjKEF0JIh2NDyUJchY6m9PfpTnuQ18IdhjFUciVqvYIOvasdgn
         HASVraIpmDONUElkREsFT2iJJck3dGHW+RsAh0ECB1eaVZnMYFGFpAGv3rWJpVmTghM3
         aq2KApz784qOcf+xHQpulIEYV0ChbnmNgiE8pQPou9C69duN/pQg8Q+AyS/bciXitqVi
         fqD3IH2pTuA5cT2eQXIsAQ51cSML9NjPsQS9GgET3lESJL2xsSs9U/nOpE4AKKAUofEV
         Z+dJCxeZ8w7LAn3C0uzjgBazsnEft6WG1D6aRIZZ4RFv5fbiqAi5OYZ+MnUjXCpCD47X
         Tvfg==
X-Gm-Message-State: AOAM532zCRP/3hCHmYxicWz8jHgXWfUVZ9WqBlbG3SQZWMzqq6sZRzXC
        hD8HQjAkbaEQ4h0eYFr4KBB1HTAW4kWtXYmZZDK8nw==
X-Google-Smtp-Source: ABdhPJzLH4aepDnkdX7I7UIFuLMYgl5PqXFBNuGJgE2hITzP8NVKmO4Nk9XnJuhTRgLl3zqGcsyS32K0r+n7HnbVopY=
X-Received: by 2002:a05:6402:5008:b0:42d:c421:48c8 with SMTP id
 p8-20020a056402500800b0042dc42148c8mr46482161eda.422.1654790775393; Thu, 09
 Jun 2022 09:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220525140704.94983-1-brgl@bgdev.pl> <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol> <20220604024131.GB13574@sol> <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol> <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
 <20220609044922.GA11301@sol> <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
 <20220609152112.12fc6db4@griffin>
In-Reply-To: <20220609152112.12fc6db4@griffin>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Jun 2022 18:06:04 +0200
Message-ID: <CAMRc=Mfgov0S-dZ7Ut2oj4A8=xE7d-4iX=8Q+Kv4Tb==JviMjw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2 API
To:     Jiri Benc <jbenc@upir.cz>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 9, 2022 at 3:21 PM Jiri Benc <jbenc@upir.cz> wrote:
>
> On Thu, 9 Jun 2022 10:42:44 +0200, Bartosz Golaszewski wrote:
> > On Thu, Jun 9, 2022 at 6:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > Agree that it would be easier to write a pythonic wrapper around the C
> > > API in Python, so no problem with that.
> > > However, the pythonic wrapper should the one named gpiod, as it is
> > > intended to be the primary interface for Python.  Rename your existing
> > > to gpiod_c or gpiod_core or something.
> >
> > I don't agree. The module that wraps the C library should still be
> > called gpiod and be the primary interface. The pythonic module would
> > just offer helpers that would still use the gpiod data types for most
> > part.
>
> As a Python user, I'd much rather see the high level API being the
> primary interface and being named 'gpiod'. The easier to use and more
> Pythonic, the better. The low level library bindings and low level data
> types are just an implementation detail for me when coding in Python.
> If I wanted low level, I'd code everything directly in C.
>

But Kent is not talking about a whole new "pythonic" layer on top of
the code that is the subject of this series. The bindings are already
quite pythonic in that you can get most stuff done with a "logical"
one-liner. The gpiod module doesn't map C API 1:1, it already
simplifies a bunch of interfaces. Kent's idea IIUC is about providing
a set of helpers that would produce the gpiod objects in shorter code
by hiding the details of intermediate objects being created.

Re the event buffer: yeah, I think in python (unlike C++ or future
Rust bindings) it makes sense to hide it within the request as we
can't profit from implicitly not copying the event objects.

If anyone wants to create an even simpler, complete interface for
gpiod, then it's a task for a whole new project. Think: pydbus built
on top of GLib dbus bindings in python, built on top of glib's dbus
implementation.

Bart
