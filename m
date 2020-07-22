Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBDD2299A3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732513AbgGVN7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 09:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgGVN7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 09:59:30 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA0AC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 06:59:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j11so2594908ljo.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9AbnK2DBiisXNatLsfCZ81QkLh2Ap9kcRmtLM4dP80=;
        b=kR9XnbymFjjhXns04QUG8omb0X9j5OZ1B3wcCBCnOUSkQ7IgXEeunPoinvLGgUbnQt
         hJsZ/GljXH6oTUb7z+OUMq2/2VoHmBwI6IdGAFRdFJJJH2lCxcGbOmZIEaJnvEvjBlik
         +5KYcieeJd/yTLOBkqRXHiAvgZWL7UoIsuoNMm2T5aeej6ySedkxo5Nh1pTY3aZC2qcH
         B6j1coTyaP0zQEH42rD8fgAxJ2vKc6Ztu1wbbzHVBi6ctd5yqeHrdksxolZ98mPd3eYU
         TJ2UE4FZW9t47IP+vQBli075xkJIZLH+rLgmNJQYzlWbJbWPmU4SxWDhmJ4FuxnO+MLJ
         m7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9AbnK2DBiisXNatLsfCZ81QkLh2Ap9kcRmtLM4dP80=;
        b=fUFB2gnoFtElC8ZnwT3cJGHuF/stmuCrnOk/SAF+F/xxvGGjuMLIQ4WhDhvmanL5w1
         lZHsLaa5glIKJE7oh+BVpaFrBUvYtPfaNEgld5VWTXRdFNMvw6mbYDuQvZwczvZ6ZPe8
         1yCprmBOJ+VMakSDi63Pb9TOEvUiWqCPJwmz0SKyyEp/Q4j8eoT7Osf8MhwEEeKxuEIC
         GAc7gZPMDThDxq4+1d0WIc5Q0czGdIEaxEwSy8aSJOsjFlecfuXr4lWHNfGLfVVwW3cD
         M3sA8L/2pyLJxEjPf1Vgyjz/nfhMITZaLcaOpXFimHG9khTFuXcFCgAxtuXSK8uu3zYX
         LUgw==
X-Gm-Message-State: AOAM533lTnrSNpGZZE9Tbgftsb3N7MsvUuKD/lVunQnoduM+CWfXqA3B
        NVtGkGuvBDVHH/FsEU9tYV9XhFCoKHeDUk7EW6YlSVUz4wY=
X-Google-Smtp-Source: ABdhPJyvMBi3KAwyCUYOu9PACicWNZImJxqnWfXyX0xG3+EOaopuzEK0NFl0IhoulLP3Wd2qmz+vj9XQnTsUqUPhwCs=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr15519144ljj.293.1595426368132;
 Wed, 22 Jul 2020 06:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200721131829.GA67334@black.fi.intel.com> <CACRpkdYcKKQNwk905J+mOAXY-hCx0Pku2wKikMccX6yqECT0Mw@mail.gmail.com>
 <CAHp75Ve=mck42XNbLY3d5w3saOdMkbQusLjEYuNgo5HOz=9iWw@mail.gmail.com>
In-Reply-To: <CAHp75Ve=mck42XNbLY3d5w3saOdMkbQusLjEYuNgo5HOz=9iWw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Jul 2020 15:59:16 +0200
Message-ID: <CACRpkdbmdRfmR9p3f7Zjv+8iu_VWH=eUPJA9KPUm6sXcY0qkmQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 4:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> It uses usual practice, i.e. merge of immutable branches. The pin
> control stuff is dependent on this immutable branch (first patch).
>
> I would like to avoid rebasing and doing it differently.
>
> P.S. It should be no-op from Git perspective.

Ahh I see, yeah this is the situation when the shortlog becomes
quite confusing.

No problem, pulled it in now!

Yours,
Linus Walleij
