Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4210E3EB21F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 10:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238974AbhHMICF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 04:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234844AbhHMICE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 04:02:04 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427FDC061756
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 01:01:38 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id go31so16787292ejc.6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dcB7j+QBQE4TQSouxuBaBrU8VbKblpxUgxLBcB1F0H4=;
        b=MCfddEEg5jMEs5TLHwgdnI8FpY6+5Zs17QNw9PKidk0E/sZkCfSUmuxner0GnG8Hqr
         DqE09L7C4+ji7L+iEPyfLA+c7e4DkQjySHwU7oVb95MKjwVSBiXS/waDX4V+I6Dxv5Zj
         +SYdqFwE+rFNKjhMxEueBKiUIJJs7zqyiKh/jQhW7GnuQ/Ht4mg4pI7FaizlNb5UAR5F
         10X8poJeKsvySOPwKLGJ2t0mDJOIwmtm03iGTatJBFQk3vq0YoeNx4E/tCppWixHkSxO
         4+G/DVwjAQ6Hq+nR8ygEDLSlfxIJ3EA+5GuQuniMl1Lnnc3BlCfSkFXNUSsTPn2k4ETG
         wl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dcB7j+QBQE4TQSouxuBaBrU8VbKblpxUgxLBcB1F0H4=;
        b=SKBnxn8hH3BAqJC5i+WfPKgg1NQswxUMEUM+FTBgVkoD7AmJOBnomE8kMkve9VHyno
         XVs+6MIn+GrLf8//SUwi+q2t93Hu6MCbGT5l9G1Dlub5qlLQkguv/2Bemxmo+mbgkIHS
         xRXM2eQInSlv3Xg5xRUrT8Caf5OqH0w6yS3PQBU283WIIEWRg/va4zIarXcomHw8xlzL
         Z8xLf8G5zbNV2ldZgh1ge5MIT9JSgo1CRRMhzrhrwx8vtYIcwiSaU/huCaZFZNkaDUoY
         tUDT4X4369lBN2ceaGxHZFieITjg0vg0vjo9TOKa293Kmw0Y88ZRowT2c7WqM+nLU75h
         O6GA==
X-Gm-Message-State: AOAM531UlMXBbWjxbc5PxMH4IKtc0wNbFCqf17qRZmxDw+R5uwq2S+H+
        oU8hvJ1pf4dzS0bB+ZFOqFdwqu7h+wcwBbSQycrE/g==
X-Google-Smtp-Source: ABdhPJyJc2sZIH5v7BlBQpyeU8flv4gFru9O/eBAf/1c/1u1kiHkLfMxKZTnwVxpM+66ISKhD9TbJYHQbytW8Kme6II=
X-Received: by 2002:a17:906:9ac6:: with SMTP id ah6mr1276682ejc.64.1628841696820;
 Fri, 13 Aug 2021 01:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210813014413.4080109-1-andrew@aj.id.au>
In-Reply-To: <20210813014413.4080109-1-andrew@aj.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Aug 2021 10:01:26 +0200
Message-ID: <CAMRc=Meru4EtWXq_q4fkpq3FLDoJY2hZsC0xxOetwhf-_c3N=Q@mail.gmail.com>
Subject: Re: [PATCH libgpiod 0/2] configure: Minor cleanups
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Bartosz Golaszewski <bartekgola@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 13, 2021 at 3:44 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> Here are a couple of minor fixes for the bats test in configure.ac.
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (2):
>   configure: Fix 'flase' typo in bats dependency test
>   configure: Drop unnecessary double-quote character
>
>  configure.ac | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.30.2
>

Both applied, thanks!

Bart
