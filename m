Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C1A66BE00
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 13:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjAPMju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 07:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjAPMjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 07:39:49 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE631E28B
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:39:47 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4d59d518505so209582547b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21EV7MGKC5QObOMnPy3UW40c0DLw32rJogBwJT3MIds=;
        b=zZehO8ZzFJKe6Z8JfQ+jziUUss6hBb1odzJ7fSddRhyWsBKi3p7AC67YQgHqFDmX03
         CYAcsix0MeJvzcfJchvoN/gakM1Euc4gGhUVSMfZfV+25PO13Mg4L58wBN4OJwGwq7Hl
         BzKHo1qXV0ccwQMyhCx/cm6b3CG3Ui9A3iCG51KiSrCp1d5ZYjaCr2lyKloFtlCUHTov
         C+MxNWkrYVM72ArBXBvQ8giE6pLX6/2gy4h53AJrw9Hu8MnRRnOm42b74eA7KJcxGdYz
         PwZdI6Zq9T7c2t8RiugGsdy/emwL6vN/uXyQk0Z+MlHVSSJlYneQblKmgAA20T/Y7chi
         Eocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21EV7MGKC5QObOMnPy3UW40c0DLw32rJogBwJT3MIds=;
        b=Y7gtrJ5dpcrJQd2mzTHyvsX3lWcHPBbFgYt1eyTvZb257k+GG4Oi77jWPp6nVIlJQv
         4zanEb8lTTw/7ov7qeGRFGRqiNX2rcfoHayTF+XssnrbYUZWP7oeJcJ2/1EM2EgolRRB
         mDSnqJgx01UHS0H283J6WEWB6xYOj/Z1+WX8cApFRevbM0HNoGoAbxfRk9alha94TyP2
         jemgB0JhO35z3SZ9olmTn0XseRhGJZE7nEv/gE3ORH15Y1TLbRqye1xJLPT633BM1LoV
         MKwsmGs5gdML41IFYlYXDqzgrlm7nY3jpgkqX6GYOxwugsEKB3Xwkd8L8fE4UcTIBp1K
         Av1Q==
X-Gm-Message-State: AFqh2koQxBhwZFAAtp946acTquHQZ+nY2HxhvJOOubjjhANGRcotaY6M
        5dQ5LaD7KBsJ5XLeocgjn0d72vJInnkRytLob1aGGmpQO4mhHg==
X-Google-Smtp-Source: AMrXdXsHbKcpLGxxCwS2tNq4ORQ3SaOOFWwMExjuHj1/QZaDfCO1C+FG9rSuUZs4REjmxPH5L4xtiVgoWJ8OxgrrLdA=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr4504610ywa.477.1673872786348; Mon, 16
 Jan 2023 04:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20230110084636.1141740-1-jonas@kwiboo.se> <2023011017420455469534@rock-chips.com>
 <DB9P190MB1594C0CEEF186240558D58EDACFC9@DB9P190MB1594.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P190MB1594C0CEEF186240558D58EDACFC9@DB9P190MB1594.EURP190.PROD.OUTLOOK.COM>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 13:39:35 +0100
Message-ID: <CACRpkdYRr_WDC59LC3iGqpTEcyGErdyCBLmB4Ox5ZQH3M70Lgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix mux route data for rk3568
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 11, 2023 at 9:42 AM Jonas Karlman <jonas@kwiboo.se> wrote:
> On 2023-01-10 10:42, jay.xu@rock-chips.com wrote:
> > Hi Jonas
> >
> > A patch from https://github.com/rockchip-linux/kernel/commit/55aa440fb85377a8b8c7e4bbc367463c235da804
> > can you try it ?
>
> Good that this was fixed in vendor kernel long time ago.
> Could have saved me some hours of troubleshooting if it would have been upstreamed to mainline :-)

Hm hm some technical debt to pay off here I see. It happens
to us all.

Jonas is your patch identical or do you want to send a more
inspired version with more of the fixes from the vendor tree?

I'm certainly not going to sit and wait for the patch to come
from another source, so I would like to apply some version of
this patch.

Yours,
Linus Walleij
