Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707F7124739
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 13:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfLRMs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 07:48:56 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40838 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfLRMs4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 07:48:56 -0500
Received: by mail-lf1-f66.google.com with SMTP id i23so1606692lfo.7;
        Wed, 18 Dec 2019 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=puVqjGfUZqc69p5IbHMBZvLnH8lealCUIRVLLSvyh68=;
        b=CegjZJQnDRhZvA19wS9NRPHXrPax+EW+aA5TzuSzoe7qytrGuF4nV6ZBgCWjEAfinb
         KodRF8cIryYDy/YcH8FDDqXlRwgavUGskCHIfW0ROEVvLv922pvgyVl+m0N5Ynw7P0ll
         EbsknU1E8T8x0olITC2gY5Nib0H3R5yURtYeHIfA2JzMGkwyFXB4ywGNtyAdHAiHWUN0
         z9NBzJD+SjKwrh3T6GN0TYxniafqDKSbCJbVjac3ZIP1jw+dmulOtSrw8Rm5QHi/lE6Q
         b60rpMTQPA4YNm+R7HdKB2crWn5DBw19hbq6k7EXfmwDtKVR2hV3pwYZ/zBmZRSZhMUD
         2McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=puVqjGfUZqc69p5IbHMBZvLnH8lealCUIRVLLSvyh68=;
        b=jWdHO1XkUxirKTmCuEMpbzMqaFqVNkL6lMKkpWCnrvzCx1DwfE0PFqqgGH3C9EOFyD
         9yFsFQ16Ls96TLBFYlb11ZAz3GPYZVluZ3FX424sCjY36ZNOih40SZqJC7xRsLSujW+b
         4JBqW9+mNFhaATLQfMY9CoyUE+Hcb0rPL7NII+pwGe6jGECZ+lOqAiXlyZSj8vM3RdUO
         AyX5iuEoHMdtCWy6tX+P/KNSTxqbauBRa5Fe2VniK2s4BJIuZYg+FnW035scDxbigq9/
         ZIHUXnplF4YD34VfgFb1KHZHWYX2Oqn5mC6H0pfpCcabGw6hJw6kmaFkxq9+KE16xNSP
         bg5A==
X-Gm-Message-State: APjAAAULpHCs9k6Sw5zzHHUNVqYCaNQGjFJeZRb2uX6m0UIPbnXrgXYL
        b+iKZJPtZijvfD3GqgY4up5mijUJuXKK+vDDTgY=
X-Google-Smtp-Source: APXvYqxxr2ycXk2c/95HhTuw//BhWhwZCbDPO1lc7OiIlgU4kqTzX6dC1NiHbs00RN13nBGSqf36KHHnaQUo36J/HmA=
X-Received: by 2002:ac2:50da:: with SMTP id h26mr1594397lfm.80.1576673333979;
 Wed, 18 Dec 2019 04:48:53 -0800 (PST)
MIME-Version: 1.0
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 18 Dec 2019 09:48:49 -0300
Message-ID: <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 9:44 AM Peng Fan <peng.fan@nxp.com> wrote:

> -       nr_irq_parent = of_irq_count(np);
> +       nr_irq_parent = platform_irq_count(pdev);
> +       if (nr_irq_parent < 0) {
> +               if (nr_irq_parent != -EPROBE_DEFER)
> +                       dev_err(dev, "Couldn't determine irq count: %pe\n",
> +                               ERR_PTR(nr_irq_parent));

Why do you return ERR_PTR(nr_irq_parent) instead of simply nr_irq_parent?
