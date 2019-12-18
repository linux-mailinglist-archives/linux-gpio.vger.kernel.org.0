Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9C6124ABB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 16:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfLRPJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 10:09:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36110 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbfLRPJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 10:09:49 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so2540803ljg.3;
        Wed, 18 Dec 2019 07:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhJbWUsWwTIyi0nz4fJwHURTxI1Rw4XYrR+51bn6K04=;
        b=n4CnIRpgiWYaPqhrTGDqoNhiTBR0o5Z4TZgEmVJjUqrcxs/eZ/RmRLpYvIVEjSMOuw
         zj7m3K6IjnEBCb0Znun9ZsDmmSn1LRVTajc0FgbgZMrc6WGWZUMFHAASKtM7AI1xdD+x
         B0nJEXFCWymrx5jxZ+vCYGBdE/nRahl8x+0BZNk01+p865de/TDTBDKa2Er4pnzvhxN5
         4+pmsqRkwZVO5VdTu6YWuFDTYVudquuDrwZkO5oJ4rXj00ugbbpz86t8pTfa/P+Y0w4X
         BQfClWxwjmtj/ejYcqXHblGAqzIUXUWDmAtlo7XoQtG4Mro9KTRTQm3w/ajdp+uV8l0r
         NDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhJbWUsWwTIyi0nz4fJwHURTxI1Rw4XYrR+51bn6K04=;
        b=nekby59T0NtauZtOpEYXpBaZMnkGLfTitnriXgRZ8eDMAVKmKrRYuIT5/dEgXMoN/J
         67R3Fl/7Dt7dGXISGr9P5IrXmtXi+AlGIwJQf/UntEkUTlUF/wPvuE2C4yy/4DsTKSx1
         pYZX8lBgBJrl4NzPwzLt67kzFfb67hlvRb4ElH7u432kDTH6w1mdr1SFaII/YughiNJz
         6LqUW8wGXshRqcP+aadZnYMbiG0L5C41t+z19BxxgQEomwWQR7zlXMXlr1TC2Kpx2ylM
         iLx71TLcsvoMqwRxewsMORXhRktfYanvO/KOcokkLJ5sjQO8GTkrOqNDQbRIgooUaUlm
         TyjA==
X-Gm-Message-State: APjAAAU9MQGjgn4/ZpQLMCAmxASQ4UeQ9hc8jp3C9ZfzdssLbVMDVpQv
        h847/MZMXI6cN6za2tovO5NHAhxUI0GFkOnMhKY=
X-Google-Smtp-Source: APXvYqxcQGEJtnYA9Dox6wkCmoNhgi0nQlVxmrljxdbiXh66FZxbDmoKUQbvXOU6f+M6uubdRb2209sGGo+XVq9qTo4=
X-Received: by 2002:a2e:814e:: with SMTP id t14mr2079402ljg.149.1576681787440;
 Wed, 18 Dec 2019 07:09:47 -0800 (PST)
MIME-Version: 1.0
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
 <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
 <AM0PR04MB4481B3EAB2DDC42A137E8AAB88530@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAOMZO5BK0Pa6Aw6n7Tf+C6+Fg15WNbEUOzKCQTaWqTUu6yoPjA@mail.gmail.com> <20191218145955.GE26938@lunn.ch>
In-Reply-To: <20191218145955.GE26938@lunn.ch>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 18 Dec 2019 12:09:42 -0300
Message-ID: <CAOMZO5BibF5A9sw=fLr3DXLf9LXYdxWy=aK7KCE3L0bt5eX+9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andrew,

On Wed, Dec 18, 2019 at 12:00 PM Andrew Lunn <andrew@lunn.ch> wrote:

> Hi Fabio
>
> Look closer. This is not about returning an error, it is about
> printing an error.
>
> I think the API could better. A %ie formatter would make a lot of
> sense, so avoiding the ERR_PTR().

Yes, I think that returning the error like:

dev_err(dev, "Couldn't determine irq count: %d\n", nr_irq_parent);

would make the code cleaner.

Maybe just a matter of taste though ;-)
