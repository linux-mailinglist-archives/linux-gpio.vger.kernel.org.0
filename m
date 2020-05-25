Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38781E0AC6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389608AbgEYJip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389367AbgEYJip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:38:45 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB16C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:38:43 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c185so2860466qke.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oKEdAjoI1we/VuEVbQqJGLPGdBpdxDDUB9LRBQgTDcY=;
        b=sO8JZxoK7V43BN2lPuEiy7UhgFl1rprudV7tKJG8/z85WHm5ErxHCz/mSMc30l92gz
         5nlHft+u8JDLYmgRbs6YD2Suxu0A7BUFRxUo+riBM6KN8bJqfBAPjKQ7ZFOceqApIYc0
         ySuo6QV2cpLmoF+kZrIoU5syKlVSEsSp7FDptjp0hqAIwWZFd8mmi3oF4hPltpDpCpNT
         qZFk7Vqk5vfO+jsSA6V64FcVfYwjkvNAioXy/qGVxX72W7G///YUP6jLmXStzjSltj0L
         oMp5cP4qHXnjqtNAbzf6pVjsJJ7FgjOt+INAVWu5oz5lTCxIm/nEcLM+ph+Lp6buubtQ
         MeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oKEdAjoI1we/VuEVbQqJGLPGdBpdxDDUB9LRBQgTDcY=;
        b=citIFb5kAhklWHtstgCCkCMqLDh02mrZjAVfiqpXC28Aw+gMmsIZmNsD/ZXPV5eVHB
         O0PMdqu+zdtXmVRNQT7rR1rkDaahSWYeU5VHhFsPkxx3H3Y/1cEllVSQhDGkxuWbqhUD
         zCLinue3jccP50JZ5nBylBS6dWNNM0Fzk0DgSKaOhm5+5tsgedIKttI1DulGSGVvx9HF
         o9vtZu8pQglpLaVYjF4ICP61fG8IgPo3GUBfgmBaSawzVJxwchd8u+O7VkZPDYx5dsnC
         1Ot+8CMspe7e3C7WO4wbXqmAWx3JUOINoJUuGs29Fz1qEjw7/ewFVjhA+dLmE1W60V/q
         b9iw==
X-Gm-Message-State: AOAM533o6m/ACvWjoJCy6J8iDqpRckOaQ58Rn5I7mO0g5H+NoxLyqSbc
        gwKfOSpdfHFO3De8cKvioMRqBEGPwnyfXChPvrbFeg==
X-Google-Smtp-Source: ABdhPJzNqAuz0PkeILrWKangnXOi8X46nVY1gGt6dHL2XUIhcfw2taM7EFISMxEWPxj/NsHYkkgpSiaqyLPzKOnwXaA=
X-Received: by 2002:a37:5b47:: with SMTP id p68mr26424708qkb.120.1590399523280;
 Mon, 25 May 2020 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200520211916.25727-1-andriy.shevchenko@linux.intel.com> <20200520211916.25727-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200520211916.25727-4-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:38:32 +0200
Message-ID: <CAMpxmJVEav8tOBoMWoekfQUaLOfCNOdj6N8fYx5UQ5e_VtHs5w@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: pca935x: Allow IRQ support for driver built
 as a module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 20 maj 2020 o 23:19 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Perhaps by some historical reasons the IRQ support has been allowed
> only for built-in driver. However, there is nothing prevents us
> to build it as module an use as IRQ chip.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This may have been a stand-alone patch as well, so I went ahead and
applied it for next.

Bart
