Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DD7526D4E
	for <lists+linux-gpio@lfdr.de>; Sat, 14 May 2022 01:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiEMXCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 19:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbiEMXCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 19:02:50 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05A487A01
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 16:02:40 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id w187so17715175ybe.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 16:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOfkNNlnsxIsV3gy92i8FfzUNF88Xz7zFySrTzm6vCU=;
        b=yq9TeF9WxY2l2F/TkIUrWgiNmXJ55rPGXwYYTO/fxXZU+NAqUzVQf3jtHr19YagnKb
         c4oRzLW4d7eV0jbIs6XRH9sjlKONuJBsfSsEVL3Ryp+DeYlJ5HRAJkuNQhJ22UmUtJYT
         zwa63qlgrrQmR8RIpg8B9in51/z3cW7a5ZcL6Sl6kvKOynqEFLovKavvOyTsh6HvuWSx
         rEfBjfdUvaT4usopKdTpqf8oZHuEmVepkAcDCo2SWiz3qUQUEHle5wbXOjhnWjzgJjfa
         3EJTLMhoqPVm0bhZygZ4wKEsbv7fTGcPEZme7eFy5sOe5OFg2s+6ohOPBQe7hwbHji4/
         Px5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOfkNNlnsxIsV3gy92i8FfzUNF88Xz7zFySrTzm6vCU=;
        b=8GEMiNQzoUTe9Zj7MkRap2EO9u77lacFWikK0ePj5NhD+P1tTEEkP6wa6ersgRrS1x
         m7UKjcgiswBWZVxkavLlUgk2neYg4rApCKmlEQC63tnUlX95//cjPQKuoZcPJ68Askhg
         7r8FvYkUI7mIxcwfwXg40bu8+mRandTEapmAKipfskbluTtNMeTSukgWQo+bY4JCEiJ+
         SmqLk280WG3/KiKlCLoMMVjpTNwGcn9V6OlzgZimvpVVP6rb8I9t5khynFKlqd5TiAak
         rQ42MPFyxYTceox6BHRaQ9lk6bFWypFCzNRMIYfi0p4gwwS2l+Tc3sOzgvMT5xdkswy1
         ztuw==
X-Gm-Message-State: AOAM530GHqlF4PCLczaqnfsFKoo3vasiCtFYd3X1S9BcJB6sor+jRgP3
        eFbBdl3bI7s8zw1r+//UyxE6x1Ore1SYLLgIxPhmto275XU=
X-Google-Smtp-Source: ABdhPJyQwIv9XvGMfN0H34KsbPXGdP2T7zfQUtuJAtTSIdWeaD0yH4g9z0XcZIXyM1IlLfTtpWikMpJeSvhe1Rq9AXg=
X-Received: by 2002:a25:aa94:0:b0:648:62f2:ef4e with SMTP id
 t20-20020a25aa94000000b0064862f2ef4emr6891735ybi.626.1652482959341; Fri, 13
 May 2022 16:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651829249.git.geert+renesas@glider.be>
In-Reply-To: <cover.1651829249.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 14 May 2022 01:02:27 +0200
Message-ID: <CACRpkdbOeK_oZuD2Jwzekdbhb=MvAZF=dEK=X6-8fjdPE6dCRA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.19 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 6, 2022 at 11:32 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f7bc5f52d2354b41d5a111942be7ee01e5560c78:
>
>   pinctrl: renesas: rzg2l: Restore pin config order (2022-04-20 11:53:47 +0200)
>
> are available in the Git repository at:

Pulled in!

Yours,
Linus Walleij
