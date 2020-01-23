Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BD7146C73
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 16:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbgAWPRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 10:17:14 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40623 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgAWPRO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 10:17:14 -0500
Received: by mail-lj1-f194.google.com with SMTP id n18so3839567ljo.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 07:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q43C7iurJc3yk39+70fKYQz9kS6LAXkSuTfVsqcdm/I=;
        b=j/47bdWfaZKkml1jGYlhjwdiXuVo1Uuc5LbVK+3msMbGhcuGJwwOCSUStnG0BavkZy
         YzFA5xQ2sNFRXvhmCm4szeH76prsER8RuZHyG3vimE4ynW7bjJWvYtd+ukCD8Bb+prJR
         Z5IScBS8TPA/C1hVq/mbI6fS38DmDXfIrDzP5Q1ax29u9aWpZ9y5l/IVwBLuHRGGTq29
         mPuF4q7c/KFT7QRqNulbzCuglpdrNFRlWLGzJPlvz9rg9n/CG7mpdgR2Rl9Uu6by30Iw
         6vnoqc1M7ddUWJ8ng/IExt6nOkqoCt8b8atTpI94UFUaeA/6xqo4LuAU4XNJeauxrIG0
         t0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q43C7iurJc3yk39+70fKYQz9kS6LAXkSuTfVsqcdm/I=;
        b=jhTc7u34bPWzpBB9WPKO7zwi+3rJan7NZ3KTFBl3VmQpn72s4/idyQyIAA1wnAeMu7
         4AeZEuoXKxYdCKVZZ7RBSETElfN8j6xqU9b+hYbegrJUgroDXcb5JpJWzjW794MwPm2Y
         lWUoQdKWZf6dWUmJxCfrriTB1vmGps3Ihg5zP5sC5Wmubn7DCXLR+zT2TyJjKeyPurtK
         bOvitvKf/zZIfNyxrstHw3cch8fS/BXdR35DLY4g4zGxZDx6QJV+e0+8i/lELayr2Vo7
         n1VwqlsdmarrDm55Db78h1o98t8W6S9SVwCf/Mb6tTxsxRh4n5MGLjOBKrWgOrOZKrGh
         ygRQ==
X-Gm-Message-State: APjAAAWEr2m1sqbUA7tdj5Fw6+6N0kZUIiyXB8pw8Q3+rppaucK4rkPa
        EiB+gBgs8FZakyM3Aes2ZzTsjmHodSKPbpM0Gfovqw==
X-Google-Smtp-Source: APXvYqysttcyD53QUOz/qpIy5Qn1YoJFV7kW/KxVf8lxvC61gCRIrRE3ZhYEpo4lpAKs2kBKevYph3lXJWvexgPIYxk=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr23223537ljg.199.1579792632468;
 Thu, 23 Jan 2020 07:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20200118105101.68580-1-sachinagarwal@sachins-MacBook-2.local>
In-Reply-To: <20200118105101.68580-1-sachinagarwal@sachins-MacBook-2.local>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:17:01 +0100
Message-ID: <CACRpkdbJeNqF7dJz2B+uRysRF0AppHKk32hpzkGMC=f3fHb6Ng@mail.gmail.com>
Subject: Re: [PATCH 3/4] GPIO: aspeed: fixed a typo
To:     sachin agarwal <asachin591@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 18, 2020 at 11:51 AM sachin agarwal <asachin591@gmail.com> wrote:

> From: Sachin agarwal <asachin591@gmail.com>
>
> we had written "handhsaking" rather than "handshaking".
>
> Signed-off-by: Sachin Agarwal <asachin591@gmail.com>

I squashed the different patches together into one and applied.

Yours,
Linus Walleij
