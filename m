Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D80B0BB9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbfILJl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:41:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41758 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730237AbfILJl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:41:56 -0400
Received: by mail-lf1-f67.google.com with SMTP id r2so765985lfn.8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RSUOvSNksdnUYSmi7ImPO3GUMvdFvOcyPQJVj+uUBA=;
        b=dIWOPJqfucag4BHcYnnZ8GmQSV6fzoImY8SV/+J5Q6xJ3aWO4AT2VTggjkxgR0kaoJ
         v8m6K2FcP12vy5m8vMZ9283lPrNaHC7wZZo2pkaHnmWlT3g3fnM2Bu+LYlAodlbGuBwi
         I2WLDFUsZVxBPG74qJg+RQcmKS3pfsG5+qwFk0i8wKxxImYTJp5UFlY60k9ESRM9VTA6
         d6cVhUfPH8R+dJUOzgwuQugXU2vKstME/JbmXgCWgdopIuRCH000mUWKBDUdw7dXdmmj
         C8x8iW0j4L5GKZt2PBNup3YxIoGZGeBiQVT57scO4bqnpybmLeCm52julMK78TA+I0g7
         cqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RSUOvSNksdnUYSmi7ImPO3GUMvdFvOcyPQJVj+uUBA=;
        b=eHnxUOGUDuMC1r1/mBjbcTwOcyQGLNjiNRarSTuZ/CmL/vJfWHSX2x9KKeHPtD+YKV
         B0jNxQnxeybH3J/kV1ys1RgyCCtIrO+PPXh97YDuYQbuUZ7EUNT8tjbLBN0DcQI6+JHw
         gHDLltMiDMLvDy7VVnPt1qP3LPggNslzCrv5wYEldrbj4BfJPyT1m79nT6drS/J0Q+VC
         6Ti0t+CyGhKC8ZaqxlmvaDT2M8z9MntzMpvnoF4PFhwiziGkv6p3dNN51mCgJo3e59Hg
         uAMl1YnJOZwolb9KDmnn1PIvTXrc4xMuCuNFSCFJ4vslR6OTPCMVQc/+M57rUx1c9GT/
         /Yyg==
X-Gm-Message-State: APjAAAXNHzSULd3lY2xqi4DRaiBbLV1f5qXyx9423h8amLH/tDbU5yTO
        glpyUGowS0FEfMhr98dBFLyLUNdbDZcDgXY+c85LBw==
X-Google-Smtp-Source: APXvYqz+NHIm3ClqeP49m5uOlZRwSCiWVPrJwTDKiLWdx7zhe9GVGvQS+zPe9EJmnmVbo3ibul2QuWqxgyHRCCkBksk=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr27253402lfa.141.1568281314260;
 Thu, 12 Sep 2019 02:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-5-dmitry.torokhov@gmail.com> <20190911092514.GM2680@smile.fi.intel.com>
 <20190911093914.GT13294@shell.armlinux.org.uk> <20190911094619.GN2680@smile.fi.intel.com>
 <20190911095149.GA108334@dtor-ws>
In-Reply-To: <20190911095149.GA108334@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:41:43 +0100
Message-ID: <CACRpkdbTErKxFBr__tj391FHwUTxC7ZF_m94tC8-VHzaynBsnw@mail.gmail.com>
Subject: Re: [PATCH 04/11] net: phylink: switch to using fwnode_gpiod_get_index()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 10:51 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> If we are willing to sacrifice the custom label for the GPIO that
> fwnode_gpiod_get_index() allows us to set, then there are several
> drivers that could actually use gpiod_get() API.

We have:
gpiod_set_consumer_name(gpiod, "name");
to deal with that so no sacrifice is needed.

Yours,
Linus Walleij
