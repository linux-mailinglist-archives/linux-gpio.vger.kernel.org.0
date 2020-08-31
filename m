Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2CA25764D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 11:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgHaJPf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 05:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgHaJPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 05:15:34 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9ADC061573
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 02:15:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id np15so1042622pjb.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jOsH1xveMhMjoIwok15XcPwN4RVnMVHn8XuBwbA02ow=;
        b=ldTYVU87XmQJRhEDLkn6zGfy2h2O6NFevgUPbsxyMEIL+Xn26+t76gllLG5LkaWyCJ
         1KFHoj9F6PDd3DBYJFaMifYFhKSBnW8Dj6pd29bLICluNT5F/h3DA8oANDvY7ONkDUyM
         uXg8SCzlmXQKhQpClWUf6Kvj2pd0bRyyPm+satR4imv9FG3ZXkW0DGpMZ+VRkRb/8Dmi
         izuwHOEkwHapb6gkS7qshXUH3uEQup7T8UuGlfDHP3hdQhRkHVIIwzUwUa0DQ8ruY4Qs
         3XHEzA638XNy7PSrZh9Qhq4ldbjkJZ2DbRS6CrtwbduBZF1y5yWBM8Yep4f9wyoGyAkK
         zMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jOsH1xveMhMjoIwok15XcPwN4RVnMVHn8XuBwbA02ow=;
        b=ZCkMI9HQWpM6NKLyXhl8/hGdOgqmwXDnS3aNEPZuw/4Yrsr/ROui1/ppCvTx83Qe+1
         YfbEpxcAeF3+Y32vqIdjT3wfv1qUp7q+fBPaZ8Fvfsv0Wl8hroosFzZI6iJ0twY+FRKS
         bHOyswV+hVatHiOck/S5UUvcGg25R/M3AaTru8ivnFOR2cIE5yLTg9P7zVkbNLokbrWm
         UZkGR+AYrLz7kQiRt/pjlYz3koDprOz4vdAVAQ4AIgJri+szbeQejcswl6BsLIETNdEU
         cj0AZqUhFQL491dNgP/cK44GbGm5h5fplmM8NgRnoRvL/tO9p+yY5ykmBqVHjzYbjhyJ
         jilg==
X-Gm-Message-State: AOAM53176LEbih9BiTZKlcgJ107wzztD3ElLyJxuWaINrIvAyVk5DGqa
        QIyHRJTl4ICAUhR2Bh6C9MdY
X-Google-Smtp-Source: ABdhPJxPn8geeNBDo1sZvZ4GwlWTHSLh8tnqHQfqdF2oJbs9EIbUNTA1H+iVufXeuzR1hCrNqbDeMw==
X-Received: by 2002:a17:902:16b:: with SMTP id 98mr386051plb.23.1598865333684;
        Mon, 31 Aug 2020 02:15:33 -0700 (PDT)
Received: from mani ([2409:4072:70f:fdfa:1d6f:524d:c4d3:917e])
        by smtp.gmail.com with ESMTPSA id u62sm7196663pfb.4.2020.08.31.02.15.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 02:15:32 -0700 (PDT)
Date:   Mon, 31 Aug 2020 14:45:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl/actions: Constify static variables
Message-ID: <20200831091526.GA4154@mani>
References: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 0831, Rikard Falkeborn wrote:
> Constify a couple of static variables which are not modified to allow
> the compiler to put them in read-only memory. Patch 1/3 is probably
> the most important one since those structs contain function pointer.
> The patches are independent, and can be applied in any order. 
> Compile-tested only.
> 

For the series,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Rikard Falkeborn (3):
>   pinctrl: actions: pinctrl-owl: Constify owl_pinctrl_ops and
>     owl_pinmux_ops
>   pinctrl: actions: pinctrl-s700: Constify s700_padinfo[]
>   pinctrl: actions: pinctrl-s900: Constify s900_padinfo[]
> 
>  drivers/pinctrl/actions/pinctrl-owl.c  | 4 ++--
>  drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
>  drivers/pinctrl/actions/pinctrl-s900.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.28.0
> 
