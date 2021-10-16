Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89B343052A
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 00:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241047AbhJPWJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 18:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbhJPWJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Oct 2021 18:09:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A89C061765
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:07:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y26so57703507lfa.11
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtYFng1Uk/yaYSKrJeyCbIBhgNc8Kre6Rcfsm9aoRMg=;
        b=tabQStQ2kVKuLsKT/AZl8t8RVMmUQNIrKv/f/kUZhRL7AtrKQLms7R8PBBPBotET5v
         afQtcGOAnD5ORsRf91EaK0s5DWfZAbvRG0B9AINfLpqwrf6I8xzUmskykpPF1V0+vH1P
         nAqry2oBtTrlC+V58K0Nhii0gzO1RVBQYAfF79dzWw9EvwIRPzVPWiUA0mAmjJI/X72P
         DqCkL7aabiv0C4fs7k6dX0YmdXTwwMsmIufQEU/TorEnMBSAe8EA4Dy/SPPZOwzBWDUS
         toxN1jCk4SY+gB4t3yD6kG1rXG0yglZdryF1g5ZPiM0wDCqvDI68s5uIs8+KSOrrJ8eT
         Cl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtYFng1Uk/yaYSKrJeyCbIBhgNc8Kre6Rcfsm9aoRMg=;
        b=amsIec/vaxs+p43tF3OXYqafKywxusTna2sStfPJpbxMkZiRt0HqvSec+2b3eF4Uqy
         eIYSYm9U+mI74grPTmXDFW11lLZVG5K/U8y3GvXbl3x5louVDIqmhxW/Ef4WyoNxL/iu
         tEiGUa7CJ2I6NQRuGYPTaNwNpFVUvYFUx/JDqZxLbhWFoXbP1dz1cJzl5yR6RXYTbU/g
         VD47ULroBWY9I8w7PEN/AsCeBkhdyp+ztAtZiR8YYY68vHCpEXebQvUQvjz4a7oOWtLs
         cIAc72ikFuziLfduqpAMy4G0dIo8/b2wr2sqFm9XB2tUJrl0unKTC/tvHar1AF2Ft/tL
         aeAg==
X-Gm-Message-State: AOAM531Mii0yjlecjDF8uatTyjWsGYeufNdYZ8ysKYblSzoSs1FZ0nP4
        FJUFHy9uJr6e6jS6LQ2ug6OdLLIB70691Drc+Ad87DYcLEU=
X-Google-Smtp-Source: ABdhPJxGOJ3aWSfE3IJAFM0owr3C0A9MABkjQOj6Hfdmog8eMHRmK4pJHVtA1PNI/GZMkAbj61EYPm6ua3tqlbk+4PE=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr19814773lfd.584.1634422064982;
 Sat, 16 Oct 2021 15:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634298539.git.geert+renesas@glider.be>
In-Reply-To: <cover.1634298539.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 00:07:34 +0200
Message-ID: <CACRpkdbayCGEDVCX25aLvQfB9dF3vRfO87NJTpmuqPjvs1cJMw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.16 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 15, 2021 at 1:59 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fcfb63148c241adad54ed99fc318167176d7254b:
>
>   pinctrl: renesas: rzg2l: Fix missing port register 21h (2021-09-24 15:14:49 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.16-tag2
>
> for you to fetch changes up to f4e260bffcf367523b77f936fe0dbd278581305e:
>
>   pinctrl: renesas: checker: Prefix common checker output (2021-10-15 09:48:00 +0200)

Pulled into my devel branch for v5.16!

Thanks Geert!

Yours,
Linus Walleij
