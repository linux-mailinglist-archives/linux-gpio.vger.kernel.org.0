Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9AF16F922A
	for <lists+linux-gpio@lfdr.de>; Sat,  6 May 2023 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjEFNFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 May 2023 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjEFNFM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 May 2023 09:05:12 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E061942C
        for <linux-gpio@vger.kernel.org>; Sat,  6 May 2023 06:05:10 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a5a830238so25547107b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 May 2023 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683378309; x=1685970309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dS8atcxZJwQbExVYUG7qwyvLFr0woVdllJ5J88pacr0=;
        b=DCykVX2iDtsYcneW4PPWteSHTcPeriDOFOHPt6gDdO8MbW//UGK+mHF0NPClFjniVY
         u4hPje+y+Lzg4vuJe9Urcz60CHyL7gaX854Kdr2Lrl3z1H7UxB03xAm/e1MtGzrJp3Fc
         dkL1XlndlpEYEdFSrRRtJA+j4/1pOtm14S0u5/KiFdCcoj9bYDqPreHA4LZg1HaBRYLz
         +7r2Lfq1Be9ptUmjiQgTD82dV9DMuDsKrNV2E+CGEDgmC0AfUXXY1CFjQd2gKZcI/m5J
         Vg9QhZx1IFZt9ps58NfkozIjwds75g/fwhwKjRnaSaKygHa85H7nFJ9q/6wZgSVlSS6+
         Zt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683378309; x=1685970309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dS8atcxZJwQbExVYUG7qwyvLFr0woVdllJ5J88pacr0=;
        b=JaP084iFl7kbgcoQaxa5fcrxpAR42LW6un3M0z1QDbrMsMwRCIrOWbRAcu3ZHo1dHP
         QWpN9XRKd9aKywReAiay12Tk5+R/XZb9i9QToRjoU5DWqsijMrgeHaW5oJjHp45H2sIH
         V6iG4wMR49l7KyZXzRbNLKRyOMEZ1XvhPphSpmzCNITDx8XESIY+wmOYTgagHBTii2+W
         wxwJJf15i5xMQgI7r9K2EfDMx2WfEbG2m3jmIsXRLcg+AdM51wQmoc3jR+Xg77/OOjDM
         tBt/GHkkBokDfl5c3ZPUGz+IGM1H1V7zBns22fuQ//kM+ILFfbmXhaKvihNpjvJFUom/
         rxNQ==
X-Gm-Message-State: AC+VfDwjYNfjJxAYIox/pIja0BJDiUptGYo4ayP1XFbzSkSua2+3sbac
        JemCjtS9uKn5cPdE1UVcNiddivVFefszZG6wmI08qA==
X-Google-Smtp-Source: ACHHUZ6rFGSTb20HGZ4YRsYPn++p+CYHLbDboEdLCfyzgV+VBdsiBJ48Dzhm4uy73zYYfmP6l2duieVJod/40FcKKYw=
X-Received: by 2002:a81:4ed8:0:b0:55a:a625:cd22 with SMTP id
 c207-20020a814ed8000000b0055aa625cd22mr4941600ywb.30.1683378309515; Sat, 06
 May 2023 06:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com>
In-Reply-To: <20230506085928.933737-1-haibo.chen@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 6 May 2023 15:04:58 +0200
Message-ID: <CACRpkdZDTxxNn2CDSBu5yKnw0qVuWH-a+dPYXdHndLZbxmyFAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: switch to dynamic allocat GPIO base
To:     haibo.chen@nxp.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        christophe.leroy@csgroup.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 6, 2023 at 10:56=E2=80=AFAM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> gpiolib want to get completely rid of static gpiobase allocation,
> so switch to dynamic allocat GPIO base, also can avoid warning
> message:
>
> [    1.529974] gpio gpiochip0: Static allocation of GPIO base
> is deprecated, use dynamic allocation.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
