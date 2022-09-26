Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA465E9A56
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbiIZHUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiIZHUr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:20:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0BC24BEC
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:20:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso6361148wmk.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=3jdNtELdCn4sS99CPBgsVFr3jQOrpqoAztbQgH6ZpnE=;
        b=tn3lOcQjwJXnx1Sx0TUQ62fSBIhMpku7J++HgD5uFWFnqKGT+lJ8cfrpZgsx1isATe
         miwsSvYxv0bVUUco9JYk5vQpUBtIT5b1gIvclSTZF3iUtBapuWuzGmPh1O9+ghG/8TE1
         xee7ee/237mIf1GV+tluXRrY/qH/MVVvoEoTBrz7JOq7CmuoMKYYZ1x6vAW0hHNHn0si
         uVdNXesmpKUlzHj1hSzZa5QcRQoxmSSTXnMPt9XI43ygFaE0UwTjnl6BLmMVrXkzgJjn
         h1Kgax2nWYS9QMhBG6+6qJ2moO4TQIDFFYZMbBlzTEoKSzn44MPfBjeLp8yt/3j3+GAm
         hwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3jdNtELdCn4sS99CPBgsVFr3jQOrpqoAztbQgH6ZpnE=;
        b=2UQM0n4HgLKPqC5qElDKb23uvryPTvN6ZhPUIjtUwBLqmrIGQylBzkY+wIxQ3gBRt8
         j6c/1saLTSiVvcTm4UJZeIq2+orMllNHqWULJmBS5rGKIQG0viYzTojOlxoM3KUmVMDB
         cO4X96A6mt1jRi82MP1HP7kiQtZw3xxUfa9HVUaVYtxlT5yX1SOPRuKGo7Yy/YWGRF4Q
         vgFSlKGQYy3qFIwnvoIC/LWTP+f1jd5WwIuFQxOLBAuZ4mBd3UUtY2GODj5pUJoQXwst
         FoXeis2WwcOeej1KlsjP7P77OBuUXd64Zr4ERpA5akoCRrffrCS8VWI5uQEbR0gnOyF+
         Ao1g==
X-Gm-Message-State: ACrzQf0niP64frD22B5dkIVKyU4eyQKhDYr6iVchkec8JKs4YQU9U2sa
        Hsy5BYPx+zHB1jLqr0PdBdwqKzhwKV9bGXSoQDnIKA==
X-Google-Smtp-Source: AMsMyM5oTORr2x7yyhS1QT1DENmiHP9FslJNer9UgFyATnA8n6gcC3oJMwEaX6Aaxc+zwFauRci48qNhw1xDVg8ViEY=
X-Received: by 2002:a05:600c:1e08:b0:3b4:8fef:d63c with SMTP id
 ay8-20020a05600c1e0800b003b48fefd63cmr20577851wmb.158.1664176844980; Mon, 26
 Sep 2022 00:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220714115515.5748-1-pali@kernel.org> <20220714183328.4137-1-pali@kernel.org>
In-Reply-To: <20220714183328.4137-1-pali@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Sep 2022 09:20:33 +0200
Message-ID: <CAMRc=MfAS3GQ_U+kaHPP7ApCs1StVsUdBFee7Ey_xUYW2CDMXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: mvebu: Fix check for pwm support on non-A8K platforms
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 8:33 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> pwm support incompatible with Armada 80x0/70x0 API is not only in
> Armada 370, but also in Armada XP, 38x and 39x. So basically every non-A8=
K
> platform. Fix check for pwm support appropriately.
>
> Fixes: 85b7d8abfec7 ("gpio: mvebu: add pwm support for Armada 8K/7K")
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>
> ---
> Changes in v2:
> * reverse the if/else order per Baruch request

Applied, thanks!

Bart
