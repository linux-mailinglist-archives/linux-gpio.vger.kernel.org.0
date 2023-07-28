Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4437660CE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 02:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjG1AkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 20:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjG1AkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 20:40:15 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01BC273C
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 17:40:14 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4055bc3cdd8so9942791cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 17:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690504814; x=1691109614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ+OOpmvjBOXYhbh34HDlIcJoNeU3IkPKO65cAWE1L4=;
        b=dYhYoiLmGm2SMs38YEdp/Hrtd3NjNtcF3jX4ko/smW8AEoBEbDA8xzOoIUU1R7v5hC
         Tm4I8fq/gtUcY3rTbGbh3aiOLiZgCE6oCmTrzeh0vA1orzbZyAhiD4/TwnVgwU+NvB1z
         wWJgpO0ntCH0k1KL/Nehts5Fm8LvH+6XFMgaWYd8t1BoJihFkItUHXe7ikLYGv/sc2NG
         h7GdVyBFXterUKoomswI/ZojQSviF3beVI5NflIILrmwJ9sW/hDZuP+ft7ZFLxX7eu2o
         QgdKGpAwue4c556DsO77FG/T1v/rW65fVgT0XHL2GYF3YF5bdfTnNwd6nqqaXkEEBT83
         Nkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690504814; x=1691109614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ+OOpmvjBOXYhbh34HDlIcJoNeU3IkPKO65cAWE1L4=;
        b=UL4XzqW4C2tXiuU7YaoEiaOyEN2sASEaMIcjOxhWvI3xVLTTn9KNDXbZfwniOlqh0R
         ve5qgErLN3fBW9xCJN+Rx44sS2rkZj+Y55YxL8GVhPGMxt2Vz+JyEvVOtwFgtO1gjj9V
         CeAHbEjmaPgjxzCRxlFSOAf7KYxizIoinerWyPbAaVteVPgHg+H68qL6rxo5Aw0NOaDi
         udzK+UWfbfCqvGnXOacwfe3ic5hCpVVgPpzID1DsXayIWu7g7e6B+8aHBlSFBB7qbN8k
         mP/0dj/6QR+V9lBG3wN8e5TRoR8jYw2CgnQpEh1dQULFhLb0uUV2+wb2WzVxnR2u8Q/b
         oZuA==
X-Gm-Message-State: ABy/qLbkpkGIWED5xuYLbAWDWu0bYXEtOMcNjsoj6bYM2qASv3bWBpcP
        5VJFuDJuSwb4Y2DHgaptW76YZZNyLH/GGK7vLfA=
X-Google-Smtp-Source: APBJJlGskPo9w44iOh+qZuQkmFCsqfi9g+skSAEy7uCzfZn0/t6seI+KAMFqjYRAn85ieHaLTksLtWXeVbkqrPX9JKg=
X-Received: by 2002:a05:622a:4c6:b0:400:797e:d694 with SMTP id
 q6-20020a05622a04c600b00400797ed694mr1211945qtx.11.1690504813780; Thu, 27 Jul
 2023 17:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
In-Reply-To: <ZMLnz25brQvcwBVW@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Fri, 28 Jul 2023 01:39:37 +0100
Message-ID: <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
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

On Thu, 27 Jul 2023 at 22:55, Kent Gibson <warthog618@gmail.com> wrote:

> > I did try that way first, but it didn't seem to be working for me.
> > I am currently upgrading the system to Bookworm (gpiod v1.6) to try aga=
in.
> >
>
> If you can repeat it, and ideally provide a failing test case, then we ca=
n
> take a look at it.

Now using gpiod v1.6 in Bookworm. gpiod_line_request_bulk() does not
seem to set the consumer.
Also, with the suggested use of bulk requests I still get an error
return from gpiod_line_get_value_bulk and an errno (22) that suggests
that it is line_bulk_same_chip() which has caused the problem.

test output:

line0 (null) line1 (null) line2 (null)
Error =3D Invalid argument (22)
a.out: test.c:47: main: Assertion `retval =3D=3D 0' failed.
Aborted


test code:

````
#include <gpiod.h>
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <errno.h>
#include <string.h>
int main(int argc, char **argv)
{
  struct gpiod_chip *chip;
  struct gpiod_line *line0, *line1, *line2;
  struct gpiod_line_bulk bulk;
  int retval;
  int val[4] =3D {0};

  // Open GPIO chip
  chip =3D gpiod_chip_open_by_name("gpiochip0");

  // Open GPIO lines
  line0 =3D gpiod_line_find("GPIO17");
  line1 =3D gpiod_line_find("GPIO18");
  line2 =3D gpiod_line_find("GPIO19");

  gpiod_line_bulk_init(&bulk);
  gpiod_line_bulk_add(&bulk, line0);
  gpiod_line_bulk_add(&bulk, line1);
  gpiod_line_bulk_add(&bulk, line2);
  gpiod_line_request_bulk_input(&bulk, "test");

  printf("line0 %s line1 %s line2 %s\n", gpiod_line_consumer(line0),
                gpiod_line_consumer(line1), gpiod_line_consumer(line2));

 retval =3D gpiod_line_get_value_bulk(&bulk, val);
 printf("Error =3D %s (%i)\n", strerror(errno), errno);
 assert (retval =3D=3D 0);
 usleep(1000000);

  // Release lines and chip
  gpiod_line_release_bulk(&bulk);
  gpiod_chip_close(chip);
  return 0;
}

````

If Instead I use

````
...
  gpiod_line_bulk_init(&bulk);
  gpiod_line_bulk_add(&bulk, line0);
  gpiod_line_bulk_add(&bulk, line1);
  gpiod_line_bulk_add(&bulk, line2);

  gpiod_line_request_input(line0, "test");
  gpiod_line_request_input(line1, "test");
  gpiod_line_request_input(line2, "test");
...
````

then the result is

line0 test line1 test line2 test

Which I think is why I was using separate requests. Initially I
thought that this might be the problem, as the
gpiod_line_get_value_bulk
function checks both all-the-same-chip and that all lines are requested the=
 same


--
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
