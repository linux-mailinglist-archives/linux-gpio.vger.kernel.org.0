Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665647CC1C0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 13:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbjJQL3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 07:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQL3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 07:29:50 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E7AEA
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:29:48 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7b6cd2afaf2so117116241.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697542187; x=1698146987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhouxqVs4PawW5bZNt7ttBxRga4PcHJqlSCjWmtS7Js=;
        b=GsMB6KFdU4TjJuYVevi3vIpiRjJWDEiircT6z0l4yeXsLLe4PPMvio84tTm8reFPvp
         WJSi7UlPpn0LMvV3oHi6xqTzccsR2RFDi2iCl3BKIXRhCy6+pqtS5DMutbD/Tii12+Xw
         TPCGsZpp3BcP9WBs9IzZUX1H1YHTmTK///twVQdIjHls0pd5MoOy8mB8Y2KnJ5TN6wbN
         g1YcYZBLYeiDk9WVo2evnRS41mtsgaJ0T63gLQD0/RGEvDH/YUTLCY/044yBOdOPN/a/
         xcd1L8f7CWeIWxRgq8njsRqOwPWDCTnGrYHl6Y3d4pjxSBFVwFhagyS7t3TDIRu1XEF/
         MP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697542187; x=1698146987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhouxqVs4PawW5bZNt7ttBxRga4PcHJqlSCjWmtS7Js=;
        b=uxd0xMDhcX3u2wo6HOqFEor1s5uOshZ66Zx7SQzKw6mZcrcZDvqg2KSuTf942uTFKs
         o/vZwigSqCpJpKIG+deH9tDBHdGogM9NNlaE6J+A0F9cIqHdCk2hIQGWvEYFPJ70w0FO
         ExLj/YZiMqW23aDfkATtMyUx/rfJaP8tY/g/kv+Ysoa8M5VzbKDBLKLLVaipA7+J2na5
         QLOKMObZ99mbEk8U+YPu2W81FKK4L5y723IIjZZCBoJDMHeF3/9ioV9dryYFznd85Pwd
         5kof3g7oTA4MRa5C1b+CUFBshQkd20IQPDKC21ozlhfUleL5aNvWjafHOBP3FBBSNu+8
         c5sw==
X-Gm-Message-State: AOJu0YyyaoxjqjZMXx8ikw97IIQQTEnuRdyb3SpJsiz/HpXYZWyb1Ofe
        WWpQrvO/ALEakgYjR84Sl9IJPMmA4DunREGWxh5T0A==
X-Google-Smtp-Source: AGHT+IGc/9pCUe5xs+kZ5Z37ysr/WaJRRcuanVXSlekg7Ir1Cztu2G3WyaxtlTNg9r3zM/z2JRpDuN8c0rNuzQ7vAbE=
X-Received: by 2002:a67:c01b:0:b0:457:d3fd:caaa with SMTP id
 v27-20020a67c01b000000b00457d3fdcaaamr2154175vsi.8.1697542187716; Tue, 17 Oct
 2023 04:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
 <CAMRc=Mfwx5-sa231TP_di20uMUysfwUGXL-EN5mDALkqRj4AQQ@mail.gmail.com> <CA+kSVo_EzO1RBa7gvyUBcggNtASf3RCsDd6W2aB8=4+Qw=vVLw@mail.gmail.com>
In-Reply-To: <CA+kSVo_EzO1RBa7gvyUBcggNtASf3RCsDd6W2aB8=4+Qw=vVLw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 13:29:36 +0200
Message-ID: <CAMRc=Me+xZ2zNM8NB5ZEYYA5j11o4ymFMOuG38JBqSVUdts6Aw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 1:15=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> On Tue, 17 Oct 2023 at 11:09, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com=
> wrote:
> > >
> > > Optionally vendor libgpiod source into sdist so that the
> > > Python module can be built from source, even with a missing
> > > or mismatched system libgpiod.
> > >
> > > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> > > so that the sdist package can optionally be built and
> > > linked against a compatible system libgpiod.
> > >
> > > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> > >
> > > Update build to add an additional sdist target for upload
> > > to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> > > triggers a vendored package build. "GPIOD_VERSION_STR" is
> > > saved to "gpiod-version-str.txt" and included in the sdist
> > > for standalone builds.
> > >
> > > "GPIOD_VERSION_STR" must be specified in order to produce
> > > a standalone buildable sdist package, this requirement
> > > implicitly preserves the old build behaviour.
> > >
> > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > ---
> >
> > Alright, this looks and works well. Before I merge it: the package
> > still shows up in 'pip freeze' as libgpiod. Now that we control the
> > name 'gpiod' on pypi, should we change it to 'gpiod' instead?
>
> Yes, it's conventional to have the module and package name match
> for single module packages.
>
> > Once I apply the patch - how would we go about making a new proper
> > release?
>
> The "libgpiod-2.0.1.tar.gz" (or "gpiod-2.0.1.tar.gz" if we change it) sho=
uld
> be uploaded to pypi via the utility "twine" (pip install twine). You can =
upload
> versions to testpypi by specifying "--repository testpypi" which, combine=
d
> with a "-postN" version suffix, can help work through bugs in packaging o=
r
> README formatting.
>
> You can also run "twine check dist/*" to precheck for packaging issues.

Sure, this is how I uploaded the existing releases. I was thinking
more about versioning. We haven't added new interfaces to the code so
I think the version should be set to v2.0.2 as technically this is a
bug-fix release + build improvements.

>
> I'm not sure if we should yank prior releases of the Python gpiod but
> some note in the README paying lip service to the change from unofficial
> Python to official C-bindings would be wise.
>

You mean out of the "gpiod" repo, not "libgpiod"? Because I assume
this is where we'll upload the new release.

> > Do you also want to add a better homepage to setup.py so that
> > users of pypi don't bounce off the nonexistent documentation?
>
> Yes, we need a basic introduction and a couple of succinct examples.
>
> I have some half done edits to the README somewhere locally which I
> was holding back until after we got the packaging working and until I
> could ask: What format would you prefer for the README?
>

Whatever works best or is the standard for pypi. You are the expert. :)

Bart

> >
> > Bart
