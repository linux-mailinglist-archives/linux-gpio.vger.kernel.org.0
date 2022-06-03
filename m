Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DE353D37D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jun 2022 00:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349287AbiFCWMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 18:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbiFCWMr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 18:12:47 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C78E15835
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 15:12:43 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id a64so16026619ybg.11
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 15:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaQovh/jNhn+4ZSDMBLi4Hu4oK5TztBH/SX2adVzs9U=;
        b=cF2SWqmlBGbAHMCQ/Y2ZQaPZA2abJroAUw3EPMhL10ibnQ2RDBQWtnskYLsj4z+JBJ
         VlC5XoBi0rYXP8ZW54YRQpggq4D3DdEjq620ad4zbx/lwICxPtNQnk8G6BOGku+WnlKB
         eHd7UMaIe9LwErEgw04Cm+j3W5m+lgnLXLwZXWgzg61XAs+y9pCe7atSM/IpbIZJ5qpr
         KHFiMuYf+FFDowUm8qEFU19rCdaZaPsKZ1arUkBDLXviIF86MfYKnenIdT+CTgNjLzfE
         yLAn8m5ZTV/ktbA1HjAeNTjf3xNG8r9fKVhGauKSZ9sFNQyHlBRb6NP5uQyRGNsSWZYi
         IRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaQovh/jNhn+4ZSDMBLi4Hu4oK5TztBH/SX2adVzs9U=;
        b=4i0IZfrfR4PGICzt1jrV3r7Z28ykkLuC6p0pPQ6ZIVmcz+06MW1ddvceNO4UEvubGH
         pENA97vnQWOCEPkmJ/Jn2uyG1tyPq0zcT9HT+xRPMVTamNr/GoiK4QCahjhiZAyRu09Z
         SGJkSIsP86ysXl64juHUOsyNZoVER6E5WUqcH3O0k2nI/pHH3a/8VZ5DK0UnZlR5cAsk
         IHsgxYKYehI1Vh2DnEqFRGM0oylAFJ+rVBQZqO0r6FCmiCqzhDMEn6f3R5AelQX0BZI3
         Qd6rz61fFLlcVA4IJxPkqPZ1TwPRKcwm/E555nnSzDI99RCsf8Ti0kPxZBxHf7miWfSh
         CkcQ==
X-Gm-Message-State: AOAM5334AhN8FDg4NwD5YoQENqUMiqpSzNAUGODWcxlAYtk2yijdWlhv
        mb7/H4iqLdn18gN7RhGOMrsMR4+9ffuG+unldyit6zJGbLM=
X-Google-Smtp-Source: ABdhPJwpl5rTuc6qpCodp5pwXaQ9tSIMRwfl1NuEQusCWy0vGIqfVIqI9C4ElvVL3ia2VsoXBQxQJMWhqiINtYIlDiA=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr12863167ybs.626.1654294362647; Fri, 03
 Jun 2022 15:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jun 2022 00:12:31 +0200
Message-ID: <CACRpkdaQQxSO+dSbsFdgmzprJTexepmtBqbuX-X-XP2zVzepsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Enhancements to AMD pinctrl and implementation of
 AMD pinmux
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com
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

On Wed, Jun 1, 2022 at 5:29 PM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Changes include enhancements to pinctrl-amd and implementing
> AMD pinmux functionalities.
>
> v6:
>         - avoid nested conditionals.

Patches applied for the next kernel cycle (v5.20).

Special thanks to Andy for reviewing and guiding!

Yours,
Linus Walleij
