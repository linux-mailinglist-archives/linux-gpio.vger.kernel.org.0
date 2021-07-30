Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091B53DB6EF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238460AbhG3KK7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238368AbhG3KK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:10:58 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3198AC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:10:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x7so11589698ljn.10
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FUsmbK4Mokpjb2YVI5MyVduBEFE35v1Jh1/hc3sIm8=;
        b=NvGv3vFxD74E5v1BUh2TvrM43o+wuyZ8tPBkhQc6TmdyrnbxhjnLR69r3T8y0Jx0Bc
         sqTdjpruHL6kf/+xGI+gFujU7M8oFLBm01H+vUtqC5IgGlpw41W9HsE+Nl8hKTsn60i8
         nkWpqc1gwpzATuK2eemSQfpSWpId4IBax3Emu6Y5flSnqQCiOCKz0zBj7auYJFYgmtEA
         fJGw2gJ0/dq5T+D7dKfZir5omSQzaDf/eEQufih+xEDinIoxh/jgDQ6+H9b5ldYo7cWl
         zXiR+XnrLoAcAuRpaRpDhV5eBV8MgFdeI50ol+siCFV0mrjfS0KFx400c/aXzKGqttNr
         CuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FUsmbK4Mokpjb2YVI5MyVduBEFE35v1Jh1/hc3sIm8=;
        b=mb9AMZhrILyyTcF30SUdR8AWSwg+wsOw3/Vk7KsO5F9cIjQnGsahE5+7U+KVA+AY3o
         45Y+aXsFwuHHAbV0NUlGBlY7VFD+VOxvySl2HK+RKKJ/DNnSloNZqny1ODag59NF1OkL
         U1q94dVpV4Gb3hPgj1vdyPt7GqXBh63EVLnpWOz5ZyElGZlCiFJNfIoY4ANToqo2ZG4p
         uSlYLYF2JXFNekM3fvEsjoJq7t0N0bS5zWSkdkoB58yDjPIMMAGFzDfi20wHEX+Xn3iL
         9VatUGVN64/GZOiTCZHyso1w2dk6pD/YfXCsfjuK/VRMq/nVoZkh3T+ChPfUs2MVPiWf
         9FNg==
X-Gm-Message-State: AOAM530OOOL6k3HqY6vDSBDz9hco6PE2qzmvobjmWAfnHFkV7iuEFhs3
        GhrUtmUKnP81yXBsKfOwIMd/Q36vVnNhJ1ujYFRKdA==
X-Google-Smtp-Source: ABdhPJwCuRNgH8pgkkgXmb4ALX7bBFTQkUdkXA9zo7exXA8FPhJKGm81/DoMJqIlJX0HJFkdbgOuRvJKuL0lYmDtt58=
X-Received: by 2002:a2e:bc14:: with SMTP id b20mr1181392ljf.200.1627639852570;
 Fri, 30 Jul 2021 03:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <20210717045627.1739959-5-daniel@0x0f.com>
In-Reply-To: <20210717045627.1739959-5-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:10:41 +0200
Message-ID: <CACRpkdYu1U=OZ6OXuwfA8ihGa1rC1_Zgy29ZOGAH_nUakna_+Q@mail.gmail.com>
Subject: Re: [PATCH 04/10] gpio: msc313: Add support for SSD201 and SSD202D
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 17, 2021 at 6:56 AM Daniel Palmer <daniel@0x0f.com> wrote:

> This adds GPIO support for the SSD201 and SSD202D chips.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
