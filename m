Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A8D298F40
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780890AbgJZO1M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:27:12 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38556 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781103AbgJZO1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:27:12 -0400
Received: by mail-ej1-f68.google.com with SMTP id ce10so13844343ejc.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLuvvna6pWXp+uZmu5zfxCaWhMhHgO96bERXwEhDahE=;
        b=IwlSy2eHUnUydpxy2BD0ebebilvX57zYutDBchqKDHmNuUfP/DTe8nBSv0OBqTfjEn
         vG976ieXWuaW0jqkW1OprHGCeL2PcQ18DCxVDqSZ60sZtbt0LY0Uds1wJBeFoapKYPHY
         r5t1YYeRnLNfyUbF9x13MwN8vaw+HBb19OX7mr/knO9vkftgZAlOWlge04DCHV0odQrj
         cMLbanWCPFKortRGA2TiMpJcS6WMqVU2qwfLXeRDm/6nRxWdwrreYeMpdge309FFIZ00
         A+jrY3vjrAuvW2MAzqt8PfcNu2OLV7wlQVSmRfBxrqLQgWUmHWtUdKD+Uwa3Z/ItyVJe
         2WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLuvvna6pWXp+uZmu5zfxCaWhMhHgO96bERXwEhDahE=;
        b=bOYQiBduTeInm4KBgNZgcqurWsP60KyQ01zFMUCBVlI07DOEnHab21ld09p3MwsJcw
         CLAxn3DNnbBTYX2Ch4ULN7Z20xbsv7OWq23rIXEMGE8ENzR2Z9WjBNIF6aiWQUe1JyNI
         SHEoNxnISZJ1fXkuJBBTu2z3TVKrwPTNClkPPQPoge5lVPIjkSgOlUZjrrkFujATlUUd
         VbCFVWdOtbDcUb8ZNw27OfI6QksoOproQ38rhTPc0r6l0SNbg10Ciuy7qSU7Wl0adKrh
         3tZcLjtJEWOKCZDF08hdmHg6Gzk5QkbIUbDcu5w37I+HjmR5CTWdH42QhN1gm44YQq3i
         tO0Q==
X-Gm-Message-State: AOAM532fp90YDwjxOIKt5+70L0LJ1Aoak+1douAa9JtD0ygAw/TMAhZc
        vQLRVvTIwIr5PJ3xea3I2O0ymza/wE427vYUi5NfxA==
X-Google-Smtp-Source: ABdhPJzPYb08a3rMcew2Yen/i0+UmorAl9s3l7iJggWLJZUkGCbMfzXMm8Njm430QZH50Qje5me3vFvuXrgJ0+yusME=
X-Received: by 2002:a17:906:d159:: with SMTP id br25mr16912973ejb.155.1603722430388;
 Mon, 26 Oct 2020 07:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201014062921.79112-1-warthog618@gmail.com>
In-Reply-To: <20201014062921.79112-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:26:59 +0100
Message-ID: <CAMpxmJVS4gCvV3+K3CC5mq71FhfYmam7w4ebL2_k1TPYN8gHEQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: cdev: document that line eflags are shared
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 8:29 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> The line.eflags field is shared so document this fact and highlight it
> throughout using READ_ONCE() and WRITE_ONCE() accessors.
>
> Also use a local copy of the eflags in edge_irq_thread() to ensure
> consistent control flow even if eflags changes.  This is only a defensive
> measure as edge_irq_thread() is currently disabled when the eflags are
> changed.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>

Patch applied, thanks!

Bartosz
