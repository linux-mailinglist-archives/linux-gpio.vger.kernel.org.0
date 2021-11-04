Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EEE44565C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 16:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhKDPdb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 11:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhKDPdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 11:33:31 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB35C06127A
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 08:30:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id o8so22724100edc.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+COtvf8+vi8Ame9eqBQdGnMVyl2IED6RewYN1F2OFg=;
        b=4Xsh4IK7kDExeMBYlvtxlMszcSU6a4MlzPyPm4CsN9rtwJ7HXYq5rqALaIX6A/Wa9+
         MXOpvuKYqadDBfUO6fIX5zXQ70hPcpf+xLl4YhPG4xKmA4ifJXiOWrA1uIYhTEZtLbB2
         B35meMFcG/E5ZGLLRaJfMrf3bD1tbGJzt4aTsMPnKg1z4FbTCq/ZlAXW8PVoTBwCgKMB
         fBJtFVmo1y5F/lC/XrSmUMnhRSlSqPjUKk0nb7GGVCqE1qZlo6/0saCJkGYBK6GqfKip
         nLB2HjACKV/qPW88gXdLmoyGh855xX+3MbXFhZ/DYAd+fnBxKUcu/mI+BgrH7pVEdk15
         663g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+COtvf8+vi8Ame9eqBQdGnMVyl2IED6RewYN1F2OFg=;
        b=5wBjXKn74V7N39nDVTAdnOH5DZsfBJj5DOVN9pEsSjqNT1SlQ2CkmZTqdMonlKxjaX
         VgRLXatHjYsQkTkay2OSeC2rcyWH0FsAsZIIVlWxl3hcAuPtakzA7rUM+Xx0N1pUxT1n
         0gRUN8eGLeEtw8eGbjlp2BgGWmDfzMUEE18tpUZUmUp83oHMnZLhIVyjuYM8a/8Vun5y
         2JhpmfYP2fCO4jPN4RrwGxfy9SXePT790NeLRunFpkSYqMkF1Yj5HnIlb9XT+FltXmSY
         fieLAmyrXVfEtSxLCrw600EONURdY/Av90WpokwBHNupDMdDSXUwdzs5/lkm3Jmb/Lo1
         VeNQ==
X-Gm-Message-State: AOAM530K0kfZG/eqETXvmsswFyV3/PmDG5D1XSKA0xOpE11PcnpPZ0OQ
        umyF1jb3CgSlnay48q5FuiNtDQdEJ96zxbypiIY0sAtWUVw=
X-Google-Smtp-Source: ABdhPJy2UNzo37eDLa95hvWTCuRgJWES7H+FIc7Pf6QWBH9kQXR3cSgC7tpos9FO1y1FCzGDSQXU0sxJSRS68l6x7p0=
X-Received: by 2002:a17:906:5343:: with SMTP id j3mr63319978ejo.538.1636039836026;
 Thu, 04 Nov 2021 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211016141839.45460-1-joey.gouly@arm.com> <20211016141839.45460-2-joey.gouly@arm.com>
 <CACRpkdac+NYMSHg_KCb2xQpnFaJMBfGT_7Mk+Kst1WrK9As_ZA@mail.gmail.com>
In-Reply-To: <CACRpkdac+NYMSHg_KCb2xQpnFaJMBfGT_7Mk+Kst1WrK9As_ZA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 4 Nov 2021 16:30:25 +0100
Message-ID: <CAMRc=MeXf9wxk6=b7WnjN_Rb5fB3c8g6suo0A830Npc5-dhWVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gpio: Allow per-parent interrupt data
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Joey Gouly <joey.gouly@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 17, 2021 at 12:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Top-posting because I need a nod from Bartosz that I can
> merge this patch with the rest in the pinctrl tree.
>
> Bartosz: I can also offer this one patch in an immutable branch
> as well so you can pull it in as well.
>
> Yours,
> Linus Walleij

Hey! Sorry, didn't see it. Yes please take it.

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
