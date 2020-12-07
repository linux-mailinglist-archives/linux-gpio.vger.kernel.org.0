Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECA72D12FF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 15:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgLGOBw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 09:01:52 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33387 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgLGOBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 09:01:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id t22so15084836ljk.0;
        Mon, 07 Dec 2020 06:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJadRuqd/X/33u5mpXvpNeLeZmHhShIKn6hwyJ9UfKA=;
        b=LhtyHvC/0dOXB0ZN4sET4ns81ik1dID9qQriSwHYnQUlQcP4zXQCCsKn6Q3hlWCQXc
         6i7KrIwtKhq0ppiHsWe/QHQZmw+HIP5+ZEm2nvmkA+PW+22nlYqg2qzG2JWFX6pqZfeH
         4wXtlLjZ06oLkudLGM4VavQW790aTrYGGo9AQzPVQ4oE1TtuM3wdgeR7BB8kR8CYbzUR
         oNsTAT8kF+5kjkky+Pnrne1IG4xfyLhqYNaX1QtXorOvANUWxBukizF0Nul57fPN1sE3
         dXhCaBWFEwdIR1b2+2loBO36SfKHq30TgWPIdm8pwTENfQppVevmX9JmBJoBMr6+0vTi
         7ATA==
X-Gm-Message-State: AOAM530+2PmmgRmRzq778IXLN0sp8a9kGFGwASEierd+3lXD7LjRvkCR
        GeqiY4A8+nFk9bfHojXaqHM=
X-Google-Smtp-Source: ABdhPJwIK6DWcc2jbvjLKzTf3YHVukzIYpfk6l++v/K20CulH1k1FGe/dCo5jsEM0SIBRO47JY3cfA==
X-Received: by 2002:a05:651c:8d:: with SMTP id 13mr2441212ljq.33.1607349669142;
        Mon, 07 Dec 2020 06:01:09 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k13sm336342lfo.294.2020.12.07.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:01:08 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmH5D-0002ji-SH; Mon, 07 Dec 2020 15:01:43 +0100
Date:   Mon, 7 Dec 2020 15:01:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
Message-ID: <X841xwCChUEqi5Ad@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204164739.781812-1-maz@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 04, 2020 at 04:47:35PM +0000, Marc Zyngier wrote:
> Having recently tried to use the CBUS GPIOs that come thanks to the
> ftdio_sio driver, it occurred to me that the driver has a couple of
> usability issues:
> 
> - it advertises potential GPIOs that are reserved to other uses (LED
>   control, or something else)

Consider the alternative, that the gpio offsets (for CBUS0, CBUS1, CBUS2
or CBUS4) varies depending on how the pins have been muxed. Hardly very
user friendly.

> - it returns an odd error (-ENODEV), instead of the expected -EINVAL
>   when a line is unavailable, leading to a difficult diagnostic

Hmm, maybe. Several gpio driver return -ENODEV when trying to request
reserved pins. Even gpiolib returns -ENODEV when a pins is not yet
available due to probe deferal.

-EBUSY could also be an alternative, but that's used to indicate that a
line is already in use as a gpio.

> We address the issues in a number of ways:
> 
> - Stop reporting invalid GPIO lines as valid to userspace. It
>   definitely seems odd to do so. Instead, report the line as being
>   used, making the userspace interface a bit more consistent.
> 
> - Implement the init_valid_mask() callback in the ftdi_sio driver,
>   allowing it to report which lines are actually valid.
> 
> - As suggested by Linus, give an indication to the user of why some of
>   the GPIO lines are unavailable, and point them to a useful tool
>   (once per boot). It is a bit sad that there next to no documentation
>   on how to use these CBUS pins.

Don't be sad, Marc; write some documentation. ;)

Johan
