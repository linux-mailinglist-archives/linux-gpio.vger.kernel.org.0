Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A0C7105F5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 09:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjEYHJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjEYHJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 03:09:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AC883
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 00:09:32 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so509111b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684998571; x=1687590571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blF/vIorryiOobOOaf3AcnMZIZymPeBGyNeWIw2feAA=;
        b=sQ2s4mv3zQIop3gOXF6isroKQKf5ah8nez68ALVyGp8hBllmIXy9fYRiaJOKpqgTSa
         74l6ewpZVveyC/r9LRRzTTZOO/FzqzSJIo3IVhP20xofgR/AFkYpOqXnZfdqd3NKXfk8
         6VjppzlaJZHqNUbUc2GFGrC1drHmleWow26Xh/nlz6L62sA50ffcw9GApF2icRDH2veR
         doc1xB3n4rXq8NwmvaNFTTyofNU8X0Yd5UeKrt0TgdBXC8PT3htONK1gOIvvlBh16Syc
         n9akCNoSrZxcleLzU80oyetEGji/s21LCLNH5I4Gr/bp2x5elhzVRNYIh1HSkU1wtvEj
         j3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684998571; x=1687590571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blF/vIorryiOobOOaf3AcnMZIZymPeBGyNeWIw2feAA=;
        b=ZOoMHLbrTvTGX1pfn/Gwv8fNXvN28Xl3w6v3zPsEe/FUehnnUMvgdx9R2y6/5dZEw2
         uxZ6gHmGguySGvhNzG0DQxtVhU6j42Qy0P2WrJ9yCKk5EhIx90HwKklRcf7XeU+i/W3x
         JouTrqmS34thQGT1viT3JWL8Bqt3BTQr4j/5wIkjT7FChnfLF7GLnV6sJzJy87DpYzvM
         /3/bnkrceoWBvp9q3lwg6PGeiYtn1wcc1yh02yhdRlabny799RcHh6C2/030tbqd5csx
         KGwPZ7tUoaa0t7fWcHV7dMaG9AojdgIAKfMeL62dhZkiGxVvMNcZ4DvZWyEBUoSJssyq
         okzw==
X-Gm-Message-State: AC+VfDx18yiUx6ev9VbNH8sOf+0C9//CJmhfxTW3nNztd07/B7mmOZK+
        macvhz9ZS+p83U774lbkOAkFgnkE55M=
X-Google-Smtp-Source: ACHHUZ6iXnJWs25MyG/M7a34jJRdUL8UKAD3VTnGzc7apMc3MMHTDQ7Hrzk/SIw9IwVYXwJU3BDzqw==
X-Received: by 2002:a05:6a20:1446:b0:102:a593:a17c with SMTP id a6-20020a056a20144600b00102a593a17cmr2398786pzi.0.1684998571278;
        Thu, 25 May 2023 00:09:31 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id 18-20020a630012000000b0052c9d1533b6sm457514pga.56.2023.05.25.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 00:09:30 -0700 (PDT)
Date:   Thu, 25 May 2023 15:09:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZG8Jpjq/N97plOGe@sol>
References: <ZG7RgGasxXz4/pwl@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG7RgGasxXz4/pwl@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 11:09:52AM +0800, Kent Gibson wrote:
> Hi Bart,
> 
> In testing I'm finding that I can't read the RELEASED event from the
> chip fd when the last line on the chip is released.
> The chip fd becomes readable, but when I try to read it I get ENODEV.
> 
> I suspect this change is the likely culprit:
> 
> 533aae7c94db gpiolib: cdev: fix NULL-pointer dereferences
> 
> @@ -2425,6 +2449,9 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
>         int ret;
>         size_t event_size;
> 
> +       if (!cdev->gdev->chip)
> +               return -ENODEV;
> +
> 
> though I haven't bisected it yet to be sure.
> 
> Btw, that is testing on 6.4.0-rc3 mainline.
> 

To be clear, I happened to spot the problem with 6.4.0-rc3, but the
problem was almost certainly introduced earlier.

The problem ican be repeated with the info_change_events test from [1]

e.g.

$ cargo test --all-features chip

.... 

failures:

---- chip::uapi_v1::info_change_events stdout ----
read: Err(UapiError(ReadEvent, Os(Errno { code: 19, description: Some("No such device") })))
thread 'chip::uapi_v1::info_change_events' panicked at 'assertion failed: res.is_ok()', lib/tests/chip.rs:719:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

---- chip::uapi_v2::info_change_events stdout ----
read: Err(UapiError(ReadEvent, Os(Errno { code: 19, description: Some("No such device") })))
thread 'chip::uapi_v2::info_change_events' panicked at 'assertion failed: res.is_ok()', lib/tests/chip.rs:719:9


I haven't done a complete bisection, but the tests do pass with 6.1.0-rc1
- the previous kernel I was testing with.

I can also confirm that receiving the event using a blocking read() on the
fd still works, it is a poll() on the fd followed by a read() that fails.

I only ran across the bug by pure chance while debugging that test case
- previously it only did the blocking read.
So there is probably limited real world impact, but something additional
to test for, and fix, of course.

Cheers,
Kent.
[1] https://github.com/warthog618/gpiocdev-rs/blob/36e9c1640e2ae5c6e08d43cd0c254a2e7cec2d63/lib/tests/chip.rs ~line 649
