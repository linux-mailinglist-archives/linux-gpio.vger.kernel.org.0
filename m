Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF303CCB52
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 18:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfJEQj7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 12:39:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42978 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbfJEQj7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 12:39:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so9498752lje.9
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vPHHQsCm9P5lZAOoBEEQkMv+jTLHYjpWxfU2c8iJm+s=;
        b=km/R+P3zNivGmATXsVjC0pwOaNaLVsp770WNbE2ZdpnVhPJLTNALAk1pY+eMZE8pxA
         YkojbQcoOTs9kZM5JOF2Rv46YYNSaKgBPCmQW9HOvbS96RPuJAla8Sb2VPqcElrCO5UR
         2/6Sh6fMfSddcEzFcz14tMESk62O3II7RDYFrnC07gcpY0285wxcVavUiG4u/u7lIT8k
         Str8vwDdfk6qaSpKCDpAnHPxIlzLBsALXel32/ueZHebYUHkyCAb/fvINXvtN+ErP4hp
         AyA6Qc+BWhszgGMCLMW3ME4lR8pJoWEG1nEZYcfMy0G/Z1RZcXMUMIAIqKhzlESl60G8
         HHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vPHHQsCm9P5lZAOoBEEQkMv+jTLHYjpWxfU2c8iJm+s=;
        b=jXvAfy9RHzNuIKWY2H+Diea28uUhGL1rRCexrPyu8Movmyshd+tBEd3eg2OCZg60l0
         HoJouAuKHqH4XzN8ATRQpMCbZvI7o2PFjujnl350zv5howzGO99vGljfwy7tmXn46sGE
         UXPGEjtC3ZLuLviCv0QsauY2sm1GxxO8cdxbGaPLkrWTAydCUpdrYrAo+aVFiBEhBuB+
         EZhFlLKpgEzIr5Uu/f7kq7x5RtD6Lcvo1MMq/P0XIrzOUak+a0JtLxmLi2RjhRI3UR5k
         bp/R9sYjZh34skihgnXPi38YLSxd5V3kJdRD+DJIb12aBvF0m9Py8joY3bym8sy9ixiy
         bkkg==
X-Gm-Message-State: APjAAAXR0uHQa8FOTkQJ9EkLNeLg8N3+AmDZ2lO4+SDbEqFNDUfNcci7
        a6+Pur4nuqYt1JjR+yrzfm1vic0A+H4dQjaS3K/CFg==
X-Google-Smtp-Source: APXvYqwgSpaaFyzXdZShSpDLB3i/tHQGn7PDveIUsSUQrgOPp7Y4zvvhnbMGw/WaUGyUixEqB0xsj3nUp2bpy3kvhqM=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr12889974ljk.152.1570293595719;
 Sat, 05 Oct 2019 09:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191004122342.22018-1-amelie.delaunay@st.com>
In-Reply-To: <20191004122342.22018-1-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 18:39:44 +0200
Message-ID: <CACRpkdbhoAp7Zif_7pbvJLoFeLdbT9u+RRgZk94cJEH+NadBmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: stmfx: fix null pointer on remove
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 2:23 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> dev_get_platdata(&pdev->dev) returns a pointer on struct stmfx_pinctrl,
> not on struct stmfx (platform_set_drvdata(pdev, pctl); in probe).
> Pointer on struct stmfx is stored in driver data of pdev parent (in probe:
> struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);).
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
