Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8544E8791
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Mar 2022 14:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234218AbiC0MFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Mar 2022 08:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiC0MFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 08:05:16 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750E7B84C
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 05:03:37 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id x20so21446835ybi.5
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wHl9/T6i852qERrOCzTbVmjCSJRBRFv6zzTTgfN3gGk=;
        b=DBeKCqnidSXRmjiHTwVXUm4Pw0FrvuU5auJwDHCtbAnP1JZ6qiPpSjZDc1EnievgCm
         k5no1MQUvAD2Yp3D3H1Tr3wFvuBVtBvY0i0mU5RabNBoi3/pL8f/6Tb9BQLGy0EqxLim
         On/ghyDbBKDfoI1WVgqODIBn6khsYUoHAWzfmXzjVfIdVAfJdqWQ38L4b3KjNIsnQGf5
         cgvoKweA70BHCozuaKCRihZLkHnnvPPUZn2vskE4BruKJzGYVu0lZCSi+igjp0nfvdo0
         ZJyraa0orbFShGttjahETrCdSKgHieYBFQK9fGyQ0z7Gu5mGO845X2d0b8f0k35o7KuE
         ASiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wHl9/T6i852qERrOCzTbVmjCSJRBRFv6zzTTgfN3gGk=;
        b=g06k8F5/Gy6xY1VttF8+i9gHkijJ1ckoZr0gFNcacra5Yob6GGtxt81Agm4hUtGaWj
         DhzyH4F48bNzfxMH7TFx3bH4ww7HFU/A4vMJK1/XmNXhDGxwmOLGC7diOpik4RltEjyF
         N1FhxHKH6wdkYgNpcxLAWXffpfnoZA8nFMBL1rhJ4LeyLksTBcjQXOS5X3JHmygGtUou
         14ILN1PGJW0oFvlSHHs/xKTHZchSyoTEocTTbD6Iqps3sYvoxO8F2fOK633fmFkrPr4I
         SYLCsLkM+dZAE/uYdShr5E4iGlVFdkNrJpoqOZrZ/zuOTqqPYKp2bXGxOlqfJy7w/7Ld
         SPhA==
X-Gm-Message-State: AOAM533nh/ulfAeNPWgiHlieEybHAHvXELiEappV7/sHUc1hhuMLSSam
        QfJNETKVYRjF2CleuiU+YIoLxYYS+aERtr3bVf8wag==
X-Google-Smtp-Source: ABdhPJyTVK6hiK7PmUY/txocaMlBoVgao0GtcKKhq5CZDdZWRUTeou5UFQRdJHVA+h0E7EBO4BHN73OpU62W6NXo4pA=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr18404908ybi.492.1648382616352; Sun, 27
 Mar 2022 05:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220326165909.506926-1-benni@stuerz.xyz> <20220326165909.506926-9-benni@stuerz.xyz>
In-Reply-To: <20220326165909.506926-9-benni@stuerz.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Mar 2022 14:03:24 +0200
Message-ID: <CACRpkdYa6cKC34MzkXKsVSAFEkcGb=R5a0XS68eA3njoTh8Q8A@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpio-winbond: Use C99 initializers
To:     =?UTF-8?Q?Benjamin_St=C3=BCrz?= <benni@stuerz.xyz>
Cc:     andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
        gregory.clement@bootlin.com, linux@armlinux.org.uk,
        linux@simtec.co.uk, krzk@kernel.org, alim.akhtar@samsung.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robert.moore@intel.com,
        rafael.j.wysocki@intel.com, lenb@kernel.org, 3chas3@gmail.com,
        laforge@gnumonks.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com,
        rric@kernel.org, brgl@bgdev.pl,
        mike.marciniszyn@cornelisnetworks.com,
        dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca,
        pali@kernel.org, dmitry.torokhov@gmail.com, isdn@linux-pingi.de,
        benh@kernel.crashing.org, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        nico@fluxnic.net, loic.poulain@linaro.org, kvalo@kernel.org,
        pkshih@realtek.com, bhelgaas@google.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-input@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 26, 2022 at 6:00 PM Benjamin St=C3=BCrz <benni@stuerz.xyz> wrot=
e:

> This replaces comments with C99's designated
> initializers because the kernel supports them now.
>
> Signed-off-by: Benjamin St=C3=BCrz <benni@stuerz.xyz>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
