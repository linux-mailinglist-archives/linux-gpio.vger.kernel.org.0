Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A381349A5E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 20:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhCYTiG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 15:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhCYThw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 15:37:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1DCC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 12:37:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o126so4286246lfa.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Rchlofo3lY1DcCDfOKw0G6YJBPElsf9bJrD+rPfL8o=;
        b=whXu5iCwH7F2SfCXqzL3qFdwsxuSdx8orWvvM3v+aWLsxB77Ms05tbnTywDXpO8QP5
         1iJZfD4PRVfLfLbMugZ9OoOw1sm8S++QzxfOxnqNgkIfWq1tUzAlPtNzTA6maxogahPP
         +4b5U/Ec14Gbo/Laa3hkw95j9ohgtR3CycIHT3kozy6tefKbcpTgsCL2x72lbjgOyBHp
         fAp5dSCMUE+sUNyB7CqGlj3aAfTMVz2/TsnmlwCvoprhTdX5vFnryBQ/m7UVz6iZUNLb
         ebUlysOo39r8ZeLPUZ51aJhdUe3mIsQPV2Ml0Uwc0yIigbkoabJ/W/Dheb6Q3+lrmWpU
         CjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Rchlofo3lY1DcCDfOKw0G6YJBPElsf9bJrD+rPfL8o=;
        b=Mur4k6wSNwYH2T220iqNSkdK/GR7K6yTrr+hyZxIZyOTtu+YZNrm2eRQerLcd8EMPl
         gyoLd4NYPskV1n40WzmENHtriADNPxAIvsPOTy54V7i5/wm7QkdketgTCIVvwjspymv9
         6vjkVDvR05aZ7ylc9O60ufBkj8nmBFm46cU6q1IM3GmMjLtoMQIuTayAEynRxkwcJtVX
         qcgh6D6z6yl1T1FDNPYI0v2/EQAUx9xwC/FhXPRlNfFWb2rYKe145Src3LxocVgCNCqz
         3a95A3r/qEMk7wHHzt8RhEjZiiaPAwC2TywY7asyUAE+Z4RO/gJtwGIu4CAR8n1HVw64
         h/LQ==
X-Gm-Message-State: AOAM5314rf+j5MvsxUL/qCjTFGgr6LMYPJSDTwHbIGw6mt9qPm/0gAPz
        QLckpE3aEOLmbqtyopSMHOSx3NUAdEt69b5T40TEjIHFrf8t7QR2
X-Google-Smtp-Source: ABdhPJzd6rrv4KZE6WdmHVIXwFAb0l+q4anvrdtyw7HhldUSXuAOFS1wJJLDGQJAgsBHBWym4gAnZEmwJ49Cy1OZYCQ=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr5638855lfa.157.1616701070322;
 Thu, 25 Mar 2021 12:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210325175536.14695-1-rdunlap@infradead.org>
In-Reply-To: <20210325175536.14695-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 20:37:39 +0100
Message-ID: <CACRpkdaR9SMUaf7YNPRW3fsTLiz=5C-3Z=7-fgBw3wFzEM8gVA@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio-utils: fix various kernel-doc warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 6:56 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix several problems in kernel-doc notation in gpio-utils.c.
>
> gpio-utils.c:37: warning: Incorrect use of kernel-doc format:  * gpiotools_request_line() - request gpio lines in a gpiochip
> gpio-utils.c:61: warning: expecting prototype for doc(). Prototype was for gpiotools_request_line() instead
> gpio-utils.c:265: warning: Excess function parameter 'value' description in 'gpiotools_sets'
> gpio-utils.c:1: warning: 'gpiotools_request_lines' not found
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
