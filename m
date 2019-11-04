Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65108ED69F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 01:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfKDA1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 19:27:06 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38678 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbfKDA1G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 19:27:06 -0500
Received: by mail-vs1-f67.google.com with SMTP id b184so6398141vsc.5
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 16:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmzFkV+LWmPIPCpO9vig8cIX344TiBjHq/XJjQsUEzc=;
        b=Eb75dHiMRgqGueG6+m/QYIMo/m7wb5ZNEQTIOJB3hYG83xWMzRkhNji+5AA6/UGFxw
         ZabnonWMCzKqdRF3bSW4RGEd4/TkzGN5qizCdDIWoGIkvId8Cca5n/nsQ3Vukz+O5xoD
         d//p1fLXgM4+aULE9bcLfJQTHPIjHLTArKXv9COB3pCQ4Rh3LvC/B7Cy3N2BJqlft71A
         6/Znu6+dhxNiQ4vTbGCWHDrkaCG1bvm2/qeEMAcw0ugW57iyjRI/zfUdwyN3ReHw2E6f
         Pgp2ivlJIzGNjWOVr1V8nRHJcmvscRFwoGRCqxJp4nDZiAcK+mv78a6KrjArHikE5c3H
         aLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmzFkV+LWmPIPCpO9vig8cIX344TiBjHq/XJjQsUEzc=;
        b=qGal9PHKhL/ppp5b2zURa9vifvMH18xUsshj7qyE+XTRT1fhVnJZ0lJOt1co5hxI0n
         16adUvgzjDZ4NUIqj1FevGYzN5YKpHY5IkzGMxv44GFF0jucsXVkrwFywIbuesIw02Q9
         sudMKPNFfge9vbwmhM38q8Ivd5NrnRt6AJttwUL7ylRDBFoP1er6KUYkXtgRzIYHZFpe
         PgC/oJMP4bc9u+eVgQ5rcGGyvWLwHMmXRZ99OXJYSuevc5Sd/PKW+NPXOOCMRD8wNNZm
         NkSl8i8+UD+mFkKkca6b+f/+CDpWfH52myvLj3B43RIsTSPdrRPC2qg4AhELW9cHAxeF
         QLKQ==
X-Gm-Message-State: APjAAAU3xJ63ll5jGe/YesQlaIrael2Uh3sbkbzFtDV9jbDV3TKeH/Of
        XWr4ljH4NdyaBxODkkY4MkTcj+HeC5RqK9mRCnHlOA==
X-Google-Smtp-Source: APXvYqwrGK07eKZEhiDt7mBtyIqE4qjJOcNW9wsGWCIphsAGo/w165bILKaA3YA7VB8y3MuwgqOIspIooVMmzn+mU5Q=
X-Received: by 2002:a67:1181:: with SMTP id 123mr802288vsr.67.1572827225315;
 Sun, 03 Nov 2019 16:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com> <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
In-Reply-To: <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 01:26:54 +0100
Message-ID: <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> [Kent]
> > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > Gross control means enabling and disabling of bias functionality,
> > not finer grained control such as setting biasing impedances.

Right, excellent and persistent work here, much appreciated!

As long as I get Bartosz's blanket ACK on v5 I think it is ready
to merge. His consent is required for this.

It looks pretty much as I imagined it when I discussed it with
Drew some while back, with some gritty details fixed up.

Yours,
Linus Walleij
