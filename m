Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B835870649C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjEQJwz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjEQJwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:52:55 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342BEE8
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:52:54 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4538491df02so228968e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684317173; x=1686909173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5hlnwLqa+RxtRx+qxf8dxbPXjY3l2J33vfW0LrGz3k=;
        b=qd+Sqt0ZY5TEVY3gCHm4vTv4eB78xhKmiL+2z067YTJrRJO3+9dGoObBMM7G1s6fm7
         Olh3OvjoWVPYEgQ8HfQxZpqwS9pG3ilpNuJGQqjL8EVKEPndpBrFk25Ro92g45DEykaD
         U+Zhwi04UjT9HDHuI3/fbLEL7ChajlcyEI8TSd2KJ6WvTOCTOMrSUKEpNnl5sxJhGWzl
         4goJwXMud1aK6Pqswk+whQ5UR+9zYHQ5kHEi8PP/zWquVaVXSFDrmpLEhEdmcB7SOTZi
         DVflwSUuhEWaObMLL0UtYt9NeipgnKGvnWxwmnFEiDMZ1JbZuqrP96eHRwZ7u1sQ+ztK
         bHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317173; x=1686909173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5hlnwLqa+RxtRx+qxf8dxbPXjY3l2J33vfW0LrGz3k=;
        b=lgHVmZQGnso9Ti8iUSaY+RsWUQgZLn6dxSLqt2ySq/Oc6x5r5n0miqbrmF8YPoB6ot
         b4nMepxabdCD6+4Zzk4FyNt12m8+GBGdabZJYpYDlZ4qBZSvNG5dkiSwLfQodeYAKjsw
         4k6LbbxQ3PL96lpPojGKfqSo8PHrXYii6XW/oJwVEDrSPL/m1nscBreKipuT1Q7rezsi
         19FS2NjoTfCppfCNtMYw0YBaH3a5JkSwS1Ybc4rjrc8ufFN11h2jkhPaj6z8Chaz2Iq6
         BgXQoSepNOqh55qYQFJEE898+/wfXOZEAQuvfeSlRi0dzHd0TDe+/3ImXEJqnsTiu8fh
         zOOg==
X-Gm-Message-State: AC+VfDwd9uhYNpiCAgfUjq/7iH6hId0/jEY5Xuo3KkTvr0Z8GBajACXr
        Mo7UVmrYvqrrwL5W5D6f+vidrlxhDPRua9SYtRps5g==
X-Google-Smtp-Source: ACHHUZ5Uev8QQXWxUXGCNQNQStfE4cqCpqtVTvU1K3cQKIdzH1SS6fmSjzeYUKQbA2oeS0DhXbhVg06/E3c+Oixd+5w=
X-Received: by 2002:a1f:dfc1:0:b0:435:e8a8:29f7 with SMTP id
 w184-20020a1fdfc1000000b00435e8a829f7mr14120468vkg.4.1684317173330; Wed, 17
 May 2023 02:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230515174224.494631-1-afd@ti.com>
In-Reply-To: <20230515174224.494631-1-afd@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:52:42 +0200
Message-ID: <CAMRc=Mc2A_7_Yy1Jd62xnpaiAV_RAw5eF8DkTr3sdKXBZgLunw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sch311x: Use devm_gpiochip_add_data() to
 simplify remove path
To:     Andrew Davis <afd@ti.com>
Cc:     Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 15, 2023 at 7:42=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> Use devm version of gpiochip add function to handle removal for us.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Applied, thanks!

Bart
