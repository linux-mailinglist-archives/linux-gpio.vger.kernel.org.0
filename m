Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B7277EBEC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Aug 2023 23:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243351AbjHPVeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 17:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346586AbjHPVd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 17:33:59 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319971FF3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 14:33:58 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d678b44d1f3so456990276.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692221637; x=1692826437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RBVqp4kduJXMJbxlAvEmo+9gvCH5BX3b44BJoL4eqo=;
        b=jvOzYHAAWNRja/8gLNIAYZd28LRCoDJ+poMcE4M6vMSSwteXt95Oac+kEwZkwJx+Jq
         t3r5/e65lbRRtbXjlQdHa2+twul/cuJKKdVPV16c4/Jsz6QHlmmxJCClrdIguWcPvzA/
         xPytpmL9Tg0O8vypX61xkkJ9B88mCxcRFvUVDYh3/G3UAggydn2hKOUZlY+6ZIYxdymf
         a/fZ5/LLysX2lpQjAb2140tZAdsO0xvQP5uouzTpACgahG45wsCdLu9k2iu8YCRvauvK
         p0zMQJ1+Ewd4/VD3/q5NTsLiWah3irTjPaK8cr5vfDMWCnit8j2PUP4BTDXJvBGX5bo8
         DnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692221637; x=1692826437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RBVqp4kduJXMJbxlAvEmo+9gvCH5BX3b44BJoL4eqo=;
        b=DuPdmIgnaSX8J4z2rp+yvRgKswQSqN0cnYdPukyZ0KYzEr4FpO0fha3mRMTDUncxC5
         fgjfLsApL2g0R3VqSyKudC/j9ExbR68w7uLoPnVXK2lCStWVXHiR/m87moy/3HlJtHHx
         TAm5N8z6ZMV5NC6euoxFHOPf0CAqZPrn0r77JAZXosmOIO2ZHS69j6/YMrkI7SuAUehM
         zru3pWoDG9KfiQdADPUgJBYfqbgXm8I2IR6TRXAoqEabIoOg6mI3F2jCi4uLVSOyrfFX
         38VlV0HE5W5d/6Nd0cEtG+wEdNE0UuWRboCbsAFm/B07HeP5rS4DYpmHHR3jw0WzFkzN
         unVQ==
X-Gm-Message-State: AOJu0YywiPkoYAZhbKuBgVuXEALUm3RgtOUpNr6pzMoO+XSw0qU4yt1g
        cAcAIox0Hgysj+VrfoW6yf5qNyoDv9wgb8dlTprOPw==
X-Google-Smtp-Source: AGHT+IH2Z/OEtN5cFhO4F5L3HrStmbVp/yxc+UL7spJsYhuWAjsj/K5t8j99MIqXIZEPs68T6FRkkCgQaQWLU9GzADc=
X-Received: by 2002:a25:b189:0:b0:d4a:499d:a881 with SMTP id
 h9-20020a25b189000000b00d4a499da881mr817195ybj.9.1692221637406; Wed, 16 Aug
 2023 14:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230814112615.42448-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230814112615.42448-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Aug 2023 23:33:45 +0200
Message-ID: <CACRpkdbLbj88h98f92q_efWNbeM4s5hwu3FpyCyuaCL1QpRJkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: sysfs: Do unexport GPIO when user asks
 for it
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 1:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems that sysfs interface implicitly relied on the gpiod_free()
> to unexport the line. This is not good and prone to regressions.
> Fix it by explicitly calling gpiod_unexport().
>
> Fixes: b0ce9ce408b6 ("gpiolib: Do not unexport GPIO on freeing")
> Reported-by: Marek Beh=C3=BAn <kabel@kernel.org>
> Closes: https://lore.kernel.org/r/20230808102828.4a9eac09@dellmb
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Marek Beh=C3=BAn <kabel@kernel.org>

Late to the show so patch already applied, but THANKS for
drilling into it and smoking out this bug Andy.

Yours,
Linus Walleij
