Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2447755FD3F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 12:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiF2K2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbiF2K2K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:28:10 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAA83DDEA
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:27:52 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-317741c86fdso143545077b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NnzMfpT0sFIUUByV0qYUlcgxjpkVy8skskoOri16bbY=;
        b=IPDqSymN6PmtT4RvvmMqMJmt8MITodriqzs8IE8u+u9YB8v4XjOk4w7e9G00ArMEQm
         rvCRaRGN6X7I4AswIbzp9+hcoC9N0B4AvW8OsM0W4ILNClRIr3UUIb829NIBBo5hH7fI
         uO60kqoIzr0DqGov2QpFAZndcj5z3FCJfSKXPnOgP1RUCIQZhiwJzvCdoIviXQDJwZGF
         NOFxrIMb/2/QGKQgu6Kg+JRnjO5IAIccZRE7QDPgklPzcWfnv8uTMPsV8dPEkhBLS9B6
         XngpXq+1ISnKxbbiTUPw+CQn0iO0kL81azsqQLyT1sptUQwsaaI2kNgEtnNfCm4X9E8v
         t0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NnzMfpT0sFIUUByV0qYUlcgxjpkVy8skskoOri16bbY=;
        b=OoRXbsHweOT4CVWiyU5qJU3YOla4WC2Xy5tiNx0CnN4od25Zh08wUttl9nXzD9FnWp
         X/ViLKUlEv35bR0v3K1NT4ZAayYFBVyCBcQxnvcLa0J09/rPlYNCMQT17I3fzxSiX5ft
         bWzd+9qGtsx2vMg3eg4/wvIesKMqs9VVXKm2bhrnnNKeH8ps25IT0xd+UskkB8xBMfCz
         c6ngvd8tcuEB+KeBHYvPZpjU7AOpGUxnJLzecEixEmxeWE5LY0C0Mh9bNNDhuonHHz5q
         o5NAVEyV3yq4bAKfLBYfd8HG+P9gioEqyP96XmsnVqnic1/KQvAbB/NHFFNPxSzEEwzd
         x2xA==
X-Gm-Message-State: AJIora8Fzhcmnt7JiWEY8LxTwnLoWnIECwey5cEPL+hKf/5exQx8U8up
        4V4tt0oGUz2cUyqx3ApjqtlLEY9eAK6HwolTVcg=
X-Google-Smtp-Source: AGRyM1t4bBt//dM/BW7LorUbs5hAebMXPUsl+sKpYEUhnqDYUlBXAgOpLnLhLYS24gTw91c0qkuozKPfX5ckwy0lL8U=
X-Received: by 2002:a81:6fd7:0:b0:317:964a:c7a4 with SMTP id
 k206-20020a816fd7000000b00317964ac7a4mr3089950ywc.131.1656498471837; Wed, 29
 Jun 2022 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol> <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol> <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol> <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol> <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
In-Reply-To: <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 12:27:13 +0200
Message-ID: <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
Subject: Re: [libgpiod] feature request: output state read and sustain
To:     =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Cc:     Kent Gibson <warthog618@gmail.com>,
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

On Wed, Jun 29, 2022 at 11:27 AM Ji=C5=99=C3=AD Prchal <jiri.prchal@aksigna=
l.cz> wrote:
> On 29. 06. 22 9:23, Kent Gibson wrote:
> > On Tue, Jun 28, 2022 at 03:08:20PM +0200, Ji=C5=99=C3=AD Prchal wrote:

> >> using new libgpiod / chardev driver, is there any way to get state of
> >> output? I mean one process sets it for example to 1 and another proces=
s
> >> reads this output state for example to show that on web page.

I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
chips may not allow this on H/W level and when reading they always
will get the value of Input Buffer (now imagine if the line is
configured as Output with Input being disconnected from the physical
pin).

> >> I have to say that old sysfs interface was more user friendly...

And much more buggy and PITA.

> > "new" being anything since Linux 4.8 ;-)?
> > And strictly speaking it isn't a driver - libgpiod and the GPIO subsyst=
em
> > provide an interface to the chip driver.  More on that later.
> >
> > Only the process holding the line has access to the current value.
> > If you need that value elsewhere then it has to be published by that
> > process - it is not available through the GPIO API itself.
> > There is nothing preventing that process publishing the value
> > in whatever way is appropriate to your application.
> > e.g. write it to a file that can be read by your webapp, just as it
> > would from sysfs.
> >
> > Less restrictive access models are frequently "more user friendly", but
> > have other issues. e.g. some misbehaving process just reset your
> > modem for you.
> >
> > And sysfs has other great features like being slow and being complete
> > rubbish for events on input lines.
> >
> >> And at second: it would be better to NOT "the state of a GPIO line
> >> controlled over the character device reverts to default when the last
> >> process referencing the file descriptor representing the device file e=
xits."
> >> "Set and forget" behavior is more natural to what some gpios are used.=
 For
> >> example resetting external modems, need set 1 for short time, then to =
0 and
> >> leave it for long long time until next reset is needed. It's non sense=
 to
> >> keep running some process only to keep output at 0.
> >
> > Agreed, that might be more natural, but that behaviour is not by choice=
,
> > it is a consequence of the kernel internals.  In short, if the GPIO
> > subsystem does not hold the chip then the driver is free to do what it
> > likes to it.
> > So when you release a line all bets are off.
> > It may stay where you left it, but it may not - it may even switch to a=
n
> > input - it depends on the driver.
> Does it mean that without changing this particular line it could be chang=
ed? For example by setting another line in chip?

No, it's only about the line in question.

> > If it works for you that's great, but without major kernel changes
> > libgpiod has no better option than to provide the caveat as the "set an=
d
> > forget" behaviour is something that it cannot guarantee.
> Than is only way to write my own user space driver simulating sysfs? Or w=
hat is the right way of this scenario:
> start proces -> gpioset =3D1 -> sleep -> gpioset =3D0 -> do other things
> when the proces dies systemd will start it again

Do not use shell. Use proper programming language that may give you an
easier way of handling this, i.e. _context_. Shell tools are
_context-less_ and here is the problem you are trying to solve, but
from the wrong end.

> and another scenario:
> proces checks time, if is the right time -> gpioset =3D1
> other proces reads output and print out on web


--=20
With Best Regards,
Andy Shevchenko
