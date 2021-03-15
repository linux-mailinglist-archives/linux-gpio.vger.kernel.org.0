Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6AB33C021
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCOPim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhCOPiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:38:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88225C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:38:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u4so16791048ljo.6
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5m3eRIWBciz+5D97tbfJ976ybi27aUfRGK7p8odf8I=;
        b=OCuhB/jteSNd4aNXQwTbisgd4RrEJ5sB+xsniqqzWWt++79boE0htITEo68BWVKFlc
         4XrbVMghjPvltVaO/J8CNC11xVry4+2n0rj3V/f7y1vkN9O0sUL8BKcRJh3oYuEdivO6
         B5BYjsmP4/P/67vLpOuw/Gf0m8hdTyAdaoI5kD0GYwFNSnQ9zCZSk0hmQefIWLgwGrP4
         sZkqvXBkSnd2sAjIsqc9GqMZIRPkBezoLroq2gSI7WEOI4EPw2QemiQox+b38mvd6Oex
         lB5hpMjWceXCAtr9HBJjNRiNJlAI/9+4676DToSyKN7/vIetVC1TWtZJ/K+DNXt8Ov6q
         8yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5m3eRIWBciz+5D97tbfJ976ybi27aUfRGK7p8odf8I=;
        b=lmIygdFSTMFVpP4XK+d5PCeaBogi+bckaC4mOFvCaLl1s+ypZCvEt444n0qpToSQBu
         7s7Ttd7g+DSNTbdY2/S/otAkrUkWq3V6th2UK+RL1w+8LoAcKcBuqwLiGb9Uu04bIXAh
         8bbAuI1RT3zGEEbjz64+q5iIA8e2vsZ2oRUSUNYuFQhxRsX0HIXAOIUCfta2YjJkMchf
         vK6W95GaBJFGWYQH1MxxV+jxxg5hfvBKwMjcuTBuItpt75H24EAEsyauWA2K4QXBzTKN
         HZ/k/pYPMXKvqgt/L98RDWPMhxNE0As4VSRnX18XlMa59xQxNPc2QcSbYSwF8SG4ZYd1
         PsAQ==
X-Gm-Message-State: AOAM53356M9w7ekU5DIes1ONE/21K5PGow2O4N7qM4iYyXtd+ddEPmkK
        OsGaN0MB0+IGZD0gT3kKEFHER6nl1nK5rAaxmOZEWA==
X-Google-Smtp-Source: ABdhPJyMTl5WnTVJ09k05c4f3Uqq2tH6/R94hr18t/MOoDtcRO9chvNmGJupxgcdC+C4ezonWP4HZOeRQjek9nW3bgQ=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr10941550ljc.200.1615822692811;
 Mon, 15 Mar 2021 08:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <e5203bae68eb94b4b8b4e67e5e7b4d86bb989724.1615534291.git.michal.simek@xilinx.com>
In-Reply-To: <e5203bae68eb94b4b8b4e67e5e7b4d86bb989724.1615534291.git.michal.simek@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 16:38:02 +0100
Message-ID: <CACRpkdaO2qhUCuvGm_saHwszp3afKibGsAWQ692hf=Cx_aUC3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Set ret to 0 when group is skipped
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>,
        Colin King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 8:31 AM Michal Simek <michal.simek@xilinx.com> wrote:

> Static analyzer tool found that the ret variable is not initialized but
> code expects ret value >=0 when pinconf is skipped in the first pinmux
> loop. The same expectation is for pinmux in a pinconf loop.
> That's why initialize ret to 0 to avoid uninitialized ret value in first
> loop or reusing ret value from first loop in second.
>
> Addresses-Coverity: ("Uninitialized variables")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> CC: Colin Ian King <colin.king@canonical.com>
> CC: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
