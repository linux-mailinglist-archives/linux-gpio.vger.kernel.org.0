Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9032154F79E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 14:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382160AbiFQMbL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 08:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381840AbiFQMbK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 08:31:10 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985E827B08;
        Fri, 17 Jun 2022 05:31:09 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id t16so1186827qvh.1;
        Fri, 17 Jun 2022 05:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJb7+QC11MsMWah6OWgZeaTL7gwbNWgxY/XE8m6pPn8=;
        b=O4TZr5AcZF6wbehiiIFOVXMuLldVXMgN6mt479Dcc91y89FW3aM71Lf3Rw0SGxvMu3
         +tKgOrfnoyJi+fwSnfc+oM4AZJ9ZzqP3j9px1ReLLSnamWPPOe13f8cA2qPuUdJipEp0
         7csq9j2hpuOTa7RyEIR5FHcSZ/4VrpvIgJ8a/UFuPLyjalX2kl13xg+8tmdkus2uRD/a
         21UuLQQAnHARMpYCXy+J4PQx+fcje80VSh04+7U1oWImjBC/eBVUeWZ8OuV696dRD7ZG
         7u/3x9m4vrtFmhn1pwOinKtUk8H6q18Et31qz/hGj1MzIM5xk1Ct3hPk6TbyOHWs0qF0
         jeQw==
X-Gm-Message-State: AJIora+d4jCbQXAKBTNdcZBHmJR66UcJMnFyZRtu09R5xjw14r0XIz1R
        0Q3P+vmWL0OJzn0xGEjkfAuxae2eTSuWrA==
X-Google-Smtp-Source: AGRyM1vbt2jk6xYWqlno2plkIijjgYNFD2em1GzpRP/02wEOZscqVQiTrJtwEpnJMET4TqB056gHig==
X-Received: by 2002:ac8:7d05:0:b0:305:14fa:85e2 with SMTP id g5-20020ac87d05000000b0030514fa85e2mr7995167qtb.661.1655469068535;
        Fri, 17 Jun 2022 05:31:08 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id y17-20020a37f611000000b006a69f6793c5sm3925783qkj.14.2022.06.17.05.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 05:31:08 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t1so7037329ybd.2;
        Fri, 17 Jun 2022 05:31:08 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr10665664ybu.604.1655469067797; Fri, 17
 Jun 2022 05:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <871qvrlray.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qvrlray.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 14:30:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVK2WSThMirCEQyPbb7qcxvsWZ7sp=cpg=bw=__hW52jg@mail.gmail.com>
Message-ID: <CAMuHMdVK2WSThMirCEQyPbb7qcxvsWZ7sp=cpg=bw=__hW52jg@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] pinctrl: renesas: Add PORT_GP_CFG_13 macros
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 14, 2022 at 7:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
> to be used by the r8a779g0 subdriver.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
