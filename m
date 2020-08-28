Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09192255C7F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgH1ObV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgH1ObT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:31:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B316C061233
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:31:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w25so1518806ljo.12
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uulk0f5tN77Sy8VPiV8bfXz3aXrvD+qaFtC9g5b1o5k=;
        b=mwrWOh5FW8SYexG7nJkfBA7ExLj9HY/yJCs1pbJkRP8mjO0Vm5IuQRxOn3jCFPiDKy
         TPp+apvkl1PFKQVmrFtao9K39ss3eGRv32OCkcTWEOPpv2wCCHIBlvSdYZeBo7OIy/wy
         H1/Y3pj9oqdxvILjV0gQEGtanA2tWIxfIoVdkHTS3Jf7wwRA+BTeO1VteJUNf+0SHF+5
         kRy8mUoXzqx0+JiIzqfnMWbxCFCsNUJuFpV7P7HNQmdck+EjmpePdcrD/sxzJA2FX2aq
         nFdUSMCJlK9hheCrVt7Dr2ioHkVb4f521szLVOXf77uzgGVqIRDOQGTblZMiHusdXfv5
         WsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uulk0f5tN77Sy8VPiV8bfXz3aXrvD+qaFtC9g5b1o5k=;
        b=OATcYXa5g4B/MaZ05RG+XADzLHQ321qAhPKZNmnIgSvlAWtaJRXLScPHn77iUuspwP
         iBkkbhrWIHFO4Yt+f09EUwQ0VV1fd+7duyvwBQ/an5JVSMvRG/m9S4QXQQ8grPQcZW4C
         Qe2XYzQaDZuHGepUz9o6MwhcLTDPcipHiWVLzJ9hk8O3bZ1cyhh2AbezaLd/1C64dOSy
         23aIxMv+pm0P+hqNsM+jHZSoSSP5KcOt6oetUf9J/JvpfUGdqXNhiHCMOpSWO4fC51ql
         sRb0MU6JcEVQsFXb/3hzZcCJzRcTLg1wEe8n7CQg702P2bdJpCFrem8J9RoGXBfHxqAk
         Iowg==
X-Gm-Message-State: AOAM531Aq1WwhWds8rMap/pfdz9nVY/hP3dHHoh2t70fqpRtPTx0oEyr
        VwCWNzIxRZBOyCR0iFMsCg6OhqlR2cSCXDzS0hsZcg==
X-Google-Smtp-Source: ABdhPJzZo9V8yKD7QGeGDGdwGYh46SecHaHj/YVK7pilBfuxI7RKFuaeR5C1/8xhA/6gVBQXQ3zGwVDH9/8XRxPY9Rc=
X-Received: by 2002:a2e:9dd0:: with SMTP id x16mr989729ljj.144.1598625076956;
 Fri, 28 Aug 2020 07:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-25-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-25-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:31:06 +0200
Message-ID: <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] gpio: Add devm_fwnode_gpiod_get_optional() helpers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Add devm_fwnode_gpiod_get_optional() and
> devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> node might use it to remove some boilerplate code.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

OK then, I suppose this gets merged with the rest?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
