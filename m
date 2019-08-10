Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF4488A05
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJIa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:30:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43273 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfHJIa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:30:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id c19so71182616lfm.10
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8cS6whuQx4DiXwl2uCBLk9T9CxxkX4y0PTjlTGjmUo8=;
        b=Bpi1rjkFJMHgOIbcvWSc0zU4OZ2FaIw3BXhaYreLp3dl1rPdyAtx7fd+PJ5GPdppFD
         RhmQRpdBJelObM08Xpq15gTBLaeY3eVklsUIU1COVpJBDGMr6D06dafHpv4s3c0bOWrx
         PEO5G3eXHmjYIXt0mpCmbdsdzjwjfLM6RPuHW7/ViqwSu1OPwu0Vn+IPZJrp2HLHTYUu
         o6sdoPMm+BfVXUscV1/9rv9JemSZFWrQKHpfsKMxUmfXGjGXlAvGUZCxn+3bAY4nu20t
         DsaD03+/+89dkFBwLUmx66hzM4UZg3pILCMqB2dKM34pkKrz1AYhkxRySfXRImNcBVzo
         esRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8cS6whuQx4DiXwl2uCBLk9T9CxxkX4y0PTjlTGjmUo8=;
        b=PqRna8AkiFWsjC8bjH0NjjQOyGnTty5AezAnBIbvRkRtQm3fBDJ4R/NX4hf4PjOX2c
         sJMvT4AAQHknggGk4w7DpO5X4EeJmoiLRRLBJbz/66vk5NqT9kI1PTe3V2h8zndxrL3E
         SH4xrILlzCp40SMwiU/awJQshDrLXh9AobqhBxyExCnQoG3k0Rg8zSnTuLWEBl33qVLB
         e3Y2Vt9f+ePpYpuKx4Ar5q/BMcQ/eVqgzV9FVoYc5nAdrJzLh07mExglg8cUWorNnn4K
         WChrHcrHgp59FN8kLph65CyW2QcMGO9CKJefSe9x4GWT2EmMu93Vi/TtNl19O5iSJh2Z
         S4ww==
X-Gm-Message-State: APjAAAXA4BjqJHE64OHM95yzfyCQTX1oYqZD0PumQIQwFRQdk1zha3tl
        R0EvjREPMGVoKF51aMHKCzqnLAOIFswKrr9zK8MQFkw14r0=
X-Google-Smtp-Source: APXvYqz3iyknd9U+Aqu0UdmG71Iok1VwzPjyL6T+MtBSBCQBTIs98zUm+bnjNoxDGSuA4prPcqKrt8dfmYTe23qujFY=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr14674947lfq.92.1565425827221;
 Sat, 10 Aug 2019 01:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190808074720.15754-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808074720.15754-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:30:16 +0200
Message-ID: <CACRpkdZZmJUDiLnf7YtD8nQ4pzTsZfDu=B6jFFSuHF6Sc45EJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: imx: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 9:47 AM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node() puts the previous node;
> however, in the case of a return from the middle of the loop, there is no
> put, thus causing a memory leak. Hence put of_node_put() statements as
> required before two mid-loop return statements.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied with Philipp's ACK.

Yours,
Linus Walleij
