Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EEF3AF557
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 20:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFUSq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 14:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhFUSq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 14:46:58 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694E8C061574
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 11:44:44 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id g4so31837435qkl.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HPKbwBdLTb+flaIQdXb9qHtfZsf+JCb3l3VWCCCjnN0=;
        b=gSiYm/3Y6CcbopNMyEaSkFIKV9EzOckW4q1RFqvK2i557750i8aqZvcTg8/0VSDQPj
         aBKVvGJbJJp1QUw6ni9Gi4SN7mg5aXhAlV8ro0WXkp1l5ScAmJN+j7N46gtNhpqk0EFO
         DRq+g+9ZgKH3RvhPPdT7hqChkFWYf9x9QOyIDyfuHwRJ19y4kxsPppJcbE/qBdpb93je
         tmmsx+U8ExPUdhnMo/shriT9888y0C3UUndGpUAMnlou11RcGMcfr7n1xfDnrVLf/MKq
         8FKlkdR0wAQvY4kT0+QdwCZu4/k6sDEovdaRHhUCx2eoRdgyGNlNm3F/vhKEMMMhrM0Z
         oElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HPKbwBdLTb+flaIQdXb9qHtfZsf+JCb3l3VWCCCjnN0=;
        b=SPJu6ECMLFx9TjTBkcpnyRWULPjbhPtLYwEwVgnevdqPueMfPX5XOVMCAvOa5yvQAo
         GkJWJS5B/b8FdNYRPoXAn8+Pmolm17ZZJ/pN9Y41IsVTdIb5gD0PQzVN0++qd4gAI0rV
         TRI5dKF4C3hB8oSgxAXp9hUeNqcW2VNSzupc0gJ6SLaRZLEPRsaveeFXLeWgVH5ZGbX+
         m6ncrcQjwr/2cf1uZelq5nbCCINi3NSyVOtojW/vh7qdlgmzV4P0CbLB38hghjrDX3Ce
         CAgC+7MbTLu7nfhkXrx9W4dWDKcp4X+BcrQYTW59TlD5DKVgYU5wb3YuxJO7tHD9cNkc
         qRiA==
X-Gm-Message-State: AOAM530xWROQt4eEIcV6RHJU7pR0r4xRaonwpkkGYeeIkDmlA445j/XS
        UNms71mmRlbN7pUSxojq562KeHuh3Dy35Vd16jp9wg==
X-Google-Smtp-Source: ABdhPJwb+7lt7j9D9Q8pMFZcgmtvvPZmEcOP8+iK6JYn7docBPNfayb5mZHaKTZGJDHrzsMvJy2Jy0G+qe7jkW8u9PA=
X-Received: by 2002:a25:ad5f:: with SMTP id l31mr34263459ybe.0.1624301083632;
 Mon, 21 Jun 2021 11:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <1623938053-790-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1623938053-790-1-git-send-email-loic.poulain@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 21 Jun 2021 20:44:33 +0200
Message-ID: <CAMpxmJXcmQkaHO_2w4mJUFQmH1KX5tJeo-ixASreSMW3Z+1Zyw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Fix disabled interrupt wake-up support
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, michal.koziel@emlogic.no
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 3:44 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> A disabled/masked interrupt marked as wakeup source must be re-enable
> and unmasked in order to be able to wake-up the host. That can be done
> by flaging the irqchip with IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND.
>
> Note: It 'sometimes' works without that change, but only thanks to the
> lazy generic interrupt disabling (keeping interrupt unmasked).
>
> Reported-by: Michal Koziel <michal.koziel@emlogic.no>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>

Applied for fixes, thanks!

Bartosz
