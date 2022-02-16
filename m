Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24BEC4B8BD8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Feb 2022 15:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbiBPOzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Feb 2022 09:55:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiBPOzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Feb 2022 09:55:55 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426501F6B8C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 06:55:42 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b13so4445900edn.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuYrqVGn1TXdwN+P98XHhqL2+XquzgdKMr559j4kzX0=;
        b=m7KLBnpGSaAT+kElQbyWCpRqg8l5Xarj7SE9j9Q+Gl2zvdSTaYahgURCT8X5H2Ni2L
         vKgECZZX8XD2Y+QnZUn27ISb3qicevOkHpXjolTw4zvDUEZ72k1XrDUvmMrxR54sLgeY
         n13R9STJnkboF2nq0JYVV0CkTfuV7LwJVNvxNS5xWP5B6cH2rixzqtQf2Cdo2K3XlnwY
         Y3/XG4x8s2oNS9/DZTMyIJntOp4KAtdJtIzNeA4e5c8HhqkwQdzAK+3eH3jMcrW9BiHV
         j3lDpWbx9LLmAtuLKrS+VdGFzIfr2OJ8Hil2kSdMkWrSio4XnljeNfior5cdXBv/M9nm
         55Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuYrqVGn1TXdwN+P98XHhqL2+XquzgdKMr559j4kzX0=;
        b=5BK5lshawk2+0sckutf3MzhrIRcgN/3CrDuDBjtPOf9b5QYIdfyqfb45BDJHgbSCHQ
         IcL8FoCytGtRo1QA2H5+byqlOHLFZekRkJ9BONJM3JOe7lAJ0Mx7S+2up78GkTJAAY7a
         LgGpgmuYAHaVhPA1W2G6sPE/I5gv+buYkZ6vPmXN4eGyfeu829Zch3j3gDm6V3nyJRky
         UUi4xXUt52O0wZ1aC99+n3DSJkLMW8IvI19CmcXwWMubu1Hjl6b4x9aHL8WNEU7lofvl
         xYC9NO4NxFRP6RcCK7m4DDA1voHyUWGLRNUqJrLdSvgexm76+Oz6O3om2/wv2d30aagN
         Yj7Q==
X-Gm-Message-State: AOAM530lN27WGXhadUrGSRl50EDpySqw8ucYcN4Aw41bY8vcwcbg/e+1
        QCmFFAne9zJITj4+yAbwY/zuOU98MC4jKITKelFpZA==
X-Google-Smtp-Source: ABdhPJzRulNtz/zoAWp3FH3AaM0DWDfR2fpgNtKv4EW2Sx9/HjO3bwTxfgHobgEyuXG7kSkT/MQf3yK3aZjoHeh44u4=
X-Received: by 2002:a05:6402:5194:b0:409:97ec:3bdc with SMTP id
 q20-20020a056402519400b0040997ec3bdcmr3466054edd.314.1645023340859; Wed, 16
 Feb 2022 06:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20220212205048.43862-1-samuel@sholland.org>
In-Reply-To: <20220212205048.43862-1-samuel@sholland.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Feb 2022 15:55:30 +0100
Message-ID: <CAMRc=Me8cmiJSu3dKDgzhKZchSYyC0KmnrLSDL0ckr_uASLv-g@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: Reset int_bothedge when changing trigger
To:     Samuel Holland <samuel@sholland.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillaume Savaton <guillaume@baierouge.fr>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 12, 2022 at 9:50 PM Samuel Holland <samuel@sholland.org> wrote:
>
> With v2 hardware, an IRQ can be configured to trigger on both edges via
> a bit in the int_bothedge register. Currently, the driver sets this bit
> when changing the trigger type to IRQ_TYPE_EDGE_BOTH, but fails to reset
> this bit if the trigger type is later changed to something else. This
> causes spurious IRQs, and when using gpio-keys with wakeup-event-action
> set to EV_ACT_(DE)ASSERTED, those IRQs translate into spurious wakeups.
>
> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
> Reported-by: Guillaume Savaton <guillaume@baierouge.fr>
> Tested-by: Guillaume Savaton <guillaume@baierouge.fr>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---

Queued for fixes, thanks!

Bart
