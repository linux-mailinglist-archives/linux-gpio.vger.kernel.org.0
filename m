Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23DD8169E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfHEKNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:13:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39440 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfHEKNz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:13:55 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so78748818ljh.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyWiii3HO9p+TFpHcYcc5tlXunPtGl4mlPSEP3RBVd4=;
        b=tKnr9ylpIW+IXa6FxC3GCzb1q95d3SE8d9g053PBTuKou/c62RvDkCMC5NfX/Q86kl
         EczsGJ/brZyHZbfKP/Ky4oXP9VeAMorleLLaayDh6ccR5TSNU4TZKsC3UCH6KvKHUr3Q
         ZiWT8PJ2D1Co+E7jiJdupebDFE0QKtFjJUObWjjPx3phvmnvYxoE/rAhpjOcv6+OIS6P
         Nw5EiJaFv9nYRYSCfbkRtOVcBn9ybiXKtu1su88/MYZswFeZtsafvTIph4Xh4ROiIoyA
         apKDPNECky9qV5SGzHpJKFXxBbvYk2OYfYtRS3EM99oLlNIJ22fiPkqLpb5owyfi55ww
         MCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyWiii3HO9p+TFpHcYcc5tlXunPtGl4mlPSEP3RBVd4=;
        b=Qjq/wwWoIGW3RT5cAikELW63ipEbO4hESCjtuADLFvS06qlcWeXaq9mkz92WVYV8BI
         gSh7Xpbpiyp5PNkrA6MBwArhe3uM/RkExGC2DYsZ8u6ZIVBYReqMiYweJEeCjsq6RwJ9
         +Heka3/hNhwdwYT3sjOKtBJshBcxn70aQBJpeWPceWEqHnCJuLgUwlnQSt4HN5wzpgIO
         G+flkR24W0h9wOIo8HhYomqq/vR3HWd7kxENZdZrnup41Rqha+BI8yy1bVsbEvbuhG5g
         yCrK3cKtzh9CnxTwmf6R+7lU5nqCNR7EN9enJ/AkpGP7LoszxTHGKtasar9OAcBiV9ji
         vPEQ==
X-Gm-Message-State: APjAAAX2oXU7aSyUUnnH2x6dskaNm96+LrzgOprlRrJ2xbMstZXY00yK
        XD4VEOSAioVJK6goliBFf4oA91cob7GVuBeK1gbCtQ==
X-Google-Smtp-Source: APXvYqwEAD5hMUt9shkAn/sfk0eGbfMNEwTTV9vY/J0lOGBJvfYm/cAHmt0MUBPZTHVqJdNBLXBJ8o3s15tDgrjmvK8=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr14816614ljm.180.1565000033697;
 Mon, 05 Aug 2019 03:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
 <17af5e761e0515d288a7ea4078ac9aa4a82a7a4e.1564048446.git.baolin.wang@linaro.org>
In-Reply-To: <17af5e761e0515d288a7ea4078ac9aa4a82a7a4e.1564048446.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:13:42 +0200
Message-ID: <CACRpkdagg+E08E0Ywsn0jnbfcnB=mM5fmbjbGETGGtwHqBtRYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sprd: Combine the condition of MISC_PIN and COMMON_PIN
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 11:56 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Since the follow-up pin design on Spreadtrum platform has some changes,
> some configuration of MISC_PIN moved to COMMON_PIN. To support current
> pin design and keep backward compatibility, we should combine the
> condition of MISC_PIN and COMMON_PIN to configure an individual pin.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
