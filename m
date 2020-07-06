Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EBB2158CE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 15:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgGFNq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 09:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbgGFNq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 09:46:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DB6C061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 06:46:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so45461056ljn.4
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RkuIfciSPyPXrSkEl1s1JRHJQ/3MzHgmqoXKdPaAFrM=;
        b=GMp5J3Hbn3MO/yaK/jgxoMMXtIPRVdExvGwpiv0Fy0lQaqsfZgNekNwfEFLCZY/476
         WEg15tR9FhQ4mKwLrZBzxO0kA/NgUBcVSFM9Y22nIZpOFnbMH60Hg/Xqw5ViGa2krl6i
         2iqPV/KwZHQe97l4m316kRpmN42yZTqOpb6h6KXunquossMZhFPKPCccGs0rlcggNznl
         dG5LfpXo8OBlJ/sErZtGukXrYbdmRyFleM619ahxQzw/ivUOTWY8Vz6GbZTS/3RmmnLf
         3OTZMD8Bxx81vO7AbGMKiW7p/reqLH93Qc0ZRWQJEHKdT9h7SAPAAdy8o2A1I3e3bt31
         gENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkuIfciSPyPXrSkEl1s1JRHJQ/3MzHgmqoXKdPaAFrM=;
        b=q2Xqosc1vR2jMXgaWvYTyEs6xz287QyDySH8ll9Z8dpxoZ6qGtq8MTFNrdGZ7PXSKw
         iebHW6w3sLlGhsvak/PaNmM3lwNpIKzgV4oeH7WsF300XWdlWuoEe/n1wVpiFgw4bO85
         7JS7JRcL4BzWpbpgvxsZEn/UON/7xCgAYLIB5FitcqGx4r9DUu3sxc2gR01sFA7q4K+x
         CH3QYaImqEngDzyxlEQ6qOyKNrWWTNPdyvNWqNcJ5aiIrphXDeDIY2CxTJKSc+nBPrhL
         ea7qXLn3HjQbAnZCNlSY5mFzq2poarbvYEySOAw7+caUXL4FjBs5V9llgbkl0ZCTQyAn
         0L+g==
X-Gm-Message-State: AOAM533NudFaKVepgaw/EX1b+uEJG44us9itXmfNIgvkufSlhA/CAsbh
        Kvc6BXEwPNFPb/7FGPg832CbJwxcnSj8fLYOVKHQJE9u1rg=
X-Google-Smtp-Source: ABdhPJxFEPAnMDDmbdiCFckbauejl60S7Q5jeZ5PGk7Lxr+hZr2S+9Oej1mS878fQMud/4VvtDo/3Rdcxx7UUcdySew=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr28361421ljj.293.1594043214904;
 Mon, 06 Jul 2020 06:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200703121735.6738-1-geert+renesas@glider.be>
In-Reply-To: <20200703121735.6738-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jul 2020 15:46:44 +0200
Message-ID: <CACRpkdaZA5UGuy=7GSkwubRO33N4yPxQc-_fJBkiRxzxEcOuTQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.9
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 3, 2020 at 2:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
>
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.9-tag1

Thanks a lot!

Pulled into my devel branch for v5.9 and pushed.

Yours,
Linus Walleij
