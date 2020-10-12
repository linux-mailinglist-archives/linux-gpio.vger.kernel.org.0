Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98C428B980
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 16:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390407AbgJLOA6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 10:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731400AbgJLNjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 09:39:33 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4141DC0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:39:33 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id t7so14740060ilf.10
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNRDWGiKYqMQidlnoAE3BOP7fP2lQ+QUMyU4eaVA5RY=;
        b=bv+dfPkKeeIPGcSOUTnd0nTH94tF4kM+6s7N3PiGDsBxEEDQYN+Gded5BdIWtVgQ48
         tqzYgUKqPLzkk67m+uzUEMxqYnLAnGFYcRHGbDqztWeulwuMArqXfvXq5mGObBaKIFSK
         TnDHU/cGKpXXMSaemBAEFxrLWXOXF590ASrl5TQpO2LS2/O/zNDYgE2RJGj2PhI9N0Z2
         BQhAwB7ESpykOxVEZd7EJwcczbeWi+ke5p39B8ru23G3xz7E9rf5ghxjilYwb0SpvucX
         Qi+YogSdLE+jEAkvRi0Bi7stpLYmX3nEA9xveKB1iOUyaq/Y6U1I1cfNWyyY/xfd5Yyx
         xqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNRDWGiKYqMQidlnoAE3BOP7fP2lQ+QUMyU4eaVA5RY=;
        b=bg3M20tVbgBdxq1wcmNSKTyBctCO5SQWP1tuFk6cfA/zL4sWC2rUGjJuLFXRvc0k3l
         EHRjBW5StntcVpHYPPYC7JQMEEX+JGXDDQLeETSsfxXC8OrccZ0CJCVPGBryIVkclm9h
         1upGGzpoNIVxMcmtP0IsAM1wFrsVz4rPTkQ1SVPuweZsGTdShMXC5a4hLpR5CLE4bmba
         arGbtLz/iKOYnXYO8tJLsSR0n0vETd2HggB72hdx3IB9f9lU5G7OIEF4PiOgL51IzuMX
         W/kxvX6t4PU6g2oSfChg8GgYMtOQT2UZog53SSE+w7VhP8FbHfPuyofSJhx5N6jf5h1r
         kylA==
X-Gm-Message-State: AOAM530eslIsTvLk5eN3t59VneHydnGQqk09EM0MKfjtMyy9S9XKLkxb
        gO6a7SAZHSTs+lOPgzFLtywgdaEPjqRueVJ5ZROqaQ==
X-Google-Smtp-Source: ABdhPJwv4mGRpN/8KAQzTc7MJ5azcz9HvylR+F/kPU+9a1Tt4Ia1gG1nPOXrAC468y9R/gZtaO7coccM+XouxdJb4ag=
X-Received: by 2002:a92:ca92:: with SMTP id t18mr19306698ilo.287.1602509972447;
 Mon, 12 Oct 2020 06:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com> <CAFhCfDbtK=d6PJHSfYFnt17vqC=TzbWD3reFYgM8WBXgS9gUYA@mail.gmail.com>
In-Reply-To: <CAFhCfDbtK=d6PJHSfYFnt17vqC=TzbWD3reFYgM8WBXgS9gUYA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Oct 2020 15:39:21 +0200
Message-ID: <CAMRc=MdCWsdRm5eiti6ZHHxZ1UJ3+0+acTdcrE_pq5hmhV7xNg@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Jack Winch <sunt.un.morcov@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 1:01 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>

[snip]

>
> > We still haven't released uAPI v2 so I'm open to some last-minute
> > changes if they make sense (as you explained in the other email about
> > in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
> > to hear Arnd's opinion on this first though.
>
>
> What's the timescales for this?  As I would be doing this in a
> personal capacity, I will likely have to look at this over a couple of
> weeks.  I would also be limited to testing on an ARMv8 platform, as I
> currently have limited access to hardware.
>

It would be 3-4 weeks from now.

In terms of effort: it doesn't look too complicated. It looks like we
need to add a new flag to the uAPI:
GPIO_V2_LINE_FLAG_EDGE_CLOCK_REALTIME which would make the edge
detector use the real-time clock. I wouldn't stress too much about the
performance of obtaining the timestamp - it's probably negligible
compared to passing the event struct over to user-space.

Kent does the above look right?

Bart

[snip]
