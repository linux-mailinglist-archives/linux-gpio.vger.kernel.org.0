Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6B376E53A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjHCKHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 06:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbjHCKHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 06:07:16 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B3030FD
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 03:07:15 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-586147e5ad3so7930077b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691057234; x=1691662034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AVANZmZzfWgjS39y8aCa1FjdHcapS17gFs2WBa28/Q=;
        b=avqXn0/+27uq5fbHiAZ8ISd0L82VbFbEZLsjjXHe6IsQ5jFK9JDFjOaiWpOw9+Bvi1
         SBsf93ociRR44ni9IpEu2n6QqSWsjzX1yPjH71IMZZnNUCd3GIwF02j+UeCWUqdjuCYu
         qcm+CQs8RVBX5DSpxk/ZAfqifFoNilEtj0SKHwBLneSgt4eVd0mXwuSJW+6mxSlVOZny
         15pS21bFAf3q4BMekukaSa6cSaryLKYdGVr1lA8ljhAyKYtdtndqJIpQIOXVfRW+r6Wl
         gzxxhOIrrzKzMl3bZ4QwlOE7HQtr88p94stfDzvVcjnUNGP5l7w4Y0oLiQXIO3nRTPHZ
         uTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691057234; x=1691662034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AVANZmZzfWgjS39y8aCa1FjdHcapS17gFs2WBa28/Q=;
        b=Jfh4m5o6PHKdt+lAyL+UbAq3Vab7nioZwarz49JyiqIVRYNI+FqwBIqNWElq+ZB1Wa
         wPQTAE7Nmtx3y0Zl0gAujiSrizxqkyvibjvM15ASKdYlwz421svmRh85j+Wmps2PdZKC
         DYF1zQGMMcH7txUZTBP5NQ04HXWVtF/VBdTOJUeODFh+FeWVghBUfqpLqvAOgsOlO6Lp
         AjfNGaQ6Ghz0Zq2eApaLPmZDNjwshY8107exMzZbbOu5d6UYzEaFs9+RvcCmF/eQDJqD
         DRs0Huqfi63vsWzz5M1R+Ktbh3WMxU2c80KKjM+rKVF5cGqfu6Axz9yZJDTyxM4/oROc
         WIhw==
X-Gm-Message-State: ABy/qLaS4yLo8Gx+R5EUlVZ68HvVIblLROsYz3myjIg6hlEWlbiVO1ew
        eEnRjRgyy930Yf8z+NMTBIrIXfe7rn+k1qWWkP4YGPRV0gn7j+VW
X-Google-Smtp-Source: APBJJlECxuTAzLSEoZhpoV7o76ADk03bcakFd/kbqf3A3K9228mjDn7SnnzIq7BWmKnxIwPE8+jFZmjCwrbMa05UbSY=
X-Received: by 2002:a25:d47:0:b0:d0c:753:11d0 with SMTP id 68-20020a250d47000000b00d0c075311d0mr18078809ybn.64.1691057234616;
 Thu, 03 Aug 2023 03:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230803033937.3051756-1-ruanjinjie@huawei.com>
In-Reply-To: <20230803033937.3051756-1-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Aug 2023 12:07:02 +0200
Message-ID: <CACRpkdaA6B=iGFB_i-Rf3DfwLJ7+QUkSW8eoT2HniDghj78F6A@mail.gmail.com>
Subject: Re: [PATCH -next RESEND] gpio: ftgpio010: Do not check for 0 return
 after calling platform_get_irq()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 3, 2023 at 5:41=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com> =
wrote:

> Since commit a85a6c86c25b ("driver core: platform: Clarify that IRQ 0
> is invalid"), there is no possible for platform_get_irq() to return 0.
>
> And the return value of platform_get_irq() is more sensible
> to show the error reason.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
