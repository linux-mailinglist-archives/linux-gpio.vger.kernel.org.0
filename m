Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFDC2A33A7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBTFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgKBTFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 14:05:34 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93ABC0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 11:05:34 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id r10so11589201pgb.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 11:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vcOhR29x/3SnW8U2CiNt+tjrEtmXX7l2/92ojb4Pxpk=;
        b=DpaxtWiZMjYbNo0DhrRLPVPSP/knuZbX22hAKpoM8DDfByERoFXxP2piGgMQDgO8FB
         QpMU2sUHj4oBBdInmgoStMt9hb9Tvkrab3cxlKadC6i3L+G7/IEZDzMbR3+YbxFoU4PN
         iRrwWgGNFS7NeorZ7Nkl9OTuX3fy2gAg/PjLKxHUSeJqeQsWJ26mwcOAV+faia2Miugq
         qzrIm9NdoX2QE6aWnu7m4SZwchqhGiUwL9M+Omn9gd3IKO26JkF7gI3xTdiYZ39Zh+LL
         qzmHCPf9s3uO5KfbHNXDcsyGeUxP7JnW6N6vB3ZRvwLVZPF516V0RilwrDI7NBkZAo7t
         Geng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vcOhR29x/3SnW8U2CiNt+tjrEtmXX7l2/92ojb4Pxpk=;
        b=hINAUA6o5P2iGnKoPgRJt7FB9XUAjlSMwWpkHU8h2GpJx7MVgHQH05iEMkILqhPrXW
         YIYs2w9U7HpbxQy9PYZjIQtZ8Su7TKDTcSkCcbIxX7ZSgR76ahbmCDHW7ye38aN+0Nlb
         TTvDDXRJuo+OQHPfQfLqb/qfAHUHyd5eal1EtDUhtnis9kWo/UgQEx5riIyuMuSVk2+J
         CfNkwg/xhkmbr00LrbPDvCarrV9rQbukpSIgg+QR7GLkEJ7uqeta12IQm1tyLhE/g+2U
         GynJJFvYoSc+uXlPSWQguMS6xkgjVnSxRV7ZMqgoxZNsVQGO3iZ/SrBt8EQ3RSHPB2RG
         1adg==
X-Gm-Message-State: AOAM531CflcAjUc3eQX055xTLtdlviIkUJSWlc8RgejRKpeVmYVSlRTv
        PVhzUOPp3St8UD0Z4UgJrVa9nm4WcaCr4ZuXKw07UY5Ybx0=
X-Google-Smtp-Source: ABdhPJwPsbRWemfkUlObMtOEO+o6kF8HnAmoiWPrvzISru+uRYkWEuV0YWL7lyNWyivDdL7ZHYZPxLy4Y0igrwHoNm0=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr19506158pjb.228.1604343934441;
 Mon, 02 Nov 2020 11:05:34 -0800 (PST)
MIME-Version: 1.0
References: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com> <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk> <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk> <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com> <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
 <20201030045421.si3r5zsbeeyhkwns@Rk>
In-Reply-To: <20201030045421.si3r5zsbeeyhkwns@Rk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Nov 2020 21:06:23 +0200
Message-ID: <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 6:54 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
> >On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 10/27/20 4:13 PM, Andy Shevchenko wrote:

...

> >> I see, so then the right thing to do for the bug which we are seeing
> >> on some AMD platforms would be to honor the debounce setting I guess ?
> >>
> >> Can you and/or Mika write a patch(set) for this ?
> >
> >I will look at it, but meanwhile I would postpone until having a
> >Mika's Ack on the action that my understanding and course of actions
> >is correct.

I will soon send a support patch against ACPI GPIO library code.

> If you don't mind, let me write this patch(set) instead:)

I leave to you whatever AMD code. It will suit our both interests :-)

> I feel itchy
> to fix this touchpad issue by myself after spending about a month of
> my internship at Linux Foundation investigating this touchpad issue.
> There are many enthusiastic Linux users waiting to get their touchpads
> fixed and I could prioritize this task since I don't have other
> obligations. I have provided a fallback solution [1] to save their
> touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
> reach mainline kernel much earlier.
>
> [1] https://lore.kernel.org/patchwork/patch/1323245/


-- 
With Best Regards,
Andy Shevchenko
