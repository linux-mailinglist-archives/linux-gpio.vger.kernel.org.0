Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE9639526A
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 20:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhE3SL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 14:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhE3SL2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 14:11:28 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C36C061574;
        Sun, 30 May 2021 11:09:49 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g18so7314646pfr.2;
        Sun, 30 May 2021 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hLjQuuU7Br7mOVEknufzY5JPJRA8OHMaOqf9oaCWSDM=;
        b=o2ymDcINidR25kdPktAXY54uXs+xGTrlDqQw70emRIhyYyUqNpaZQNdgB0N2/0oswA
         oKi86+IDpWzcp25BcDcUZ6OGs5wp88PxX2AvUMINK38rbPfGYt1Q4gzeH2AxXHRviyMa
         QzlN9nqKc0/eMLwjeikKP5ks0K/VGPXs+UucKnqsqdvz8ya0V+4CGjn/ydQvbunUziak
         iMUSVmtwZswvuMPwpLy2LlFi3dQoQ2RC+EJIYJ2VbAdbOB0JG74RxYDCrGcD2qv+ivbF
         Cj79Hv5k64/CjX8wo+VK88ioU0K7M/MIZw4/QOxlk+5N+YoW0DeDS0sc3PGdAYwj4ayu
         Imxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hLjQuuU7Br7mOVEknufzY5JPJRA8OHMaOqf9oaCWSDM=;
        b=MS84JHtUUROxxMrA8Z1+7nFcAcM0uqGOWLjIVwAQsOdEKIGgtH0sbYywZOZSQnai7l
         MXb+764Ot2/UzOoCfDQgPBLgPPRx00Wx1I2DS5wwpZZnqGJTe00TDCfXXxCw6f/lpemX
         XtO5jLC9fgRA6+nVqL6/u52n92pek+YmJTEqTg6FFYMagOrti6HNVR4q9xaQdzLeKNS0
         tNKPVHDL8EJpPrpEEagRvxjp44CZh/jyo2qznjuNoGu4D08XltvZY2B060Q6JuOt8iqq
         CUG04z8Ra6Sd4uw7CwmCrm3UZK0+W+YvnK9hseN5u1SQeFFm98suiIx8BVOS0bh1310F
         ocSw==
X-Gm-Message-State: AOAM531q5Q6CJ9pg2aafsAM6igRyMbWcGlyi+MZ8rlwLRZtBaBimRjKM
        ZBtRT/azCre18fdpEF+8vx3EabAIlklynZH16xs=
X-Google-Smtp-Source: ABdhPJxdAkjG7V5e5C9PsXDfh2Ibrg1o2SoubvaDD93gd05z8em9+1yH6g+Khq6uqyXTVg9Kz6jglkGpes6p9sV4rJg=
X-Received: by 2002:a63:b507:: with SMTP id y7mr19095862pge.74.1622398189041;
 Sun, 30 May 2021 11:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-3-maukka@ext.kapsi.fi>
In-Reply-To: <20210530161333.3996-3-maukka@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 May 2021 21:09:32 +0300
Message-ID: <CAHp75Vffj=8WKBO23iRxxFmva+SU5u58eBkZfMRyY6GG-6maXg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     sandberg@mailfence.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 7:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Adds support for a generic GPIO multiplexer. To drive the multiplexer a
> mux-controller is needed. The output pin of the multiplexer is a GPIO
> pin.
>
> Reported-by: kernel test robot <lkp@intel.com>

Is it a fix? Shall we add the Fixes tag?

> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>


-- 
With Best Regards,
Andy Shevchenko
