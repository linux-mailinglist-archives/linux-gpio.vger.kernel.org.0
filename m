Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CAB2E97D3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbhADO5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADO5o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:57:44 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DD1C061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:57:03 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o17so64960897lfg.4
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQ2i0L58d+7KMPuRIFLmZb/rPhz/cXFhasTrmyO6ho0=;
        b=vnV8XwNWK0qie6n8I4m2kJy5lVVVwMO+ZIhY9foz8j29GaiwREa44CaFm6X2D7Yq4K
         Nyxl7NLS5t+DPFVKCH0fxo2/BJW8Qx7leqSlb1wgOOdAjD6yKvAynNGItDYQ8FtK5k7t
         sPY1jUUgULmT5iR2WF8lPCsCuAn09xNOMSRiHMZEJt19MBpJJAUTJUXP4BiXUy8ycXbj
         QKFi04fS0fXVTgOSIG79AbPujgDTae1MpwCVGTg7AFreh3Bve9bRAZ5F2Qcw/fabJLGl
         3cJrLLqwUSoPkBwq1WhzkEz5lSf3VgZ45Ls7jgbY9RvVtsdxpuGXwLJe/uSBx7s1oIIJ
         8C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQ2i0L58d+7KMPuRIFLmZb/rPhz/cXFhasTrmyO6ho0=;
        b=SQTtGM53mdi1V7cHus6Ptz4WcJX7y+VQrIvxnxV+qbrHVY/AUZOY9JXu8DOpqTsX6B
         VuTzv0sVvApe7lT/GQ0SfmIcc7vX/3WLoYNr7WNNT9ebv9j+u0ED5zdbbejvbKAMwvKM
         q1ns2wBv6659mYWfra2ORSwppQykyoiFbWU4oRPzZ6l6sP6Qc3aQ9V+2DF+DfAR7fqxz
         hBJaudNTvwGk3+7lDIBSERHRWNXq9L4roGC47MzHw263UVY1WBsCclsgyL/xPcKGVhYy
         jPozB7igFtdpHfS13Rz90fGO0v3MBWdXpKcLD2Xq7YrLoQ7IQ/HbtdG9HsuMnhV7fxMT
         nwHg==
X-Gm-Message-State: AOAM5301LrjP5+ZgrRbGGN+dBiXGJDS0fu4ZzujPw6hzgnUIkMT23A5X
        sgOheIPbSmiJoA6n2Yhvertgq0IZ2n4dHZ41ZdAiFg==
X-Google-Smtp-Source: ABdhPJxbKhcLoG0ToKxmRLd5mMBCUaRqmShc7RGPDLTlcebPHKMOO5TDocNfclO6tFaq25QQCEE9W5e4geThswLk1ps=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr31529927lfe.29.1609772222231;
 Mon, 04 Jan 2021 06:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:56:51 +0100
Message-ID: <CACRpkdZzy0a9n6NTxMj049=AFYg1UaCX+HYNqbLLXnpkhfP6nQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] gpio: visconti: Add Toshiba Visconti GPIO support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2020 at 6:45 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> This series is the GPIO driver for Toshiba's ARM SoC, Visconti[0].
> This provides DT binding documentation, device driver, MAINTAINER files, and updates to DT files.

This v5 version looks just perfect :)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
