Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE55831D0
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 14:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731883AbfHFMuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 08:50:54 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34731 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731538AbfHFMuy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 08:50:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id b29so53773697lfq.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5j5lFMep8OWyHnkN89Jd2hIhwccXsi6PdbClOXm7U2w=;
        b=xd2gD5GP2knBeH0qSZ92Cm7JtkG6tNUcX3/AME5hp6ZbPEvU1uWxnt7YSr+yJHSAOG
         KTr1I2nslaCd0W/6G8nmnHCa4vIYCYRLHbKdQsvpSrc8ubQXG0QXXqyETkN2hvFhQqkV
         bpve0YXJk9PCYL7GgSk1lU6L0hZE+QCSYeEZa5n3L272Ts1zkydIE29Y25fwp2X7FAW+
         zvp36mmjcu3n06+I5wdOQvBoueT8PSwWYMiOaDe84O6u0IY2BcwyOLWtYmaqKHT4gEIg
         FQLmGzjGGUveheBb/4MPAY+9pDmMF9E5gH3AGWQ+FztNMYo+UIvHAoB5B/drQuVFtsz2
         NHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5j5lFMep8OWyHnkN89Jd2hIhwccXsi6PdbClOXm7U2w=;
        b=cttI11QRIrVC05rllE6IdJEk9vinIBvEZP8Z3gU1kyTj+0HP5JU7RfoSgS5z3/bv8X
         Q3bPNs64zFtuWqN9SXI0XXXH4qO7WS5eSyCP8+qH6ZOXdo36/a1KP/a9O564RqB/CWlf
         vQbufK+Vhrqcpqj95r1BN9XphBbfUSvy9oY8eva/drZ0Dc8hbd6v4kvbyMVTC1C8ciaE
         dIEwCxD4C6ANqGUY5Z/bzp8tBQdhP8hIYMCbQz1ePV1Q/WiHTnMDUuZTHiLfEPBxXEXl
         3OaODsmIbGWmA31QJd759rDNEo7kcSN+2alBuUIYXDOnm1v4yYXs4UJppwQdfEdP6uCz
         QCKg==
X-Gm-Message-State: APjAAAUy5UidX9NBiF9x0bxHtPe+Xb22ftO3z3O17BoCNzonv04GKSXu
        p2ZopXkeKdumuSWp2owybVUQFhIVm1iQcVYHVYTtfYpD
X-Google-Smtp-Source: APXvYqwoMGBk7XdaUh4Xav8n7xMGy3DTiub0oCDZ0Zk9/tDT+B6o/WxR72g0+YVYpAdxHfYhMPd9zMCkm8KuzbxhVfE=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr2430504lfi.115.1565095852204;
 Tue, 06 Aug 2019 05:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190804152745.2231-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804152745.2231-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:50:39 +0200
Message-ID: <CACRpkdYa0-2YSUdq1WcoYCaG+UiXTzipVDExMsQXukhQdxM8xg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: falcon: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 4, 2019 at 5:28 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_compatible_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in two
> places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied!

Yours,
Linus Walleij
