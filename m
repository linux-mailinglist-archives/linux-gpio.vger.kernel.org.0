Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB6C42008
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437175AbfFLI4A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:56:00 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:44857 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437172AbfFLI4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:56:00 -0400
Received: by mail-lf1-f45.google.com with SMTP id r15so11438789lfm.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6dsc9hWBbsJ9ftcy5oIWdQeYlBaT7RnVpUbv8am+So=;
        b=cdDvAZo+BI/4z2Gjdm90L1glbL5oSJei4EYJuA9mTlDlpUK2J0mpDznfRk/DdmnreZ
         sGTgEGq/NrXG/+FkTauUqDUSnEfYnMgZW9F8eLlFFGI16rSZf6AyBxty18aDbh16Ercs
         baT9ohslEOYLTztWBQynYAIhVJpSIuR3gE+pXd9iCtV/D0B0HPxnhD6+icAER68vr9Wr
         p6j2SlRTsKlvkihYJAFHt79r+J2HCwn5OUAXH4tgUJxtYcIx8FFzR93yzPNLZUevLQW6
         YosMYudXrNcLxU9VhUWaWtbzmh3o+rDlHuT97QSK6/19hanulIx0ZAzcm/R672NpCOg8
         sEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6dsc9hWBbsJ9ftcy5oIWdQeYlBaT7RnVpUbv8am+So=;
        b=AoYpH1DaMOhpDc+r6lYLyzX4E5jBpxBqI745hcBENIKlnDKy21G4ywnAuoYV/wbS3w
         E0BY145//4YOogm9ws3FjFtFoJFszWww84EeEzKKUxQOVt+Wi5EzfyrpX/TNYwTDZFaQ
         4MtGkzEiVF9ZBwIg0E7/LwpNvOJperQJpT1lhRM5fBTnHNhLvQpkDnI8gIYyLsq0uUFv
         C9Wo8n7Jsou1bUqUkRZK1ekCeBIIxAVB3mYdvzOtUQQb2tZMB0AlZHSu83mBp19VeDpK
         CK0jUhDXZoiAebmaGS3U513MGBkesphoLAuZpdhieq3yh7CUN5k8IKbYf41HeeWT6/BX
         kqeA==
X-Gm-Message-State: APjAAAV+D8ZCRaEtmFU9FmPLytt7+r86GxR0iBGHjZJb6+mbIygz0lQP
        5KMab2WnJ0RXCN11jFCiLHX9iou5UeB4foW12KHJVQ==
X-Google-Smtp-Source: APXvYqzPSx5XfdL5cdU82+TCxBTmCmwTndsIlHmjhMLF7KXn4u1Puk4//3L7dErprp1ZZvvjJHwNVyPpuMFsHUSjlJ4=
X-Received: by 2002:a19:7616:: with SMTP id c22mr36812571lff.115.1560329758321;
 Wed, 12 Jun 2019 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-16-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-16-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:55:46 +0200
Message-ID: <CACRpkdZQpG5eHdDUy4aRxr6vEgs0qZHRMXUkCfms_VBYwiQeXg@mail.gmail.com>
Subject: Re: [PATCH-next 15/20] gpio: gpio-omap: remove dataout variation in
 context handling
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> When a GPIO block has the set/clear dataout registers implemented, it
> also has the normal dataout register implemented. Reading this register
> reads the current GPIO output state, and writing it sets the GPIOs to
> the explicit state. This is the behaviour that we want when saving and
> restoring the context, so use the dataout register exclusively.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
