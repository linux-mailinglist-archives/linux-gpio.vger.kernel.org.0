Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD471F51D3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 12:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgFJKFu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 06:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgFJKFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 06:05:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339D3C03E96F
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 03:05:48 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c17so1693417lji.11
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJWA5EpqlX1BZBX+8gqs4zVSU/BhYrj1d2QAoQsiYgk=;
        b=nhrKiqzOFvLR0OC1NX/xCGyKdJBwnxJ23IZ3mj+TDKpSSFR0QZJVWUdu5pbAJy6nN2
         kP70DZX/YVAlL2kWeI7k/GucL/aKQzheoLwmLs0USyNS6D7yIvpZzYOOZT/w0oThuJNi
         s+OOqVCCbnwhKwq5NwQ/2SZy8uywYfk/iF1JccXlNiu0+/HRNU8fjlOzyGi/orbJriJS
         FIq6uzayOVG1AaGTmEc2F/i48Hrvf3p2w27Js5WWQlhauk0FqvVmJ30o7Ow8SObCj6Nt
         nYEo52Etk3d51C/ktOXVYUXFrHSS09kr/q6i/YU/m5wl1UMIJv4b5AnTofFut2k7EOB1
         IikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJWA5EpqlX1BZBX+8gqs4zVSU/BhYrj1d2QAoQsiYgk=;
        b=itsmpgEziIXFlK6uqsvf5fFjYvG9kx2QZaI6MOUntYWW/DR6iv3ssbVKymD6Ii2kvc
         4znjkmAentwk+4VRLE4i9cVYtG4BWLOR8FjUsmHAgETkULntfUKRRBf8hEOSekja5Pxv
         PcecoLLg+JUZmkNPSndE3fWUwPZGcmtRb71pNMciLN8quj4iq7MHa0Mie9CnlQaYzspM
         pe2054tiyxGtcGin60M+4DQv3GJgYo+zbwxIgdxdjbi72+eL4aVwCtmIq1uj5nCgz4RM
         Mmxgi7P4tK7Stnz8Mz9xskdGIpr48yyspKcJehDfLdEaPLZ/KxQoDJ0nJbxThQtardbr
         sNMw==
X-Gm-Message-State: AOAM532CMZhYCqdGzK7DC8HAEtecLXZ5bUxxutlAHxYif/6WFC/fQfwG
        1qqvKiDLb+KjyIKHJS6/dM1TUfXkUfgbrIhhbCFEsgev
X-Google-Smtp-Source: ABdhPJxSCEjghdjwebsJyukomoJ1ZbRO+EZF84d3444cwUPi2mrnedD3WOTV2G9VFBg7F5ZOi8/Qqh95qYa7Q8oNEyo=
X-Received: by 2002:a2e:974a:: with SMTP id f10mr1395304ljj.283.1591783546553;
 Wed, 10 Jun 2020 03:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200607174243.2361664-1-paul@crapouillou.net>
In-Reply-To: <20200607174243.2361664-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 12:05:35 +0200
Message-ID: <CACRpkdaRND-WWr_4umLwK3VHmizTStLQRoVa6MAhRYAaBVYHcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Add NAND FRE/FWE pins for JZ4740
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        od@zcrc.me
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 7, 2020 at 7:43 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add the FRE/FWE pins for the JZ4740.
>
> These pins must be in function #0 for the NAND to work. The reason it
> worked before was because the bootloader did set these pins to the
> correct function beforehand.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied for next (v5.9).

Yours,
Linus Walleij
