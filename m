Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159B173127
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfGXOJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 10:09:13 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:42576 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387463AbfGXOJM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jul 2019 10:09:12 -0400
Received: by mail-vs1-f67.google.com with SMTP id 190so31424424vsf.9
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jul 2019 07:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vu225xqfPN2/rLvfSwAsEyzbhQbRUYBKagHgr6BRdsY=;
        b=QyZ2HwJpThM1hA/UrkoCrMIzIG1qKdbxY22knQQ6jxvlptPvYfpn/ryUOMMQn8eIhA
         AC3LnHEkrVN5bI1nJ0thtUrgSKSGzTVwtdDypWV/ILV8M+LY27M+POFs7fT1Y1FAux6y
         n5e83tSvhWJURpzxfWwdhmaiSaLuirPtbrz66wDsPj/I6IsUhr4h/Y7oxSjQJ2ZSdOTa
         8E3tmXjCaipnHIW/zQf/E0FmjEYsP2Zc4TyCHaczJpoZtU4g4m0Llb3u+TSyJ2v43wBF
         95VsWEolqVKTuSeVcf0xALB10xPazd6MCw22nAWZ01zUiGzuaSu+1dC4iDVTv21g6aft
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vu225xqfPN2/rLvfSwAsEyzbhQbRUYBKagHgr6BRdsY=;
        b=rQBP14G3X6C7kxLws7Guylh9IeunlMi0uXyi34mtOjBfYkF8D421Z8E4sYnX+7gN5a
         w4CxeAXJyDL3GCF5EXrI7sROh3U5D76zA9P5jGH8W1CeX9j99nn4ESNSXsaFvERJfxiF
         WQIWmdibXHB84x39SNyL5Gw/rhqhsSecTH/6jxKNg2r1aV1+Vivb3secsbXlJ+vXBRGb
         Y4h+nZj6xBa0Km7dNxz7K57JHkfpXUv0HtBaIKlaIK6fvpT39NhdRHFv0jDR0x50iiPW
         WR1XHHqZjmAzxn1fNY35HXZDtZw40VsAjV20n/7dQYiRZTngEBsCXrl4cYJxAnW4qnXP
         cEuQ==
X-Gm-Message-State: APjAAAUtJU6kQFFeZGIuQ4P679PDmiISHzOr0Y8Yh8wwFAB0cNWITzsJ
        sqAXmbpfhQ1z1gC4JhV6ZuAgayuDaaky0KOCC6AvUA==
X-Google-Smtp-Source: APXvYqxssmW5IGjzFz7Uo+wZjJeNnk8rwQp/G0i5AYPNWrc/17j2TjRxyzFkW1UAR4ii57bMU5HGHANrJsgPGutsiDg=
X-Received: by 2002:a67:ee16:: with SMTP id f22mr51771554vsp.191.1563977350961;
 Wed, 24 Jul 2019 07:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net> <1563774880-8061-10-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1563774880-8061-10-git-send-email-wahrenst@gmx.net>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Jul 2019 16:08:34 +0200
Message-ID: <CAPDyKFqrbwJ9G0Za+U2FCBB=GKpMZdXesQAHZ+8v8T0fCusmiQ@mail.gmail.com>
Subject: Re: [PATCH 09/18] dt-bindings: sdhci-iproc: Add brcm,bcm2711-emmc2
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 22 Jul 2019 at 07:56, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Add a new compatible for the additional emmc2 controller
> on BCM2711 and clearify usage.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt b/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
> index fa90d25..09d87cc 100644
> --- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
> +++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
> @@ -6,10 +6,12 @@ by mmc.txt and the properties that represent the IPROC SDHCI controller.
>  Required properties:
>  - compatible : Should be one of the following
>                "brcm,bcm2835-sdhci"
> +              "brcm,bcm2711-emmc2"
>                "brcm,sdhci-iproc-cygnus"
>                "brcm,sdhci-iproc"
>
> -Use brcm2835-sdhci for Rasperry PI.
> +Use brcm2835-sdhci for the eMMC controller on the BCM2835 (Raspberry Pi) and
> +bcm2711-emmc2 for the additional eMMC2 controller on BCM2711.
>
>  Use sdhci-iproc-cygnus for Broadcom SDHCI Controllers
>  restricted to 32bit host accesses to SDHCI registers.
> --
> 2.7.4
>
