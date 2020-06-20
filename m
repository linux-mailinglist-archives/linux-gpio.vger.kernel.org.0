Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3CA2026A7
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgFTVKD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:10:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36561 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbgFTVKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:10:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id i3so15284595ljg.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gc9tdvMm5I7FJ9/c9wizyx0mIG41qGeqGwmlr+DZXMs=;
        b=IvAC7ZQ3rsnPQbRpe/zhqJX5h5DHKg2O/MrnfYfjr9Zce7psVaMRbv9AhkaSnbgzO9
         +WaPbgTnjvGnVJKwiLI8WAKGc6kWyYMwchzqviYciYEfZcPQ9D5xtRFr5tgz2Oq+16k0
         DFIafeLVdCK3BP4iid2OzKBZViODJZYG5DNZaqPnzFzSsuGxIeKBSHBk6Dcwi72cNcen
         u2bC9fuNz6HlM9G/ZJrKeg0F8THM+Gl1vS4O4q/YqnNsiKCStMLriluy51nB6rNwOtOI
         tcnMd2RvUpAmKCH1xk0vtXcZ33/12atFQif1nAM/XxmRQMDxkQYKXqTTEvtI7pXawhfc
         y9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gc9tdvMm5I7FJ9/c9wizyx0mIG41qGeqGwmlr+DZXMs=;
        b=d5iu6R7NsMWtQpTlfvm1qgtdUvr+8RBIDR6V9A9lKVqvOz2jSXsyDpPHcCYkZ97Y1G
         iEmNitOFSJA1b/4nu2lJpizEIbCj3Rv1Pxq/Tppk2umWaQu50K2E3XFMfvxRKXHCJjTe
         TnDT0Bsn//ic5Oro/RRHwJLonDb6v01bJ2m0KBanmSJAEjvlSeDzXwUX0vLL0wVtBqmK
         0ri5Y0df1Er/8SNE/6+YrkX3LaOg8GvpkoFLvBrKO/hUHRspMgVuuAlosznqMiX47OFd
         IjP0k/x4PvhERwVAdQ+OB7R3LfW9MoQ5O0eCGS/pZ2vu/kgcORC9SvQss4tjh2KVnPS1
         JSKA==
X-Gm-Message-State: AOAM533oKHI30Hcsw73fYzjUHHHpXw+VKBQUw1Nb/rWkt/y6WgL98UYm
        c1NjuorX9A+p2UBWi6xe/2oVtpnkYyCjWHsOQeKschqlCVY=
X-Google-Smtp-Source: ABdhPJwdgpgs+ay+WZjD/XkBsiAdpaLbdadabai2iJjIEJzxZyOWnj/D/DOGj5KOcwe67T4FZfBDGzbpDtr8cOH+enA=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr5207917ljc.100.1592687338273;
 Sat, 20 Jun 2020 14:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200615125951.28008-1-alexandre.torgue@st.com>
In-Reply-To: <20200615125951.28008-1-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:08:47 +0200
Message-ID: <CACRpkdbgMRW6Jqde6AOcjJ9=T-d5fTO02N19YsrVL+iaZiKXwA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: stm32: Add possibility to configure only one pin
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 2:59 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Currently stm32 pinctrl driver offers only the possibility to configure pins
> groups thanks "pin_config_group_set" callback. To configure pins thanks to the
> GPIOlib (i.e. GPIO_PULL_UP ...) this driver needs also to support
> "pin_config_set" callback.

Nice feature growth!
Patches applied.

Yours,
Linus Walleij
