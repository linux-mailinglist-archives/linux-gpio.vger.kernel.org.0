Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848762512A8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 09:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgHYHKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 03:10:16 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35150 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729287AbgHYHKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 03:10:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id w10so3235231oti.2;
        Tue, 25 Aug 2020 00:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9nDSEan/YQK8xpD3cMjTRl5PnART66gSZqfe7bk+3Dk=;
        b=o7HSZLMLH9LmTRwPHwrV9QJK3dBPuh+lY6IP3vbvY99skGz+exym6EGHHA1yCgtvuG
         zSjfpQU6Hr7JC+H9q+VR2hvStmRDe28dN9Q/5iAetMdOfm/Q0+hGLEL/8pmpUkplc6YQ
         zOpzIB+zIsiFmU5gAuTrf97ed6x9pPHJCTt0tErD03gDE6Hrz+zW/o7Qe80n6TW2o2hr
         sYzz0niRl+PL6Y8Qn8eXuOASK+J67RJP2YoanEsh4ro9twuuAZkjoFyJXBVUrFQ1F8RD
         BFi8o/bNNBVszIk9so9KeUvGEvCfDGrlh9gS8PF1thKh8f/M68gnwaDcYE2SExqJyWGI
         vRDQ==
X-Gm-Message-State: AOAM531/K46z9r5tK/BFmz65Sz3NVhI+DvGwcf2cIZ4bCARd16X+qJO/
        AnRtm9NugKbqpdylF4Z/6np2mIEpFEtCbuOqzq+i4JGU
X-Google-Smtp-Source: ABdhPJzktU2jr2lEJIVOdCGe2RQWv3GyPKEPdccH+4NA5/fJfRoBro6fywfIEEM8c3bRhFK0bkb/aHmDD5Fw9XKE6gQ=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr5545078otb.107.1598339414496;
 Tue, 25 Aug 2020 00:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111401.4021-1-geert+renesas@glider.be> <20200824083007.x3l6ujn3mi5xhrsy@uno.localdomain>
In-Reply-To: <20200824083007.x3l6ujn3mi5xhrsy@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Aug 2020 09:10:02 +0200
Message-ID: <CAMuHMdVaaNx2MbUiNKmvy=SnaDFEqpDVUNE7f+ftw4kw7Z=5gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza1: Switch to using "output-enable"
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jacopo,

On Mon, Aug 24, 2020 at 10:26 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Aug 21, 2020 at 01:14:01PM +0200, Geert Uytterhoeven wrote:
> > For pins requiring software driven IO output operations, the RZ/A1 Pin
> > Controller uses either the "output-high" or "output-low" DT property to
> > enable the corresponding output buffer.  The actual line value doesn't
> > matter, as it is ignored.
> >
> > Commit 425562429d4f3b13 ("pinctrl: generic: Add output-enable property")
> > introduced a new DT property for this specific use case.
> >
> > Update the RZ/A1 Pin Controller DT bindings and driver to use this new
> > property instead.  Preserve backwards compatibility with old DTBs in the
> > driver, as this comes at a very small cost.
> >
> > Notes:
> >   - The DT binding examples already used the new property,
> >   - There are no upstream users of the old properties.
> >
>
> Did we introduce output-enable after the rza1 pinctrl and forgot to
> update ? Good catch anyway

"output-enable" was introduced in response to early review comments
on the rza1 pinctrl driver, and both changes went upstream through
the same sh-pfc pull request.  Seems like part of the update was just
forgotten.

> Great! For both parts:
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
