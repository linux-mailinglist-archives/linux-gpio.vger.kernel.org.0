Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B3262BADB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 12:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiKPLGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 06:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbiKPLFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 06:05:24 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423912ED73
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:52:01 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id f7so25956895edc.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmDzdOcJCZVFEJz0cGwp78BZmKtS5/OHvJ4gcqeQ22U=;
        b=EPRG7osZR2L/3rHtV1b9dGX3T17rHFXmQU4zzbKNX42jRXbXowHCVomW9FwUGaM2r7
         LYIaZDA+k7YlaBCM8mr1imuYBEqlTmhT94UfgxNUlF6CpZnysa9lDUTQEDM2pTqyBukU
         qg38moV/kYoxcYAHoehRSCis7Bkuu42chBmryhv4yZjqtCGquzjMUF6QW4ilLCqDoqBu
         K2cU8PYsJItfRVia9c9Nrmqbj7+yqvqJzvrAm8FwazSKl2BQacUDhjza8CWDHqEn0f5I
         rl5+CYTiHV4BcqwbmjrWj7WJQyPOn1rqbndhF/6JKTrY1cGYOkQT3yHB9H4U6gKPh5e/
         /thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmDzdOcJCZVFEJz0cGwp78BZmKtS5/OHvJ4gcqeQ22U=;
        b=rv9pqC37ABVXXwDrs7zSY+cKyYVYZt/7Ap1efX4M0vK5xugFcGWN3AQgfoBk24hy9n
         qBYz9SSDhpGaj+UnIvLm4a9MEzt+97eCVCFmNjW1OGeuj+YH5/YQ1GJf+9S73Uz+tsLv
         zUO0SdnFnG7kGND9+QvRExjAN3V73t3sMoz/kaB4OB/R4HFrPP5ReH3dWdCm2QPKEAZ3
         LQBJWKQQq67e4CaIEcRIr52HImKsgQEngFG8P0s3HuPDNVBv/VpGpgfVHhc0eECgyLAN
         2sHPRMzdUnLDT8RXM6eb/KE6ZYvfEo9oVAdr1sHc/UQdUVr6CaJ4BmPXxRwwhAmfDx83
         RY1Q==
X-Gm-Message-State: ANoB5pkxckx+4hRVauMOuET3bWN+rWi0F4qKRtJAAEqagKHddKuFuo7+
        wwBLK433ospj907ZjIkE05dQZRM+cvkyuaTd2jHULw==
X-Google-Smtp-Source: AA0mqf64irImFpuxWfnuQVwe5pGIad2p0If0h7oh7065tcZjwfzMlUBDf1yRl9o/jLlSJRaOIU8hV7LxOrNP3Ko2F7I=
X-Received: by 2002:a05:6402:b7b:b0:463:ab08:2bc6 with SMTP id
 cb27-20020a0564020b7b00b00463ab082bc6mr18384756edb.143.1668595919878; Wed, 16
 Nov 2022 02:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20221021084708.1109986-1-bchihi@baylibre.com> <CACRpkdYdmG5cFenESg36BwVpJ7FDJunPH1Z8dJjHwmu+NW-etA@mail.gmail.com>
In-Reply-To: <CACRpkdYdmG5cFenESg36BwVpJ7FDJunPH1Z8dJjHwmu+NW-etA@mail.gmail.com>
From:   Balsam CHIHI <bchihi@baylibre.com>
Date:   Wed, 16 Nov 2022 11:51:23 +0100
Message-ID: <CAGuA+oq8XrvNrDdW6JZS7UyhM4ZCk-RvpMUnw-bht9d6nJr3jw@mail.gmail.com>
Subject: Re: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins for
 MediaTek MT8385 SoC
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     sean.wang@kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2022 at 3:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 21, 2022 at 10:47 AM <bchihi@baylibre.com> wrote:
>
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
> > To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
> > This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.
> >
> > This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
> > "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"
> >
> > Changelog:
> > Changes in v2 :
> >         - Rebase on top of 6.1.0-rc1-next-20221020
> >         - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
> >         - Add mt8365_set_clr_mode() callback
>
> Patches applied, no need to resend for small issues.
>
> Sorry for taking so long, I wanted some feedback from the Mediatek
> maintainers but haven't heard anything, so I just applied them.
>

Hi Linus,

I'm sorry for the delay.
Thank you very much.

Best regards,
Balsam.

> Yours,
> Linus Walleij
