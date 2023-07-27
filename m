Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734CC765DA0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjG0Uxh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 16:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjG0Uxg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 16:53:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A07F5
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 13:53:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bba04b9df3so11177805ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690491215; x=1691096015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSpzU4mK4g0zWP5EODejGFIx5FkGHFtqTyz+ihYkJVw=;
        b=juGOtNjJWIPCyZ0lurMXURyCC6rVsGTZ/70clHW20Nt9E3JB50WseVgRQOCdwL7AKa
         MrpOBvVpZyfY3IMIRHok+bSK8c6HACv68M49kkGKkTJ/2v/gIhou9LIkGrLfnZn61e/T
         PwY9jCuwTt5vDjl8r7oV4jV14qgHTizYiCUBBNjnfcmuk6oKvtIrmqBcaadJExQQi9Fd
         Pog1ENnxkK0xBuHTjBcPKeTDKOdYya/2n+bY6dG0xiKc/cmZ/ms4NsdqhxUg075nUtda
         2mxflNJDyz2t3hTnvT3qowjqdvj1uh8/Pgp6kVvLs89icUw5fy9xy6EOo/0CZSMsp8lC
         jatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690491215; x=1691096015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSpzU4mK4g0zWP5EODejGFIx5FkGHFtqTyz+ihYkJVw=;
        b=QHQAdVdzEzjPDVJOqsewGmBVRcr0KVaqO/GigLWSQw1h1CzCEpeY/9Ht3b2SK4MbOj
         Kk3MDsG2gIFgfy1TERfZcJIylYHb+/fWHfzbzCHURBVzs2Gx+yobNTzUCC0+PU0xUt1f
         teiy/jTTqjtU4oI3NkOMlbPPTxP2FVxEY6vDyHhQcUWD/NtmmBvZTJjCgTXz9m3IK5z8
         OEI3M0gDSv5ej5ZM2t1ZCcwrHFCoQ0rhSaKi3yYhu//YGN/RN6eLAZISRFUQRE5VrU0y
         X5Q0kObobAk+UJxWlOUUGMuivWU855E6ktkEJTVBdV7Y4yWuONK2sHPrdxZckPeoYysC
         Y7HA==
X-Gm-Message-State: ABy/qLZsGqGxPQW91yJHP5XzUuExthI4X3bkoUgtDaRogQvkjBYK4nL0
        wCuhW+qy+hM2xgbUJPEguKg=
X-Google-Smtp-Source: APBJJlHVm6AeXPh0FPozELawsviEbeN5DGJew6Im6FhNC/oYr9iH2OfAgOKs1FW6M0XJ2ssFhiNCsg==
X-Received: by 2002:a17:902:c951:b0:1b8:c972:606c with SMTP id i17-20020a170902c95100b001b8c972606cmr578237pla.57.1690491214647;
        Thu, 27 Jul 2023 13:53:34 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001ac2be26340sm2063127plf.222.2023.07.27.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 13:53:34 -0700 (PDT)
Date:   Fri, 28 Jul 2023 04:53:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZMLZSqRwrPfKEbX3@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 04:14:38PM +0100, andy pugh wrote:
> I am using v1.2 on a Raspberry Pi under Buster (as that is the
> installed version)
> 
> However, the code appears to be the same in v1.6.
> 
> As far as I can see gpiod_line_get_value_bulk() always fails if the
> bulk contains more than one line. The problem(I think)  is that
> gpiod_line_same_chip() always returns -EINVAL
> 
> Test code output:
> 
> Chips line 0 0x3f1280 gpiochip0
> Chips line 1 0x3f2af0 gpiochip0
> Chips line 2 0x3f4350 gpiochip0
> 
> ie, all the same chip _name_ but the result of gpiod_line_get_chip (if
> displayed as a pointer with %p) differs.
> 
> Test code
> 
> ````
> #include <gpiod.h>
> #include <stdio.h>
> #include <unistd.h>
> #include <assert.h>
> #include <errno.h>
> #include <string.h>
> 
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
>   gpiod_line_request_input(line0, "test");
>   gpiod_line_request_input(line1, "test");
>   gpiod_line_request_input(line2, "test");
> 
>   gpiod_line_bulk_init(&bulk);
>   gpiod_line_bulk_add(&bulk, line0);
>   gpiod_line_bulk_add(&bulk, line1);
>   gpiod_line_bulk_add(&bulk, line2);
> 
>   // Compare the return value of gpiod_line_get_chip() for each line
>   printf("Chips line 0 %p %s\n", gpiod_line_get_chip(line0),
> gpiod_chip_name(gpiod_line_get_chip(line0)));
>   printf("Chips line 1 %p %s\n", gpiod_line_get_chip(line1),
> gpiod_chip_name(gpiod_line_get_chip(line1)));
>   printf("Chips line 2 %p %s\n", gpiod_line_get_chip(line2),
> gpiod_chip_name(gpiod_line_get_chip(line2)));
> 
>   // try to read the IO lines
>   retval = gpiod_line_get_value_bulk(&bulk, val);
>   assert (retval == 0);
> 

That is not how the line_bulk API is used.
You don't request the lines separately and then add them to the bulk,
you add them to the bulk then request them with
gpiod_line_request_bulk_input(), or one of the other
gpiod_line_request_bulk_XXX() functions.

e.g.
 
    gpiod_line_bulk_init(&bulk);
    gpiod_line_bulk_add(&bulk, line0);
    gpiod_line_bulk_add(&bulk, line1);
    gpiod_line_bulk_add(&bulk, line2);
    gpiod_line_request_bulk_input(&bulk, "test");

    // try to read the IO lines
    retval = gpiod_line_get_value_bulk(&bulk, val);
    assert (retval == 0);


Refer to the test cases in libgpiod/tests/tests-line.c.
e.g. the request_bulk_output test case.

Btw, the primary use case for the bulk is for when you need to perform
operations on a set of lines as simultaneously as possible.  The
downside is that they have to be requested at the same time.
If you don't require the simultaneity, it may be simpler to request them
separately, and operate on them separately.

You might also want to consider looking at libgpiod v2, which is the
latest release and has a new API that is hopefully less confusing.
The get_multiple_line_values[1] example is similar to what you are doing
in your example.  You can use gpiod_chip_get_line_offset_from_name() to
perform the name to offset mapping, if necessary.

OTOH, libgpiod v2 hasn't made its way to many distros yet, and will never
get to Raspbian Buster, so you would need to download and build it
yourself, and your kernel may not even support it (libgpiod v2 requires
kernel 5.10 or later).

Cheers,
Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/examples/get_multiple_line_values.c
