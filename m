Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FD42D186C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 19:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgLGSUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 13:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGSUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 13:20:48 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DE6C061793;
        Mon,  7 Dec 2020 10:20:02 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id o4so9607043pgj.0;
        Mon, 07 Dec 2020 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9ow4tkLrSJvkbXDDwEzyPp5RHmjj2oSAUH4e0gWYjM=;
        b=QzuT70tPqK98zUGKdLR/qaqyXr0PrChHOr0Wms/iGfTdsYgRPmS+bSDoBmyPVxWG0V
         MDiIXYC5UtM41a1YhZo9RHcUAmjMnKePUQVhE9et9h0EN7CkVEXVyZ28GJaoTp7u0/x4
         Qt7YlwJaeko5uxkAlYFbGbhVR25gyY2IE1JHuVbkkXIfnDKig5ju9jhnCHe9NcJf9A4L
         uOhDH7YrtndSVNOY7rFPQ5Pb5ezmLV26HNG61KktyHDP7MTq1Yn2m0DFuvdpyxq6e5Js
         bHXWH9nVEUSGwNl84Vd6c3/bB0kdP2PIbTDdMBjeVXT8gVXZcHMi7ykwKUcoyXbor18Z
         mfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9ow4tkLrSJvkbXDDwEzyPp5RHmjj2oSAUH4e0gWYjM=;
        b=dMoqFBQJdqbVGJQYsDGx6TYq7sQT7mWbphDl/Tt9WUuyU95Fu5LNhkLtopbPI/Xt9w
         DObChC9NXw2ehpvKn+5qxtlEPy9eFD33DfZrQNqvhjP7Qy1Ax8CAppF74+48m7RK53w8
         IbDNWnAxsg3XZtA07zyWYkaSZHp52JhtrcgDHpLFht7kFQ4YDnOTtvlugNZ4AD54/XLx
         TWyJ2qWIBnY2RHffLbNMKv+NRiVpF5hLJtA9TfZGc2qiZQpFcpOj5+LZMd5bWWFIL91T
         z5tdcKoNkajl3xyhgMmMmCIm7AhZfvAf5ltTvsQIazpoHYpZ/LAi2QQXRXWzzuPz4guz
         EfFA==
X-Gm-Message-State: AOAM532qdytulqzyDtEBEpXwJ2GexybQ2RHoVlBTzFIFwE9wpzh5rqQO
        bFHajOQ28NJyOOvC9Fs7fcfTYHAy8oj2MPTjyvQvsgEmg3/YuQ==
X-Google-Smtp-Source: ABdhPJwpmN97TZxHv3iR16/L8XNa53/EPU/w9NmlERzFYDMrsZnBmxVziHR65FRlN1UweQDHZih/IT/TUllmdIm4YKc=
X-Received: by 2002:a17:902:c244:b029:da:e63c:cede with SMTP id
 4-20020a170902c244b02900dae63ccedemr10094629plg.0.1607365201792; Mon, 07 Dec
 2020 10:20:01 -0800 (PST)
MIME-Version: 1.0
References: <X85UKveYKc3xLPVk@manjaro>
In-Reply-To: <X85UKveYKc3xLPVk@manjaro>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 20:20:50 +0200
Message-ID: <CAHp75Vcf-_yrUMOVLtydS+0tV4DE4gudsmqdmLLH1SSiXAK66A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: remove the blank line in pinctrl_register()
To:     Zhaoyu Liu <zackary.liu.pro@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 6:13 PM Zhaoyu Liu <zackary.liu.pro@gmail.com> wrote:
>
> Remove the blank line in pinctrl_register() to keep the code neat.

Probably you want to apply the same for other drivers at once?

 % git grep -n -B1 -w ^} -- drivers/pinctrl/ | grep -C1 '[0-9]-$' | less

-- 
With Best Regards,
Andy Shevchenko
