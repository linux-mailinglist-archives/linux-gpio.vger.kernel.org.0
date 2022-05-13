Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B11526D57
	for <lists+linux-gpio@lfdr.de>; Sat, 14 May 2022 01:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiEMXIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 19:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiEMXID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 19:08:03 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC72D23DEEA
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 16:07:54 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2ebf4b91212so104542987b3.8
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7uNyZJ7+TaNFG3LYzAbirMUD+cjGo4bEKu9OQaTJA8=;
        b=msCzsb/XZaRHLnQR6GjwcKV7ZJ3DYbEc7CYntbliyw6VjYYY7ixw7AiFHlZc+Izklx
         pNNAMlyE+5PV13PbB7jKYFvxB9r8kxvMWHC7IoQkThlDpqFVfk+LPgrWw0FBBkM/t99C
         KU7eNn1q9NSsBiTOHDn3f9dxpcfd3Ri3OjeQuWvRrfUGvWjCUxq7X7rA7vZfF1S2XcO1
         bllctmzwXS+eXeeFXfvmj3iAb98agIlf6kdbiudB+qDcRPYXk+eVZPM92yi/KzDdhNUz
         sZ5w3ACTEtFfU85v08p7uXQEJTm63XmgwBP+zuQqOLqQmO2fVssF3A088F299XI4Y3Ob
         jlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7uNyZJ7+TaNFG3LYzAbirMUD+cjGo4bEKu9OQaTJA8=;
        b=Nvpw6OZ0bA+wqwMA8Au1CozsH1QcNDWUxdICH0GDBRyEV0g13f6B9D7z7Jx1tE0slJ
         tXl2E++QrUDzmNZeWbC/R3zS7wlSV89KeOYmVuX3XYfSfzOILUnC7dpvQZl88uQpB/y5
         t+a6+KUZc12b7c5ugoaMH1gjtDUlqHGcvfofymbqqbESelNqTDoQ9eYzxdgeqpGiK4JW
         r3uQTe2Id3NHEkghnUkCNftOwNhefxJPG40NCnJv1bhLqp/4j68+6IAaxMWti/PqfxRy
         QJtHUk1kTaoZEMdVLvtrtsaVNVxiwV6YgHKV7WG7IUm+v+BqCWtXZK3hKkYN3NSIqRh1
         m6yw==
X-Gm-Message-State: AOAM532kkS5Ool58xkH+MOLEEQci31aN9bU1v+s7bD4TN33XUBOLSSCE
        nw3Sx0BUT5DrVk4mfzQhUtBPWcMXbJLQnpvleAUgtA==
X-Google-Smtp-Source: ABdhPJzJXhLBhVXucPYDWCcm2l1jbUwOBPd9BYGwOe67dxsApMiUe8q6RhiHgCi8xsJpw1EECBr0rLgKTXHMAPnkv0s=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr8773559ywh.126.1652483273949; Fri, 13
 May 2022 16:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220504170736.2669595-1-andre.przywara@arm.com>
In-Reply-To: <20220504170736.2669595-1-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 14 May 2022 01:07:42 +0200
Message-ID: <CACRpkdZiJqGK5NRCSWMuFBFRHOrCWyqGmuBQZ9jyvxbcsjZsgA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: f1c100s: Fix signal name comment for PA2
 SPI pin
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, writeforever@foxmail.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
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

On Wed, May 4, 2022 at 7:07 PM Andre Przywara <andre.przywara@arm.com> wrote:

> The manual describes function 0x6 of pin PA2 as "SPI1_CLK", so change
> the comment to reflect that.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied, thanks Andre!

Yours,
Linus Walleij
