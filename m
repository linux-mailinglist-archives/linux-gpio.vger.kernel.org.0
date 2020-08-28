Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEB12557F6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 11:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgH1JrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 05:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgH1JrT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 05:47:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20E2C06121B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:47:18 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so613076ljj.4
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=roGu87yveuQO9la8ys4mBHvnqd7ZGmx1Iwu9jExueuc=;
        b=zD1tIMGq4tiWZYYoc1HPTKcMuJmm6tgKHB19f+kkku6Adfr7/ji9nlvWhivGf8BqJ9
         WAFIS5ogQdHOurHhHlFerSyA3CTuUAbLBXrWcE/RcPwDlkKe4u1Xl6wXaTAHeC9UPHri
         dyGzzbnctdlgXvIpR5cSCII7+6SfjSAOV3sP7go6TuFIdWWr7DwwtXEnp5Txae6oKXqw
         eR58vDvPDuybDw8XxqADeMLzlLFwYjKLDOEdNVw/kElEY9tTVt8zdve0Bk/zzF2AeQfF
         Ar/y3tLWshqwQOE8jB76GB0vPZ2CrqNb+uipA34tQbB0fhc2dWDdcZUQD7Vb3wOm1xYY
         Wmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=roGu87yveuQO9la8ys4mBHvnqd7ZGmx1Iwu9jExueuc=;
        b=HmxBYwyf+1CZxqmHuE/65VhF0y+S5L5ZsWTyMOOxQEvvo5h8K/0FqFUDZYjUR5KJ4Y
         qjOGvQg4EBS8uh+1FfUqNhpQu2xAUaOfyjkU/Ew6s3oV37Uc/oPJNRRuTK5oooFYbOYy
         DuagLm9VWTOlNFebga5TbFN35IrkSP0Zu+dh1+K8d9eAP2ovhcixNXu3ldurn4DAiB7g
         AGz9k5tGtozpQW+gkZ8vEASuXMJOWmCEkoTUHgR6a+hKbnoLaW4K7SBQQj+gYchaTN0R
         eItrmjPpi1tQyHDDhQx6FtmVDYqCidRH0KFpuIh68RB90ch/0O+UCw4N//u9BdOqVy96
         dlpA==
X-Gm-Message-State: AOAM532fFU6dMsWHcTwuiKjFvSOTSn9W/nR5a0gn9eEWTEtg3wiyuWUm
        ENizzFYFkPMs6/66FWHGEl7h5wQfzIN5VAycK0wLAw==
X-Google-Smtp-Source: ABdhPJy1ohPs1elEqr4zv8xMxHoFxCZlVX51e0eO5VFD1ifUSw7hHiv6hggh/SKBOUIhhjUYhxQGhSUP9/+7sMoT+mI=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr453506ljc.338.1598608036936;
 Fri, 28 Aug 2020 02:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com>
 <87pn7phofb.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWqc1Peo06g_1JrEvEExyaY+k33WJNmbhugE7YrppiRmw@mail.gmail.com>
 <87blj0zzax.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blj0zzax.wl-kuninori.morimoto.gx@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:47:05 +0200
Message-ID: <CACRpkdZ_ss-GqV0ig2BPpEE+8-F-9qZzpb+-C5h0TpbWCcL6Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sh-pfc: collect Renesas related CONFIGs
 in one place
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 24, 2020 at 2:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > Renesas related pinctrl CONFIGs are located many places,
> > > and it is confusable.
> > > This patch collects these into same place,
> > > and group into "Renesas pinctrl drivers" menu.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Still wondering about moving drivers/pinctrl/pinctrl-rz{a1,a2,n1}.c
> > into drivers/pinctrl/sh-pfc/, too.
>
> As I mentioned before, I'm waiting Linus's opinion.
> But will move these in v3 without waiting him.

Sorry for slowness. I agree with this move, let's collect all the Renesas
stuff in one place.

Renaming it drivers/pinctrl/renesas may be a good idea too, but I'd let
Geert decide and execute that, it mainly affects him and his maintenance
work, not me.

Yours,
Linus Walleij
