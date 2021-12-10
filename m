Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48AD46F8C2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbhLJBux (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235446AbhLJBuw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 20:50:52 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D03C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 17:47:18 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso8164679otj.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 17:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SB4uGKWGEZlPId4QacTW46ykEN+JrbNE3sc8enIlhxg=;
        b=Tx8UqhdZwbSoZNvIHDfHO6iTw8T2hF9nDLgRFB2FT/3XrWJbwRK3TvErDUIXkqMnMp
         0M5hyy/3ix6UwWdpsoEHgxBXy6ROwOEgmgUzm7CBJjwKiHWyaBy1FkI9Ihk4/sDqVzPB
         x56NW3wkBnI+bS+ZaaPIk+8Lpe9rsaPzW5We87/7weSvN4JLKuybiqGsBBySACmO4fZu
         BJzzwpMVCMErv/1xFh5SeA8Tsn9SwbNuuUp/Mfy1ROYoLRKln9GbBILjL++ttKpYfTxf
         qAORx6HcCgzre/k2Kd5yhdsMXmzyCmBY5nhJUCzt1HbFb2EE33UVJ2LrrIfRYJo96gN6
         D+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SB4uGKWGEZlPId4QacTW46ykEN+JrbNE3sc8enIlhxg=;
        b=m9ZIdYjVD+1Pjb9g3xsVuxM1uJpdEMXBvSersV4iTQ1tZFJ5gZ+J5glNa5FWu+Y1Xs
         OIERg1hDBoK04xQQ1vVV3ZSQSc6DDHCXD8j/J4VHPGHOIe8IUk7dtcVbAqipRdzGZaHU
         1agPeSVNMYnseRyCncHODCLUeQwhMcLGPjPjjc98x8CfbXR6cf4gEmqRtCfBoQr+d+nt
         1L60rWofwQnQZixCoCpb9SZOVdxBduX6E7xJKWp0D2rEiFGuOifeHuFT/+rU+xn3mkuZ
         rU6lvo813qqDFWqyvjQ8OgJ6bTPerSTLPfPe413wqaCvtT7pRK1CUek2eDKmJTK1blo9
         sNtg==
X-Gm-Message-State: AOAM530FL2hs3YTMaD4o8aA3n1dmxCy2KWm+DnLH+Z3zXDh76Ct9XEGE
        F0SkWYaBENr+us9onVtvjuVzh8roN6pCWCwZJUrYhA==
X-Google-Smtp-Source: ABdhPJxv8IPgVTfY/Q+BKd6CxueTQ+0Us7H8rC65W8oBGtJ/enzhxxKOJo5nVWiuPmyY+HCgpF15ztyzXeiupqfFYjs=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8952047otj.35.1639100837724;
 Thu, 09 Dec 2021 17:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:47:06 +0100
Message-ID: <CACRpkda6sLwmPWTmGBX=5x-2LFK9H0NUiSGXj_bqP0OWqGTL0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 6:30 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the NVIDIA Tegra GPIO controller device tree bindings from
> free-form text format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
