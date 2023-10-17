Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF0C7CC19A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 13:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbjJQLPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 07:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjJQLPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 07:15:14 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263DFB0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:15:13 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1ea4a3d0a44so1196332fac.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697541312; x=1698146112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wiNQ9Cu69EtBXcOAfpeeiLFute0Bc7pcLkiJCR8cIQ=;
        b=foHJF9frJpX7LTF0ZAEQAf/Z2nEN4r05ERIWBq1anbp8uu0HgMPpki8ulgRD4h0wom
         Nqq7Bg9bLnaM4KmMhqZ+flsZkuPZVI7Ydly9cb3c1EJHxe9unVenFyEK+ofBTdjpwkMT
         zSi9anWc9dXY/6z/nu4IapjBIkPlXnBly4YFsLpfdG3zhSybxGceLRRP/RsBUFXwfZNO
         wf7kBhTkMXeu3+PuKO0DfDEWsNCNbMSt+XfgM6aeg9xI5879HVHDqv8ABiRL/deys/Ta
         gu2ijVoi+TN+FRLAhUXH/VR+VN5Ah/vvF1PjyK1H0jJa4RQBHcTEV8w9dqJlbRIU/UWV
         CbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697541312; x=1698146112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wiNQ9Cu69EtBXcOAfpeeiLFute0Bc7pcLkiJCR8cIQ=;
        b=Y/cqhqhnmr6otyRQ27/v0Mq/JXfFAYIu2IBPhfNX5Sx5lQeZHz9LAcK7i6DrN7ofxK
         iB9gJAipQqbz2YOtQz6NbJ8W7RZ5cUov1IShN5LzlGBtbf5OvOb50/7MNhqV0/jk2o5Q
         RByuBY7FvyOAhQxz1a/UbvE3EpHUE9hQcPWed9mQSCAZddOEophKU3x2PKZEY8mfbtZB
         c3TDL2nH7xvltpdhLrHRDbjmJ1tDDcaHvhBYfEt6/dXU5gN9E4RCwZh/pbY074BGRKPa
         GmKiCXvwP7hg6DpOcRn3PyIskdkEwuUHtJF0MLFoQHJVBwn5BsICAhZW+rvkvXL61lEi
         UQzA==
X-Gm-Message-State: AOJu0YwP7XYecBZ09tvzUkhcsYb4DNTB5kHhb73IXF56uc4zTwrZY41P
        3I0pf2GjCcOSGvxB0Nal37zgkzReksbejxxNgsmyLNeWQdHizTCNnlkJOg==
X-Google-Smtp-Source: AGHT+IG2H3gorJeSMszIXSv6nVYrOAONaRH0CRoHG45So4A+gDCBMA/UwBs+thy3CNtunaPl5ZnOlotrmavBV25qlI4=
X-Received: by 2002:a05:6871:4d04:b0:1e9:a5f2:aab2 with SMTP id
 ug4-20020a0568714d0400b001e9a5f2aab2mr1661682oab.37.1697541312439; Tue, 17
 Oct 2023 04:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
 <CAMRc=Mfwx5-sa231TP_di20uMUysfwUGXL-EN5mDALkqRj4AQQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfwx5-sa231TP_di20uMUysfwUGXL-EN5mDALkqRj4AQQ@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 17 Oct 2023 12:15:01 +0100
Message-ID: <CA+kSVo_EzO1RBa7gvyUBcggNtASf3RCsDd6W2aB8=4+Qw=vVLw@mail.gmail.com>
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

On Tue, 17 Oct 2023 at 11:09, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com> =
wrote:
> >
> > Optionally vendor libgpiod source into sdist so that the
> > Python module can be built from source, even with a missing
> > or mismatched system libgpiod.
> >
> > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> > so that the sdist package can optionally be built and
> > linked against a compatible system libgpiod.
> >
> > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> >
> > Update build to add an additional sdist target for upload
> > to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> > triggers a vendored package build. "GPIOD_VERSION_STR" is
> > saved to "gpiod-version-str.txt" and included in the sdist
> > for standalone builds.
> >
> > "GPIOD_VERSION_STR" must be specified in order to produce
> > a standalone buildable sdist package, this requirement
> > implicitly preserves the old build behaviour.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
>
> Alright, this looks and works well. Before I merge it: the package
> still shows up in 'pip freeze' as libgpiod. Now that we control the
> name 'gpiod' on pypi, should we change it to 'gpiod' instead?

Yes, it's conventional to have the module and package name match
for single module packages.

> Once I apply the patch - how would we go about making a new proper
> release?

The "libgpiod-2.0.1.tar.gz" (or "gpiod-2.0.1.tar.gz" if we change it) shoul=
d
be uploaded to pypi via the utility "twine" (pip install twine). You can up=
load
versions to testpypi by specifying "--repository testpypi" which, combined
with a "-postN" version suffix, can help work through bugs in packaging or
README formatting.

You can also run "twine check dist/*" to precheck for packaging issues.

I'm not sure if we should yank prior releases of the Python gpiod but
some note in the README paying lip service to the change from unofficial
Python to official C-bindings would be wise.

> Do you also want to add a better homepage to setup.py so that
> users of pypi don't bounce off the nonexistent documentation?

Yes, we need a basic introduction and a couple of succinct examples.

I have some half done edits to the README somewhere locally which I
was holding back until after we got the packaging working and until I
could ask: What format would you prefer for the README?

>
> Bart
