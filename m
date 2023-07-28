Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054AE7675F4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 21:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjG1TBw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 15:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjG1TBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 15:01:51 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD02E30F7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 12:01:50 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4039f0d140eso15581991cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690570910; x=1691175710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUP/B+Sed6ddOfwPzKP7gRJkWCC4KdwjYWV/qQCd3vw=;
        b=R+p36zwUpqQP/9DPNUesOcnqXOYHeT/ZKN5h9VDvhBB1uDo0LscHsfiTgM6L2XCmGI
         xWdMB2Y808IjTm6ztWCPlzkmMDS1cBjUOoPXSbwJSGUIXGqJodUn2qtXWZ9rOYUpexgb
         mGY09k75wrgH5US6s0mwT4TwAmXFpC6p+ovOtxOGvX71saNaj4WMuGHSJIWVSxKxKY5o
         a1OSeYMN2FaYUrZ9krjJGwm6d77J7BCq0wh9eHEBIui4bMuQ3fDtDn4s/Ag7E+huN1Lc
         8/VV3SbHpq2J4YX6/pveALv7kXyGXSjRd2kte4jw/UsNPWxiu9fFJnmEBQrRyy/91CqR
         4igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690570910; x=1691175710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUP/B+Sed6ddOfwPzKP7gRJkWCC4KdwjYWV/qQCd3vw=;
        b=W8w8wLyjCNw3rqv6Wb6UhyaUAubOwT851OaDpOB83/gEVcXcy6B1gNINEGZnNuuTIq
         FQeGl5lskt3yU9enbfVUUCzXaTKERWtc/U642s8hyehe8FEmipkeA8iluPaxMsyP2D7+
         Nidn6CJNzkJG1eAJH8w3KcyWKsHLxKtMsnOZEeTzjjFhMJXkL+EzchO/km48OvC0aWtI
         fq8RWD5MO7AZ6MvsZZTtOivFYoGaCbORlswatZX+cc9sFcpcMIHUcRqN5nBkInruBBHj
         By30jqpQaSxCd198IQXcDjZM6q6icFywLG1KZqgzwaZfd9CZPw8SbNtO1Ze+vwOqVel6
         /8Bg==
X-Gm-Message-State: ABy/qLY2PBsoMW3dWDT8j3K/l9MwFo7QNcahDge0HBFgmo+6jAoHaiPH
        bxAPdvXgT83zH3v2+nOmalEnB0Y3fiiLI3QLgG5Bavba
X-Google-Smtp-Source: APBJJlG5sro+EYDT6+cbSV7pu8/sFQKk1I6RWbS7FHb3CchymtH2TM8YW3Jf+6Spv6AcqODmj5gDhwCZxQvx54+yw/w=
X-Received: by 2002:ac8:5a4a:0:b0:403:a9aa:56d6 with SMTP id
 o10-20020ac85a4a000000b00403a9aa56d6mr4714842qta.58.1690570909639; Fri, 28
 Jul 2023 12:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol>
In-Reply-To: <ZMNYsOXrOOZgxLeC@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Fri, 28 Jul 2023 20:01:13 +0100
Message-ID: <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 28 Jul 2023 at 06:57, Kent Gibson <warthog618@gmail.com> wrote:

> Your problem is that finding lines this way produces gpiod_lines with
> different chip pointers, and gpiod_line_request_bulk_input() is taking
> that to mean different chips, so the request itself is failing - but you
> didn't check.

That was on my list of things to check next, but it was getting late
and I wanted to send the failing case as requested.
I had guessed that the same line_bulk_same_chip() routine would be the
cause of the bulk request failing too.

I think that test might be flawed....

>   line0 =3D gpiod_chip_find_line(chip, "GPIO17");
>   line1 =3D gpiod_chip_find_line(chip, "GPIO18");
>   line2 =3D gpiod_chip_find_line(chip, "GPIO19");

This is working for me now, thanks.

> Not saying the gpiod_line_request_bulk_input() behaviour is correct, but
> given v1 is obsoleted by v2, and there is a reasonable workaround for
> v1 (assuming you know the chip the line is on), I'm not sure Bart will
> want to fix that quirk.

Unfortunately I won't know what chip the line is on, but I have
already considered that and plan to have an array of structs
containing the "bulk" and the "chip" for each chip that is needed
according to the IO line list submitted by the (pesky!) users.

> For the same reason, I would suggest that you try libgpiod v2 and use
> that instead if you possibly can - assuming libgpiod is fast enough for
> your application.

libgpiod2 (and any further bugfix to 1.6 for that matter) have the
problem of not being currently available as packages in the
distributions we use.

It is possible that we could serve the package from our _own_ package
server which we have been running for a couple of decades, but as we
have _just_ been accepted as a mainline Debian package that would seem
a little peculiar (and involves trying to explain to machinists how to
add extra repositories and set up the associated keys)

I think I see the way forwards now. Thanks for your help.

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
