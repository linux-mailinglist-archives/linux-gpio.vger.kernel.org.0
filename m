Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91752600C03
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJQKH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJQKHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:07:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5155025EB0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:07:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id sc25so23658770ejc.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGtXer83XR+m2IYRg0JLDyRhVdnMRmL22/68B9bdc+s=;
        b=cPSJg29ReL0pEy8WEchjl4Lg6lCgqPtiMCk+uW+iqLI4jXhDtUj723lk2zCkAsVzLi
         9uPFG4e+nqqCn5k3ZJFJfg0NawpRatSOkoGQC37WGlMgF23kUX68RobsD7ItwAahf05X
         /xGF32dXkkwqH0zs7guJV9p8wJquXqpNxLXjDLPOjEcb85PmsY3ZyDwlhwOxdWqcT6C0
         gJ/X0m2F+77qDt4YEQTD7vSZbVJyFXPYgnGO8K4Ffc3q40IM4/tDBh+9IxTSDNFfhHpF
         Y8PzGBphQcIMwnlmGn/WNCeKoHRiB0B//IRp0kqDqlWsUIdsiJs3MkTTBEp64baen8rw
         FHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGtXer83XR+m2IYRg0JLDyRhVdnMRmL22/68B9bdc+s=;
        b=ARxfdFm7L+l4ARFlqApcYwZ3H6q4nwvUrAE70xuovL6dmSs10Jd3W1A/rWGZCKjZS3
         d3rc1kXdkU2YLy8nm15z3b6gsBQdgzt9RsJA3tlZNfOE/7CHE1dF6IsOPEfD0aFif6q6
         bFcVEw9yqIQyhl9SNagE/bLJMZuSSv/L5JZAH5rtV8I9d01vBaJ3QcyC2FCZt4Q5tK1d
         D3wqU7shIxHmWulE7FZpkI28LZphmbR2GF1ai4Wbu+8J7AHW6Cp+33gIH80ylK2SwONN
         4tX6dkyuczELzllLWhgP4Trk5PK+WFWkErmSez01qf7tFzTaK5klHFeMpjkdH+d3G+3z
         H9Gg==
X-Gm-Message-State: ACrzQf3ZxnQ8jS8ejR+zjbUjdl92U3pRWkkjib4EACue4ISTw39mE8h6
        On1Ypk5893hZBj8JRg/glXPWTEvUMy94K/GHdL6hAQ==
X-Google-Smtp-Source: AMsMyM4fCLG9gy4XOGjcE/5EAMi1ayWK6UFqjzahULlxctak1d9v60uUA6Cjl93a8nblOEVSDIstzxhou+9cfXqn7Os=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr4945992ejc.190.1666001242841; Mon, 17
 Oct 2022 03:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com> <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
In-Reply-To: <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:07:11 +0200
Message-ID: <CACRpkdbSg-TmaxK4yd2pRHpsg4FD8UR-YfWBFx49cJFq1qJjAw@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
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

On Wed, Oct 12, 2022 at 12:19 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The driver is using non-standard "i2s1-in-sel-gpio1" and
> "i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
> converting to the standard naming (i2s1-in-sel-gpios) and switching the
> driver to gpiod API add a quirk to gpiolib to keep compatibility with
> existing DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours.
Linus Walleij
