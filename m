Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA11C507C8A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 00:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355128AbiDSWci (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 18:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357945AbiDSWch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 18:32:37 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F0B63FD
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:29:53 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id i20so33637409ybj.7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQv4N2Tnm8oWMiODXD/PDbzuuiQcK7iithu9y/xHS/k=;
        b=l1zRidnLzbrPyaF9/UwdKtwiILAQGOym7YHdcJ/rN4H8CZDpcCJk2QWun/x1T5THjP
         ltDTXd3BBkpKWx7sOTTjKyvUD/KGgiF7FUVg9k/awqYCu0IlR220ZyKULrbl21ueX+VM
         7R2DoJGtAsmbqcfgfXbM7qNRrBykhVLyM2vW84TZRn9d52dRb/HK39SdMIVkIA5UK7qZ
         hxZZc56FcqsAbzu4XqjpwTBX6HyQse+dXRoQyYVIGPYNqY75UqqI/L4z78s4P5Q0c5pS
         Y3hgUZ0vAkErdnyU2ELiJF8cOnjjwLG1eowrVxKrVbYA6cMmhbfy2tZK+lGuZycuGOll
         JpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQv4N2Tnm8oWMiODXD/PDbzuuiQcK7iithu9y/xHS/k=;
        b=TRuRgT/AGkofMc0e/lAFUboV9zzi2om4M2hKfcj4wshVATbM5Cei7eo5H9MNNK7RyV
         TZ8Lw60S3JpBvcRb5meKFaE2liZfAg8CEFVb/dawtQ76RzI/pOfDk2oFgWtx8mE77LzL
         jPfmWcsT+FfjFR8mLzaaAb0isv4wYBWvbZkCPUBsHPM5HrsHIHQPngC7t8Sw0DIHDjoa
         rivtiBdC6c0jUfwd2+jUR1DrXquhURyxpjoqLqMefquXOLRL3AEu2JPtSRAkjomzxLil
         +HsmTERBhjhHix3FW8gV72gAvGyM8j5w8gqzy5QPYngu3lV75j0VeSU/J2zduLLINHrw
         y84A==
X-Gm-Message-State: AOAM530jGZZj6TB6A39Hi/vuaJToEOGTfC6bUxeehtDZH71e7R9OYu01
        +7h2mKyt+I65BMRoEdBtJI75kJucL1oSM8lf9ONu4A==
X-Google-Smtp-Source: ABdhPJxHny+R+bChDEsDA4pj7hKzDQP8GXNpdc4vk6kKi7pUgOgnlGFEJu7EjUSiG2/dMIrsgVV912HOlARa7LlxyiA=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12625679ybh.492.1650407393156; Tue, 19
 Apr 2022 15:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220326192848.2944519-1-michael@walle.cc> <20220326192848.2944519-2-michael@walle.cc>
In-Reply-To: <20220326192848.2944519-2-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:29:42 +0200
Message-ID: <CACRpkda0zA3By+TyQLBDZW6vQUMfwUu1_EvNq8rO_cB30tMcbQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: ocelot: add clock monitor option for LAN966x
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 26, 2022 at 8:29 PM Michael Walle <michael@walle.cc> wrote:

> The SoC supports a debug clock output of its internal clocks. Depending
> on the clk_sel input (GPIO_31) clk_mon (GPIO_30) will output either
> cpu_clk/64 or sys_clk/64. This is very useful for debugging and is
> missing in the pinmux table. Add it.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Patch applied!

Yours,
Linus Walleij
