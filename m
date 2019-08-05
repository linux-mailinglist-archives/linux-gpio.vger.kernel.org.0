Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12EB1815CF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHEJru (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:47:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38227 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJru (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:47:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so78748679ljg.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHRiULRD066ku16Ywuj9oYN3Dh/FgbYZPwDVeQiCb0w=;
        b=YmNzlCGAq3HBZxXQM6IEYSE2p7on9GX3hRmKsoXrn41T2tl7M22YYMQBHGRPCi1I0N
         rfJsxYBg6KRQurLbVN1Pd24LU8UvcTl/8dggsij+iJlbt59wdD7/rgPsGHLfqhraf3r6
         hhUEXlhDKVqR+V9J6c6QRT7P566zGOLcALlImNp/FuY7FcOw+RFQ7lqiZX2eqFpdXdR2
         fvcyD6QZIpRvfmd9C1/CBgydAo3C/GHdtV8PeQwBOZ7WmtfmesLb3WTvm8qydOsVHdjr
         cEucm0ngqxz27WdWrAH20W7hX/NsuSW7TB7gQ+PUbh6pOscjCEnWq5GrJ//2TZXt+MOu
         waQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHRiULRD066ku16Ywuj9oYN3Dh/FgbYZPwDVeQiCb0w=;
        b=ViTEiP+AL3O6kVcb0QOaiPCWf5R8/253c/Dlc8XKvjiZH4U0wr7paVsieksJHktd+f
         8Me+afFb8heutdoOhNBvbFDzNwgTKaDu+/Pg+hbBwM/f6gRmzCOPcjhjEplL0/fT2ZRC
         rxTeIfSwtVEWTF4xk+uBHNczXxhBlDvr9gD0/Vn13FqDYex8XTJk+Pfj4NRx4m5XM2ZE
         W+nL5ceIsYVVDsX8btU2PZQYh5jJJw/VjWkCe/wpqhRpCEC6RuZnaUuHBnUC19QcFdZ4
         rUyhULq6AtngF1Qm1aRKKBY9GIkEltdMuRBRlB58OegOzHFt22YC3qaKSXd+pR8BYXyo
         hcwA==
X-Gm-Message-State: APjAAAUN944Ckvnqry6ad7h77BBHIei/twSGwWBvdovkcUOUI7gYDBqt
        zzyba8KLWysTCF/CpRs/HGCAw6HWz5MT0PcBDQeKHg==
X-Google-Smtp-Source: APXvYqwJB1wqGRC+MhWjrJSNEK+oJjjnOGSE6luZ1CGI/AE894cT/xb/l9TP3XAv4dswuyVWsAO2JDI8uqQ6XdBGkdo=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9660614ljg.62.1564998468115;
 Mon, 05 Aug 2019 02:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190722091015.20884-1-ckeepax@opensource.cirrus.com> <20190722091015.20884-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722091015.20884-2-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:47:36 +0200
Message-ID: <CACRpkdZ4PPtApY50kTtn1hbWZ9ccZugJuBA3EQV+=oN72XaFzw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: madera: Add configuration for Cirrus Logic CS47L15
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:10 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>
> This adds the pinctrl configuration for the CS47L15 codec to
> the madera pinctrl driver.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
