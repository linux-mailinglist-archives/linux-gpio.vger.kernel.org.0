Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04859216D21
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGGMuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgGGMuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:50:13 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E2CC08C5E0
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:50:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so24839903ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SwgAW+EG6tvCZIqxu3/JdX2TBmPRZ3QJRu9pLXvW98=;
        b=IxAa+leSkBpoUh5Bq/NRPDMzIbc1ztNHK7Nt3NEW/4c5o/7sJR21qImZuPRUcTthg+
         MelICmihE9tq7OeoCBCxGvGU87PkJ+3NDd2CeIrZ2eQvKrts3wfxg7P+Zy+2SKtZAF1c
         pVjNDUTVxWkqk/LFvlBBHCLYetSAgkf7RQ3ZOBQQP64oJd4mXHwoN2jRLF4dzCm51/za
         w9hmt0b2U3ZkovysI0KP+7NFKtJzOEj2OZ+s5FK1XDpGj3/CjOwesQJGHTYVxVUa8C7j
         Zhgv1BsDH6wUwdwSAXGGypMbhKjoHNCAC67GrMOnYAc8d5jBQQBP4vE/5l2gLbu5QIRi
         ZVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SwgAW+EG6tvCZIqxu3/JdX2TBmPRZ3QJRu9pLXvW98=;
        b=YDDU9ODrdZU/2LLiPL4hSeo1LSr951+zRewhW/6+6IowtY/VAl2O4m2S/urK2rtrgX
         dv3iWGNEnI3JA5wzaU3EdQboLxVhRLyKtPwFW2meXYtSXn4dS5YSRSCND/2nqWqkBIWP
         LNTOClfFdZcwRk2nWxW6AL5PphFo/1Jg0ddksgSOBU6mxiwBcQqLC6I51QbyUI8mfd3v
         hUoUtbhc5Kzle1Ufqbq6j9gtuY6rfoFKMTxYBfsfPWtyrSMZdaFubDuUlc71Yd3TWZlf
         cONzxIS8sd2Q8kTFU5Dl4+GDpm6bsOado/6EdTg6QQtyJYuWokFNuZau+H7yt6U2g06N
         SQOw==
X-Gm-Message-State: AOAM530Lj57WZZ4do+csgDlsPKKHrPzW1DidvZHGCjbkJDcSm/HVh4nE
        E5Ns/RH0BTuAAdugpdLcU5YgcXevzEV0jCv9ad/p24PA5NQ=
X-Google-Smtp-Source: ABdhPJwb40quVLTqVbxWUanPuFGtQykjLJsdQp6TTKdlw6gNizun/jdSZa0XI0eJCmX/F+MxnSVBrBxnftFaqvy1VKI=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr16143076ljg.100.1594126211220;
 Tue, 07 Jul 2020 05:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200626211026.513520-1-furquan@google.com>
In-Reply-To: <20200626211026.513520-1-furquan@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:50:00 +0200
Message-ID: <CACRpkdZoTs1WHhmJtu37DW=7WhGtThD5Am46K9LwR10EAxqNwA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Honor IRQ trigger type requested by the caller
To:     Furquan Shaikh <furquan@google.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        akshu.agrawal@amd.com, adurbin@google.com,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 26, 2020 at 11:10 PM Furquan Shaikh <furquan@google.com> wrote:

> This change drops the override in `amd_gpio_irq_set_type()` that
> ignores the IRQ trigger type settings from the caller. The device
> driver (caller) is in a better position to identify the right trigger
> type for the device based on the usage as well as the information
> exposed by the BIOS. There are instances where the device driver might
> want to configure the trigger type differently in different modes. An
> example of this is gpio-keys driver which configures IRQ type as
> trigger on both edges (to identify assert and deassert events) when in
> S0 and reconfigures the trigger type using the information provided by
> the BIOS when going into suspend to ensure that the wake happens on
> the required edge.
>
> This override in `amd_gpio_irq_set_type()` prevents the caller from
> being able to reconfigure trigger type once it is set either based on
> ACPI information or the type used by the first caller for IRQ on a
> given GPIO line.
>
> Without this change, pen-insert gpio key (used by garaged stylus on a
> Chromebook) works fine in S0 (i.e. insert and eject events are
> correctly identified), however, BIOS configuration for wake on only
> pen eject i.e. only-rising edge or only-falling edge is not honored.
>
> With this change, it was verified that pen-insert gpio key behavior is
> correct in both S0 and for wakeup from S3.
>
> Signed-off-by: Furquan Shaikh <furquan@google.com>

Patch applied.

Yours,
Linus Walleij
