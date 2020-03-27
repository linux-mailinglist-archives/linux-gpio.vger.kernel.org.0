Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76CC219603B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgC0VMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:12:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45548 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbgC0VMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:12:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id v4so9014562lfo.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JZ1QFI9+FtgdXcyl77TJuQPCE3U91hu8/wkfGn1LbU=;
        b=SRwOWlJ2qXCpTZZFjHvFl3mL29jKoQFgfoZHcDLjwHGukw8P6wFh3FGGu+AXRlrn2y
         +OdH52BNXFEn6p21ublMsHoo6lqqaR+4jkUuy0C0oxdqcNpHWuMML4QuXlQK52Xi+cso
         P9XGUT437lc4964eA+xTTH8kDtY9o4BnYb1rFY5a30twe5eC4YRrQXN/btg62B3pxDkh
         HXXHUtMfsNtvDuAouVXCvgAkN72fIINSfeFKG5y5yXYMzPei7uug/fBLL5YbI5qtX6Ux
         4C5Oe9PQJNvG3Wiki1kOgmgOOWDnVzu5ULOG0vZs+hIZMfXismb1HNHAe0M6BiWDMbIu
         oFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JZ1QFI9+FtgdXcyl77TJuQPCE3U91hu8/wkfGn1LbU=;
        b=Mzbx4w41EPga2mXIQ1EGkfckMMwab6E2BvTglMU+dEdzqsFgRdbAntp0YOKl/QVbPe
         5fSyEyPZ+Acor65x4kaw1CRrlNX7w94GEGev3wRlrH22D5UIXW6EYDM16I1KStX7vpch
         vJ2pzHxbcw8Y/jOOYZQqNMZ6QMZk55DPi6J4xaoQsgR/4zj2UThcwchE5KEtGbT9RmS5
         UoJaywMYzcOlIPFZhRLzfHMh2CaeEdGfHIUH/93jmrNs3tPIXcUNhHYmNDoi5K0nMsTn
         HNCRIBxTCAlVo1uWt53tAUE1jNcmHRYKCtDHmFlti0KnKQ4Brm5kvmIhefUFxpJF24O7
         affQ==
X-Gm-Message-State: AGi0PuaOIrEkg3WNOvXckzgifRaeLlQwZB+qNa67reThJrOz+hGQk3fa
        Whs7sshGSiIqcp8rJ2Y+YQf/LkFoZaTNdSpzONtPNw==
X-Google-Smtp-Source: APiQypJLzv1jR04mjd+jD35S7idB5qw5grrozbcEYe5adOdvJDvuj9PH5V5xlh1OkmHnheg5tdSKwvBMWIQrB/u7tNk=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr745752lfk.77.1585343520022;
 Fri, 27 Mar 2020 14:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <8a6f91b49c17beb218e46b23084f59a7c7260f86.1585124562.git.baolin.wang7@gmail.com>
 <3bdac4c2673b54c940e511f3fa569ee33b87b8d5.1585124562.git.baolin.wang7@gmail.com>
In-Reply-To: <3bdac4c2673b54c940e511f3fa569ee33b87b8d5.1585124562.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:11:48 +0100
Message-ID: <CACRpkdZ9VwZdexCm+WsDT3c3ScTSMDCTii2fOphH-CrKqf6TMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sprd: Add pin high impedance mode support
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     linhua.xu@unisoc.com, Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 9:25 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> From: Linhua Xu <linhua.xu@unisoc.com>
>
> For Spreadtrum pin controller, it will be the high impedance
> mode if disable input and output mode for a pin. Thus add
> PIN_CONFIG_BIAS_HIGH_IMPEDANCE configuration to support it.
>
> Signed-off-by: Linhua Xu <linhua.xu@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Patch applied! Nice engineering here, figuring out the right
fit for pin control configs, thanks folks!

Yours,
Linus Walleij
