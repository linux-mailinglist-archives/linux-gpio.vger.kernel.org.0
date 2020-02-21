Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998B8167EEB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 14:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgBUNpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 08:45:17 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40410 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbgBUNpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 08:45:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id c23so1523776lfi.7
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hndYq/hvuTQ2lgb+uDJJiLZLvwvgOhX4+x+wDseLksM=;
        b=D6m5Gx7huhhh7gdrPjKZZTKodPH+VJBd7jLXv4HQu/pErnlqMfDSIeF+/Fk9ho8Xi6
         SDtlO70M+qTWb26Zg9yOElNX3DNkm9LOKpwL0Z55aq4wKWR9W9+nTTVQaRecUvfhoviz
         sbC6aEIkyg2dn4VyOEH0N6Q9LZ86xAFpLQeT8CBKtMg3gaJ+P+X9DVwTAK5GXipVDZHp
         XS0l90I6ZHZZCYafFBiJ/XuwaSlrwsHRA8tTQ+tzApIbRHimQdkd1BQpqEj9c5Q5L3Qk
         ujZ3ZW+23ztbeDUWoeGMPmIb9DY3xy27O+oGZnb9dAMSh9muZh1kMSqaJQ75GVtEYRYM
         24sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hndYq/hvuTQ2lgb+uDJJiLZLvwvgOhX4+x+wDseLksM=;
        b=MQqNqo+O+CrjAuPFNBl9Hm6RO0Yh4bJwFwsnf64OwyMuySAwUXQNp6ZlWgpTQr9i3K
         Yo0fE7vGsP/JI3IhraqQq1vnxHRFBgsi3Wqpxvaq6OzRdKVrUTDRQR61FXpogUnWVYpn
         OzVpayPSScZRwci57uh8fbtp/KQrXYH/+/GTEzk/oF7DQpb99uSs7Pmxts6vGMXgoLl/
         2BtT6Wh9OTP7eyw0XVg8ImWBGB9sJ+rxBJKkDzdmfXcEO8ndMZE3W2OuMESmk9J868BO
         3GLGpT2LxqMG7YaF1Rto1/kuf4xIlWH+8hLBsntOz1RRc/uF/HfD07AVeosuUQW+QxVq
         ohqw==
X-Gm-Message-State: APjAAAWoa0iODyGwxTTUCcM8ME1ZbSkuKaoU/8UoZ0d8EfGBPO6EmS4q
        q5TUlfjPbTgxI7dpbS0WJNBWNYSDlkbu3OyOgUuhgIaVB7A=
X-Google-Smtp-Source: APXvYqxoapboUoEkJoxhUkJEVbZMdob4xVZCqQ+cCbE7awK32LSRAnI4GtKJTVv6OiaV3ZNjbPljMj3NANKLQQjyDLA=
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr799008lfy.77.1582292713960;
 Fri, 21 Feb 2020 05:45:13 -0800 (PST)
MIME-Version: 1.0
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 14:45:03 +0100
Message-ID: <CACRpkdbL4rSDfbzJSF67o93WEPaDB6th2MtaQQG=JQ6r_3DxFA@mail.gmail.com>
Subject: Re: [PATCH V3 0/7] gpio: zynq: Update on gpio-zynq driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 17, 2020 at 1:33 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> This patch series does the following:
> -protect direction in/out with a spinlock
> -Add binding for Versal gpio
> -Add binding for pmc gpio node
> -Add Versal support
> -Disable the irq if it is not a wakeup source
> -Add pmc gpio support
> -Remove error prints in EPROBE_DEFER
>
> ---
> Changes in V2:
> - In previous series [PATCH 1/8] already applied on "linux-next".
> - Fixed checkpatch warning for spinlock description.
> - Added description for Versal PS_GPIO and PMC_GPIO.
> Changes in V3:
> - Updated commit description for PATCH 4 and 6.

I agree with Bartosz, this looks really good.

If you fix the remaining commit messages and post a v4
we can apply this series.

Yours,
Linus Walleij
