Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D219A6B261F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjCIOB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 09:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjCIOAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 09:00:23 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280CB4E5EB
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 05:58:14 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536c02eea4dso36626727b3.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 05:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2y6QDQG/TAZRXyZk306/rRInMHlB69SkUEYaGz2stI=;
        b=svF1mz3VQbXcXWYB1S0ldYiBKKN8f/cTKs4pOovoMrctkqn4b02YYdHGND2lk8uG3u
         IBI3/P5JToSO8lPqdvd11mgg1S0tv0R3VcNXdIEdCoF7QtXJmdLzsMoh43TIDpzOF+HD
         vB1xZF3PPR51aI766jujuDi0lEXCqr8V6vD7W47Hwez1wucANSCNWZ8beNFTUs0JX1JP
         ghapBcNT9yXfUsQysdi96lvgSBxrePpNz5uCRluUgupFssEKHMZCcuOFGdOD0gkHCM20
         kzHbO7WV9DaIbgR1+eO/pPgK8101Kk5EU1vNggaunfoHMkYG8vvdkpa7llLiXTBrgWAf
         6PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2y6QDQG/TAZRXyZk306/rRInMHlB69SkUEYaGz2stI=;
        b=2es2YRXUXmJWB4JlJ99SjODeR6xwYqIkfKhd98g1BQPhcqTkLbxk3huq+nzsPwCUiL
         w5KcgbCX2CdI897V+IDPoRG4e3fvs1ZQCNVUOnWH/veAbZomRwZ9zgHl3UAZCd7r+dM6
         DaRuSONBQdAL0Og7rdTJ0uJ3HGpKNoDnTZsMGQFYmypNnffbrTWCCErNNskJXHjrZx8h
         n7qdVy7DVA6a4MoP6+PWwUTHAKIo4QM4u+oHbxVaDgpt/KFNVmqKvnjieD8sXLXDntH6
         zXH6KqbyXg0SSmeYlrZvJLlbR4uiNEEcv5fGn6ieaE4ekVcsNqtzdagfJmW6HjFBZWoX
         NV3A==
X-Gm-Message-State: AO0yUKXFoDU/bLnp1bE7HMvSgk8dMhss/B65BJDm11rkAf8WQ4N+72cf
        mMVSiV/oFXOvWcz0NBYdDzeN8YgMTwb629Wm3xjISg==
X-Google-Smtp-Source: AK7set95MU4XZ8BWZzLEK2+DVoz+Hpik4vCE9vP7gUDCd7geIa+dFDSa7ahGPRwbjikNTH9UUKzNOfUUTbKCUv/k69A=
X-Received: by 2002:a81:4005:0:b0:532:e887:2c23 with SMTP id
 l5-20020a814005000000b00532e8872c23mr14603176ywn.9.1678370293417; Thu, 09 Mar
 2023 05:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20230307182557.42215-1-andriy.shevchenko@linux.intel.com> <20230307182557.42215-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230307182557.42215-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 14:58:02 +0100
Message-ID: <CACRpkdY4beehqZbbn0+qVyfcja7eBVPETe3bh3vT3Q3JBN=JCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Access device's fwnode via dev_fwnode()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 7:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO device's fwnode should be accessed via dev_fwnode().
> Make sure that gpiochip_setup_dev() follows that.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
