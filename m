Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3157791BB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 16:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbjHKOXX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 10:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjHKOXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 10:23:22 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34783127
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:23:19 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4872c3dff53so540487e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691763798; x=1692368598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cthXwWS5AtGe0MF8m6zZcDd2hFTXf3PqXB7dHWgjVPM=;
        b=2SSpcZPdNhud+fpnQEu76tsbh8eem75/JLRj1NryTVxA4/oIkSiXS/Jm8swObeyxJ6
         dXKOJbFg5HxqUnGXTrkOEw5QIlzYkND5e7D/ULYJ7YHEBa4NfeEFG6uRpFu8MkAwqJdy
         AAkiIYybXFZ65Ei9vk4puB+Za7Kri2wwumINKZ1XmfyhCqDGoPengNZjlwfupAOsFDNN
         uM9gYRc07elZdMZM2tebILak/0YEKfFXvec2AqYRSwgFgGqdA61KLWgxu0sSX7i74uoU
         Yulv3E6weRMMnbqT5qvJDsH9IY7uuYgzImH8u9k3odA+xfU2MXXJ4tQNu5Ey64Dz88oQ
         1suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691763798; x=1692368598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cthXwWS5AtGe0MF8m6zZcDd2hFTXf3PqXB7dHWgjVPM=;
        b=hNDMYTeq4nway4hdPy/lX8BvAjlmWqE+JKaC9LlYCCGg1Hk5+m0r7p/8r9hhF0/Ij+
         OVJQbJkMayqvJQXbyFaW7ezxAF8hSR/xVfF/auy7/1YXDWRfnjUpjVkUUVa+lmo673ZQ
         IXK/deK+yDuxGCf6eCBCAZlgxLci8c1X8m6yUK3aQmbhoUoo0pbzRYoxs85icia4S2kj
         u/CSQi7aBgwAETUnRairy2QY4jyIq8tU859+U1obMMALnm0F6jU5hx3Pq16+vlrGlQj5
         1QCI91vH0ht7kRs7l+yJ/YUXMwHx+A9X1AAdVVO5DXLwc1USu64HeH5GSYzMwfIG47LY
         KeUQ==
X-Gm-Message-State: AOJu0YzsoIrvnRJg2i3iPXUoeITERG56v05KYQid7FFnf8j1TIbXCIBY
        vaM4rH0z3dMC0Wj8K2L8t9xV6wA5wPkkUBmsapyQ2g==
X-Google-Smtp-Source: AGHT+IFbwJ49M147kacqfum1O0sfv2sNF4nvUYfxmvNZFNrcK8YlPbE3UeRnDsSNiKQwOGUZ5NtA4gNJaHny7KNZenc=
X-Received: by 2002:a05:6102:50e:b0:443:5389:b653 with SMTP id
 l14-20020a056102050e00b004435389b653mr912518vsa.26.1691763798388; Fri, 11 Aug
 2023 07:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230809141324.400448-1-shenwei.wang@nxp.com>
In-Reply-To: <20230809141324.400448-1-shenwei.wang@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 16:23:07 +0200
Message-ID: <CAMRc=Mdu+2Ed--Z12nA7+6tvX3Ujs9VQihJe2w7j6qXg-GYLmQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: release the parent IRQ in runtime suspend
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 9, 2023 at 4:13=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Release the parent interrupt request during runtime suspend, allowing
> the parent interrupt controller to enter runtime suspend if there are
> no active users.
>
> This change may not have a visible impact if the parent controller is
> the GIC, but it can enable significant power savings for parent IRQ
> controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
> the parent IRQ provides an opportunity for the subsystem to enter suspend
> states if there are no active users.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

Applied, thanks!

Bart
