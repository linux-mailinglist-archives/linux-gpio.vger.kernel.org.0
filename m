Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D6B586BF8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 15:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiHAN3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 09:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiHAN3A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 09:29:00 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9533C179
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 06:29:00 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id p81so8357467iod.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2n+JBJfDcNxOwVENolB4V6CyD7GjECJsdpXfB7cZB0=;
        b=QtfPpMQ8Ndg/mgE91taoSJ/nECCanMnw0kpYohl9f7sPDUyIoeudQt1T7onsfwS85h
         4n9N2ORD3f9k9jiyCWbuam0M4QLV7KBacpZs7VOXsbI3wLccBNk/quYXrj1Z1e4IJtUB
         CEwRkeY+95TXi/1RxP9lUzX/dC/qFTq+IsdaMHpzK+IhxZH3BSGH/yg7z7QY615f9ZXX
         uBnJCCo1fCRxTq2MABHA+L+SNFkBL0zCbhPPF5TSz+3JOs2m1BwXTG/OmMQHqUl0Ox8G
         RGGcjcLjgp2Y7SmlX99aDpu7z+Z4jExsF1cphY7z4fpzUzK/BOXL+o6W9F8MsZKxYbL0
         sJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2n+JBJfDcNxOwVENolB4V6CyD7GjECJsdpXfB7cZB0=;
        b=pQ7XKM0BdIidLX0WI+88/NfbCS5sKMNsPKyTsL+bLhW4/VlMdpr6agWUrDJzNUUApU
         mkZBpqe8yF7b53hGGkEJYQTH/DlEhKo7ZrT8e5sKQB64qGTge1rZ5jicXN0L7d5UQxyq
         /sDv7zUtsL0mPEF1R7xq29QCczgZ4z0t+ZWbitpgb/Jsq/KqTXEY7VG02keolteZW2c8
         iu78GzWBSfW+C58i8w2PkCSD05Lhx2dZ6DsK47YdWljzlXSucJ+hKbcUsqxFIDwj4vPz
         mmOceYozqjC21q1fbvlqLEF6EMx1xnHqR41hCUdhOrjZtFz+n68DARG9veGpbCZKIitf
         tIKA==
X-Gm-Message-State: AJIora+SoOTXISnLZP1HUX2olzLickBElMGElMT1Una5gTy8Wbhv1lW4
        77QKXvlQzRZ0H8POuorI77M0GDyeu4aTCXGNmUq7C2cv
X-Google-Smtp-Source: AGRyM1sL/Gu5QxDOeT2hOBxqF3cdIPv+AvHdivfLl0ST4+8tSh/j9HRBMvVVtHqG7chmYUr0mLzBJtUM6LaXE8DPOxk=
X-Received: by 2002:a05:6638:4514:b0:33f:45cb:2f35 with SMTP id
 bs20-20020a056638451400b0033f45cb2f35mr6553983jab.256.1659360539716; Mon, 01
 Aug 2022 06:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol> <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol> <20220801120506.46emxdk7qk2g2gmf@vireshk-i7> <20220801132017.GA46663@sol>
In-Reply-To: <20220801132017.GA46663@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 1 Aug 2022 15:28:48 +0200
Message-ID: <CANiq72=fhoMp9FyyJSMWzm9VA8xfw3G9SSgfcZX+24KQp7qXSg@mail.gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 1, 2022 at 3:20 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> True, "_" is shorter than "::".  Can't argue with that ;-).

Not sure about that in non-monospace fonts -- just kidding ;P

(Though I know an experienced C programmer that uses non-monospaced
fonts for code)

> I find the structured approach both clearer and more idiomatic in Rust,
> so that gets my vote.

Yeah, we are also following that approach in the kernel.

Cheers,
Miguel
