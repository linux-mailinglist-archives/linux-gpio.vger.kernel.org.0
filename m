Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8192AF405
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgKKOrz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgKKOrz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 09:47:55 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431E3C0613D4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:47:55 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id s30so3501109lfc.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O4SiNHgcNa9S8HJJmjSFSnxEDAWFgmq3I+SIkewruq4=;
        b=VUSt7loxTu31ID1r4ukQIK/NMio8Dteef1slMScG02dsdbWqzuua7N8q6c0sNk0sLR
         PdDU9DIVLjz3GG3mvkQHwhia5E+FT7DKVcsDjD4ZDs1EMH8TjnvD0Ei7rz7PSlD0DPBS
         2kbo0t0f0ZybSE+nQy4E4mAmjTIlChYDEefaK5J5cjOmN/X/QGNkDfkVn63FkgRnXhj0
         DbAxgSnwtKe4nsFvsqu9NhdgrATionxxw4H5OnvuniIWBbZnw3NEfBRpI5O4FzpFbu4s
         TuQaY3tdNiPNxax4qxmS0B+SNRs5wuRdlw4aQHdrs33EbU/uAe0FHJjNbUKKJHONJN+w
         a50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O4SiNHgcNa9S8HJJmjSFSnxEDAWFgmq3I+SIkewruq4=;
        b=Z7l2ZYCDyoJKkW9UJ1drTZnp7O3lY3Msy54nhFCSzscFCjtpPw9OaGZpUYXMM3MneS
         qYuVh0U/4wGdAN7vJy7q93tsI4G9W6PRthoFSs1vzd/rdV1U4/JwxZVFn97w9umv6k5m
         XZYCLnh3B0f6kAFcamoKnMMc+sU+Eo8/aoIsHXQNovG1B67r7ZL8n02wO/AX+lI5B7aS
         xn7CT/IRqnx2RDrF/+mSZ0w/N+a3oJMMipmPIWO9EBL5r5K5lKIM2QN79ja+E8Mudezx
         CrJfvX3Qs3S8Dq0tN3Fy2pUsndAcYfOAVPJTBnDSmEjWEthgo/4fh+npAQYhb0WQsDeG
         lHDQ==
X-Gm-Message-State: AOAM533OnoWb0QCOPULRqVeoGOt/V44h/C5lHsObsdnyoa7TZAyP1eYz
        ehPEbzzrhBM4sRqAXorYRzJA3NcL5K50aCGB4FGQKlUgW2QgjA==
X-Google-Smtp-Source: ABdhPJynWg2NZu8cHN1BBHfkL9vzIVmNezFDvbJeTwqFFk88iGGwiuy8kLTl8lMOeGSujhJI5m9OHwbV9W8QMC6X0ak=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr10507072lfc.260.1605106073628;
 Wed, 11 Nov 2020 06:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20201108180144.28594-1-martin@kaiser.cx>
In-Reply-To: <20201108180144.28594-1-martin@kaiser.cx>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 15:47:42 +0100
Message-ID: <CACRpkdZetg7Qu0nhZjB=rZmEk+o_C1y=fZXEevFN+e91ujo3gQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-at91-pio4: Set irq handler and data in
 one go
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 8, 2020 at 7:01 PM Martin Kaiser <martin@kaiser.cx> wrote:

> Replace the two separate calls for setting the irq handler and data with a
> single irq_set_chained_handler_and_data() call.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Patch applied as kernel looks better after than before.

Yours,
Linus Walleij
