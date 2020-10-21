Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395B3294EC6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443017AbgJUOfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 10:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410097AbgJUOfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 10:35:30 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D797C0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 07:35:30 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n6so3276277wrm.13
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dT5w4uv1tNjWLC8UqAXWJT+jtfwK1G442QCcb3CVlhc=;
        b=S/VjTAsqDMmWQtdgty8vHu1SHEWL+h2ZgbAN3lhWDComqfczcKxGqkvjcJ4o7rMNBp
         caIafS3g1VX9NE1X4/Rk8qqKnOO5XVifUhYMDHhhCdyspM20R4qDgMFM+5OUmMxTCyNu
         3M0ogyZiMFHFvJfiZT81m0r13jr0Z4eO6bdu+couK/pRPnvY5ca2GI8PRCvwzJ1TwKnx
         V48Nfatx68O0qCO2qCOoo7ovaVmcKqd8EygAof78vf2h/nKxec5I1pscDbotW4Ido7At
         9AiXiuJuUGpH1z1C6n/iJVZWJppagz20G1Hxq0tE8hsSbCIoHgFXN5dhe3fTzo0SYMq7
         CqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dT5w4uv1tNjWLC8UqAXWJT+jtfwK1G442QCcb3CVlhc=;
        b=m3BEHALDqdDvJ3akj1e71E8bhEdkEKtOf/CPTInGjoCCSlnkDYE7e4cfQKKvPcBpND
         pdStsTtHsYFkXIPx4+qqZhcNYWSkkYLqqcNJKT2HDhVPOqfOskmMid+xxZuovIsotPcm
         SgJTZHk8w5SQxEl+mrScn6pCIogBkVcSLLu4J6bu7t+VyHhG1Kl+im8er8ybwT017TaV
         mCLQRrUAj0r2nGarQXZMGjnWmUXEmXf0LUvJGBBZr9PDMHAkTgFM6YG0W2z/tNuc8TPD
         3vUB9fyGaKAw8Ec5wykXh6ic/oDVDlUOu2JGmjn0H9vUYT2Y8nESmWfhUhuRleV+78CM
         9jEQ==
X-Gm-Message-State: AOAM533wiPiz1o68vWPZ4XcH0THyFNv9mVSen6FdvnrjuVkSevK3rarB
        3+8nt3ALpCCcdCs+ZGEicwKVj9XsI1P7t4LNSxo=
X-Google-Smtp-Source: ABdhPJxtBNcczArlbspQslIR0EP9mAqHom9iqz/KoaAc1VEw8FAaLprewh3NJgn6oE0t1+3SeLHa+Dr+gUjEoT4OMuo=
X-Received: by 2002:adf:d850:: with SMTP id k16mr5065671wrl.259.1603290927973;
 Wed, 21 Oct 2020 07:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
In-Reply-To: <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Wed, 21 Oct 2020 17:35:17 +0300
Message-ID: <CAFhCfDZN9Uvz74pXh56=w4LB71R_nO0KQsoDRe8khhDHgbmK5Q@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> If you really want a std::time_point, then you can construct
> one from a std::duration object.

Sorry that should be:

- std::chrono::time_point
- std::chrono::duration

Jack
