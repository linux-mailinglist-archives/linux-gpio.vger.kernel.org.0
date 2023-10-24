Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E1F7D4B91
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Oct 2023 11:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbjJXJHw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Oct 2023 05:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbjJXJHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Oct 2023 05:07:41 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8149F139
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 02:07:31 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-457e5dec94dso1672246137.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2023 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698138450; x=1698743250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34FuHoELZVzziPusEVPH9DrMEM/8roxZNgMtq4vv1gU=;
        b=1mBZJFZWWXQwu6nJqNCzpet4tct6wDK6mN8By8d8LczFyZSusNrAgyYXoTC3QbbufK
         t74FGQ5I80og/M1/kfGR+Ya1Ygl/SCl6F532XuDe42p3RDxjMaVuDL87u1lBKbScyB7e
         1sCNGLBQU1cg02VBMJyNddZdhf1E5Gho9Kr7MXjDXmnJNCibE98j2TraJcrBNFsZJSru
         erMOaijDXaPxJOYsJG/HopYvNdYOkvnxCNqv4zRuifdTnN6OeJ/v8SJS61JMK5cD3jAN
         z2nMlr2vie+puxk7K4x1FsGxb7YGcbv4b5CQh+8B2ohheEN0oAruNbSD9HtfJnnxxGyS
         HThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138450; x=1698743250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34FuHoELZVzziPusEVPH9DrMEM/8roxZNgMtq4vv1gU=;
        b=FtPdmINVa4VS4yRuDfUdhXPbzxV8LL/hzJSQqeipaILF+5JuIwo15W+Xe8BlZ1sP5w
         UGvUhCA3YlUb60V+ElUjw7ktwpFBmikluL++t7UqE9iTBgw3Pz1yX+yl+a88dXTLIi27
         ozOw5IlURbMkhdDt9y3qmKMbU5TZLjdC4jBfYzaWDSk4i+bJ6KgnqEaV4MZCYDg3ZCTu
         3THT0vfcUN8vtISdzlQb+ICn8xaU8i4kIQCkdnZWLM45JNt5RZgNrGTnUqxz6asKBYzL
         0EwGjZvkJslD4iUDaPo5UNvDy7qfUEzktL+wck3n8iKPBzqSNxEXchClvlvitRs+DzrB
         0nOg==
X-Gm-Message-State: AOJu0YxyA2Of2gRu9ClGLdfsN2+YBXn/OYV7zlp81j0Pv3xiS0zRVfjB
        OGy5CwFUprUxw1ZtDNsCG1ndjecAm18SaToTkIaUSw==
X-Google-Smtp-Source: AGHT+IEOo8X/DS5oICGPg3687GHcXctk6YAYGrNwzsLGrOVg3OKV0WokfEoHmhG5qMkqwys8Ubs05toF/4Oj0L/XnZc=
X-Received: by 2002:a67:ef51:0:b0:457:dbe3:ef45 with SMTP id
 k17-20020a67ef51000000b00457dbe3ef45mr11295235vsr.19.1698138449954; Tue, 24
 Oct 2023 02:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231017145549.179355-1-phil@gadgetoid.com> <20231017145549.179355-2-phil@gadgetoid.com>
In-Reply-To: <20231017145549.179355-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Oct 2023 11:07:19 +0200
Message-ID: <CAMRc=MfXaMZ+oftwAwjx4C=GA5uHbgi9LK-9fPDaW0RfZSFtgQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] bindings: python: move long_description
 into README.md
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
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

On Tue, Oct 17, 2023 at 4:56=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Move the long_description into README.md and include some basic
> information about libgpiod, and some simple Python example code.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |   1 +
>  bindings/python/README.md   | 104 ++++++++++++++++++++++++++++++++++++
>  bindings/python/setup.py    |   4 +-
>  3 files changed, 107 insertions(+), 2 deletions(-)
>  create mode 100644 bindings/python/README.md
>

Applied, thanks!

Bart
