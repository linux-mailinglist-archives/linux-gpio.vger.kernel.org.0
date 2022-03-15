Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F154D912B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245529AbiCOAXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242445AbiCOAXO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:23:14 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80CD40E7B
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:22:03 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2db2add4516so184739307b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MqLppnGP4MbsD+gVviOPlH5VnfiPJBlj6/pZOIVk87s=;
        b=dMTpOfPNcuKpTGl/JROG/JfBp6BpRXuCPI7gXdwwNZxgiZQqpugLMPeFDPkXwYOwwq
         zDFEZFGTMp/wQ6s/n41FvqOf+fP7hCh+PVZEB2t7yvJsx1Py+mmYIE3wkIB97ru3nxnX
         8iYD+r3adI3DiwmFOBL2Krua262HaeWj9bFF2ITuaoCFESlH8e+0u021wuDwaqlzgUSK
         jvHFShoXHwMlO5Ztbj0woLMnJxFlzb/0lNljSP375mC4gS/Vh18qtVTL6Z1NbHDOIMTl
         rVEeLLIPlcXdPbpCF95OoYCr0MzRoZ2hGVrKMN1+s+RaFT6lYYoPrqTrDtuaxMzCeV8H
         6Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqLppnGP4MbsD+gVviOPlH5VnfiPJBlj6/pZOIVk87s=;
        b=G3RbRMhwcJ16B/ZiDOixrH4UfCjxCM5LVI05u7IaBAuyqI4Le6R8gnwbWWzwtu8Exw
         cX8aDaUp5ATT8HCF+7eapUTC3LUsgD31JSUKA+2u57DHn4Jz6JB3G4wGb1n0+7B5yZpa
         5VkLymAbxr2JUKdnf7tNjRitJrh3T0ktqqBWYN3TZ2IDoxwC8tbqDNX1nCfRBQiqV+F/
         QrQ36Ln1uq5oaRzI8xzSRbKzRIcl1fJonD1rXVjL6bSYp1ScnYroI2iVwzSPIJ0M234i
         L8rXarccDXshnBDSLjWLHaCSQEBg7qJD/FjcMnXs+d5+PYP9WdwT/u70MQFgLzjylwsY
         YQtQ==
X-Gm-Message-State: AOAM5310T8cZoW0aU8f9lj4ngeoBwmT6F48jFp84+zItbBfyAI5h6kf8
        TgXTdprptoZ5SSqCLTHSifPwig0crf+Axm+D1WjwdA==
X-Google-Smtp-Source: ABdhPJxPeLs/sQQPILHw4rprmLVR2kPw4SQcmTT2sG/U6jXD1r8wVmQwtPptjgzVGLG2oUXGgIKZdPWG432SjaJd4sw=
X-Received: by 2002:a81:89c2:0:b0:2e5:84b7:83e with SMTP id
 z185-20020a8189c2000000b002e584b7083emr1458669ywf.448.1647303723144; Mon, 14
 Mar 2022 17:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220308071155.21114-1-linmq006@gmail.com>
In-Reply-To: <20220308071155.21114-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:21:52 +0100
Message-ID: <CACRpkdbu_rqQf101WC+bf8io_Kr7eDvRwt3h9yq-kAH-9Az8Ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix missing of_node_put() in mtk_pctrl_init
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 8, 2022 at 8:12 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied.

Yours,
Linus Walleij
