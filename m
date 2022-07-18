Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E317E57844D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 15:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbiGRNvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 09:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235527AbiGRNvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 09:51:23 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C353A27FC0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:51:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id v12so15361035edc.10
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FX5WBegXYxt8TPRqlSjbigKjVuWV3m+IHhLCoDXIxx0=;
        b=qN4VCYWqbZGoedTlRLik7eg3uXxKDUc9RH4HbEdrOYzHIom/+vEP6t2PvXhKGuYyfk
         T9WwUZYeXbHr3AmKeuBRdA39Ezhg2uWrabHKrNgKQLs2ohxD50qU759OtDDo31qCKY+v
         kJwn/cu/rImf5WskFF/wUs8tWeEd1UostMCPV3i9iBfrIKXOSuWu3fC5CHyfOBQap90P
         srrO9FqMNXoEUWJAnMmmfGVzu7kjOLsHMIivqHwI7fHrIiBcUS07XeUM5Ica85nvVGP1
         gEiMEooPwDTsEGDn6KNhlq7E72L6Gz9ZaIIHnh537l36BWZI9YEPrGwhckgKP54TMCcY
         zE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FX5WBegXYxt8TPRqlSjbigKjVuWV3m+IHhLCoDXIxx0=;
        b=MSFYJecAiYRrmJysf2IKXRvpciaH1kj0QWn/WjGyN/2vX4w97zVndkWM76NUWIDaQB
         E2X1SK6RXn0FkpeyBXK651CBsvsEffrmLCnCcwVyRxX4yR/dKrqsVSDacsUcI+G8vMUb
         7cH3llyrJSrGXszrCGTirrGDCt7VI3/SiJOZGuk7mG70cgwtTv8kOzzVoSxot4jPtU2c
         s9u2AAgr3+5M1/HKRP69VsYoD71TPPMZClsSgFWkfWpAILi3gFx8WfWuDgKk1W2b0L6/
         mirZ08tu96W2Honb9yHyK/ClymKv3dWP9IE1rSAWpNP2aS7ueK7DhvT2e7j2UqF25Dws
         1I8g==
X-Gm-Message-State: AJIora+5IVLDimjUUPKlFftREQzBh+f0qxOK7U6GjJTxpHv3q2wEol7A
        iWOXoyQnpn8nesWx5md8NJhOWR3hDTr4KVeRIiFw78aL6K7Jtg==
X-Google-Smtp-Source: AGRyM1t3dA2tk8LXV0pPB07x+oT3pL9Hsy/ZpnZMbDWHMlp6EfTab5BintWsR1J0/g2Eij3itxb29c4h0wz37oxuDic=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr36014163edb.46.1658152274324; Mon, 18
 Jul 2022 06:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220718130215.31547-1-linus.walleij@linaro.org>
In-Reply-To: <20220718130215.31547-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 15:51:03 +0200
Message-ID: <CACRpkdZBE39czLU5KYbaPQB1HYrTN8kLsjuLHCtgYxQ+r1gkvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Fix invalid example
To:     linux-gpio@vger.kernel.org
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 18, 2022 at 3:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The commit switching to use standard drive strength missed to update
> the example. I just put in something valid so we don't get the
> warnings from the DT bot.
>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Fixes: 1b3ab63e56f0 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Forget this patch, I had a proper fix in my inbox.

Yours,
Linus Walleij
