Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796E5285BB2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgJGJOU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbgJGJOU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:14:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76532C0613D5
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:14:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id p15so1215988ljj.8
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R38D306cOdCH6gNOKn2dfXzMIdx9cVWTJ2EnhMSHPgI=;
        b=K8VM3Lt7he4DbXomcBl3P1LJNqMltD6OgLwpi66vIZr+U4091oDg8WzFZwthUfNZxM
         7C3DSeIGUrUU442GfpAuHECgrAXYpLu2i7jiJ+tc6NndlzfBRXWLyNPCYaNORPl5LkFO
         j3yVM1TBGLTi9OzIO8xmg8KIb9XE9xmNm50yhZZUafUFC94LNH6xELqQcJEXdcb/FW4z
         44xqj1ig+cU6YFysClUu3zjTOkqGuvBvWXZiSdDxbhsSmOFnipKSHBKJ+wUCBXNHBrs5
         uGh4kXbK7c8M4OfTPTFIVLc9+ICXIqD7n5c2eMHJ2raESyevz/KFuf+fgzJR7Sc1K+iE
         CkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R38D306cOdCH6gNOKn2dfXzMIdx9cVWTJ2EnhMSHPgI=;
        b=PO2LQn2gHW/jF89cLinovAcxBtjQEqYm1exZD9fvq3+xWijXTlaoqbGQFEA18fG2jf
         6MZNCdcGMRE7wcLOZbLChNbxm3z24WOMlEpkrTKGEfFwnXFomNJ70x8dxaxIyq3jjPzQ
         i4cB+pvNx3zRRXVZugGsto0vTVQ3D+GkDK8/3HnM6bMTsEQLcUHobcDfstl061nlewQc
         22hO1aQWsnH/Do5InVUDJM1j5biLzwAW+AOwsxQfdHUT/lOswwlTqi3oMJl0wUfccqkg
         aZNwYqPzLKhqItY44Vlj2VlkRny3sHX1VIFoquNr6Z1hPcS75sNxCcnu0IhJgu8hnadX
         peJA==
X-Gm-Message-State: AOAM531AhFIQVhyfElj3o7wpcb9eEQ5HKgfdzS9GllYZ0jhsX1WRV8TW
        A2UZjH2LrA7QkbMyAXbMekaztHTuq8wqS88GhvWbRg==
X-Google-Smtp-Source: ABdhPJxbc/bmd6ODDC9I5vRdhThK0GMJxuWPkDmiYh8tJC4/GZdchNUlcn3p1SbgotwVnTnpAIL7su86RHImnlHNlZE=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr941823ljg.100.1602062057729;
 Wed, 07 Oct 2020 02:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com> <20201004162908.3216898-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201004162908.3216898-2-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:14:06 +0200
Message-ID: <CACRpkdbscEpV6oP7q1AcbCcR-XUBG2PnnapQ695xug63VQ830w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] PCI: Add the IDs for Etron EJ168 and EJ188
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 4, 2020 at 8:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Add the vendor ID for Etron Technology, Inc. as well as the device IDs
> for the two USB xHCI controllers EJ168 and EJ188.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(...)

>  #define PCI_VENDOR_ID_REDHAT           0x1b36
>
> +#define PCI_VENDOR_ID_ETRON            0x1b6f
> +#define PCI_DEVICE_ID_ETRON_EJ168      0x7023
> +#define PCI_DEVICE_ID_ETRON_EJ188      0x7052

If you're defining that here, I think it should also be
removed in
drivers/usb/host/xhci-pci.c
by including this file instead?

Yours,
Linus Walleij
