Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB0445D7B2
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 10:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348645AbhKYJ5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 04:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351983AbhKYJzB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 04:55:01 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E55DC06173E;
        Thu, 25 Nov 2021 01:51:50 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id l25so22839457eda.11;
        Thu, 25 Nov 2021 01:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=07AbOv8dDMyajj7bIaoRSoVTZIB9g3nxEk0B+ffdc/s=;
        b=TvjIWybeJfD3SO4W037CLZr/z5Ih+8U5tJCv7AEiDnVifLFKlDExIvjPuDk3uGE3ie
         SvSMLimLdTWcihiXNgg9p5bl682F3OFdCLOLuSxipX4IHxpQphEG3mcOVHNuPp6NCU0I
         k0cq4AGwLzZoRm/8RtOykjYct/p1JC1YE/U8LqnAG2AAt0KHVmn+gd9B3o9yaECD4Usq
         FHcZM7yJwATSwDoKME1soMxk3Muk77I+7Z8B3Qr0nmgKqRHvU+X4GC+pdO4OmwnOaWRq
         ErjyHl7j6pVzRmtaxrTfphDkCfDdb3452BuTxi8OFxQSCvsYRcuz2StHdNUw1Nyiwq1b
         VlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=07AbOv8dDMyajj7bIaoRSoVTZIB9g3nxEk0B+ffdc/s=;
        b=XyIPIIpsmfoMc0Hcttr0/ETPQhrE97EXWy3Qs+BTcqaxpNZ1J9YXyYaLg1DokhvDCq
         HxlRxNn7q/bwA+FTlDotfqnDFU3cx1su/2sCuHAB/qIC80ttkxv90mFuxZqo8g0VgOGd
         HXMYlFqrkYe7ROx16iq9KgkxKmA4s0Eyo4UBY37w53lu+yzJbncvfbBPAJqWjAOCpx7Y
         8s9R42ZVUhzsQKZuwAOQI1zqgKnfKq5Pfcd6yFaZN2oD+PdPiY7Q6KTMTja3xPT/utfn
         uYYZInQU1pHtd8xAE8TZTfl8SzhCy8uIarbOG0pAKQzGJghvke1D/nshklov7wWWq0tf
         SoBg==
X-Gm-Message-State: AOAM532MtziB77F7f0cyD1jIRqYd+HmAuYaFuCjRF8g863HUCqfsJ3JD
        FgxewgpPEbuWbaQCYiHhbrozACWnjt+kEArYWmQ=
X-Google-Smtp-Source: ABdhPJwmGFdyNuAP/xk6zxafoYfmtSFzlJBQOed7ITcYWU4BjHcDTPtcUIXYsBXRIouTe68S0yjk0Dkijg1/kcpHUdU=
X-Received: by 2002:a50:9ec9:: with SMTP id a67mr36354192edf.238.1637833908915;
 Thu, 25 Nov 2021 01:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20211124230439.17531-1-zajec5@gmail.com> <20211124230439.17531-5-zajec5@gmail.com>
 <CAHp75Vev-Q+Xod1gcTyK27hpCkSrDRV5nVbnc58-U7KOHLbf+Q@mail.gmail.com>
In-Reply-To: <CAHp75Vev-Q+Xod1gcTyK27hpCkSrDRV5nVbnc58-U7KOHLbf+Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 11:51:12 +0200
Message-ID: <CAHp75Vdkd3mu2YEnyYAnoLJigvyBReRSyNH_cFtFAKE5i73Mnw@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] pinctrl: support reading pins, groups & functions
 from DT
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 11:49 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 25, 2021 at 1:04 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:

> Have you thought about making ops structure (or ops inside existing
> structure) and all above will be something like
>
>   stuct ops *... =3D ...->ops;
>
>   if (ops && ops->METHOD)
>     return ops->METHOD(...);
>
>   return -ERRNO;

Forgot to add that ops assignment should happen at the pin control
enumeration or something like that. Quite early and quite globally.

--=20
With Best Regards,
Andy Shevchenko
