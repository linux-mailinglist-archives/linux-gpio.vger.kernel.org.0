Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE4522241A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgGPNkh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPNkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:40:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383FCC08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:40:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f5so7157992ljj.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYWnANWFks/bePCC5oo2bbtF7CxX1pfRiMfFeXd7lBw=;
        b=xwvT9k736sndiFg0sIwgvPO7ydOgqDT/wO9npnXZfjL/+quI2VQR/bLE2pKYXtkUg3
         HTAAGJstBndE09tu3X99lx7DdZHM8I3KWZZH7eEyaTGoF9wSmJ3OJRPZ+kEnc9L7Khh8
         UJoJ2pTPK7yH6bswje4/X41tS0IL1pyHQumH12nAUEqoUChJkLu3cnFvl5jFrYtUDlml
         ppIH3aTGBcQOn1/jObIKsLP50xE7Gr0FnfT8E5KF7MoptaNlVk8i42LEh0p6q1em2p5C
         iwcnmOCh5l9m1otrD1Ivvs28B6XJsa/WBwP1GfDKoj9RfR+1VNrBc26onN2g6Gf0IZYT
         4Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYWnANWFks/bePCC5oo2bbtF7CxX1pfRiMfFeXd7lBw=;
        b=LiZ3POmQB8BUb1lfvKVRJqcetbkzV20OW68j6n898OJd1N3GhDBAver0W0K15g5sHP
         YcQHw/euLz7NhC9j2+tsXIZRhidQsXYI0cExHEWd8eKTuw/wle56hw5e8NYF9jN5E2Q0
         kRI7drqVLbb3aqcVQwDr4PR7nOYHykOzu9GANep+KgAcZn1uvydBYhsR5t6gD1SE6es8
         h3DAXAdItmCjc1Qv5ym83d5uezy6RenXX6g8LKSj2T6HVAHCtpxFTK6WxABmeOSQh/vQ
         JqNIZ0a39QyjsZPbPrFCXMNMPAuPZFChuqna9YTllZDpC2/9w3uVqHpTRjoWKbKQbXRS
         oSRQ==
X-Gm-Message-State: AOAM530vshTTD8aoh65tuPoo71zdV6I20gbUdQkrfHszXdVyh5MwcEsp
        4wupkkTG+i2g/g7TY3ynAWiwQdF49p5V6NE7ZfXuGw==
X-Google-Smtp-Source: ABdhPJykGEbECmHIO5B92UoVF6jRbzPl//8uncsA/6NdHCw2BnRczeIRHkmYfGfR43eho1/+V5ZpnI4M0AmOpMdeVtE=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1902899lji.338.1594906834638;
 Thu, 16 Jul 2020 06:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113740.46450-1-paul@crapouillou.net> <20200713153252.GA234029@bogus>
 <ADZEDQ.ZXJ99TAYD15S2@crapouillou.net> <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:40:23 +0200
Message-ID: <CACRpkdYLwPVzsz_NVVhQFrvOTKk4MVB+FK4X+Tn88L0R4TTZtQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: pinctrl: Convert
 ingenic,pinctrl.txt to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2020 at 4:05 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Jul 13, 2020 at 9:36 AM Paul Cercueil <paul@crapouillou.net> wrote:

> > >>  Notes:
> > >>      v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
> > >>          - remove 'additionalProperties: false' since we will have
> > >> pin conf nodes
> > >
> > > What do those look like? They need to be described, but that can be a
> > > follow-up.
> >
> > These are generic conf nodes that are handled by the pinctrl core.
>
> No such thing. There's a set of common properties, but that is all.
> You still need to document which properties apply because it is
> doubtful they all do.

Paul can you make a follow-up patch to fix this?

Yours,
Linus Walleij
