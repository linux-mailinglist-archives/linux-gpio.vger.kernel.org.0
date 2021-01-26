Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9FF3041DB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392749AbhAZPF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406085AbhAZPEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:04:24 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6988AC061D73
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:03:44 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id e18so1778253lja.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KecQmTVET4kmmQb+nGX7vlSRx0qisPRYWkX9lTkeJwg=;
        b=tMxc7G8wt7liaMOEZUYsU792Zl7DIEWinvwQf01g4C8G/gktlKtYPlb7aVD62qQ31+
         TPPtTaUtCo2l4J5uChJE5wyRijakGYaqqa2MQs3sXeJ6yGWOfzqclxWdEx0HVKMfFDYG
         oHiR5NSBEyR/jx33tUPqlH/vW44cGk0fPXHXZR9gjcaG5aOHK3z9o1IukaoSzqdmfbcs
         jxHfV5wr5/guFDlOmSiARfMcRXavnjpy28Nr9/iIWcrppMd5sTTUSMCd9KS+yvyA13U+
         DaKco1PmEy5DWKAzQVVSEZzTVyl92U1eFp5S26ttUknDtHEL3FVabupf6FM2hcu1x8Yw
         7FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KecQmTVET4kmmQb+nGX7vlSRx0qisPRYWkX9lTkeJwg=;
        b=mAvTM1vod2s3VRiAjCsc0zC2GM6Ukf0oJtGNHBHDtcENHObJe6eGPNR7VQYUaJTj2W
         YGb2XWVh2XcMOfVfQHDbhQmtme/hK0cC/ZyHheQcHBRRFVWuhPfb8XnX73CgTlmMA/y7
         zFvZlTDmEvNf7qR5TjvTNO0dTcCmXTn2d9fkz/VB5apUDQokZc3cfUJpEEOYDBCId8qX
         SkbC6BvBvEtTtPkatHIDbtpW6sFx2KCwF27cXOx97TU3VztQeP7qfOxYEsYuCGuDB905
         rm2Gir4UID0RlWWskTIKVd2i2MiAm8HiMayTZYfq2hPP88f93ps3SOifU8e5U36s4MAY
         rY0Q==
X-Gm-Message-State: AOAM531JrOjv0Sy6jN/wMFYUDltMoywSmJqVkLqJDNL1xN9QL0DN8VPi
        ubgiPWLT+o5M80fPp9P5lcqJqAZX5Td8/OmTwpoZgvEmWQB21Q==
X-Google-Smtp-Source: ABdhPJwG/6a1Su0120L5C7R1KMmFNO61Pb5eFJNnzViBU06i6BbRAEw7ofQUlMC7EP9ZRYICO8aQcEMFWBxyALLM+7A=
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr3186242ljm.273.1611673422964;
 Tue, 26 Jan 2021 07:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20210119062908.20169-1-liu.xiang@zlingsmart.com>
 <20210121164013.cqfxvach4ugkohm7@gilmour> <CACRpkdb1gn2e9=ip6ipAwW27vmf1FCs_y1Z=w-K8y8Z9MXVBMw@mail.gmail.com>
 <5c4b7a8c-c549-43ae-8ec6-5ae3ed26d321.liu.xiang@zlingsmart.com>
In-Reply-To: <5c4b7a8c-c549-43ae-8ec6-5ae3ed26d321.liu.xiang@zlingsmart.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 16:03:29 +0100
Message-ID: <CACRpkdaJQcuWwS2g4UgRpWb+iHYSmWoNj6gEsvGwtPZq+aJBbQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix use-after-free in sunxi_pmx_free()
To:     liu xiang <liu.xiang@zlingsmart.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        liuxiang_1999 <liuxiang_1999@126.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 7:31 AM liu xiang <liu.xiang@zlingsmart.com> wrote:

> > Liu can you make a patch to Kconfig to just select REGULATOR?
> > Possibly even the specific regulator driver this SoC is using
> > if it is very specific for this purpose.
>
> I found that the regulator driver is related to the specific board, not the SoC.
> There is no board config for ARM64 SoC like ARM.
> Is a good idea to select the regulator driver in the pinctrl Konfig? Or just
> select CONFIG_REGULATOR_FIXED_VOLTAGE to avoid the use-after-free warning?

If that regulator is what the board uses to satisfy this driver then that
is what you should select. Write some blurb in the commit message
about what is going on.

You can even add a comment in Kconfig like that:

# Needed to provide power to rails
select REGULATOR_FIXED_VOLTAGE

Yours,
Linus Walleij
