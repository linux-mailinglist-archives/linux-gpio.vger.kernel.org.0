Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E032C0C06
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgKWNj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbgKWNjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 08:39:55 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4BEC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 05:39:55 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id f18so37371ljg.9
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lBxwRMELSYYR5zOAyumFnn/Ao6xysXUlX+NLYD7cTec=;
        b=H/axjPa6BBTm7OpR0TiZXirgRWalCDPzgA6zkRHRYwb8CLpXixTsbIHwaiGp2HbNiY
         UaooxI+X3YSZcThTgQgGZzNfUup73ZiT4enFs3KoST3/1RbwJtrrUQd2DIdMYNMkzibh
         N8TJt4Ei3s3gpP/llY+FdGrwLv2TQj2OFbtqAfMGXDD7T/2JrqVQ6gGtB5sqev7QkCRl
         hmtkhMsn0jQqNg27nP9J3Umf6o4Pak0Zrzs3zAQvdTjgkh60srDUqcxKistxvaN8Tj66
         rc+cDSMM3ij6etNT2SuyRWXzTmKiTuLSHgXN+YUz35gYJzFgoe+aizp/cF8P6TfvYjPu
         Abrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lBxwRMELSYYR5zOAyumFnn/Ao6xysXUlX+NLYD7cTec=;
        b=enbImCRE+kWJ/B/mQ+KPqanmRv4yDsgcrGKBNWv0Eu4th1n+lpmF/EYHvD0NxR5jhp
         O9+8iaDDC3ycXnggNG+OnuKxqWGrpZAk4YUO9hpyvTiRxYbdDsM1/YYyJIckLA6+NcSo
         OjkZSdkNoEtJmOaQ6lnWofcBRc8C2bDJ5Fx6QMC5VG1esN+D68ufY8K11+7GJc6qu+XP
         w6sY0XSnvZzMGLav8v+0DS5TG4M1SKO5xiuWT/XK+L5u9g2C1HWkDf8pcs/JvgWRTo5e
         OMZC+kDuN8bkoQ0eL3k4ya5apVawR7CdOKhG29lkhi+ic7sJLncwNhrrAV0U9gAdrAz5
         ofLA==
X-Gm-Message-State: AOAM531WkabJQ84caMxEtSZwHweFoDUL0Ty14h+QVDFKW4yKAmnboCrC
        ncow0BK5R3/Otl7vzNDjkVqnveBbvDqEw+WnI/2Mfg==
X-Google-Smtp-Source: ABdhPJyEys2B6f+oQ/DSlEaxwqOPntnsN8Oax253BKfZam1RjOKfmPhtxG0A5qhFRC3SGvQbi6Jthn6j8PcE377KYjM=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr13996151lji.100.1606138793546;
 Mon, 23 Nov 2020 05:39:53 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
 <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
 <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
 <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com>
 <CAAVeFu+YtiZ69btLyiZvPwXJYo+KW6T9SyhrJvd_4L=qJqJhpA@mail.gmail.com>
 <CACRpkdbK=AAPQNGaDkHwS1o7xopZkj-7cwJGtFB2N9=q=sLjDw@mail.gmail.com> <CAAVeFu+id4=-frfrvVaH6D2XY-eG6b0R5vNpZWfV69PnMaONnw@mail.gmail.com>
In-Reply-To: <CAAVeFu+id4=-frfrvVaH6D2XY-eG6b0R5vNpZWfV69PnMaONnw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 14:39:41 +0100
Message-ID: <CACRpkdaFiuOemPPaEgyDepZhhphTApUxR1GfrHWwiBb_JGmT6w@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 10:28 AM Alexandre Courbot <gnurou@gmail.com> wrote:
> On Thu, Nov 5, 2020 at 11:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Sorry for the time it took to get back to this, but you should have a
> patch in your Inbox.

Thanks!

> > FYI when it comes to GPIO descriptor refactoring we are churning
> > along with it, my tentative plan is to finish it before I retire.
> > I still have ~22 years until regular retirement age in Sweden so
> > I think I might be able to pull it off!
> > If you would feel an urge to jump in and help out here is the TODO:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO
>
> $ git grep gpio_set |wc -l
> 2649
>
> Yikes. ^_^; but it looks like we are gaining ground nonetheless:
>
> $ git grep gpiod_set |wc -l
> 1548

There are ways to make it look better!

$ git grep 'linux/gpio\.h' |wc -l
632
$ git grep 'linux/gpio/consumer\.h' |wc -l
644

Makes it look like more than halfway there, hey!

Yours,
Linus Walleij
