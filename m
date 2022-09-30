Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04085F0305
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 04:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiI3Cx2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 22:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiI3CxZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 22:53:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02F21005D1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 19:53:24 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n7so2845501plp.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 19:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=jIyIZPySiwm719jfir4fcdaTvaGcPEldFMQ+zmFonSY=;
        b=mTP3n4BLzCWgqkgGs4X54nkOB9wsMwAEECTO9jj2Exk/7dfUdcVp9udyAZr8ImfSme
         pax9P8fo8rk4QbSj1fg7rcTTAgZvtXczzCWbD4DeNZWIwoqpD4xylA8YblMEBKEz6vf6
         lshdMKp3s+qnfJUvzLyjxZFLSmq2VzIQXwfLbFbDKJVX9maI8T4x93Qa4AggWnsS05cB
         e/ARDbiNRv978DzEwc6BiyeC6xLVncw67/81qa/HNFoDOeuT1q4+oqNfcCkrQuX0ibSX
         GjaOshC0bHs5eGz34jRJe2mT523fp8HLrPnhG8Bv8oTAnwyuCRvjYUIOD9yGHJcy7EDR
         0/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jIyIZPySiwm719jfir4fcdaTvaGcPEldFMQ+zmFonSY=;
        b=AR5jkFdTO8yJxkpU9zIqbeYnlwSF3VsxQi0H/VUnkmqEvcIRkI/G7c8sNrXbKc38sg
         5IqWYQZoLkRvF4l1wvypNoxWwaYOjDiNJLSGiTpEjI6bKRX7ttLiBIoKJ2abx3ygv3MP
         jL6DBl6TyipiZcI6Ci9yhPda7n9QtNNxiDedY/r7ttzLCHuCFEuRHpDgEqHoDGtpD7G8
         kCp5Lvh33X9cK2V6BvEQ6yZnsWK59evtHPHu/zMyAjKz+vdG4lenY+e42s/s900P+/dR
         1kt9ZwDocbEnmRq9uR1uOeiZZZG6I1fo+UXgybb4zDLJCL6utnVIOIql16tApyWFITA5
         +32w==
X-Gm-Message-State: ACrzQf2V5r6uPfrfCNjIeys8Yz+7+ZjeeVlr+SBZ3FGC1z8nRc/gFXHX
        4ZYyqG/YWNDJj3BHbkNnUcI=
X-Google-Smtp-Source: AMsMyM5/z6cOycJ1d0C6EeAam+kgd9NqAqyUG+ILhZss8JXuCm7XwZe3VHn+opfa1KJJw5LnVAZ77g==
X-Received: by 2002:a17:902:ce0c:b0:179:ffc1:eb1b with SMTP id k12-20020a170902ce0c00b00179ffc1eb1bmr6521435plg.41.1664506404007;
        Thu, 29 Sep 2022 19:53:24 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090a0c8600b001fd9c63e56bsm4189885pja.32.2022.09.29.19.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 19:53:23 -0700 (PDT)
Date:   Fri, 30 Sep 2022 10:53:19 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Mark Locascio <maldata@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Either a bug or a misunderstanding regarding bulk
 operations
Message-ID: <YzZaHzKyOPc1WFz4@sol>
References: <CA+8QDpKHEm6UZBRUSsuo+K62MROLcLRqbOZnB9D6qionsD5j5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+8QDpKHEm6UZBRUSsuo+K62MROLcLRqbOZnB9D6qionsD5j5Q@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 29, 2022 at 08:13:36AM -0500, Mark Locascio wrote:
>   Hi,
> 
> I was working with libgpiod and I noticed some unintuitive behavior. I
> can't say for sure that it's a bug, but at the very least, it's
> confusing, and I want to get clarification. Sample code is attached.
> 
> Let's say I have four lines that I want to use as outputs. I can
> request them all at once like this:
> 
> struct gpiod_chip* chip = gpiod_chip_open("/dev/gpiochip0");
> struct gpiod_line_bulk lines;
> uint32_t offsets[NUMOUTPUTS] = {6, 13, 19, 26};
> int get_lines_result = gpiod_chip_get_lines(chip, offsets, NUMOUTPUTS, &lines);
> int32_t values[NUMOUTPUTS] = {0, 0, 0, 0};
> int set_dir_result = gpiod_line_request_bulk_output(&lines, "testgpio", values);
> 
> And then when I want to set new values, I can update the "values"
> array and then do:
> 
> int set_result = gpiod_line_set_value_bulk(&lines, values);
> 
> This works exactly as expected. However, I need to maintain an array
> of the current values of all the output lines. If I didn't want to do
> that, perhaps because I was wrapping this in a function, I thought it
> could make sense to get a single line object from the bulk object, and
> then just set that one value.
> 

The line bulk are "Convenience data structures and helper functions for
storing and operating on multiple lines at once."

They are intended to operate on all the requested lines at once, e.g. so
the lines on a bus can be switched at the same time (or as close as
the kernel can manage).
If you would rather treat the lines separately then request them
separately.

AIUI, the purpose of gpiod_line_bulk_get_line() is to allow the user to
access the results of a bulk operation on a per-line basis, not to allow
them to perform per-line operations on the bulk.  The kernel API requires
that the operations for a bulk are on the bulk, and libgpiod v1 doesn't
keep track of the values of the other lines, so when you perform
operations on the single line returned by gpiod_line_bulk_get_line()
libgpiod assumes that it is a single line operation and only sets one
value - which the kernel sees as being for the first line in the bulk.
The remaining lines are zeroed.
Not sure if that is a bug or a feature, but that is my understanding.

libgpiod v2 [1](a WIP) changes this part of the API completely, and IIRC
does allow sets on individual lines in a bulk (now referred to as a line
request), by tracking the requested values for all lines in the bulk.
I'm sure Bart would consider any patches for v1 that you would care to
offer, though at this stage I would lean towards documentation
clarifications over code changes.

Cheers,
Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git -
next/libgpiod-2.0 branch
