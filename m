Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554A848FA12
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbiAPA64 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbiAPA64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:58:56 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC705C06161C
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:58:55 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id i9so18103674oih.4
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Zbir2HQFQZdW9Tmc/FhUTrgl/itixs+HF0NKBgjfVc=;
        b=Yh0vPDd1G6keQC/FJtF4agKsRM/U93onYrsMyZG2hqH4zxiYv8BwcyI2njKr6aFPMB
         iCqLfls8da11QehL5xhjaZRimYnfreZ/848FN6buJv6vnAUW8BBHYWW0tHRCTb+DqBpp
         AQad/LL9E2wlF6MLj9SmH9rh2W96loC1zXRyVTSoJ/a1Rer3usmihSpx+/G1DHnMUsCW
         bdjgrGTE8033EaBQecjg1vG0sBJVERrEnV69ZipfazKz5cdIioboi42YAy4aKi9wTLjY
         SH4HggOONaq8/vGf6WlM3wIqq/5XJLlWaRyz1SYJwEmlBJ/rJp/cZ8jV4Nm9AE5szaek
         uWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Zbir2HQFQZdW9Tmc/FhUTrgl/itixs+HF0NKBgjfVc=;
        b=BDfbQs0Gozn4snMc4eQQYvUJvRCBpSQSTnc8tvjoZUcPInikpHXuJinvEdwQfWG5dr
         LMB5GR7YdLmdINghkDXtIRpBiwnT8dItNOvuBTyURWdc3AmNb7ezoAKai0kMikH4TK0w
         DxzBBicD3eMmlh/4/sZ4B8VwkoGNCDpmilLvKxLpqvdOVBP98j3EszzBcZXIxzWBswGS
         KYSAnw96C/cq0HTNrXX5/IVWToJhbyj1Yw0gNaZaN67TXZQDcB1sn7oeUDIJTOxWjwMM
         GAzxGk2358V9V8AK01y1aiuhAQVzMAvpYIhBOoiYJJCEEz7chG0SZ6MyTbgLQ9fstd3A
         U0LA==
X-Gm-Message-State: AOAM530tBuUOZX1By/ESBemr3jDlC42VcFrMLDFJWxeoANGAGcb6DNNh
        GsgT167sog/CXVUKyyhAitgEgH8vIb70LKGtFqRzOw==
X-Google-Smtp-Source: ABdhPJxWMRX3TsxnLYFJRGSaSneOnzs9jAel1b3dZQqFej3Jh5BIbaG7pKz3veRZwsjhuRLRjjczmU3tGMJEt2q+IJ4=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr8350127oiw.132.1642294735018;
 Sat, 15 Jan 2022 16:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
In-Reply-To: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:58:43 +0100
Message-ID: <CACRpkdZ=dNw19Qx4C5w59hxTuOx7O7x9Dw+5wxSTc99WxPRO8g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: drive-strength doesn't default to 2
 if unspecified
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 11:05 PM Douglas Anderson <dianders@chromium.org> wrote:

> If the drive-strength isn't specified in the device tree then it
> doesn't actually default to 2. Instead, it defaults to whatever the
> heck the BIOS left it at. If the BIOS doesn't touch it then that means
> it's whatever the heck the initial state of the pin was when the SoC
> booted.
>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied.

Yours,
Linus Walleij
