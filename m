Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0621D71D7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgERHbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgERHbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:31:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE40BC05BD0A
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:31:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id v5so7086113lfp.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uh6U4dZDkbJvSpWnsBIA2oI3GollY7EReC9a0+QL8ds=;
        b=fn+435nTT2iQwLK5/3IA7H4r47HpNUn5YBHSB+1i2lkrJx9KrtWfql0W22bANgDWw5
         L+MnwKFA0pBFg2ZykU7CHeBPNSJlNsXD4oq9wb64di1dAgA/DLCvWUzMGsZZiHOpJn4w
         sdj7TJpIOJhma0T9ExyDAW9vsJxto9cpcDC2gNsExVzImla6dOG4PThs9V+fZS3puNcm
         IYvoNztUspqoRABag4wKI3CTCltF+XNU7FLKsLq8hWkwpeG3kDeFRarJZf/aYQloYKVX
         k2rwKJHcNK+axSzVLvl1quy/Etht9cPCUxdvWfKXkKbRJVAvkKAcKv4Fo2J4e2g414lq
         39IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uh6U4dZDkbJvSpWnsBIA2oI3GollY7EReC9a0+QL8ds=;
        b=J7fll1Q037qV05GU3ONqgEHLPaHRF5oNymN6eKuWL8/a2WKyMrQ/Vkd01ofH7WYXJr
         ynjGntY9E2KgZJJfpV2eGwVxtTDIydmB6jHJ2AAL6FZkKSuq40hE37tHEkap0iyTcN0o
         W0mAeM1rgyPr0ht11sWgX5Ov2YRT5nBl5V9Qtoj/tiHTdIgmL24S6v02TkD7vuZ4ibFF
         2RocJa/kbqTjrMyBGXQSzkL7q0LlT8LdHx4pRDm/AIjRN7s8XAXpimZipwdqD8ciaZ9k
         yeaSmE4b6daB8mWiBZTOKIzX3JI4SgL1X//QyAbmu9a6QqWD/rL81Pqe+Tlk/d2o83CX
         fQCw==
X-Gm-Message-State: AOAM532qDXk1Upx4QsM590hGdXxs/9O64/xTyQIr6gDofTPU+mUmmEva
        D/xlKhJTg5snVEwLEKFLWKCJd2iGkdnPDxUqP107cQ==
X-Google-Smtp-Source: ABdhPJznbrsFsG8QKFvYdy2XwjkDX2MMyM6frFix0Prjjj2ufcZwEICHddKXiikVCWz07ysLLhFYASma4iKq36dcOmQ=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr10393421lfg.217.1589787072183;
 Mon, 18 May 2020 00:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-3-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-3-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:31:01 +0200
Message-ID: <CACRpkdaZjjxfnRPNxOZghyY=pFMwEsd8GqRYxt1QsU3Qhm79mA@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: ocelot: Remove instance number from pin functions
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
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

> This patch removes the instance number from the "miim", "reco_clk" and
> "sfp" pin function.
>
> The change needed is to prepare the driver for adding new platforms
> with more of these instances. The instance number is also redundant,
> as this is implicit for each pin.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
