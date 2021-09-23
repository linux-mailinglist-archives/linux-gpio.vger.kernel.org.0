Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDCD4167B0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243383AbhIWVuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243349AbhIWVuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:50:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E0CC061757
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:48:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g41so31691323lfv.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7FkpkRmKHqmPvFFREorMPwFdCCRcl6RFgYu4s9yiDfM=;
        b=V3EyYY2zZCCc3qurGlNx4ZlXLarvbqI9nr5hfYuyzB4wEmeUbF40YeZ3zAtxzDXEcK
         +t5/DnvFsnyMuYCa0KlgKwbFNuhL50Gpr8mdzijTcgutDXFE8abM1gVoeNcMkWT6A7M+
         zR3JSdoEhJTF6qk/WRbDbkWp2sivoJ0Vg/y2RUPkzfSl45P12ZAAvJ+sqOxFGNsL0AYo
         Krfq3aM1bvkTXIgCS4kQp0fC1yJ80UuOvRa2DRcDQcI/4cin9bTM3aaX/4jS+vY/3xcd
         FASXGIMHKWi8CBviYumU8po1T4UYtss2mOxNyBo69a20/Ue2KN/RAyTlIpJqolLOWZfK
         Q6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7FkpkRmKHqmPvFFREorMPwFdCCRcl6RFgYu4s9yiDfM=;
        b=xfiLkaO6DX+pInBIGSKqDSdm9ymiKiJHASKePYR6Cx0TOQAkeNfniggLTcXyjQwUdm
         Dco13Dim17xhdJD1FA5GOrjRNphnxl2698FEgcMwRN3A4FfTmIqo+W05S2ZJecNpbfFb
         Nxs+d2nh90akONqWSqUxqm+S7uME4PaRwVUSnfVQ17d9WMAqdaBoTBoFFJZQntsuJLCC
         ATUOWnR/N+iJRE6oSorkpUl5aMTxPO76jzGE/w9O/+nlvTgSGSXWKjVJCwLyioNz+kyX
         5vlF/xL0thABnNo8MdqdRBtNHTdszABNaAJFE4Dhm9TmlzwucPeGQNlfrMKlzm6BzyQ8
         Eaiw==
X-Gm-Message-State: AOAM532UCgZAXkftqUy6Aou2pZldHLYraDNe9vMAcLwHJ08l1UwhZVwx
        wNDVQjybKjGB5xOZVfsEpueqmEoCtjq422jvLOCNTw==
X-Google-Smtp-Source: ABdhPJzRJ6lk2udBuzr9FrKwJZvK0C0NBFG8pHIWz3jIt1r/+I+/7dijGUv6MSez/cEvzFz71CddyZXKEEOMFuxPPL0=
X-Received: by 2002:a05:651c:4d2:: with SMTP id e18mr7656983lji.432.1632433723807;
 Thu, 23 Sep 2021 14:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:48:33 +0200
Message-ID: <CACRpkdYxNKXuL7w0BhAig3Hr8oHP2+Eqn94ABdaX4mxfxLy+=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 6:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
