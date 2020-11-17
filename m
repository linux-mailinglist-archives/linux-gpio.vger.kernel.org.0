Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD8D2B72C3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 00:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgKQX7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 18:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgKQX7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 18:59:14 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5F0C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:59:12 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id v144so308264lfa.13
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 15:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/y6a0UK3u/dNwIIUVoM+pGUdquknoe0CJWf8D3EhbNM=;
        b=w7JLq8fuu+cq9tlIBxHb/U3gwmaupnSlw2tbtyZQ9w5zrie6ATVlGmaGV8G33DrM37
         wbzMcf5uk9+FBgQUkaD/4VxVrA7rsAPrCNTgu1aRmjJOQhJc6Rxrz7G0xYibt5rDBRJP
         gYW6oWxYCLB9+NXxxmn+qLZPJR/e201o1XH8IGulMxDBgrADc2FJIApx1UIX8uXYcWue
         mC/OWGad88GiDLLCKEyzZXkLaLKLa6grP+69lI5FfTc2IbzcSnP276NdcRgSHQi93a/R
         zLO2LCqOiVD+EOcp+3mDaN0UE8ikhqqsxm48m8FOEwXRIiHyyPqxuk9eLrKj9GgPaYqK
         jLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/y6a0UK3u/dNwIIUVoM+pGUdquknoe0CJWf8D3EhbNM=;
        b=Mwb476k/HZTHiWIISJONaVZfTuU8VSnGKsnmMjpFRlRpTTEgIPv8nN5atFhxRbKafP
         BtSRMIWzXbvy5xKe7UoEiv59ecpZ4cj+OTVcYt0rv2Hn2pbEe1EKRl87gH5b9pLxDfIw
         z2MdDesMe9e4I/iyYSrJi1RdOrZU7sTvRAOtw7B+sjGQHJRu4wZw0sDhzq+68w9WJoRk
         yoeMoc8U/1dPHn49iBU/BhlYWAOtYabD9+isSbGAWnWLGqmlsG4CzM7WnpJdNTe8gwV/
         Zit3QlhLI59hYpGMsmvasFW28EHr8lOk1MZvi3hcAAAFNM0ip9vJcMpZGTfNWCJNU2kR
         tGAg==
X-Gm-Message-State: AOAM533roRjHSoxoTXG0D4/JS9tH9gs01nJwbYE5Uc2ArY+poWv23fpk
        kcFGAshMlJJBmDXKUYTi4sBy28WFS1iUTRou1dkXMA==
X-Google-Smtp-Source: ABdhPJwK9Ixwv/tppQznfvmu58gyl0YDfKJ+6di/ww2S3OkPk1ns1eiFy40oW34QRdzZscTOmor/Kw5lf7mTT72oS0c=
X-Received: by 2002:ac2:4ac7:: with SMTP id m7mr2475918lfp.572.1605657551020;
 Tue, 17 Nov 2020 15:59:11 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-3-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 00:59:00 +0100
Message-ID: <CACRpkdYxp6StaY86MC4E-Mh=b5rm6QxB1vjHTC7Nhhd-76YU0A@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 2/9] dt-bindings: gpio: gpio-xilinx: Add clk
 support to xilinx soft gpio IP
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:12 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Specify clock property in binding.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Patch applied, consider rewriting this binding in YAML.

Yours,
Linus Walleij
