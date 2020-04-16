Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3461ABAB5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 10:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440182AbgDPIAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 04:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440114AbgDPIAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 04:00:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A42FC061A10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:00:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w145so4874516lff.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjVFjiLUKq2dceYjR/sUZuoN+VaM2KkSpDEryVFjJAM=;
        b=bUozIsQsOLIKrmIe04JjO05g7JBKyqXq8AdHzoY9+98g1GkgDs3t0ZDClZymhjwkrp
         MByC50ZFFHYsMPZGUI3oyH1zekRuiC/DmTVL+6fK2pnd31mlDaqeXshW2PrfW6TKGkh5
         dBeBVQy2o/c8U3eusS+I18vX7fIsdLrap/MTuqke74f8h1sfJsA/vNI7QewuTkLGLfiX
         LZDVWtncz77CnlPHYu7z1PwxOXGCgThpfqHN2sydIRa9pH9054gcPx/FnQbBWcbrFCu/
         B2wJoM2zJjIqKJYQ4ZUYjeTBW3+l3o13HlulzKtS/fh5gGg9WHIISWPjKIz6H5cx0w9h
         Nn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjVFjiLUKq2dceYjR/sUZuoN+VaM2KkSpDEryVFjJAM=;
        b=csULvun7odE+C8P4GQBkd1B4x7phIDxrsMwvIOvziVW8UHSdVjOufVID2KsNdNwdC4
         2YdIAagOLZ+kYhgUcim94mG4/fwBZqpdioosmM3drJIxdYcBzAwul9EHveHYtb1hXiEm
         WkZjP0E7BrVd2FQIPsd4/q9gK535QaijS/ES79SVp+arhXOt2+W5G2LX3dEvGkP0Czfv
         VIvUnI4Z7bjP9lMT4Kcak9KkzW8nxYYHrAR7NRjxJN8CtUp16C0KzShITHoVvYDT4EcR
         jOli7JnNGUSZmBjoaGrM+QVEYXpTje4V6gfymIh1ebI9tbcqtPnBvede/sKNDlsRkmom
         d2dg==
X-Gm-Message-State: AGi0Pua3c7FtFS7gQmA9uvU/wzXDfps6EPdoQk5HR4EqcwbtXii7KACK
        lRhXbK/+ejsmUAalfpu+TamcypCnNOc+Zotre5zgDw==
X-Google-Smtp-Source: APiQypLJmZ97wdSRNvt5K0Vot48JkDgvMOmnFHGu2O4iKZQqqK02fJBxbBO5EYfsbjVxASLotokCg8oMB6V5oELv+9k=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr5198837lfe.47.1587024032955;
 Thu, 16 Apr 2020 01:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
 <42100afe6f97d28447c153bea6b54ea556cf95ca.1586289920.git.sean.wang@mediatek.com>
In-Reply-To: <42100afe6f97d28447c153bea6b54ea556cf95ca.1586289920.git.sean.wang@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:00:22 +0200
Message-ID: <CACRpkdbszsyw550SZHBx73SHhUeDsKYC7od4pQRvpH+OdorCHQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl
 ready for buiding loadable module
To:     Sean Wang <sean.wang@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 10:08 PM <sean.wang@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> This patch make pinctrl-mt6765 ready for building as loadable module.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> ---
> v6->v7: remove change-id

Patch applied.

Yours,
Linus Walleij
