Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03AE2AFD15
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 02:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgKLBcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 20:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgKKXRA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 18:17:00 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE97C0617A6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 15:16:59 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 74so5591020lfo.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9CWWrQNlrqNu3PmdGxq8JyJTFPup9rQoNWJqUzri1lE=;
        b=LpRBAHuzcK4BzoEFa+JKRIKn4Nl1L6dIrf3fXK2LuUBNgbmsc7ju8+9L0dVHtXRj9a
         UMEJN1of4BPh/ZrUgufIDU/M5DWzS2a1ZZF8jbepSugzsMJbtlvs9kind5fCiwDZdQy9
         KColWYr9qQV6HNQE9KaKOntW7SRqLOlyEQQgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9CWWrQNlrqNu3PmdGxq8JyJTFPup9rQoNWJqUzri1lE=;
        b=hOcSf5iKfqqXNTkOz5QzzzX/883a2+Mx4+cewTcZLx6ilFoYt5/F24w9N5adl7B0Fg
         /FjSqrLAymlfoZs4RRyDHQ0qwRAUO+2mmNZHrhbdIPNNpUcQl7Axzfw+5n7kqmdgwDgf
         qcc8/QO7spodqBcwDFZOqNxY6N2qX0gd9iUcoC7v4zZJkAwqddbf25HLiFZ25M5SZSSd
         +G/sxL7JpuNLH9uNhSz03fHcXmO3LvD5oP/fcqYrE/OVNBSEEkXh7a5bSeTcFmgkkzjJ
         JrCOg+k08hVnvqJl8c1+gg3TUugZTavcTSBknExCxARcgb2ZcHvRLp76SJramCGE0LWQ
         VQEQ==
X-Gm-Message-State: AOAM530kntTT1BnE1bOjwhP+X1zlG4eE9vv5YC0mJkwphG7wfxPHsjxE
        bMA/hkVm7C6bWiiI35Fkchmyg3BE1k8zfA==
X-Google-Smtp-Source: ABdhPJz8SCV/ZpvjCEbDvUHkX+xWNRmNmnEAfhXoeGqfTMYveEAl4hZ1mTMQQEhK85lKlFwQC7jvXg==
X-Received: by 2002:a19:42d3:: with SMTP id p202mr10513110lfa.85.1605136616846;
        Wed, 11 Nov 2020 15:16:56 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id y65sm359285lff.73.2020.11.11.15.16.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 15:16:55 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id z21so5546450lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 15:16:55 -0800 (PST)
X-Received: by 2002:a19:c1c5:: with SMTP id r188mr7786174lff.354.1605136614924;
 Wed, 11 Nov 2020 15:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20201110144932.1.I54a30ec0a7eb1f1b791dc9d08d5e8416a1e8e1ef@changeid>
 <20201111221400.GT4077@smile.fi.intel.com>
In-Reply-To: <20201111221400.GT4077@smile.fi.intel.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 11 Nov 2020 15:16:18 -0800
X-Gmail-Original-Message-ID: <CAE=gft6CpRsEt_MRyCZ0-NheBVgjTqp+omCJXeLUj1sExNHADg@mail.gmail.com>
Message-ID: <CAE=gft6CpRsEt_MRyCZ0-NheBVgjTqp+omCJXeLUj1sExNHADg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Fix Jasperlake hostown offset
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>, stable@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 2:13 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Nov 10, 2020 at 02:49:49PM -0800, Evan Green wrote:
> > GPIOs that attempt to use interrupts get thwarted with a message like:
> > "pin 161 cannot be used as IRQ" (for instance with SD_CD). This is because
> > the JSL_HOSTSW_OWN offset is incorrect, so every GPIO looks like it's
>
> Simply HOSTSW_OWN, and same spelling in the subject, please.
>
> > owned by ACPI.
>
>
> > Signed-off-by: Evan Green <evgreen@chromium.org>
>
> > Fixes: e278dcb7048b1 ("pinctrl: intel: Add Intel Jasper Lake pin
> > controller support")
>
> It must be one line, and put it first in the tag block
>
>
> > Cc: stable@vger.kernel.org
>
> This is second one...
>
>  Fixes: ...
>  Cc: ...
>  SoB: ...

Thanks, will fix these things, spinning now.
-Evan
