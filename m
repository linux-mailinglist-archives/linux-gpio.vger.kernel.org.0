Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1987339891
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731108AbfFGWXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:23:31 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42350 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731098AbfFGWXb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:23:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so3007132lje.9
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mKQ/jkVDmHzG3Imk3QoYm7ZRsrxgpBXEW32JYoXBK6c=;
        b=b6Uttyul57zhK0WLRFY2uElrt+7RjU0A4CqB86e19BlOPEOButGb8d+RfNG8TmtLB/
         hBYKaq1+NEQfc2TXYpAX9tB+2jG8DNuaZf5sdL85L4+yBSSqlQ0j0efAavrSbhlJ8QM9
         dnMVqvx3u5kJJXi+BuQLcqU3D1MwwvOPoW0lo6mYfxYoE5VsfLGSZSc0/bMEdRBNrPHz
         q99sHZs3QMahC9tKZJMU6C40PoGzO75S325tIkzoa6Ewy2EOI1HUtO2aG6v6ukATbBGP
         PgIbNsEzUVwnw8k8NofrSWHlXcShNIz6Rp8GGnv+pA+JAaq3n0yRBc5FXY92rMC7E6lW
         iOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKQ/jkVDmHzG3Imk3QoYm7ZRsrxgpBXEW32JYoXBK6c=;
        b=rvVNatz3q4G/izjc0Y0oxzRdZwzGZNr7bQ1oih/oi8pB6LyWE6KIBqu50fGqLmzNAM
         VokJLDg3NGzQh2L0fwUeIWPCBiiLa+x96jtioUipGgEuy1dnIgg33PcCJoXad9fzddcU
         UDm4ZFKkzItxewwfx51yhtPOqQeeiIGLTsVECxBbhx7AfcLA0Yvn7EoUf25nDqL4gwVp
         FLQ5LhBL8e+91IVh75PNgQzk0Qv3LmaW+ZpGfkRbTqJ7NMagnLhnkQZH6Jn+q+E8dtP7
         Qavi3O3KKVco5Mk9V9DyZI2sT9t8HaT+zm0XD0erP6aqEfkI6ZeXUyckpUKQKlEuLbCT
         bYtg==
X-Gm-Message-State: APjAAAXsSQDVR3nnZmp6eIqBLYUCn3itQ5xX1U0RgjBzG40qYZAkae5A
        B041L0wgqYaPLP+oMNqmqFM5ZVZgGFZ+1I9o3lXf97mE
X-Google-Smtp-Source: APXvYqwB2qJJmkpZg21BBIfS3DEIvPDBmZVSisAyl2+8KE4YGuHY6alNrysBJaP17ZsV+0U5Xx/P5PNamh/WkwZKcrM=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr23337666ljk.104.1559946209241;
 Fri, 07 Jun 2019 15:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559685212-15857-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559685212-15857-1-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:23:21 +0200
Message-ID: <CACRpkdb=NBkqG1qi6F66pcd7UaxmpT9LFVLaCLFrM2SXDihJng@mail.gmail.com>
Subject: Re: [PATCH 1/3 linux dev-5.1 v2] ARM: dts: aspeed: Add SGPM pinmux
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

On Tue, Jun 4, 2019 at 11:53 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Patch applied! I altered the subject a bit to match the change
to the pinctrl subsystem.

Yours,
Linus Walleij
