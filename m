Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041C5AF9A5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfIKJ6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:58:14 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33847 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbfIKJ6O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:58:14 -0400
Received: by mail-lj1-f194.google.com with SMTP id h2so12873783ljk.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4dGhcxp6T6gSoKIxWokryHsNaeknVwfT4UnRhjgn/A=;
        b=tkDWR58vwuKS0da2FWu9u/M/Xn/DyAr+ZUrx/+cJp27zqKvp/xBOMk/VGYXwWTSTla
         RUGyo5mKpJkCSH4kikwfH+5eo9+R6rZIayBLRSf+XRHifxKTcmqIQ4gwFxUtB1L1mNNv
         C+y6q8VDxxIv11W0mSPewJcrRxVLCXfhy/zrVENzffiPUZWT19SmmXpXLxeHXmrBsWUW
         Z+acs/RypO6knajkSEc5Qz/wJsF/2ZvG/Tnm6Rf1dhTLkszi/Ebc+DrhWG1iSvuJcAmU
         OvMWljKcMJ9mFuT5LckIuewLzRHNMNjiVhbyaXyBbavOplfSxkteHCHD9wi0oaIvuhN+
         RE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4dGhcxp6T6gSoKIxWokryHsNaeknVwfT4UnRhjgn/A=;
        b=Lrj63ZLwHvD034uEMlVINawAdfOUuKOOa/DrGT1IgYUuW80Pvw7rQSZ3wwdiT5ZHlP
         JWr4I+gUTYDPcEDqYlgk0V4cZX8vaw/8bZ8goxnr/LmW22RYScjpOoEUGwxnVPoJTQss
         kkC4dOCrIFouA4kgVVfynKALPzHQKxNCmiqwXikfpf884N8jymt/qnz+63zGGo8RC6gG
         wzKzQdqPAsh6GH47iY9Ggl6rwBdFhiYXU0pZYdO2sE3RIVyhnphJ1n245cwKc8LHdbx3
         x/mJyKuWi6fFsG51zUp/PSV9b+ZQWljaT4TRRJAa3l49b8O6YHg7U6FIwO6Dzq1wxudR
         nDEg==
X-Gm-Message-State: APjAAAVViqLg9McemVheD6EqRbqgMZg747dbmO7PiL/RsQ3usicEdgsm
        tpjYV9c0Mv1Az+y5tMs7/tI9xcEpvuul0l1K6CAA3g==
X-Google-Smtp-Source: APXvYqwbLg5jGI86j9e4EMl792llsAjTOPkGlSGFa4C8Xlkdq8JvUyl4zObZNLLqt7Sar4h37ifM08D33QB5mKjQPek=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr17584388ljg.69.1568195890794;
 Wed, 11 Sep 2019 02:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190905140919.29283-1-colin.king@canonical.com>
In-Reply-To: <20190905140919.29283-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 10:57:59 +0100
Message-ID: <CACRpkdbYKjKPAT=V8K_JtP49teq5q9GELkK-vc+mQEdwcU781w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: remove redundant assignment to pointer log
To:     Colin King <colin.king@canonical.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 3:09 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer log is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
