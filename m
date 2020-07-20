Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD11122612A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 15:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgGTNkN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 09:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgGTNkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 09:40:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B67C061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:40:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b25so20264612ljp.6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2TqGaXLm1LJjNwD7BWd5nhWoW5T2uB1q67xa8MHwR3Q=;
        b=o1nG60uwcHnTfy0TS2+LttQH6srPzrE5epdZJTdvwS4hM04a/5yT7RcAlxdCpbMtB3
         yQvv7WH6G+LocxRPe8k6PBJoK/pvzZ1uN6RgnwvM2XEx+IM2HbvgD4Rt8sVLFhAdVCNA
         R5Mcpz7NqlHG1sQE1CMs1uyAVGTfD5IhapoyRd0c1oGt8idD1OmAc3lFKmpdpOtg5mgJ
         lGIAb7o5oTW23BPAwDiqIHM6WzhVOnSdVv175/qWrtpIXD0xgo220e+NP2Qp3qF7Fqsz
         t4K+eL6rmzhtgSfji4lyCnh8ALa+1Q5v9u+kRO6fjY0Z+xkPGNtyIU+kTueQresiqIt5
         QV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TqGaXLm1LJjNwD7BWd5nhWoW5T2uB1q67xa8MHwR3Q=;
        b=NJIFLPT8e01dH+4WKuwFJ/qPXrHG+6T0MrFsq8oAuuX/V/UCsK61qJlW2O+zj9T6Hi
         2Q/PYqyo1IY12We/Zc/M0wM/lCigfuHA+E6w+ECCrAldlxwYmMnsPI6MC+2TnCwMWuOx
         SKkd8DtkI+zLYU8L7ngGgG6atOwx2FAr+lHeIut7ALuxhoPWoE41wBCTccJ3yESG6R8/
         yJkKInd+N0bUHNXOi6MlhN4MRk49vDoDi8Gu65stG0iuIBID247BnBMKVOaXouBrjPuZ
         JoN1yeUncblHzso8lBWK+kljTBESeugGvFJUpU7HJG2QlVtpD8Tg+0kilOtYI1BNGgVG
         +ThA==
X-Gm-Message-State: AOAM533vG9kKrMy0h3F7klY6Gt7HPF2b7StjC999iOcCJK2pAiMd2/VE
        RY7u/qyyKOJyO/lcYI6VZFJ/Sm56B0+8z+EZAzHVNg==
X-Google-Smtp-Source: ABdhPJxsGScXp2ry3GuYVsKjsKyaCSkJk8FuHP5mvQ3dEZmQQwYdfTaLyEcMQlgVIHgPJkhPC51SVKPWJsvLAcY3TWE=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr10705432ljj.293.1595252410517;
 Mon, 20 Jul 2020 06:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200716212317.GA17754@embeddedor>
In-Reply-To: <20200716212317.GA17754@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 15:39:59 +0200
Message-ID: <CACRpkdY25NXNzAZhV6v9aQC7hUnxbMoniyYK=QMmVi6GJnG5dw@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: single: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 11:17 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied. Nothing controversial about this.

Yours,
Linus Walleij
