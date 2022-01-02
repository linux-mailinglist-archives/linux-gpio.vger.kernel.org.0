Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC09482925
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 06:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbiABFRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jan 2022 00:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiABFRI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jan 2022 00:17:08 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FFAC061401
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jan 2022 21:17:07 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id i31so68272103lfv.10
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jan 2022 21:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OUJm1l1Lkz1YaEdfh/UEwDaTVMcLzVdwO6tOQfKl7o=;
        b=EhPaLrzIg6G1hnSZHwGOBFaFHxH4UcQg44k8y7RnCfMMJ26s5yYuh3KY+LGCoUO72S
         zJ6UWj/g3J+AduMZdZqDx9LQwmBSwgLNID7w37AIoSfThf/Id7LBJF1IqdhQF/4U8IRB
         YyxQq5z7zRdxF77bI6jV79EMMjbhK3HRul9oK57hQO+cDjpiN/zUwHELKzk9UcWHf7fx
         dncoZMGHqFNmmiLDT/ehp5122zyz/vLMKwkgXoUhuRhVC2B55nmx/oqyLkdIkRrmPKp5
         1k64Q55v8bTDmR+ZAnkBIWNQ5fi+1UCfb8LXztefaq7WGWOkRL0Q8P8TIPqxSD2AuWe4
         d1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OUJm1l1Lkz1YaEdfh/UEwDaTVMcLzVdwO6tOQfKl7o=;
        b=ZqNWn7nKoyBOeo1zZG0AN7QT9PMjxTimqSny2xg81BfhMtupEe1Rc9GzVqpOhWS1GA
         UhbsKNDoIOitHuznHokAfn6FePBMzdHhkrLEIvxQYemW/z4X77xBtOfo5KOc4yw92Kli
         WqWdOrlcYirKOxkKuxtCDVouUoCBGmeWPP8C1FRWimA76yAlPy7y98bKPFKq0XMPzafT
         3IZKnexIX0Jwfbd7VIR/kUSnyEf03hig8EPE3sUhPS2HSeJo6NbiE3S0qO5Sb4b/Sm6U
         fY4fVghHmVwLUS7Rlgk7g499QQ5wMlH7FjvF7BkaUlIty6tSw4EbXnqf4lfuXJs+XB5Z
         eI4w==
X-Gm-Message-State: AOAM532SCU1SjUAdgdhsiZF3rIaHr3L4iAV2F9Evcf8eb+FyAKsI9d6t
        lkuZG5WArGca4SnWzZMFgtd84QL61yUGzp3B5Eek0w==
X-Google-Smtp-Source: ABdhPJx1AorkEc1HSDDatFay0OziPayU+K/x43xNs6lLbJwcnlEBOfMLwN9/X8ZQciCUI5gZ71NO+Ml7PdU9DJ0OS/g=
X-Received: by 2002:a05:6512:39ce:: with SMTP id k14mr18954362lfu.508.1641100625527;
 Sat, 01 Jan 2022 21:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20211220121825.6446-1-tinghan.shen@mediatek.com> <20211220121825.6446-4-tinghan.shen@mediatek.com>
In-Reply-To: <20211220121825.6446-4-tinghan.shen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jan 2022 06:16:53 +0100
Message-ID: <CACRpkdaGui4ULm7E7Y7YFLZ1BXKfvKKqv4KC=eTMBDExJThPdA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] dt-bindings: pinctrl: mt8195: add wrapping node of
 pin configurations
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     robh+dt@kernel.org, matthias.bgg@gmail.com, broonie@kernel.org,
        bgolaszewski@baylibre.com, sean.wang@mediatek.com,
        bayi.cheng@mediatek.com, gch981213@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 1:18 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> On mt8195, the pinctrl node has pinctrl groups to group pin
> configurations by users' need. In each pinctrl group, it has
> subnode(s) to list pins needed and pin configurations. By supporting
> multiple subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
>
> Update pinctrl-mt8195.yaml to add subnode in pinctrl groups and an
> example to illustrate the usage.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

This patch applied.

Yours,
Linus Walleij
