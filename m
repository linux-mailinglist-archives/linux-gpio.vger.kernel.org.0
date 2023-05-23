Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6ADF70D121
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 04:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjEWCWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 22:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEWCWU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 22:22:20 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F05120
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 19:21:47 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so2918325b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684808507; x=1687400507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kuuyzI6aEswex7GOeormqMMZEuiJ/WAORDc+LdkM7YY=;
        b=gg6srY5lTZTDGAwnDiSba7tABd3Ij7EdLkCyirmkhrtvU/ziH84Ncq9xgmer4t/xP7
         3bCYeJ8w6yr0W221dibBw7ZnNtoCbGSNILSXeR6JBOF7Shz/Er1bjQh3DOHiWNxW9GL+
         7Ce/VGbanCeBhyoKSLUgGxTwBQoNUKJhpf45xBIKoQIj/DoIyPYf4Sco7doFBUxQnKFB
         ki9JOBmDUKb2y3VKu59I/bOCoiX/2PTu4UydtWMfqJ0ifbsWjXVK9/EavZCs87h5g9/B
         69yLVGmt9PIMDnCx62gbKtv1rxqvER09l6HY7mdn2cUBfm/ey6MegK0FUG2SLFfdJnyd
         OLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684808507; x=1687400507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuuyzI6aEswex7GOeormqMMZEuiJ/WAORDc+LdkM7YY=;
        b=gvuNVUe1IBCjzMTgXapH97qosx1SdItCu14q72v6Qrr+MOpG1AkTkLpuKgZAf3zkQ1
         hkj640wdIfiHcRP5iu2NJu6Llz1jd7ByZdC+YmWtYMNz5ANeEVwLwCiTZpLNlcGE1mXl
         6snDG4l8Q/3I4j4CXHWzz39lQl+rGEj5GYo3QiD2SchT3B3wbsdJ7UU464AO4R3jfx+w
         xExaJjpTj4QrWQYM70+SZCI73v7qIKdIFtyy2oyF8oN6nBdNuhTvaFIHhwRT2UIThuis
         PvA+qTLzWBLskoFejNGKwnoNMGbuPMq4TkuVpCXzpOrl+vJS4gYwhrdUMWMYIVH+hWE4
         GG6Q==
X-Gm-Message-State: AC+VfDxhL3+6RIipeuf4HveepKPyKibMH/Pk5P9Cwj1aMFxPD88utZ32
        AMDifJNCVGPqVfApLt2rzKZNgDeqJ8s=
X-Google-Smtp-Source: ACHHUZ4aXUOzcOEbeibF+niJDhnyrVZMuntmzBl/XX2QparPNPQQMe+ZIDGa4wtco/bC+EbSTY1Ktg==
X-Received: by 2002:a05:6a20:8e1b:b0:10b:bf2d:71bb with SMTP id y27-20020a056a208e1b00b0010bbf2d71bbmr4855129pzj.27.1684808506588;
        Mon, 22 May 2023 19:21:46 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id a20-20020aa780d4000000b00637b0c719c5sm4699019pfn.201.2023.05.22.19.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 19:21:45 -0700 (PDT)
Date:   Tue, 23 May 2023 10:21:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] README: provide more info in Contributing
Message-ID: <ZGwjNt/jZ+MsIT8c@sol>
References: <20230520031150.20062-1-warthog618@gmail.com>
 <CAMRc=Mf3uKRwXkkaZdOQS2-a_iph--M3FrVd3dfqqt5wK8aDTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf3uKRwXkkaZdOQS2-a_iph--M3FrVd3dfqqt5wK8aDTA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 22, 2023 at 06:29:27PM +0200, Bartosz Golaszewski wrote:
> On Sat, May 20, 2023 at 5:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add more detail to Contributing to make it easier for new users to
> > contribute.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> > I was tempted to add something on formatting with clang-format, but I'm
> > not 100% clear on the formatting policy myself.
> > Would be nice for that to be clarified.
> >
> >  README | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/README b/README
> > index b71739e..8e726fe 100644
> > --- a/README
> > +++ b/README
> > @@ -275,8 +275,16 @@ were selected and help2man is available in the system.
> >  CONTRIBUTING
> >  ------------
> >
> > -Contributions are welcome - please send patches and bug reports to
> > -linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail subject
> > -line) and stick to the linux kernel coding style when submitting new code.
> > +Contributions are welcome - please send questions, patches and bug reports
> > +to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail
> > +subject line).  Note that the mailing list quietly drops HTML formatted
> > +e-mail, so be sure to send plain text[2].
> > +
> > +Code submissions should stick to the linux kernel coding style[3] and
> > +follow the kernel patch submission process[4] as applied to the libgpiod
> > +source tree.
> >
> >  [1] https://github.com/bats-core/bats-core
> > +[2] https://docs.kernel.org/process/email-clients.html
> > +[3] https://docs.kernel.org/process/coding-style.html
> > +[4] https://docs.kernel.org/process/submitting-patches.html
> > --
> > 2.40.1
> >
> 
> Thanks for doing this. Maybe even add a link to the linux-gpio mailing
> list main page and archives? I sometimes get mail from people confused
> as to what the linux-gpio mailing list actually is.
> 

Fair point - will add something in v2.

Anything to add on formatting?
I was going to mention clang-format, but IIRC you tweak that a bit where
the old way looks nicer.
FWIW I'd rather the clang-format was definitive, or if you can't get
what you want from clang directly, that any tweaking could be automated.
Essentially that there is some definitive format that can be applied by
a tool - I'd rather not be spending time musing over whitespace.

Cheers,
Kent.

