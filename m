Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7514D216AEA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGGLAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgGGLAG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:00:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14029C08C5E0
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:00:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so49325504ljm.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=fTRhwpj/hU9LfJzJkArIDCDB06upW6a/C93yjE1K2cuse98pkQSzoA+sYMYtLUzpDf
         3bp4aEg2xQVvoYioUSQP0uJQAC21hPPGHss9REoOMCDiJiZ5xEBBCNpeUbFG4cvUniMv
         2TC9aOH9W8eK2nENG0Z49Gl/eIoFu9EfVU7YOlIOqdz27oL0+BEVXQstm2SudjiXJY3+
         27TOPF9Jb895pl5OdzMSly4xGJ0XrKuF6+ntvUXmtZOdDg2vGf6j8qqtWXaNTbOKnfRC
         k9bfaV65PgvLITOCEwGD9SdAmApIqfAx76iAQGVkmib6gjtNWscBDAyMLSGqGzdyvUTP
         y7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=e8cS74O5UqfP/nlNciQoqXXf+zmF+EqXQvahA17HdvXdN4rWMJg8xsnuQVcwj7tJ9B
         4rzqieuqWhMyk3Z4TJJTy91uB6SZ6d/tVZi3lJHdZyYoz5Kqqcgk1TyUXRcE55aHqoZs
         zq6bb+1G2AGXf1dAQps0aA88lg+sQH7YX73nuZz8/MkXbMukeye4LoCGRDnn3jjsHUh6
         1DU1UhswJ/UMZSNrQRoqAlvdln80R0DODh5UmZrVP2AHHMCCuj60eugdDuFWxZgKKuUp
         NKbOQFhP7bPTxHDvjneaCfv4bz7PObv/VuGo3ZmeRvgPYTbqPNeBr/LTTTWIEHBzfGGR
         h9Ww==
X-Gm-Message-State: AOAM530j/C52CsBF+kB3V6tqjO95U1IKp2n5aWbWcJ7XjnrD7srnQmJ7
        DGRqImef97oIe9xCsKTV1bpbCl6CcVq7CBCKq76Z8w==
X-Google-Smtp-Source: ABdhPJz/EbBwJ1T3GgvyKHSaJPDBjC/885l2Y1IY+hCrikFT6rUcrPXU9Ohp3fztPR4QHzpES5qUG955fZ1BVL9iXNs=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr13896696ljc.104.1594119604328;
 Tue, 07 Jul 2020 04:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org>
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 12:59:53 +0200
Message-ID: <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 1, 2020 at 3:33 AM Drew Fustini <drew@beagleboard.org> wrote:

> Currently, pinctrl-single only allows #pinctrl-cells = 1.
>
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
>
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
>
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure
>
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
>
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
>
> Drew Fustini (2):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

Both patches applied to the pinctrl devel branch for v5.9!

Please make sure not to create colliding patches in the DTS files merged
through ARM SoC this merge window.

Yours,
Linus Walleij
