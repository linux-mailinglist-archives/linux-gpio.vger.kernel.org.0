Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3FC2AD766
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730617AbgKJNV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgKJNV1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:21:27 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34A1C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:21:26 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id v18so14652745ljc.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fvmdrHjEnYSfYwEFHbWu3E6GP9e3mtGxt3Sg0AJq41k=;
        b=V8VKUqNgVFUqdWj0+42YrvL6hxZqWLjsCSrmjSQhvcCwZYnxPYk9qfEQ+pPHhhOz2U
         NoUlNzAUt/LphmvmOLMy9/RdwM4rRa5NVHF8D5xcaR7waBPiCeNLDExsKCBVXqa84jwT
         mNqPHoiaJKIrjL4ETrIAlfhio3+ghFcJLx0e/SNPdhhJga9K07zBcQs53n2IfCTMWxJq
         ZiUd9lkEsk85xV35TNaFk64HBZdcMAvE55uDDyUi2p+c4a0xxh2pcqUegDViMCU7tfOB
         RS7xet0qQ8qfDBuuba4AGMSe2BUCZSRI7MN9AhBr65/zH09SJcpcbP3PCk1OaC1Ws9f0
         t12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fvmdrHjEnYSfYwEFHbWu3E6GP9e3mtGxt3Sg0AJq41k=;
        b=PAiUX82ggiHF6euww/wUHwC9gzEHX5lVDqVz9RvlXUCHInVVmRVI98wT+tGurb7QoV
         IYJQdNpPCxt+yPNStXXdY5a05Xb9jOpL34HPgiqC14yBkvFNDTmK0TEt4cb/GUL1bb3l
         tRfwAZ6e3WMcTjqLPjeG4RLufW0jaQzeQWEXWLFh0B/b0X1+hIVS43SbGqbld0BpKAHW
         zvrSRjeGND1oHBdh+M5O6IUBk7ZiDmB8XniGKCWLWVq9/+fKA/3FTXTrkOL/T70znIiL
         h1ZCRSrBYAKEYLCXd8HlnQF2P6YVo8ce3/C6ZjcLoHdy31nOfhueWATgZOh/TR4qAqF7
         tO8Q==
X-Gm-Message-State: AOAM531bp4TLfsGiksndraJZ0lFIYfSvXDxr92obYHdVl+Dcwbi0Veqc
        NPg9M/DN9E160p1vShAsXQk2pFAXelLusHf71Oz7ig==
X-Google-Smtp-Source: ABdhPJyqYfi9VXD1BdUg31+zuT2i/xWg1y18bAyC205h+GjlzHEpJ7dWgXgWGZL0nWrwyQlgl+CJIsjckM29Sj52uIc=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr8893338lja.283.1605014484734;
 Tue, 10 Nov 2020 05:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20201105231912.69527-1-coiby.xu@gmail.com> <20201105231912.69527-4-coiby.xu@gmail.com>
In-Reply-To: <20201105231912.69527-4-coiby.xu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:21:14 +0100
Message-ID: <CACRpkdZBo+kY_AMNADmj0uGRavb=HsJ8doJ170RJmopmA1c9Nw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] pinctrl: amd: print debounce filter info in debugfs
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:19 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> Print the status of debounce filter as follows,
> $ cat /sys/kernel/debug/gpio
> pin129          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter disabled|   0x50000
>                                                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
> pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
>                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

Patch applied for the next kernel (v5.11).

Yours,
Linus Walleij
