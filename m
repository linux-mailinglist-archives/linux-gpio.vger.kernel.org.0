Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C0921F37A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 16:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgGNOF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 10:05:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgGNOF4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 10:05:56 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72389222C8;
        Tue, 14 Jul 2020 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594735555;
        bh=P/b3qBim58jOi0T9iazFlSIK9JF/mfU1hTzN9suN5hA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Dcswyz5UqgNEro6U2tGc1+7TSVtrOoEjeQkDpmOzTtIp5OrgVP5yJMSf+eUiSZn9g
         8Rm4slSOye1Wq+v6n/lSkE4SqlphAVYeRsdE4YHQk7v1FNGPax1rETYZb9/lPtka8F
         M2W6UckPkuOH47FxomIioJPrdwDjrIJ4tqro5HIk=
Received: by mail-oo1-f47.google.com with SMTP id v26so1778605ood.1;
        Tue, 14 Jul 2020 07:05:55 -0700 (PDT)
X-Gm-Message-State: AOAM532H8DPO9FJkRoF4GzolHN7yUuGCDtEp1D2p5GWR0APNF2wIOtgt
        3ECEq4+pCFbksAv0sR+rogpzmOyilQAxtZC3Fw==
X-Google-Smtp-Source: ABdhPJwt7s8kLRi4lZYvoY3CPMfpFeErf+RroL4RvEsrKUanQ9XskXBuGGgwa0AfXOesUjk3DztRE0blcNThYHxe6Ic=
X-Received: by 2002:a05:6820:1015:: with SMTP id v21mr4586237oor.50.1594735550633;
 Tue, 14 Jul 2020 07:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113740.46450-1-paul@crapouillou.net> <20200713153252.GA234029@bogus>
 <ADZEDQ.ZXJ99TAYD15S2@crapouillou.net>
In-Reply-To: <ADZEDQ.ZXJ99TAYD15S2@crapouillou.net>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 Jul 2020 08:05:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
Message-ID: <CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: pinctrl: Convert
 ingenic,pinctrl.txt to YAML
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 9:36 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Rob,
>
> Le lun. 13 juil. 2020 =C3=A0 9:32, Rob Herring <robh@kernel.org> a =C3=A9=
crit :
> > On Mon, Jun 22, 2020 at 01:37:40PM +0200, Paul Cercueil wrote:
> >>  Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> >>
> >>  In the process, some compatible strings now require a fallback, as
> >> the
> >>  corresponding SoCs are pin-compatible with their fallback variant.
> >>
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>
> >>  Notes:
> >>      v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
> >>          - remove 'additionalProperties: false' since we will have
> >> pin conf nodes
> >
> > What do those look like? They need to be described, but that can be a
> > follow-up.
>
> These are generic conf nodes that are handled by the pinctrl core.

No such thing. There's a set of common properties, but that is all.
You still need to document which properties apply because it is
doubtful they all do.

> Nothing specific to the hardware described here. The subnodes don't
> have any specific pattern so it is not possible to represent them in
> devicetree (we'd need a 'catch them all' wildcard pattern property).

Ideally, the nodes should be named something we can match on like
"-pins$", but if not you can do:

additionalProperties:
  type: object
  $ref: pincfg-node.yaml#
  properties:
    bias-disable: true
    ...
  additionalProperties: false


Rob
