Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3559A92B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388568AbfHWHwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:52:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44173 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387622AbfHWHwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:52:50 -0400
Received: by mail-lj1-f194.google.com with SMTP id e24so7974529ljg.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqpwIMCq4y9TWYu08ngpLNeK2cRwz3qeYJT+U8RgRXY=;
        b=DubrrLXkoiYf/fFwa21azYYe43fLHngxuHKyq7387+Xa0R0Ff7zONRqKscfvffrNGV
         xvigud8tSrm9hg2nb8/TtO16kqEvOUt0akzEULGED8Y0T1bkMcGum+zqpT9cDEubuxwH
         zDtMB+FG+h9mOlH0GO/5JUOIYRtup9FsgSXyMbXSH0v0zu95BVHpnO1Kv0uauQPnbaQN
         5iv7ncrpq6JE1kyhB4tmhP8salJo4dzrG3ceLVnfRJhb8EOfy2yI5PyZG7o7nknFYOb4
         PaMq+OOt5MpDwHdQivCI3RF23PTm/tHeg0D3RtIQVtlTBdG62FIvyqLB0f0/PLrSLxtW
         1rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqpwIMCq4y9TWYu08ngpLNeK2cRwz3qeYJT+U8RgRXY=;
        b=mrbCWnIUpdaqTx148Bf2vSWHvTxUXM4cHe1l/QiYoNmAVrJVvYuLxwMOU/MbqYEer7
         hQXRKpEfOEXpX7HMaKz9pO8iAkIvxSEau+VsYC6eQq3fuGETTEDGSsboqOIPvmupklct
         rA0gT032kRqlfAext0Cso6M8ZIf5b1JrZeMjiqRyxr5fdAjzVAO5QETsUm5ZjJspDmRJ
         yqpVJ2P1vTQEfEy9qletoLJK3zQ/da23RbuhVAoCZjHbBNKQ71z8piEHD/I0k0asCi64
         w4JILVD4b5GRuZ5KfDSM9ut6v57tvMGWDW20dPKl/3Rorr3EjTeyRAtdqYm4fMTUYGr1
         vq5w==
X-Gm-Message-State: APjAAAXalAwxH/X8BPGJAYbT7o8VhQMdodAM3dSdOo+jKf0+JJuzK/bv
        WYqdXaVnFv02sjJBjcp35+o38Ngh/mnbTzas8ZsogA==
X-Google-Smtp-Source: APXvYqxKaJvKhF13Q1aLZVUTLP1o3k+sNGLKbFE8QiSoT0WUr4YT9FXA/najFQ6V2Iew5rRXx0yaKkpm1sgPJmmTTwY=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2103001ljo.69.1566546768877;
 Fri, 23 Aug 2019 00:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com> <1565686400-5711-6-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1565686400-5711-6-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:52:37 +0200
Message-ID: <CACRpkdbpsK08mYX_M5vvaExR2HCa8ct16zC92euLJzewYEDG-Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] pinctrl: mediatek: Add support for pin
 configuration dump via sysfs.
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Light,

thanks for your patch!

On Tue, Aug 13, 2019 at 10:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> Add support for pin configuration dump via catting
> /sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.

This is debugfs so rename the subject "*debugfs"

> pinctrl framework had already support such dump. This patch implement the
> operation function pointer to fullfill this dump.

Fair enough, that's fine.

> Change-Id: Ib59212eb47febcd84140cbf84e1bd7286769beb0

This has been remarked on before.

This patch is missing your Signed-off-by, please fix that.

Yours,
Linus Walleij
