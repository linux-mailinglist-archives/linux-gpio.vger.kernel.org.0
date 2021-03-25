Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB095348CCC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhCYJ16 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhCYJ1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:27:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD075C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:27:41 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 184so2209545ljf.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsHdTvG/QnL/RMsV0A6gUhCQmyonTHg1LR33V9IaQI0=;
        b=hnSnZtQTEM48kP52tFUl98D3BvVRhgU+MU+zZy0+v5+cLblLERQsxgffOKscuDuk3m
         0Olwlf6QAEJgAgmNI9vqkN6ZmW4k52se0TtUIyCNlQiR06axgKo8KrRN06ogsVz9yfGo
         vErqgGYdxq3ToQ/mnevJUK2wgkY/AQOiKYbh4/k2EtHxX0/kTORXR/YqvQs1C9J6xusO
         9Z9PYmAFK2nM50gF+mkQyZXUp8APc7f5AcyGt0wGAxa8fBew7cpPxKHNA6rynpToGkag
         muZy2GHLB50nZ9TVpuOPOxloKLVCLGqcsBoggfGm6fDCke5Qc1d/k62mEqw8Q3mqVXPS
         t0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsHdTvG/QnL/RMsV0A6gUhCQmyonTHg1LR33V9IaQI0=;
        b=Q0KOB+4S6/TlTvnaeLONxV0jc2oaBDB46/3Vo51b++06DwPTi+mkeQVzDMcvNjrVez
         hnbPBnHNM+R4enZ1wp2k2hTR8mPhEgKDIE06g8V1EamCNV1Hqipasr2Zq4tRgEeolfYJ
         sm5f480RUtQ4fsPkRjrAYGbGSWFDqjCH8a94wI8kkilstsSAM+UgXf6euA0Vg5XOrI4w
         BCLC57MfDLKi+8dtnnzXQYymI5gUQhu97md5qxBz99uQfqm35mpPI3jUEAC1uMZcVGz+
         +4/LNbfqqRuBJxShv18RQ0/YSEEtG6oFCLBe5boBlm9kvWCVvgEm6A4s4tHzxpt27hy3
         aTQQ==
X-Gm-Message-State: AOAM530ZEVmzJ2pTaaimqTACGm+IiAN6Jq9glw6PQC9D1aDFYvI2sG6S
        FuJFO1Hwip2ErZqwAAByEsIaS7tohcdZbugXflvglQ==
X-Google-Smtp-Source: ABdhPJxa8BhcHz0FA2PXr6I2mYN+MNsgGHXLC5Ew+Y/aWPtsb3Ri0CK0CzggWptQnMrGEMid2pK+Ky60HOeRIbawnLc=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr4931647ljc.200.1616664460376;
 Thu, 25 Mar 2021 02:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210323013727.135571-1-wanjiabing@vivo.com>
In-Reply-To: <20210323013727.135571-1-wanjiabing@vivo.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:27:29 +0100
Message-ID: <CACRpkdaMpSDQduyTHPGvyo4NC07uvfTBcmhPiodOsJ929QxMfg@mail.gmail.com>
Subject: Re: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kael_w@yeah.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 2:37 AM Wan Jiabing <wanjiabing@vivo.com> wrote:

> linux/io.h has been included at line 6, so remove the
> duplicate include at line 18.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Patch applied!

Yours,
Linus Walleij
