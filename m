Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004A150C2AF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiDVWPu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbiDVWPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:15:25 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2626324277A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:05:46 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v59so3759219ybi.12
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnPyabG9pOxh8qzjo3GHxlP7qD0ZYp0TVCp6JnkWkhg=;
        b=rumSCGY3OftqFYEShtWIG/w2M+t8QkSzOAJXSGtX2CHX2irFE2VPMHSOpJkt8ZQaFH
         57B37rusFOHExaTz59ZP9VZYsEq/4ZPv5idTXn1FgT28jHv5wGG1sPRH6OwwX/Q8CrXM
         ZQBjkMD8ZEQ2iVz0noypoNsZwrFkLppphR/DuYVqp9NSWmQwyqv5Pce32Ra2PDksdZL4
         lRC+6HjK7uYuBCjpmMWFz8ePfWhP2we1K/PqzXyyw8GBBJPhKHNpp2d5/flDoPiG5xxb
         r+sgtPeu39Sx+m8uX6WJmM/9bK96sFfh6o91GBeAxVb/Icew5yvkCmjRQsbo5Qv8U61J
         2lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnPyabG9pOxh8qzjo3GHxlP7qD0ZYp0TVCp6JnkWkhg=;
        b=upbKV1IuhdasRoDj/E/Lv22zH3NobTQngHcjb4PeUhAWdmG9D+Tc7ucLE9PdDAyhzB
         KL+Y2lpvZwu9WOXZpm96oTN5Kp7LTZvt53rn3cO9BzslohSfbUW8Vj6xBrI6/U++S/b0
         3YYbIDa0rAiHK1QHfMHBbsF2AJghSckhM5fh2+afmZZVDEf2sfA4nPMCTKeX43Zh//tZ
         v0xHWRYuz4ILdqoaXEtHn3ej/R7b0jp3s/5515cmyS8FQTVm020mfcAmHvYugxXSRnfS
         75tpQioodEl8q+EReHiQIanXOnYdvv/RZPj9MXZQbX1EMtW0ONKAQk5u5Ew0c+0ae65S
         zazw==
X-Gm-Message-State: AOAM530oy07nCEDxMBIKFMG+CUGtJCH2oK2QIDnGlxdBTCis8Bc0NKYK
        WddqAjOgUbPzDjoEvqItVdwKROy6C85thsc8bmFATQ==
X-Google-Smtp-Source: ABdhPJzPVTezAdZ+Jr0d3h8Qm6Ovc094t90vwEkbZlWbsLUFVVYMcdlha24zBLWFvznvY1/XZnOh2r90Wvl6S0MtNXY=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr6702096ybb.514.1650661545453; Fri, 22
 Apr 2022 14:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650638951.git.geert+renesas@glider.be>
In-Reply-To: <cover.1650638951.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:05:34 +0200
Message-ID: <CACRpkdZK9Y19bWpRcH3QgDSQRnpfyvf1zA8YO0RD7SdWiUpdBw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.19
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 22, 2022 at 4:55 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.19-tag1

Pulled in, thanks!

Yours,
Linus Walleij
