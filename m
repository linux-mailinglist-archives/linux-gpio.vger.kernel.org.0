Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5011B616306
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 13:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiKBMt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 08:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbiKBMtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 08:49:24 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754FD112F
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 05:49:21 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id q127so17064763vsa.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTzlSQ/JqaJK8Vz6/Tc/glOKLBJ6aePN0CckSYTF/Y0=;
        b=Vs3KYI6bPyqdHwmE5lpds1l/i5wxR6AIg/vt8wE0rHElePkrEV2RsyRbEod1mjJ164
         Oo29+SvP1xjsPcB/5v4HRucnek6OzHgF/NcZieygTLx/gcaDrrSVGxWWdrTRBrMOTt+L
         FAaTqzUDPgWXN+N0l5VB9SSyj1p0GPo0/ehmX+1D0iUs69RU6jXrT2JGi8YHPO1rY0eK
         Bnlv3DYS/vFTrIRaiTWhIY4aGnUN3USGiggkTxUkcp4d8JRTeJJ0bQqVmpXOgSftFajb
         ULzavmAD5FATW/gAhC8CZEvmKcLkKBX6MpEEoRZXdrKF6HMxdwn9kWZGHxjqoq45xY5U
         sLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTzlSQ/JqaJK8Vz6/Tc/glOKLBJ6aePN0CckSYTF/Y0=;
        b=0RH4mC5NCm4S6REeNwUKTWy4iNrisyWiuZ40vMyPmW+L//461I8qqF0RhRl+HLXMN2
         9t5HksastWbTvNyJSdLTiEGasSE+phBA/WwctSCC9cmJ0rDlqEBMUnTHbpbwqoskNxdE
         WkAJwvVl9zn3VUWRcr+y8X+f4sVMQx6SxLC+OcgoHAASUG+pnrVdvhniEomIKkmMxxRk
         vCikfSMi4bCTn4/PO26A2+uUizNJIDffvriJax3g/NkTb0eEAO9M85bJaKAHgh+iJCQb
         RuQONpSlCmlUO1BPtOXDCIYiW7A53mgFeYOS4cyadMbi+VOEGgqLs3zaTJg1WAiDa/4u
         Iu6g==
X-Gm-Message-State: ACrzQf1bmE8+fKbVy6UAd15KQBIKjLLts1F0uuotYGadeU6m449gfBKC
        OaYl1W6Pc6RzDWnEa99DNM0EjKPfGiXRFbiJTkC8Gg==
X-Google-Smtp-Source: AMsMyM7svrL1/L4Gw1i4b2mHC/iKcf1n444D8oDxpnsDRJtGJjhLQ10Fra1MvGf3TWYHdOdWvH6i1jwnXLdMSCFRumw=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr11636263vse.9.1667393360465; Wed, 02
 Nov 2022 05:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221101082442.263448-1-chenweilong@huawei.com>
In-Reply-To: <20221101082442.263448-1-chenweilong@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Nov 2022 13:49:09 +0100
Message-ID: <CAMRc=Mdi2ASr1Wq66YTQKTvW+ysU4bw=eN4=9tYUxcJWLPGNaQ@mail.gmail.com>
Subject: Re: [PATCH next v3 1/2] gpio: hisi: Add initial device tree support
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     f.fangjian@huawei.com, linus.walleij@linaro.org,
        yangyicong@hisilicon.com, xuwei5@huawei.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 1, 2022 at 9:17 AM Weilong Chen <chenweilong@huawei.com> wrote:
>
> Add support for HiSilicon GPIO controller in embedded platform, which
> boot from devicetree.
>
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---

This is v3 - just like the previous version. Are there any changes?

Also: you don't need that -next in your patch tag.

Bart
