Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B5BB2A7F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 10:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfINImR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Sep 2019 04:42:17 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37616 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfINImR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Sep 2019 04:42:17 -0400
Received: by mail-io1-f51.google.com with SMTP id b19so7890801iob.4
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2019 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FlR8QyScXmkfGx+MX/01NhXYDwleVTzxMUeD9wh/x3w=;
        b=KoREbczLen+w0excsbNim9uLufoAVhqsWuW3PUduIVripEpXUTIdx8bggnzB3/jh0u
         H92xCUYd2qG8ERC6BgMIYZeFTbmCQaBDBjOU0JS8HN4UQkQzcN8Vwqup6oDHUe4oQmqx
         AMDe+OGRgCkbpyTpwTKMLPIsRa2yPnsUYAs3hyArCUufFoNWVjlDf3a83TuZmkprCqmO
         9YaC4ydED9TZ0nWHxOZUwg+7durupgR5BBW37jIyCCKTmoz3pVteua64esDeUAU0/44z
         8yhre5wpWSPs4MA2MQQcEO/z9v+n/T4sQ/tETMD8tlaqbmhC1TxjmW9l8cog+Mcqe7Dv
         0lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FlR8QyScXmkfGx+MX/01NhXYDwleVTzxMUeD9wh/x3w=;
        b=NyGnMLH2Iw35b1y5vPnqFZkuue9j7sDqKD9Dq6FG51Ua9xI46FQ/LxXZbPU43mSqx1
         azB+aP51xMF335H1s/xSOlpy6HplK/pvTSgmlTRBhvkaVJ5rk1Lv9LMkYEVKAPF7Zc5m
         sL4q2gY5ETJViBEvfc419tXBAlbZZIPjVqHf/QkcltRYMO3JLl0Zvq+h1qzypcb3IVkl
         9qeiUmv9FH7/XvIl/LuDS24lheJtNa+X5jacdXT4lU13141M9icihpsLGXgOlLUlpfWZ
         qgnFSxMlb7jlDYPuV9SLGttMI1163RELsYjujADUK4j1cnFbPrfvA4nHCfwC5tqF4ZJx
         Dl9w==
X-Gm-Message-State: APjAAAUiNyg4QyREqRsxyG7dtCKi2p87WOJZZk4dn1YZgpZ7Ldh00q/w
        6yNFJqZZcNmrgpMup1l4U3abPwCbFQ6c3Rdq2HkpPw==
X-Google-Smtp-Source: APXvYqxnU2Mcmianby71oWbtFwaQy2WWC9QBGVn3QCG/GFx6kvnw7qNKwSlk9mYAWHb7DJsiGwpka1ao2ZlhV+VZtp0=
X-Received: by 2002:a02:7b0d:: with SMTP id q13mr44763052jac.114.1568450534653;
 Sat, 14 Sep 2019 01:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <a2ad7284-b31c-a152-aebf-01efc4a36765@freenet.de>
In-Reply-To: <a2ad7284-b31c-a152-aebf-01efc4a36765@freenet.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 14 Sep 2019 10:42:03 +0200
Message-ID: <CAMRc=Mez=0L8jemxC5r_+1pkT1vmpyZdoTws00ssf0kq_ELDXw@mail.gmail.com>
Subject: Re: [libgpiod] python binding decidedly unpythonic
To:     Darrien <darrien@freenet.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 13 wrz 2019 o 15:05 Darrien <darrien@freenet.de> napisa=C5=82(a):
>
> Hello,
>

Hi Darrien,

> I just started working with python3-libgpiod and noticed that it is
> decidedly unpythonic.
>

I'm not really sure what that means. A quick google search yields many
answers but not necessarily with regard to what should or should not
be handled as properties.

> For example the Line object functions active_state, consumer, direction,
> is_open_drain, is_open_source, is_requested, is_used, name, offset and
> owner should be properties, and set_value/get_value should be merged
> into one property.
>

For the first part: you may be right that it would be somehow "better"
or more standardized (I didn't really find any official documentation
that would suggest always using properties when possible - mostly some
stackoverflow posts), but I decided at the time of writing that when
in C, methods cause less churn. Also: these methods make the object
call underlying C code, so I considered it more of "telling the object
what to do". I may have been wrong - python is not my main language.

As for get/set values: this leads to execution of underlying code that
can fail, it's definitely not a property but an operation on the
object conceptually.

> Line.direction should probably also be writable for bidirectional pin use=
.
>

Definitely not. Direction can be changed by an external actor or by
the current process when it runs the request operation. Even as a
property it should be read-only.

> Regards
>
> Darrien
>

Let's say I'd want to convert the methods you listed to properties:
this would be a backward incompatible change of the interface. I'd say
it's the right thing to do if the API was fundamentally broken and
didn't work but it's not the case. I'd prefer not to force people to
change their existing code without a very strong reason.

In other words - if ever there'll be a change of API major version to
2, I'll be sure to address python bindings as well. For now I believe
we should leave it like it is.

Best regards,
Bartosz Golaszewski
