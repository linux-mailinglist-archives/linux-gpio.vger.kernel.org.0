Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3143438C71
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 00:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhJXW6P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 18:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhJXW6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 18:58:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C32FC061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 15:55:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bq11so5646588lfb.10
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 15:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8iPIAb2h7OaftOIwaaK8T359hTECc45IqlvoZ2xjVUw=;
        b=YxocF8NKY2oKo00KX4QpzIQQU7PQFOlGAmZZoQSVZidPw1RGIw+HtNfe2Jxg3imu4D
         d2alc24QJdH3I7Bx8F2jzSawbwfeKtLCktB95LBKGV8k2Xf8PwXGfj2wvkCDR6/rKA9z
         QJXotHUsQlYVSbsDKhMZReEGbxn5y1hmxODgAQ1IzJwMDAPV0ElrLMJ+Lpyf/QSJ0DKE
         hsJd+qZ3j4pcLm1NXTllJRzMA9ZpIO9OydhKslME86bOfIq70b1+9cdju8AXGkZMldGH
         7871uvDlVL9CY19NXZV0YwrBrPoRRbjC3zP5gTS3PrmR0H+mwYmaHeTQPfg2tBEyrcYT
         08TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8iPIAb2h7OaftOIwaaK8T359hTECc45IqlvoZ2xjVUw=;
        b=29ydJeZatm+30fxAhVpdqP/UTL7bc7Jy0N436EpcqusOoyUMRMT2hJsf1mG+L4GsjM
         Qj0V+5Qb/k9joFjxC1zB9IpBJqRjVkwKeikN/yxD6c+OLoGgk+WOJGUNdwIniNZrow3d
         y8ck9g5XzdVfkOkmWIBqybwtJewhoQCvm3iu+0jAPrr1nX9IwPyGUsLQc9sCwu8joTAs
         fqobd1tgulca5AdcJ+h7/jQHSaUua7u3lPMnbOgQjDH8JLV+Rg3E9aKvEvKqrhObxajI
         d7bXl1f2HpR2Hxk/ilQZguSr+pnRM9GIGldn6Ml+J5zSFY+bW0SJSkrL3x7uFulJx9Pv
         njvA==
X-Gm-Message-State: AOAM530QToh7WCsrc593eiMxDhqBVxbgBfop+MtzQAqD3kXjX39VDTAH
        WpVIYaxajuND/gVjxJNBrf6wSPgr434Sp8i5u0NZhQ==
X-Google-Smtp-Source: ABdhPJwaI+UIp+fhpIMRcQ6tZotNx9Qpw/8KR5lnXFBnJ2wKLAAcdN+LxnMunGT++KoNcYwqVoujZqi8R2ej/IKm9bg=
X-Received: by 2002:a19:6717:: with SMTP id b23mr8645155lfc.95.1635116151869;
 Sun, 24 Oct 2021 15:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211019221127.1953001-1-f.fainelli@gmail.com>
In-Reply-To: <20211019221127.1953001-1-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 00:55:40 +0200
Message-ID: <CACRpkdbE2nxaXCMb326pYiQwU+E+FphOb3rZV0Y7z_MZXdToEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Allow building driver as a module
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Jason Wang <wangborong@cdjrlc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Phil Elwell <phil@raspberrypi.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 20, 2021 at 12:14 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> Update the pinctrl-bcm2835 driver to support being built as as a module
> by converting it to a module_platform_driver() with the appropriate
> module license, authors and description.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Why not!
Patch applied.

Yours,
Linus Walleij
