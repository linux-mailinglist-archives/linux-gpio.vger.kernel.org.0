Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4876210ED
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 13:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbiKHMil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 07:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbiKHMij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 07:38:39 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02E7DE95
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 04:38:36 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a13so22310663edj.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 04:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp912HVrz8PqeqrIKxFaWb4AiWSWox5YDDgMFHPmw2I=;
        b=fT8seVgK9bU5hhV0c1eskjhpB0FevCgnCy8pftrVzfK70NUDvTTkkxCeovS2keCrBJ
         simvZinIAJkgm2Khx4iauiUiibeXXuG9Vb7yl4wbFJaVe1QzMFUMIg19/on4/8m/McMX
         txrjqg8xGkRMBzaI/bz2OSVvTSgGYrZuz9vR0d2sdAR1iE8zQz/DrjwP37B5x3iYHu1z
         HAGgFXeukgLNzMyQrXNydxssDT4f6oLGYSG5jXVbNN3jkyPAt8LyWhFbn7x5vGl/bpTl
         Eu5hlMX9BdB/FEwdYk4nfL8GHlN/4PNMIpGg/cKlo/Vl0sqlQd/keitmwcFeQB7n1+hl
         dDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pp912HVrz8PqeqrIKxFaWb4AiWSWox5YDDgMFHPmw2I=;
        b=J8/y7vdtyrHSOja8RyhY6KYQ/z18xesVSxeuW7JIdEHba1I9qRJYz675UYdOzEuD6E
         /Rf8u53EBl4xTslcSPwr0/09ngoGy4k6TZILMyWdeRdvdACjqN9zHopHFhKIJbdsqGxY
         7Mki3SDw9cF/vqf43jkgAZeopqsP8TPH00kT7pVZKMGFQi8xT0V8+Jch0z4hT8zSkU+9
         dNpD/3DuSZcZ/Z/ZR3+rkaBwN+zlvvvrQC6/vKn1ChlCWwxNOniVAPwnJDczwQNZHDB1
         eQZGlaXPnwqJgdj/j596jTLPvxHrRQ/lFAd/Qr0RVQuuiwkkrMofgaQrmmcRNqdjFGqu
         Sceg==
X-Gm-Message-State: ACrzQf1i61HMmC+nEvspg1dO27nixHMmPoc9BFIvLs0O35TzYaw+weJJ
        DmFLgarmjd50fhFFGyF+tBRVC8n4uxGdDMLQeAxkog==
X-Google-Smtp-Source: AMsMyM7s/Ou7mr76f9+OCLr5c/BlN+EsbPvkdWYDvue+wN+/babtSWv5nwImIBMViqAKc+ZB57fZdWwcRbGv9OqMtWQ=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr54220395edq.32.1667911115139; Tue, 08
 Nov 2022 04:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20221031222833.201322-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221031222833.201322-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:38:23 +0100
Message-ID: <CACRpkdYkhvChags5H7zT3MOzUTqxPzpEyg9fVpckBOZVXwG1gg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
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

On Mon, Oct 31, 2022 at 11:28 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning for irqchips that are not marked with
> IRQCHIP_IMMUTABLE.
>
> Convert the pinctrl-wpcm450 driver to an immutable irqchip.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> v3:
> - Switch from raw d->hwirq to irqd_to_hwirq(d)

Patch applied!

Yours,
Linus Walleij
