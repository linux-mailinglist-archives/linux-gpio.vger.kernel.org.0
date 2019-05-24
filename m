Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1E029776
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391135AbfEXLlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:41:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36540 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390743AbfEXLlX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:41:23 -0400
Received: by mail-lf1-f67.google.com with SMTP id y10so6909125lfl.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eJLDwVfH5VJnZx8ZM8GCRIzVJV8WcHMD+lvgI85Fwb8=;
        b=tFjCJYE4s1Z94dMb5aFsdWecVIC3UQ9ZA0iji4fhIgPiEbpjNkp6PM+YSIl/F0zg/8
         v067wNSAoldwvwxNc12hzdZ1o+Ue6PunKG5AFaw6SVX+axaqR+H6XYobKIQ2AOZfRVDT
         2MSu12IVDZlJVYeaEXVBJ6u0fHu/T+hQ38wwb9HMSr/yWO0eah4xbg1CG4Yx04vpm/Gl
         5waRRmDXldlktA4Axy7Gh6TMSlIUN0TR5TR6qQnFCE/iDu+Yu3IwGLAbBiOQYDTZkcO5
         7PFePDllYZl7eMyl9c9S364wV1ARtv7+Ho5BblphuAKfQYr1mTkL2OPyj3M5EdvOFQ9r
         bP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJLDwVfH5VJnZx8ZM8GCRIzVJV8WcHMD+lvgI85Fwb8=;
        b=ErI2YGG3MSk3z54O2Ie01p6UVFKsixpH47CXqW0m3Wc5WWxk+adsUcRL9AN5OIo6ba
         EQiwakOr9fH39N6Y6r7wSGzlCccP1LSdGS53nI72FXaUq/03zJhpzEGM2r3P42PzTBEr
         dt+zZYToto6qNC4lwthC9SspPTWdZHFQ9reqI0+XLXNBacWOkGGPRXNerQxHL+Vp9LhS
         5X5oPEvBC9clDrBsgJjZhUQEnJxwbWaTF/VDB22Nr5+UhwTH1RVmUqpBoMxM3uvaNwvN
         iyB03byeLsR2RNWP+zVoSnKAoO1kycZ/DA/PPd6banuXOjVc2gNlhRm7JUAbkXoBY0iP
         /dGw==
X-Gm-Message-State: APjAAAW4921f+TSOoZSdvgVJgu31en6TyU64/wwiXC9seb+cu/JGpTGG
        sQGmXhprtZr6VdStGG+6ubzVhPvqpay0baMasrqJDQ==
X-Google-Smtp-Source: APXvYqwlCU/Ve7G0DQMfQWyCLtGMK3SgbEDDMWwyMwxIxCdMA7wUKKKX4Ntzrp8svUCapzuA04ATKczG2IaW15wIr9U=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr9226943lfi.117.1558698082036;
 Fri, 24 May 2019 04:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:41:09 +0200
Message-ID: <CACRpkdazPrbzL-oo6rhfgDcLftjCE1hrgPQCMvtE2TOUUnorVg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert stm32 pinctrl bindings
 to json-schema
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 5:45 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Convert the STM32 pinctrl binding to DT schema format using json-schema.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

What a feat. Well done!
Patch applied with Rob's Review tag.

Yours,
Linus Walleij
