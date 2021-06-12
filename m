Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F29C3A5042
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 21:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFLTMF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 15:12:05 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:40512 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhFLTMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 15:12:02 -0400
Received: by mail-lf1-f50.google.com with SMTP id k40so13853670lfv.7
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 12:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ga1InjZw/kSI9gDXsr9QAikDRt/eqge6C65ybQbAbWw=;
        b=gJJJE7LJ5IT0Jmn4YVDLEtNdz6exMrFOkDQlKfDi12eIH9fwYVGEKP4iYCgZmlmzeH
         A4mQgg2zJjGrgsekQe27BTfIeVb2sjEC4J7eOzzS4iE/xiZRqUZ/Uy2bVcp3Vt4zWlrh
         Plz8Ch8WXiZznUhpMBxlsBZQP86tNSmkKprzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ga1InjZw/kSI9gDXsr9QAikDRt/eqge6C65ybQbAbWw=;
        b=E7hqslpggkwfAfTXWyOGMZIJ9obCADYOouce2nNxag6kzCuuswcZdDSo7eeQgUa85s
         AVQSRF193EL+YoxjY5XmsSTZ65Qp9ugMp9k5ybX1mqwhEZJTksq9+9FW8u+KFjQAhPcu
         1iOHOAyPyAseeMKmMnfwBS3pQbIwgn6vDvsEss9YPGBPHVVcuUoiw3qbCkrrxUvvnD3j
         5JjK85LSkosCL7lUv+cwtR6pHBf42ulGgSMR9kA5CFV4h6L26el5SYCINoFe3CaxhlsT
         uY10qnVB6OnTAhFDsI0OS+yIhwOpW9TvqUWO1wn0zOCvKBbiS57uDAyoVS7EK3nAKZ+g
         Avhg==
X-Gm-Message-State: AOAM530Xw50kY+t7G7TcHCNDT2JQ1XXJvn0yiDxZvSEAYcaOlLbjf6af
        E6jZNpnF5uyGXTXOdWPopHjtZF9fR+0fkHMPnHY=
X-Google-Smtp-Source: ABdhPJwIXT+Y9hXavQXimZsN9EvApd+19OohJNP2fUUkuFArtB7AbvIYpNOqt6UMAIuF6gjJ3v9gGQ==
X-Received: by 2002:a05:6512:3ee:: with SMTP id n14mr6422544lfq.567.1623524941726;
        Sat, 12 Jun 2021 12:09:01 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id p2sm964409lfo.141.2021.06.12.12.09.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 12:09:01 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id bp38so13931925lfb.0
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 12:09:01 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr6282565lfc.201.1623524940718;
 Sat, 12 Jun 2021 12:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
In-Reply-To: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 12 Jun 2021 12:08:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRA2B1b0gn18t+e_TaJdJGQ8Lurpw7qmyZZmQaGwZo8Q@mail.gmail.com>
Message-ID: <CAHk-=wgRA2B1b0gn18t+e_TaJdJGQ8Lurpw7qmyZZmQaGwZo8Q@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v5.13
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 12, 2021 at 3:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/pinctrl-v5.13-2

Nope, not there.

I think that "linux-nomadik" is bogus, I do find those commits in the
usual "linux-pinctrl" tree.

How did that odd thing happen?

           Linus
