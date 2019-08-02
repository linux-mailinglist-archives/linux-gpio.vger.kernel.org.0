Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F25802A6
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2019 00:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732584AbfHBWUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 18:20:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34195 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfHBWUM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 18:20:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so74222384ljg.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Aug 2019 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZ48FMZQTs4uLcOa+ewd+uatrSZkDn8qdysdEWbOPPM=;
        b=c11DsE6xhXFUkGZOKxS0st145dWqvewhcd3fQlz6reUM8JMeFAhgV6u4i+TozRJvOo
         sKH5UKHncsWaB2Xjfz8zRmJm8YpIFS1WpghI8V66dbRbM/YCMrbRdoOOGFjkAw2VUDd4
         XeMVfXUsMg2le9LZ2rOUIV+hapnOY1oM85zlQapDge4ELyVgXchMO4Mc74KZbF1gXQRw
         CqbrPqC0Tx7XdvggiEfEoGga6UZEwaZsbj3bN4hJ7QMGjvdm5rhbcl77SyloCyw7b5BN
         SODi1TlVZcC/IVLwZydxi5Vx7TJZ2gKURa+2D9HfIPnftiW4ftpjrvsCVhZinnnEtmf8
         s7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZ48FMZQTs4uLcOa+ewd+uatrSZkDn8qdysdEWbOPPM=;
        b=MAFJtSU815zZt+wMLV3rjl8lR9hKB7S+hydDGGZTq9/SsFPCsoGmGLt843iRYm5jix
         kpoohEvCMkmY+6YCr6ozIIXi1N7AbqShsxgbf7DpcK2+6pWCObr5W+sLHoTVFHwN/HBp
         oAU5P+ZvaVu4Oo9bDXJtE9+4TiBM7PkJCcNNocpf4UqD0iiWiPokwoqLFk2WBlBx3yV0
         LYcbTGuQVVRJa3tLf2ZZcpeDXdtNeT1ylCwZta3FGQJKxUvco9dJTiGJAfpGZ7dc+E2a
         Qjjw1Lk0NQ4i0i8m+rLXc6AxsZlnqRH9bulU/zpje3ZItOVNe3Ohgy5t44zDDsP3Hnkd
         EkNw==
X-Gm-Message-State: APjAAAWOiDr1ABERacG7cgX9C6StDtFrZd9s762GtswVfkikx8kdrOjB
        jenRV0r6N+ds2t02KgzOn1Km/mruHcCAAjupyTA/Og==
X-Google-Smtp-Source: APXvYqzlGf0tKCzKwDLVMNReMvQcDY2AOLHnYQ7fYCG4kMKmoHKNejXmOFBQGqIQflfBg5mRKfTF8g1MtfHSnrhNYSs=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr73630699ljj.108.1564784410398;
 Fri, 02 Aug 2019 15:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190718094902.15562-1-hui.song_1@nxp.com> <20190718094902.15562-2-hui.song_1@nxp.com>
In-Reply-To: <20190718094902.15562-2-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Aug 2019 00:19:59 +0200
Message-ID: <CACRpkdYRg8mMe5yxu=+tC1uz_usyNyVjn7NFobSUZi0rR5uGjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: Add ls1028a device specify function.
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 18, 2019 at 11:58 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> There is a device specify register(named GPIO_IBE)
> on ls1028a need to enable in initial stage.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied.

As noted on patch 1/2, send a separate patch to add the
device tree bindings in Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt

Yours,
Linus Walleij
