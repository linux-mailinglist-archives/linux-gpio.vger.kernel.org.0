Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FC52E9752
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbhADOdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbhADOdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:33:10 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D34C061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:32:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b26so64783965lff.9
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLLeV2ROeBGM3WGo/bVDddCpWRDlMywsaVQ9pnuZqKg=;
        b=sZPVugjTm7EFyCjSrFPCg1iS7p+jqKUqrIslPZKdIV6Iq2jeW+qAe+2p+lSw3aufC5
         6VVMgJ3U05PzS4Ckfc+V8ow5/JMhgCWNC8e951BbzN2UTjpYmROeleWFX97FXPmBmIZ+
         OGdU9zS+8fKAKRtlJ2WX/iN66r99UllvJdMr9UITdx3+KCA+HHNbSBPI1btIspWNBL1G
         JaAHjmN7QsYZzvN1EYorBEzYPWTIUVF2XyGRT3LXGuna+uvFqpxqQze0DMIPynOtRAk5
         F8YZHk+Bb/gTMx3DzmSorRn80Ji1DIK2FEsQvAW/fBVSwJRQVdMU4Dzd8WTnt3IhvdxZ
         XiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLLeV2ROeBGM3WGo/bVDddCpWRDlMywsaVQ9pnuZqKg=;
        b=kezcZbGNfpWWOrHTzlDsM9jL/dC3qF1sepdipwEliZ5RsST/8lPWN3du4211896qIW
         ZMzGkYrGNxd9duhJP1q3LfnOYEwRhoYjk+S0JJJPiMGhXDgxV+8jflenJexZoyyRthwi
         YNNiLmIlEBrKHlscEds3UkkgZXbst2SKM3kRNB8WpZphjJKpzUnjWuDJk3B0mxSKI0Nb
         ti5y2mNKSSLLpWmLaiGnJH/a6Ph/21tUDwNVA23TA+0IJQT7Kkpfz2U0cIWHA0spklsD
         LzPolroXGBj+DoapQDYt5MjwunQQ9wgrwbMw8wSFCCnMat5JWsMc8X6tKm+Z0S1s/HNo
         Q34Q==
X-Gm-Message-State: AOAM530JlNtBan3K2WT1yYSPdmvInyLjhshdqWi3fEZoJtWBRKNSZvGR
        BgFqiWwHusBroNRtbdiosDcFqi1aMI5bytaI0eB8Pg==
X-Google-Smtp-Source: ABdhPJwFar5mxvkOewhvVCh/51OG9/Cy9to/n8R4fkqvBvJnNKhgcAlxkS1Y6qzZHF0O1wPAIffglPDasHobzslhVmY=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr30613918lfd.291.1609770748988;
 Mon, 04 Jan 2021 06:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20201211084902.2480-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201211084902.2480-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:32:18 +0100
Message-ID: <CACRpkdY9umuuRkDcoTJeMS75H-=xTz1FB8jPZThaNKgv004hPA@mail.gmail.com>
Subject: Re: [PATCH -next] ti/pinctrl-ti-iodelay: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 9:48 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Patch applied.

Yours,
Linus Walleij
