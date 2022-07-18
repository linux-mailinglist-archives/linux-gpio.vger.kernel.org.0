Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05FD577EBE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbiGRJeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbiGRJeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:34:02 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4801D65A9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:34:01 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31c9b70c382so100693667b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oq8BD5uaI4viYc10hO4H699VTGWEnnEzA4dzKhdkBVc=;
        b=j3v2aNshcROHM6TEQNF2F+FGznJAAuFaMy1qe5h7Q8OBHg/UUF/13Z5IhAK5/b65cW
         +YtdEGyRJaj9WNgtRkr97cxDY8vY0Y/hzaVybMYS83Sx6aKq5Gh+CM2aw/gcqI/9WvDJ
         n4DN7Xq7cfdCawPn04GJA/uwvAOfglFhReBYe0sqdItznEFirOW55MV9SKSqcyNFuj/x
         HF3yRg5kzyt0lE602eLn9JiPVjLyudeZKpgBWNtrGDDx78P1CFq1P/05p7gVEtBm/csm
         bDW4gNrTJSoCHqlGy1nzlW+XWWPuzSpFzAk0mw1hLN6lGFZBEjoVHD+wBYRlmeJRH0GB
         eI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oq8BD5uaI4viYc10hO4H699VTGWEnnEzA4dzKhdkBVc=;
        b=IeSwIgzypjAl8VzZDCN6/8tKXMsrJLuoG9XveIZvUMOHlAlx69jOeiRxrXt2NNXUbC
         gcCN4ME8TBRdd69VDsbnBJmxwHp/wuzbSUPzXZAXIKv9MS5tk+pj7GpB6DRF5qyHUebl
         64LAdLf8eXPVqhbtqLNJ4T/+I6AHaP6cRNLwPyJpNTX8VLOFRykfbv5Vz85uBwFN2bo4
         +eDwSXNq0vF347rhDnZJqvnLddFP2XyUVDE0SMX1DQaTyOA0Lp9yGzScAUFvw1iDoMmi
         upedm+y/O4c4fg9iLBpX2rT1z2NtEzRvhfcmfMc6QSGJ2NNxCqa4kk3EP1mopUqJaF2P
         GBXQ==
X-Gm-Message-State: AJIora/NhoLZcC8va6thp+gZ156ip9wIsS3THMyZ5eesi+lk7f7TdTcl
        7bKrqWsuBj3AJKOFMTKhLtTBPhews9IWv0Cc0461Fw==
X-Google-Smtp-Source: AGRyM1uuDwiKDzgnelXL7TUDrzFwW2mfg7umLVn/MGacJpFtzGxQmOxf503RN2/PwbngLe9Fsl6A57s+V0TfeRPpVQY=
X-Received: by 2002:a81:5b43:0:b0:31b:aed2:f563 with SMTP id
 p64-20020a815b43000000b0031baed2f563mr28978731ywb.115.1658136840547; Mon, 18
 Jul 2022 02:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220714020319.72952-1-warthog618@gmail.com> <20220714020319.72952-6-warthog618@gmail.com>
In-Reply-To: <20220714020319.72952-6-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:33:48 +0200
Message-ID: <CACRpkdZ5O7iNOaJgq5D8hpQDO207DsQkqjRu_m1aZSPy5_qoJA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: cdev: consolidate edge detector
 configuration flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, dipenp@nvidia.com, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 4:04 AM Kent Gibson <warthog618@gmail.com> wrote:

> Combine the polarity_change flag, struct line eflags, and hte enable
> flag into a single flag variable.
>
> The combination of these flags describes the configuration state
> of the edge detector, so formalize and clarify that by combining
> them into a single variable, edflags, in struct line.
>
> The edflags is a subset of the GPIO_V2_LINE_FLAGsb relevant to

What is that "b" at the end of GPIO_V2_LINE_FLAGsb?
Oh well no big deal. Bart can fix when applying if it is disturbing.

> the edge detector, and is also a superset of the eflags it replaces.
> The eflags name is still used to describe the subset of edflags
> corresponding to the rising/falling edge flags where edflags is
> masked down to that subset.
>
> This consolidation reduces the number of variables being passed,
> simplifies state comparisons, and provides a more extensible
> foundation should additional edge sources be integrated in the
> future.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
