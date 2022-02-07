Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5374AC1FE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Feb 2022 15:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241536AbiBGOz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Feb 2022 09:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392556AbiBGObL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Feb 2022 09:31:11 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B18DC0401C1;
        Mon,  7 Feb 2022 06:31:11 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id 60so23177718uae.1;
        Mon, 07 Feb 2022 06:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQgv4afEeE0oGRr7V8OVvKpCaM7RnaueAuYduEDE4zE=;
        b=jgzSZFJJSDw5C8NkMMx9IoIxq4ZToxERUkHNLjuEs9GVXdNIl0hOmSgkq5jAbxCUxM
         BjgEaAcx5MgOS28pwWtAATWdT3KLpfqa9OAL1Sb3cdv0M9WcfXi904Gs82OH1JIrWem/
         NrGE1fdkfHMy/VbcnOh6rq03QiKLRSHh8WIq4jY7xWB+d0Qnq5AB2UGFjzcTnCV4DMcW
         styCdFkh7QIA8T21H7vamrq960NrP2E8Nzegw6zc4EZ6lk1mrA7F8pGgFW8QQPUDbXSP
         ZmW2zyNXB5XNRYUTbMPO9+2qV7lw7+HJSjTFAAYA1uQw/XkNp+wP8gObZfmiqTbj5xNm
         zEPA==
X-Gm-Message-State: AOAM530rW7grMn3rcLP+C+ALk/RXLHPGT3lFgeHOJlI2L6UJJLLF7R4L
        gsMUosJzsHvlaI3kGTjh7nAFE4UWJwzckw==
X-Google-Smtp-Source: ABdhPJwssTLNbrDf13OvocN+8NtbAsVu0U6oDr8KIPHQICSGlu1VKuvGjqsOd1We6cCecCDdKb2a2A==
X-Received: by 2002:a05:6102:3210:: with SMTP id r16mr4581963vsf.25.1644244270206;
        Mon, 07 Feb 2022 06:31:10 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id l67sm2618410vkh.9.2022.02.07.06.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:31:09 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id o15so7933126vki.2;
        Mon, 07 Feb 2022 06:31:09 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr5208000vkl.7.1644244269430;
 Mon, 07 Feb 2022 06:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:30:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXr9hWGKR8bzvweLJKX0m3sdCPSCawgbJ9Sjn6rdC+mg@mail.gmail.com>
Message-ID: <CAMuHMdUXr9hWGKR8bzvweLJKX0m3sdCPSCawgbJ9Sjn6rdC+mg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: Kconfig: Update description for
 RZ/V2L pin control support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Sun, Feb 6, 2022 at 8:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/V2L uses RZ/G2L GPIO and pinctrl driver.
> This patch updates description for RZ/V2L pin control support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I think it makes sense to fold this into commit 9d6ae5b72f78a94f
("pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if RZ/V2L SoC is
enabled") in renesas-pinctrl-for-v5.18?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
