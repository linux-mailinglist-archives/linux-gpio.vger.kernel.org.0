Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC825701B4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 14:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbiGKMIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 08:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbiGKMIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 08:08:35 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524742FD
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:08:31 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id h62so5715058ybb.11
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Om2IrQfwCrPo0MA8/pPxysfzEs3CSkoYWwAPxfYhOy0=;
        b=bpngKpW1cpJzuExDn73o9dXJWjMhC065/MNqX7+1rTYeKgmQEsfy3KL+pLh+iQ6hlq
         fX9hyJKwMApG8XGmdcTeKoVWyFYU3XuvMcoGyBkv0HypeJ0jfAsVp8giTyEn4eX/X0zs
         +wCpviCB/3KqunIAxvKR/EUNBmXeTKX7xgn8wotAdtsquR1I66axptZysGtqmmRkI81/
         9lCXU3JgaNxX2V0prGE1BLeycAEMjE1s35Ci3928TKwlWc5WZ/uQgOPolLpcPicqaPKr
         N2Xj/U0iqID17uUz/xS7yPs1clMdyArW50MNFGknEJAsyJ+OB8MgxabX2VO1/o5LpOdF
         UFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om2IrQfwCrPo0MA8/pPxysfzEs3CSkoYWwAPxfYhOy0=;
        b=Hjkx9gCXLU35XIB1kIQ8nvUMfbG0FlMNYZtFhF7tMEaLoAx6wZ/+snQ5IPUp+6l/tc
         84JcfA3SrPiOXoKTVT+WJIgFnw11i8IBLaZfmj231d6jWgqsMdU20Q8WiVOdSui8+YFq
         6+RMY1PeSELDTCAD7EqqIpR//Z8u+mZc19fiOhsCUrAld29PcL3dLcVntdH3XHH0zRte
         12McW1hbXRkC83H79XF7dUeZ+xY3KQ5mccX74LwKPyDTXzAhIjEb7GeWU5cP4Y9UY5RD
         99Oo/kGiiP5//C/cihNQDYSVhF9rNMnOWC6VhPHAFG5AUb8jIRqNU92FOMCWE22lUtTj
         F+gg==
X-Gm-Message-State: AJIora+qo2lswEZfHSYjTICx2uYciISAx8whNu1tjRGRJ4Z/SvTb3S7m
        IbLQwkQoh34nfoGiefmzwqEiAjmvjEwFtpgeJrRYlQ==
X-Google-Smtp-Source: AGRyM1uldZ7mscnM9yjMgQRRAkgMfsy29eTNxFaZYpnUZZVT4BQtbiMleio3HxQvnWhm3kGB0DQPI6GM8LHvL8yVOrs=
X-Received: by 2002:a25:38e:0:b0:66f:5224:2c71 with SMTP id
 136-20020a25038e000000b0066f52242c71mr1844120ybd.295.1657541310547; Mon, 11
 Jul 2022 05:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220629115840.16241-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220629115840.16241-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 14:08:19 +0200
Message-ID: <CACRpkdZ9qAkjgWDf9nm=_csOTWQ90V_Gto4uGjRoshrnSNWNSw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Use device_match_of_node() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 1:58 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of open coding, use device_match_of_node() helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
