Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E5C45FC28
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 03:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241048AbhK0CsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 21:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241888AbhK0CqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 21:46:07 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775B8C061D7B
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:43:57 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so16247635otk.13
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=qjLR5eTJSJaMo0ZSTUaBFBSGHI8nrLplXVuWtlCvohacrdV5/VJanyfb6He9KQ9pob
         k3CiZkYVdqEnxPQ/9mk3fScPbrwJJ7UNhePze4FuVXq2XBnOMgOQixfV+6Gz0Q+b16hW
         5aAM5CecwMN3xGteRRD6GOLbLe/X8bh9vGAMYQ2Vl5fKDrmHfFmsLi0N8FwwHW0YG0HM
         SKL5xqf1GWiWTCVyQMwm1gX/GD2Kp00RI2WXFporHY04CsZ2HdH1o1BN1xd7i+WLvz5T
         ZTUqJ16/Yue3RT05FTsStDTQu8lr+P48rNfr4cK8L/zrgv5tAni8VwPwK4/C4bNTgzyC
         +Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=HJotx7hdKt6vOwePmeWFmSW16QICgiWSAiOt681JebRYu6oIonTpiYi3I3Dg4soNmO
         tQIexxVsDhmznPsZzxcBqlU+2LPjHza6YEBhO072tSeL8j8Ck4Z90v9OkIKw087EtlBo
         6XbgVdJXxLhYVFBGX8GP3ylxk2mt4Dlh7/fKYcq4o0DUqfYu8Vycnb8OCDnldthIdkY9
         Ok/VYAEiPQUBismU7OhoIHCsVW3kVO35wIHwiNbrEIOLDiK3d0HE9BcqTV/5dtrbF8ve
         NVwK+QTkNoRiWUoHQZMHaChLN977oHDFTB1SC6BryS42Ib5GVw+0ixhORwmIKuF6CBT9
         ANKA==
X-Gm-Message-State: AOAM530E2XbFL+1bh4ZUFG0i6UIFD9X9gy5tmNF1oz7L3tFoBDnOFN37
        Voo595TDK7KBtq3Eiw7ln8jPJ0vY2Jnt8ogZ6Y77SQ==
X-Google-Smtp-Source: ABdhPJyTlLOzBIZDBtBqbPekB83he0Wo6ZiqdSb7UFzeK3WWORy7nuj2f1/Qlo8XTqr792YAu5+oqYOGKdxlpC0Ganw=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30467451otl.237.1637977436884;
 Fri, 26 Nov 2021 17:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 02:43:45 +0100
Message-ID: <CACRpkdaf9EoR15fOMXipr-z0zqwdDNtS_j9n7_M0QvxGYi2Gdg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org,
        aisheng.dong@nxp.com, stefan@agner.ch, gregkh@linuxfoundation.org,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com,
        jirislaby@kernel.org, giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Nothing done

I need a review from one of the Freescale pinctrl driver maintainers for this
patch.

Yours,
Linus Walleij
