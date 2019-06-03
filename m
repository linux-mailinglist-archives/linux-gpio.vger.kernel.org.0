Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A737B33BBF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 01:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfFCXHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 19:07:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36555 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFCXHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 19:07:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so3283175ljj.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NFfbp/l7iiiVWginEhWa3ckd/womtHkaNdf8Bm+794=;
        b=WnjU0E/rAfa9vZPRfObu2NgpsAHWsZFHvUV69mxl3ei5E4u3wUqLrcOWCZxid+etwI
         idPmXKgOnv9LyIDizXMxnkZQ+rv8mvDL6cTXNKkn9o9jIgCoa8xNvnMpVupFnH/DBubR
         z7Bbbdf/rBN4ueBDUCIbsmCasr1uaK8BDfV164NMFB9nXdq4W5H6ci7QmylT47TohsdZ
         UhPArasjBBa8E/NXknmNzB6UoToQJo50DzNz5SA86P600icvEf8/0jXCnibqqjJHvO8X
         B8hbGJOYCQTjKJyEJew5yq44nQGuynbzdgtPWt1JdD7FsKL6iZSbeNyy+BXMW8o2lh3H
         3xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NFfbp/l7iiiVWginEhWa3ckd/womtHkaNdf8Bm+794=;
        b=PnxcDwltQXLePIdV4SNPCFoIVD2eTudwEx0NUxmdFjOcAuBCLvZ7t7NU5i+j5/e62b
         uWwOL5XH9ad9hes77ampmjFx5/p4IlXi2KsHIUOnbMHI9OyaCT2RkIusSX1xAN5ktXq2
         9uZ4UYhyteDbQlShBtrQoutG7emeeKHpL3/MVEZjGy1P4dvNsIhOUnCgnC9OFXwG1Q6g
         OMf7HgYC/2GcRivMjNAjdi7npqRm9/48ew+J++Bw5PetJ+AwGyvrX6z4XfBL8HMhMubq
         1DVxWBy3TXbYkol2CFseNCLFF2NJ4PZcjG30ESIGK11RLz1KY3R3H7ATqbTfcqL/JI4W
         LhRg==
X-Gm-Message-State: APjAAAU4Uzx+3ORqkGWD9lTjCwy+ue5ox+mekG/2wHHu+ZHemd/BYTiM
        PnMfjrh8rhkupYl9dV3eMNX3BIiEc1iw6O/YuWNyTg==
X-Google-Smtp-Source: APXvYqx/DD8LnqDfO9YJiKsu3INvZtWWGhNNb2rLcK1MCFxZlVhpM9tSmP7auz1Iw4f1nXvHBAfBzZXk3RUmWeEQt6U=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr8048502ljg.165.1559603272528;
 Mon, 03 Jun 2019 16:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559601789-27121-1-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jun 2019 01:07:41 +0200
Message-ID: <CACRpkdYPHw994Ov0xCfK6tCg60tiuWrRwTcYpMSfOr4G0VKu_Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1 v1] ARM: dts: aspeed: Add SGPM pinmux
To:     Hongwei Zhang <hongweiz@ami.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hongwei,

On Tue, Jun 4, 2019 at 12:44 AM Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                             | 5 +++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++

Please try to separate out the change to arch/arm/boot/dts/aspeed-g5.dtsi
into a separate patch that goes through ARM SoC.

Other than that it looks fine to me.

Yours,
Linus Walleij
