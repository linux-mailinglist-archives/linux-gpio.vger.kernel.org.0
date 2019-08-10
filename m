Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49BAA88A00
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJIXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:23:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45529 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfHJIXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:23:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id t3so5590343ljj.12
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzBv7K5BofKX13k8kbimChFarn6qHI8jGUH0fZd1GvA=;
        b=RM0TYXCi62u2YBNalYl1Yx9oNk5f+6mlDWYlQu4u7msR1ktqUppznsI2ZCsUPbvl02
         rgEKreizg5fAAwRNoPYaObeguxcDJejgaRqVTap0pTW85iIBhFkyNM0JZEbBi1DEKrpR
         aoonlICrpTDd14/w8XaYbbJPORxtgpH88cP/9LzdrFKW4nUbzNWcR6BoBWbqTqsJQSPr
         0csixXN7zSmMXkdqRRF2oBjHoeowK8tfUzvyB7ol1b0rLl2aaLhA9tUv+RLYD9tHom9p
         sG/tc9d7oD+JPYcAzMUWfPv7Xp626egYTbULAHuryijWDmEJ3Slcu5z0gQeOzPdCHqP2
         5mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzBv7K5BofKX13k8kbimChFarn6qHI8jGUH0fZd1GvA=;
        b=ap3vYsQueX8qK6s0MeTobwCy2hpdWK4Tr25hGOncXWJGOGJJqI9qC4GmY1XbOIsJZz
         q2okITg3C+Looiw0Yjm0/hgCLVmnLMrKp2qs7ymgGRGbRvY2CGg5xTdMmngOydrtt0qV
         lYXuNOJ6oDGa3nE8zjKJpYUzWI1Npgitq9byulN2Px5feOFwzDO1BGl8uC8E/y0zTywv
         kJqvsLQUIZZTsr2Fpf3e+0FyeyRXfCumB5wPJQ5Gjg4x1saUnLv+I4jdNm+IcaFwYZzm
         BDNQehJ6EkWyJLwo8OB2lOjY+TM5Wo0kEBpnliBh1nubFuwacpJxPDqt8nf/GeMF4SjL
         J1vA==
X-Gm-Message-State: APjAAAXr7SDRAnE4SSHym84hEcep2cWpXse4f7egz6jR0IAOL7rC0nWD
        OgcFlzFMggErV9GGHczSWQElNDvmSlPBFenMx7OTrg==
X-Google-Smtp-Source: APXvYqyOjp5TNibY5OAd1Oiq/YTAM5sw2G9c95ipznj0gScnzsuXUEDz41dZfVyu8Sga0fDqRjoUkStvriRZSB/83gg=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr8049298ljo.69.1565425422610;
 Sat, 10 Aug 2019 01:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190808074329.15579-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808074329.15579-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:23:30 +0200
Message-ID: <CACRpkdY8xV6uZbbkvykMN44xC1CNEG8DtEGpo=2KG1sjXDsf-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Add of_node_put() before return to prevent
 memory leak
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 9:43 AM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
