Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847D87663CF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 07:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjG1F5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 01:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG1F5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 01:57:10 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9378219BA
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 22:57:09 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso14319725ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 22:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690523829; x=1691128629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pXI2S+4vxDeRhpOaJHNtSgFM8iSc9Ufx/FlYtZN07s=;
        b=eLaXzr0cCsJugKdfcVA0mgVunCgIjL8Lq4evJeq5tSUGRrcBLXZteE/3uF8cnWfrRb
         S9w/JbNo6gGNphIgk6Bk0FxK4ExPh+jdxuFGpM80EmtjS5rqInlrhLdxLtiSHiqvlez9
         Igtf/9CLRxG5crVQlJSYdIa7xfUn/CSOu/fbY5fX4czblZMl+hOVCL0AVWbgturK4zci
         fEL7vCdszEHvXAFpNvaffI7kR9wOfOLegeD7jYyICqv5WhnYnrFQygKtCuDWhFHjpN4e
         GksNIXISGV6EbZO8hDs/PR/EfAD62bidsHRdVSJP67E7FinhtVzCBDCTXLejMVKZKkVs
         om4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523829; x=1691128629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pXI2S+4vxDeRhpOaJHNtSgFM8iSc9Ufx/FlYtZN07s=;
        b=GlosHMF5zAIGYfmlBmalrWCyOiUMmZNEklfcCHVZ4BAGGjgQ7wauqvTm2Ga4LRzFzb
         QmSrxMDtuO3iCb5yv061V4lfjCv4dXcn5X4/yz6B/gYniVEBWyWIA6lDP0x9WnQi/VTt
         73oOovLP/NO+h4walPHNCYAxs7lfOpJtUpB1Cmuf0Ba43azEqR/oWT09lTgN5HCGYGh0
         mNEtvuGfEjgdM7LgdyanxgWBDpVp6MwLD11NBZ4+RQ0fZcjaIokXbhcaAl6RZ+0mdCLj
         K8HIrz5Y5H5vP+EcqYKk+xjLsewylGHAtm1PXHBvSSjQrVgGqbHS1IGjRYOeOLY4IVSj
         DzXA==
X-Gm-Message-State: ABy/qLZmm2LSIgmUZLEuuDp55oYoDdj98SXy3NrzObzyU5yi85gk4cIm
        dQ6khKwQKM9IlWT1tGEhy31ML9PqoG0=
X-Google-Smtp-Source: APBJJlEIG1dD4Ce7bZlBLlLrbKP6FFYD5qm0NGzLjBVH/hl0EIt8UySD6frTrWYYbgbpGdVoScB31A==
X-Received: by 2002:a17:903:2289:b0:1b8:560a:aa16 with SMTP id b9-20020a170903228900b001b8560aaa16mr1145636plh.10.1690523828941;
        Thu, 27 Jul 2023 22:57:08 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b001b05e96d859sm2644321plk.135.2023.07.27.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:57:08 -0700 (PDT)
Date:   Fri, 28 Jul 2023 13:57:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZMNYsOXrOOZgxLeC@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2023 at 01:39:37AM +0100, andy pugh wrote:
> On Thu, 27 Jul 2023 at 22:55, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > > I did try that way first, but it didn't seem to be working for me.
> > > I am currently upgrading the system to Bookworm (gpiod v1.6) to try again.
> > >
> >
> > If you can repeat it, and ideally provide a failing test case, then we can
> > take a look at it.
> 
> Now using gpiod v1.6 in Bookworm. gpiod_line_request_bulk() does not
> seem to set the consumer.
> Also, with the suggested use of bulk requests I still get an error
> return from gpiod_line_get_value_bulk and an errno (22) that suggests
> that it is line_bulk_same_chip() which has caused the problem.
> 
> test output:
> 
> line0 (null) line1 (null) line2 (null)
> Error = Invalid argument (22)
> a.out: test.c:47: main: Assertion `retval == 0' failed.
> Aborted
> 
> 
> test code:
> 
> ````
> #include <gpiod.h>
> #include <stdio.h>
> #include <unistd.h>
> #include <assert.h>
> #include <errno.h>
> #include <string.h>
> int main(int argc, char **argv)
> {
>   struct gpiod_chip *chip;
>   struct gpiod_line *line0, *line1, *line2;
>   struct gpiod_line_bulk bulk;
>   int retval;
>   int val[4] = {0};
> 
>   // Open GPIO chip
>   chip = gpiod_chip_open_by_name("gpiochip0");
> 
>   // Open GPIO lines
>   line0 = gpiod_line_find("GPIO17");
>   line1 = gpiod_line_find("GPIO18");
>   line2 = gpiod_line_find("GPIO19");
> 

Your problem is that finding lines this way produces gpiod_lines with
different chip pointers, and gpiod_line_request_bulk_input() is taking
that to mean different chips, so the request itself is failing - but you
didn't check.

>   gpiod_line_bulk_init(&bulk);
>   gpiod_line_bulk_add(&bulk, line0);
>   gpiod_line_bulk_add(&bulk, line1);
>   gpiod_line_bulk_add(&bulk, line2);
>   gpiod_line_request_bulk_input(&bulk, "test");
> 

If you change that to:
  retval = gpiod_line_request_bulk_input(&bulk, "test");
  printf("Error = %s (%i)\n", strerror(errno), errno);
  assert (retval == 0);

it will die on the assert.

Try this to find the lines instead:

  // Open GPIO lines
  // (actually this is just a find - the request performs the open)
  line0 = gpiod_chip_find_line(chip, "GPIO17");
  line1 = gpiod_chip_find_line(chip, "GPIO18");
  line2 = gpiod_chip_find_line(chip, "GPIO19");

That then works for me (including the extra Error print above):

$ ./a.out
Error = Success (0)
line0 test line1 test line2 test
Error = Success (0)


Not saying the gpiod_line_request_bulk_input() behaviour is correct, but
given v1 is obsoleted by v2, and there is a reasonable workaround for
v1 (assuming you know the chip the line is on), I'm not sure Bart will
want to fix that quirk.

For the same reason, I would suggest that you try libgpiod v2 and use
that instead if you possibly can - assuming libgpiod is fast enough for
your application.  

Cheers,
Kent.
