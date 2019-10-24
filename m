Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C67E31C6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 14:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439540AbfJXMEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 08:04:45 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34164 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438979AbfJXMEp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:04:45 -0400
Received: by mail-vs1-f68.google.com with SMTP id d3so16051056vsr.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sK0pWvTCky33QCYiFA2nfCFulsVEzPP8ouWQMoNEYbQ=;
        b=X77JQu2M74j32zRnCvWFx0hX8hm5QE9BLD7tdFlihPqR5QsbcspBUaPz9+ocTDD3Xk
         CaMVHrQioNbYE5wdY85fJgXy51TlkFVvpkjMkS0J2osnWORTeIKW4AHxz1wLR+lqiYbr
         2qWoPxAm9njrO/Se9XRbowj8pJ0UjCx0gmpmyS5rq3pAiyKm66fDpurQV1l8Q/XOq7CE
         gMEsEgIe33ihcHLvqE3a4UCQk0UodbnovvCttQb6FlDk8QzrESZTd3cHxmfMl7ZlhBmm
         ZStu/9Y36ikZ0TlP2kr3enmD087wd1WAokylvvKRtK8acsp/kLwLQ2KUHgTopIhDtv7k
         qI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sK0pWvTCky33QCYiFA2nfCFulsVEzPP8ouWQMoNEYbQ=;
        b=DfTlq05Td5P6gyz7Ken5/jk5bvw8rzATPLSxTNA/pTaCMAg/tnuMb5Kp5nUCZBiKnE
         LlzAqe/m3sClca8N5epzyD6rhdFHGrWRGQH6eh7jHLq24zc7gn9wHL0eiQHOLY8ld3Uj
         R2RDUtbO9XY7uS7JL96tw5pr7Vabdd9t8az6FtW88NAQq4c3/DLNH5VD2RqULDK0QYUD
         nD9RELVgqQMfGpmUYc1RiFf8gFB54bJKnL1fwPpUWLK+KVf8qWfV/4Xfh3G3x2gt+PkM
         spFcGR+Jiv86PtHv7TJeIN38x/uOl0vmc0iAc8obIpooVwQMMJTVOsRgUPvETVK0oRLo
         ihpw==
X-Gm-Message-State: APjAAAUL4HQxvfz5Oy2Ngm9c+WSiSTXTrFKNcE0EjN6LKbM01kmS6b45
        jzNB6W5GIZxp1OfJlszwaJ8gwgWNju2ZIX0wjl/O1w==
X-Google-Smtp-Source: APXvYqzfB6++WoSRmQXkMK1uRnAw/CGlvAz3yUOrxP/5OG3nCHbkCQk9VVZg71JFiCROWtuW1HxxnC7HzkTd4MEDx2s=
X-Received: by 2002:a67:fe42:: with SMTP id m2mr8848686vsr.67.1571918684479;
 Thu, 24 Oct 2019 05:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191016141217.21520-1-yuehaibing@huawei.com>
In-Reply-To: <20191016141217.21520-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Oct 2019 14:04:33 +0200
Message-ID: <CACRpkdYhVExyh2L9A7Fm7y7khCV9wrneKhtMsntWL5DFAaGrug@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mvebu: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 4:13 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
