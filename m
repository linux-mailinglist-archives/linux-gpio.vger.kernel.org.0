Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D646134A6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJaLlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJaLlV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:41:21 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A44E0A1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:41:20 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id g26so5125804vkm.12
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cBcSksS8QFwQnqZeObvYjM3vXqDB+oyqBfgp8l5uTKE=;
        b=ZX2O6exB6JqIIG9FIBET5jpN3jdYZsNiSZ7g7AF3EJBtqfDgB37KQ7et97La7k0GNh
         wufxzhEUSDUAUakfq3DNJMiLcR3GaxcSUzNamfjeVfSw7ln/qCw4OjrFhHWs7KYz6kFX
         DtQb4m/7kCvILZNOrPyVcemXoCYW+1IrJqtqBjEaeymbNHjEYIGILT/9SvbGj7bixmLK
         w0C3tbYcwPidlOBNRsmdRyNYgVdlmYLu2fcUetbLKvGJOtHaRn7dDs2QhRU7ArfMC7hf
         Z+ncbBE1ijXSInPH79EM7cebNBBGkUjGAAeU+tqtOy85A2hv2fjiEJbHgSaz6LVP3Z23
         dkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBcSksS8QFwQnqZeObvYjM3vXqDB+oyqBfgp8l5uTKE=;
        b=7QWhQ2IMUv3EHvy9d8bwASZuzj44lnWs1jdLgx9S4KuPcVMN1GE/UCHldF0MFDXRVH
         bNKiINtek64c2jo1ayOuDjaJ/oVnmgAEin58apc/0TlJjuPDQ9ZabNPZOyZm1fTHGVRO
         ZTOYAKBtFm8pQsreAKDZDGDkoXXpEPHduKPN9iw4TUi54m3sP1wYH7ZfQ6HsQ2PcrDYg
         h9PWpwhpiiIhi0e+h4F0559jarDg5oe1OYLXuwmo5xxBxfhr+dx4P7u++G3dFAi+JUBs
         avkzfQ7FxrPIf9HwP0p78BuM16cMqN437AQJtf7XxgJ9+huqNiIx6OCSCVPSq6aBQO1u
         tWog==
X-Gm-Message-State: ACrzQf0pWNSs14G9k/49v4Q+hkQQAkC9V45+WvgicKcOpvh2Jgaqk3Fu
        hiffvvLuhmgbAXfFQ7zknHid8x1N2L902k1V+TUtoDAemSE=
X-Google-Smtp-Source: AMsMyM6duu03NXWlXFSY1AbZHtfLzPW1LLBEoiEfGsEKOuJCT2h8bqis0YeVVZXa/HGZG1UpUPpIAQdJ3NnbNUPvYFM=
X-Received: by 2002:a1f:2455:0:b0:3b7:88a4:c121 with SMTP id
 k82-20020a1f2455000000b003b788a4c121mr4199640vkk.1.1667216479358; Mon, 31 Oct
 2022 04:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221026123425.498912-1-brgl@bgdev.pl>
In-Reply-To: <20221026123425.498912-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 31 Oct 2022 12:41:08 +0100
Message-ID: <CAMRc=Md=RC3JO2OHZQb=yZ91DXiGyW-SkJe4tkmkSzveqG4dJw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 0/4] bindings: implement python bindings
 for libgpiod v2
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 2:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This is the fourth iteration of python bindings for libgpiod v2.
>
> The code has been split into high-level python and low-level C layers
> with the latter only doing the bare minimum.
>
> The data model is mostly based on the C++ one with the main difference
> being utilizing dynamic typing and keyword arguments in place of the
> builder pattern. That allows us to reduce the number of methods and
> objects.
>
> Because python doesn't have RAII, unlike C++, we provide a module-level
> request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> could lead to the chip left dangling even after the last reference is
> dropped.
>
> Because python forces us to dynamically allocate objects all the time even
> for fundamental types (which are also immutable) there's no point in trying
> to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
> just returns a list of events.
>
> v3 -> v4:
> - use list and dict comprehensions where applicable
> - add a helper for detecting GPIO devices in examples
> - remove commented out code
> - fix whitespace errors
> - cache chip_info in the chip object
> - rename Chip.map_line() to Chip.line_name_from_id()
> - disallow repeating line offsets/names as well as offset-name conflicts in request configs
> - don't modify python objects with GIL released (self->chip assignment)
> - fix type conversion strings
> - fix error check in request_offsets()
> - fix type comparison warnings
>

I applied these patches, squashed the entire libgpiod v2 patchset to
preserve bisectability and pulled the entire thing into the master
branch. Let's continue the development from here. The new release is
definitely not done yet but let's just have some solid base to work
on.

Bart
