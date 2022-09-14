Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010255B8815
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 14:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiINMUE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 08:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiINMUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 08:20:03 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3609040579
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:20:00 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id 13so5277344ejn.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=KnyGNdw6LPK9gDM0YwCUPGVheAUxe7OXSS7GPAoBJlQ=;
        b=jopUDtl/8so0kMuHj4RCW2fmykV4FInzvN/XT4TEUEGyhs3zgTCIIoNMR+Jbqwj0YU
         UVSBmUV2aL88I5gx4EG9smOkrsLX+DkdLZ8A+RA301SPIz9UxHwHQq6SUj/8QvEn6eMz
         lAzcoqbKOb36j7M+Ng1Djz4zHnD1h9DKuk03cVVagKs4HZSRR24rBLs5ChCzi6cNMfO+
         pcItQClgex1IyqD5+jk2sd3GTEorzxCVB4KRYMvYQLxwqx7+cqNWj4HxNEIrdc68mopm
         igIbo6zfywsLc+5dSIj6IB4JRAICDRtycBhedOid9bd6qTFsUz7lMqcxbwFENTD/C3sv
         wZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KnyGNdw6LPK9gDM0YwCUPGVheAUxe7OXSS7GPAoBJlQ=;
        b=1MVb97GEWDmaT/rzwLSMFgS0aLb5jdSTnfKudqpRaXMatuKceNGytTqiykJTc2U1RZ
         gcbPJwMZGJUbDCbez5m15+ClQLOgWXGGn3ECNGt06dzDU2JPB4SUljUqv8z0lVxI46+N
         q6bOJGn8+xVYnorZsWHoq+VjyJh25bW9n3mAFSQeabI8M0WVpDwk6pXbSOTW1bC40Z5M
         jeDzW54GBTNIXp6Dv/9k/a+P7GYBSUDg5yn/dcQsj2IxnGh5gv7JdsxEhknlN79+6eD/
         cIzbb5Cm8C7yH/+/Ej7DBwsp/H+0NX9H9qDsoUrzIjOJqBfe8l9PV7n7XksMjNaF8dds
         8PeQ==
X-Gm-Message-State: ACgBeo13GKynQQMhjYLmljC2vyaDHeGevQl+M72hTd1u+qzlGn8LNNWn
        dX/mMHto0dbR/a14T4p7eUi/USkwTM/Iz2k8dqr9lw==
X-Google-Smtp-Source: AA6agR4KvEHQ/XNfWMVDYYULYdmg6SNGGcixvL0YAGqRMeEaiHZzOxe9bXEiYEtjBLnhi+r1rHeVpdZyvSBTpLZrZM0=
X-Received: by 2002:a17:907:3da9:b0:77b:9672:3f7f with SMTP id
 he41-20020a1709073da900b0077b96723f7fmr13699944ejc.636.1663157999051; Wed, 14
 Sep 2022 05:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220913164639.403025-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20220913164639.403025-1-sergio.paracuellos@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Sep 2022 14:19:48 +0200
Message-ID: <CAMRc=McBFQmaykPjQZ2JgAfWo1LSZsg6PVf-xsSUt-DeJgNZ5g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: Make the irqchip immutable
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        arinc.unal@arinc9.com, matthias.bgg@gmail.com, neil@brown.name
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

On Tue, Sep 13, 2022 at 6:46 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warnings
> are now observed for the mt7621 driver:
>
> gpio gpiochip0: (1e000600.gpio-bank0): not an immutable chip, please cons=
ider fixing it!
> gpio gpiochip1: (1e000600.gpio-bank1): not an immutable chip, please cons=
ider fixing it!
> gpio gpiochip2: (1e000600.gpio-bank2): not an immutable chip, please cons=
ider fixing it!
>
> Fix this by making the irqchip in the mt7621 driver immutable.
>
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Queued for fixes.

Bart
