Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBBE7E24CE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 14:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbjKFNZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 08:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjKFNZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 08:25:29 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C71A9
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 05:25:26 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9beb863816so4560114276.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699277125; x=1699881925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Gsb4v8pLfkWEsP47Lc0OVMB/I72SK10CYsME1p3Fl0=;
        b=n5cf7UuQR+711zDnFBXRqUaF7O7GrnnxSDqm9IM1S3HfZqvOphK4Qcer0cgF6/Pa1/
         e8P8t92y9yW3Aeg/q+BXdz7Ycc5oJvcGkX6oQmIjA7AID0yUsGpVnMY8ET3bB40cyfb0
         VLeuY7nsFCMIgVs5MganNEHgmw/hwNrvs8/zM5y2AEgxzGKbIv9Tl7wnND7bSQGLOWBy
         yKgKBUfzjj8UXMA81Z8M33Scr4gadE2XWEbuZDHlF2i7UYULccH2VriTN0WdT1LCZO3p
         BQj+7wJp+PPeBaIyQ693AJTmyV8a3iLRwbRhga+fAFMlGMrFQ2I+jXdlB+VB9jb758NR
         cugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699277125; x=1699881925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Gsb4v8pLfkWEsP47Lc0OVMB/I72SK10CYsME1p3Fl0=;
        b=h0YYOMF/okii5lWckiCP9GcKAtriaJAqXTITzDTpeecwG2XS0juDBqUU/EvkRCjMwF
         1gWiU79MlCGU01ygW7d3NEl1nC8DOJCsSWNfYTCirBRz8tHIDe8SL6s0SCzJCUPciYF2
         //gyDNLWcz0irnMS2dvmkkaKzpDlTCHCiaGzC5MpMv4gQ++isHO20vrd81cWtVFBjF4z
         BM87dJOaIVPEtzDdIteC4q5qcrz69s8+mEPufRBapI2vgpqqKq06BPogRBLS41MmdAhI
         NSJqwrRBNlp80pvvO4n5IzP9ISBQdmPIqT7biFaV0pTOD38vijvQyXVhKRUZ+mQlBlaM
         BTMQ==
X-Gm-Message-State: AOJu0Yzj85Qj3s2TFE556Kqz3AP4BJIFvz15qUkTb2hUxLwbsNVYzQOy
        5ptSy/UdSrUiaJKoLNRngUXH4yaL1r5AjdtCoiemwg==
X-Google-Smtp-Source: AGHT+IGiRAVAhYa99RVMAfuw9X1QR/WgPzWj4a/vasDijfQYx1o4We9P+qgKiEeTzF8HyZU0uLRDXYq2I5VRDRe+ko4=
X-Received: by 2002:a25:ada1:0:b0:da0:3792:55a0 with SMTP id
 z33-20020a25ada1000000b00da0379255a0mr25046888ybi.18.1699277125179; Mon, 06
 Nov 2023 05:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20230929122101.466266-1-thierry.reding@gmail.com>
In-Reply-To: <20230929122101.466266-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Nov 2023 14:25:14 +0100
Message-ID: <CACRpkdbzvk7LOa8BMJ8wzgg_fq7T86XKzFkuqf4vXz=a8g4sgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Display pin function in pinconf-groups
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 2:21=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The function that a pin is muxed to can be read from the top-level
> pinctrl-maps debugfs file. However, this only reflects the values that
> were specified in device tree, so they will only show deviations from
> the hardware default setting. Display the current pinmux setting in the
> per-controller pinconf-groups debugfs file along with the rest of the
> per-pin configuration settings.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch queued for v6.8, will appear in next when the v6.7-rc1 is released.

Yours,
Linus Walleij
