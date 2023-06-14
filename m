Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C934372FFFD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 15:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbjFNN1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 09:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236010AbjFNN1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 09:27:09 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8FA1BEF
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:27:07 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8590675e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686749226; x=1689341226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY0nlT4W3k0uRBSbgddy01V1PsyWF74x6AX1tJRljmE=;
        b=OUabJxdP2/4GgfrGrlTpmlSVUvx0JgiTfnYcZXgCNhETGE4XKnHwwFwYj7TC1qj7UB
         IoKmjW7BzHAG7G7F6mWOYcioS5v1xuas9yjQfu/D6ccfqOjJc11Ey+8U43JQHOQU+4RK
         5xZkC2ctvYjBZItFR1jxUWUE/chb/s8WbjS+1BaUPu7EX4XMbbS4TRLlYFAqCXEi1v1p
         BRLjHE26m3gVe5ZeN09f6K1GAV3P8+QiyKfHRA1Mha348KZr4qkdiImU8tj+z8rZnxvp
         DPyte/EDh5Wd81H6SIzts/mD19W9xuYuQ/GKuilAyIKbZy21GhRmnNOYTD4KMMzT7OAy
         oz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749226; x=1689341226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY0nlT4W3k0uRBSbgddy01V1PsyWF74x6AX1tJRljmE=;
        b=jNMB5Qy5lFRwx/+RqRmXkzkk9VW0Uk4TCBc+h7uAa4kLglu5BBi+SArdO/sbYgw3kN
         Wn5s1kpXJ1ngbbUGAnz5aHGxSweTmP0ZmAKfBBy1H9+8E7I0jZtFffCeYa+2yKiw0rjb
         jZlbgFcMZy79WykFiIXdj/dc1x4wndeoI2NSK4BG4Z8i4T96xRmeGBxN5Pe9KcooBw4Y
         RW6sLab8PTVYYzOCsOu5kkWw97nm+kQ+tPYUwsMMi8kxecOnjDWG8GW6dd0ZimEa69Zl
         fX33rRRIBLKZem5Ba939tysFmr8Xy0pJZ/zAzgBL/lvpereSDCqzaQT2zh2WMI5SQWAW
         iAhw==
X-Gm-Message-State: AC+VfDyIH9YcUXH/t77ZslLei6c/8T/mfv2R2Io83gFfecUygllrthZD
        bK1tJa1+pLWaZ/VNJ+i+e+iN98rT2ZivV8d8csW3aQ==
X-Google-Smtp-Source: ACHHUZ6hw06VL5Qq9L3PSkhnH1gT1/ODiCki5qdgSv4MFtO7wLxbzIU/y4w0AfHmYjkKpn8Y34zCO9lpgwslaYnERzo=
X-Received: by 2002:a2e:9f0d:0:b0:2af:1844:6fdb with SMTP id
 u13-20020a2e9f0d000000b002af18446fdbmr5903816ljk.5.1686749226016; Wed, 14 Jun
 2023 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230614035426.15097-1-warthog618@gmail.com> <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol>
In-Reply-To: <ZIm+4qmSUgFrVzLc@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Jun 2023 15:26:54 +0200
Message-ID: <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
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

On Wed, Jun 14, 2023 at 3:21=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Jun 14, 2023 at 03:03:51PM +0200, Bartosz Golaszewski wrote:
> > >
> >
> > Great idea! I applied patches 1-3 with some tweaks (coding style, C++
> > comments, statify functions, put local functions into anonymous
> > namespaces for C++, apply black to python code etc. etc.).
> >
>
> Ok.  Would've been nice to get review comments before having changes
> pulled straight in, but whatever.
>

No functional changes. I wanted to avoid bikeshedding over coding style etc=
.

> Requiring C style comments in C++ is just weird.
>
> > You can respin the rust patch separately.
> >
>
> And what would you like respun there?
>

I saw comments from Erik and though you'd need a v2 but as it's mostly
a matter of taste, I'll apply it as is.

Bart

> Cheers,
> Kent.
