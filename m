Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFE5313349
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 14:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhBHN3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 08:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhBHN3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 08:29:42 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C57AC061788;
        Mon,  8 Feb 2021 05:29:02 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id fa16so7840520pjb.1;
        Mon, 08 Feb 2021 05:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+SRwZCjQXqBonjclq0sFfPG9c3K5kM6QDAkUywKYgps=;
        b=Kejp0HjjRmBA4BGjWzGymQm6EpB3B8AZEcKzpOcjAi/omGrHEJwTEa1+mDzT9vGTSj
         q3OxdMk98CsRaATzP8KY0Oh90v6wqOHVPTIeZVD8Vfiw/S7iAiOGieZlQU88pBkmpNpc
         9cMx6ydnBQyP6cIkhVeb5Pa3W7sX4uYGiZlz59hnhtyB4A+R8AP9ser374qomlWT/Vlw
         YJgyOpqmWHie6552z+ZFSEPkidfow9gRRrdwdWQDjdA14gpCi5Vk9TmUW3VIi8kJVfWq
         vgDYxYFSQvpCLcJyrbNR0xXMAP7fjB6wv+DD6KrrrkNxqlpL4MMvPgGa1z/dQbJzsLsP
         8Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+SRwZCjQXqBonjclq0sFfPG9c3K5kM6QDAkUywKYgps=;
        b=sqF71eOe7qh48o28+T9GBXApChDNspLVdBkQ1Vt2KSvq6yRCnrCHV/+w7bQc+xECsO
         OTKJF0pfsQWPlGmCCxWVr9BCo6q2zxwOm/5ZQC8xY1vYaDJfx+xARTbEJXoA+cK0C8Gi
         fQxzvZQN0F1AYGPzZfYysTxoN9jhmnV2p03cuE2Qbwt+bxOVMiQPNAU33OlLC6EVv75s
         r+W873tCK4zWf40G3tMbUkQwoPWseeDuJ47TWK5dYbRUmzhkPJTyqKbeBpPaOBk30MuP
         fgDx/CeewwFc3EddUEts+QN1GLjfaFSZEBvgtG731ie1JPfrD/VJ3KVRLMvQrEGgO4sP
         wqaQ==
X-Gm-Message-State: AOAM533QSa1tZZJuClncI7uSSmFOEpheqWvPfTU9/69HNHXEO7IQrpAJ
        s2CYnpwV6pOQ8S3KSdaO/ZfQ5ma2vEiSw6M2U9w=
X-Google-Smtp-Source: ABdhPJxNi/rCOU601zQxE+LKhdNbgFwm+XpGdwPw+kOYReF8vn8Q3EdqkESJwPAVZWBH6WYFDJWUGuXwtcslpyV5ESU=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr17594770pjm.129.1612790940739;
 Mon, 08 Feb 2021 05:29:00 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com> <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
In-Reply-To: <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Feb 2021 15:28:44 +0200
Message-ID: <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
To:     luojiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxarm@openeuler.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 11:11 AM luojiaxing <luojiaxing@huawei.com> wrote:
>
> Sorry, my operation error causes a patch missing from this patch set. I
> re-send the patch set. Please check the new one.

What is the new one?! You have to give proper versioning and change
log for your series.

> On 2021/2/8 16:56, Luo Jiaxing wrote:
> > There is no need to use API with _irqsave in hard IRQ handler, So replace
> > those with spin_lock.

How do you know that another CPU in the system can't serve the
following interrupt from the hardware at the same time?

-- 
With Best Regards,
Andy Shevchenko
