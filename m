Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C999215D60B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgBNKu2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:50:28 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44586 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgBNKu1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:50:27 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so10159679ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIA3W+3A4bSWg6/IXoCcQhYlPTEIwMnLSptSvMwiM4Y=;
        b=spKYlIRdf+1AzjlULsr1Z7JsO/k4DXYBqXtiI9UhHW5I+O5U2cbOqdiXr86g2K0FBA
         IFImVz8Pdr3K7+sZCx4rsqvUG4DsXUPf/lUySjxQCnPmaQYNnBvtZWRRGpNYNlE0XXPq
         RDVjPpqykFUvf6ifUff5qiqD0z1i4NkWGEZJAMvwgKuRowW7Qdr5GqxmagGhGrOhWQvP
         2De4n4B6OFX2i66uchc5Qph/AhFcOMu1bldmnQrlFuTtyWcmgZ0yGUhikyAmCvhLTMQd
         VlXhFojj0gwuFnBagb+1E11Bme0qW5eFBBWU4u5gEY/dbY0egq/PD/vqwsORgogtR4rf
         nwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIA3W+3A4bSWg6/IXoCcQhYlPTEIwMnLSptSvMwiM4Y=;
        b=VDPr6zc4EYGpLX0JhQ4mnmblNXWEnBxc8gdJestGqI6MF+NbOOz69HrH2nnqxW+uZ1
         /KZZrII6QRt8iwM/+5h/yrx8cL9dlcIJjaY+mFWEcL1UMbOY7GyjKbdSu1RQ/IyIfFKF
         Q1aKHdVM12lhE1o8iistNWEqLdDo/tb5vKB9XGOIawAkw0dS4RNv9vz6Chr+1TKqnVfG
         9Q3e5yMPQLPGsPdlYzOi4ikbJU9b2vbyB4Jv1uVSjzhLg3BMG+TdBhkYdiIw6SJLpqXO
         cQJFK7PZmgNvP14mBohSXzOPwdz5yXE80QELtVnjlH4xYPB9Xgb8X6ockdPtfuGRWZYI
         9tUQ==
X-Gm-Message-State: APjAAAUeWD1CAxxK3kC1hgicj93XDQYGe1vNF0CEmXKAq6fhzOthR7yk
        G7UrGrbcYVi+1nWGPBrLp8wwVW+xdzygGBKi9WjUrw==
X-Google-Smtp-Source: APXvYqyUZX06D7qDW1NxJWCMFUDXVgahKBLV8X2RzIk+Kuc0X/81i7YmxoaF+EMxTrfncBCFTDLL6rSLbe74lmM8mf0=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr1604098ljo.99.1581677425697;
 Fri, 14 Feb 2020 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com> <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:50:14 +0100
Message-ID: <CACRpkdb1NBEj5iebtim6_z7866B_bQAZS4J4fsOupusehHUO0Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: bcm2835: Add support for all GPIOs on BCM2711
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 8, 2020 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> The BCM2711 supports 58 GPIOs. So extend pinctrl and GPIOs accordingly.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with Nicolas' review tag!

Yours,
Linus Walleij
