Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044E5633703
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 09:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbiKVI01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 03:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbiKVI0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 03:26:05 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467AB41988
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:26:04 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id z192so16517666yba.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHfIRD4f+Yn8Fl62Qot9TMpI8tFW13Z6l2x2lSSTitE=;
        b=SCUiOBvnpXCviXeMDgpgtdtFL4rVZLzq2rrYSkdo/zIbWcX4OqiuYwc3BszfstOc1D
         UPZypoGUJFCzOFHBCOIPlmMJzX5XmqY/3IILLtdCNyZT2JKU/8OiQGOm8TDSJl39WRkQ
         zKJQI9FkZ5gbnazfCex2hcGBTZYn1ed8NfmJ7booTR9gERJlLQ3XrldyMyBOalbZwBV0
         inLM+LHCellFWZNlugR4RqQfW+GWFqPUJik87TbWKt7TMKLar8vpWiG4AXTkxr6OH1+4
         hPvNeuqhDqPJ5X3XEzXUhIbucxbRSlBmzk0HU9lBqNRo7e6JEreg41YqtBOgBNgpTLw1
         Ss9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHfIRD4f+Yn8Fl62Qot9TMpI8tFW13Z6l2x2lSSTitE=;
        b=yA+AMxGb0CEdjr0jz0Cy0ByGJ6IwZZRbndS8V+ou4hGAOb88AsaOZvkGV7TerngzVN
         MlUXAdGMIIkdgwFK3PdUwWwcNZOabPGxNHIgpI7t52UVArGyy8N6or+nDfLCjmLjyccA
         AeBgnNTBnHdo/UIurIYzGby3FHv9aoXbh9Oa1DbUxgAU5EMpYt5LU72B37EquhYYdF/e
         4JoL01gmnbQJWlj8a7sZgW2i55R4zmbuFO1DQYOGeplIIlf5h4NyPGIX64YPkJ5+7KD+
         i90/DxI6g/BpdhGZO2Qt4GFD1B3UTDsCttSc1eKTnirMVc+wDxW1ZqWngqF1T4nBy03i
         dTQg==
X-Gm-Message-State: ANoB5pm//QJayWwDYJhuXkFrIxSCRjiz5+m7sRuAa3IP0aerBKQ8sL67
        GaD2ImSkp24RPvuNbRQ4UNC0wfUJ/58ZxqdOMFID8o28nUY=
X-Google-Smtp-Source: AA0mqf4FXwkM9PSYg7UPw+kZ61kmmJEJN0jDUIIx+1v57VzgCvZFd91aVCeSVEA1zEBq5fZL381GRxG5yDJGTTukcjw=
X-Received: by 2002:a25:734a:0:b0:6dc:324a:7561 with SMTP id
 o71-20020a25734a000000b006dc324a7561mr20760399ybc.52.1669105563407; Tue, 22
 Nov 2022 00:26:03 -0800 (PST)
MIME-Version: 1.0
References: <3b6b8597792a393d0f21b8489dd933663dfd2b90.1669045778.git.geert+renesas@glider.be>
In-Reply-To: <3b6b8597792a393d0f21b8489dd933663dfd2b90.1669045778.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 22 Nov 2022 09:25:52 +0100
Message-ID: <CACRpkdYZbNWAD7mZBCHE3XzkLdLZ2fPUODzvk1wTPiGny-Se0w@mail.gmail.com>
Subject: Re: [PATCH resend] pinctrl: starfive: Use existing variable gpio
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 21, 2022 at 4:51 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use the existing variable "gpio", instead of obtaining the hwirq number
> again.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
