Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF642D9486
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439535AbgLNJCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439533AbgLNJCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:02:46 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBBBC061793
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:02:06 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so28211275lfd.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7gw/JKcedbcbsZwWfTxV9h1NBzBz2xSdjArgBt47FY=;
        b=WIy+wdN5lxXjhzWSRCsGIRQ/FvjPCq2eE4e/RV8zdXhIGPEGF+/Dygqmnulqs2h0oy
         N39B12UanCXacWSc66RvefD94HonfQ58k1NWUgKUKXAY4zpDQWmZvKBj2W5pKXwo6MnF
         x5FPL/HMF/C854ApS3GWH+di2LmuWIV832VXVJxSVFqa3C18AkaomEYHXeXemsM3TPxS
         taxqysgYJxMEsk+r+3hsfGMKVQZrkFWoWAA7Jpie9ACkrJQNQSOD704OWnUVXLMKGZsO
         wLziKwG+kqLlPfC6UJiTmTvZ0hzRWRIMrj9nolAASDlfjotDFLZxTgOzrfJhpsSn5TEM
         TqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7gw/JKcedbcbsZwWfTxV9h1NBzBz2xSdjArgBt47FY=;
        b=RpA77UPSB46G+IUuQfi1S7MZRnMx++3I6+XUtPEKsX7I5PRKorIWijxE0KUBSVe/Aq
         /aSATMzsLR1hnSpjpDm7kP6rREqgluOCi3kkVleIpRzf8CEEViW6MbEoYKbDgyYHkJm5
         0gn6h1eSVnYHpRExKXnv4ieRxu1gNAWDX9daeqZxFK/s5C+EyRLO4+4FGqpVafxTP4Es
         Beym0cZxcYOiwei4TvC6UOrmBSzopxaWUGvjlKqo8s0LDKTKlpFjaqLFV7/bnJvn14WY
         ktcD617KKqyCs+QVlkQQaXISI0CFgc32TOl48oGn4CfHcD/wTp2t/okriiT8SyYxWgIu
         FIGA==
X-Gm-Message-State: AOAM5327oTM4Rvi42Uk/Rhy4M9YaL9YQXm8O4z400pZMAcCzgTHvkreW
        V6YWrcf4RGZnOk4cUXZZNX2HwHpW4Vk3N8NgYZ+4DJVxoVl97A==
X-Google-Smtp-Source: ABdhPJzcfW5SBxLhGM7ZnE4/gbP2E/5QbU94LqpZXgLMKTebXCXYm5Ux1pgYsFxkEX42MlFg1Dig+zvDzSrCm3pQeTM=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr1240953lfq.586.1607936524573;
 Mon, 14 Dec 2020 01:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:01:53 +0100
Message-ID: <CACRpkdaAd-wJuqspYTuj4RGTyJgobX+6j=5ZWWSCtdLLMnPoYw@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: ralink: rt2880: Some minimal clean ups
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 5:17 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> After this driver was moved from staging into pinctrl subsytems
> some reviews for bindigns and driver itself comes from Ron Herring
> and Dan Carpenter. Get rid of all the comments to properly be in
> a good shape before merge window.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If Greg wants he can queue them last minute. Else I'll apply these
after the merge window, no big deal.

Yours,
Linus Walleij
