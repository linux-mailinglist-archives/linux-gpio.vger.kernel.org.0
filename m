Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18EF139B5C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 22:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgAMVZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 16:25:35 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39992 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbgAMVZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 16:25:34 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so11802455ljk.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 13:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ADbsyh1UnrFaJzN4/5ee9XK8MuVx4vuWzhJdbRNFOc=;
        b=gHmKwf/1P5072vi4YjvtTnpBXeLlOOrhasMBORZykUjtiG4jqt91oyWhDSiZK5Gy9e
         yaquTq+dwvwcA7zI5OtuwMlgVuCkGwEFmzBZndA004gBbuTPd8+2z5aVh1vDwiscMtHr
         O5ytAkMYoaTVaCkv8gNbavXV9Mn0DS6pI1PfocvsFf8igE5cUKMyMMKHGkciWUJ0y8P3
         AOGw0MH0C12/rXuYD1ES/QG8qtBPfKsM4tu49YG44LAfUZQ+0myj5RGOo2rhBq6BANAk
         3so7c21y3XSuzLYwZLB+QLkKpk1qJD1tU+Cu/b63YgqKsbwoYzfPaQi0cnC5PqUsY7eC
         E+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ADbsyh1UnrFaJzN4/5ee9XK8MuVx4vuWzhJdbRNFOc=;
        b=NFeqw3T9781Yif+y90+9tGhrz6pmq0rU+FhFQGIbouCiXYWB0Jqd0SBZsR2yLRb8QH
         GExMowaSaAAgPGYQQV8TWAwbdhFyvsR/OO0y273biiQ6oaklwoCnU7hWRkb0/n+H7z/T
         PC+VwnGjKJX92/lwrWWiHNa1Jj16aA5sz+0lajSqyR0q+AtUW6zahsXeOtMlfXM6QNPs
         heORyE5kLyJk5HsoAsaCQDV96po3Wvi8XRpnMPhVSG3oDNXQRM3dB/MMtoReb4kMN+d4
         2tlxB8EKnrXOJWdWHXDRv4ahJ/iJf6xv5S79jqX7V8+vWCTeoeJEQG69d8o68XpTzu/6
         J2LQ==
X-Gm-Message-State: APjAAAUr5hgO2L+Ubf/5h767SgYhjN8PziBRjqda860kQiU5FnChljIX
        ogfOBkbY8VUS9z8iikCItvuiGWLUMxifU19V9N5AQQ==
X-Google-Smtp-Source: APXvYqzXPXquLXu1k8hh0TF9TeiEj+3fhK8Czmzi2b7bpKfGC8iT8Bhser0vePXTE+uaVWW9XMuYNzfpn/c3cOfMqAo=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr12600380ljo.32.1578950732136;
 Mon, 13 Jan 2020 13:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20191218062024.25475-1-rahul.tanwar@linux.intel.com> <CAL_JsqKi0K5Db5CGk7AKqwHML3J8uD5AK8mjoGtiTupr41K_fQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKi0K5Db5CGk7AKqwHML3J8uD5AK8mjoGtiTupr41K_fQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jan 2020 22:25:20 +0100
Message-ID: <CACRpkdZZYVXQ5MpStaWnYrV-L9wJGFqLm4ohuEJ=du9W=-Z5hQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: Update to use generic bindings
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yixin zhu <yixin.zhu@linux.intel.com>, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 13, 2020 at 6:38 PM Rob Herring <robh+dt@kernel.org> wrote:

> > +$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-io.yaml#
>
> Drop 'bindings' from the path.

I fixed this.

> > +allOf:
> > +  - $ref: pincfg-node.yaml#
> > +  - $ref: pinmux-node.yaml#
>
> This 'allOf' is at the wrong level...
(...)
> > +# Client device subnode's properties
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
>
> ...It should be here.

I moved this.

> > +    properties:
> > +      function: true
> > +      group: true

This should have both groups and group.

> > +      pins: true
> > +      pinmux: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      drive-strength: true
> > +      slew-rate: true
> > +      drive-open-drain: true
> > +      output-enable: true
> > +
> > +    required:
> > +      - function
> > +      - group

This should have groups as compulsory.

> > +        uart0-pins {
> > +             pins = <64>, /* UART_RX0 */
> > +                    <65>; /* UART_TX0 */
> > +             function = "CONSOLE_UART0";
> > +             pinmux = <1>,
> > +                      <1>;
> > +             groups = "CONSOLE_UART0";
>
> 'groups' is not a defined property. Should be 'group'.

Actually not in this case.

There was an error in commit 3af50e548019f6ee26d0ed4340f4ab980f884696
"dt-bindings: pinctrl: Convert generic pin mux and config properties to schema"

A function has a 1-to-many relationship to groups so it should be "groups"
for the multiplexing (pluralis).

A pin config on the other hand, such as "set slewrate for all the pins in
this pin group" has a 1-to-1 relationship to a group (singularis).

I am trying to fix it all up in one patch.

Yours,
Linus Walleij
