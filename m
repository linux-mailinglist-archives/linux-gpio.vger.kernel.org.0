Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACE22030B7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731430AbgFVHg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731354AbgFVHgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:36:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E85C061794
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 00:36:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n23so18075334ljh.7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 00:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8jMd68d9AA5HKRSwD8btncLpXQpP12S2zPFIYOSY6iI=;
        b=hMUPfG1NvzklTAO84EV2hfqw9q8vRlb17BtAPtKzrxDuauzTU9TdVJ19q+ctkvKrpJ
         lxFGho4TmZSCcTAqrLqo0PGFQP/yJnE4m1KUetOuKUhCfEz2udC/n0gQX95fa0WugnBh
         uJ3tPAQ+BvlkpYCkRfTxht7PjweJtsPxVEeObz84OElS05vMoHrkLRPgbGMb0E56Lynx
         JOo/7zwJlYUdDziU+J0As7CSj+7FKn6bkoX8Rrha9nQRxh+5aIN3oec79oyQ3k5gNgVs
         vtQXZ5EWcmOxfVuS1JZ5Ot4JY6CI0y1/BITzYt6ezNORuPBKyjz0NZUQ6u4OfmkmgBZa
         G+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8jMd68d9AA5HKRSwD8btncLpXQpP12S2zPFIYOSY6iI=;
        b=bw28wxUXtNOlr1On9m0b1mg0MuDSM9+CPhHE+TfzxE+KdmsU88PqW0BrHGrn7EZR8s
         0hIDabJ1cQnuasPZ9Xgi9YduNOaU+PrLN1XCGJdcdFwZCxs9y9swnWdo6FnrbJGlvVui
         zGLV8X07Jg96LwdmL6klh4aDK/ZXkTk+uNpdQW2ApQqQrr6A0L3DlpfuHWRQwsD8RWzi
         Xkd5QOruDemb1Q8qM1WX6mEaIqBMecWPMpv2DUf4QbOTZ75+UJq08vqu3x9hGw6nJ2hB
         GB2MtP5e/q6ZYLi8oDSahxHnve2glquxvd5l2ASHdC95wW9tuAip7Cnd0Ewn6x9DbOMD
         BgIA==
X-Gm-Message-State: AOAM530G7i/HYn+8mkatUWcHEqgQdoqTEJVHXFxYj3MoTJa4Qics9efd
        GBOO443CGaSSvm1vwhwTObm/8zBWvUO2cpCL2TqY0g==
X-Google-Smtp-Source: ABdhPJwHMBfbNH8fHLFwGb0U4Poyr72O07MbwbdDDd5vaN6Cets0kr4TApTjHKoHivQYCbHDp3CzGhYjAFPqe1YH+Rk=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr7364725ljo.338.1592811411727;
 Mon, 22 Jun 2020 00:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200616015024.287683-1-hengqing.hu@gmail.com>
In-Reply-To: <20200616015024.287683-1-hengqing.hu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Jun 2020 09:36:40 +0200
Message-ID: <CACRpkdZNS7JD4Po9d4TXzB=+bn9qUez-eFwUjp=cF3yE8nrE0w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: fix npins for uart0 in kerncz_groups
To:     Jacky Hu <hengqing.hu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 3:50 AM Jacky Hu <hengqing.hu@gmail.com> wrote:

> uart0_pins is defined as:
> static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
>
> which npins is wronly specified as 9 later
>         {
>                 .name = "uart0",
>                 .pins = uart0_pins,
>                 .npins = 9,
>         },
>
> npins should be 5 instead of 9 according to the definition.
>
> Signed-off-by: Jacky Hu <hengqing.hu@gmail.com>

Seems like an obvious bug so patch applied for fixes.

Yours,
Linus Walleij
