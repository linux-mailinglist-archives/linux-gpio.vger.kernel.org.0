Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045E51ABD10
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 11:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503830AbgDPJl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 05:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503645AbgDPJlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 05:41:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35596C061A41
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:41:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v9so7029807ljk.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8dAk70I1p4hnhRGOefpbJT7ms2GQjkjqrJGg81hx6OQ=;
        b=ObziAsNZFmML/a7d7NyFT7NUp0TNcEQoe/JcKNJRXlvCU3WayEVxd+oN3RnNbY2YK9
         fdwRkA2KoGhzenGHSQwzhrnXNIAvYHWxmiS/2E0x/Ti3lsohU1KAS/vGFGhbV/JKJGru
         IZakD4MQ73Hb+ddeolKSS/3O/BATf1tH82knHsUXb4ZnWDnSnn/Uo1r2Z8bgJaBg/oSQ
         jvDe9T3HDh61oUWZvHkDZrlF7Fpj4VNr3ji1FKygGOrcPWMqXpluT5PKq6TaE2BdX5WZ
         A2bUMW2Ip9GH5STT7BwaS4KvoAbcvYu2Eq5P+JT8ilaLA2T+PcZqATJAP1T/UlQMOTMC
         sRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8dAk70I1p4hnhRGOefpbJT7ms2GQjkjqrJGg81hx6OQ=;
        b=BRM0i/vwECWGcQYsr4Ag947KsOxFgZPd7h1T2Ae2EYzwY9K87ly28RJ0P+psKXRr0c
         cwsY7wkpQYhAvpW0U296GJrnwVJfQLHS1M5h6CG+tZ2aQ6nM8ju+RbtosHlHuHR6Dz5m
         PWFGBdR3ZEP/2/C6llPO2Vep5P1mJipnO8DFSfatFOZDXwqdVRJ1pDFJvvOM/0OaMhPR
         NONME3weuCd3jHaV3tGxEfY9leQYSyC0TFGntToU+xzMLvHLpXe/GOly1maK3EngdkEU
         8sTsc5U8BDd1pChI5dJ84FCXZIiFN4KAWH9+ptyxdNSvlPu6KXmTmuWd2pQTC2wQ8s1B
         nCNQ==
X-Gm-Message-State: AGi0PuabJzEFR5Ks6DmAuBU4q19VXZamTFLyCZ9MF9Jff49PB8/4jBvb
        mmEXxmNzf/qVbw08Ce0NeEvn3PuOZPq/iGlQCU1uGg==
X-Google-Smtp-Source: APiQypK8qx4sDjdMlKaIAgsSnv1jrL4D1nl6jj30y6f4zJEOB93Qgx1Jwe4YMT5gUNKLU95XB+kIvZo1wtO6/Q3eFao=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr2401076ljh.223.1587030064671;
 Thu, 16 Apr 2020 02:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 11:40:53 +0200
Message-ID: <CACRpkda7U5M0OU+dQ9CKNqqmZ0XU=LsWqZAOy6faDqknaDCaQw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl-scu: Add imx8dxl pinctrl support
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Olof Johansson <olof@lixom.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 12:03 PM Anson Huang <Anson.Huang@nxp.com> wrote:

> Update binding doc to support i.MX8DXL pinctrl.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied.

Yours,
Linus Walleij
