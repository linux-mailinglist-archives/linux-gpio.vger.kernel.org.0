Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06C251B18F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 00:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243687AbiEDWFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 18:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378943AbiEDWFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 18:05:02 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7A9506FD
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 15:01:25 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r11so4702972ybg.6
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pX2ngpFNk2Ghr51om2PA0Pj/G14x4bghqSpSrOsoJNU=;
        b=kq8t/UuBXfETDAhqBKubijfq3sWXLthyRNbY8B12K8TrNDl9l8r9J/fXC4rZAyGAyU
         3E90ggARwwH/f8OQGxhEy1+h/42GluJ26rEhlzHpwPtwqSkfGiDJufxCaHtEWUlKWE5t
         qnFPKKDJX/edCbv2/NINGOSkgZLnB7oT27aKFUwhhzhdh1HaFFtA/Xj6cdIlWrzCbf1v
         6Fq1MR+n625ediEt5ZIxuh1DW0WIptd1d3zKcAHaX1dSMAOu2W4UCtBFEhhB2b+IAsak
         YOb2Jgsynw7vz90ZzY5xmpQ/el4SItPpAUMDmWzemifHfHZNKrV9Xd3WAJi3dNon4ac1
         KxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pX2ngpFNk2Ghr51om2PA0Pj/G14x4bghqSpSrOsoJNU=;
        b=69iNaYscftxMeMXpgNd9gFEL5O3b6ddr8elByTfAQE8+JH8lNRAs51pUtWMC4asB/c
         CvowtH66Bg6hMlj+TyOYdaiNV1YlqdTWEAvwRAkHnmb+YdUEEWi2gsWR5aF6RvW+KrJO
         N8NP6TkamTteuwwTtsemN25BKumGgkzgIO0BD65eL9bRN+kt0DdmMmDGGLlM2aEKsjMR
         fm15mI989Sy/7cvXAfsVGlbXyPmfoMi4ZOciKRtAVETsoTnbEQbsjW/bDt4fGO3qHC2/
         DS3qNcm8O3TqEcxS3qTL2SGmemOLyzJ5PjRG0qm19eR18NJzmm5phcaRDtUfKZy70971
         MdYQ==
X-Gm-Message-State: AOAM533H+2j1uYy83DF+n7jtmPqxSR2EIM/rwtrd8sq1fW8udVM2RbvF
        3vxvppOC744O/yPnu09qR9QhPYpS66NurqariWR6v8vhR7w=
X-Google-Smtp-Source: ABdhPJxRdvTwncc0f0hY6oBiPl4XnV4u57gzrV6gKZx8HsF6PExk2uGe9TNXvMLUiy7JU8oQaOjuQH0QFBGqWj3vPFM=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr19961978ybh.369.1651701685134; Wed, 04
 May 2022 15:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220502092335.30670-1-marcan@marcan.st>
In-Reply-To: <20220502092335.30670-1-marcan@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 00:01:14 +0200
Message-ID: <CACRpkdbc35bdsVLCfNB4-BHSmCjSW3BaX8EPbRSw545fY5HhxQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Make it work as a module
To:     Hector Martin <marcan@marcan.st>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 2, 2022 at 11:23 AM Hector Martin <marcan@marcan.st> wrote:

> We need MODULE_DEVICE_TABLE for module autoloading to work.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Patch applied.

Yours,
Linus Walleij
