Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1A1D72C2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 10:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgERIRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 04:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgERIR3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 04:17:29 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CED9C05BD0A
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 01:17:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k5so2244243lji.11
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KgB5iCRiDY1xUpzvcmt2qA5qOxhIvxFlroLwQSWXKVk=;
        b=cEeYQ8sMtfIcnqhDnaBX58ozf3oJI5XHFUC7g3rtIUDyqFXqr/s6o9QnE2+uFP1k/J
         LILQgdSPbgh22hGw180ItVeDUD7AU7RWmUS7tnKBpMk9U4t2JKNxq2pw8DY0Dr0glxoc
         9h935pnTmgCgvB8iSgullSwo71ZCKnR3oJERR89JnjUG0THbBdRQXx1WxsyFErA0JpzB
         b4NIVLEPTvVtsFQqcbTuJ4CrynyFpmf8ZXHARe3MZX3xlqHCX9g+ZlZpXgYibNMcuvu5
         SuKbidv7OF9jh3VrmN4uc7XV48TL9pRc4TJevPeF2eMsNSiYx4LoZTRVZTp2C4Vyh1/N
         SVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgB5iCRiDY1xUpzvcmt2qA5qOxhIvxFlroLwQSWXKVk=;
        b=HBSU3SjT/988YvxFwRotfFi680sKmUP+VP1F/y1m028TWqv7A/01GH8+2f/od2ykuG
         CktnQEOFBL7hSrEQLwh2PSuwE/OSI4Ttr9acuPbNkknGkixdoCnCg+IaHd1/HXKlIR2v
         8s89KPocrq+knLI8gEASW51CLnKLB1BHMZOT+mMmd/7YDT1XRRWbrTS5zLterE1oO9m1
         Ij0dlNxw9cQ4aQ0JdkcW8zfQU21h3JBhK+xM1vfV+WEDI4YhSWsGrSuts6LRFpae4KEO
         s5MZPyQdzqbvIcwbW0URPPTHyMedLsdxXjXYO5WdLFcl5IkvNySHsVH2HBkVccriePCO
         gUSw==
X-Gm-Message-State: AOAM532oBfQZ2TqnHHYLRINezmJY7c7X2d+Dxs7R2PD6sg6QsvQL2it/
        IznreXi0K7LQv5I03DEsVTR2L1PQXic5YswQoWKF0A==
X-Google-Smtp-Source: ABdhPJwh1h7WOq2+DVADM4reEeAZtZ0+Bi37spSD7MX9/2PvrGxVJ5a7SXExxc9Et8QUQoYjFbtIPHqiLPfc0Ni3lug=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr9513452ljn.125.1589789846527;
 Mon, 18 May 2020 01:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be>
In-Reply-To: <20200511145257.22970-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 10:17:15 +0200
Message-ID: <CACRpkdaz34Bc_EzcXKMEVCCCUt82_c2+t4X6YSLW2b59oi+9gA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

I have queued this v7 patch set in an immutable branch for testing and also
merged to my "devel" branch for testing.

If all goes well it also hits linux-next soon.

Yours,
Linus Walleij
