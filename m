Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7854A9E1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 09:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352699AbiFNG4O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352702AbiFNG4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:56:12 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0243B00B;
        Mon, 13 Jun 2022 23:56:09 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id 68so5730825qkk.9;
        Mon, 13 Jun 2022 23:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5C5c6a/FjphgO/+q9LPOsae/PEJeCJHHPy+5h5zaKZI=;
        b=MVjq5s5BPBS5AWhlPkXdymPpYUTyshrzTFn9BI56DDskBExb3HzsaJ0KSq8PqsnxY2
         K/Sqs6bqRMeNUwCru+POipej6Cs/2ts2DAo27qB0h0sRDPcA8zEgFl6/vhptNkE9kopo
         tMuHdwSFhKRnCgqDiyCoLS1AXDI2hAYS5E5SEBcYpyPwoMWS7T78DIgc1rXJleOmCXWO
         hi5puZ9d9L4VPpJiygiTGqBRGDnMNBVgiVAgKaxGNhpn4DJkvy+2k9M/QyoZ1LUiHS/K
         zztKCdhW24biQAJHmd/WupwHuh2cSNh+uIaeVCWFQa26mTyTxIS5EuOwbpqkCiedfj3Y
         +0UQ==
X-Gm-Message-State: AOAM5309JVfURFHXU2S/ZKIHoO6w0O0VscX97hZS0woXovd0oHsuUKcl
        bHhsw1YJuKpqtanZIL+ulRU7ezGsn4z0Ow==
X-Google-Smtp-Source: ABdhPJyzqxvE+eSJdTGFvH3Kya1b/Yi0dwPrIr55xAk4GjgdGWrOY50RwPNjf8ApIgfiyZgO+Kd/Yw==
X-Received: by 2002:ae9:e402:0:b0:6a7:86a3:752e with SMTP id q2-20020ae9e402000000b006a786a3752emr2845650qkc.300.1655189768079;
        Mon, 13 Jun 2022 23:56:08 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id ca21-20020a05622a1f1500b00304e5839734sm6552335qtb.55.2022.06.13.23.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 23:56:07 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-30c143c41e5so20290657b3.3;
        Mon, 13 Jun 2022 23:56:07 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr3936784ywg.316.1655189767410; Mon, 13
 Jun 2022 23:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
 <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com> <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
 <877d5kkuiq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877d5kkuiq.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 08:55:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhz==kdNejHh9t15cRVLxyxamsj4APOU6gz1p5H9-=DA@mail.gmail.com>
Message-ID: <CAMuHMdUhz==kdNejHh9t15cRVLxyxamsj4APOU6gz1p5H9-=DA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Tue, Jun 14, 2022 at 1:34 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +#define CPU_ALL_GP(fn, sfx)                                                                \
> > > +   PORT_GP_CFG_19(0,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
> > > +   PORT_GP_CFG_29(1,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),  \
> >
> > GP1_23 to GP1_28 do not support voltage control.
> (snip)
> > "<= RCAR_GP_PIN(1, 22)", as GP1_23 to GP1_28 do not support voltage
> > control.
>
> Am I missing something ?
> I guess GP1_23 to GP1_28 are same as other GP1_xxx.

Table 7.28 ("Configuration of Registers in POC0 , POC1") documents
voltage control bits in POC1 for bits 0-22 only.

However, the pin function spreadsheet says GP1_23 to GP1_28 are
1.8/3.3V.

Which one is correct?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
