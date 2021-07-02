Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2593BA53A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 23:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhGBVtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhGBVtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 17:49:01 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D293C061762
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jul 2021 14:46:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a6so15229097ljq.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jul 2021 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uIGiDf2KoFoCdiKZITBe9Z0Y7zxgFpipo+5Evze6LFo=;
        b=t+XLQnzr6P4m9V9FLQwj4VXh+SJjOrtqSzok9vscy7W3LPjqTVZ0AA0olc+OgCpKnw
         3yM9CcXpXAFxUNmD5zTqSzpiN3N/a3sHSUbEKWMqar4lD/vRcUPH+a+k2fN4rTXv/BtP
         LBe4YqHLdXDcdQ4HK9PNFft99AHTAA4rd5tesPFjBQItcsudpZTsIpkXpgoTQ9D8GhfG
         3tVyCylZPXjzw+sa8i5UatOhYIJ+bETAnoUAAW+Z86no6HhyMfI7u78lwqD3EzjrxUgH
         TS6I6bCixGv5q/EG08/kuiV2csTJyOMHNZqC4REOgUjKkfAuws6+McLi/Ryk/qrpIshW
         D+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIGiDf2KoFoCdiKZITBe9Z0Y7zxgFpipo+5Evze6LFo=;
        b=T/SGKDgA1ZmubtWB8FUSXj/VZ4wYz0hxGrP3iV4CvOFqlIIlOT4Bnf5e8GpMuE2Upi
         0aaoqRaBd0MEniX+ByxMN6pjONVjruYFgrlGDwIHTjUIK1hRBs+CNoMLuDk2nhu1LOMG
         KJmLKvr5UUFb9mEEYr+ac7KCCLOftBP7YYtFBeTd+Hpdswtiu8j7v7uXzPowvAHIrv9y
         1lGksP+2LRs9qODnas9chPd/LAD+4ZieJGy6RIP3rci2lYqV1QQg3V5id9HI267+++3U
         q/e1otfvThvsRj6Scz+pjE4++Wg4B7Njtj9weCNq6JzIiZ1HcxsOj7ZmNpaXvTykF4dO
         ewFg==
X-Gm-Message-State: AOAM532a+3zs13Y04KwVok31Rat9lXuh74Xe0ao326Z/TszHFJS6G5lD
        ji60GGQtyY5WKcK/tU1tJksg7DYrJO+I8R2PtJSihQ==
X-Google-Smtp-Source: ABdhPJw8xFvVFmYKqnx+Ve97cw85+M1nnMSFpfktGQJBPUegkCw11tk7cXTuqgvzu2KCnBgXlh8ikOLGk51bI5vZ6kM=
X-Received: by 2002:a2e:82c6:: with SMTP id n6mr1235259ljh.74.1625262386896;
 Fri, 02 Jul 2021 14:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
 <CACRpkdY4bU=bEAyA5ZCx7PVF7nKoPSR7iv6x0t-QM6Bc6bc99Q@mail.gmail.com> <20210702104810.581438d0@gmail.com>
In-Reply-To: <20210702104810.581438d0@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jul 2021 23:46:16 +0200
Message-ID: <CACRpkdbnujCU1H6VmpyZ7p6bMFG0s8PzT-O4GetLUXA21N63qg@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 2, 2021 at 12:48 PM Vincent Pelletier <plr.vincent@gmail.com> wrote:

> gpiochip_lock_as_irq,
(...)
> Actually my question came from yet another misunderstanding on my side:
> I expected this function to act as an exclusive access control (because
> of the "lock" in the name), but I then realised my assumption is wrong.

Well it locks its use to be compliant with being used for IRQ.
So it cannot be turned into an output for example. While reading
its value as input is fine.

Yours,
Linus Walleij
