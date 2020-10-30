Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5612A0D84
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 19:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgJ3Sgv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 14:36:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:32994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgJ3Sgv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Oct 2020 14:36:51 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52FAC20797;
        Fri, 30 Oct 2020 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604083010;
        bh=Ij7toGsdodJH+g5af0r9MiYPy/qpAd3YN5F+RhUxgsY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2DVdS4mHCoUE4JHIUSmVHAmvB594iwVT4qjbLAdq0KaYWtLmkAcQzyhvgZg75ag0n
         PEWhdDNqSIOTh1JMt0AAzcJ00Ze5LokKTaV/So8QMlv7X6uZVpJF15tiGGivE0hh7O
         RCV+AWVeb5MnfC3QnfBRznxcfwWg7DAuaQExdjBQ=
Received: by mail-ed1-f53.google.com with SMTP id k9so7681037edo.5;
        Fri, 30 Oct 2020 11:36:50 -0700 (PDT)
X-Gm-Message-State: AOAM531qj2Y3/x4fuECKir47rnu8tfT16djT+aiYZlfVPKjsPGrcTjq1
        /GPNzpkXATT1Xqt488nP4huFA9iqXA6ckRyM0WE=
X-Google-Smtp-Source: ABdhPJzlGGUy2WAzm1IY09sGJUjxwv5CeNCRC+4gAdJEbqaWeaJ5HOn9h3HyxBxr7WDmVj09M2PsHz3ShD//bDdRLiY=
X-Received: by 2002:a05:6402:10d5:: with SMTP id p21mr3957562edu.327.1604083008757;
 Fri, 30 Oct 2020 11:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201016204019.2606-1-linux@fw-web.de> <20201016204019.2606-4-linux@fw-web.de>
 <CACRpkdZrUbq6h4uDoxfN70mzfbeWAeqo5KAdTWhiHbsb7VTbJg@mail.gmail.com>
In-Reply-To: <CACRpkdZrUbq6h4uDoxfN70mzfbeWAeqo5KAdTWhiHbsb7VTbJg@mail.gmail.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 30 Oct 2020 11:36:37 -0700
X-Gmail-Original-Message-ID: <CAGp9LzosDB1V-b5ek1epzxkvvuow-7YCDHsgS=2WsvT_aZYHdg@mail.gmail.com>
Message-ID: <CAGp9LzosDB1V-b5ek1epzxkvvuow-7YCDHsgS=2WsvT_aZYHdg@mail.gmail.com>
Subject: Re: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Frank Wunderlich <linux@fw-web.de>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > mt7622 is reported by mediatek to have only 6 pwm channels
> > so drop pindefines for 7th channel
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
> I can merge this patch to the pinctrl tree if I get some kind of
> review response from one of the Mediatek maintainers.
>

After confirming with the internal team, MT7622 actually does not have
the 7th channel. Thanks for Frank's catchup and patch.

Acked-by: Sean Wang <sean.wang@kernel.org>

> The rest should probably go through ARM SoC.
>
> Yours,
> Linus Walleij
