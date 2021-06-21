Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EE33AE6D6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 12:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhFUKS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 06:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFUKS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 06:18:27 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18606C061756
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 03:16:13 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id i68so29013711qke.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g028qSMBY+7FHWgQ6byFnFnLj87H/85dq+TSG5LPRDc=;
        b=dMbw0sPtLnVNky0bvbL7n2B8G/cNnJmwjklXdSXZIf4sPm0yxisaD0h/UaTt9mizJu
         O6ty+V4qDjctKMRD4PppsLpCr2wb0c9fhvwvxqcDTYHzPZvhmqMIDZbT/cN3ngnLhU2/
         nx8nqXsYupY7RZVXbQAHb+k60TosOqyf+YhUScjIlQ7KPvevxs2XObWNQ6JlMn6MVZ3Y
         clX9xTnbEDXtit8ZLjn/ks5b2mepW18e/LpoTnRRvwYKdLbneVyFASMBjAtjsWBPyLio
         LW9Ff+HZmmVJi7qfnSDp185Y1PDAfBw4dm8RvUBKzKn1XhMRPtGuCn1QQAt1BmlkSFc7
         w+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g028qSMBY+7FHWgQ6byFnFnLj87H/85dq+TSG5LPRDc=;
        b=QokGvLOp+ptwbD+MG/jdIog7eQ9NCSKcqCUnUBe2DqXRwOoL8U65oAtzDZulvu+7QV
         X/i26fhjDlNf8xNIMRwtTx5EYrHVXJq62ByouxotoA2dB+StYmXjNH1CdPP36vcvKFWn
         ZwWv55KFG8xAP9Q2F9dYLHIWYyGzOw6eFGuLK0aW1+QmRBrd5HZvz5TclNE7ohmiFZKi
         rX6+Xr7AhMao31VdyOMS3l9HHmJl48+Kd6licI+pJMCH5uO/uFs/HmpVh5sXAbihmSP0
         wRpKRXrisUUBA0pJJStKxA8NypKg6PR8/SbCYstSrcBIgHGj6s9gMbPcyihrDcrhVdu7
         J5kA==
X-Gm-Message-State: AOAM532NlLSHlmnfoDE7C+Owcu6Os000fULI4jvOP3owfokC4yDuJgWW
        jbTlct0sdpC08FwHI9ZOWUYxL8Z577D+sY7fj6j8RA==
X-Google-Smtp-Source: ABdhPJypDMFj176dMc1i21SogoUeaBrzqgXepxpRClZ0RyTAaV46g6mff8kXjUE9/OM3Vs2YaCa93iw06eaodU246lE=
X-Received: by 2002:a25:aae2:: with SMTP id t89mr32046600ybi.302.1624270572214;
 Mon, 21 Jun 2021 03:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210524151955.8008-1-a-govindraju@ti.com> <20210524151955.8008-3-a-govindraju@ti.com>
In-Reply-To: <20210524151955.8008-3-a-govindraju@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 21 Jun 2021 12:16:01 +0200
Message-ID: <CAMpxmJVY40F3m_PyQFMbDFNjr4b9sUB8t2efEAP+ComcxQKqSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 5:20 PM Aswath Govindraju <a-govindraju@ti.com> wrote:
>
> Convert gpio-davinci dt-binding documentation from txt to yaml format.
>
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---

Patch applied, thanks!

Bart
