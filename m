Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12006B1C83
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 08:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCIHiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 02:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCIHi2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 02:38:28 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1589497C7
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 23:38:23 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-53d277c1834so19257767b3.10
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 23:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/LUZgYrR0Ysr7+Ej1P1ngFsSFpgqj0GwvWlQto+e2M=;
        b=lg+58u/rcX6KGQPiFTKChAzbGLROJbQGHgi2GeDH7tA+SuLf7B3lMURC2xAV8tmUjs
         eL2AYYrAMAKfw2GJ3rS6E0e1q5R6/WxLffLj03MaSglH3QcPM1Tgb26jkddhQKKNnl4K
         XABYDocIuff0tU/0kshegshi4OmkMUyV9QUjGRSJRWxKITpJUFX/W+2FyctkX5jRaCyP
         8HV/cIQ/36vQ6MOiSXmBdwamKtYvRqflEgOh+Nv+dekd0vux+8t7uWNBFIAEp3dJBCCT
         VdHJtm4jZAj8lZrxiKnV73HizqZ7rM4JMUTWXbE87bJGcluA4nOMrruGx6KP9QPRwL60
         l12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/LUZgYrR0Ysr7+Ej1P1ngFsSFpgqj0GwvWlQto+e2M=;
        b=TaRG9heYkKhTRrTXJCvyoEPtUyC/A2WAiS1Qq6l0iSRaJnau1NBTBW8YwRpwEDF/y/
         vDorxCv9BBK8Ca0qXWW5gdycMOC5WtDARScCi52wqOuvQ5/GiEZZc2L3O7Y2as8DzNye
         gM+ESglHR7idxdm42roLajoKEizhZxduRBa94bGmyuqC4AL/oizXSCj0W/qbGqMrQP8v
         ZKqNvmFb1uhCi82hdixSeZIY2ZWgjrxzhKwCP9ibkcZkPplfvAmkpX3T6oKXpc0gOQL9
         2+2VqeuR5LVxXd5OJcTCfs09pRNVYkHKx/SRLuaL/JTceV3fCBXRYnsr+yxGERH48Q2a
         /yrg==
X-Gm-Message-State: AO0yUKUwkMtiyJE2XLeBnOb6hT1GJDFyvQJrw5JzJ5EkjzpZviqhezXg
        LONfTPI4/dGk0GB+4QsIOZvN7B0+JPubPsrZUxYgnA609cGv2CO8
X-Google-Smtp-Source: AK7set+9L5i2dic4vjPaEUChT97wsmBnVt2hJYHC48czJtDtf4Yau2W0U2eTlSW/M6bcbCj5zYcbrf3yuIFHsYNbXWU=
X-Received: by 2002:a81:b615:0:b0:52e:c77d:3739 with SMTP id
 u21-20020a81b615000000b0052ec77d3739mr12131466ywh.9.1678347502993; Wed, 08
 Mar 2023 23:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20230309050855.3311834-1-joel@jms.id.au>
In-Reply-To: <20230309050855.3311834-1-joel@jms.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 08:38:11 +0100
Message-ID: <CACRpkdba--WpCGEF7jF=oWowps1JpieoTo6UswcCZyvs2s5z6g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Always register the irqchip
To:     Joel Stanley <joel@jms.id.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 6:09=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote:

> The driver was implemented in a way that made the irqchip optional, if a
> irq was not present in the device tree. However, all of the device trees
> have always had an irq, so the optional-ness has never been used.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Linus, feel free to put this in your immutable gpiochip series

Perfect, I will merge it into my v3 set to help Bartosz avoid merge
conflicts.

Yours,
Linus Walleij
