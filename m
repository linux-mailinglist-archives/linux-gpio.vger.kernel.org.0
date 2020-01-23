Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 546A0146BB5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAWOtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:49:10 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43429 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbgAWOtK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:49:10 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so2466135lfq.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPPW9IU+ruAV1uOimTrGBs92WdNG36xmqhTz53FGFdY=;
        b=mrGCJles1c7f58DkPrSG6gSnjtp08QKxaeou5MDQFp9ZwRSjQ2cb36mHC/aMna475B
         a5JV6HMjF9u/6McqYd2t4tJqDpogKUq4BEwcERUaDcCQISLlkwKBK80W/XNvST7IK/mV
         bsYZJLqBEQVGDCva4J5hT3OYJqSkEJsTeqvGrja/0WYmmQ4z2spTq3/SdOc0wJtA761p
         UB+pYRTSmONEJoMt1rCoPqindyXeSYUUIhG6l8yvhvVK5oD7h4fF7RUXiMyJn6AS7D3p
         DNxkQthVpAqnV3SfxeQiT3Zl5r6NoTSyoyLdic80YG0GOOTUUiOv6Cp+b5CBp0SoUqTA
         bK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPPW9IU+ruAV1uOimTrGBs92WdNG36xmqhTz53FGFdY=;
        b=rLcWm+zabk6QJKiMK0unXeBn3ioKpd2f1aslHtyCu6weTnfQCE84ig8SCWif6CASAY
         EzZGApXVfr2HLJ0tG2ZBzyRGFitypX3p6xyR2XUKW4W0suvK5d17oWOl0mxJElvxHVNl
         Zw433cGFo9LA+kueizZivyRTZgJFr4ns4AKUUDLLqmQvFvBjnXrYiRqK4RC8lL0rk+DL
         qsX3lD8pkOBaJhJtfPOAQsqOwdtK6Nr2u50jo112B9JeS430uGgfsBiv+yWfBYXgY4tJ
         GlP1XBZyMFYMo0c/LP+uoHKtuCDQo1epf1a94FNTLBFweItIUml7c0Wst22o0VBAF5fz
         ae4w==
X-Gm-Message-State: APjAAAVCKkFwRfMrWXGdjarj82igmqAOI8k7YOo1s6vPHOyK+j1Ie+42
        3YVfeNshNDQtWWPtCosm/p78ez68AgU6/lFCLOiLqQ==
X-Google-Smtp-Source: APXvYqwviesfBDZBeKob892qIy6qBAac09CjXqBfPvQ19xi38mTIEOFcWe9pDLJSINtpV6mS8x6bctvvmZYw+cMcqCs=
X-Received: by 2002:ac2:4909:: with SMTP id n9mr4796395lfi.21.1579790948052;
 Thu, 23 Jan 2020 06:49:08 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:48:57 +0100
Message-ID: <CACRpkdaX9amSA88=L7VSF9VDKxD_ed1gN4whJ3FriUwW1EB7jw@mail.gmail.com>
Subject: Re: [PATCH V9 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MP
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, maxime@cerno.tech,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
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

On Wed, Jan 15, 2020 at 2:43 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Add binding doc for i.MX8MP pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since V8:
>         - the lisence should be GPL-2.0

Patch applied.

Yours,
Linus Walleij
