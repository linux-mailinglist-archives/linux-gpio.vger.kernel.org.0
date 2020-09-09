Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD10262BEB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgIIJeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIIJeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:34:01 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733EEC061755
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 02:34:01 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id i22so2563876eja.5
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=esyRenDJEgBolb6Hqrvg5tsBvHFlf/kzCPfFdPG5zpI=;
        b=mWJios1mOJgKkAkA4eRp40n/dOQeC2Zy+Hj976vMfmjXU9at16C6zJMNITV7PVOEGv
         gweG96JsvUKzoQd8a2VQE+YGOq56qzXwq9PJHJdl7+l6+Evbng1hF9qw4RBUz3zpiFQD
         juslqkdb3WKNd9ape3HDGLenKlj2NwwQ3bxWLZA+HQCGm2CPhXKoqPGHNHIfN+Pz71Jp
         l9b2gRB3C2bnlW+qNxF6hBuOfOKqcQwJV1WiV6yWb3ELIaalYPmq/Ph8QgLRMRlpffRr
         PajB+8LOtTMgpXSAQuOQ6T4Fhdk1IYLRApg75bKMPEAkX+bwUv4hD+LYB70FDCWii/ea
         XpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=esyRenDJEgBolb6Hqrvg5tsBvHFlf/kzCPfFdPG5zpI=;
        b=OSq+CFyNVUMpabHrCjEXKPfzFz0zlISufzymsMFYuKF5l5dwqY26v5i6AJxtJeFRrx
         R3cgrpvdOV1sxzO2I/JTApJ/tvGnc65gDyH+/eD4v8vMlBXYbYr9akf4uPL+xxk5VVHl
         m9pMJIqhlfrwfxUnBASKgjjdPoAcglI5qj/E8Em7dudockZ1Tn+ZSuEVd4j58+uWL7Qc
         wrDUZtjp+w2zb2YvZsp/2ReVxbkMdxF3Kmj0qtn6ezNJ3nUAhUugZzygBVSiOwts+MZm
         ypg36wyEmOCofTGGEjpJnDKh9CTiJ3jXrq2tjaQBTrckNAtxsY7mcnWNEDUdXH09BLLb
         MlGQ==
X-Gm-Message-State: AOAM532hxM/G7bon+RufE72HiwvLKLVtoxvpWL9rctqTX7tc+cmUVF88
        GKbWgVy4fy0jOgu30CrZvkvzLmodzdIrCCnCfNWbyJpyS0M=
X-Google-Smtp-Source: ABdhPJwLdI7NOJ0Ax3dEuSTTuBR5icR1r1YUf7lEiNbyHg3z6PY1KX1uSsMFSEf0Znuus9qk7yc3I5hHLdostiCV6ho=
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr2677260ejb.516.1599644040095;
 Wed, 09 Sep 2020 02:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com> <1599118222-18990-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1599118222-18990-3-git-send-email-dillon.minfei@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 11:33:49 +0200
Message-ID: <CAMpxmJVMMoH82qX=+k1-SN7XPKhaGocBctCJC5We5eH=BFFWow@mail.gmail.com>
Subject: Re: [PATCH: V2 2/2] gpio: tc35894: Disable Direct KBD interrupts to
 enable gpio irq
To:     dillon.minfei@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 3, 2020 at 9:30 AM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> On tc35894, have to disable direct keypad interrupts to make
> it as general purpose interrupts functionality work.
> if not, after chip reset, IRQST(0x91) will always 0x20,
> IRQN always low level, can't be clear.
>
> Configure DIRECTx to enable general purpose gpio mode,
> else read GPIOMISx register always zero in irq routine.
>
> verified on tc35894, need more test on other tc3589x.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---

Queued for v5.10.

Thanks!
Bartosz
