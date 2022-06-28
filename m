Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF6355E3F8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346009AbiF1NBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 09:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346028AbiF1NBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 09:01:23 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C6D2FFDA
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:01:23 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31780ad7535so115987357b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hd3XL93MmgNxl9VBaLiuBcv4b/i5SRbaDxLlwpB+u/c=;
        b=MyZ/4vLxNMcMrNX+yXCZtcjXPFhB/wSlJiNjElM7eOk84dJ29151nrYiL+hOeKO/y3
         h0o5lkMD+XQobd2vuhZ4XA8NHx3aqU+xdZO6A8oMtVllozIQL+CyteZJAp+S/mYyAwUK
         AEqvbiCeBmAjjyCfMwEr09YJCiTzzo4rx8Zr899ktOAOUtak6CxdS91BY4CJ/3zMef7Q
         c0OCPBsrKhruavhT1RemPcfqB866KPsk3AjkDyBFbq5FweTNxTCNxQLfTOsRNyaaTcE3
         1o/uZWb02e7QeaFKX13xgi8s7H/cE419zmEQOHOKXjRbE6XFaDRAG0AJZ8xunIJnEcLV
         Uy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hd3XL93MmgNxl9VBaLiuBcv4b/i5SRbaDxLlwpB+u/c=;
        b=ZRnArMDkYUj+IZP/V4nZSXyPbta6vxSt7gDr4uge8Av6gEhgRMDTbRkBSQ0YAo4aGC
         MrT9C8EuhVFSO72aUgBE9vhBunsswJ7Qo1iOaTpeQtCq55pSvtmwYNNNTy+Ac6OtyczY
         5Wf2MuWhHTgF3nULyCPymroLCD2EN4F77t8lpWHUxX5/qG4y3d5UEtCaEDqOABDaiPup
         XjpYg3NC6cEnl/D9V5ivZDTO8INuA4/S21tbd46w33XTLkSkWTmggngw15BNdzKWghR3
         8w9b1tjYYUBxmy7EUple6t7VN08WpJ6IsVBGm0MfmSTEdt/CLV/JNEP1GiabPfKJ3Cxq
         QPCA==
X-Gm-Message-State: AJIora9pJwckVF0iwmQS7A354L6bBWi6+iz1ULPnakxZWoZszvNI7/bp
        BJ1Hpc6YVacPzADFcVqcHic45EAZzM5LkEFm7f6ZTw==
X-Google-Smtp-Source: AGRyM1tJOYiN++gGQe7eYZTvdGtI3GOuEZN7WBcRrjsQLknyG7NlgzAgkMZlyR1dNIzVB8TKvCJGJukoZrhgqMle/lk=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr22036265ywe.448.1656421282218; Tue, 28
 Jun 2022 06:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220622155422.23945-1-menglongwoo@aliyun.com> <20220622155422.23945-3-menglongwoo@aliyun.com>
In-Reply-To: <20220622155422.23945-3-menglongwoo@aliyun.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:01:10 +0200
Message-ID: <CACRpkdZVY+o684nGpEVA0umkCkkN+E3WC3Uc-dey8MUHMAkqUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: gpio-sim device-tree example with gpio-base
To:     Menglong Wu <menglongwoo@aliyun.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com
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

On Wed, Jun 22, 2022 at 5:54 PM Menglong Wu <menglongwoo@aliyun.com> wrote:

> Update gpio-sim module device-tree example with property
> 'gpio-base'
>
> Signed-off-by: Menglong Wu <menglongwoo@aliyun.com>

Linux-internal global GPIO numbers has no business in device tree
since other operating systems have no use for it.

Also Linux don't really want to use these bases either but want to
move away from it, see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

Yours,
Linus Walleij
