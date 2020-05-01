Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE5D1C190D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2020 17:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbgEAPKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 May 2020 11:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728856AbgEAPKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 May 2020 11:10:50 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B73C061A0C
        for <linux-gpio@vger.kernel.org>; Fri,  1 May 2020 08:10:50 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id u203so2743477vkb.11
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2020 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knTG2gmvtoT22+XOsX7dmFpVAGO3ao9zwsfFiTXURTg=;
        b=i5JF31iiDLo6z171lTJxhjapmVJS9gqP3xgHzEmURWBZ9ZrO+wXla6ynAK3ki/7XPX
         sRwv80rlH6ndWj4Gju7PPJfTN9R8SjAgNB8Ev4Z37QlaoWQGa2up1QK2IwuGgWTxfCp1
         86gjvyWw9Ih0xsuuDS86kOVoOpHcVaXBZSNjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knTG2gmvtoT22+XOsX7dmFpVAGO3ao9zwsfFiTXURTg=;
        b=UiadB+0qY+ev77Lj/6xwkApZSumbkyrJyqGEY0eHvOaf54LRaDDQ4NdcKfQB4EeqaK
         F2IyYaIS7AlFSETdCJuJiXvn5GwMysO3tgf16BEqhWAwAUqEMLQEjYrPL+UmXy+fUxH4
         acH1EFaB4bb6nIyfTPiRKmsBiT9+Pbn5gcMb8BH0+8QecmF/f0/43dpD2rBY0JyviKIt
         Gtn9pzhSGZZJu6YnQZUlESjzlBaXPRqwNP2ue5hNM9JgAf3IGH9wt/T9IlgWneOSswnV
         Smi9wn3KQBVtYFtDi73XQjSbTL8mbVC1ShhGTUq1EtTXmZTl6EwDZh9+9L/2QhncUa0S
         0kbA==
X-Gm-Message-State: AGi0PuaL9Eokocrrce5s/y1RnBfYF0RkDRh/O2Nk6adpQK4mI06Py/b8
        ekAtQ5xL8YggGzaYDMH7PyDv22HFVks=
X-Google-Smtp-Source: APiQypJsGq6FpEMfDk3j3TnXQDimTH+DHKbgthKaZa7jsdhTVAgqFjNemRLDHczvFumueAry2vXYdg==
X-Received: by 2002:a1f:208c:: with SMTP id g134mr3036944vkg.74.1588345849040;
        Fri, 01 May 2020 08:10:49 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id z191sm837721vsz.32.2020.05.01.08.10.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 08:10:48 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id 1so6440804vsl.9
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2020 08:10:48 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3622452vsq.109.1588345847717;
 Fri, 01 May 2020 08:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 May 2020 08:10:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8phQsc5SSUdqw-HRPYzW5QoEc8NoVJ+ZXQz72FgEPug@mail.gmail.com>
Message-ID: <CAD=FV=V8phQsc5SSUdqw-HRPYzW5QoEc8NoVJ+ZXQz72FgEPug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 11:31 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>
> Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
> is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
> affinity of wakeup capable IRQs.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> [mkshah: updated commit text and minor code fixes]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Tested-by: Douglas Anderson <dianders@chromium.org>
