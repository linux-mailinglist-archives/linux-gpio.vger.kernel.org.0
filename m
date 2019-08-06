Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34AD833F1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 16:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730489AbfHFO1r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 10:27:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38799 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfHFO1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 10:27:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so82410660ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXHAOgrT3aqDJbWQZyVCHNE9w4LKxuarG8u+DMQjMBc=;
        b=kRVypgpgW+U13mXabeCprgFSroAP9njk3XKkXXwByiKBU4XgtH/iehbTDT6cldft/+
         /TXUajxPi/SiS19kGWFFMyMPgMmrAat+s9NYdWTQ4iwxgKI6YkDnKcPmAk9nGuTmg2TH
         RzKO4ofnqiPh9huO9cIZbnipMIFxr+BTt2zpyQQEr7cxpCMezDs9Zn75yHAUtZmvE2gx
         6nNP1tSSUJzUR9FYigfMEfEvF0dG9iewvqXZK7sKy0CyTIqxovHu3juoY9sYu1ZPKuMP
         I8xCh9DoL7dbSqDOKIwZsnKl537QVZIgpuaO0o3OI02s5EFIozQhDRJS5oYMNAKWmPKq
         LzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXHAOgrT3aqDJbWQZyVCHNE9w4LKxuarG8u+DMQjMBc=;
        b=MufT81DFQxkpLfM+2ioICQ0C7VKt9adGmo9fzZMLukZKLKOCLNkmn8MyFT5mWxJcfZ
         gXDjtxuQXizI3lXMbFw0ENbRtNm6DHbWaiDbXwPUUXkaiwBIPvbEA+KpTMAHWQKcVSoW
         6qQ+TJNHCfiWbd+XMjfkGL9ffMX87cHg6z6hrwst9XmZ75LqYYGBWl6AemqYPV1blJld
         rQBCc7IxfaJCT5eAfUTP/T+4TDweyibvlzM7wTXJZpAHhPFMdFHrBQBH+wMuv1glb2DL
         oFQgf6Ztkc32NpWvmkdC8riXlhTRC7sSixBT+IhBpX01qSuDP9Jp22ZuHX0jC8YB/PxF
         Ipbw==
X-Gm-Message-State: APjAAAX2CxU47r28tOSSrTEhHnlcS1qxbH1lf786GPbSkUPsrD40lRoW
        kjV01n0oTH3IbWMEmUWHp1RZ81/GXvaatpXIlVZglIZA
X-Google-Smtp-Source: APXvYqwjBu3QaDljOnAr6J4mSyraVtYhMkkNjpCPjTNiPs+dIcn0dX9BiPqfMvJ6LUfcYGXpxkAfq6U5ESq1gCGUiCg=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr1829775ljg.62.1565101664435;
 Tue, 06 Aug 2019 07:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 16:27:32 +0200
Message-ID: <CACRpkdYyNVrOuNQMbpAreO2NeSOXxctHC7pbDWZVddPjOAYkOA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Allow to request locked pins
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, Jul 26, 2019 at 10:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Some firmwares would like to protect pins from being modified by OS
> and at the same time provide them to OS as a resource. So, the driver
> in such circumstances may request pin and may not change its state.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Interesting patch!

> +enum {
> +       PAD_UNLOCKED    = 0,
> +       PAD_LOCKED      = 1,
> +       PAD_LOCKED_TX   = 2,
> +       PAD_LOCKED_FULL = PAD_LOCKED | PAD_LOCKED_TX,
> +};

Please add some kerneldoc explaining what these different lock
states are. My head is spinning. Locked? Locked TX? Locked full?

Yours,
Linus Walleij
