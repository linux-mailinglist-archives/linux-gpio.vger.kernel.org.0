Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BF11E09C8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389114AbgEYJOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEYJOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:14:34 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31ECC05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x27so10121905lfg.9
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=iJCNd0WP4T2/2xqHFj/gIuNqq2nAz8/rYUUIUMZXbhSqNUH2wD9d3ImpsmUT5K9JZb
         HsUwtqhLL0TxmmR3R4r6kjSl752W9kBUXh4OvNsiWWoG9z9K9aPMeV+Yhz0+P/nc/qFG
         swvJAy4yoYzTVccX4U0CUZYHt46vJVgrlNyoAugFZV+j6kJEa4iI+Cx1QeUubo/b8lsJ
         +6Y3GUjKomjQlycqaTGKcxaCX0j20+DiFID247pDl4P7ou76Y7Mg9uSvjA5V0Xi4CT7+
         Q/YRNFpbc5ck+tD6ijCl4tcbtVvhXXWsDQj2kJxs8zhn1B8zAxcSKSk06O83JNFmfoIB
         fcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=XVKt20hsXmKSf8CSGUJJ1a9ImJNjR5o9aTQR5+m8SBb+EsTzQlTFTT4zRK5b/7Jyt4
         DODLD98XLAdGiJfZ6u1soEswWv4s3O0Mr1FllnpVS91S6UC26utd8iCs+fXi9jIEB7zp
         M4vnNgBNoFGKRe1bRPMKuI94hnjM/8yeuJ6FR9S3G5O2y4+cyVYYbVuX/CVohyN6daco
         NphKzRjgrlKibG62jUMG+Yx1YaQlGvGtIaJ6DbhY0ZxCi8QiWRcuN6D6VzGftIJwfTdw
         33qN/QZ4QO2cYdf91xtWUupR9JAa/7eW45FocDV7qws8xN24akrsRlZTKDO0RRI78I0T
         0sLg==
X-Gm-Message-State: AOAM530VYSVtrak1NkCA+jdG7w1EIW4+XiMyYOisDkdh8ff/s/UQeemj
        sPPnQvSk7dnw5LeLmm5nnA6pot4nl/Rie0fFUorh3GvZ
X-Google-Smtp-Source: ABdhPJxQ9pMnQX/FaNFVrr0x1mPP3nm72DesDbrY4FPLvRnsQmiNp4caVpBfoS9ZM1qO93+pmo9dQs2du+BlgOqmq1k=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13045361lfq.4.1590398072107;
 Mon, 25 May 2020 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200519081157.29095-1-geert+renesas@glider.be>
In-Reply-To: <20200519081157.29095-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:14:21 +0200
Message-ID: <CACRpkdahxkbxXd29bUJY-25gmMzZ97LUixtJ9y=ZhchkaEETww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 19, 2020 at 10:11 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Document Device Tree bindings for the Renesas EMMA Mobile General
> Purpose I/O Interface.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Pretty uncontroversial patch and you know what you're doing so
patch applied with Niklas' review tag.

Yours,
Linus Walleij
