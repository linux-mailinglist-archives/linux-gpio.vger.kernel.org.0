Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3075E3974D0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 16:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhFAOCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 10:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbhFAOCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 10:02:55 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECD4C061574;
        Tue,  1 Jun 2021 07:01:12 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 131so19389584ljj.3;
        Tue, 01 Jun 2021 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iOWM3V+uFJcVvkcrVNd12VNETYJSBXbOMjTaEPJQXsU=;
        b=L6pzoECCWjZbc2g6BkWOQTJ5LHoOa+5UsBOpyebzPwVVshK98wS7z25hhRC9bpiu1d
         T9o15yF8P0Pq0SELcpUc2ehvmDuPkiJKauIWo72edrcPUTs7DiYaiqRaWFOKE1Vx+91C
         tv7955QV/dIGcQrEcQ39DKdnSN02Z4mqSB/rRptaox/CY1ue79yfdcZGs88zcZoT9duN
         nVVckJ0+m7ew9IZqNSOulccXb5eQiu5kf3s24XBgxWnWnlvQs+BSAadZOdqAfuST+KFw
         AXSyrDJBFuyR+MqFFj2sgVKYVDKlK2f4oi7f+27lVjPlUs8xDwdOXkQ2rhFh2OnBvx0T
         P1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iOWM3V+uFJcVvkcrVNd12VNETYJSBXbOMjTaEPJQXsU=;
        b=VTtSSmzYyK+ABQje5HLzrOE1EBYzVyfjavcHd1DAa9tlqPV6HCLyx5gKwLs47dU6DC
         h+HhqR+yR28ETqz1xhDIEyKagHQS812i+BXKULCEhrkYd/eBZf7a5BNj2sMsjVdJdOz2
         ekNTOFD+hk0CLmwiDgpB2oJagXE8bZ7v7nuTbFktxHJF0x/2oVeqD/JsPWjEvhat9QEP
         sf2s0vh//om1LnYPECQI2zkwI9DxqXkfpUX9zY8MVYNmHcjVh9KV/TeQ11H61wUHAp/W
         7i5iPwPBPvmy46EFJVpnCdg8rRtzIqspLz7Ud67H0AEX2ZUcw7xzMFeVGYPne/uat6mm
         gWNA==
X-Gm-Message-State: AOAM533sjTiHNAn/jG5uruhz14SDgIwygT7ebWuxyIwl1moVyX05/eUd
        2CgMNmkTVfMZHA172TZy1KRqjQ5BoNuUKYe/5II=
X-Google-Smtp-Source: ABdhPJzIejYoqJIc0dnhPVv+GB9LfN7oz9GRG12/ul1QWBSVpKiSvWL7ou+cNxmNGL5CQpGkmvza8q3mnYf/Dw25TSg=
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr21260862ljc.116.1622556070927;
 Tue, 01 Jun 2021 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210601062338.1969040-1-ping.bai@nxp.com>
In-Reply-To: <20210601062338.1969040-1-ping.bai@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 1 Jun 2021 11:00:59 -0300
Message-ID: <CAOMZO5CqznayWX6i+241=wvKzTJQvjzeTQD_NS=5OM_+iUvmwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jacky,

On Tue, Jun 1, 2021 at 3:13 AM Jacky Bai <ping.bai@nxp.com> wrote:

> +        pinctrl_lpuart5: lpuart5grp {
> +            fsl,pins =
> +                <0x0138 0x08F0 0x4 0x3 0x3>,
> +                <0x013C 0x08EC 0x4 0x3 0x3>;

This is hard to read. Can't we use the pinctrl defines here instead?
