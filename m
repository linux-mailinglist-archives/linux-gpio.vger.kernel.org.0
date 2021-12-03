Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F574675FF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 12:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380322AbhLCLSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 06:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380313AbhLCLSM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 06:18:12 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD273C06174A
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 03:14:48 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id j11so2712515pgs.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 03:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7+h7rsBAcGH0U57opyeqtah08HMLRfXGen2cY0EQKzw=;
        b=Vaz8odlxqEwOfWpu8e8za8NNawLRk+7HSW9ZPTGs7XWkucBJ4rZ/LBrsCOrYTBOPP2
         sMlVGTXP/yEcMAXDBjeuQwe7KKq8xsUzdS17pBVLUBDuWe0CWP7WXBSiJIBqlLmqPWIK
         FgsX84uShmzVYe8ZAY8m+oRIwRGqISV8FdDziujOtBH05JLJE2cWWnFQK2zLUxDvY4An
         zKFPWjW4GKwAXkZT92Hbrh4QwQU99yqGRPJt1MhbkrkgjJLrNA0YE+QmFaotwdPB8UBK
         zI5OaCgsHz5y523lF/xEuI1OAEqJqicIiI9+iRGYhGPUjqsS+ZRzjo0aV47Yv441gYB1
         sMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7+h7rsBAcGH0U57opyeqtah08HMLRfXGen2cY0EQKzw=;
        b=tBzXcr53kOW2A5HkBbsDutg86wRxFkPArGs7UgdwMdjZK/OAC66u5bp8LgUvim3EVP
         +GeuR3ZJHA4b5PLahHDWLoRALBB4C4pJ3uXK+DWW7ate0kRfbj+ZaGieRJu8qg2X7Ut3
         NPSn6DAVEeZkB5z7llpFkvgN14rqRS9j/QZnm5IAvaFYqoWMVBxOiUsqLkAL5YQ0m+J6
         I75Clp2bO4/iEGccEDNBJgmeznW0wX1GlEdBFTPPTNlqhW0cgOKbigrzW4iPb4oR8n+P
         w8K8jwCpYdJL0/lXTEaq8MukcOLyS/bM1vFqQzdRS4AEqg+SGXjzLJ5gmpXXC31f2n+c
         AkPQ==
X-Gm-Message-State: AOAM532NCYhMDHH/gURZ9+9KQmJcL4wKPJSPwJsBywr/lGGK4f8VqsUg
        HINEzMTK6GUDh3vR9tcYFGNfrA==
X-Google-Smtp-Source: ABdhPJxfN1l/NORLpLDYep/SNUmuwajNP0387n1zpjZbIzDSsvzftxsOqfgkdLg78rq+ueIXt1ujCQ==
X-Received: by 2002:a63:1754:: with SMTP id 20mr3943773pgx.559.1638530088117;
        Fri, 03 Dec 2021 03:14:48 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id f8sm3292470pfv.135.2021.12.03.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 03:14:47 -0800 (PST)
Date:   Fri, 3 Dec 2021 16:44:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH 0/2] libgpiod: Minor fixups for 2.0 bindings
Message-ID: <20211203111445.36nym2ia6wvitm3v@vireshk-i7>
References: <cover.1637917008.git.viresh.kumar@linaro.org>
 <CAMRc=MczSGs_FJ-ezLt9R6nhYo9RNoOrsvz22LJ6c9mDumggNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MczSGs_FJ-ezLt9R6nhYo9RNoOrsvz22LJ6c9mDumggNg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-12-21, 11:58, Bartosz Golaszewski wrote:
> Thanks a lot! Are you fine with me squashing this with the big patch
> like I did with similar fixes from Ben before? The patch is
> technically still under development (this kind of bugs will be
> uncovered a lot once I start writing tests) and there's no reason to
> merge it into master with bugs.

Sure.

> I would keep your signed-off-by of course.

Its okay to drop that as well if required, I don't care about it much :)

-- 
viresh
