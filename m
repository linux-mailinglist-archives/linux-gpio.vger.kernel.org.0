Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184A535EE79
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 09:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346222AbhDNHcQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 03:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbhDNHcQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 03:32:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E09C061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:31:53 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f17so24506975lfu.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WbCJhOcWDmYj1qwZOide/uEYp2/QdqUGeqpK7gU5Mw4=;
        b=UEkmCzKGaJsazs6mmRY+VabK8/Mt9QdsrWewnyGmU/499iBWgpxw0SmuNEDaJYScqL
         qjz0GyeonwO6xs9t6BZGNTs3psxvAqUSz3rRVAtD0VuDcwG+7LJQrwaZDaK9r26gCmLl
         y9yLY5BjZSMToDNtEaemSSKvxhIBXFY8R8PS+FjLvKCRg+skOPMSsbXZpnXpqtLdsZZt
         Ivn95tjtP0HVzu9A0ipZ51sQQwbID5brQ3f1R/0OP9ttzaPDzr/aR3Ew7atZiIWmOCYr
         /Z/wvwSC7H5X441g2Vx7KdnjI8n8hUe+kCGwC7/5VqhqWEU6d0uqgoRepl9PE4K3quag
         z4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WbCJhOcWDmYj1qwZOide/uEYp2/QdqUGeqpK7gU5Mw4=;
        b=eYpDOegKmbwIEYwDBUdi74Ign+Mpcl9oHG4W/hiHPwSyrpDYyFSSpimYZyKqYM1iNQ
         a6WPoY9nXbrEIghGCXNub96DkXltfOH9jaL4fPrKpHr7kbAFjdKuvDfSl+szxmnY2JGS
         MphzU3s5gd7DAFbqM9EvdAe2AGkd0n0sNRAZeVYu1Xyy4f7ZC4qe9l/GzQnPtzLd2qVc
         kV/ADMW2b+4iqmNqoJfal151BawK5G/ak0IMqGk1x+7gA7D8vKeaL5qBOYPukPLlXjQk
         pLeQVebeC9T100NR0wF81+BpEr8IrwPvb8v67nvCRFqd1sVh8OQO++wifXLBN6kIwJZl
         hBbw==
X-Gm-Message-State: AOAM5321l8O4jS2JhUeFEVihYmAaMwmEIHahRtnj8cHwaBetFzmCotzC
        DgVP1iCee1SkGI5bhDh3Y8gzGVKLBLTZag47oBf/nA==
X-Google-Smtp-Source: ABdhPJx+x7TylnXD2B+09y1EGeE+oRsHE7gssBzHshrKllUMut6lAV5p+osKaDALXEQRm5rFs1CBztB2Y7kU6U8eBkg=
X-Received: by 2002:a19:ef19:: with SMTP id n25mr17307222lfh.157.1618385512254;
 Wed, 14 Apr 2021 00:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
 <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com>
 <3262311.AJdgDx1Vlc@diego> <CACRpkdZeZuHe9kFywrdQxcNMfAcBCJVAhJjfyD6ahLinT0hvmg@mail.gmail.com>
 <CAMdYzYp80DdEp8LM7YkEUqmu-7WwhyTvFU4QAfGu9uimsE6rYg@mail.gmail.com>
In-Reply-To: <CAMdYzYp80DdEp8LM7YkEUqmu-7WwhyTvFU4QAfGu9uimsE6rYg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 09:31:41 +0200
Message-ID: <CACRpkdaYJ3qpwr6e+W-6141=tkERB3YGV9tzpazOj6R8M+Bt8Q@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 11, 2021 at 5:40 AM Peter Geis <pgwipeout@gmail.com> wrote:

> Thank you for the responses!
> With a bit of effort and a quick build fix, I've successfully rebased
> the gpio patch set to the latest linux-next.

Ooops maybe I should have been clear, since I need to merge it
into the pinctrl tree I need it to be based on the pinctrl "devel" branch.

Sorry if I wasn't clear, no maintainers work on top of linux-next,
only individual developers do...

Yours,
Linus Walleij
