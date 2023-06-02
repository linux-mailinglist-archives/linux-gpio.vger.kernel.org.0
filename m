Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA1C7202AB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 15:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235940AbjFBNKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 09:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235963AbjFBNKc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 09:10:32 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24381AB
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 06:10:30 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-439554d9a69so1419571137.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685711430; x=1688303430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6MS8CXzMLUh4+5EUZRwRkinpexRI6bzP1Z2eNdS1D4=;
        b=Nm9TSWU4b1nhQ8AkRU96FpD3Naz/vJfz/Y1AbBC35N3jxuD+Y2Fv+iODicdQY3PoqU
         c8+F6fFUVwLokGcIBDfVDB33AiP7kWBx4wJ5+r3kKo8oonL54FbUBC/DBORYXvQTnpqe
         TEYqMrncEVXylf1lz6NtbwQRpjUo0KctGOkvvBvE3FgLfHdA+i+mi8GlB+48RLzh30gT
         3AJ8LuwFLS4EwDOexEdpHTVUalQi2XK2OAM2DIOwQcN+JP+DBTzUyEXsZ2NYGll2Xhqj
         wxa7yd0eRlxt9O6p4e+wrwrWCWn3EeuaR35AXOoLVxHAGztDAMdIVfPXV/imnS3tkca+
         MSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711430; x=1688303430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6MS8CXzMLUh4+5EUZRwRkinpexRI6bzP1Z2eNdS1D4=;
        b=I0cMKP3zCydQYER4QjDF2lqdFo0H7QZclshAZ+OYmc6RFqSoNLxjM36BsycbC4s+2S
         wQsvG0uO8EKBu/blFS3XR7Ur24tbrholUjqhIqtwb0zL0RktdXMp95qDJDDtkCXMz6ol
         NMuJvzqoYu84c3vpFkSB9BJyDD75CKYkpF93n52YPv/5u5QS8sN+fBMp+bEefXPUIzM+
         iUIaKVAit1CH2db8tumx88wVGSD7MoH8gp67zII9R+nnj54qs8yXyl61pQpKOyWWCmFe
         u6tYs1iAmsQRx63B96If/vdhYOHtmShWTJ/3sSjfpksqUFqvpK7fck/oDWjkdrONgwjv
         +oBg==
X-Gm-Message-State: AC+VfDys0VKZhx+dM26PAOmYuzGN8vzgiqmtOLVaMOkZ01tXOVUo+Gj+
        PmgrYUjTkdyJ00T6uDbCl9tAzLJpJf+IAPnaZcjIDjlrkOP7jGN7xCE=
X-Google-Smtp-Source: ACHHUZ6zwvo/t8msv25sF/r0DnJ4K69AtgYgnA9l0Kimfdz8nCZqD1/em5vSr7IaBOHxrucBrG8kOSQn+kqZJFIClYI=
X-Received: by 2002:a05:6102:c01:b0:439:55ed:226c with SMTP id
 x1-20020a0561020c0100b0043955ed226cmr2563736vss.14.1685711430088; Fri, 02 Jun
 2023 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230601140950.779453-1-brgl@bgdev.pl> <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com> <ZHlQT5KeU+7GkYba@sol> <ZHnFxdcZJEd1ta0R@sol>
In-Reply-To: <ZHnFxdcZJEd1ta0R@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Jun 2023 15:10:18 +0200
Message-ID: <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 12:34=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Jun 02, 2023 at 10:13:35AM +0800, Kent Gibson wrote:
> >
> > On a related(??) note, I'm occasionally seeing Oopses when testing this
> > - when creating a basic sim with a shell script, not when deleting it.
> > In one case after a fresh reboot and on creating the first sim, so it
> > looks to be purely the construction.  Yay :-(.
> >
>
> I had thought it would be difficult to reproduce this and so difficult
> to bisect.  Fortunately(??) not.  If I run my setup and cleanup scripts[1=
]
> in a tight loop it occurs very readily.  Haven't bisected it yet, but did
> test it on 6.1-rc1 and it Oopsed there too, so I would need to go back
> further.  What was the initial release containing gpio-sim?
>
> The sim setp is pretty simple - a couple of banks each with a few lines
> and hogs.
>
> Could you confirm that you can repeat the problem?
> Otherwise I might start thinking there is something broken in my test
> environment.
>
> Btw, the loop script is:
>
> #!/bin/env bash
> for (( ; ; ))
> do
>         echo "create sim..."
>         ./basic_sim.sh
>         echo "destroy sim..."
>         ./clean_sims.sh
> done
>
> Cheers,
> Kent.
> [1] https://github.com/warthog618/gpiosim-rs
>

With this script I've been able to trigger an issue but it looks
different from yours: https://pastebin.com/cbsgT2ae

Bart
