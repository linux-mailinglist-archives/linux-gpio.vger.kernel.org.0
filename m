Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3935F3D67
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJDHlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJDHlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:41:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1BB264A2
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:41:37 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z97so17660513ede.8
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=t4gsSkEDUeyo1zPk5TwWbQ0/8jC6JrVvqb9PexG5Ag0=;
        b=UBF0PMRItbOet9L4f2H+UFFYBdoamlZngKZxhmQcmjGCsvkL5BCA1yDi+Qq4SRGf9f
         uRxylnAahW+3faOGYgpYURRQOXnPT3AImJrst2EBOcp7SmpVwrAT4iWqwDNNhnaCFCCg
         nvYwpOcuno9NJ11rCbQ7xt1GuiwuCPysxwSa6vxRaeiVOajb3DKDRJ/3R6UL3wR+H8S1
         m2dCfN5LQsnz3neoqgEfAy3dTROueQIc9/SWClraMOr8IBMoyO38ljGk5qwTUHpq/O/W
         lmwSo9I+cRf/B/FW8EZ4alGP2p3TyTee2k6jsgB9WrvfX9qkze4D+rJm9/i+FlWAMUFl
         h/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=t4gsSkEDUeyo1zPk5TwWbQ0/8jC6JrVvqb9PexG5Ag0=;
        b=Kan4sAZwGdyznFCqfG0htJdCNzybBeIi5kyJwsjQbh/dbK2/R/FqGjbipJb2jGaPmd
         nzYY0uw8TqrGaEEPx+fTcay/bMA1Uhwo/atlOecwHXHgnCYVHd0ixNwmMK46V/1Yszw7
         x5wMbXqvb67i41fajESSRmyRAbSNcbfHppADbbI8i1pFfTZ6kw/Apy1d+upjXXoOSAne
         9NKxTRMhczASRpPfeiu71YqONA11boi/flmduM8CPctZCyvZqqCQCxmol2KWLhN7mHqn
         uCJB/NdgsuWoOoZYLo2ZE629s79hLfHxeWJDEsTjwUutLwbttH26oqIHpjwg+WdAf9Gt
         Zr7w==
X-Gm-Message-State: ACrzQf16LV0Y0NqVdC5r45nFdvdWkukbMOi5U5CX9G68ykT17lwRMOsk
        j9QH6iTQ7Xg0cSN9ASxaMS768dmwbed9+FXFB2hqLUF8vvI=
X-Google-Smtp-Source: AMsMyM7GQcaTrnPcsi1VG65yXFMT0nakTfMnpSDx6YTX6GPrb1kCV0eO/IJHHdVl8u3JfE6s/LkAd6uv7UmF8qYAOjA=
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id
 k16-20020aa7c050000000b004534427a947mr22287577edo.172.1664869295589; Tue, 04
 Oct 2022 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:41:24 +0200
Message-ID: <CACRpkdYfzE5gvc_L7qfN74gcG0KT=w4D4ZqHQyXT_x_uBXNqTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get()
 return value check
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 27, 2022 at 7:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> fwnode_irq_get() can return zero to indicate IRQ mapping errors.
> Handle this case by skipping the interrupt resource.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
