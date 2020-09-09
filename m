Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A1C262C3A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbgIIJnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730271AbgIIJni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:43:38 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5136DC061755
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 02:43:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id ay8so1960837edb.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZ5lMQza2vBQuSWYO95GLXBotDPAQE05BEf+7WEyMpQ=;
        b=MVBKWr6zhXCnDFG4JjFB4b320z+06N3btYzZRaTE6z9nFbPCID5IatZTdMF/ylZ0qO
         Ng2aXrjANBTyfo49Ubmykhj6P9cKaLX1uZb4etsHfcUr3tNhYhvWb/XsilUpCU1qV9q2
         wKJpPoivRRAuLfoeaKC95DxM5m/tFLq9+uRfp1a/ARogeL8/hR+dnF93sde3w3ZET9fM
         HLfTqpZpNEcH/FWBKBDIYXNkjUdbCamIZBzoUvagZSpDCTegx45Gd46KoI2JhyprxPLG
         4oT5GUCkccqHeSqtZt2yL1MmJEj2YBCJfE7lNtzRRys1wcP1B0SSEDPoDbFXzB0eCC7N
         ySrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZ5lMQza2vBQuSWYO95GLXBotDPAQE05BEf+7WEyMpQ=;
        b=nuGqAatjUjUs7svu+9g5FiqZkJzJArbSG7yjXENb5QMtPGOnNezCNr5yMlirOxbMb8
         R5baHQAUk5yOf3uX1h8TBlgLQiVXqxO6LLAY/67is3UbSRgqTU61JDwmMr0VtG67HNW5
         EZrOQBtxjArrPmXiLtIGfQZUgsUukeCgq6qubq1iNLFyhfbwbGl57wdLAlA2OyGZo3Pr
         BnJh2iXc/hL0B+Um/u7IITYBm0FTxQF5zLwzFQpXiAO2ppRIHOT0VYriue2Ya6BQ0iUC
         aO2PFGb4tmunafQ80GkI8t7KyOPZFF+hJd0lgcVOl8ZEgKDCXwjExJGn6HyC35cqaiX0
         494Q==
X-Gm-Message-State: AOAM533eF7L5Faqt7M5PbsduZHRzDYwQq1dfCP0IzU0em2cnB9+FQCEf
        K2eosWB85fK4gtoMN1NV505hPEGzpSn4WTX6xrlJWA==
X-Google-Smtp-Source: ABdhPJy2lCEbdg8fx2lI84Ux158273xZAz0e/ff6XY1pPxbN4yW+r55HbCh0D+KXBNAaDvdEkPua0MXnHfGlAVWbOjk=
X-Received: by 2002:a05:6402:2c3:: with SMTP id b3mr3217458edx.213.1599644615064;
 Wed, 09 Sep 2020 02:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200907153135.3307-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200907153135.3307-1-a.fatoum@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 11:43:24 +0200
Message-ID: <CAMpxmJWJo=wZmBdAxS2JWVMmg+g2dZG9Do7z+ROy0s37rWTw+w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: siox: explicitly support only threaded irqs
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 5:32 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> The gpio-siox driver uses handle_nested_irq() to implement its
> interrupt support. This is only capable of handling threaded irq
> actions. For a hardirq action it triggers a NULL pointer oops.
> (It calls action->thread_fn which is NULL then.)
>
> Prevent registration of a hardirq action by setting
> gpio_irq_chip::threaded to true.
>
> Cc: u.kleine-koenig@pengutronix.de
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Could you add a Fixes tag? This looks like stable material.

Bart
