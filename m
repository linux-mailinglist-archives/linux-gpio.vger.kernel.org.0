Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD9055FE01
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbiF2K67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiF2K65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:58:57 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D5D39821
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:58:57 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31780ad7535so144104857b3.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lypeWlxPW2wxP1sug4MZ21tEs+4Edp/+JJ0XnkkCn5E=;
        b=pbpnQm91KMYNxxevWhhETGHofmQFUuYy2IDuDysWgs6KgotVEBBDdqqJavI/1HbOxS
         hBiddySXzSzlokTPXVaVp82UxqWb21CqGBnh/ptwKQ+lLAZBpNuvaWY+qhh0Waonp0gQ
         8vX1LOItqkDK6wMSbH9EyaztN8qq2q7IXz4V5BgjSjkxRP7AvjADYoCPKxkLd+9BuEk+
         HMhRe9+vSwO7sM751RdRRoR6fYME6LCkBHQ0mcrtqiT1FW47oeTEWFzVVOc1sQdA6hRB
         6SEZ9gDIkXH1+oOOmwTTIOBZ7Vm6rjgIP7rDhnaaM19vET6/kPJvA5Otg159gTqympLr
         z4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lypeWlxPW2wxP1sug4MZ21tEs+4Edp/+JJ0XnkkCn5E=;
        b=xBFxGP8N1IXrHqGLY+wxWKQqt9LFqfryEWyfwvEoU3ChqvaANT1Z9tDqjBLr1ABbMx
         V/Mw25WFXaqKCuhkbNHGMwCPr4KvrThMTtC5thvWTLtkITEIXSEnlp/UCciJjpU+nSmJ
         ZMBhbSKVWX79F/5DeGYnaSf3EkmY5OYZlWvfu9VXddyBaYbAHC8qDsXBanRswMaS6xu2
         7hAwd9fQ7/qDB+EkKdko5/ioaEsWjXm+Rec5OCY2kOHJjqjG5vo6XSUmnUYDv3HRusfc
         Gt5d5gGVrOj9FBLXsVEhlE5KLuCyb/yo91s3708qjaqacstojUj2QG/Diz3za+VzaRcy
         Rp+Q==
X-Gm-Message-State: AJIora+2BO7sIAaINggDWAjIMtRvebd8hftNF6bb3zs6DNcdILI8iX9L
        zJurvFLN8v+QMaGekIspuK5RjUZzZzGI29AFv2Y=
X-Google-Smtp-Source: AGRyM1v/6fBLYogj5VEonvY4QMyal2z0bR6o9rMvDoSJrhK97a2lZWo/2PYe+nvTEkdeMnafgKoJWrrt3d+SLw4jop4=
X-Received: by 2002:a81:cd3:0:b0:317:861c:ac07 with SMTP id
 202-20020a810cd3000000b00317861cac07mr3168440ywm.486.1656500336281; Wed, 29
 Jun 2022 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol> <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol> <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol> <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol> <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com> <20220629104757.GA29289@sol>
In-Reply-To: <20220629104757.GA29289@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 12:58:18 +0200
Message-ID: <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
Subject: Re: [libgpiod] feature request: output state read and sustain
To:     Kent Gibson <warthog618@gmail.com>
Cc:     =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 12:48 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > On Wed, Jun 29, 2022 at 11:27 AM Ji=C5=99=C3=AD Prchal <jiri.prchal@aks=
ignal.cz> wrote:

...

> > Do not use shell. Use proper programming language that may give you an
> > easier way of handling this, i.e. _context_. Shell tools are
> > _context-less_ and here is the problem you are trying to solve, but
> > from the wrong end.
>
> Actually my proposed gpioset for v2 will support running interactively
> so it can maintain context and be driven from shell - for cases where
> basic scripting will suffice.

Dunno if it's the right direction and if I missed any (additional) discussi=
on.
As far as I remember the idea was to introduce DBus aware daemon that
should handle the context of the line and at the same time consider securit=
y
implications. Allowing shell to be context-aware is a hidden mine
field. What will happen if the script/user forgets to move the line to
the proper state and the chip will drain a lot of current? So, at
least PM concerns just popped up immediately to my mind. What else can
be problematic? So, I dunno, it's a good idea to allow shell to leave
a line in some state when the user actually doesn't care about it
anymore. At the bare minimum this mustn't be default behaviour.

--=20
With Best Regards,
Andy Shevchenko
