Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743A4449FA3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 01:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhKIAld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 19:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhKIAlc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 19:41:32 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D71AC061570
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 16:38:47 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id bk14so7674864oib.7
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1y9OQwZEuQdL+QC1JTIKa3QLF+Ig+ClIy0nWbOXZqYM=;
        b=XTHunefrjTXylGv4F6mDAXO2YW7HyQOluaRirUlo2l8KXmNskKRS4j9ayZH+2KTwlt
         EESafH29ymec9ip1AcKFR2lCxTcXhYfiHjDp0eH87vv7sgszLcJpOYUAQSv1x++ECr1L
         V9N6LvSM7yEUWE54WNvIuj3GbLr3zjYyTkflGRhukJNgFmbgcqLjeumQcPJsMMJIVytl
         rdzVF8I8RS+w/JREqSyzmr3tcy4bepBhvGdlNWdjofmW4DUTE5qBLIaDnt8RamW9wxEz
         GtwHzWCVljCmsP+w6UKOCwXQEgyEWVuDjSQKOKP8GRcfMqSqGOxtrFWluVWr7+c5UV3/
         so0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1y9OQwZEuQdL+QC1JTIKa3QLF+Ig+ClIy0nWbOXZqYM=;
        b=PKcIC767ce0fEeGs0XcrBcCnY/J/GVdh2SwoYgHjIwV9T8K4XqlXqc3n2Y+nm/IW2D
         uV0IOYx52MqAnVQEVMrUNX2oJqCR4lB3lpuJrVSnoBIxAMpv+/NGWwZ9LyjiKj5piun9
         YvIdAPm05OQYaR67fpDSEDOOeXXb+ljz+qAVKO4KYpmT+t8EYyFRU6yEfW051SiFd7wV
         qe34CySwusBa84Ba+5hreS4dd0mNKnSzOAC+5jaeKFSP88S1MASNTb8JQxgOdugsyMUl
         1quYMnmBEWLALnrSKfshg/Cz8QhwS0KwIlgDjugZHpPmsjKug9CPjNlClZxpcp/GAzVg
         K1KQ==
X-Gm-Message-State: AOAM532IpToL4PZogIwTRQ65CGLKBg5WOdNcK2rh/ZwtTEux+eqiJ0qT
        ZRsdzkmySpnD+s17CsiJpGaXbSOBv3ieASGnoUjpFiHNKJU=
X-Google-Smtp-Source: ABdhPJyxkFWSH0Ef2pq2VSnwXNsPY1nrhejdmwAdAY/PuUyfvGA6Pxve+eL9Suls1J14bg8FYco8Wyr9LJB49vuVwqc=
X-Received: by 2002:a54:4791:: with SMTP id o17mr2313570oic.114.1636418326891;
 Mon, 08 Nov 2021 16:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20211101014853.6177-1-mario.limonciello@amd.com> <20211101014853.6177-2-mario.limonciello@amd.com>
In-Reply-To: <20211101014853.6177-2-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 01:38:35 +0100
Message-ID: <CACRpkdahdqrkwEZYVuJLogqW+MobNSbSGsy4HjfBdoUfg0_bUQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Joerie de Gram <j.de.gram@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 1, 2021 at 2:49 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> On some Lenovo AMD Gen2 platforms the IRQ for the SCI and pinctrl drivers
> are shared.  Due to how the s2idle loop handling works, this case needs
> an extra explicit check whether the interrupt was caused by SCI or by
> the GPIO controller.
>
> To fix this rework the existing IRQ handler function to function as a
> checker and an IRQ handler depending on the calling arguments.
>
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1738
> Reported-by: Joerie de Gram <j.de.gram@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

This v7 patch applied for fixes.

Sorry for the delay, I was busy with the merge window.
Once the merge window concludes I will rebase this on
-rc1 and send upstream.

Yours,
Linus Walleij
