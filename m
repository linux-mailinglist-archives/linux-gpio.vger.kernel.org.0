Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A2D7CC411
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 15:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343819AbjJQNLX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 09:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343826AbjJQNLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 09:11:22 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C9610F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 06:11:19 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso1263462fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697548278; x=1698153078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrofJDJp9BBE30HFHH8v2Jh0wNJhtczp73EEFi2OPfE=;
        b=Pjg4gXyfjzA2JExCcLLbRJnPNlwsmkm6zhUJwGqTEgH5mFm2YVTRKjwwI+mXoMSGXk
         WQJcoa+T0IhZfwsdI4EwG9GZ9+4ytyJEASS9d2brsRtkBCwALutabs4USEgOkDOv/tui
         TjKj0IWNrSRsRyK2oU67NogstWWfobcdmNuvFIuK/WpxRvmjVenJ8Lg6bwbdIXG8MnGQ
         9Js6xR0p66iAzEsEvaeFtq/lrfA3JwQfMhRDEiGLig8hQSW0fm8frKuO9YNHnbxtA7+4
         Hixi6EnZfq1LtCwCdOGZhnIGgW6KWzleZyn0YVsQvVUzn/dBRe/HiPqmriadVbWsaMIN
         4hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548278; x=1698153078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrofJDJp9BBE30HFHH8v2Jh0wNJhtczp73EEFi2OPfE=;
        b=iBHTU+gP0bFjRYKYLMvdPNPOH/69+X4GMdxTBpTswHVanXsxdb+piZDnGOSZdHfbRX
         mMz9BJIqteSyr/It/oe0eXUbsrp4JOjoU5NXkjRCsK63U4ih1WuHgsIe1KxB9KoIcYuB
         PfvUxlqsCbnRCoZ0I8rscFtz9tci6+mXPMxQAG25EL9sHfs7rHxeoIwRhoVw9YL7v821
         K185G4KvbQqVraiWDroOnXp8HEM+mcN+W+pm3b9vUMwxis1gGC8r9FQsO6TWM/7rTK4D
         mmoSrDw/6CqGmki+fKabYBpjz+C9lHVtHyf7xTUPncxOReLDFxj32QNE+dtJDvpjPRFS
         6POQ==
X-Gm-Message-State: AOJu0YxJBQvD+SqtiBUgtZ4W1yVdo5dKVlKBdq3Z0vFfhcapH2MOSwM3
        1zhSnkutgLPXpnxwwziVq/vmJvUsjTWbnNAqMl9K+g==
X-Google-Smtp-Source: AGHT+IE6uXg070r6/Fs667g22F6XzTa2KwsBXhlDrGoST2UWu9CkIyMjW414ImUBYwBwd35/8zaoUn77lr6iEV9vrzw=
X-Received: by 2002:a05:6870:104f:b0:1e9:8a2c:278e with SMTP id
 15-20020a056870104f00b001e98a2c278emr2278807oaj.54.1697548278194; Tue, 17 Oct
 2023 06:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
 <CAMRc=Mfwx5-sa231TP_di20uMUysfwUGXL-EN5mDALkqRj4AQQ@mail.gmail.com>
 <CA+kSVo_EzO1RBa7gvyUBcggNtASf3RCsDd6W2aB8=4+Qw=vVLw@mail.gmail.com> <CAMRc=Me+xZ2zNM8NB5ZEYYA5j11o4ymFMOuG38JBqSVUdts6Aw@mail.gmail.com>
In-Reply-To: <CAMRc=Me+xZ2zNM8NB5ZEYYA5j11o4ymFMOuG38JBqSVUdts6Aw@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 17 Oct 2023 14:11:07 +0100
Message-ID: <CA+kSVo_B-OOoQye=rHXw+wnMMH8bTh+JS7WfzKUZ97jMU2k7HA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Oct 2023 at 12:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Oct 17, 2023 at 1:15=E2=80=AFPM Phil Howard <phil@gadgetoid.com> =
wrote:
> >
> > On Tue, 17 Oct 2023 at 11:09, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > >
> > > On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.c=
om> wrote:
> > > >
> > > > Optionally vendor libgpiod source into sdist so that the
> > > > Python module can be built from source, even with a missing
> > > > or mismatched system libgpiod.
> > > >
> > > > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> > > > so that the sdist package can optionally be built and
> > > > linked against a compatible system libgpiod.
> > > >
> > > > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> > > >
> > > > Update build to add an additional sdist target for upload
> > > > to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> > > > triggers a vendored package build. "GPIOD_VERSION_STR" is
> > > > saved to "gpiod-version-str.txt" and included in the sdist
> > > > for standalone builds.
> > > >
> > > > "GPIOD_VERSION_STR" must be specified in order to produce
> > > > a standalone buildable sdist package, this requirement
> > > > implicitly preserves the old build behaviour.
> > > >
> > > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > > ---
> > >
> > > Alright, this looks and works well. Before I merge it: the package
> > > still shows up in 'pip freeze' as libgpiod. Now that we control the
> > > name 'gpiod' on pypi, should we change it to 'gpiod' instead?
> >
> > Yes, it's conventional to have the module and package name match
> > for single module packages.
> >
> > > Once I apply the patch - how would we go about making a new proper
> > > release?
> >
> > The "libgpiod-2.0.1.tar.gz" (or "gpiod-2.0.1.tar.gz" if we change it) s=
hould
> > be uploaded to pypi via the utility "twine" (pip install twine). You ca=
n upload
> > versions to testpypi by specifying "--repository testpypi" which, combi=
ned
> > with a "-postN" version suffix, can help work through bugs in packaging=
 or
> > README formatting.
> >
> > You can also run "twine check dist/*" to precheck for packaging issues.
>
> Sure, this is how I uploaded the existing releases. I was thinking
> more about versioning. We haven't added new interfaces to the code so
> I think the version should be set to v2.0.2 as technically this is a
> bug-fix release + build improvements.

Agreed.

> >
> > I'm not sure if we should yank prior releases of the Python gpiod but
> > some note in the README paying lip service to the change from unofficia=
l
> > Python to official C-bindings would be wise.
> >
>
> You mean out of the "gpiod" repo, not "libgpiod"? Because I assume
> this is where we'll upload the new release.

Yes since new packages will be uploaded to the "gpiod" pypi repo they
are going to be seen as an "update" to the old "gpiod".

Something like "For the old unofficial Python gpiod install with:
pip install gpiod=3D=3D1.5.4" should suffice.

There's good evidence [1] that gpiod is at least moderately popular so we
should expect some minor fallout from people who refuse to pin their deps.

[1] - https://pypistats.org/packages/gpiod

>
> > > Do you also want to add a better homepage to setup.py so that
> > > users of pypi don't bounce off the nonexistent documentation?
> >
> > Yes, we need a basic introduction and a couple of succinct examples.
> >
> > I have some half done edits to the README somewhere locally which I
> > was holding back until after we got the packaging working and until I
> > could ask: What format would you prefer for the README?
> >
>
> Whatever works best or is the standard for pypi. You are the expert. :)

I prefer Markdown because it's what I know and use. I don't believe
any specific format is preferred these days- though the fallback default is
'text/x-rst'

>
> Bart
>
> > >
> > > Bart
