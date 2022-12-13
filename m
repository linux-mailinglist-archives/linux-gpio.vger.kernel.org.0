Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570DD64B20D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 10:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiLMJOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 04:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbiLMJNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 04:13:17 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE7C1A23D
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:11:36 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 2so8423990ybl.13
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWtXK5Ov2tmRxbRitJUSXKWNn7yLSZpO72wnDP4qzhc=;
        b=fNTBcwxWnVHLBSHknw5pSUYAmxKPFRhFiRIS0aWUXeE1sIa3NVrBuUcZcR19hMBQg2
         yiJRC3LxFyjSVhDbNnnhdNN0HGQqIoCZUMjvDFheyEDpVafUFF6z1uwJTcqBD3Dnc1w1
         xqhN60TlS9XR6S1oJ3IEvwAKmPce8ofwQ9B5TzD7LjY+SH2lAZjWoXnFV4bVQ8nkebls
         3oN+geDhvYU+dY7b3nGkNiVCnJTbPNxK/Ubuv2DflGlngi7DeDdm9NIjCiQ0AMqzd4Yt
         SWjb+C1ewkPsay1c/1yO808o04cP/svT6nsW5vT6ypQJYJkQv54k+REt93VudclU+XHa
         b3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWtXK5Ov2tmRxbRitJUSXKWNn7yLSZpO72wnDP4qzhc=;
        b=G6PfSoOdZ3A1X66/4GAI0bi+VaC8oTGHmInsU3RhSBPP6/O34wzVB/0h+fwExW6D/u
         N1vOmuCZZ9Ycf1kgStFxj5iHHKG9bqfc1OCoHkGuXcZS2ZNGvS9oxoggX02Zj8tsM9OV
         rSdNyQaxzJ7Rl4khkZsMYCXfABZBkICFFArT5Z+XfTOsNQCbSqUJkg2GHfQY/pe8I+e0
         KU/RIgA6/BmFVNlqw935VyuulERyg6bkSuWY5q2Ieg6us9EKc6eEZ9wMczm1Lx7nSmuN
         kS2MhsqeHzjz9gqHLEM7tzmtGnSoauykquJL6c9+e8TBouNU4dCPT+nJJjGi+q2B0IIA
         fJ7Q==
X-Gm-Message-State: ANoB5plIHjm5RvM0Zc2WbfrQvAWFn4kxxDyZq5xu+ZoUnC4MCm6WvwiY
        FjzH75KBPI87XmlhVG9AvlvaGk+YtjEuEORxr3MG9A==
X-Google-Smtp-Source: AA0mqf7ZDyvIFtaBydE3ESKDGr5yQYNJfQy9a1Bbm2iQeKVR679fx9GEkEIWw6ha9Yqu/bYTpmLtsvkqUgBXgiee3Vg=
X-Received: by 2002:a25:ac2:0:b0:6e9:3d7a:8012 with SMTP id
 185-20020a250ac2000000b006e93d7a8012mr70473054ybk.449.1670922695285; Tue, 13
 Dec 2022 01:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com> <20221212103525.231298-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20221212103525.231298-3-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Dec 2022 10:11:20 +0100
Message-ID: <CACRpkda_5vzL7oEpXBBmou+YOzvHVqrtYhDPZ4x4kQYhoSV6=w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] gpiolib: Add support for optional ramp-up delays
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 11:35 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> These delays are added when specified per GPIO line and GPIO is set
> to high level, including any active low flag.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

As stated in the binding patch this can be considered as a global ramp-up
for the entire chip, certainly there are not different driver stages on the
different outputs (in that case it would be a pin control driver BTW).

This is created to swipe the details of random board electronics under the
carpet and this doesn't work because we already have consumers
such as regulators specifying ramp-up on the consumer side.

Yours,
Linus Walleij
