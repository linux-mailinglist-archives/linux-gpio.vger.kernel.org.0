Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C066350C3E2
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbiDVWqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbiDVWqm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:46:42 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9972D2D71C9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:37:06 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2eba37104a2so99047007b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O1brtd49tFwU6VlKDj5lc7i4Jw60+UgK83W4qk+h+e0=;
        b=XmIyifA+YpSofgABXPeSSRBcyBPBXndpAol7TNCDT554ScXbKEZAGvD8TXYYTomqT9
         b1YgxnQtXAnla4d+aH4p7J7sUz8LS4gj00UO/+UgEyJkk4wt3eWA2/f9Q/Mman2yKB5g
         2+qB1nwco1Og0RxqJK+kfROBBCxGPhj6XC7UUwURBmzFCN7l3rpY2NLq8FnHtN+CetHK
         3FEliT9GwLRCfAMRKaPlKBFh01G1mYUZla2ux4cNWIfhWPogxM3DxBF4nDtHQDgCk13d
         JQ5ekbGxRAFBNNzbit2lZnRMqQVTGY94IfQnW5SbBCm5qqSOlwRzABfF5Uv9l9bs2VN3
         CLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O1brtd49tFwU6VlKDj5lc7i4Jw60+UgK83W4qk+h+e0=;
        b=jI/7ureg9YNw02Ds2n5mk4LM2DwnJ4LN67lckNtRuvxjC4wIdWS/zuo0yLbPIzBt/F
         GJn3HfEmrwATZTM9XODQ60bjqvIt0RUx+joE7CPDUhOe48W4CiC5yAcub2Wz5UfoF7eX
         tlviEBvGxV7lvz0GixU2VLX8bQjDOBAr9htqWpFLRpwy2wkrryco+2h+fhDEs9xS7sDv
         h/AoGO5lACLbTAlf0h6KQPnqPOsM77hWufpdPCZNlmcvuvCq1vU9pQ0dm2abh4sfIxVK
         /ENEoloKx0l/jBVnY94t+bXLcaBmkr/mfRcQvj+G3lr3S3EqfZ+Ba9DGoODR+TH7nS4Y
         ZSvA==
X-Gm-Message-State: AOAM533Z1zk6AFINLpnp6eGgnQty21xrnE5TDtd1vb2RxcaAAM+7E+iX
        C9n0+UVdXRuetfkHDmaU4mcwy3Mk436rFTPh/+V56A==
X-Google-Smtp-Source: ABdhPJzpJm8aFbRgP7AYh9JTSDrohue4rzeBHmDncZK7KYHl1Wq9GHZoH62A7GncOVa0KRpQG0mu6FKnr2J3pJbFF1w=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr7027734ywh.126.1650663425930; Fri, 22
 Apr 2022 14:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420142432.248565-1-luca.ceresoli@bootlin.com>
In-Reply-To: <20220420142432.248565-1-luca.ceresoli@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:36:54 +0200
Message-ID: <CACRpkdb51a=kuudD=g8ozzmsHdgHzou2gA8_zT2Ex4bds923cQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: fix RK3308 pinmux bits
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Apr 20, 2022 at 4:24 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Some of the pinmuxing bits described in rk3308_mux_recalced_data are wrong,
> pointing to non-existing registers.
>
> Fix the entire table.

Patches 1 + 2 applied for fixes!

Yours,
Linus Walleij
