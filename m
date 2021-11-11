Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A41E44D934
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 16:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhKKPeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 10:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbhKKPea (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 10:34:30 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC86C061767
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 07:31:41 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id u74so12181053oie.8
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 07:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8pB+WwRzjj1VLddfWPFnbpX1zEu/AXjp6IsntdVdc4M=;
        b=eVfYB5znA4+u5yoC3kq22eC1l5Wk36GwHpTFQmVXZ+6Wi+IGQQecl5zjDn5PbwLebG
         9NHQW2rnKHVfOfkkaCicef7RsP2uCQ3uaHpeNbs8CuQklO+liFDFxf8YCkkK098I1lms
         6LVa5VMuACMj7YYOCiicFLyVA11JCk92IaoioXkwrVxUkIuiT5fI4BcAWKbiKu9Wf+vs
         OlvtAvy/c7q3SnQYWw1YHaUCqAuQdqCRPiuCs3gCnSbRbM0TMH4LcRsyQLHrTiRR+o6E
         hG2jqomYCTG9lyC3nK0iC2K+lbj+FPd/WIUSUasqzzxuFnnc/bsC+ksk+rQPBWpRUMMY
         RVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8pB+WwRzjj1VLddfWPFnbpX1zEu/AXjp6IsntdVdc4M=;
        b=pywSIfMXdOV4vaYgeu6zAp/RJv9vebkzu7Gm6Lbyjwd4bMNL9tExl3VQVBnaCQMydS
         LSTZycYVJxL2ZBJzLF+KWEkQDgXi9fsfBy11u4JOAcH3iG6ulY0IeOzllhWu0i6v3MMV
         fNZ3yS2rc+1bsa5XUgFt5+/nIvg/26TpDCB5Tu7I5z/fERUrtTbXyylJDFpmu7TnQdna
         d73rQfsRQ7WZY3lbIH/0xVrOdKFXI7MRl6oq2uYkl+47F7RJXL4q1cxW1bDKEfq8I+qw
         hJuwsNTRet1ccHxGyQPUDMaUtvsC3cjJKe5ZJso2sP9f6qdoi6wmcjF+pv6MK8M4hh48
         bVsw==
X-Gm-Message-State: AOAM533UIb4J3v+AF6JqRpgvEk5VVGlGPWdwU87u/akn6kx+vHrjAMKb
        +IK1QCA9O/M8j4m7wrQEb01B0inA6bw7bNWYI3B8XA==
X-Google-Smtp-Source: ABdhPJwfj+szv19ZdA3wyhVqNUMQ0EA+/NDT2FaE6iQd8Igj9fZrBAlPin27pfo4wMPzekrNeaOxHlxFTjTEVk+FqJc=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr6897527oih.162.1636644700468;
 Thu, 11 Nov 2021 07:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20211110231436.8866-1-zajec5@gmail.com>
In-Reply-To: <20211110231436.8866-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 16:31:28 +0100
Message-ID: <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        ext Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 12:14 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> While working with pinctrl in Linux I started wondering if we could
> start specifying pins in DT instead of Linux drivers. When working with
> DT we usually avoid hardcoding hardware description in drivers so it
> isn't clear to me why it doesn't apply to pins.

Historically this is what pinctrl-single.c does.
Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt

At the time we created pin control there was a bit back-and-forth and
the conclusion was that there is not one-size-fits all for pin defines.

The reason TI (Tony) wanted to push the information into DT
was that what he gets is a number of unprocessed ASIC datasets,
that are then turned into tables with a script. Header files or DTS
source alike, but some kind of tables.

At the time (2011?) it was unclear what kind of data should go into
e.g. header and data files in the kernel (modules) and what should
go into the DT. So the approach to put pin information into the DT
was allowed for pinctrl-single.

The way I have understood it, DT maintainers have since gotten
a bit wary about (ab)using the DT as a container for "anything data"
and prefer that drivers contain details and derive these from
compatible strings.

As of today, IIUC the DT maintainers are against this scheme.

That said, the topic is open in a way. Some people are also annoyed
that some graphics drivers just ask Torvalds to pull 100.000+ lines
of register defnes in some merge windows. The data has to go
somewhere.

Yours,
Linus Walleij
