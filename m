Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C064D23FFFA
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgHIUgB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 16:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgHIUgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 16:36:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB8CC061756
        for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2020 13:36:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so7445095ljc.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2020 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSSDBJk6gLE6rhGULG1G81ocpF+POHgO4nE9N3d7HUY=;
        b=ySlzyU3jUGPCX5KJkkeSbdRLwPab/kKxNC9gYhEFvTvICpgsKTziAtKKaxwnXMPrSo
         iFMmgPWmOSYE+3wNISfHXo4r3HxtW4xIV2GWoROvAj+HfqOMZrMS24sM4mxdwB0TYY3X
         mh/3vUcoKPlwx22+sAX1YTiTqwTjmnGcYp4hMM3oFvBkz1HtHqeJQsyVLBYmHPi57O8P
         IWApaiSk7SJ7M7Yec1VxO6xW5+m2dPr9QhlovomgAfafpIfli9YnUDR5SXRZ1Diu1g6G
         1Rp6v5IV0GZIcjnO6H+MzWC2fPREj8xS9eOKDyNsIYEcTNsKiUPzd1ufNdzbgGpBd1QC
         6vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSSDBJk6gLE6rhGULG1G81ocpF+POHgO4nE9N3d7HUY=;
        b=VqK2owiP0BGRNyznzPCyQQR3Q9bEsf4cWHt0R5Av8Uoeced8nAzfUSFsdrHb3qMGMj
         DqubeL2pAUgflrmQ3B5POMFLzkovFnqbhMvRfD2OwnLc4HvDf2vbzjlkNg9hp6Xy6gs8
         Mu2fschwjBQPPA1Ts7dVedYugdCKQXLf98wOQ67tfys/VOVzTRGpfqeH/05Tj++xNcQw
         DIizUXGDgzoWmPvn4MaZXcDJdFOdu/C18FPsucNj95lt7LwIy3XiE3cA0G4DVK6QmU8p
         5/Hdk6EGXIipnQKFBDglKU835M6gyHvSbVEogCMC2ji5UEhqcB0pqFVUqaXk9UDWcZyD
         BapA==
X-Gm-Message-State: AOAM530NoNKn3Dzl3zJTdfY+7jlmfKvOk6eWTVUOopbO70H7xS9+1t77
        aXdmzGH7SII2NJC8bqW9idfK9ZjZrtl8Qqvlau/xeA==
X-Google-Smtp-Source: ABdhPJx0+3HiK4BERST7xDlbkaqD0iE42jj++Nyzx5kx74nhW84mJ4cQsAa4/220bB8gjDfH3hkU85U+ShOtTiaYWdc=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr11146237ljj.293.1597005359121;
 Sun, 09 Aug 2020 13:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
 <CAHk-=wjHNkPHvGG_Ca_f8=+w5od9_XTQ8yD55+v-3WCKhvKviw@mail.gmail.com>
In-Reply-To: <CAHk-=wjHNkPHvGG_Ca_f8=+w5od9_XTQ8yD55+v-3WCKhvKviw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Aug 2020 22:35:47 +0200
Message-ID: <CACRpkdaVmq3XhioG_=nNKSGVq+uAff7OAJPbyx04vVGCg5aE5g@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for the v5.9 kernel cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 9, 2020 at 9:55 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sun, Aug 9, 2020 at 6:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Driver improvements:
> >
> > - Linear improvement and cleanups of the Intel drivers for
> >   Cherryview, Lynxpoint, Baytrail etc. Improved locking among
> >   other things.
>
> I'm having a hard time parsing that. What does "Linear improvement" mean?

Sorry, gradual or incremental improvement is a better
term.

Best regards,
Linus Walleij
