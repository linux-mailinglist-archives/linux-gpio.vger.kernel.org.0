Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 918205A0FCA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 14:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbiHYMAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 08:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241345AbiHYL7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 07:59:51 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD28642E
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:59:48 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so22021242ejb.13
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xm2IuzH5NkZjS+pGQICoXtNYf1UT8FOIbW5GvULWcoA=;
        b=iu+0gpGpBjyb9eLSkk/hvanJB13scD0nbhXExD680dGqza8HhVPgAJ5dkatND3Ymqk
         SgdNdX2oUTB2SrFjRUWQeS/j9TTOxuvpYFQ6PWrfjAfHwKIigl36OUNnvMukDYOe+6VT
         dE63DGgnxZ+kAOa5Zt3UFs0uN4+ItKKtFqvmxPvxQOv6iFa6jEraOjmc81Tl6oJ/rD0J
         btHWZAAXpjEYUm+nZeWQ6hXoimIt/Rnli9pM8h4rsKiOJwSamCh0p/CcHsC0mijAfCn5
         E7kyXufUJdwKhg77NMbCdtwqAxHw6C0ZAbfQEC/07m11gj++xNHaTWxOMjOR+p6CsKti
         Vulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xm2IuzH5NkZjS+pGQICoXtNYf1UT8FOIbW5GvULWcoA=;
        b=NMygAU5B8miSsC9RWL2u6gIoiG7wJHK3T11JHk0RgrDt5bjxnwVQ9LVGRGpdo+z9cK
         g0MpP8QwFMYW1jT4UQZn9g/XxoCjn1l199vd0EghywG85vBxcaZ2rkRIieOcnxo4cD83
         HQ83f5zniv/KcfO4JlJsC4I5DXiOZ3GW0oagXFMjyWNZEINn+Ei3vNUJIEPghwUYwxyl
         NQU719CQ32ZyuovismE7lN/4KdRFO3nX2JSDflVq59jNZ+nSSmfjrgrzd0/jJlKfiy3W
         NT74HvAThA2PcvCo3VOT6yvxVHYYdP6Zq3yAIIdkKihoagzVq7b74pRgPsrGOybY6Ybm
         2MTw==
X-Gm-Message-State: ACgBeo1vEydf8qYNbEVgVuQjSPb/cA/SHnGIxFri4WLkIqAJCe+LizVp
        or/NjVlrIIBQQpwRsNuQ96VXyiDrZiQrh4AQQPGYJg==
X-Google-Smtp-Source: AA6agR7mZ5xAEcHD76JxST+kccxcpJ3PWAeaLz5jXJFne317cGpVf3riJ/pYd4HZ5ibAHmPfHoKVmG+KaiO0PSVkxSo=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr2330972ejc.440.1661428787087; Thu, 25
 Aug 2022 04:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220621112904.65674-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220621112904.65674-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 13:59:35 +0200
Message-ID: <CACRpkdYCduUyR-H1ztQ4iQ+Z+nMhFe6V2+Re1zQVM1Mk0hG+_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: nomadik: Convert drivers to use struct
 pingroup and PINCTRL_PINGROUP()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 1:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> Utilize them instead of open coded variants in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, was meaning to test it on target but was too ambitious
about that and forgot it. If there is a problem I will notice anyway!

Yours,
Linus Walleij
