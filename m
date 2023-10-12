Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146B27C7694
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441868AbjJLTTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442062AbjJLTTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:19:05 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4C3C0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:19:04 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-457bc2de48dso155442137.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697138343; x=1697743143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eLEvq1MH4odouWj7v9hygXqEPevwuiOFBVN2oIUquE=;
        b=n/56E/RwMfgZ2RQhdeAsSYpn1kCuKm/CHAHOXcKOijPfEBy3shRYs884ptZ2ZXSqSD
         oRDWZ1bqWSPxoAGuII62xZd4kDWw0ocadywD/hu0Me1C7h7NhnmbNr3XQYRWymFFcz7g
         t7E46nP6m8imx3a9UM1lnQ3CbfsjPkRNtKgmthrHkofihq2DpaNCFFkExgrr7N5ed+0M
         b/khQk9Z8tWqz8qoAQ5ZATQls0HkFPdwcHudiHYokOWVWr2W8Kg8qostqE/Ust084uEb
         7LThjL2PN7mrBrDYyWMMSCkRVXaF8RgIuS7NdGVtQ6wIoFihRxhrvrlMHhy6Sruf5Gvo
         XXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697138343; x=1697743143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eLEvq1MH4odouWj7v9hygXqEPevwuiOFBVN2oIUquE=;
        b=hxPStpfcxch4IYZ4Q8tU0sKHPAx+ujPN6xfzweRjzFmNQ/iJKe5chKjrzN7BEXhnLB
         vKP0Afc2Kl/x011/JTxKjtIN5s2ZSRYwF5NgDkf6ah24xwLHgKORZiu1I2856HLBpah2
         /c7zPAOQIr143LciFc6yv0bGb5DLJOyFMwc2N87ojdf3UA2aT0t6V4i+R4oqDthDGFdF
         FezOfvxtmG/5vMQudL8hPbKFfZujMeJma6qhR06vv94VOxG0BFg7ip2jxYcH1C6uJNiO
         sjkZ42tJuV/9pWjkXV6ql3Jbll4iPtVCTp3nWOddokatNnfLBLYAtcBMmvDPUwP2nUAX
         QoMg==
X-Gm-Message-State: AOJu0Yw6jmsO3eIHT6cYVjBVwYFZYftoV0YK80b+JLz3lGgmcQeTMAdQ
        zv5K4/wgP9vsXRqCCG9BoRsRWWkjUknuRjZzhtBP9g==
X-Google-Smtp-Source: AGHT+IHt7V4D8/TLVBj4kuaddBzGcRTwBuyu/K4mvUAbOJq/0nCZKid4wb7WEfP+0DpP4c9TAIHepKsr5Su1rPYr0ag=
X-Received: by 2002:a67:cb97:0:b0:457:b2f5:3fc9 with SMTP id
 h23-20020a67cb97000000b00457b2f53fc9mr2303754vsl.25.1697138343426; Thu, 12
 Oct 2023 12:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231011121246.9467-1-phil@gadgetoid.com> <20231011121246.9467-2-phil@gadgetoid.com>
 <ZSbXNQ1sx+lDl7JV@smile.fi.intel.com> <CA+kSVo-YKOzSmk73jkmg0Cn0r95dXFw14SPjBZBBvW09Ca-r3g@mail.gmail.com>
In-Reply-To: <CA+kSVo-YKOzSmk73jkmg0Cn0r95dXFw14SPjBZBBvW09Ca-r3g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 21:18:52 +0200
Message-ID: <CAMRc=Mf+Uhh46Bs9gWLJjTCMJCXtB-yFzBcA5xvzO91Sz8_9+Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/3] bindings: python: optionally include module
 in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Thu, Oct 12, 2023 at 11:03=E2=80=AFAM Phil Howard <phil@gadgetoid.com> w=
rote:
>
> On Wed, 11 Oct 2023 at 18:11, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Oct 11, 2023 at 01:12:44PM +0100, Phil Howard wrote:
> > > Build gpiod into Python module.
> > >
> > > Optional environment var USE_SYSTEM_GPIO=3D1 to
> > > generate a module that depends upon system gpiod.
> >
> > ...
>
> *sigh*
>
> >
> > > --- /dev/null
> > > +++ b/bindings/python/include
> > > @@ -0,0 +1 @@
> > > +../../include
> >
> > > \ No newline at end of file
> >
> > These lines are bothering me, why the new line can't be added to all af=
fected files?
>
> Is it convention for symlinks to include a newline, is it even possible?
>
> I'm not super sure about the symlink approach, actually.
>
> It's the path of least complexity but after some research into the
> usage of "shutil.copytree"
> to copy dependent and packaged files at build time I'm starting to
> wonder if a more complex
> setup.py isn't necessarily a bad idea.
>

How about not having links in the repo but creating them as required
at build-time?

Bart

> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
>
> --
> Philip Howard
> Technology & Lifestyle Writer
> gadgetoid.com
>
> Gadgetoid gadg-et-oid [gaj-it-oid]
>
>                                      -adjective
>
> 1. having the characteristics or form of a gadget; resembling a
> mechanical contrivance or device.
