Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B85427FB18
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 10:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731584AbgJAII6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 04:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731564AbgJAIIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 04:08:54 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CE9C0613E4
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 01:08:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so3849215ljk.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ff4hExkz2WXqIZhrNFJUOw/QUJEIt9Wv/JOQCp/S8Ok=;
        b=MUxe9zoMa5NNlJUAdNlvf769rYY6GlY4E4L0jUOfoIdXhbmfejkla1ebGNQYKgi5LA
         c+SuYjPyPksDsnsmtsCSW2fmOa1zSWeKVttotBhbzgXJB8l9wI8tJ3uNMbPQJgHVHycH
         3DLlw9fcP6AvYq1wJfWTdrl5t7dwtmZY548EO36wcUhlKxdShEdZiuudSgqff75XH1ti
         je1dBzAetYGpXxO/y5cdvzNzi2AhxHIA7RhIzda0E6i/3Ng/wHB03qR/gPVh1jGDQ+lo
         HtmAa7FFRTldnBdFH9qYOZqmR+vVd21fouuUF1cgifDZajNIZbhT/iQv9mpPGbakxCX3
         UV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ff4hExkz2WXqIZhrNFJUOw/QUJEIt9Wv/JOQCp/S8Ok=;
        b=PAnHTkjjzhFUu7W5fGJlSVRis8ecFEl4t3JNgdiyT90cXO4/288doNKesMpAfKH3M3
         7QNKy57ybfzC29mFFoOU7opo4tENAAFkhZpSCPxclRWUx9DNewd4UGE/w++B4LtiYh1U
         /PgQToTZB6oELGJ3qPcu3m462jphTtXyNPYjY5nhBQdkKqYidH7aec8W96IlQNO2fVC1
         rSQpG1ZiWxpAW+JPEgl7Hfmr/DfyFDSZqckuv0xrwUkVg8IWNCrNEdyVWjJQLC8Y6sNh
         /p7+jAqQwcCiM8kPzl1jjnFr2FUoFfjy+obFR6hACuds/7h6v+0gpTG48JoPuxZGEeQp
         zhbA==
X-Gm-Message-State: AOAM530tznby+gTVz9d+gPBzKHRrW1JYBiLTVbZDQizWLmWwEtVSXuOc
        h05Ar8Ty7LGlYaBWCC0AZbY8Tr9r4aneX7sGdHnJIw==
X-Google-Smtp-Source: ABdhPJzDkVUGg9WfGTzYWG5+ZtFrzBuwlNRv9pkd5A9Rs6JoC/K4ru+pUvWnaSbcTKU84PzOsuPpF29xrSoJukzaiXY=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr1858863ljb.144.1601539731046;
 Thu, 01 Oct 2020 01:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200921225053.4126745-1-drew@beagleboard.org>
In-Reply-To: <20200921225053.4126745-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Oct 2020 10:08:40 +0200
Message-ID: <CACRpkdb3J8y8jy9RVgY5J1ypEs15dDU7pcaEGdk5okrydTvmKg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am33xx: modify AM33XX_IOPAD for #pinctrl-cells
 = 2
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 12:57 AM Drew Fustini <drew@beagleboard.org> wrote:

> Modify the AM33XX_IOPAD macro so that it works now that #pinctrl-cells =
> <2>. The third parameter is just a zero and the pinctrl-single driver
> will just OR this with the second parameter so it has no actual effect.
>
> There are no longer any dts files using this macro (following my patch
> to am335x-guardian.dts), but this will keep dts files not in mainline
> from breaking.
>
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-devicetree/20200921064707.GN7101@atomide.com/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

I didn't get a review tag on this one, Tony is this something I
should be applying?

Yours,
Linus Walleij
