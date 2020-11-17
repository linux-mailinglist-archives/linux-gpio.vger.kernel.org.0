Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4492B709A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgKQVEQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgKQVEQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:04:16 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE21AC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:04:15 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so32054495lfd.9
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgl6E2Ykw2oSQn1w28fmsugeMPZaQxHqS8oXF+f20co=;
        b=q2zdu4NoqBNyZHCKmy7C0hrKA3Mv9ZZvSpQzk05yDpf0tq/F898wVTkjyKiGI3X965
         URrsRDR6Uwaj0PRrPG7T5GAwKh/UWLhtMwYw9h0Am0Xs66ZaxGtmCs0jGfwwYsbeR74d
         yKWypHjJRqpCqpNp6B1NyN+LFAlNcGhkPjdp0hSoOFZ0z1/I7J2kzaS8ktF7bbBY6FLr
         kFNWdZvPGO68Dxi9m2XnRzV0bGPH0V36Dz/IKwjW/QsbJgYNYP7hhkBoAbR28e7/26UR
         tlHUlSMf/uEB8p46UwgUHBy54WEjVolgcZEoTlGFENLAb23zZw6GxINyLx1J++fnSrCS
         z1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgl6E2Ykw2oSQn1w28fmsugeMPZaQxHqS8oXF+f20co=;
        b=II5olpZbkbDdDbV0b4zmuxQBPXqtDsvpqBMUPvpEEi4fxYOxetskWBvipZreVSxVeq
         ASC94S3OmKjpVaJvt6x4h5WOJ7ZaReN5YX9Re/PmWk2eONDpaSms2qO/8M/P8JIzWR5o
         ANNqagh5+2knJ8el/tq0qWTrGGQlhGmjRHFmA0cw2+ePYOEKli4oQWIiIz+N8IPNHq3B
         piAVE4n6bEVWw7K98jPsFfCtcuiZaUpyiXI1+zMcBjua7QeonTzLQXhYHz1naUpI7DUP
         VPyufQSPTRo+6KZcc5Ako6WGIvUJBDJc2jnWw7lcWB1OL6PGtS68dtE4uHnpYmLJRvb6
         E7+g==
X-Gm-Message-State: AOAM532Uq8a79OiINnGAkXLP1A8RNmDBSMOBtzNWNcvvI6E6t1btPhGo
        /8b6OfRf8ig2T2qNsBMuhsyvgC04MjzyEgUHOpcimg==
X-Google-Smtp-Source: ABdhPJynjCbVNSZR7txIN1CNMuxzgyFSB3kNdjYDK2X7OxfCX5DONMDpJ99UxLL8MoDYnQbi75J9pOWRi00X+Qo1Id8=
X-Received: by 2002:a19:8686:: with SMTP id i128mr2298194lfd.333.1605647054194;
 Tue, 17 Nov 2020 13:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20201113151807.3924625-1-geert+renesas@glider.be>
In-Reply-To: <20201113151807.3924625-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:04:03 +0100
Message-ID: <CACRpkdZTuh-qR3PEr2y5nMnLj78WM8=2Zq+-v=xXercA6+JCNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
>
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag1
>
> for you to fetch changes up to d4aac7d439c2d9307cb5137fc285464a36978107:
>
>   pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)

Pulled into my devel branch for v5.11. Thanks!

Yours,
Linus Walleij
