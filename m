Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACA3570167
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 13:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiGKL62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 07:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiGKL6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 07:58:23 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E402332BAD
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:58:21 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31d85f82f0bso10213877b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kb9KHIuo4IosRBw4fXiFNpYBgAtjRiuQdEYMHy61dYk=;
        b=uuzucqYoJK9QyuGI60SrzoVpti+2eBlJqaCC6sB9ZZJd08dlBVmeCukV4HfC6zZVhe
         1/X/qe6RzkOA/Q+PuOEA0auY09gTuarB3qd9dqHvZTDV3zFz2f++mKS7gh0uMHZz/QaB
         rrdn12qHtkuMmBtsPJc3r1Ohad2owVw1j4OQI2HRw1CbbNkim870g3cUO6VQ9Lvgm8Zp
         QTDX/2jmvmoB/kKzXTbrY19GS92XKmd/rAkm/4WYpC3ZXPJ+fS5EnaXEMj1SdT6sBWP8
         9j3WF8jB6rdPDEHdldwClYu2VKbdZQ6i0P2XBLQgjXq3lg+CzUXaBSMaFuhDmOqlGYB1
         yZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kb9KHIuo4IosRBw4fXiFNpYBgAtjRiuQdEYMHy61dYk=;
        b=qaNZh2tkNlXo9AWIclfDSUq3NfGXVwdD1W2Dv5nuMrpuAuqt+JTx7aGQnNq5yuIRFX
         5nEER8B4jwmIZavJz8SMGaI1W6LxI8w40IBKQV8pG9Uywqer3sBL7uY8BEmg8x5pqvBB
         TpEMWt5Ay3d6q6sp4g4KgsdB9JgotxPNZl7Byq4fZ3yycxVE0KYdkVGPj8ZyxJYwJOiW
         w2nyg6EHcanl+ztn+2EwBav3kpaLYPylWxX0tqd4RWTx85ltsSG6dtDVxxzD+Zzj4B4K
         Z6HblLl7ExUCOMlJbtXDLzLveSgRjtPr2+vgxVvgjtC9UTuln5tuMrpTfZ7jkwMGXi4S
         pZaQ==
X-Gm-Message-State: AJIora+Xit3retWebbfGBoyNGb8sXLuRhvUol/d4bcsMm6rPBIomYorQ
        6SFDiQR708Lzk9GpYQ6rS8W7IGVJZ4dC/Iaati+mPg==
X-Google-Smtp-Source: AGRyM1s/a3hRCOR5r59cRwkAhmMUw0kBr01CcqkFmETfUZZ7ZH7MngwVHzji1O6LK5sxiEbLLw+AGGSOXnjRa4RncAA=
X-Received: by 2002:a81:34c:0:b0:31c:8b37:6595 with SMTP id
 73-20020a81034c000000b0031c8b376595mr19493629ywd.126.1657540701119; Mon, 11
 Jul 2022 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 13:58:10 +0200
Message-ID: <CACRpkdbkpBwABmj31yY0GN++gvbaaox6=i7GkrRYu6ESROZzGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Fix name for mediatek,rsel-resistance-in-si-unit
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sean.wang@mediatek.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 30, 2022 at 2:23 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> When this property was introduced, it contained underscores, but
> the actual code wants dashes.
>
> Change it from mediatek,rsel_resistance_in_si_unit to
> mediatek,rsel-resistance-in-si-unit.
>
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied!
Yours,
Linus Walleij
