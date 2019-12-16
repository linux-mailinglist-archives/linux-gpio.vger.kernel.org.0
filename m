Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A0F12015E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 10:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfLPJoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 04:44:07 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:38184 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfLPJoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 04:44:07 -0500
Received: by mail-ua1-f67.google.com with SMTP id z17so1845871uac.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 01:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6cBtmKWsLcFEesk9As3Zqq5Dsa1by5Ki2QFbfWPIPMw=;
        b=vN9q0WoAlGGzmzPAUIa3Bf4RlHBveDfHPrbcYTXgQlRRfnqfpRjJqT9LcZ18SjP/pe
         Ql/SG9e4hN07gc+/JTgJYOY6E7VS4Lgn2JbB5qDtLmhUv+fJMuIq9zF41qU/liDNqaPk
         JIgzBHMjV7zV/uaqS44Yfd25jRg0WXP1MUVHWP3bzoHnLgUR8H3lrVvfTWfhetHJm987
         4sanJLDTIwBgAbBrTBxIKWdG8zJ4w4Wo+stuzOSAUk/ZaE+RD1eC4JPIQBRj8YC+aomR
         KpfEjEflO+Jxh2Sc9yAz2gagL24Ad34o+j+p55NSzs5LvwJCbDE+8H0Bh5r6FtayP452
         SrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6cBtmKWsLcFEesk9As3Zqq5Dsa1by5Ki2QFbfWPIPMw=;
        b=g8AVVzFJ2ZnmdgO+77qQT+guH+fKp01FL5ntEFLlPLKEZHblmekJ7G/4mL0pgVH9kv
         wvTeFE8np09SQ49mL6vdK9t3LQkmh5Waq/MIibZtsAadHj8M68n/eZof1ZKinvI/BeYb
         BYXogfV2gU5MhoDNOLaucnwovI7QhPUWxWN1JUEs/vkO0XZruMWRoN23Va1MX8GJjD6U
         0r9q8ln8EhhDMTFotxEMHacPzgaqC0NMccqzWRuy59D9+R+xdUwVkDERU+HT05NTKFp1
         M8RpgN+4hTaxWb1Dmxd7K2e/6igrOC9Pw/OoDRq0KWclN8IpOSnTcvwXV7+5UHMvFpxH
         9Y1g==
X-Gm-Message-State: APjAAAWtAAc4mino5mZaacZESGI/s537pToCYLv2YTP7w8eVrpAi+hKu
        NbavhWmgw6tlkFWJB0tXl72Bh0hnBf0eTQUU5fy9zg==
X-Google-Smtp-Source: APXvYqxZqWfu63h7+QfiSM+bLvm/MTrgs7ML2u5C04jZw3wt+JrhTqX4WzahGvEan9Ny/1cGTQCA41TLz3q5BlgZNQI=
X-Received: by 2002:ab0:32ce:: with SMTP id f14mr5283635uao.54.1576489446278;
 Mon, 16 Dec 2019 01:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20191215210503.15488-1-hamish.martin@alliedtelesis.co.nz> <20191215210503.15488-2-hamish.martin@alliedtelesis.co.nz>
In-Reply-To: <20191215210503.15488-2-hamish.martin@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 10:43:55 +0100
Message-ID: <CACRpkdZVPaUBSkoymOL9iWfa21U4s_zPLoJdcEuWeYn_DAbkVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: iproc: Set irq handler based on trig type
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 10:05 PM Hamish Martin
<hamish.martin@alliedtelesis.co.nz> wrote:

> Rather than always using handle_simple_irq() as the gpio_irq_chip
> handler, set a more appropriate handler based on the IRQ trigger type
> requested.
> This is important for level triggered interrupts which need to be
> masked during handling.
>
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---
> v2: Alterations based on Ray Jui's review comments
> - shift setting of handler type inside spinlocked region
> - install handle_bad_irq as default handler for uninitialised interrupts

Patch applied. It just looks very good.

Yours,
Linus Walleij
