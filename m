Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADC8619B31
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 16:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbiKDPPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 11:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbiKDPPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 11:15:47 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BE155B6
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 08:15:45 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id p1so2492447uak.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gUe2GRAVKoiYpIM7yredmbOYdTCdjHwW2lhwEHBk3Y=;
        b=jWA2aTtqx9PzQx8sCJ0jNhj2FZJztGbN29wQUAcTzcSNYe562qGjyp9iNV5EMpsKu+
         ifyRRdhN3SVTFODK61j9iiyfZJL7yNHy1zwmFdsYQ3K324kQzVLpvvlBxV0+krKyIE5a
         8yRpnKJJNODmtJEzb2Nwej8AlEWamkF7NC8ZpHJtt/U8mMMv/Riiq/Le4a0sG4Z3E4Wq
         tDOzhG+EdVXLhpU5snWdFf6IEno/MzcoDyx6yDruUkicSAaz58XVwJKh0nY7Z7V20Drl
         M7joL0fdyHAqzZxU2eyDMysZcLPOkFXxOmXM203+bxoki0wGA1C/wO/VyBSFE4+Eyp2z
         nH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gUe2GRAVKoiYpIM7yredmbOYdTCdjHwW2lhwEHBk3Y=;
        b=Q41Kf45qNFtncUiCxmOo9e1RSKCHU5wFQeGVM1hbW4tdaIUTy/qxRdfUyB8GHTdVUF
         s0G+Sh6+AcKo4e94JfT3P5W0cIAfDwnb2Id7kEKuomr1IW5bOOo405Ao3QDDhXUG9OIq
         itKHX4kyZneJANoMsWFXxJu7lbP6yqg4PSIuEOmWH9pwFtHMPsidludQtSySYg2Rz63W
         tCljxsM+K3Ub7PUxAdgDPHQOQhSs1PGFT+Gk4Z1nAbwapcWXPjRwcQlEdL2GcnthgoGC
         kfIZagl9pSiMv/8Kg2AeU+ChZEtjH4obN5KDd80/fFqq+tMJPMTRsCtDgjc6obfGAR82
         sEbg==
X-Gm-Message-State: ACrzQf00G16foCaFiOsFexYwH+RitBhwkOLkZzScQk/ls1b8mlvBugnY
        f5iSx2NtR6N3OvpEUmxpdt52TAyzeo+dJgKXryjt/jDneX0=
X-Google-Smtp-Source: AMsMyM6MkHHYI1BCn9c3vvP6ychNUPWyfxEtH09gBAYttruLdRR+2ZyJUJFkbdrWvZM1IN+Z8djHghIXcJcQhYk/lUU=
X-Received: by 2002:ab0:4326:0:b0:411:56dc:1db5 with SMTP id
 k35-20020ab04326000000b0041156dc1db5mr8364053uak.92.1667574944501; Fri, 04
 Nov 2022 08:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221030044047.423859-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20221030044047.423859-1-dmitry.torokhov@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 4 Nov 2022 16:15:33 +0100
Message-ID: <CAMRc=McwPzAo7f-edYFRd_RABT4GM4H6CPEzo8iON2CZUryjrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: of: factor out quirk setting polarity via
 separate property
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 30, 2022 at 5:40 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Several legacy bindings use a separate property to specify polarity of
> GPIOs instead of specifying it directly in the GPIO property. Factor
> out this code to make it easier to add more such cases.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Both patches applied, thanks!

Bartosz
