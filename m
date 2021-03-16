Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12DA33D198
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 11:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbhCPKOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 06:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbhCPKOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 06:14:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CD0C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 03:14:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r3so53353390lfc.13
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YJKD72vt5FV7DwVK+YUDOq6k8g/9YfYFf+v/N3upG7k=;
        b=tR0nY/naZGr34RAqDmw6UWXsMezp6Zrd1WRBSSenBeRrRU/YsdqnARW0V7OLLikPi6
         f2M6jHv7hmJHpbFtuQi4yiDzYO/kb29ZTa3U9OmjZvL+2eqQR4UY2Defs3Mp8KDfzDiJ
         zD0AqbUfs9zPxolgDv3WnHD8vQkW1h0+NUvodocNpIiaeF5FN0J1cdF3aQRukkhqCrYK
         KYJOg6vZuQWP9APiFev1VmSaXjpSgtJ7EisjVmq3XfSUXyXSKVcw9ymFVoLLMEZkqOjv
         cY6dVMNU+FG8Ji1WPyg4gWWDhhxcsacYKw+Dem5jt+Y5L9MeAqiIpLVDKqug+qnMIoC4
         HA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YJKD72vt5FV7DwVK+YUDOq6k8g/9YfYFf+v/N3upG7k=;
        b=EPZKprmj7BZTL0CuwxDjbWXGqw3+JLIRBPclqMn+dViyPGJbDZAYs3qthIL+KxM29m
         1QD0QXblbivQGyYRSsExpi+1EA+lXJuujSgq9y2Z0pgqrN4KCh+ahySHRZyjrxw6jb1u
         1T0uJxrMcd99laZ32pbSV5ZJwkhxsWdNR0qdKCeCjhR5xYOFGVuxNWQa27d72rb+ltSd
         tJqpRiIFOP7t+KqrvmU4M66js8o0WzD1jNAgjU30ouCJYgcHCFIZfYjWwFeMqR2QB+CX
         HjxZ9DxlSCupxwmpPt10vK1PGLrVk8g/UuXAnwKbKoHz/b8Rvfawy469JSWZBG/WI1sT
         Y94g==
X-Gm-Message-State: AOAM532vdjkrmJFbxrkVJ2uhO272aU362j72sl+QgMMOO941ODRBeeD5
        o8u2aIHL8NLg7ILNLOGV7Csy6hCurHa+rWxeAPfv8w==
X-Google-Smtp-Source: ABdhPJylfYIq/0t5C4hzWRaf/GHKoyycqwEWbpLfy9ABUE63ItR41bRWEMtlAzGCRqQxSThgIAjb+iLfcQL4/XQtnbc=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr11367282lfe.29.1615889647025;
 Tue, 16 Mar 2021 03:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210315114214.3096-1-noltari@gmail.com>
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Mar 2021 11:13:56 +0100
Message-ID: <CACRpkdYdHgP7QNWco4aN1G-GaRjOd2Y=_fkxv4zOKsQtXtpqfg@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] pinctrl: add BCM63XX pincontrol support
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 12:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> v7: introduce changes suggested by Rob Herring.

If Rob is happy with the bindings like this (GPIO as parallel node rathern
than subnode) I am ready to merge this.

As long as the bindings are OK I am pretty sure any remaining nits can
be fixed in-tree.

Yours,
Linus Walleij
