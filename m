Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D32190D9B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 13:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbgCXMeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 08:34:13 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36026 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCXMeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 08:34:13 -0400
Received: by mail-il1-f193.google.com with SMTP id p13so471540ilp.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 05:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k6HPwKHQVC0o1SEg/DRRk3CSn6nogNpaqcd4S92vfJo=;
        b=Z0tw3RelkUQ0eC86wi5h4iPlxvFBdW6zifNXcRpxp3f8EvMdX8pljataZAnwU4XEBz
         kMgxL/V9YBQvbV7PPMqlhX6QwC/PMcBcNW6/8xgHkvFxUBZ6qLWzJ/j1KXvBA/JTTw7x
         v2bhkvdV6e82rnXSdf9CBv4q8Z6M3GlsoNsPl3u0rEYBe2bh1NAfs96rwqW6o3f1f3GR
         WVQ0crX3ZTXWd0/iFKp7+Y0KA2WK3A4HBYZkw6n/M9N5aOGvorLQacE+iKhZRKNWtS+O
         098vzH8JipC2SvdfxG1Eq3HJw1hhZPfR8dW/uipUMUwxZgrrYPk4BEFUCAGT91Lai6DB
         AY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k6HPwKHQVC0o1SEg/DRRk3CSn6nogNpaqcd4S92vfJo=;
        b=Kac8KPxxI5vou+3Hd5GqHGqLB72+J+cEjspT6X3W5CyFHkqYnT4Ddn6gDpbUFsr+54
         Hgq590Ugo68NoIzszqEQX5g8dhctRbyGr85mexMcqSCh62LxAKzwGjnVaOuZ4xhs4L+7
         O2+akXXvaCqQvh8KM3G0Bk9rKX35yIdK5fqnq2IzpCQPvUIyxduwXOwKOjupZqOPuFMd
         skCL53CNuaVrHdEf1TZTe0nmdQkX1SxUVGpJOWWLitju9PXC2DMfQh3IJfXC84IdSbgN
         sXz1mr88rDiWDkyeL5qsBaC9D4VSXNUPzMnwQzBytRrOHIsaH6z+kBO8sasK9XWXDZh1
         Jafg==
X-Gm-Message-State: ANhLgQ1iSGp2fRo44P6IBdWg5ma/3ZhCjpfGAwlhut5yZAYFS+w4rQhP
        DkxQa2FFBEO5lPgOClN+nuth2kYJJW6yVTld7p/gDA==
X-Google-Smtp-Source: ADFU+vvetgGQXZI6poBnqMnAJmqqpyTAnmAV6OwIb6JyLYDx3eJ0AdrHRz2JUUgWhy8sqb4vUBtT1pddSQ2GwpHC9/w=
X-Received: by 2002:a92:48d6:: with SMTP id j83mr8774485ilg.287.1585053252560;
 Tue, 24 Mar 2020 05:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl> <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
In-Reply-To: <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Mar 2020 13:34:01 +0100
Message-ID: <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part 3
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 24 mar 2020 o 10:05 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Hi Bartosz,
>
> On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > this is the third and probably last batch of changes for v5.7 I picked =
up
> > into my tree. Details are in the signed tag. Please pull.
>
> Which rc is this based on? I got a bunch of unrelated changes, so
> I suppose I need to merge the right rc base to the devel branch
> first.
>
> Yours,
> Linus Walleij

Hi Linus,

this is rebased on top of your devel branch, so you should be able to
pull it alright.

Bart
