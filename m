Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2876C2EBF90
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 15:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbhAFO0g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 09:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbhAFO0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 09:26:36 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6162FC06134D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 06:25:55 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b9so5356692ejy.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 06:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7j111Q6HoluCin0ra5zMiFvhg7HpgeQ4+yYp4ShmQM=;
        b=fdEvfLQZdUVCC38aHuVO4i5G+yFVmp3Cmk32HpRrL1G/7Hz2kCPGaZ9dPmXhV/ENSE
         XpYupsbRmnhQLgHsm2G80Qggg86s3tVat6M1M8D+UYsi7R4QB0SYPZgUJChgRkAwtpAj
         19sCKAYs0v7jYeEXDQCLwrIBt5HULkEfi9+mAzqpPzAHq00bYDIzewU2SH4vDC+Q7TBC
         fDhlVUTf66PzmXWuXUyEBjvTh7iovBSopDDrf6Cpo4nFgt+ToGf0tb0fQ8X/s7vMB9Fn
         D9vI6gOH6VfXsLXuVAI+TmCeH7nFI1hyyDwaRRtPddm2kH+aFdWRhGc+FgPDnzOT+Ep9
         o6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7j111Q6HoluCin0ra5zMiFvhg7HpgeQ4+yYp4ShmQM=;
        b=FL9VybdM5o0O6jT/BtXY51jXlbLUC//Fdgopo+UzWBZbkUcIdpAsw8TqNJlh2GMmsD
         QuS8Djb/CiZMZfFhtMz9WZGnSbX5bPLPj3LnrgalMtO7zMNqVU8z9EEAx81hcqa6bhHO
         QyPOhtkx4h3UEcF2b2dRdhIIKk/wkiEIKUj8oNvcWb7V5l87QhHXLf/UwBgeLFRF//i7
         5mx80d4f1WSdsJ10TafWZT8FX5X74KoSAliBknQF54/xWGLFaJqotD5fjevyZP1RKAAN
         b1beqSuNFYREYs+mthPRAelyoEipYj2HeBWWi9JQpEwQyDpCuLSlg6kbcZkMfrZoVmDC
         nJqw==
X-Gm-Message-State: AOAM530euqjmOrFlmW7NFF2uIGyNgZIE4xnclgmGOG15naQRv8stGmrQ
        c2a9FwVNycVjR5JWETtLwFxEcb7hadGIwX1RFSVapQ==
X-Google-Smtp-Source: ABdhPJw0DtvLwW/qWAfM3j7u3+ppyUqH++kYdY3b9AhRWBuEXC22CB119gMvkAMLmGiKGVUhCkfTZdo7/t3o4nlE8nM=
X-Received: by 2002:a17:906:8594:: with SMTP id v20mr3020672ejx.470.1609943154156;
 Wed, 06 Jan 2021 06:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com> <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
In-Reply-To: <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 15:25:43 +0100
Message-ID: <CAMpxmJUZqFtsFo=fZ6F+fcy3mvY10s0=mo3_Z5cx=6H5qcpUxA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 2:34 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jan 6, 2021 at 12:09 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Wed, Jan 6, 2021 at 12:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Jan 5, 2021 at 6:28 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Jan 5, 2021 at 10:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > > We need to make this namespace hierarchical: at least do not
> > > > > allow two lines on the same chip to have the same name, this
> > > > > is just too much flexibility. If we name a line on a chip,
> > > > > name it uniquely on that chip.
> > > > >
> > > > > This does not affect device tree and other gpiochips that
> > > > > get named from device properties: the uniqueness
> > > > > per-chip however affect all hotplugged devices such as
> > > > > GPIO expanders on USB.
> > > >
> > > > ...
> > > >
> > > > > [Dropped warning for globally unique]
> > > >
> > > > > + * - Allow names to not be globally unique but warn about it.
> > > >
> > > > Is the second part of this sentence still ture?
> > > > Maybe I missed a warning we are talking about here?
> > >
> > > Oops old text, Bartosz if this looks OK otherwise can you fix
> > > this when applying? (Just delete that line.)
>
> > I can do it alright. But in the context of user-space I think this
> > doesn't really change anything. DT users still can use non-unique
> > names and libgpiod still has to account for that if the API is to be
> > considered correct. Is this change really useful?
>
> IMHO it is useful and the earliest we do the better.
>

I'm wondering if user-space should make this assumption too then. That
a non-unique name is either an error or signifies some special value
(N/A).

> > How does it affect
> > ACPI users that already define non-unique names?
>
> I suppose that in ACPI we don't have many users that do it on their
> own (for IoT Intel platforms GPIO expanders have unique names).
> Also see above. I prefer to have a bug report with a clear source of
> the issue (like a table that the user can't / won't change which
> predates the date of kernel release with a patch.
>
> +cc: to the user who lately was active in the area.
>
> Flavio, perhaps one more rule to the gpio-line-names property has to
> be added into documentation (Bart, same to DT docs?):
>  - names inside one chip must be unique
>

Once we have a proper, core yaml binding for all GPIO devices, we'll
be able to even enforce it if we agree on a set of exceptions.

Bart
