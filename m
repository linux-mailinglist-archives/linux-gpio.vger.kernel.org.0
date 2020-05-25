Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B471E09C1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgEYJKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEYJKt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:10:49 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5859C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:10:49 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id x13so7775064qvr.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lhgITogm3wNdDkyll38UukGrwlXQ0TAASl58Hhp1S4s=;
        b=qYprTas/88FCDOtbmZDDea0RZy6ywvj2YiSMcgOXQWJrQUd06fiHOWDrJ4Ar59pqyE
         YpLrN+qDmL1H2fw4vcjRJJ9QUklgARNThpot+VGb76+yf5dFr6hF2NXftk/vnCuDJhGL
         CSF9CG0tTGcXaUCzF+aTJLTVSU5XZOFQ3JgqTxqlMYLZ3w/Al+66CUsOlEAgm0mGNo1R
         AwZGAIL6FysFm9R3h1jJpvSPYwh4VaqY8UZtMFAWbitxY+tUqblKIuQa39RnX5jEaWB0
         nr/VjmemK5YvIeHSMVksGoo1zv4LmXMXX1zyJ4mo22mwtewA1jcwp33/Wu+kaI2CyDPC
         qOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lhgITogm3wNdDkyll38UukGrwlXQ0TAASl58Hhp1S4s=;
        b=U/fXmNqcoPIMMxtuLNXVzjjhjlsa4KO3k+d5x/aLXPCv8uU3KOuFRSoS0wNIApBo78
         7r7huHXGJjgdow1ip3mRB0d6HzF9z9BW7D0mXgbSS+fJ0uapGaqb+wza+1RaXBWsY/C/
         Yc2QwurLqLTxKjYSM4Tzj7V/d5YZsZIycTItt+DOsZ2hEk34wVwCYELea+I2V7/8HB5f
         QOmLdXnMAGamuZIRgWYY32AWoYsXrgwpuO9X0v0uIU3J4iqtbSBXDalGEN6LNw0st6g8
         /Gb8iaadGQb9r/NxaLPglNLGLTmaqQzpe54oc+vgU3hg4Rj1L9OOHVnDd72LbTH8Z93t
         li4A==
X-Gm-Message-State: AOAM531Uhl9CKSYoeQ+mf2iniCUD9PkDFvlYyvpHGslGPGJ8j1bvUfi7
        1NZCuXTg2TWESMyW12s5lafDJ7EIMp4lYMWXpV9psw==
X-Google-Smtp-Source: ABdhPJzG1FSq+3B5OPDiqXe3hmcmV4BJqFWi5fGdrSXCfovS8bvHpC4Rg2AUasLJLcvDl0WeS6eBgwTi2pU7XLiTzlI=
X-Received: by 2002:a0c:e5cc:: with SMTP id u12mr8506531qvm.134.1590397848814;
 Mon, 25 May 2020 02:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200521015713.2206065-1-axel.lin@ingics.com>
In-Reply-To: <20200521015713.2206065-1-axel.lin@ingics.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:10:37 +0200
Message-ID: <CAMpxmJVEucQ84kVrGVg231T9KE+7CaJMQzECdG520pMfDcvoUw@mail.gmail.com>
Subject: Re: [RFT][PATCH] gpio: mlxbf2: Fix sleeping while holding spinlock
To:     Axel Lin <axel.lin@ingics.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 21 maj 2020 o 03:57 Axel Lin <axel.lin@ingics.com> napisa=C5=82(a):
>
> mutex_lock() can sleep, don't call mutex_lock() while holding spin_lock.
>
> Fixes: bc0ae0e737f5 ("gpio: add driver for Mellanox BlueField 2 GPIO cont=
roller")
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

Applied for fixes, thanks!

Bartosz
