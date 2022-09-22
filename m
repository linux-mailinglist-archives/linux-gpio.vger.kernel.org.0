Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2D65E624D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 14:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiIVM0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 08:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiIVM0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 08:26:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FB5E62F2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 05:25:56 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id f20so13325832edf.6
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/PjpMX8El0znu8JAb8c2e+2sbtRx4mrTa73fwrCY5d0=;
        b=TmOf9ECpudOT9Po43JeX/e9xsIpX6hHL2NwfTiww7q0R5EnCi/nvgdFisFGH/rm+bj
         lZaUUPB+mGuEsg6OURvtzQ5uczuKgDzduNMdnDR/M4ad761Ji0XNQkkYPmf8s7Ac5Uo9
         8MIb00T8EHHWZVtkxcu7ZGw2ghaBQykorfXWFtxQjdVZR+LzGFxGDGmJYA4PCyf0XC9v
         H4uYtWkz5vyRiLrSM+cJY0TVdttST2Dy0740071cZ0WOxwbWilMfgYbjYjxRFfJfLOCO
         oL5keF+QWs9QWYnbURQW6y8H4HF4NlTuUbt4YWG+TK2r6Yrk05WoVjKOh0CHEuqn+/NC
         CcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/PjpMX8El0znu8JAb8c2e+2sbtRx4mrTa73fwrCY5d0=;
        b=SizKx3SOZJyYOXffyTc0r1vwbJ1eQW1d2qf+fvRp/6p83oxI3xIMUwaR023JCUMOWu
         dkWWg1cLSmxBQ+ws1cksV36A33Wz69pORMmzIWDQfC1IxSua/f0EGomKjwWAo+bjDH0h
         2RomyaETHOeUG7fVDW8Ce8yGcLRwe/LLuS0KM8ab1Z2/uuseb/bxYzi9Kbb8WanMHRRy
         GxVlTPo+mgx/rCSALvb6V6mFFgoy4g2txn86/fLEuVgVKRUpdia+cTC0d4DqNF97xaaK
         t/cZklOuWhiCM4V+gIOoYCMvLkBZo8ZTAY4bRZwJyGCxNHtAeBhakcr/wMtgOqD5IUJn
         D4kg==
X-Gm-Message-State: ACrzQf3rkzcgtLRsS9c4hG0FWvCmySTq6/Q3yvnBYRo/XHldC2XDLAKa
        uxN/1hGxo9c9/TzeFUOcozf4jQjp4SgDoW6f/szROA==
X-Google-Smtp-Source: AMsMyM5Mb6gMLs+GmklPwIA9gTXVe7d1WidCmCVdfapvf9t5gGcMAz5AhnnTlM2Iy2ZaVJYm8r36EYSz9s8tVNF3jE8=
X-Received: by 2002:aa7:dd02:0:b0:44e:f7af:b996 with SMTP id
 i2-20020aa7dd02000000b0044ef7afb996mr3077248edv.422.1663849554574; Thu, 22
 Sep 2022 05:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220913161407.63472-1-brgl@bgdev.pl>
In-Reply-To: <20220913161407.63472-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Sep 2022 14:25:43 +0200
Message-ID: <CAMRc=Mfj74JKgQNcYBySkpU_CXsA1xcPAEYa4YaKdH6TTvOktQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2] treewide: rework line configuration
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

On Tue, Sep 13, 2022 at 6:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This tries to get rid of the concept of defaults and overrides for line
> properties from the library (or rather hide them from the users). While
> this makes the C API a bit more complex, it allows for a more elegant
> high-level interface.
>
> This patch is pretty big but I'll just give an overview here. I don't
> expect a detailed review of every line.
>
> Low-level data structure model (as seen in the C API):
>
> We're adding a new structure - line_settings. It's a basic data class
> that stores a set of line properties. The line_config object is simplified
> and becomes a storage for the mappings between offsets and line_settings.
>
> We no longer require the user to store the offsets array in the
> request_config. The offsets to request are simply those for which the
> user explicitly added settings to the line_config. Subsequently, the
> request_config structure becomes optional for the request.
>
> In C++ bindings this allows us to implement an elegant interface with
> rust-like chained mutators. To that end, we're also introducing a new
> intermediate class called request_builder that's returned by the chip's
> prepare_request() method which exposes routines for storing the line
> and request configs for the request we're making. For examples of
> usage - see C++ tests and samples.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

I merged this into next/libgpiod-2.0. Same for the gpiosim rework for
C++. I want to progress on the python bindings front, get that into
master and apply the tools changes and get those Rust bindings in too.

If there are some issues, we can rework them later when doing a new
API review before tagging v2.0-rc1.

Bart
