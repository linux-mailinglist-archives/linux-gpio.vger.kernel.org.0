Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31D1132408
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgAGKpU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:45:20 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34021 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAGKpU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:45:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so49402489ljg.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C9S9o2rObb9NcqGJD/gxTAUBsVVzEmnZ0vQA6P9vvWw=;
        b=n7E50cMJgd8ZK+yZ/PZ0NrJg9YxH73/VHIkmsyonXLf3Cso0z9KB2VFwWTOt9Xzf4B
         /zyNRQIA7ik+lq84fT/CQn5Pnv7PhEP8Hmsv3PNtGobLUkgNOhSYL/43dAMhUMA3LhHz
         HHTDjFubRwbxkD8SEXOm9Sqe9mdcAGeDLth39DRwfDqNDZZJdwoqKTKGlzsevGn2lQPN
         q/itCfr6qxQHTm92z1Sk5+eidwdUG6DhbY+aRn7rco7AKG6deXKKkgACqlgVjutT5NEG
         xO1Sgaf7yUSKLEsDHrQ0WeZKXr88aQnlH/kboi0n6fEmWtJq5n+Oo6+Q1VO8HG75H8W/
         vaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C9S9o2rObb9NcqGJD/gxTAUBsVVzEmnZ0vQA6P9vvWw=;
        b=EzP/R4Y19miXiQmZh1HFYhbU24inMX1CKOL8PWoT0KEDrHOYPxEIbsvRzB6CDLKKXa
         1ZO24Cgru52mwNxTgCQg9qUzoHiaCBMo6FzWqOmdjF/zEHGUCyKZW5wXXdeLUp6baXB7
         obNKTcV1t75U0nYxz3p2LQgiTCQWJRKmto1vqzrDk6FKRqpTGdBZU0IAeBeMa/PR7IsT
         Bb2k2SPqiQskydJeYu/dLbD0SSbIdeJtgfoFSQYz+yt8TKD0iSQjvIqMl8zXOSQUC3xi
         97QkR3gKqMEHeEViyp8yeU8QJQWd+p/5jjaUAAj71s4SECoN6xtrE6qlKiWGWX/+Fl2G
         aZGg==
X-Gm-Message-State: APjAAAUMDR/9/t+mxgpU2ZjhT1maVUhlbxPorGEaGa1mCtUCBNdB4zlv
        w6z9qMjNO2ZWP7Oo8R1T5Xc6qeB038oCOPNnsXJ19A==
X-Google-Smtp-Source: APXvYqwKhnJxUXNI6n4/K0m61QsBl8AZobfZ5X8p7GpweLe3H/vUr4fwKKptKn3Pmh8UUgxfJ2f+IKh6o3+WhaNxMvk=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61274799ljj.191.1578393918200;
 Tue, 07 Jan 2020 02:45:18 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:45:07 +0100
Message-ID: <CACRpkdZxQCfyWgWfFtnxo9wvV7z2d7jCLV5fBKW9wD2ZnQUp6A@mail.gmail.com>
Subject: Re: [PATCH 16/16] pinctrl: nuvoton: npcm7xx: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The npcmgpio_irqchip structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
