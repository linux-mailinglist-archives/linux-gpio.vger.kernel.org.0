Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B3C1831CF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgCLNmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:42:20 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34076 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLNmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:42:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id s13so6499730ljm.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+DOluD+F62+UVUFsNUjLxaC0lyKRRbWzeQTro9ET2IA=;
        b=NqsRJy8IfYtvVOx2m61P7EUj7eKkRQC1W1McHaxUOH/XTR5geJiuT5IJcQaQ3nXb8l
         M2LJAR79pVa8FQ+2/8ZcyBkREzLsxQmsdbbnBNAajt6/Ur8nAhUkN6nyGyUdPBeF+Yj9
         RhXI9+Db1pLJ5PtMWY5BohGHdNAG2Ng5Rzj0pir3fqfrWTc9vkEjUFRCeagCFSGP8NmW
         bTHID97c2LnvrSgLULrX+b0XRz6Ao3DLXkRhPWVncjiq3WLfRBMTsvoDvyJpmRX0AuSh
         vlLjYb7s73jyHx2EESmsqa8I/fTvd11T3BvX3H2aaKOFsXdqHfLK8Lr0bPskf+BhItYG
         jQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+DOluD+F62+UVUFsNUjLxaC0lyKRRbWzeQTro9ET2IA=;
        b=STHc5MmhUGcTQZ54AWNFkXG++V1RL/ElwxwS/uixTiKHBluJmlxBGbntuhsAJClkvi
         iVkepFAgtlFUAYKf8hJH8XSav8UhmCGCAKbJK7QEwt9/k84g3lMmm7irn2H1Iwl/C/Ba
         GsKULqHvTvHNUd+qXA5ibRTizBMnXEmdtkb2hxwATZZntl8YQ2vlG+UgF32IPX5jru4n
         Zpw+o7ccnSUFrcKNxRF0oP0CAH10XUxd8HgvI/dNiiwc6vJfFhw/rlp9DzM+viCEuNgE
         xQ6Clx5kmc8oXqJR7sSuMTuxRm9f+LlIjUBGzguxXx0ELlC1QANwOyO0kc640KsMP9Ni
         3fMw==
X-Gm-Message-State: ANhLgQ0tT+M683QhgL59HB4JSheLKgQiLtFYPQmv4tFAmBokni32Rzly
        R1XWy6hOP3syD7qJ2uEIFdmTasREhkB0tvpV4sgI8g==
X-Google-Smtp-Source: ADFU+vthVOyM/lwX5Bu49UX4rxF6kLF6196E1PSZp8U0hCci6QQU3TSCkkgWEyqH9cjxUW9PFpIMdwSr5W2lUW0E3Dc=
X-Received: by 2002:a2e:8ecf:: with SMTP id e15mr3002789ljl.223.1584020536783;
 Thu, 12 Mar 2020 06:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
In-Reply-To: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 14:42:05 +0100
Message-ID: <CACRpkdb3VzOFmnZkXXopsbKAAiQ9nzsqm6fMpcsCfmuvmaeOmg@mail.gmail.com>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Robert Richter <rrichter@marvell.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 11, 2020 at 4:43 PM Tim Harvey <tharvey@gateworks.com> wrote:

> If there are no parent resources do not call irq_chip_request_resources_parent
> at all as this will return an error.
>
> This resolves a regression where devices using a thunderx gpio as an interrupt
> would fail probing.
>
> Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

This patch does not apply to the mainline kernel or v5.6-rc1.

Please verify:
1. If the problem is still in v5.6 (we refactored the driver to
   use GPIOLIB_IRQCHIP)

2. If not, only propose it for linux-stable v5.5 etc.

Yours,
Linus Walleij
