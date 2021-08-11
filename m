Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5973E920B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhHKNAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhHKNAZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:00:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551D8C061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:00:01 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h9so4416820ljq.8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9raAqstWOInQ9wyq7hxk8+0JIk+Aqi4dpxjqntVgY9s=;
        b=hSt4vFrly2JM0QO77mUcjMzkwID5HUv9zx2/fnjGZpyM5NU5ocYo3MiAvNMAneOy5P
         9fF5ttXF7kO4BUFNtiD9aLc0q1fnZTSROd/MrBd8KHalQsmgjOt1NrImFI7Nv3PEPaOY
         l9TvpD7+X4OqMEMWbwvWmV2jUJ6Wbd1dACgStSNGjwebuJaGfSmcBkUfWPksQWcxURLp
         bfcTl0wo6llDCRyS0C8seQ9CsDRHz/ramTZS78J12PritcrY0Evmd1t17StEFFoATj8t
         4ayNtje9TR1YNPCb1/ay0r7QH7ME5i9rYhskX1ufGxq2cz1gdHrU0nJDO5REzEtejZ2g
         hOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9raAqstWOInQ9wyq7hxk8+0JIk+Aqi4dpxjqntVgY9s=;
        b=WTk17jbNysx8idyMckIzYlz7axYo64YhAt2iRaGxIVJgC8zFvVZ0IpvHT85l+F2B8b
         t8fFpwA1PSBKKLK5lNmZsTqOxVj+DzXlTbqlbxF8/KcQ25VcslXS6A26UgPd4eXmfKLQ
         NGQQfcWlyhiwOg5V0HEWFTNMdXrZ3zPQU5KJiF1feQunCeQA3gh/dhwhXUIQbPXX4/B+
         xlLoVFB/REpXmajVXnaTR7RSujZvKPQKWXWzmZKqTOxm6HJmXYwkpeT+JSYofYjJjqkF
         wlPsOwBF76cGbJkrBsnLIdvmTNabAr3dRaQUuB3904U7BA2miR6rkfvC49yfnP6UD2Sv
         zCZA==
X-Gm-Message-State: AOAM533CKVMUc+NcMFQiOCYghpqxv/UFldq4CgAIEkO0FpYMnbBRDDxO
        rHPT+kasDmPj19kppgV0AUDfwmE5UsoUKmeGugSLNQ==
X-Google-Smtp-Source: ABdhPJwV/uG/04abyCsQhn5zh7oybmy1PdQiJD1sQ3DMsjOyJF2lWHqAFGDKKUKrSqetQFxhFJMg7BK+lIkMfq08R5M=
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr23677504ljp.74.1628686799738;
 Wed, 11 Aug 2021 05:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com> <20210805174219.3000667-4-piyush.mehta@xilinx.com>
In-Reply-To: <20210805174219.3000667-4-piyush.mehta@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:59:48 +0200
Message-ID: <CACRpkdZ=WRhTTQOvQcDEQhbf5Fone0GHopZfJhsQfsS-NRQUUw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: modepin: Add driver support for modepin GPIO controller
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>, wendy.liang@xilinx.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, rajan.vaja@xilinx.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Piyush,

thanks for your patch!

Can you explain one thing to me: since this is now a GPIO driver
that means "General Purpos Input/Output", then these bits are
accessed like this:

On Thu, Aug 5, 2021 at 7:43 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:

> +       ret = zynqmp_pm_bootmode_read(&bootpin_val);

This does not look very general purpose. These seem to be all about
boot mode, right?

So can you explain why this should be a GPIO driver at all?

I understand it is sometimes convenient to describe stuff as GPIO even
if it is not (for example to get a convenient userspace interface) but
as maintainers
we really need to make sure that the subsystem is not being abused
for things not GPIO.

Yours,
Linus Walleij
