Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07E616808E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbgBUOoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:44:00 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33416 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgBUOoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:44:00 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so2475337lji.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxyoG6nAOs3iDcNS4Z1SWTTrzy8IIEIHsRCmOX+8xu8=;
        b=inQU1TfpUZ0CBu0amQil1sCPaEvQ1X8UG63hrSvoCXKC9OkJUw4NMr6UZu1quhG+L9
         m8YCxsLYKkVSCb89IEHwGlTUj0tH/crnSogq6yuDyx0qPbP6ihLIMc/zM/wz7Jd5bfZX
         xqdCioCkyRNOG+0cX3werPRMLlItgEq+fIuGgib/XzcQgBpWVVecshjDu2aNJLc1l4yi
         TTCnHBUb9eqLDB5NnruRQGWv0DiUiWCHYv1y6fdAC6syv9Ba0POKaArPytKmQVSZhyHN
         9/f92rq53NN4462mByG3m2loQLus9vC/HY17sDr+Eczq05z38i4HtQGxUAhrVtZtf5sz
         50tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxyoG6nAOs3iDcNS4Z1SWTTrzy8IIEIHsRCmOX+8xu8=;
        b=TQtxZDi/1KB6PhskwNTA+bODeW2L7g3lBlVuk5evd5hAjUlD+jy3iXnre455IKEI/l
         gTAzTSAjjZakXZWyAU0rXtW8pm2gNKeEbkeHp4h/0XbcCGAwy3qfi2dQ71airywau8/5
         FNg4gsoPZLnnmWvZMZR5TdONGmgUXmJmvB+c2pvw22cjzEM4834RgJ3IapYcOnj1alqE
         El4inV9HuIDNEvLnEd+ECWt8jFQzSFuPj7KJZBIPyDN7PyCBsOQdVyhwQu9NTND6qZW3
         Pd5xbE5Ab59tfjbzFU7NVMYoUnI75e7DhzT0ggoMvS+rLQLbYN3PpBknWDvf2Ea5SsJL
         Hupg==
X-Gm-Message-State: APjAAAU0sSKmujDccI0JkqUxzmbX4yH+cdMkR9hHVVrKpDVSFF+oDzL6
        Bsi3QLweXMJpyy3Ivj82D7YWab2kQt14Hyn7E4NR6w==
X-Google-Smtp-Source: APXvYqyb3t85xjKPwhD4gyHOTimxwHuO6OJKXBDhsaLSjnAYbEB8tiQngZaDfestVaUMXo0GwsmKGj6lvPD5AwNsoeE=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23189523ljc.39.1582296238375;
 Fri, 21 Feb 2020 06:43:58 -0800 (PST)
MIME-Version: 1.0
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com> <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1582012300-30260-2-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:43:47 +0100
Message-ID: <CACRpkdYuC4iiuKrRWnH6Rrr_AV+F54_AT9X9BdktPaaie5zy3w@mail.gmail.com>
Subject: Re: [PATCH V4 2/4] dt-bindings: pinctrl: Convert i.MX8MM to json-schema
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 8:57 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Convert the i.MX8MM pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
>         - use uint32-matrix instead of uint32-array for fsl,pins.

Patch applied with Rob's Review tag.

Yours,
Linus Walleij
