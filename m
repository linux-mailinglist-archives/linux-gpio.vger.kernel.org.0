Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B0328DF56
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 12:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgJNKta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 06:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJNKta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 06:49:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0DBC061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 03:49:30 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t18so1568964plo.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9BIHI7s2eQ0XOlpIrzlzwLLGbMmMLLu9bylZFUoJVKY=;
        b=Wxz/96V0wcJIVTqVnWK0qXU4cEqRYlpnPYsf30zPGHwxjVsY9x7ukHsOa21sTtqvJw
         MGAmprwgXSBxaCT41yu4pEAKXa2MZiHAdaHpK5dqwE2Rv38nBCVdUtI1mPrs/od3jzRA
         2OHrZqzXa/RkX0D6R4cZ+jc0PLoRxQOzK0FlvChKVYM6puzgk7YEQ9dc8BGObXNLdlOl
         hIlgO6OuIBf0tOTUVJr6wYcQswLonUro7FrMqYqppFq7biZondMuwTJwT7RMyvJpoLZ4
         HSliLOgVNF+pfuEta4Boq7r0SyApn9ey777DDVE5PgFVM5r/alerlm/vcOQcNoByQ2Zm
         7mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9BIHI7s2eQ0XOlpIrzlzwLLGbMmMLLu9bylZFUoJVKY=;
        b=BYTzR3Q62wLq3Q3uKblvKWN378TXb7how7FewO9aaKd3qY4u9QJPUFqvd9ECZGzd8J
         zAJ8fcK7fCo+UxeGB1O3KeNyiPBnI1iIZD0ZLoUwD+sEgLeUE+1s82vMqIwgRhnTt0kD
         ENEC+OAt11DM5Bdw5uEkr4Pw1YVgTCdL1DWlQ7h+QuEzYVAAPj04T4WMYLiph0mcE0yB
         4f53YamLBI9TxG8FfF6QATHEDz8SrPb6906rsn4pVRXnjxK2NQuytwf5QAp6HfpXVb4B
         V6yM/LOyRMhb0Q9Yw0jN0vVDFyVCTlwPphEcej5UiqUGnKy9cdcHXtmbMgceApZfXMrC
         x0Jg==
X-Gm-Message-State: AOAM533BiDlhXq+Co1syAAxr2J+XeSh46iZn5yHZAyzUzOvPFXD6wJvy
        9MShW7fSImdToVPXIsvkhDCccjuWVXdPJ4c1JD1kGj1zQBmJUeZD
X-Google-Smtp-Source: ABdhPJyk40H/5IPb0dJbSYcBqxrv+oXBnW6UPUWc2ZulHLKXj+nlVv4ShNdB9G7iEQcuhajq933s3dnmzl1droljevw=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr2986437pjb.129.1602672569925;
 Wed, 14 Oct 2020 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <7102c0df-8d8b-4ef8-babf-a920ff11bcf8@www.fastmail.com>
 <CAHp75Vd-P56=4PibajRcdnniy2pN6ZXoUP=FiJ1enrFzxKkojg@mail.gmail.com> <0a6036c6-9e8a-4ec3-be3d-aaed6d2bc8f8@www.fastmail.com>
In-Reply-To: <0a6036c6-9e8a-4ec3-be3d-aaed6d2bc8f8@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Oct 2020 13:50:19 +0300
Message-ID: <CAHp75VfbNHT7nNJK5CMpE4VztQ+dVt5ecCWaR9Z4bg=NRTFgQA@mail.gmail.com>
Subject: Re: Specifying a valid pullup value for pinctrl_intel from an ACPI table
To:     Jamie McClymont <jamie@kwiius.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 10, 2020 at 1:57 AM Jamie McClymont <jamie@kwiius.com> wrote:
>
> > Hmm... Should be 0x105, otherwise 2 is an argument.
> > Can you confirm it's for real 0x205?
>
> Ah yes, you're right (I had the 2 in my head having converted it from the decimal 261)
>
> > Fixing the driver would be the best.
> > Thanks for the report, I'm on it!
>
> Fantastic, thank you!

I have just sent a series of two patches that should address this
report. Can you, please, test it and confirm that it's fixing the
issue? Note, the GpioInt() one I will going to address in another
series.

Also, you might add [1] to the bucket just in case.

[1]: https://lore.kernel.org/linux-gpio/20201009184359.16427-1-andriy.shevchenko@linux.intel.com/


-- 
With Best Regards,
Andy Shevchenko
