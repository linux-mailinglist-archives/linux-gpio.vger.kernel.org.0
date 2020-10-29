Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB91C29F2B7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 18:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgJ2RLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 13:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgJ2RLs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 13:11:48 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944B5C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 10:11:47 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id dg9so3769718edb.12
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7msipSc39tbx1cyam8omVWWLfNOcLFksmzhLfw5XTU=;
        b=Ntol3+ZCQdnYkvEnnGcK6/sb2MP3E3Iv0WyuPD3TEh3RsyFIlLIbWDZPLenuJhseJd
         PRao5U88R1b15s775JvkBydB0C3Ppdz6is+tlkXlOebPD+eyL50aS0wNzhTUo169v2GH
         FG1+hXR3AtcxocCKOA4fK6FaCzKGdDkadP8IBZphfOoIU/MeFWs5d5Za6m9bVS4SccOP
         CPOhPlmn2ezvhyB0dsJaE9AJ//uH8fx6VRvUpqO/ElW/Oot9e2+yn+zA28ER8BstNHiI
         aLMTxPCcT7BHiZtxSHS2CuhsOF3BIPf45R17FPrLqGnfnktYM62YiABQ2gdQwI7JJZdU
         jscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7msipSc39tbx1cyam8omVWWLfNOcLFksmzhLfw5XTU=;
        b=mA5OzvM0hHOL+XIBqXqQ4ma3TtEVxsPiROFyCTrjrO4O8UzbEr/GpKwg64lWMBv/fu
         k/afbd8UIYjvEEnLTzmwcHpzTsNju1+0WANUces2nZyi2srIhiEI4yd9Byi9aMFV3ur/
         cSlfUHFtpHf6fYip0JsTBdiwS/8HzxomGM2e5G+pIm2kp9wu5Ow1E2SYouW4UmXL1shN
         sPiNUKz67T+IaMhF2lSf8sDcDUWeBl5LhP9MpSiK4QcrQRhP/4wbnhluEbScvsKUwUjE
         M+bqv3m/EEAnNM7hvTni3UsAkl2ZuQmhqMOCSr5Kgr95cvG9BISBuh49m8FL5esCDYyW
         mXXA==
X-Gm-Message-State: AOAM530u3mpxb+0n+DK+4P+iX2JZXuIpaWYpjybMkKDyf1gw4nOBkds7
        8cYXM/9nf3DlUORsEjJjoS7SA2iUZd27MQAoUij+0Q==
X-Google-Smtp-Source: ABdhPJzaEhMJXsACQWDk9L0LSAaUdCxVgC3daLMdvGu6jdDQF2oJHrqIDTIma9G928K/x3q1Idovqlw76AnsZGHAmWE=
X-Received: by 2002:a50:96d2:: with SMTP id z18mr3478714eda.367.1603991506282;
 Thu, 29 Oct 2020 10:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com>
 <20201004162908.3216898-3-martin.blumenstingl@googlemail.com>
 <CACRpkdbTw4UBw02RXX2prju45AsDZqPchhz=gdzsuT-QjhYHVw@mail.gmail.com>
 <CAFBinCAFDhWp6mgUqyOjdMVBR5oZQVpmVPjhnZs1Xg16tFa0PQ@mail.gmail.com>
 <CACRpkdZdwoQCxxqosn2jQPMXLDnTEjuxSWOxG-L1YGE33wbFrg@mail.gmail.com>
 <CAL_JsqLF8KHG6qZUJzdMyN5cX-ZvPDbuGSGZLOw=CkY90SUGLw@mail.gmail.com> <CAFBinCBpDn1Vx1ZQdk-Gf-muuAyxjXb+zCkvW6jsH8jP6mDuTw@mail.gmail.com>
In-Reply-To: <CAFBinCBpDn1Vx1ZQdk-Gf-muuAyxjXb+zCkvW6jsH8jP6mDuTw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Oct 2020 18:11:35 +0100
Message-ID: <CACRpkdZ6oaLJoPPROzRmL0yazy=aGdAw5SOx5+F5g2wQ3ro11Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] dt-bindings: gpio: Add binding documentation for
 Etron EJ168/EJ188/EJ198
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 10:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Wed, Oct 14, 2020 at 2:43 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Tue, Oct 13, 2020 at 8:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > > I do not understand why a PCI device would need a DT binding
> > > at all. They just probe from the magic number in the PCI
> > > config space, they spawn struct pci_dev PCI devices, not the
> > > type of platform devices coming out of the DT parser code.
> > > No DT compatible needed.
> >
> > Same reason for all the discoverable buses need bindings. There can be
> > parts that are not discoverable or connections with non-discoverable
> > nodes. There's also cases where the discoverable device has to be
> > powered, reset deasserted, clocks enabled, etc. first to be
> > discovered.
> >
> > If the GPIOs here had connections elsewhere in the DT, then we have to
> > describe the provider in DT.
>
> this is exactly what I need it for: that platform has hand-written
> .dts files and I need to wire up a GPIO LED

Aha I get it! OK then :)

Yours,
Linus Walleij
