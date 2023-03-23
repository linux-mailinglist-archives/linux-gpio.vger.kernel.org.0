Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA16C6171
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 09:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjCWIRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 04:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjCWIRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 04:17:19 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A422F7AA
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:17:18 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-53d277c1834so382131707b3.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679559438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdKzKGBqE2UzdYM8uwBYXrywRu/Xybckfy7Y+++wr10=;
        b=NI9FOTYwvRfNRNSGZO17tdlW0rywguZRWtOe5U0p1MyeA4adXKyL463IGDS6IXPQmr
         HQUA/Qg97P/BDnqqPNss7DxhUbUPdufgO84cWbnaxJA3hjb92FZCamWf8q0ZjhtNdbKW
         0ni8Y6x7pC/n4yqYBm5aH7zXfW780Xz95sMl/edpuzI7u+dNcCH7HfhcpVQJmSg3pHHp
         Gl5T1UPjivdexU/c39SW8cKeFpBy78SZt6LBiQj7UFQ2hySeotJjnbmdw8B4QtVr14CV
         2Wtt/bBKYvsEIBqGsc1LhYRZrHTOc6G+u6NEeBgbLIZ+JqhWuILKVuJ2DRZNy8r4htf5
         5tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679559438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdKzKGBqE2UzdYM8uwBYXrywRu/Xybckfy7Y+++wr10=;
        b=2f4DJwjMr9aaXafghliLwSs+I4sHDAKrhemuV7FghWgp1yUX9++KmuEtYl8Dw+xPxP
         rU4TOv8yto3UmGxV8slY63LP1/6dkn6XYV2oLvM0jk2XWS31rkOx25B51jTBSLh9pdWd
         /Z63Tb7tPwDvY3kGp7nWbCaFDOeD0RnwhZP7Yz3uflZzVUqSiKqPfUXrX9y+yq7xhLhW
         ExQ2fAF/aAvuIN5NW18GqZgQepdChDZHV964uhq9nyCQPLCpFxXLp/vapePaDwM8BtCW
         Z6kDNB0yw2cHlOmt04u5PNDhE9h/SbNxKSVV+I41sozS+yy2KaF8tHDiYoO9CbcfxVI+
         m+Ww==
X-Gm-Message-State: AAQBX9eK8jUkdTzIN9psSNfj9yYOi4SfzolACC1j2WQthWmQv7IvZm6a
        tigyAP/p42r354xmVki9wVIoyAWRUIaBDJln69VDAg==
X-Google-Smtp-Source: AKy350YN+CgPSFTzKICPcWLKCZQ/uzwmk8idwB+0RhLSoiZKkqryk6nDE6EkOkBhOk2uJfA/eIaf3j6XEgT4M1GvXT0=
X-Received: by 2002:a81:ed09:0:b0:534:d71f:14e6 with SMTP id
 k9-20020a81ed09000000b00534d71f14e6mr1243394ywm.9.1679559437818; Thu, 23 Mar
 2023 01:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230321135412.73240-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230321135412.73240-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:17:06 +0100
Message-ID: <CACRpkdZhb=zFYjRo4zS5+on3yEB+eLP_mMWFoAkcyUNXjRP8NA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Replace open coded krealloc()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 21, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> gpiod_get_array() does a new allocation in some cases, followed
> by copying previously allocated placeholder for the descriptors.
>
> Replace that with krealloc(__GFP_ZERO), since it was kzalloc()
> originally.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Wow that's a really nice patch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
