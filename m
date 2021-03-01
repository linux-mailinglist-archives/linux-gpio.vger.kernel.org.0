Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBAB327A83
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbhCAJNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbhCAJNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 04:13:18 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB942C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 01:12:31 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w21so19648563edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 01:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0+snQP1OepvOAiKkI6VdpONCkQ1/Rgo1L2y7WjmwNk=;
        b=nGmjnLE7ZDBq3oOYbXNMIcEoVDx/O0RUm+YOH3vsrEji5UGz604U8C2Ai/8G9RcvcM
         L7s16lIwr4uZZVA+i3iB+bIHTuDi7EgQ69dBx24+h6IQM9EpcRygR3erd7kIqZhYft58
         jADpQ8lQBSdVrqeC7yj5hBgD7P+i80oF4QgnxASD9i4XKq3BLWGI3dEQSPxAX3trj8oD
         yYv+2dLwJzacrFLXVi/NF5oC4hxnQ8s8K4o6HhdtzqDDiDGMXhXXy+OUhmog4zytav4j
         rfyHNc7t/7a/aBG0DwODJhrrs8o0SrL+5jm9oB3/73ehAdDQdsUI6kd1sLEENfDJg6Z8
         tyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0+snQP1OepvOAiKkI6VdpONCkQ1/Rgo1L2y7WjmwNk=;
        b=ARaTZSKxBXiZ6KYJuTTW0j11FOKpd+KZleSAfctpdjXL9pTHsSGVBrpPyK/DLCyBxK
         tju7Y7C2jYtNBRqpgCYj9aF60e77HbUbw3FtHigFrPS2UDqktd1c2TpZuz/hD7snIP5k
         pUDFFcfzMbOaySIn+fsx8p7pf3cqVlF2l/+TlWSZgHWgPPPrxAJd7atd4awo6wAPAfjB
         i2ThbCl+uFbmoqHuvssKjm+yV2ATocWjuHNpTnSJzZmvqhdySQdRmDPf9/kXF13kbZNf
         XwBVD23qbb3xCCeImWahGdlRHPF7GnedYxpnlmBi7QIemauE83LQGIAw0FBj00T/bOaO
         dnuQ==
X-Gm-Message-State: AOAM531e/WlLv4S/0zH+ONxJLrKIzZdh02Qru9FmwDwk2uX1KM8GOpoy
        oQ367+hoivdogtfjMfOlWwkQHHaAWNcpVhXcIBOOVQ==
X-Google-Smtp-Source: ABdhPJwDn45OLVxfK0AvUxzViyAWO2/K09SNBO4hSgbVWRAKZiFfvX7DjsaB0haD6ktSH9eDR6qxDczCF112IZCEETw=
X-Received: by 2002:aa7:d588:: with SMTP id r8mr15283394edq.88.1614589950563;
 Mon, 01 Mar 2021 01:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20210301090519.26192-1-johan@kernel.org>
In-Reply-To: <20210301090519.26192-1-johan@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Mar 2021 10:12:19 +0100
Message-ID: <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: regression fixes
To:     Johan Hovold <johan@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 10:05 AM Johan Hovold <johan@kernel.org> wrote:
>
> Here's a fix for a regression in 5.12 due to the new stub-driver hack,
> and a fix for potential list corruption due to missing locking which has
> been there since the introduction of the character-device interface in
> 4.6.
>
> Johan
>
> Changes in v2
>  - drop the corresponding drv_set_drvdata() which is no longer needed
>    after patch 1/2
>  - add Saravanas's reviewed-by tag to patch 2/2
>
>
> Johan Hovold (2):
>   gpio: fix NULL-deref-on-deregistration regression
>   gpio: fix gpio-device list corruption
>
>  drivers/gpio/gpiolib.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> --
> 2.26.2
>

Patches applied, thanks!

Bartosz
