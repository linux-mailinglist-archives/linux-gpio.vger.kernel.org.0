Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C345202674
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 22:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgFTUo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 16:44:29 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46511 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbgFTUo3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:44:29 -0400
Received: by mail-lj1-f193.google.com with SMTP id z9so15205343ljh.13
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctY1Wy9wIIIcbQLpOXjoHpHxkeNAAsK0lL/c72YppyU=;
        b=O2v3CokRst/vy3A+uiSf4+WOQv/7+8oGHSGKF44cG69xXPba/65IxO9vm/MuwdhUp5
         OmxmT5M1sIiAkW4E/K7YlcHIRMfawaAfHxCts8wS3g3EHM4wwyxK8/CAmOI+3Byv+bdf
         tWDCSaModGS2huVaIsqGxE2n4+E08fwbMEVKOdHw/Z/WcL0qaeIpJQJ5v2DpyLvALSCr
         F/Q4lu70nVdxlNYuA6CXpnFFRvTMvcXflkz/I0lA2bCZlwDxSxmVDrwtKhktGm02Rjn3
         Y2bcS67UG958vhQiVpGaldqjpisCJNCYm+jEIBMjUO6+kosucgpAY9iz1ffpf9cqgmHC
         mDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctY1Wy9wIIIcbQLpOXjoHpHxkeNAAsK0lL/c72YppyU=;
        b=py7Udkdg7oPvjkD1+ksTDHIB53U8wyyvT8nnbAEmjPK+TEH6jsR2FMuj2ItIqyf80q
         CrS2baegu3UOfdGafyzDSUByjJfgrz9RCUX0cQ7ndZqeK4bHBkgJSJRM4pd4muYDs1LD
         WdoNngWThHx0qHB+Zxae/KJRE3qlVpypsNd5DHiXbwtqoo339/ovSggX20m8uH/nQLtH
         0v0urucXs7zVT+pREN7Ls7IeS1mpRhOzeOLGYTHY+3P6fnnNC0P6hDYSoscC3lFAB82c
         au0qw65Hsc8UaA/1P3SyAykrcaTcusN+Kf1z8YSApQwvGCWQKJM9rwFJ7biIHHjEB4FB
         e0yw==
X-Gm-Message-State: AOAM533wIsq3sM2qQAewkoa5dtrSNxPGshzg1nU3GSLfBsN/6QMsOPeQ
        2arcQlpzinkgUDg5oXVGfg+lYHQhJEVh2QrPPRQBPZQ0njg=
X-Google-Smtp-Source: ABdhPJxBM1udCjVBlr0yRSi7Ob7TlqTZf8Wuo6lMRWikVhe0vp5cJc9bcgk6tgDNV0FWDPtXeY2aQNoyhRip/C3VkZw=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr5232818ljn.286.1592685807390;
 Sat, 20 Jun 2020 13:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200612120609.12730-1-paul@crapouillou.net>
In-Reply-To: <20200612120609.12730-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:43:16 +0200
Message-ID: <CACRpkdZwFuiCfJNMrO3aH0eZnnmX__-5EjRnrR8tHh4gqSB=1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Add ingenic,jz4725b-gpio compatible string
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 12, 2020 at 2:06 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add a compatible string to support the GPIO chips on the JZ4725B SoC.
> There was already a compatible string for the pinctrl node, but not for
> the individual GPIO chip nodes.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
