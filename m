Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFCA6B27FA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 15:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjCIOze (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 09:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbjCIOy7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 09:54:59 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78437F0C56
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 06:51:56 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id q15so1792854oiw.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=7VnZ8eoq8JCRR9LWSoq6SXSKIYIRedzcewZzSE9gKx6AQQB2Ax7dwKBcAYwJrjlsWs
         4TCezR69X8MwfD4+CKaz/SObaltdvIIieLVdJ+BWlplOPFiALrUJwDgjMU47Vf51qRDl
         xdFrwA1rnPNMA0GVzeDnkpXSGfyag6vAi04knNO8VIXj+D5n+705no78/qGHcnD2tLqc
         nohnomuGXgF8COo7QbluFk8QfItIs5fLy7I2ZnAC1v81iSP6Ds1uiOBx5oP32kgrJXPW
         yTtqYLrIVGryvFjGoykGRd0Kl8dTZeGhvhFDQoCSZrB7mIPyeb5SEOWrMbUnxfz7JmgZ
         oQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=DodcEcO3eBdw/ln1Z+wtrmiMxdcb8PPUhgtGKz2+yRMq8juwCzS94ExnHFsoNHxIKO
         mScZNiQioj0rbFjIL3sKOB7X6zmjHHBKAQi/A+L7TlRS3XxbR4vq33AIuygTlHCrLWBp
         3XlFVmRLujL8IhyRn7fP1U0QmMfA3IRzOglLud24WCql5XfXPfHG2vK41b+n2ecLbkdz
         MoNlY6rPdgQ6CtSnYDULbeb/+AAWvldNo4RPcxNrr06mFcXxsC9h0aK94c9A0bXv4qma
         tQmq4/d62oFmCHQYwhvXe+j51T5Pf/cwP7gQzcKjkMFTRZof8wI489Ip8f9Ewn0JQsGL
         WR9A==
X-Gm-Message-State: AO0yUKWHZc1Y20FU7SQjRjqhBlwCkh+Ih1Qi0sLIanBy1/Mhry2ih86c
        uSxxcEQBUuDlLtDHQnAb9+SBEo3XCRHUyitAphniRg==
X-Google-Smtp-Source: AK7set8A8FpW9dqaR73G09blcvv/Ti7DIE1vGNLlncw0hLE8FnQCoXHRSlvX0YUqfVCqYXdazGxGSi3CnqOThNIO2y8=
X-Received: by 2002:a05:6808:2208:b0:37a:2bed:5756 with SMTP id
 bd8-20020a056808220800b0037a2bed5756mr12243997oib.0.1678373515531; Thu, 09
 Mar 2023 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com> <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
In-Reply-To: <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
From:   =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date:   Thu, 9 Mar 2023 15:51:44 +0100
Message-ID: <CAP2ifjOtORrGKEBMw-CzPR4B8CPDaRKnqKHyKL7mC_8qH08=iA@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: fix systimer properties
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Alexandre Mergnat <amergnat@baylibre.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Mar 9, 2023 at 2:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 14:17, Alexandre Mergnat ha scritto:
> > From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> >
> > MT8365 has a SYST timer (System Timer), therefore the compatible node
> > should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> > (which corresponds to ARM/ARM64 System Timer).
>
> So this is not a CPUXGPT, not a GPT, but a SYST?
>
> At this point, this should not be even introduced because commit [1] is
> not in linux-next yet.
>
> [1]: https://lore.kernel.org/all/20230125143503.1015424-10-bero@baylibre.=
com/

I've posted a new revision of this patchset containing the systimer fix.

https://lore.kernel.org/linux-mediatek/20230309143459.401783-1-bero@baylibr=
e.com/

ttyl
bero
