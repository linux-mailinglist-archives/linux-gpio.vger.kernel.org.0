Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45867CC3D7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbjJQM7v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbjJQM7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:59:50 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0642883
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:59:49 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1ea82246069so453583fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697547588; x=1698152388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUAnpR1kkt0hAU/a+jo3wvZEVL7vboqKjWQNx4Oc2jw=;
        b=CbrfPsSzeQbqbdt62qBLVqL3pajcgsWG/c+/iB73x/QjaqnKqNDS9YwKSxyaRqSF90
         4vkFluIGBndnjLO9W5hDkX+CLGXgf3JvC8HHS1mobzTe+nFlO9MzDD1BdFMUuTpJeTZY
         FD9y9vHLBUZvZB3pcrQ3tVOqAqGpB0aS4fqk+p3S6pJfLcbDTGk8VkfxOtkex1wr+AKW
         HSdlr1IvIwUPttzXdPZepCNgZEUDcQZuNbNHgv9r+SDt3PgkW0OxI3dgSobsG/zLwCQu
         i5nHBZR3o6+CYYy0GoDJg1z/TTT4ZJbHNS6k5h8FFnkIWJkOdNDT6QSz+EVPeBH7QHRL
         XTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697547588; x=1698152388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUAnpR1kkt0hAU/a+jo3wvZEVL7vboqKjWQNx4Oc2jw=;
        b=DM/mPB0mZ2eQrwCqyy+iyS8BwgTk038K6x1c/Mjc9JL/mMz6Dv82SeHOoscjVQlFS4
         5UWIAMqy+K0d7mtqVePVaQvOFbZsYVlLwk5JdUXf+iMDxIVwHN7VP6FIb4uo0KSCsn2s
         thhOkwYzCV5PDXy4lT6qB1HY2urzVqp5fDChq0/JkvrVFagFIjSq9MTjCR8i5CxEdx/d
         korPPntTtJwpihc/7CPEq9WNTpZ3MSuqPF9GaYRBqXAoQEgvj+YZ22uNup4bpuu85q8e
         obhT3GPE1l3aVbbMlkAF6eAzhokerpRp+LM3Pk5FvFn/Frxcry/Hd7Qf2Hdk3jD908av
         DiTQ==
X-Gm-Message-State: AOJu0YwFCn2ACFmqTkMjqo62G7Y71ujGAcTleZfSsNZ8uY392LwVMR7h
        C2bJaG26mlQ9rCRR9rCfa/nSGaQBBqXl69xhLdpyi15pprDmyq8eqEfc9g==
X-Google-Smtp-Source: AGHT+IGb9rSwYe4q0rNoafpnpI0lmv5kFKw3xsC3VnD3QyOFzQQa9zSfj95uzv2VYlvwOwZ3es/19dtFKTjPorsb/Uo=
X-Received: by 2002:a05:6871:28a:b0:1e9:c224:bb91 with SMTP id
 i10-20020a056871028a00b001e9c224bb91mr2345727oae.38.1697547588231; Tue, 17
 Oct 2023 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
 <CAMRc=MdC1xYsV3WS95G_Ai7_kuc7o-xxYUdmh1hZ6i=cbkKJOg@mail.gmail.com>
In-Reply-To: <CAMRc=MdC1xYsV3WS95G_Ai7_kuc7o-xxYUdmh1hZ6i=cbkKJOg@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 17 Oct 2023 13:59:37 +0100
Message-ID: <CA+kSVo9PURkoCgG7TDW_xXgxrrT31sAPR2dne3yvQMGc-ipMdQ@mail.gmail.com>
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

On Tue, 17 Oct 2023 at 12:30, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
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
> >  bindings/python/MANIFEST.in |   5 ++
> >  bindings/python/Makefile.am |   3 +
> >  bindings/python/setup.py    | 122 +++++++++++++++++++++++++++++++-----
> >  3 files changed, 114 insertions(+), 16 deletions(-)
> >
> > diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> > index c7124d4..acf9391 100644
> > --- a/bindings/python/MANIFEST.in
> > +++ b/bindings/python/MANIFEST.in
> > @@ -2,6 +2,7 @@
> >  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewsk=
i@linaro.org>
> >
> >  include setup.py
> > +include gpiod-version-str.txt
> >
> >  recursive-include gpiod *.py
> >  recursive-include tests *.py
> > @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
> >
> >  recursive-include tests/gpiosim *.c
> >  recursive-include tests/procname *.c
> > +
> > +recursive-include lib *.c
> > +recursive-include lib *.h
> > +recursive-include include *.h
> > diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> > index 079ceb1..7fadf52 100644
> > --- a/bindings/python/Makefile.am
> > +++ b/bindings/python/Makefile.am
> > @@ -16,6 +16,9 @@ all-local:
> >         $(PYTHON) setup.py build_ext --inplace \
> >                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)/t=
ests/gpiosim/ \
> >                 --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_srcdi=
r)/tests/gpiosim/.libs/
> > +       GPIOD_VERSION_STR=3D$(VERSION_STR) \
>
> I suppose I can remove this line now?

This is right before a separate invocation of the build, which might want
to be split into another Makefile target for clarity.

This is required to build an sdist package which includes a valid
"gpiod-version-str.txt" and can be built standalone, but doesn't change
the original "build_ext" call.

>
> Bart
>
> [snip]
