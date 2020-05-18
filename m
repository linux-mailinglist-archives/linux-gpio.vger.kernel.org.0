Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3831D71EB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgERHdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgERHdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:33:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0753C05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:33:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z22so7145092lfd.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uhRFGDARrcoHPrKHMBYkaN/2j11MRjpDJJbVmx54CE=;
        b=H+oFxtUqptu6CrGRKkzcmJs+eMoraTQOATafIq2NDm8CwHwFmls5nvwqEoT+8/mmOE
         WU7jisauq4/IiaKjcokmWtKJ1DP0tvQIHBs2ljdiXl8qlGxOtvQEAa4lD7HDUDrqwTWo
         VnA6gPlW7BZEITXpxQXAFUfO8KJGhgyzDF2UXRCdOQb2doToExJaRRP+vFv2jjUUPojT
         48hRbviNApp8pFFIMOcAtQbGT6U+m0T/qRRWzR9Dw1pnv66azfT1YUY+BE6/qqXLbxuk
         l+jytCjh61iQMLKyg95PEYoavnodXi3brpiHHaRO7wI6myD90jtTysY/uu3Mf+GJycpC
         l10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uhRFGDARrcoHPrKHMBYkaN/2j11MRjpDJJbVmx54CE=;
        b=CrT92qBvcusKL2zn4E8HE+NBZ4RC9vwY2Sh3GH+L1uafzf1vqqXvqqAclYjZdtGyK8
         hOvpQli/f+1GfHzEUZqkqMBXeq/jg3YSo5YhYOaQ3/WNnY0UWrPFAF6OAUyNagIP5qnB
         6bAMqgT2At/ntVYFsl7tKXoLG5ExwQMTi1Xpuzv5hXTvhScW8Q6ovGbGpzBkR9O8JFxj
         NkYCnoMoAZ6ORDv3izPSkxKw+qR3myp+P11L528GuxUEA5KRb4Tg5/cOLXlS59pklUI2
         NqNUUjFrcN1iZT8co6ETWeciSKcbB754CLD5mclXGPWYSArOob1FQVV6H+Lj5GX+4b/o
         28TQ==
X-Gm-Message-State: AOAM530+8jyccFmcmie2NwSBg6FrS14F1KLx+8KiTXh95YDJbpleDLFU
        0LOlOlRiwr4PdtPeijWs9nOuttAmUzdm0b9csXyl6g==
X-Google-Smtp-Source: ABdhPJzM1cLtBMnZR+j+nSiG3KeWErg7zOIoRWARiHZUlNStxktk9ge3qdAjjUUMvZG6fIllhCXtTAAglY/emlzid+o=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr3670246lfn.77.1589787202475;
 Mon, 18 May 2020 00:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-8-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-8-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:33:11 +0200
Message-ID: <CACRpkdZP=E=LvEFW4b8HvXR3yYFMzALC5_abiJuoewod6V+Y4w@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: ocelot: Add Sparx5 SoC support
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds documentation for the "compatible" value designated for Sparx5
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
