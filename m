Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EE04167B4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243383AbhIWVwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243291AbhIWVwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:52:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12688C061574
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:50:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y28so31535285lfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amByutOR2CdEe2l/7fltvF7uV72wJ4yp5wwjDLvRveU=;
        b=w9u9JGtMchfj21KjO1EmCGDxVCq7rqexJLfC4tYxoiGFXLzWAZDs+gbKkWx9BFuMaV
         aXBGXcllqF6ttVgXVmWrpNgzqcDgrEZbhvSLGbEykrhlvxc5YVobC1kWzaS+Cm6a9bq5
         RqFpdQDkqmHRL7BTa9zHoRJF8gj7e7JZM6whBmmqpX3ZaOBYHyBvehzFPBlLKdKg9PhT
         ezR5IDGZ6fvRDg7U33kdv+fWeRJyWG7NDhm5MBf8FooaE8RaTS4+o2GO9t6WWRfrPZrt
         WwRwEoTWqF/s+A0LFXuU5huSI88ZyV5llmzZsb11zteFUUzJM27dap9H/kPzW7cTbkFh
         9/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amByutOR2CdEe2l/7fltvF7uV72wJ4yp5wwjDLvRveU=;
        b=e7gI/RNrqFaVh+5/0Y2Cy32NeDIatDLjRHQNzCFFkBZ63dBz2AuO97WQ5cVGU43JAe
         8mi1IvnVyiet6L8EwhMNo5F8NlhoQxXysA/y0BOcjL9RjKKwW3SNpxxFP+RC/At5LTQZ
         ORENJQg5t0ToBqa1ZYlWl5MsTS1njuRKfhN3ps9gusWQ06COz0ZzzswKoamcDTDPSjlw
         hhZIc9nWAAM/UgTUPWbLNSVPsD3rnyOAct8wyI56JCAjOHAjBQG7OlHr6VHMRPL+K9eA
         rSf0bVTR3xUEljGDa4DRtO21bZ7vrPyVTd2cn+m5EXV6O+36tiHzTmnc6/12Ge7tQGif
         AIRA==
X-Gm-Message-State: AOAM531ZYhXwRusWIQbjvvYXFvzoNh2bFD5z5DdKLPwGG9pVc1D/Xhq3
        whlAsx37VOfWZbR0Ole9Aw0oHw8og4btFo6WdGa8hw==
X-Google-Smtp-Source: ABdhPJwZAdk2Oxl0Vi4AaTLGVlUnWujBeU/2PSlbhwLbFRiKH9Y+MIcrIDZX+4dhRLX9fsmDZ+i57nAnwVu47f6FHq8=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr6573924lfi.339.1632433832437;
 Thu, 23 Sep 2021 14:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210920072842.30889-1-brgl@bgdev.pl>
In-Reply-To: <20210920072842.30889-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:50:21 +0200
Message-ID: <CACRpkdZqdUu61n49dqwzy-u=PQ97OF1-eQoOtbZ3101KC=TPWw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 9:28 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> My professional situation changes soon. Update my email address.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
