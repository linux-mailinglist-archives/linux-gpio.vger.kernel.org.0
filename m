Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1217034FAE5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 09:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhCaH5G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 03:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234137AbhCaH44 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 03:56:56 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11A9C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:56:55 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id k3so9886870ybh.4
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgUMXHodW4czfJMBWwIWPw31+/LFTP5qzOrrXtIPGCw=;
        b=Siv9O1/aTQJTOyFg1U8gNhaIBW8T+gXHDEXCMOZ2f/3rI2FvWEV9BghJoV768fl4qc
         eOopFW94WgxW3h+K4y5MaW8oVhFM7g/MjxwrFcTVqbJf5aeF8mrSUFrCBcwTZlUWHVyV
         B7njSXFqe3NUYw7qc/A4Zc5zkw+TDFdM2J7g0MNAXQBKJyojzTMb/csPbvei63oXB6m1
         lTxtyJMBYyVkN9X+fuYY1q0lpH0jVJN2005oGF10yvvBdICWKy10f19jdfWxob9JQtT/
         zMT73JClBXLQuzGhvOn0+Fbta9Y/ofAcXgG6ixJ9XlOFT2K5mCPOYt2EyhV5Cvs4ZP0t
         2AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgUMXHodW4czfJMBWwIWPw31+/LFTP5qzOrrXtIPGCw=;
        b=APvXmuFM2AunXrNrFT4Us7YiaxvZbnzzgfyg/uqXztkEeyo1F+ScPD0nJZ9V3IGMqh
         rZPzj2N/O+TRUlMsLMI5upqdID6Um4hL968gy4NqKFxtLVR83eJCIsAzzuPoIYpytT8X
         hZ4vEyR9nlPRHtl5atUWBvG51r8VKDzGfDuXiUDcvXSzMeGqA902MGtO4VBHlFJ80i9l
         8aHjNJkpzXWDZARwuFmi1ANFbx/t2vMT1Vxg7ufrLV4chALi1gB24yfG6NkOkwSrcePr
         NZrhtHEp+xKVm3Fpidl/QRMP1fhluOxrlwtwvqNvRZT1UzytlSZxel4ybDJdzEeXB5Rh
         zGiQ==
X-Gm-Message-State: AOAM530P/JSkbXFheADFQd0tP1MKS0ms6gH16VMwFvsFJeURoj5qL3gK
        ypXrmjuQ6GTGKkUhfTzx4BCD2ujldguGSDU25whBQg==
X-Google-Smtp-Source: ABdhPJwAe6p7zIWjynyOOC6a+3NfJhGUZjRoLUE0/8hsS4pKJyVaZq3xDAXiChU5+H6y8JagPw7lbs2FDJQYG4Q+M+o=
X-Received: by 2002:a25:768c:: with SMTP id r134mr3126449ybc.366.1617177415233;
 Wed, 31 Mar 2021 00:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com> <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:56:44 +0200
Message-ID: <CAMpxmJVKmBp06_2Hd4XF-eL4KfgZFy1o+xUvvs6H=TaAnkmYhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: Obey valid_mask
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 1:41 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Do not allow exporting GPIOs which are set invalid
> by the driver's valid mask.
>
> Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---

Applied, thanks!

Bart
