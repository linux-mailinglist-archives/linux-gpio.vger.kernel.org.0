Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026EC6281FD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 15:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236992AbiKNOIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 09:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236891AbiKNOIB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 09:08:01 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AFB2A729;
        Mon, 14 Nov 2022 06:07:56 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id z6so6778162qtv.5;
        Mon, 14 Nov 2022 06:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyxScuJ9ru7VMwzCzwbBu/sU0IHxZKqfRZrXVnFdYPI=;
        b=bvbOW2Dm5VfuTkjarz32v8O6PVsPr/IGcKeoH86vr/sPvq+AusQU6XfDt5rRBLBpP5
         QW0An9pnu+QU0oZ3mtqljVx76DBiFcftRXsAj1Z8LpdbN/Gg/thep2/9NimNagvnDb80
         LFq9//fhS+6kURqZvVntLhhoQcaWtrcDSXkWjvmuEvzCjULw1lxnvioBpC3PDuJU7A5t
         cAnFLhMT0OZYlEKOiGm40/BopruJ9PkqWYY1EE612AOGB/Iaxodzl8aBf0ia6cfPdmjp
         qhpqn+WR+qw7rMFUyp7OGsIDBRnUgotEP2pdn38qZEn7OFIENMdq19Pq9M8UpzqZDlxD
         7W0g==
X-Gm-Message-State: ANoB5pnjc3w3c+2K6v8YeKxqDSd9UYKGL2Ejv/BrK1QfD1EnihLyLEL4
        UZwRtlym7mpT0VbZjIEsqHM/mZomVuvRqA==
X-Google-Smtp-Source: AA0mqf6UR0E5TRiMdmQQZ3kxE9OpwYjbSzYYRnt+NgfuM2UDhsMvRIdPjOWPu1O5FeNnSZo3krnEgA==
X-Received: by 2002:ac8:65cb:0:b0:39c:c860:5cd4 with SMTP id t11-20020ac865cb000000b0039cc8605cd4mr12434993qto.314.1668434875599;
        Mon, 14 Nov 2022 06:07:55 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v7-20020a05620a0f0700b006bba46e5eeasm6640770qkl.37.2022.11.14.06.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:07:55 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id z192so13601986yba.0;
        Mon, 14 Nov 2022 06:07:55 -0800 (PST)
X-Received: by 2002:a25:844b:0:b0:6de:6c43:3991 with SMTP id
 r11-20020a25844b000000b006de6c433991mr11662903ybm.604.1668434874992; Mon, 14
 Nov 2022 06:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20221108183223.3902097-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221108183223.3902097-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 15:07:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkM9xEYsKrKmbuJRex4ii+VhfrVERb20UovuBLYOMuxw@mail.gmail.com>
Message-ID: <CAMuHMdUkM9xEYsKrKmbuJRex4ii+VhfrVERb20UovuBLYOMuxw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: pinctrl-rzv2m: remove unnecessary check
 from rzv2m_dt_node_to_map()
To:     biju.das.jz@bp.renesas.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 7:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch removes the unnecessary check from rzv2m_dt_node_to_map()
> as the ret value is already negative.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
