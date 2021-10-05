Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E55F422293
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhJEJqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJqZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:46:25 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A97C06161C;
        Tue,  5 Oct 2021 02:44:34 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id f9so13609782edx.4;
        Tue, 05 Oct 2021 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbpmwGOB8UZjIrH2A8gEQhTIPZbQIbes9ZyQqIS/Ums=;
        b=iO4e+OL2CYkGpbwB2GDhfyIdB/ZcbbWoZYWb4bHNpZm4StzvqVFx5sq/1md0WmOns7
         yGyog9ALAMG75FVDRgP1vpga7gxbQ2GLj3Mx2p3xtXT9HI8QqZUSejgYOW9E5YVhZBp7
         SQOGHvdpc7ozWjHb9o8x/8bQoclMRdYYFqmxMNe4yXUNttOYScRen6pNm/uJ7SDLZmZu
         bpfUDGkCYBzx+/QimSJb+GW4B/dScuQRbe7oqHA5NB4aD+a9RadF6lBYe/iYreCCldA9
         Esz4Q4hl5K3t4nSzIhq1zz/jKKDeLJmVzl8nWNa+pYhAuw14IVRcDtBm5Il/LKhWc1Gp
         7EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbpmwGOB8UZjIrH2A8gEQhTIPZbQIbes9ZyQqIS/Ums=;
        b=c3QqqeKDb6zUHmmfTWXdatJLcd5EcObSq6pvjQ7OITkduVsdEL8ylENWb+6xHX9Bub
         0K12bzwGJe7GBgvLiR/AcTRjomfzIKu5avyh+UPhp6iV75YgWt4zOXzq8nYdbD8ftPQM
         PjKhk2G+K4PXWlbPgV310QshR51fcit5srldOq1BNhuGpbHSn+IIWXs9Qs8rIsBdfbvv
         cE1rffvvcF7L5YaBm92CXk/3ZUUHcIsl7dXFLEQ/JnwNqiD6s+Q0j9vVnAFAE6D/kpnB
         ElRCbDccPcbx+OZ1pXvRYCjaMTZEQ11g1nhgZpr27uA3Ot1wbxJcVCEt81Hd0TFKAq/x
         vCaw==
X-Gm-Message-State: AOAM533DFcyDB6FpiOIY7R5ElOJdb03BwE2z+/ciPvdjicdhtAJgwiMY
        FQVAEfDV3N1yP/yNKLPAbH1CQ344iDqgRsMQrnU=
X-Google-Smtp-Source: ABdhPJywE3s/Nc+1mp99v/K1zxg0WXmKi7nBzRtEX4wh48HCV9HzwccOJLCj2IMHuGxILvWwksBkDUEk5uIA4ovjdHU=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr23131365ejd.425.1633427073480;
 Tue, 05 Oct 2021 02:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211005093731.62743-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211005093731.62743-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Oct 2021 12:43:57 +0300
Message-ID: <CAHp75Vey95aSGoWg-XZtpX6UXj54208Vi4=VuiU5s7Z6w-fdtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mockup: Convert to use software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 5, 2021 at 12:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Reported-tested-by: Kent Gibson <warthog618@gmail.com>

Oopsista, should be "Reported-and-tested-by:". I hope you can fix it
when applying, but tell me if I need to send a v3.

-- 
With Best Regards,
Andy Shevchenko
