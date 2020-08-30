Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3529F256F8E
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Aug 2020 19:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgH3Roc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 13:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgH3Roa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 13:44:30 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C335C061573;
        Sun, 30 Aug 2020 10:44:30 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q3so1923412pls.11;
        Sun, 30 Aug 2020 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gp0X+lasJkwXPO0XrD/f84dqr25JqV/6NmDhGG0Yq4I=;
        b=QZ4fN2fbtp/FCKBoRqj0++i8mmd2KyeId7EwrG/mXMHls2gErru7ttFo1OY8xE3+Jp
         HKE148ZrESWB6Y6JDHA8A1bIyofj9NzH8J/VbXQffEjKYwWk9wYl6fmweoJB1M469Kix
         icj1fi8awSRm1hK5R6Z8aD1vPsPZX4EyjVHY70ipVfmPhqxiI6AAR9NLx736djMulTAU
         oCRD2TroZ9GuvsIPHUyhHylSrb0aVmXRExL4X7oEKGMAmWTW28SzdjO5I3cmqFpLUayn
         cBZZoR1ZHdMo9hEoYXuFxGiGbp7LF+B9r+LJDIgGBewFB6Z1g1qyGDnI8Dh8VoN9WtgG
         GdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gp0X+lasJkwXPO0XrD/f84dqr25JqV/6NmDhGG0Yq4I=;
        b=QHg2/q9Rg+7SzihJUO63Ivedc4zG1peTSC73IeVrURlge9ZJ2o9tMqZ1ZqeSWR4UFu
         0MwzH6AGD1rMPF3uttxXyhDEkK0wLk4mYpAtz7naUOj7MsEagLuExX9uSi3PdFa5mciE
         sOiajEYVDKRFs6x9zA5u+wIdDMOYagppiOD0AihoIA6lKQdLgoU5hSTP9hG4bHUgHrjl
         AIXkf6T/5ELGtG3BRPQ73YoY5c9igykAPWiowxYUtyrhzneYVsnYuAVwubwMBvGA57cz
         bjkFEtDf5My066vI1zKDT9bxrmjwzdcIQzG1JgvEg5Ir0EdzfeLqM/zvTxl9MJZ6a/xN
         Yb3w==
X-Gm-Message-State: AOAM530AlDblk0oWUmiXl83oEtfqhPMecOlaFb21K8M7pnBQ5bOnxQt4
        K3bHBms/zrldNv1jeuRCQ10cOO29n/HPx0np1y5kvw6jvlmuqQ==
X-Google-Smtp-Source: ABdhPJy52HlNa2bSu4U8z68naXhSKAVRTNJ6agUQQfZ89TxxAqI6UpeBNqKNDtmvoSMytKOxYJOa+mhCr0TPb/3TeO4=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr7536942pjz.228.1598809469820;
 Sun, 30 Aug 2020 10:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
In-Reply-To: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 Aug 2020 20:44:13 +0300
Message-ID: <CAHp75Vd0Qqk3mMyA404a4MYEQbYVLmL1vwSm2UOr4Zm0gwiydQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mcp23s08: Fixups for mcp23x17
To:     Thomas Preston <thomas.preston@codethink.co.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 29, 2020 at 12:33 AM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:
>
> Hi again,
> Second round of these mcp23s03 driver fixups.

v2 makes sense to me, thanks!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changes since v1:
> - Split up the fixups patch.
> - I'm pretty certain the "mcp23x16" structs are typos, so I put it as
>   0001, because the second patch doesn't really make sense without it.
> - I lost the `(MCP_GPIO << 1) + 1` changes because the regmap handles
>   GPIOB 0x13 with `.val_bits = 16`.
> - Dropped the interrupt-controller changes.
>
> Thanks again,
> Thomas
>
> Thomas Preston (2):
>   pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
>   pinctrl: mcp23s08: Fix mcp23x17 precious range
>
>  drivers/pinctrl/pinctrl-mcp23s08.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
