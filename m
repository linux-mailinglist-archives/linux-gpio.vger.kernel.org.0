Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21F62A6EF0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 21:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbgKDUjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 15:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbgKDUjO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 15:39:14 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C82C0613D3;
        Wed,  4 Nov 2020 12:39:14 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id e21so548889pgr.11;
        Wed, 04 Nov 2020 12:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7n7kbvMfZ+6Ywj6s/wWI5B8cbjzCbqK0nfahWl63980=;
        b=GPHQXfwqQ0GGp/bjcYYtfuNvT/zHuhqqQyNrrKvfxRVm3OKRlFlUW4iWX2ldnlIPEg
         1X5XXEqpAWcR+zwEzlY7RnNLEMHawqmwSLo5c5uk1yRnuQYGGbtuZKDnqAl4d3etW7U6
         Pdiz++ThqAkgi6MF9ECvB7tE96z2FVjSjBPoPZlQlJT9lKMC+Wl0RsFBYbjNfDjo1q0k
         AHuRLoOm/UffFJzTrddAEtjjwffiYgeoWj6wPonSPQlS8Quhu8qR+XEVcgpewQIJeZjS
         vK2XHu2IqMUcyd00hxriAhl+VzbKa8UfnP8ImX00BY2C4fwlZx31f2zv8o8AyhTb2ZIa
         QSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7n7kbvMfZ+6Ywj6s/wWI5B8cbjzCbqK0nfahWl63980=;
        b=J80Gu9js1Kz3X0P8F7s/VK8fCyAg3UzRASpyqUxCZ7xRyxPK1eSL7cJrCbDCqwIGl6
         fS/3ZQP5MQqKxzR/CirtrfWQilbEpHM/b60Fl2DLFWHGtS+Z+CClA831X+i4NZpOWOTu
         pDiPNjOlvvBeJyc+dT7Ramqu+JNkIYt0qyH8lH0sMFKpssG1Wb1rvk+xYj0YFUhMMZq3
         758TkAkFhxJSK6WrLUqNiZtJixQ+QxRYwuYrzqR/RzRA1MwNQpRGeHf6vTM0dBFgsneH
         x+9HS9mLy10fQm0D+sonroKcKP+0tvr9XI16coafXS0bCGaM3pZbEJ5oTcNI5KZk+lEu
         UyGQ==
X-Gm-Message-State: AOAM5334OifPUBX+nb5BPxezvzSHklAif+8zU/IHINKxs/K87d8PfvVg
        DowuPp22G2RCDUojPbv4Aw2hXzgBHT4r4foJYGY=
X-Google-Smtp-Source: ABdhPJxpWuyOfXp0nb13aP7XvXHwULbNsMK19gGs43JZDPDUdqGu+lwGyFq5HIgIRpfiijooFeBIqrgvR9SH3xmigYk=
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr447405pjb.181.1604522354094;
 Wed, 04 Nov 2020 12:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20201104160344.4929-1-coiby.xu@gmail.com> <20201104160344.4929-3-coiby.xu@gmail.com>
In-Reply-To: <20201104160344.4929-3-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:40:03 +0200
Message-ID: <CAHp75VfsP1iJW4shNcSUecFtMaK+GK3dcN2T0_0=gQ+GXAZN-g@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: amd: use higher precision for 512 RtcClk
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 6:04 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> RTC is 32.768kHz thus 512 RtcClk equals to 15625 usec.

equals 15625

> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

One of them is enough.

> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Message-ID: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
> Message-ID: <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>

Link: https://lore.kernel.org/...

And I guess one link to a head of discussion is enough.

-- 
With Best Regards,
Andy Shevchenko
