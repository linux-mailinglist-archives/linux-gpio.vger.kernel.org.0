Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC6051BFB1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 14:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244098AbiEEMsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 08:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241946AbiEEMsb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 08:48:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C8355230
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 05:44:52 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id g6so8514059ejw.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tt/2XElp5bH1PatsTKvstJRnZDewwtgGXqmWXlb6P24=;
        b=RhobBcW0n6MeZAMIsT5FE/C/yMcyyyuSA9s379VuFzO/yHIFfc5RNyOxAwVek2Eewr
         jYu3Kn1U7iXwItPtItxm5I8nwrTW5/rV7Glb9sI0lf2Grp7kOUO1coiQnrsKggl6PmKp
         R1FbxEBMP5hdF/L+5AuE49kMMBbU5q2BOiAwmHjTF9WjNV772T64NqH6UnXsJgeu2QBr
         OTuz09tovlWyx6a370gM+Tro3OTYig6FfK4oZErb/RFj6bDtQsS3vyYu+j7eufVKuvHw
         QdMOvEtoas5ZaR3kV+SJ9tEITqeAcJeq99GaPEsT+VZG2hC5oNW0RtKDR/eTuSvFPYux
         HR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tt/2XElp5bH1PatsTKvstJRnZDewwtgGXqmWXlb6P24=;
        b=TMPaDlqA22/oopxt1iCb4IPC6yLCQuQa4n4mUe9qNF33F938EZvfbF9v1rweMO4WGO
         d2DiPeLppkdsM/5DJPpvcaPadAI36CfDwbBifDx4aieFJ5v+C/BchxTgjnGd75JRwtFg
         hN2Ks9hJkINbwXIRIYPDoNTl7KGnGLowI3m0yRDFyUjVOvbkqVvZ9bQeMo5WUOYf6B0I
         VuE06NhTNQXPeoK9QUGOGGwSo2fQvqlRPBliXQfrc26akdaGuO4eP+UuKM3AsUjXjlrd
         NVCjdJn/KPRjrAKqLxonH926RWce/Y+lwBrlOokvu9yIi8Dg4/huTkaizwSSQlv6roKw
         CaAQ==
X-Gm-Message-State: AOAM533Zf3WtEaOAiLXxomEKrbT3z1eegcEccSQHbf+oNOwtmVC9EldI
        umGgmWu6kSZRupsXXIGVyRLcUTpiu177/FkvmS30Aw==
X-Google-Smtp-Source: ABdhPJxq8vYRf0G9cPFbYqLhOvTdqklGIFfOLzgc7+7EQxxnTbmrxtqPC1eR0tM4n2VtRNfsE/caOCBDYb+jjVDsc9s=
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id
 qb18-20020a1709077e9200b006f4c553c734mr8079045ejc.286.1651754691228; Thu, 05
 May 2022 05:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220502170555.51183-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220502170555.51183-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:44:40 +0200
Message-ID: <CAMRc=McHZWjdFywntMwfg19U2H4Jh99SBa8Zz+0N79W4EQJ9gg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Make platform teardown callback return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 2, 2022 at 7:06 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> All platforms that provide a teardown callback return 0. New users are
> supposed to not make use of platform support, so there is no
> functionality lost.
>
> This patch is a preparation for making i2c remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Looks good to me.

Sekhar: please leave your Ack if you're fine with me taking this
through the GPIO tree.

Bart
