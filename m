Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D340247CDBD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 08:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243125AbhLVH5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 02:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243129AbhLVH5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 02:57:00 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FBFC06173F
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 23:57:00 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id f5so5267394edq.6
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 23:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57jHD0OdL14EUGEqDYzo37RswgmLRuGmUw9QgPTmuNw=;
        b=27qP1JXtVXnAlzwzbjbRsxMVkmSvYyXXHRcqYsMjbWh/sI12vHax+mWHUKZE1XJ2Dl
         BRrBvYIqfvyQqwwmQTCukFIOlUurykqOOsQY38RP6Jhz6q+AL13EP5fCQWPWIShQrUOq
         0rkWPxcRgBbXZ9HctmJki0xsmIZHewP8RSU0PQ2k9Ctk+uCClrTEfTeTLQJjGZOVXj0R
         vuw8/5gr9N2e6YB8xI7QO3Ga1VAbBgkhIb4DG2+T2H+di4gdUcfqsFmwbUpjvjTUhHUF
         zZyiqOaG3qJiyn8cJVbP1KxtQnaEHbuLmX+M2aTjkkUGn6RKOfSqEHqQYDXQJch4v2JF
         bXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57jHD0OdL14EUGEqDYzo37RswgmLRuGmUw9QgPTmuNw=;
        b=jMp79IctJmEykeg8Q/4cyjmqCI1TrGW3zeVKkNzMTcg1zGI32t6eNfqZRDQBqW0YZ+
         oi/M5jODEJT3N8iNqbnFGqTzlwc56NGrcoORoPEhORd4EJHpTSEe+wHL/N3KhRzb1+J0
         aeMNZJe3iiANFfZrEPer1Yvq0+9z+LGMhiOcxmVUQBh7aG2NUY7Da5Rng9kwnrcqPZis
         pqFR/hfG0j5ONLwEBd/N3dAPlUNXgoMqay765RMSnZKXSbQwjWb6Dqo9xze04PGe3Wh6
         +XODCTgfI2eWMUDXhkzIOcSbw2AWrGsrJKw69hFydF8gcDX8SvcvdpLS+pklsGRpgIAu
         RI+Q==
X-Gm-Message-State: AOAM533H4wu49bhwwa5kukNkkL+4zEfb3HQHoyzWxG3QiJPq/ZiDqjD4
        8InpFaWwHVX34yE9ItVM1JrtY3Sw0xDzuztC08lC5g==
X-Google-Smtp-Source: ABdhPJxGvaPn9/yi0hcMtF7GBIkd43pQMw1Wpy4PsZv6kGEoNl15XNgtX5ldnP6raaFVVA7uaLCMMCI8giDrIxYJs5o=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr1505403ejj.636.1640159818788;
 Tue, 21 Dec 2021 23:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20211220211854.89452-1-nbd@nbd.name> <20211220211854.89452-14-nbd@nbd.name>
In-Reply-To: <20211220211854.89452-14-nbd@nbd.name>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Dec 2021 08:56:48 +0100
Message-ID: <CAMRc=MdXnJnRPGX0GSnWUwfRSDFEU4CFP-N0PoxuwQMnNCTDmA@mail.gmail.com>
Subject: Re: [PATCH v8 13/14] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Crispin <john@phrozen.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 10:24 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

Arnd: Please go ahead and take it through the arm-soc tree.

Bart
