Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E53FB5F327
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfGDHAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:00:30 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46753 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGDHAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:00:30 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so3448140lfh.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nFhFhaoBN7wHqqVu4wu7F+jb79uqvxMnu2JV5e2t1u8=;
        b=UMNElB82eIqxhJ5JedFraCufuiuVKtZYaQlCegRi2TjvR+KJNr/g+f8JkxSoF1nja4
         TiJzkdRBAXX2p08TfnVilM5MD9Gfy8xXwP9+88cmb+ZsLxOIcq9K+5OJh9AXe0wQEsAT
         r8hx9ciWk9LZr1wYgI/uShZ9RDiEXswK5bBvpZQSBN6QabLfYY7jG4EoaZwvM8mHwIYb
         0PiVv8r7cNKA/o5stbrmIAtSBO75wZZz9H8lS1t2NZ48VtY3RSyJ1/gWyiWa+qifchji
         G1qeoOCa6TLsaCXaPg/HmZAF0tttOJN161Efiwmiq3R/vXSTGoRX44wTsCDIfLUFEy9u
         i+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nFhFhaoBN7wHqqVu4wu7F+jb79uqvxMnu2JV5e2t1u8=;
        b=uQ+MoQtTp9hg7lJFsn61t0hHOQRj0zJRuwSdvpXhy3YrSCXtzqjJzuSqrfcF5axR1L
         Mc4hP9BNaeAuy2etV2C1L3vbB1RizhNmolcAAwWcOIW468fQPqzGnI5sZzrMcCQPuEE1
         TqJzRhjO3AA1pl5VvfeAILVcQ0p81GOT+1cQJ726nX85TL+5c9Tqp8X2az7xdhJvto+I
         pJDIAwDFfKyfqm+9A/Cbp62opmTY/IzK8ZSryML6oaF2UmJ5O8XDsWfGmhfVypM3w4vd
         /A0KkNToMy6qXQBLvJr8An2oPCuhbGuUcGvLyM4UB/8pEodOuS5sJyD/n3dleZXta9RT
         SJ9g==
X-Gm-Message-State: APjAAAUCIo12JChzg684zBNVnJ/Utm5PNKNjj/L57cHCoEbR3JTBf5tz
        E3Qv4Aa0pTncnDaypVicHfDbyCCBw+8AuhaIXJPSzg==
X-Google-Smtp-Source: APXvYqxECK5pts7QUjN8OM+gDIMSkQ+1U5Taq40OHzXtr54kM6ak66pDTcZS3KSfoXOJYJt9pa3rzeEE9OZm+UyocGg=
X-Received: by 2002:a19:e006:: with SMTP id x6mr215391lfg.165.1562223628546;
 Thu, 04 Jul 2019 00:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190701172517.31641-1-linus.walleij@linaro.org>
In-Reply-To: <20190701172517.31641-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:00:17 +0200
Message-ID: <CACRpkdaUTvMJ3tbuA7moyLjn_+6QbfJwm3UhLxA1-nh+A5y_KA@mail.gmail.com>
Subject: Re: [PATCH] Revert "spi: gpio: Don't request CS GPIO in DT use-case"
To:     Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark,

the proper fix is now upstream in Torvald's tree so you can drop/revert
this patch.

Yours,
Linus Walleij
