Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB13B56CBE0
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 01:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiGIXFh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 19:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiGIXFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 19:05:36 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B038101EC
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 16:05:35 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 136so3275327ybl.5
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jul 2022 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szElR8mFW0oJw4wL/YkFxH4pnVX5wiTe/kH9rlsKmNA=;
        b=YWqAHiKxPYP2rDEIH0ZBpN/McfFwUqo4/gEkUzFDychfTL0K9nCn4arnapm794J+rA
         4QoMh8LjbMG9C4Ih2pPj3dAKx4VJbSh/c7mEdoi1lg0KIVzW62oTVnUr0xvM6BgRdfSn
         pxlW1NNS0T6+Ws9LAKhQoPdIvL3fsfEW4+o/nN0fMR+limWjIKruYwOENI+eCpCZ1yzE
         4xAWBB52DwBtXvikaeDje6+T4riPIUs04dvMiD+Xnaks1S2vRMGdWR10t4LLMQcHiULL
         fMC7Ag7zVSIoDMjoxpJskKN6R8aJaCnVxZTKlShwthMryadNiYhFkX58Y4c25pJycRht
         KQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szElR8mFW0oJw4wL/YkFxH4pnVX5wiTe/kH9rlsKmNA=;
        b=Qveel3VoyEO4RmeNppI6whRelyAsnNmmQN6Dji0M8NQRNkTbGBYv3mQ/Gi/EiXie/X
         wPNgPMYemvJ0GbrHq3DX8HhPvu/k06B0I09xLtHnSFf+TIF5SJRGl8PtcWU7ovy6bc9i
         PRw685XxPPDKTdE1B824+bvWaupxKcJVkbrG9bh/cNODclgRtaQsl6EMqk3yIeQPxFIS
         dpZs2BPuKWn+bSEWhUXwcsM+YCPV2DA9QrLl3DuhMPisEn3tLVdmU7sOSlJdhNGiXCSc
         ezMosKDt00raPgx3w0xsUmM29pIWKCpcpNADU+yn04ASgzeKtkp5NKlQUehOa3M+Kx9t
         x/0A==
X-Gm-Message-State: AJIora842idvojQXA++/CzORcJyzgHZfyC9JZx9N9HrMjJJEuaMWuBR9
        0EF3hVrCasmEbMa3CgD7HfpYbZy7aed2HY4iw1uumKotQxc=
X-Google-Smtp-Source: AGRyM1uyWCBaeTqPo7gQXz29HDuranIxQRGFZ0H6DJli1dXJPgovoIAzDeDGDNsj0sScwXhLjKzet2/h705wLYkr8hw=
X-Received: by 2002:a25:fe04:0:b0:66e:1f8a:8e89 with SMTP id
 k4-20020a25fe04000000b0066e1f8a8e89mr11232850ybe.514.1657407934008; Sat, 09
 Jul 2022 16:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220624195112.894916-1-robimarko@gmail.com>
In-Reply-To: <20220624195112.894916-1-robimarko@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:05:22 +0200
Message-ID: <CACRpkdZdccrfA4yHoVjzpsJesYshuP6PjtT=KTeEQgOdXR6_5w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: make the irqchip immutable
To:     Robert Marko <robimarko@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, Jun 24, 2022 at 9:51 PM Robert Marko <robimarko@gmail.com> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.
>
> Following this change the following warning is now observed for the SPMI
> PMIC pinctrl driver:
> gpio gpiochip1: (200f000.spmi:pmic@0:gpio@c000): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the SPMI PMIC pinctrl driver immutable.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Patch applied!

Yours,
Linus Walleij
