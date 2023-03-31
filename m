Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50DA36D1FC7
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjCaMLd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 31 Mar 2023 08:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjCaMLd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:11:33 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E518D1CB87;
        Fri, 31 Mar 2023 05:11:25 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id k17so27096769ybm.11;
        Fri, 31 Mar 2023 05:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNaf+PP4vkSwUtiyvNYEnYq/I64DMQvhmM0lHG5VX7k=;
        b=R0f0R0RBqIwWQEsG+M+RPZ/rGWmYg4MrDJDII9fQsJaqR/veNahVy8kfPWJKw9w8uV
         KKhmEgw+snTCH4LeTaOwevSSH7yM4VKpWuL8gzgEzQLgofRFLQ3Xttk1T7eFaiEdtONQ
         xFIGax9xZhgDJV0VW66Bk8KugqybfsbEgLA4fWP9y3aAscceSTfPMHJxBPlJVwROpH/8
         wxCdnn7Xyr9rGhDvxIBwW7ferQp6o0kKd/lBzHrI7KeqgxVULwcBy7ZOJr0FBJbRdsf1
         EJ0//q6+UQi0qzELcY4uvIaogRBbD86yQndSMTsN+EVBaSPamRdqQxRZcYpUI4PDxbId
         hotg==
X-Gm-Message-State: AAQBX9cu0YpW8GFtE0bW+ipAdoeof4XuPmngklfZNTGGl+xiCAHKOqos
        WhMC44Mx00MnRJ7yA0qFfURl8KlWbZq31O9+
X-Google-Smtp-Source: AKy350ZqyQmsUUxfUZaEHmaufSjKq/tfotV0p6sIRJpwwAr4mJLss5Uri1/bOrWXjo6TN1m/2NxFog==
X-Received: by 2002:a25:ae5b:0:b0:b67:5544:7711 with SMTP id g27-20020a25ae5b000000b00b6755447711mr26210842ybe.9.1680264684778;
        Fri, 31 Mar 2023 05:11:24 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id cp8-20020a05690c0e0800b00545a08184bcsm483678ywb.76.2023.03.31.05.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 05:11:24 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id f188so8663064ybb.3;
        Fri, 31 Mar 2023 05:11:23 -0700 (PDT)
X-Received: by 2002:a25:bb85:0:b0:b7c:1144:a708 with SMTP id
 y5-20020a25bb85000000b00b7c1144a708mr11161655ybg.12.1680264683138; Fri, 31
 Mar 2023 05:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230328101011.185594-1-biju.das.jz@bp.renesas.com>
 <20230328101011.185594-2-biju.das.jz@bp.renesas.com> <CACRpkdYDR8Vuvag6nyOy0BWQ_qEmbz43ro4B_xjf9vUXckeL8w@mail.gmail.com>
In-Reply-To: <CACRpkdYDR8Vuvag6nyOy0BWQ_qEmbz43ro4B_xjf9vUXckeL8w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 31 Mar 2023 14:11:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqUbfL1PwbrKPr8iXaV7LHS=UgmskHQKRq8=5XYc8Jtw@mail.gmail.com>
Message-ID: <CAMuHMdUqUbfL1PwbrKPr8iXaV7LHS=UgmskHQKRq8=5XYc8Jtw@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: pinctrl: rzg2l-poeg: Document
 renesas,poeg-config property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Mar 31, 2023 at 11:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 28, 2023 at 12:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Document renesas,poeg-config optional property.
> >
> > The output pins of the general PWM timer (GPT) can be disabled by using
> > the port output enabling function for the GPT (POEG). The HW supports
> > following ways to disable the output pins.
> >
> > 1) Pin output disable by input level detection of the GTETRG{A..D} pins
> > 2) Output disable request from the GPT
> > 3) Pin output disable by user control
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> This looks good to me, Geert will know the details.

TBH, I do not ;-)

> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
