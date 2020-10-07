Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6567285BE9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgJGJbr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgJGJbq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:31:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA152C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:31:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a23so485049ljp.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZZrWrKujoAFMmf1DLSRO6/FD/g7L/54gCsjEBcTuK18=;
        b=krkBnti1eUSzArr/953tleST+HT8nwl8VH4rh/jOoqe3xUgUmb303Om8wmnr5jyhod
         Pbed0oHGRcduxLy7Eu9tu8mnshRa5mqUHaxlYBAd036agUTf0wnkghi2x6DLrclNpcgw
         HNb62yYWMGCYrTwENP1vtvJ0//3UogzYrgOaqPgOzlAMeP+nFzJl8jq5D18gzWvwSTbv
         bnnmjJJlia1D256kTZHn6eW6fYnofRp5/LmToJW0OMo6pLOMXBkJAIHPwFgcIuFQ6yP1
         5aUFvRqgkf+lTvLtXYK3EN5HVBk/On0huH/2VamqUKxSWqf6FlraSgTYAR4shIqYOAwR
         bQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZZrWrKujoAFMmf1DLSRO6/FD/g7L/54gCsjEBcTuK18=;
        b=Zwq+kCybE+0bcgD7vRkqDRMpTh0GSuhSdpQY1mHXNfcj0HbjyU+dito+NAQThHOrwR
         BuDPoYNuSEZWAh2PxqwP1SbXVlngrywjhRkedgVsO/d4SF7HwHQJaDTsKr6a4+BmO+ya
         ILnlea8Hk/46T8oQceHd97mxVsmac6lFjjGHrracv9WYfjdEp99eqtiy01MTTzUFaPZ3
         kHXq5BYKQaGJk3cEUssw9UOWsUD/8xyhcvIqmCmKoQ9UK4pd6iYMynT2d3INcu2m1yDV
         UBFYS7JfW6Je22VI9bDQlZEZfn3WklC579D93+hu2IReqVfPyFWs2btsjHwcGl+ycK00
         r1NQ==
X-Gm-Message-State: AOAM532G2r+6f5iMBep533TaVInxQLUCemzZG2i6F5NGcerIRqISPt4S
        wRmJ90d94CZ07fhh9pZ0COBIVUYwSHmz4g+aI4sS2A==
X-Google-Smtp-Source: ABdhPJzc2qVg8X3RXvzOUBa6ZN/mUY341RdBZuxbDiVTHvWj8BywXrvBpV/ifJfQXMBdT/DSj8gwZMWbAm9jWr8J05g=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr903017lji.283.1602063104338;
 Wed, 07 Oct 2020 02:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070246.20927-1-warthog618@gmail.com>
In-Reply-To: <20201005070246.20927-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:31:33 +0200
Message-ID: <CACRpkdbCF-qFJiPcZ_YpA-YOXVdVGocG-7CavorNm=9tB3+d7A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: switch from kstrdup() to kstrndup()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 9:03 AM Kent Gibson <warthog618@gmail.com> wrote:

> Use kstrndup() to copy line labels from the userspace provided char
> array, rather than ensuring the char array contains a null terminator
> and using kstrdup().
>
> Note that the length provided to kstrndup() still assumes that the char
> array does contain a null terminator, so the maximum string length is one
> less than the array.  This is consistent with the previous behaviour.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

General good practice! Patch applied.

Yours,
Linus Walleij
