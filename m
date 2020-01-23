Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA434146BCC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgAWOvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:51:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41645 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAWOvs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:51:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so3737184ljc.8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpQpzwBJizxiZM4AGXXfpA6ecY69PSZfjTnWJHiGDa8=;
        b=zHHe+/KcMiM2OVqtuB66pI12fZZ+m42MLWk7c4e0dwk+4PVcDAQRQGkH2bom2snRGQ
         s+BsUvWWCWn/MTDjvUDExBq6c17YH5kx0F4CyCRcPZrbl/ZMpiu+YXXREZiuP9fjopAh
         6nzwPYR7jzYP/oLmPaeeXd80oppKKn5v+bFxr+JOdkrzoxP4QoNZX3OSQRYmjxTLSpIN
         yUkUlNtjQoav+EWcGkkpcxkEmCFm0rUVno0+e+/fbqaGdQVmakXRyM+6XPcgkluEwF6X
         h2FXrOfSJ2GEh5c6vvNjJv0+7qB0BJ5/fpXc/LPTa+mWWKNODEoyiZzCO5tRzLTQrV18
         FARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpQpzwBJizxiZM4AGXXfpA6ecY69PSZfjTnWJHiGDa8=;
        b=ijiRxII0OspSTciS5Sth/ZkHjh+oLXUvTJHAA9TXDuGziyRpe+XgxWA1Vmw6KMbMN3
         O1xvjYCN+knOP+0X6Pe9saBhbJ3iMG4YAMQXxw8KpamtmryihRc6+57NZhdccgygiaz6
         VBTiiNg2E8NLbSqwzSnHeirMukgVmQssAhZkBj+ta+Jm7Tbp95UJIMtIlL789LXGPJaT
         9P/aEMNi8QooRxIdlStFXgFZ723K1y5mEVH7JngrwBASqK3s8Zp3gDCp2gMvPp+ySDCG
         XwauTZPXczk6/j0/czUoftymtDIfzGFgtMOMkAmS9C9BFyitpAR1h5n33U76ZqLuDHzK
         Havg==
X-Gm-Message-State: APjAAAWDLLdGXlILVjzPhhUDxNS1krXCYs7eOIANDJNOZeFD6lSKT1G9
        nZbY7NmnUG6HLyYIf75NiCghlMEXAPxQVOWyT30MeA==
X-Google-Smtp-Source: APXvYqyoaYqckC3ntGOF9x1FJqnlzYv1mgmrXUtrx2aG4vyVoA1H0f/fn7kbACbF5D4nDS8JX1hzZHSRQ8oee+Zg/Dg=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr23150980ljg.199.1579791106444;
 Thu, 23 Jan 2020 06:51:46 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:51:35 +0100
Message-ID: <CACRpkdb5JEBqncC9gfPxM_TL4Prmiu5ZSn0kXt9mHBBp49p4Aw@mail.gmail.com>
Subject: Re: [PATCH V9 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MP by default
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

> Enable CONFIG_PINCTRL_IMX8MP by default to support i.MX8MP
> pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this one patch through the ARM SoC tree.
If don't know who collects the Freescale/iMX patches for
ARM SoC right now....

Yours,
Linus Walleij
