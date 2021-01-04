Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCBD2E97EF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 16:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbhADPBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 10:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbhADPBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 10:01:01 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C5FC061798
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 07:00:04 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id iq13so10235537pjb.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5UdJjQc0UZ2A5YydAq7QM0JpsrBvPlx4ee1JuFyPwU=;
        b=rLhIkyp0pG7Mr3vALYs/5t76IX82MStmw6hNhaMnSz2DL5PxXTuXQu54MyTV95wjPe
         f6s7TVfjxqbOO0cHnnz8EnAaorgW/phN7jBfiBXOybxSC6GyZ2tnS3gb8tfms4jS/chb
         119Iqn51nxMVvOgGVB5LmMwfVAYk+GLQ0Q8gkWnvJ9JyD4+oyPwXz9h5HvQQqNzaSB3l
         NyXDXfvlqmEbh3H2RhXq6UKLOPl5dJFIIOGplEEuoLKuD4w/3DC4KxflbRKi9u6w0Zw1
         kCQ0SEAi/gbnPU7Tv7j35Mg+5YdC6RkOetQAD/dtGO2Oy6L8UvEJrKyjZ7iQowKFWFxl
         cnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5UdJjQc0UZ2A5YydAq7QM0JpsrBvPlx4ee1JuFyPwU=;
        b=azKG9+mB40EEm+/c8KroYkIYwxmcGChOBjTp7LUTAI3MkOp4c0ukmoVguB9GJeYvry
         sGshTY/OtT4sNSImJXIUvLp+R/JrPaI8LPmQKOCEpFLD9/ZwoC/az5ES1jNt66ZOnonU
         AtxufsEfDfjKw8uZDD1BBRn/PChE86Okmjh5pHF0T4q8hBmGBAsGjEEIu51NXaIbyX3K
         Xxvp7HQjkWaJOhIrKyMrpdG4kzV1z+bNa/UByB/JeB5qG4Vn2uMFf9TkLEpuHqSrcJ2Y
         NdFG9IbSSfX+3fCg9n3frSw4jxhkql8X/pVanE6obyoOS5kCQ2evoKawsWQZ7Yei2gKm
         tCdw==
X-Gm-Message-State: AOAM532hXLZNRsPxkv8CXILms4FJlwOHf3uNap5Eq35iU+8FZaDCpBd7
        qJNMEuRzAtuBzDHpeQC2rMJpIxuuMQT2Zelw6qY=
X-Google-Smtp-Source: ABdhPJzc+q1AS5qWwrv1jveupEYxlc4MyAGVYhGJp7tE4AOx0AXVSpM6wirfEDjx4tfHLxhoRdRbNnZ2QloNjYi5A+0=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr51812952plb.17.1609772403955; Mon, 04
 Jan 2021 07:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20210102175859.335447-1-adam@l4re.org> <20210102175859.335447-5-adam@l4re.org>
In-Reply-To: <20210102175859.335447-5-adam@l4re.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Jan 2021 17:00:52 +0200
Message-ID: <CAHp75VcszX_zXpFcNFHXzCFwWdhQHFvYKre=UUMUVjdfyrBwrA@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpiolib: Fix return check of __irq_domain_alloc_irqs
To:     Adam Lackorzynski <adam@l4re.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linusw@kernel.org>, kaloz@openwrt.org,
        khalasa@piap.pl, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 2, 2021 at 8:24 PM Adam Lackorzynski <adam@l4re.org> wrote:
>
> 0 is not a proper IRQ number and also indicates failure.

Hmm... While in this case it's perhaps okay, this does not work in
general since the function can take irq_base == 0 and realloc == true.
So if we want to have a code that somebody may reuse better not to do
this (we never get 0 from this function).

In my humble opinion NAK.

-- 
With Best Regards,
Andy Shevchenko
