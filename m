Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A962A6ABA84
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjCFJ6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:58:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjCFJ6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:58:22 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DAB2D6C
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:58:19 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id bx14so6049322uab.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678096698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRpnKTH215Tktra2dAqtBTdRYqmrUvNtxnmB3KqVPb4=;
        b=8DvcYCoqlk4SM1NgdpcHCAWdD9VNX+dQ+Pv2VjwdE5BjDJKLi3KI5op/J7EwlHeaF3
         Oa1jFAVeaw6QOgWHI4eQt1KSe6kYeL6FfGCMSVoK8/JenAXWKj4nP96Iz4W3jyumSBZd
         uf1DC+32RJ9Xr6AlljXI6lJYT9CIeE86c0Sb6rG0y+Vp9CHlbqt1mUARddSbEkAnhbSJ
         2DGVU/KLzeKJ626lanxicMIrE+ltN7mhI92FRvEM1qPRdDioq/aZAbMQBP/uSnlQW4V3
         HL1BuP+g2m3eFCwC+gsz2z9+xdjjrR6vcyxj1G+ywbX5QFMt078ZL4VpGjWB5J/e5rqp
         QwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRpnKTH215Tktra2dAqtBTdRYqmrUvNtxnmB3KqVPb4=;
        b=MJgmNJZ1fni5p2Zh81CHxLU5JZDNU5aOWPLXuETkvaY93wUGKICVQ32CwIU3kGwkyq
         WmCArNCnvhmEfLiU6bHO4TJhPBN0XTALBrDB3ht+wpnUP3cFi/0sybo1uuEhK9SoeJrU
         y11yAiXURGD7QaCphjDBX549cwEkwoLMXp9T6tPm953hURbDOAgbLbf3JDvpH7xYinDl
         u741KlhtRhwDQZ1nGn9ZxGCwUeAeo605h6xRgr+5rEIwvflNzP9s8ixyF1MuBCgU8V9R
         8t2C9FMQw7qI7vi3ZiTrc+/KAjhCxrq8LXUslS0NUnyEQhPFvTr5Ci6AAQjgG9vIhLUs
         czxQ==
X-Gm-Message-State: AO0yUKXZLCXxItSJS80qh/oH/nXLZZ+90+0ParIhVooVPzvxa2PiVScf
        Mf1rwefiernZ4xcrdrZnxFSSku5yJsru7zxwkpzLFw==
X-Google-Smtp-Source: AK7set+0zWHQAAjF2kAMkOwQrSPD0Vb9EVA5afzS9lp2Pf3FaA54xLXOg45Z286kIc19kLc4ijTSX17RNn/g1A4Dv+U=
X-Received: by 2002:a1f:38cc:0:b0:406:55ae:5d93 with SMTP id
 f195-20020a1f38cc000000b0040655ae5d93mr6374682vka.1.1678096698699; Mon, 06
 Mar 2023 01:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20230217141059.392471-1-nick.alcock@oracle.com> <20230217141059.392471-21-nick.alcock@oracle.com>
In-Reply-To: <20230217141059.392471-21-nick.alcock@oracle.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:58:07 +0100
Message-ID: <CAMRc=MfEVgF+6NyAB=3g3_mFvfppHg45LNnvopO_SwqdeNFgkA@mail.gmail.com>
Subject: Re: [PATCH 20/24] kbuild, gpio: remove MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>
Cc:     mcgrof@kernel.org, linux-modules@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 17, 2023 at 3:12=E2=80=AFPM Nick Alcock <nick.alcock@oracle.com=
> wrote:
>
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>

Applied, thanks!

Bart
