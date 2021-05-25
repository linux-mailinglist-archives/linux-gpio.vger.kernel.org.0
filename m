Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78283905D0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 17:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhEYPtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhEYPtS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 11:49:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85C1C061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:47:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w33so38860300lfu.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXBXKu4W9bxzceCxfDuDHqm154FbpM/qT47Snoz44Zg=;
        b=RZb2nnfuv0w8exQOi3HBhnZeddYTIOo2pLcjheMb+gsg7X4ErlH5cmn5sNdRYNlhML
         I7vxiaTe08mG712R2fk0V34OtayZyieBz+2nqQL30TByHyDjKjbsq2iJ5/NZmTu+qgIK
         xw/38rtEApX0XXfGZ6sUc4cAtYm7kl8PwY+awvcO4N/Tt8aT/Jw9rVuHCETQsgkl8qdI
         7xBEbUya2ug05pxlmZ1zemrYSeEDYDc8p9PfFprBwRJsQlK8VoNZEmWQDyMrRfZbPh/G
         tTQyzXUaGbEjvTgYk4HIEBiCD44kWLBYDLqy5JN7/hnwgFsH6RhrrUr+diQC4vrYjo6a
         MUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXBXKu4W9bxzceCxfDuDHqm154FbpM/qT47Snoz44Zg=;
        b=SbOYoU2+p5KG1NFC5kIawmO21URnIbygyIrwh/bsRGUrQaETelMLr0SgJspxsVjjD/
         BNGegUCKPw/UBBencZb5DCyZUL43/9fyZM/ydt3JhR2V/LNzPfAEnESG1HYOqZNnVwwO
         1t0HX5wj3C90tbAKzOX0Ufmsj1khmuYsueLdmAtnD5vgLEbgTH+hI7SyCd9rt5LQ3dP1
         z91S7RSeym4p5/orM5y01G9NpsXWNdpECRdt17oOExeuahUGUWNxc5HRiWknhQeIdmqk
         pSGOsbpivbY2HkWTcJcP0aq/eUmq0bIZ1b35CyFaG1BGX+uE7yi73TmHpo3kmGakGVZv
         4cdg==
X-Gm-Message-State: AOAM530E4ivp+fzo1eVrNDZs6m4vmIgR8YvQ7NYwpYKpc3UN4vPyEOlk
        25n0pIDMRNaQs6tosOslREuTmssRJehm8lCjjPOr3A==
X-Google-Smtp-Source: ABdhPJz8Wo+42p45CUfc5WWr3rKVVCr+Kr6PAPDnAcvWfj66Minctqzwnosbr3mfl1YgpPjGe+SfNzw7ywQsaiJM9cw=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr14328522lfn.465.1621957665953;
 Tue, 25 May 2021 08:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210520171310.772-1-mark.kettenis@xs4all.nl> <20210520171310.772-2-mark.kettenis@xs4all.nl>
In-Reply-To: <20210520171310.772-2-mark.kettenis@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 17:47:34 +0200
Message-ID: <CACRpkdaRQq4nLQHQcm9m_O6R2QL2UK+bDkfOdv7p18C9xfuX7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 7:13 PM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:

> From: Mark Kettenis <kettenis@openbsd.org>
>
> The Apple GPIO controller is a simple combined pin and GPIO conroller
> present on Apple ARM SoC platforms, including various iPhone and iPad
> devices and the "Apple Silicon" Macs.
>
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>

This patch 1/2 applied to the pin control tree.

Please funnel 2/2 through the ARM SoC tree so it aligns with other changes
to the M1 device trees.

Yours,
Linus Walleij
