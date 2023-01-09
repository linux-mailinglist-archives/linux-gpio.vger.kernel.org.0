Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDB166276B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbjAINmE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237205AbjAINlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:41:24 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A84213FB3
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 05:41:07 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4c186ff0506so112998557b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wb+6yb9R61KlmNa9GN1pcRJN6n/iQC03fh18uG53PKA=;
        b=swT77g+So+NgP7caEaJ6O9ceSvAdYk+grZZiOdQV8nih+XkgHPW7A1TWMvnMwHbSNC
         XqAtNGmfyio1WtOyZIRvGcgGb2eBRASgE9G+7Pw2dyezmZQmG4dfWaSr6fUhcs0/KT5v
         +JV7tPij9h4iR3nAu8cOH/6K3NPmKzzsiLM4Z7CcEOYIhm0wRBeKCHnRA44v2/GbdF4b
         7bSlU7Az9OQa5+N6lSzPP7L8iN7RhBvi08OPLMxBU6QZyQJ6/l7gUx2Snjw2EG9jAv4M
         sgFVwN2VeGNFDSGNLoNjdxOFJt07YngBnF4zOEI0++UbrxFkpN/QsO6MEzGwRuxoKLlB
         emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wb+6yb9R61KlmNa9GN1pcRJN6n/iQC03fh18uG53PKA=;
        b=Fm32MjbcfwXQY7jYATu/sCgbL+cWRMG7WFz+OxKDDI0Is/mfa11iCJg9ESXBrojQyw
         v2ihLARPI3U95gAoxvKdZJc6OfwYOxSZGlG8cf7XNmzEbFZufnY3B7hTY9Eh6ODHIxQC
         Nzjz1aa6OK0KRdmihkbJmH2uVngdijqcvduMNy+wdBaXMHZ7thJXkn720llcumowTWah
         /sWoUWfJuEXk/4MI9Rod/sWMsxBL2a+G+mNcN5UF3O1z5rSAhcKYQWM9oApLH0ASF8yL
         rdv494ckXO07MTo30v3JldhpjTRdBOksWmlpWoZPof0u3QGZLODxqXLVgv8q47vJ2hk2
         MIeQ==
X-Gm-Message-State: AFqh2krStcFkumHjqejbxLBwgBnynZohz1eRB5wl+ODp4WIgt9TpqCsH
        dVh9kjbzu+13K6NKk4+MpCpYz6QNPsz4G820K+pZFw==
X-Google-Smtp-Source: AMrXdXuJafcJBxWgNG3iDYwIGn5e2BoBODHe1CP6aoQRnVBj1JCScwi0X3vdopUmL/zUqBF2EfnzZsWU+EzxIPXPaS8=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr1495965ywa.477.1673271666804; Mon, 09
 Jan 2023 05:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20221231164250.74550-1-a39.skl@gmail.com>
In-Reply-To: <20221231164250.74550-1-a39.skl@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:40:55 +0100
Message-ID: <CACRpkdZoU8AXbQ7QDfuf6yUTZFPDE-L6ZLRB8jE-KP4YqbHpXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-msm8976: Correct function names
 for wcss pins
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 31, 2022 at 5:43 PM Adam Skladowski <a39.skl@gmail.com> wrote:

> Adjust names of function for wcss pins, also fix third gpio in bt group.
>
> Fixes: bcd11493f0ab ("pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Patch applied!

Yours,
Linus Walleij
