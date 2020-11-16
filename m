Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627CA2B4ED4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 19:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgKPSIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 13:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbgKPSIm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 13:08:42 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC34C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 10:08:42 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so13875341pgg.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 10:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DjDiFqw7Wv6cnZbpGvj2FHEKI4sotiXkzMaAkkagCUE=;
        b=D149/5UIz43cvrf2dSOZ2UGIAWIp3ijNaay4TuGgHxPf3dOEAkRt/dC0x7RxNfLlKl
         8GtozlT9nPeI/dRZtL5xU2qjZzvYZWgJ+gtpd4VYJ5WRZRNAFB6rvLeWFH7X8hYGXlWV
         4BwVKX1XJpgL48rkJKkk1sStPM4Q4JRgrITh6vhoN3p2hfduh+kQaKb3cy3zgn234Pdl
         N6gD8TTRcjvRRBsgdDD+yztW13M66ZPM4AAyKESXkftEYD/NTHN2HcqSMlDFglspmeyh
         LtBKbkoJkVXBJ8GJAZL03e5ky43s/+xg+wSBd36+iwi2KV1rBUiPtyv0D5IQCA/FBnl4
         b5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DjDiFqw7Wv6cnZbpGvj2FHEKI4sotiXkzMaAkkagCUE=;
        b=jF9MkG1OZG5x2SperHeEclH5+XH1dTZz9dyRe7RAn+V+56QTO0QAeWbBVDhdBUgVEt
         moXjTBX+i2hzVeJYHWiZhh/O5/KFMOfVjKNKbu/G6E9UQruLrTJC0TNeE2MKulm4XvbI
         TJ5Lv6MRDwEr9csGkLNKMStmo4rE969bmnf7eP8KFmqapq35ib1OJFDTYexpZsjOHJQ+
         hQHk35QlGZzAv4H/sGeBgzI6OR0AHXs9rW49F2mf1pBEuSiHuFWwrmQVWsDoyz50yP0u
         1MqBumrtbrjTDhsDHWuLkvYZrScNfD6qMRJFdifzPlli9Nik7oMwA3Vd+yQGBIDVqUQj
         +33w==
X-Gm-Message-State: AOAM530ko0RLIkKEQmKZO9zHuH9b0G/I50czVkyQabmHCi2wynJkFvq6
        tuz3mKd0v0iYeqJkYDcbXJza4Um7HatYe3AixTjMilDOZk8=
X-Google-Smtp-Source: ABdhPJya24va3AUn45bxPjJCmvinehHRbL5ifDKNzNHi/vq2AicnNOJKJW0L5M1yj/V/RUZUOiWwFpP58fNpDgnvC/E=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr126939pjh.228.1605550121721;
 Mon, 16 Nov 2020 10:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20201116175128.4824-1-festevam@gmail.com> <CAHp75VdGGxMO_O-X_dfBTog0TG9Aurr6Txgq_nRwU40QvaQNrA@mail.gmail.com>
In-Reply-To: <CAHp75VdGGxMO_O-X_dfBTog0TG9Aurr6Txgq_nRwU40QvaQNrA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Nov 2020 20:09:30 +0200
Message-ID: <CAHp75VdsS=5VHqLh_gLHuvs61Y-fzg2Xz2=12kAe-MxB+_s0_Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: Remove unused .id_table support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 8:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 16, 2020 at 7:53 PM Fabio Estevam <festevam@gmail.com> wrote:

> Another (and I think better variant) is to switch .data to be a
> pointer to the corresponding struct, then you may drop enum and hwtype
> completely.

In this case you also don't need explicit ugly casting for .data.

-- 
With Best Regards,
Andy Shevchenko
