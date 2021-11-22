Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4481645875E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 01:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhKVATF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 19:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKVATE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 19:19:04 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D175C061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:15:59 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so26237172ote.8
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3gq4Z9pMhh8rOqRdl4j/n3TxD+TdM/44dzvZ+ScoXY=;
        b=oMGhsOkmbuCHdDrrZ+o6xHoZL6FkvgjD1m8VJNmHf9f/OYZJvm0ZVMwzNZjJCp/KBH
         APcAQIAKygT8jk6Bb57INl3LUXB3sIWySfGvAc5gvQi7GuN34IyyzTgyYUd7CUnrva/n
         sTHih+sVJIcG7C8YlGp5RyvFEBBP6XuxjsvefkxLZ+zV2slajxPj9/uvFhVoqHY0Mc/I
         OZzNwP8MkATGmuCREr5exZtT5nPYpWVVdKGkR2p9NU4FARoToGiTYEulD7LvDriKrITM
         sbhsEJR9Rc38Q8TZn993WSqN77XsfTh5llTAGZW9tatzlCMp0OQ4ZFgiKDSD4SJwgo+O
         aQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3gq4Z9pMhh8rOqRdl4j/n3TxD+TdM/44dzvZ+ScoXY=;
        b=bB56/MHQLuse7f/E1s4azA9j9Hm7Xag4bPuziMqjdsPgAGPe76hmhnGpDEMap6r1IL
         a4qGWDeVJDob/sX/JFmJP6Gkq1IccHurqch5nBYvDnVnJJ9Cc2bgQH+rSULuxKIDecGZ
         wYviDpi2iPTHcViFarjPYQ9Y2J8IJ2CM70j6BhY95yWhOXSgPkbBeH2fwrY1qiOPyrNp
         /Wu417SuyKrTkEZfkYbqjE0GLvm9LAaTfniJTJNVJ0c6FRp3JKN2HHHOeLNDvmFPRKr3
         lV/gpqnXAWtMcOzCTaVq2d5TwHnwJFL9TaWPvUOMy3fy31OeTRVUzs8u2RYO0Ggq/coF
         XNJw==
X-Gm-Message-State: AOAM530ZB9jYtuoQBaeScY+hVKgjY8RCdC1JiXXJlPH/HgchJ1jm4nVc
        +2vO4VyNzidp+gedUq6GN9ljcPCUkrfcmLH6TijzEg==
X-Google-Smtp-Source: ABdhPJwMl8dQynphDsaDKhcDGKOG5GbWb69Dr0B5g9jtkYXijKRFCeukXqUbKeAcVv+yY/c8SOrqrMwM3Z/wk20b3SE=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21656051otg.179.1637540158490;
 Sun, 21 Nov 2021 16:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20211121165642.27883-1-joey.gouly@arm.com>
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 01:15:47 +0100
Message-ID: <CACRpkdbbj_PapRXYv61Dt8369_qqQx97t3o=FyFUY7s1ThytMA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: apple: misc fixes from post-commit review
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joel,

On Sun, Nov 21, 2021 at 5:57 PM Joey Gouly <joey.gouly@arm.com> wrote:

> Here's a series of small fixes that Andy made comments about, after the driver
> was already in the pinctrl tree.

I tried to apply this on the pinctrl tree based on v5.16-rc1, have you tested
this?

It didn't work for me :(

Can you try to rebase to v5.16-rc1 so this can go in as non urgent fixes
for v5.17?

Yours,
Linus Walleij
