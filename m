Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E086B600ABD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbiJQJb0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiJQJbZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:31:25 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C18A49B7C
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:31:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id sc25so23455301ejc.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XLVcLpyTW3hYyAvbDI66HfSdH+CV6t1oRyHuEEVL8k=;
        b=WzrhIQONV2yqOXtsG3DhCRSqwLdBFRuisyqA4vmLTYFWYfYQAf1RAasKeyTn5aT8l2
         sHOfEK8NIx54Os01bjJNSrbCP0gudEBObtLOiucvaDzIKrdyPwoVG7XgvdzQbCHhdGW1
         AxXGhqAVfJjuR6ip2EV9KKQKbqXpptmCOdRf0++1kUwWwzNowIqHpd/ZxBHzWiUFXUVn
         bKtTNpq5eugJFTxVawdUcjZ9H2qKl6evtu2EtZ30kwyof0zr53/mmdv0ASvrLZC/VSJ7
         Ly2EKFJ2BB+TCzer8Maa27M8yXAyTBpmyz/Os7ffQu9s++pXpGyaf259huuzllavotly
         rH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XLVcLpyTW3hYyAvbDI66HfSdH+CV6t1oRyHuEEVL8k=;
        b=ifNuMVFX7q59+Z4kSm9j1yDuA8k1yvr6th+n+HzbUxbg+E+dGdD/1oPjtL++G6Drkz
         8pg4E41F1u/o/3d7unM8C7flGBrcCqnR/KZ4Cj0DGJ1PMscEerBZRQHTmknlOw1yEO7f
         3iGmn0vK8JlKXnvLLxrG4Fejytp+J5Qo9Aox5sl0ar9qRJRBgVu0w8X87CguyJkCm6l8
         nQfR9j8sFnSFRpkxBMzf9S09vzLgzylXDW2w/hOoYgqxXYrCNVaz12oo7vGVhNyiivDN
         gu36izfs9/CrNSewWzSthnp7RJfqJvnL6n4QYgD9gadeweiSliOOAUD7EuD8/FRtqElP
         NeCg==
X-Gm-Message-State: ACrzQf0WitTdx2+pC24c3xdl54OeAUvav6h9I3MxVxi00NLysAJpANGw
        La8Hjt7Do6Wg7OohqsozV3KJ5TeRgx2I6mKKGmA7wg==
X-Google-Smtp-Source: AMsMyM6G1c3vhghVFZehisdpRiti+VaiidpH6kvYQnFU0ch7LzevazRYQ+FcrpSkkJTAnVXaQKPR+32adlK8NBMWywM=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7488608ejc.690.1665999081191; Mon, 17
 Oct 2022 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yz62XmiH8YG3Dtsf@orome> <20221007055936.5446-1-pshete@nvidia.com>
In-Reply-To: <20221007055936.5446-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:31:09 +0200
Message-ID: <CACRpkdYkJdZ67kyTnDg3xFzO8MJhC0nHK98O+KJwCLBqV_5f-Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tegra186: Check GPIO pin permission before access.
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     thierry.reding@gmail.com, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2022 at 7:59 AM Prathamesh Shete <pshete@nvidia.com> wrote:

> This change checks if we have the necessary permission to
> access the GPIO. For devices that have support for virtualisation
> we need to check both the TEGRA186_GPIO_VM_REG and the
> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> virtualisation support for GPIOs we only need to check the
> TEGRA186_GPIO_SCR_REG register.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Very nice patch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
