Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E229E7B718A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 21:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbjJCTI5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 15:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjJCTI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 15:08:56 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81943AC
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 12:08:53 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4526c6579afso101267137.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696360132; x=1696964932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Toie28zXPW8FfewTFAVCjeW/cgtQsi6duZD0uScmk=;
        b=bfe1XC4TKGKmYmacMEAhGxitJZPpVuLOFAiAZSsaseytvBhnSheVUBWP69ibR/EaKy
         5ifPae2k6XNWSxzOXFGw8kt6/yDHQIEFHduQex3qc3xhE+uvjpd91+h9s5DPOafr1aHn
         XcU7goexTi/OJn1nkzotE29hsn8wRRjgkrPFW8EDWXITqeaqILSaIgbyRcySa57u5Ei6
         AVGRT3+dhBtX3JbwApsN1MkB3M7f/ffajZZ9l4SWvqnSvjHEI9NRoY6oKbu3i4CATv+a
         zmq+sEhpBjRMzFZwYYGHb5hWASPabFhNvOapRGkFQaxSxzqXEDWO06tL1Q3JzXA1FvmO
         BQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696360132; x=1696964932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Toie28zXPW8FfewTFAVCjeW/cgtQsi6duZD0uScmk=;
        b=ZwaPSeCBMAQ+B5yoj7PKO/+54vJjkix5ZjfTgS0lMdej1kUqcawkoOneHCzyet6Jl8
         5CrwqZSV/IqSY2yxTpqDFmG100jUcLsf0faXNBwJLJzdh9dqBFq3G/nn8P8pE4WDrXT2
         u0UV13Mnulnb+BYf2AsitNG/slBToXCZEYgvRR45ug4XHBPbqJnrwZTUPdA4PUYDD+ZY
         srBncYSL/v8NMpjlTrbMgC3Ai06exN9pWAFW/iHiNNfLR2a+GPrI29QNCA5U5DxnK/Vv
         WTvZynJjUSFM+ieci/+odvnM7KtMnIroxlNA72qmUegeiQGTL7+B1NduZUbZqKr+OV+z
         U3Pg==
X-Gm-Message-State: AOJu0YxA0nx2qgKgMH2uyjsSswgvqskg4dMf0lu/+HkKWXr0WpjkNuRe
        n5nyYXmSAdmkby8OuDp/MQJrtKXbPB2J5g3nUAyE3an/iiYlv80H
X-Google-Smtp-Source: AGHT+IEdOURDSAJo+8ANEpeEnTTxvlhDOkJQ6D3sLDrJMt6ob3YMhdrJ3vHpctjXpcX/qmr0E5tCyf0PGHnBpQo1bFI=
X-Received: by 2002:a67:f9d6:0:b0:452:7246:652e with SMTP id
 c22-20020a67f9d6000000b004527246652emr117979vsq.0.1696360132657; Tue, 03 Oct
 2023 12:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-35-brgl@bgdev.pl>
 <CAHp75VexazbYskr2pxOPzZe8q=o4ZCHnhcN6U1XX=Th8sxXCgQ@mail.gmail.com>
In-Reply-To: <CAHp75VexazbYskr2pxOPzZe8q=o4ZCHnhcN6U1XX=Th8sxXCgQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Oct 2023 21:08:41 +0200
Message-ID: <CAMRc=Mf9O0MKHKM0v3tongx+Aj3wxUaDcvSdNC+FZdXD3C_P0A@mail.gmail.com>
Subject: Re: [PATCH 34/36] treewide: rename pinctrl_gpio_direction_input_new()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Oct 3, 2023 at 5:16=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 3, 2023 at 5:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Now that pinctrl_gpio_direction_input() is no longer used, let's drop t=
he
> > '_new' suffix from its improved variant.
>
> This and other "treewide" patches in the series are redundant. Just
> name the functions better to begin with.
>

I don't want to rename these functions. They have perfectly fine
names. I want to change their signatures and the renaming part is
there only to make the reviewing easier.

Bart
