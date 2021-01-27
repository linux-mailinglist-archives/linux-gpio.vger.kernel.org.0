Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BFB305573
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 09:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhA0IRq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 03:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhA0IPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 03:15:30 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDC3C0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 00:14:47 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h7so1421181lfc.6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J2HCC4yhbbPsmLQ0n0dZus/7x+U8iB2qhIOWhoNSYcY=;
        b=NDMLH3T1eAaIFdZmrxDra9KWHUA2cmKRFDFoinAAIKxXiThkOFOB3RtQ7NrMe/+vh6
         aXTiM86/Mk4NPI91/uCV0v/RRWlxN8+o6z65+wPGyPuud9RXTandWAf0osnTyv8Cz2Js
         sKEunNG8VIohEpiWqUYxu0uxy8SUqg6G0d3T+bXCSu6bZ4u2lqlDEg/W8gOuhtvFrlku
         +Vlhwq11R5zmEkfG/TVLofGU/xK/C7pvLeJmaUp/Hs23p2/mXielZcCsMxKGOorQjbCI
         SeQ/J7TiztQxzh3KDxrF1T+GUq4wg9OHjxvL3Kx6jDaCz7nJ6cqkCmZwq+kExAEMGlzy
         SsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J2HCC4yhbbPsmLQ0n0dZus/7x+U8iB2qhIOWhoNSYcY=;
        b=tHbLEvxekb1jz7AoqXm079d6OoaWtrpmL/u9X1CcigtWEiyq0gEXE/UYE2eEhTEa7I
         sNMzsETVpczIvJ4zVndyoG/buyrSgGIxkx8enIvfLl7WThpFr66f6eWLfXVvOjwVragB
         BKe1awYYSagfM64DinufAEkfIFh9I3Onmm/tqxkOXwVdCcdTkXK3heNqTfmswEwMVg3F
         dlwINYfNQwcKnd224SoftpTIQoMPz73LBv2Izr/lY+qiWcSjHZWfHWJwe9ZqKdiceY0M
         qlcLE1+wxCxiNXHJZXojIlgK6Ovst4FbuX7JU4zy94ni1HdFBC29HbuiO3WP3f3/d04R
         jAIg==
X-Gm-Message-State: AOAM530uXu3C8UsGIbR8ppkOrE//T8yv1ksDDQmBgaa6VKik2/SP5Wv7
        gs39n2j6qVbi+VeThNdNl7Xby0GayCsI67h5S/IL6g==
X-Google-Smtp-Source: ABdhPJyWf+xVImkqWvS5UA3di35EMJA9L0HYCcZ9G6wxZpbFK3IsJuXrlMmi7aAR7vcl5l4lMc+Xhmx7AFEk5FhpigY=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr4503390lfp.586.1611735285619;
 Wed, 27 Jan 2021 00:14:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210127001644epcas2p13cbc984fecc3ac7700a422488b488135@epcas2p1.samsung.com>
 <20210127001631.91209-1-chanho61.park@samsung.com>
In-Reply-To: <20210127001631.91209-1-chanho61.park@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Jan 2021 09:14:34 +0100
Message-ID: <CACRpkdZhZP9uJ7Wm6vLQYCCZN3=g_Rfrbap9cmwUREPeuWFGUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for s3c64xx
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 1:16 AM Chanho Park <chanho61.park@samsung.com> wrote:

> This patch converts spin_[lock|unlock] functions of pin bank to
> raw_spinlock to support preempt-rt for pinctrl-s3c64xx. Below patch
> converted spinlock_t to raw_spinlock_t but it didn't convert the
> s3c64xx's spinlock.
>
> Fixes: 1f306ecbe0f6 ("pinctrl: samsung: use raw_spinlock for locking")
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Fixed up the patch commit text a bit as indicated by
Krzysztof and applied so the tree compiles again.
Thanks for fixing!

Yours,
Linus Walleij
