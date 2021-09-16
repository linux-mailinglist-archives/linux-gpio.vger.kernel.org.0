Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C00040EC6B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 23:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240515AbhIPVX1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 17:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240560AbhIPVXQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 17:23:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E89DC0613EF
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:21:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b18so22383810lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCWdjNx1tyfTuOxA33WFnltsnI9BaPgD2xX9ANb6iQM=;
        b=LLERr/poYuP2KNkCGTHCHiW3TE1k9xFlvEYL7Or6w1srOrRqfDR0FoVqCcMKPhbPQ+
         qoNntOPIZBLCpVuwkZh/S0fFCwvGbTaiXaBzi+I+iqAMEn3+fqx/CaoHF0madtuZQMC6
         XzCoqEMM5K1/hhbxxwhADguA/rZUU1Dr7OTeCU6KSpIljuvTVwaVuZJoCl6nkc0gs2qN
         jlCo2+mqIxe+ZUPKzGkNC/6B4QQq+rvB/QwMxoZrqGFMuTPDd22kT0tVWK6vOSqJUEXA
         oRn5nkMH6++jWrV6tk7tM8E9jBfmxXLvTXKVR6V1XrPlGh4gZc3DCUpL7rtMgKuIwrjS
         C2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCWdjNx1tyfTuOxA33WFnltsnI9BaPgD2xX9ANb6iQM=;
        b=JwfGl3m1sl7gSMFSQwjDR8piHA4r1Xmrg/bNye9GdQY1OkpWMFkMLSv8M/wVLK8+r5
         Oz93evpuDIc01rQk02qFJKyYCKqyonowCnzvwc7MLnn64eWaReHBotgcDc5L1WPJHzhn
         jlLEZ7aD83bOW+rdg/lefbTBWC6LXDLgA2JIag9dFVh5pB8RYD+dtewBSeHRLPvdpHs+
         DEf1HN+xmv26j3VczkyYLwp/MOYbJA454UhtKOtM1yiSjr9fmeozeTb6CYiLi3kD4Dk7
         tUhi4tYUVwTyA542W7uGTm7Nk/pB/EEWE4tN4jy58ze3iLRvOzhRoruPc+F09HP1VHed
         pOUQ==
X-Gm-Message-State: AOAM532013t39d8WZoaJ7ha0yE04l4pIlY9G+CxMjVCA+Ski8AmBLiiZ
        Wxuy5iKEyMB5savGpzJOE811XI/Fcs2V7xFzpvEQhA==
X-Google-Smtp-Source: ABdhPJybM19mqelDkBkwzCpVjUJCAtNVJyiwg59S/uwAdiyxpocBhlzf9ak+4D5WkA/BKBW89Bqlqahg4SzJM2/87CM=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr5561031lfu.291.1631827305443;
 Thu, 16 Sep 2021 14:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Sep 2021 23:21:34 +0200
Message-ID: <CACRpkdZEp0FZOefBPP_sR4g6rKzeKQhpdL-XHYO+CRt5MfTrYg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/20] Review Request: Add support for Intel PMC
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, bala.senthil@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sowjanya,

thanks for your patches!

On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:

> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Starting with Intel(R) Tiger Lake and Elkhart Lake platforms the PMC
> hardware adds the Timed I/O hardware interface.
>
> The Timed I/O hardware implements some functionality similar to GPIO
> with added timing logic that is driven by the Always Running Timer
> (ART).
>
> The Timed I/O Hardware implement 3 basic functions:
>   * Input Timestamping
>   * Single Shot Timed Output
>   * Periodic Timed Output
>
>  Please help to review the changes.

This looks very similar to the usecase proposed for the HTE
Hardware Timestamping Engine, proposed by Dipen Patel
for the nVidia 194 and which is currently in RFC:
https://lore.kernel.org/linux-gpio/20210625235532.19575-1-dipenp@nvidia.com/

Please review this new subsystem and see if you can just
make a slot-in driver using Dipen's patches instead.

Dipen: please have a look at Sowjanya's patches to see
if this hardware is similar to yours.

Sometimes several vendors come up with similar hardware
around the same time, because of industry trends, so I would
not be surprised if these two hardwares address the very
same usecase.

Yours,
Linus Walleij
