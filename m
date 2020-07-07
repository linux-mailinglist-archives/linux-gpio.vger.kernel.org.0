Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B2B216BDA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgGGLlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgGGLlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:41:37 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A6DC08C5DF
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:41:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d21so24509377lfb.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7L/0My4Hmw0nxk/zAz7LX4pkKR6TGLRcA6CE4xPJOLM=;
        b=IL9/OsUNTSOVSExzddt4AK4CWUR/v5bZ9OfUUimh18UkjLZ40MllYFJGIB/aCN//Gi
         IO7U8JbSaPzAxcDPh7KvBZnYAiNqrhrEryPI0oYInOPF/UXH7cP1G5VbNvhqOQVFT1z1
         hadPDW9jXnUvIJJI+Pe2zao9mf6oozWnZFM/7sAYurmlmIUTC4in8iTwSGWI35ATdGpK
         dYN74HhHxd8jlOvRdiEhJ2tEiH+q8w2yXuCSDell5I+ugHXJBADKnxsluAdw4VLoju1/
         scwZVogOdt1X0Eg+J00XhrCeJl18hSU4Gyv2EUSYfrov2Aeap01RjCJ5HK0FWqDzGZld
         EYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7L/0My4Hmw0nxk/zAz7LX4pkKR6TGLRcA6CE4xPJOLM=;
        b=aFfP9umh9m1IiQZZcVKmKt/MtccBA6nbkGwVwnW/sFkfrerw01ShpiE7wrrQaz5m3s
         EoUI9w4B5wRepUyJjETr6gx/t5xa6WLHl8Lr2mw1+SpL6/HEeUKSkkmgZHMeNWagsjGI
         hBozL7oKhv0KP7/0AdNuRlFCbY0YRcJjChTWw8eKoBibeGJI2VH/5UV9ftde5B8Z+hmv
         EdNP+ZdBiSes39roYlvTTFSVujYfBJ40Ek5T7CHp0ps5S54sUijz277yJE0MvmL6bRd9
         kEeGBakQyXCnQS+L7/dNZpV6B69f5LcAchkgmgN6LlSf95dHiZ0tn1HGxTOWT1o3eIvY
         deCw==
X-Gm-Message-State: AOAM5330y6W4/Y3zEznC3BOLme9qAc2wGbC+C7Vv/At1QYHiEvK1Q1AN
        vk/5K8uOBbHdP34OMndW+y6XSg1jcdFkzu18n4Tq8Q==
X-Google-Smtp-Source: ABdhPJz9qB6nG0uUcXiIt2zX4d51YOVLcslM/A8TsXvw47TLHd5sVFUK1DB4TwmcZWAd//+7rEtuzWJ593Cnx/sNKOs=
X-Received: by 2002:a19:ccd0:: with SMTP id c199mr32729218lfg.194.1594122095031;
 Tue, 07 Jul 2020 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:41:24 +0200
Message-ID: <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
Subject: Re: [PATCH v7] Add basic SoC Support for Mediatek MT6779 SoC
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 2, 2020 at 2:57 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Change since v7:
> Commit "dt-bindings: pinctrl: add bindings for MediaTek"
> -- fix typo and change order of patch
> Commit "clk: mediatek: add UART0 clock support"
> -- add fixes tag and real name
> Commit "arm64: dts: add dts nodes for MT6779"
> -- expose all three UARTs in the dtsi

Oh I see there are still development on this patch set so I took out
the patches I applied again.

Waiting for the final reviewed version.

Yours,
Linus Walleij
